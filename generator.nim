# Written by Leonardo Mariscal <leo@ldmd.mx>, 2019
# Modified by Clyybber
import strutils, httpClient, os, xmlparser, xmltree, streams, strformat, tables, algorithm, bitops

# ## WARNING: This is a generated file. Do not edit
# ## Any edits will be overwritten by the generator.
# var vkGetProc: proc(procName: cstring): pointer {.cdecl.}
# when not defined(vkCustomLoader):
#   import dynlib
#   when defined(windows):
#     const vkDLL = "vulkan-1.dll"
#   elif defined(macosx):
#     const vkDLL = "libMoltenVK.dylib"
#   else:
#     const vkDLL = "libvulkan.so.1"
#   let vkHandleDLL = loadLib(vkDLL)
#   if isNil(vkHandleDLL):
#     quit("could not load: " & vkDLL)
#   let vkGetProcAddress = cast[proc(s: cstring): pointer {.cdecl.}](symAddr(vkHandleDLL, "vkGetInstanceProcAddr"))
#   if vkGetProcAddress == nil:
#     quit("failed to load `vkGetInstanceProcAddr` from " & vkDLL)
#   vkGetProc = proc(procName: cstring): pointer {.cdecl.} =
#     when defined(windows):
#       result = vkGetProcAddress(procName)
#       if result != nil:
#         return
#     result = symAddr(vkHandleDLL, procName)
#     if result == nil:
#       raiseInvalidLibrary(procName)
# proc setVKGetProc*(getProc: proc(procName: cstring): pointer {.cdecl.}) =
#   vkGetProc = getProc
const srcHeader* = """
when defined(vkDynlib):
  const vulkandll = when defined(windows):
                      "vulkan-1.dll"
                    elif defined(macosx):
                      "libMoltenVK.dylib"
                    else:
                      "libvulkan.so"
  {.pragma: load, dynlib: vulkandll.}
else:
  {.pragma: load.} # User will link themselves

type
  VkHandle* = int64
  VkNonDispatchableHandle* = int64
"""

# XXX: For manual dynamic mode
# proc vkInit*(load1_0: bool = true, load1_1: bool = true): bool =
#   if load1_0:
#     vkLoad1_0()
#   when not defined(macosx):
#     if load1_1:
#       vkLoad1_1()
#   return true
const vkInit* = """
import macros

macro vk*(name, instance: untyped): untyped =
  nnkStmtList.newTree(
    nnkLetSection.newTree(
      nnkIdentDefs.newTree(
        ident "v" & name.strVal,
        ident "PFN" & name.strVal,
        nnkCast.newTree(
          ident "PFN" & name.strVal,
          nnkCall.newTree(
            ident "vkGetInstanceProcAddr",
            instance,
            newLit(name.strVal)
  ) ) ) ) )
"""

let keywords* = ["addr", "and", "as", "asm", "bind", "block", "break", "case", "cast", "concept",
                 "const", "continue", "converter", "defer", "discard", "distinct", "div", "do",
                 "elif", "else", "end", "enum", "except", "export", "finally", "for", "from", "func",
                 "if", "import", "in", "include", "interface", "is", "isnot", "iterator", "let",
                 "macro", "method", "mixin", "mod", "nil", "not", "notin", "object", "of", "or",
                 "out", "proc", "ptr", "raise", "ref", "return", "shl", "shr", "static", "template",
                 "try", "tuple", "type", "using", "var", "when", "while", "xor", "yield"]

const toEnums = false
const dynamicMode = false

type
  VkProc = object
    name: string
    rVal: string
    args: seq[VkArg]
  VkArg = object
    name: string
    argType: string
  VkStruct = object
    name: string
    members: seq[VkArg]

var vkProcs: seq[VkProc]
var vkStructs: seq[VkStruct]
var vkStructureTypes: seq[string]

proc snakeToCamel(s: string): string =
  result = s
  var lastWasUnderscore = true
  for i in (if result.startsWith("VK"): 2 elif result.startsWith("PFN"): 3 else: 0)..<result.len:
    result[i] = if lastWasUnderscore: result[i].toUpperAscii
                else: result[i].toLowerAscii
    lastWasUnderscore = result[i] == '_'
  result = result.replace("_", "")

proc constantCasing(s: string): string =
  result = s.snakeToCamel()
  if result.startsWith("VK"):
    result[1] = result[1].toLowerAscii()
  if result.len > 0:
    result[0] = result[0].toLowerAscii()

proc translateTypeAndDecl(s: string): string =
  s.replace("_screen_context", "screen_context")
   .replace("_screen_window", "screen_window")

proc translateType(s: string): string =
  result = s
    .replace("int64_t", "int64")
    .replace("int32_t", "int32")
    .replace("int16_t", "int16")
    .replace("int8_t", "int8")
    .replace("size_t", "uint") # uint matches pointer size just like size_t
    .replace("float", "float32")
    .replace("double", "float64")
    .replace("VK_DEFINE_HANDLE", "VkHandle")
    .replace("VK_DEFINE_NON_DISPATCHABLE_HANDLE", "VkNonDispatchableHandle")
    .replace("const ", "")
    .replace(" const", "")
    .replace("unsigned ", "u")
    .replace("signed ", "")
    .replace("struct ", "")
    .translateTypeAndDecl()

  let levels = result.count('*')
  result = result.replace("*", "")
  for i in 0..<levels:
    result = "ptr " & result

  result = result.replace("ptr void", "pointer")
                 .replace("ptr ptr char", "cstringArray")
                 .replace("ptr char", "cstring")

proc stropIfNeeded(s: string): string =
  if s in keywords: "`{s}`".fmt else: s

proc genTypes(node: XmlNode, output: var string) =
  echo "Generating Types..."
  output.add "\n# Types\n"

  var inType = false

  for types in node.findAll("types"):
    for t in types.items:
      if t.attr("category") == "include": continue
      if t.attr("requires") == "vk_platform": continue # Basic platform types; Nim already has these
      if t.tag != "type" or t.attr("name") == "int": continue

      if t.attr("requires").contains(".h"):
        # Platform sepcific stuff, XXX: skip?
        let name = t.attr("name").translateTypeAndDecl()
        if not inType:
          output.add "\ntype\n"
          inType = true

        output.add "  {name}* = ptr object\n".fmt

      case t.attr("category")
      of "define": # Define category
        if t.child("name") == nil: echo "TODO: what dis"; continue
        let name = t.child("name").innerText
        output.add '\n' & (case name
          of "VK_MAKE_VERSION":
            "template vkMakeVersion*(major, minor, patch: untyped): untyped =\n" &
            "  ((((uint32)(major)) shl 22) or (((uint32)(minor)) shl 12) or ((uint32)(patch)))"
          of "VK_VERSION_MAJOR":
            "template vkVersionMajor*(version: untyped): untyped =\n" &
            "  ((uint32)(version) shr 22)"
          of "VK_VERSION_MINOR":
            "template vkVersionMinor*(version: untyped): untyped =\n" &
            "  (((uint32)(version) shr 12) and 0x000003FF)"
          of "VK_VERSION_PATCH":
            "template vkVersionPatch*(version: untyped): untyped =\n" &
            "  ((uint32)(version) and 0x00000FFF)"
          of "VK_API_VERSION_1_0":
            "const vkApiVersion1_0* = vkMakeVersion(1, 0, 0)"
          of "VK_API_VERSION_1_1":
            "const vkApiVersion1_1* = vkMakeVersion(1, 1, 0)"
          of "VK_API_VERSION_1_2":
            "const vkApiVersion1_2* = vkMakeVersion(1, 2, 0)"
          of "VK_NULL_HANDLE":
            "const vkNullHandle* = 0"
          else:
            echo "category:define not found {name}".fmt; "") & '\n'
        inType = false

      of "basetype": # Basetype category
        if not inType: output.add "\ntype\n"; inType = true
        let name = t.child("name").innerText
        let bType = translateType(if t.child("type") != nil: t.child("type").innerText else: "pointer")

        output.add "  {name}* = {bType}\n".fmt

      of "bitmask", "handle": # Bitmask/Handle categories
        if not inType: output.add "\ntype\n"; inType = true
        let name = if t.child("name") != nil: t.child("name").innerText
                   else: t.attr("name")

        let alias = t.child("type") == nil
        let bType = translateType(if alias: t.attr("alias") else: t.child("type").innerText)

        # if not alias: bType = "distinct " & bType

        output.add "  {name}* = {bType}\n".fmt

      of "enum": # Enum category
        let name = t.attr("name")
        let alias = t.attr("alias")
        if alias != "":
          # We are only adding type aliases here, the real enums are implemented below
          if not inType: output.add "\ntype\n"; inType = true
          output.add "  {name}* = {alias}\n".fmt

      of "funcpointer": # Funcpointer category
        if not inType: output.add "\ntype\n"; inType = true
        let name = t.child("name").innerText
        output.add "  " & (case name
          of "PFN_vkInternalAllocationNotification":
            "PFN_vkInternalAllocationNotification* = proc(pUserData: pointer; size: csize_t; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}\n"
          of "PFN_vkInternalFreeNotification":
            "PFN_vkInternalFreeNotification* = proc(pUserData: pointer; size: csize_t; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}\n"
          of "PFN_vkReallocationFunction":
            "PFN_vkReallocationFunction* = proc(pUserData: pointer; pOriginal: pointer; size: csize_t; alignment: csize_t; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}\n"
          of "PFN_vkAllocationFunction":
            "PFN_vkAllocationFunction* = proc(pUserData: pointer; size: csize_t; alignment: csize_t; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}\n"
          of "PFN_vkFreeFunction":
            "PFN_vkFreeFunction* = proc(pUserData: pointer; pMemory: pointer) {.cdecl.}\n"
          of "PFN_vkVoidFunction":
            "PFN_vkVoidFunction* = proc() {.cdecl.}\n"
          of "PFN_vkDebugReportCallbackEXT":
            "PFN_vkDebugReportCallbackEXT* = proc(flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; cbObject: uint64; location: csize_t; messageCode:  int32; pLayerPrefix: cstring; pMessage: cstring; pUserData: pointer): VkBool32 {.cdecl.}\n"
          of "PFN_vkDebugUtilsMessengerCallbackEXT":
            "PFN_vkDebugUtilsMessengerCallbackEXT* = proc(messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT, userData: pointer): VkBool32 {.cdecl.}\n"
          of "PFN_vkDeviceMemoryReportCallbackEXT":
            "PFN_vkDeviceMemoryReportCallbackEXT* = proc(pCallbackData: ptr VkDeviceMemoryReportCallbackDataEXT; pUserData: pointer) {.cdecl.}\n"
          else:
            echo "category:funcpointer not found {name}".fmt; "")

      of "struct", "union": # Struct/union categories
        if not inType: output.add "\ntype\n"; inType = true
        let name = t.attr("name")

        var vkStruct = VkStruct(name: name)

        let isUnion = t.attr("category") == "union"

        output.add "\n  {name}* ".fmt & (if isUnion: "{.union.}" else: "") & " = object\n"

        for member in t.findAll("member"):
          var memberName = member.child("name").innerText
          memberName = memberName.stropIfNeeded
          var memberType = member.child("type").innerText.translateType()

          var isArray = false
          var arraySize: string
          if member.innerText.contains('['):
            arraySize = member.innerText[member.innerText.find('[') + 1..<member.innerText.find(']')]
            if arraySize == "_DYNAMIC":
              memberType = #["ptr " &]# memberType # ZZZ: ptr is already given
              isArray = false
            elif arraySize != "":
              isArray = true

          arraySize = arraySize.constantCasing

          var depth = member.innerText.count('*')
          if memberType == "pointer": depth.dec
          for i in 0..<depth:
            memberType = "ptr " & memberType

          memberType = memberType.replace("ptr void", "pointer")
                                 .replace("ptr ptr char", "cstringArray")
                                 .replace("ptr char", "cstring")

          vkStruct.members.add VkArg(
            name: memberName,
            argType: if not isArray: memberType
                     else: "array[{arraySize}, {memberType}]".fmt
          )

          output.add "    " & (if not isArray:
                                 "{memberName}*: {memberType}\n".fmt
                               else:
                                 "{memberName}*: array[{arraySize}, {memberType}]\n".fmt)

        if not isUnion:
          vkStructs.add vkStruct

proc genEnums(node: XmlNode, output: var string): string = # Returns epilogue to place after types
  echo "Generating and Adding Enums"
  output.add "# Enums\n"
  var inType = false
  var enumTypes = node.findAll("enums")
  for enums in enumTypes:
    let name = enums.attr("name")

    if name == "API Constants":
      inType = false
      output.add "const\n"
      for e in enums.items:
        var enumName = e.attr("name")
        var enumValue = e.attr("value")
        if enumValue != "":
          enumValue = enumValue.replace("(~0U)", "(not 0'u32)")
                               .replace("(~0U-1)", "(not 0'u32) - 1")
                               .replace("(~0U-2)", "(not 0'u32) - 2")
                               .replace("(~0ULL)", "(not 0'u64)")
        else:
          if e.attr("alias") == "": continue
          enumValue = e.attr("alias")

        enumValue = enumValue.constantCasing
        enumName = enumName.constantCasing
        output.add "  {enumName}* = {enumValue}\n".fmt

    else:
      var elements: OrderedTableRef[int, string] = newOrderedTable[int, string]()
      var dupes: OrderedTableRef[int, string] = newOrderedTable[int, string]()
      for e in enums:
        if e.kind != xnElement or e.tag != "enum": continue

        var enumName = e.attr("name")

        enumName = enumName.constantCasing
        var enumValueStr = e.attr("value")
        if enumValueStr == "":
          if e.attr("bitpos") == "":
            continue
          let bitpos = e.attr("bitpos").parseInt()
          var num = 0
          num.setBit(bitpos)
          enumValueStr = $num
        enumValueStr = enumValueStr.translateType()

        let enumValue = if enumValueStr.contains('x'):
                          fromHex[int](enumValueStr)
                        else:
                          enumValueStr.parseInt()

        if elements.hasKey(enumValue):
          echo "dupe"
          dupes[enumValue] = enumName
        else:
          elements[enumValue] = enumName

      template loopBody(inExtension: bool) =
          const extBase = 1000000000
          const extBlockSize = 1000
          var strValue = ""
          var numValue = 0
          var enumName = e.attr("name").constantCasing
          if e.attr("extends") == name:
            if e.attr("value") != "":
                strValue = e.attr("value")
                numValue = parseInt(strValue) # XXX: Check base, actually for all in this loop
                # If there's a non-integer, numeric "type" attribute (e.g. 'u' or 'ull'), append it to the string value.
                # t = enuminfo.e.attr("type")
                # if t is not None and t != "" and t != "i" and t != "s":
                #     strValue += enuminfo.type
            elif e.attr("bitpos") != "":
                let bitpos = parseInt(e.attr("bitpos"))
                numValue = 1 shl bitpos
                strValue = $numValue # XXX: Print as hex or binary
                if bitpos >= 32: strValue.add "'u64"
            elif e.attr("offset") != "": # Obtain values in the mapping from the attributes
                let offset = parseInt(e.attr("offset"))
                let extnumber = when not inExtension:
                                  if e.attr("extnumber") == "": continue # Otherwise we are actually in an extension
                                  parseInt(e.attr("extnumber"))
                                else: parseInt(ext.attr("number"))
                # Now determine the actual enumerant value, as defined
                # in the "Layers and Extensions" appendix of the spec.
                numValue = extBase + (extnumber - 1) * extBlockSize + offset
                if e.attr("dir") == "-": numValue = -numvalue
                strValue = $numValue
                # More logic needed!
            elif e.attr("alias") != "":
                # TODO: generate aliases too
                discard #strValue = e.attr("alias")
            else: echo "fuck"

            if strValue != "":
              # if elements.hasKey(numValue):
              #   dupes[numValue] = enumName
              # else:
              elements[numValue] = enumName

      for e in node.findAll("enum"):
        loopBody(false)
      for ext in node.findAll("extension"):
        for e in ext.findAll("enum"):
          loopBody(true)

      when toEnums:
        if not inType:
          output.add "\ntype\n"
        inType = true
      else:
        if enums.attr("bitwidth") != "":
          output.add "type {name}* = distinct uint{enums.attr(\"bitwidth\")}\n".fmt
          output.add dedent """
            proc `==`*(x, y: {name}): bool {{.borrow.}}
            proc `-`*(x, y: {name}): {name} {{.borrow.}}
            proc `+`*(x, y: {name}): {name} {{.borrow.}}
            proc `+`*(x: {name}, y: int): {name} {{.used.}} = x + {name}(y)
          """.fmt
        else:
          output.add "type {name}* = distinct cint\n".fmt
          output.add dedent """
            proc `==`*(x, y: {name}): bool {{.borrow.}}
            proc `-`*(x: {name}): {name} {{.borrow.}}
            proc `-`*(x, y: {name}): {name} {{.borrow.}}
            proc `+`*(x, y: {name}): {name} {{.borrow.}}
            proc `+`*(x: {name}, y: int): {name} {{.used.}} = x + {name}(y)
          """.fmt

        if "FlagBits" in name:
          let flagName = name.replace("Bits", "s")
          result.add dedent """
            converter to{flagName}*(x: {name}): {flagName} = {flagName}(x)
          """.fmt

        if elements.len > 0:
          output.add "\nconst\n"
          inType = true

      if elements.len > 0:
        block dedup:
          var alreadyEncountered: Table[string, int]
          var dupes: seq[int]
          for k, v in (var copy = elements; copy):
            if alreadyEncountered.hasKey(v):
              discard #elements.del alreadyEncountered[v] # This modifies elements and crashes, even though we are iterating over a copy??
              dupes.add alreadyEncountered[v]
            alreadyEncountered[v] = k
          for i in dupes:
            elements.del i

        when toEnums:
          output.add "  {name}* {{.size: int32.sizeof.}} = enum\n".fmt
        elements.sort(system.cmp)
        for k, v in elements.pairs:
          var v = v#.constantCasing
          if name == "VkStructureType":
            vkStructureTypes.add v
          output.add when toEnums:
                       "    {v} = {k}\n".fmt
                     else:
                       "  {v}* = {name} {k}\n".fmt

        if dupes.len > 0:
          for k, v in dupes:
            let v = v#.constantCasing
            output.add "const {v} = {k}\n".fmt
            echo k, v
          inType = false

  for ext in node.findAll("extension"):
    for e in ext.findAll("enum"):
      var strValue = ""
      var numValue = 0
      var enumName = e.attr("name")
      if e.attr("value") != "" and e.attr("extends") == "":
          strValue = e.attr("value")
          strValue = strValue.replace("%quot;","\"")
          #numValue = parseInt(strValue) # XXX: Check base, actually for all in this loop
          # If there's a non-integer, numeric "type" attribute (e.g. 'u' or
          # 'ull'), append it to the string value.
          # t = enuminfo.e.attr("type")
          # if t is not None and t != "" and t != "i" and t != "s":
          #     strValue += enuminfo.type
          if strValue != "0":
            output.add "\nconst {enumName.constantCasing}* = {strValue}\n".fmt
      elif e.attr("bitpos") != "":
          let bitpos = parseInt(e.attr("bitpos"))
          numValue = 1 shl bitpos
          strValue = $numValue # XXX: Print as hex or binary
          if bitpos >= 32: strValue.add "'u64" #ULL
      elif e.attr("offset") != "":
          discard # Extending extension enums were already treated earlier
      elif e.attr("alias") != "":
          strValue = e.attr("alias")
      else: echo "fuck"

proc genProcs(node: XmlNode, output: var string) =
  echo "Generating Procedures..."
  output.add "\n# Procs\n" &
             "type\n"
  for commands in node.findAll("commands"):
    for command in commands.findAll("command"):
      if command.child("proto") == nil: continue

      var vkProc = VkProc(name: command.child("proto").child("name").innerText,
                          rVal: command.child("proto").innerText)
      vkProc.rVal = vkProc.rVal[0..<vkProc.rval.len - vkProc.name.len]
      while vkProc.rVal.endsWith(" "):
        vkProc.rVal = vkProc.rVal[0..<vkProc.rVal.len - 1]
      vkProc.rVal = vkProc.rVal.translateType()

      if vkProc.name == "vkGetTransformFeedbacki_v": continue

      for param in command.findAll("param"):
        if param.child("name") == nil: continue

        var vkArg = VkArg(name: param.child("name").innerText,
                          argType: param.innerText)

        if vkArg.argType.contains('['):
          let openBracket = vkArg.argType.find('[')
          let arraySize = vkArg.argType[openBracket + 1..<vkArg.argType.find(']')].constantCasing
          var typeName = vkArg.argType[0..<openBracket].translateType()
          typeName = typeName[0..<typeName.len - vkArg.name.len]
          vkArg.argType = "array[{arraySize}, {typeName}]".fmt
        else:
          vkArg.argType = vkArg.argType[0..<vkArg.argType.len - vkArg.name.len]
          vkArg.argType = vkArg.argType.translateType()

        vkArg.name = vkArg.name.stropIfNeeded

        vkProc.args.add vkArg

      vkProcs.add vkProc
      var p = "  PFN{vkProc.name}* = proc(".fmt
      for arg in vkProc.args:
        if not p.endsWith('('): p.add ", "
        p.add "{arg.name}: {arg.argType}".fmt
      p.add "): {vkProc.rval} {{.cdecl.}}\n".fmt
      output.add p

proc genFeatures(node: XmlNode, output: var string) =
  echo "Generating and Adding Features..."
  for feature in node.findAll("feature"):
    let number = feature.attr("number").replace(".", "_")
    output.add "\n# Vulkan {number}\n".fmt
    when dynamicMode:
      output.add("proc vkLoad{number}*() =\n".fmt)

    for command in feature.findAll("command"):
      let name = command.attr("name")
      for vkProc in vkProcs:
        if name == vkProc.name:
          var p = when dynamicMode:
                    "  {name} = cast[proc(".fmt
                  else:
                    "proc {name}*(".fmt
          for arg in vkProc.args:
            if not p.endsWith('('): p.add ", "
            p.add "{arg.name}: {arg.argType}".fmt
          p.add when dynamicMode:
                  "): {vkProc.rVal} {{.cdecl.}}](vkGetProc(\"{vkProc.name}\"))\n".fmt
                else:
                  "): {vkProc.rVal} {{.importc, load.}}\n".fmt

          if p notin output:
            output.add p

proc genExtensions(node: XmlNode, output: var string) =
  echo "Generating and Adding Extensions..."
  for extensions in node.findAll("extensions"):
    for extension in extensions.findAll("extension"):

      var commands: seq[VkProc]
      for require in extension.findAll("require"):
        for command in require.findAll("command"):
          for vkProc in vkProcs:
            if vkProc.name == command.attr("name"):
              commands.add vkProc

      if commands.len == 0: continue

      let name = extension.attr("name")
      output.add "\n# Load {name}\n".fmt
      when dynamicMode:
        output.add("proc load{name}*() =\n".fmt)

      for vkProc in commands:
        var p = when dynamicMode:
                  "  {vkProc.name} = cast[proc(".fmt
                else:
                  "proc {vkProc.name}*(".fmt
        for arg in vkProc.args:
          if not p.endsWith('('): p.add ", "
          p.add "{arg.name}: {arg.argType}".fmt
        p.add when dynamicMode:
                "): {vkProc.rVal} {{.cdecl.}}](vkGetProc(\"{vkProc.name}\"))\n".fmt
              else:
                "): {vkProc.rVal} {{.importc, load.}}\n".fmt

        if p notin output:
          output.add p

proc genConstructors(node: XmlNode, output: var string) =
  echo "Generating and Adding Constructors..."
  output.add "\n# Constructors\n"
  for s in vkStructs:
    if s.members.len == 0:
      continue
    output.add "\nproc new{s.name}*(".fmt
    for m in s.members:
      if not output.endsWith('('):
        output.add ", "
      output.add "{m.name}: {m.argType}".fmt

      if m.name.contains("flags"):
        output.add " = 0.{m.argType}".fmt
      if m.name == "sType":
        for structType in vkStructureTypes:
          if structType.cmpIgnoreStyle("VkStructureType{s.name[2..<s.name.len]}".fmt) == 0:
            output.add " = VkStructureType{s.name[2..<s.name.len]}".fmt
      if m.argType == "pointer":
        output.add " = nil"

    output.add "): {s.name} =\n".fmt

    for m in s.members:
      output.add "  result.{m.name} = {m.name}\n".fmt

proc main() =
  # if not os.fileExists("vk.xml"):
  #   let client = newHttpClient()
  #   let glUrl = "https://raw.githubusercontent.com/KhronosGroup/Vulkan-Docs/master/xml/vk.xml"
  #   client.downloadFile(glUrl, "vk.xml")

  var output = srcHeader & "\n"

  let file = newFileStream("./Vulkan-Headers/registry/vk.xml", fmRead)
  let xml = file.parseXml()

  let epilogue = xml.genEnums(output)
  xml.genTypes(output)
  output.add epilogue
  #xml.genConstructors(output)
  xml.genProcs(output)
  xml.genFeatures(output)
  xml.genExtensions(output)

  #TODO: Do this less hacky
  output = output.replace("pAllocator: ptr VkAllocationCallbacks", "pAllocator: ptr VkAllocationCallbacks = nil")

  output.add "\n" & vkInit

  writeFile("./vulkanim/vulkan.nim", output)
  # writeFile("../../wyven/src/engine/graphics/vulkanim/vulkan.nim", output)

if isMainModule:
  main()

