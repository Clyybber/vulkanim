import strformat

mode = ScriptMode.Verbose
when defined(release):
  switch("opt", "speed")
  switch("app", "gui")
switch("hints", "off")

when defined(windows):
  const vkDLL = "vulkan-1.dll"
elif defined(macosx):
  const vkDLL = "libMoltenVK.dylib"
else:
  const vkDLL = "-lvulkan"

switch("passL", vkDLL)

const srcdir = "src"
const entry = "main.nim"
const ox = "bin"
const appName = "app"

proc log(ix: string) =
  echo "[config.nims] " & ix

proc compile(ix, stype: string) =
  exec fmt"glslc -fshader-stage={stype} --target-env=vulkan1.2 --target-spv=spv1.5 -O -I shaders shaders/{ix}.glsl -o {ox}/{ix}.spv"

task build, "Build Files":
  setCommand("cpp")
  switch("hints", "on")

task run, "Run debug project":
  log "Running Nimscript"
  # compile("vert", "vert")
  # compile("frag", "frag")
  selfExec fmt"build -o:{ox}/{appName} -r {srcdir}/{entry}"
  log "Finished"

task init, "Init project":
  if dirExists("src"): return
  exec "mkdir -p bin/{deb,rel} src"
  exec "touch src/main.nim"
