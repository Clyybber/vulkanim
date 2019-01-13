##
import macros
{.experimental: "codeReordering".}

macro vk*(name, instance: untyped): untyped =
  #let vvkCreateDebugUtilsMessengerEXT: PFNVkCreateDebugUtilsMessengerEXT = cast[PFNVkCreateDebugUtilsMessengerEXT](vkGetInstanceProcAddr(instance, "vkCreateDebugUtilsMessengerEXT"))
  nnkStmtList.newTree(
    nnkLetSection.newTree(
      nnkIdentDefs.newTree(
        newIdentNode("v" & name.strVal),
        newIdentNode("PFN" & name.strVal),
        nnkCast.newTree(
          newIdentNode("PFN" & name.strVal),
          nnkCall.newTree(
            newIdentNode("vkGetInstanceProcAddr"),
            newIdentNode(instance.strVal),
            newLit(name.strVal)
          )
        )
      )
    )
  )




macro genDistinctOps(identifiers: untyped): untyped =
  result =  nnkStmtList.newTree() #same as newNimNode()
  for identifier in identifiers:
    result.add(
      #Negative sign for distincts
      nnkProcDef.newTree(
        nnkPostfix.newTree(
          newIdentNode("*"),
          nnkAccQuoted.newTree(
            newIdentNode("-")
          )
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          newIdentNode(identifier.strVal),
          nnkIdentDefs.newTree(
            newIdentNode("x"),
            newIdentNode("y"),
            newIdentNode(identifier.strVal),
            newEmptyNode()
          )
        ),
        nnkPragma.newTree(
          newIdentNode("borrow")
        ),
        newEmptyNode(),
        newEmptyNode()
      ),
      #Subtract distincts
      nnkProcDef.newTree(
        nnkPostfix.newTree(
          newIdentNode("*"),
          nnkAccQuoted.newTree(
            newIdentNode("-")
          )
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          newIdentNode(identifier.strVal),
          nnkIdentDefs.newTree(
            newIdentNode("x"),
            newIdentNode(identifier.strVal),
            newEmptyNode()
          )
        ),
        nnkPragma.newTree(
          newIdentNode("borrow")
        ),
        newEmptyNode(),
        newEmptyNode()
      ),
      #Add distincts
      nnkProcDef.newTree(
        nnkPostfix.newTree(
          newIdentNode("*"),
          nnkAccQuoted.newTree(
            newIdentNode("+")
          )
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          newIdentNode(identifier.strVal),
          nnkIdentDefs.newTree(
            newIdentNode("x"),
            newIdentNode("y"),
            newIdentNode(identifier.strVal),
            newEmptyNode()
          )
        ),
        nnkPragma.newTree(
          newIdentNode("borrow")
        ),
        newEmptyNode(),
        newEmptyNode()
      ),
      #Check distincts for equality
      nnkProcDef.newTree(
        nnkPostfix.newTree(
          newIdentNode("*"),
          nnkAccQuoted.newTree(
            newIdentNode("==")
          )
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          newIdentNode("bool"),
          nnkIdentDefs.newTree(
            newIdentNode("x"),
            newIdentNode("y"),
            newIdentNode(identifier.strVal),
            newEmptyNode()
          )
        ),
        nnkPragma.newTree(
          newIdentNode("borrow")
        ),
        newEmptyNode(),
        newEmptyNode()
      ),
      #Add int literal to distinct
      nnkTemplateDef.newTree(
        nnkAccQuoted.newTree(
          newIdentNode("+")
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          newIdentNode(identifier.strVal),
          nnkIdentDefs.newTree(
            newIdentNode("x"),
            newIdentNode(identifier.strVal),
            newEmptyNode()
          ),
          nnkIdentDefs.newTree(
            newIdentNode("y"),
            newIdentNode("int"),
            newEmptyNode()
          )
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkStmtList.newTree(
          nnkInfix.newTree(
            newIdentNode("+"),
            newIdentNode("x"),
            nnkDotExpr.newTree(
              newIdentNode("y"),
              newIdentNode(identifier.strVal)
            )
          )
        )
      )
    )

type
  VkHandle = int64
  VkNonDispatchableHandle = int64

genDistinctOps:
  VkPipelineCacheHeaderVersion
  VkResult
  VkStructureType
  VkSystemAllocationScope
  VkInternalAllocationType
  VkFormat
  VkImageType
  VkImageTiling
  VkPhysicalDeviceType
  VkQueryType
  VkSharingMode
  VkImageLayout
  VkImageViewType
  VkComponentSwizzle
  VkVertexInputRate
  VkPrimitiveTopology
  VkPolygonMode
  VkFrontFace
  VkCompareOp
  VkStencilOp
  VkLogicOp
  VkBlendFactor
  VkBlendOp
  VkDynamicState
  VkFilter
  VkSamplerMipmapMode
  VkSamplerAddressMode
  VkBorderColor
  VkDescriptorType
  VkAttachmentLoadOp
  VkAttachmentStoreOp
  VkPipelineBindPoint
  VkCommandBufferLevel
  VkIndexType
  VkSubpassContents
  VkObjectType
  VkVendorId
  VkFormatFeatureFlagBits
  VkImageUsageFlagBits
  VkImageCreateFlagBits
  VkSampleCountFlagBits
  VkQueueFlagBits
  VkMemoryPropertyFlagBits
  VkMemoryHeapFlagBits
  VkDeviceQueueCreateFlagBits
  VkPipelineStageFlagBits
  VkImageAspectFlagBits
  VkSparseImageFormatFlagBits
  VkSparseMemoryBindFlagBits
  VkFenceCreateFlagBits
  VkQueryPipelineStatisticFlagBits
  VkQueryResultFlagBits
  VkBufferCreateFlagBits
  VkBufferUsageFlagBits
  VkPipelineCreateFlagBits
  VkShaderStageFlagBits
  VkCullModeFlagBits
  VkColorComponentFlagBits
  VkDescriptorSetLayoutCreateFlagBits
  VkDescriptorPoolCreateFlagBits
  VkAttachmentDescriptionFlagBits
  VkSubpassDescriptionFlagBits
  VkAccessFlagBits
  VkDependencyFlagBits
  VkCommandPoolCreateFlagBits
  VkCommandPoolResetFlagBits
  VkCommandBufferUsageFlagBits
  VkQueryControlFlagBits
  VkCommandBufferResetFlagBits
  VkStencilFaceFlagBits
  VkRenderPassCreateFlagBits
  VkPointClippingBehavior
  VkTessellationDomainOrigin
  VkSamplerYcbcrModelConversion
  VkSamplerYcbcrRange
  VkChromaLocation
  VkDescriptorUpdateTemplateType
  VkSubgroupFeatureFlagBits
  VkPeerMemoryFeatureFlagBits
  VkMemoryAllocateFlagBits
  VkExternalMemoryHandleTypeFlagBits
  VkExternalMemoryFeatureFlagBits
  VkExternalFenceHandleTypeFlagBits
  VkExternalFenceFeatureFlagBits
  VkFenceImportFlagBits
  VkSemaphoreImportFlagBits
  VkExternalSemaphoreHandleTypeFlagBits
  VkExternalSemaphoreFeatureFlagBits
  VkColorSpaceKHR
  VkPresentModeKHR
  VkSurfaceTransformFlagBitsKHR
  VkCompositeAlphaFlagBitsKHR
  VkSwapchainCreateFlagBitsKHR
  VkDeviceGroupPresentModeFlagBitsKHR
  VkDisplayPlaneAlphaFlagBitsKHR
  VkDriverIdKHR
  VkDebugReportObjectTypeEXT
  VkDebugReportFlagBitsEXT
  VkRasterizationOrderAMD
  VkShaderInfoTypeAMD
  VkExternalMemoryHandleTypeFlagBitsNV
  VkExternalMemoryFeatureFlagBitsNV
  VkValidationCheckEXT
  VkConditionalRenderingFlagBitsEXT
  VkIndirectCommandsTokenTypeNVX
  VkObjectEntryTypeNVX
  VkIndirectCommandsLayoutUsageFlagBitsNVX
  VkObjectEntryUsageFlagBitsNVX
  VkSurfaceCounterFlagBitsEXT
  VkDisplayPowerStateEXT
  VkDeviceEventTypeEXT
  VkDisplayEventTypeEXT
  VkViewportCoordinateSwizzleNV
  VkDiscardRectangleModeEXT
  VkConservativeRasterizationModeEXT
  VkDebugUtilsMessageSeverityFlagBitsEXT
  VkDebugUtilsMessageTypeFlagBitsEXT
  VkSamplerReductionModeEXT
  VkBlendOverlapEXT
  VkCoverageModulationModeNV
  VkValidationCacheHeaderVersionEXT
  VkDescriptorBindingFlagBitsEXT
  VkShadingRatePaletteEntryNV
  VkCoarseSampleOrderTypeNV
  VkRayTracingShaderGroupTypeNV
  VkGeometryTypeNV
  VkAccelerationStructureTypeNV
  VkCopyAccelerationStructureModeNV
  VkAccelerationStructureMemoryRequirementsTypeNV
  VkGeometryFlagBitsNV
  VkGeometryInstanceFlagBitsNV
  VkBuildAccelerationStructureFlagBitsNV
  VkQueueGlobalPriorityEXT
  VkTimeDomainEXT
  VkMemoryOverallocationBehaviorAMD
## * Copyright (c) 2015-2018 The Khronos Group Inc.
## *
## * Licensed under the Apache License, Version 2.0 (the "License");
## * you may not use this file except in compliance with the License.
## * You may obtain a copy of the License at
## *
## *     http://www.apache.org/licenses/LICENSE-2.0
## *
## * Unless required by applicable law or agreed to in writing, software
## * distributed under the License is distributed on an "AS IS" BASIS,
## * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## * See the License for the specific language governing permissions and
## * limitations under the License.
##
##
## * This header is generated from the Khronos Vulkan XML API Registry.
## *
##

const
  vkVersion_1_0* = 1

template vkMakeVersion*(major, minor, patch: untyped): untyped =
  (((major) shl 22) or ((minor) shl 12) or (patch))

##  DEPRECATED: This define has been removed. Specific version defines (e.g. vkApiVersion_1_0), or the vkMakeVersion macro, should be used instead.
## #define vkApiVersion vkMakeVersion(1, 0, 0) // Patch version should always be set to 0
##  Vulkan 1.0 version number

const
  vkApiVersion_1_0* = vkMakeVersion(1, 0, 0) ##  Patch version should always be set to 0

template vkVersionMajor*(version: untyped): untyped =
  ((uint32)(version) shr 22)

template vkVersionMinor*(version: untyped): untyped =
  (((uint32)(version) shr 12) and 0x000003FF)

template vkVersionPatch*(version: untyped): untyped =
  ((uint32)(version) and 0x00000FFF)

##  Version of this file

const
  vkHeaderVersion* = 92
  vkNullHandle* = 0

type
  VkFlags* = uint32
  VkBool32* = uint32
  VkDeviceSize* = uint64
  VkSampleMask* = uint32
  VkInstance* = VkHandle
  VkPhysicalDevice* = VkHandle
  VkDevice* = VkHandle
  VkQueue* = VkHandle
  VkSemaphore* = VkNonDispatchableHandle
  VkCommandBuffer* = VkHandle
  VkFence* = VkNonDispatchableHandle
  VkDeviceMemory* = VkNonDispatchableHandle
  VkBuffer* = VkNonDispatchableHandle
  VkImage* = VkNonDispatchableHandle
  VkEvent* = VkNonDispatchableHandle
  VkQueryPool* = VkNonDispatchableHandle
  VkBufferView* = VkNonDispatchableHandle
  VkImageView* = VkNonDispatchableHandle
  VkShaderModule* = VkNonDispatchableHandle
  VkPipelineCache* = VkNonDispatchableHandle
  VkPipelineLayout* = VkNonDispatchableHandle
  VkRenderPass* = VkNonDispatchableHandle
  VkPipeline* = VkNonDispatchableHandle
  VkDescriptorSetLayout* = VkNonDispatchableHandle
  VkSampler* = VkNonDispatchableHandle
  VkDescriptorPool* = VkNonDispatchableHandle
  VkDescriptorSet* = VkNonDispatchableHandle
  VkFramebuffer* = VkNonDispatchableHandle
  VkCommandPool* = VkNonDispatchableHandle

const
  vkLodClampNone* = 1000.0
  vkRemainingMipLevels* = (not 0'u32)
  vkRemainingArrayLayers* = (not 0'u32)
  vkWholeSize* = (not 0'u32)
  vkAttachmentUnused* = (not 0'u32)
  vkTrue* = 1
  vkFalse* = 0
  vkQueueFamilyIgnored* = (not 0'u32)
  vkSubpassExternal* = (not 0'u32)
  vkMaxPhysicalDeviceNameSize* = 256
  vkUuidSize* = 16
  vkMaxMemoryTypes* = 32
  vkMaxMemoryHeaps* = 16
  vkMaxExtensionNameSize* = 256
  vkMaxDescriptionSize* = 256

type
  VkPipelineCacheHeaderVersion* = distinct cint
  VkResult* = distinct cint
  VkStructureType* = distinct cint
  VkSystemAllocationScope* = distinct cint
  VkInternalAllocationType* = distinct cint
  VkFormat* = distinct cint
  VkImageType* = distinct cint
  VkImageTiling* = distinct cint
  VkPhysicalDeviceType* = distinct cint
  VkQueryType* = distinct cint
  VkSharingMode* = distinct cint
  VkImageLayout* = distinct cint
  VkImageViewType* = distinct cint
  VkComponentSwizzle* = distinct cint
  VkVertexInputRate* = distinct cint
  VkPrimitiveTopology* = distinct cint
  VkPolygonMode* = distinct cint
  VkFrontFace* = distinct cint
  VkCompareOp* = distinct cint
  VkStencilOp* = distinct cint
  VkLogicOp* = distinct cint
  VkBlendFactor* = distinct cint
  VkBlendOp* = distinct cint
  VkDynamicState* = distinct cint
  VkFilter* = distinct cint
  VkSamplerMipmapMode* = distinct cint
  VkSamplerAddressMode* = distinct cint
  VkBorderColor* = distinct cint
  VkDescriptorType* = distinct cint
  VkAttachmentLoadOp* = distinct cint
  VkAttachmentStoreOp* = distinct cint
  VkPipelineBindPoint* = distinct cint
  VkCommandBufferLevel* = distinct cint
  VkIndexType* = distinct cint
  VkSubpassContents* = distinct cint
  VkObjectType* = distinct cint
  VkVendorId* = distinct cint
  VkInstanceCreateFlags* = VkFlags
  VkFormatFeatureFlagBits* = distinct cint
  VkFormatFeatureFlags* = VkFlags
  VkImageUsageFlagBits* = distinct cint
  VkImageUsageFlags* = VkFlags
  VkImageCreateFlagBits* = distinct cint
  VkImageCreateFlags* = VkFlags
  VkSampleCountFlagBits* = distinct cint
  VkSampleCountFlags* = VkFlags
  VkQueueFlagBits* = distinct cint
  VkQueueFlags* = VkFlags
  VkMemoryPropertyFlagBits* = distinct cint
  VkMemoryPropertyFlags* = VkFlags
  VkMemoryHeapFlagBits* = distinct cint
  VkMemoryHeapFlags* = VkFlags
  VkDeviceCreateFlags* = VkFlags
  VkDeviceQueueCreateFlagBits* = distinct cint
  VkDeviceQueueCreateFlags* = VkFlags
  VkPipelineStageFlagBits* = distinct cint
  VkPipelineStageFlags* = VkFlags
  VkMemoryMapFlags* = VkFlags
  VkImageAspectFlagBits* = distinct cint
  VkImageAspectFlags* = VkFlags
  VkSparseImageFormatFlagBits* = distinct cint
  VkSparseImageFormatFlags* = VkFlags
  VkSparseMemoryBindFlagBits* = distinct cint
  VkSparseMemoryBindFlags* = VkFlags
  VkFenceCreateFlagBits* = distinct cint
  VkFenceCreateFlags* = VkFlags
  VkSemaphoreCreateFlags* = VkFlags
  VkEventCreateFlags* = VkFlags
  VkQueryPoolCreateFlags* = VkFlags
  VkQueryPipelineStatisticFlagBits* = distinct cint
  VkQueryPipelineStatisticFlags* = VkFlags
  VkQueryResultFlagBits* = distinct cint
  VkQueryResultFlags* = VkFlags
  VkBufferCreateFlagBits* = distinct cint
  VkBufferCreateFlags* = VkFlags
  VkBufferUsageFlagBits* = distinct cint
  VkBufferUsageFlags* = VkFlags
  VkBufferViewCreateFlags* = VkFlags
  VkImageViewCreateFlags* = VkFlags
  VkShaderModuleCreateFlags* = VkFlags
  VkPipelineCacheCreateFlags* = VkFlags
  VkPipelineCreateFlagBits* = distinct cint
  VkPipelineCreateFlags* = VkFlags
  VkPipelineShaderStageCreateFlags* = VkFlags
  VkShaderStageFlagBits* = distinct cint
  VkPipelineVertexInputStateCreateFlags* = VkFlags
  VkPipelineInputAssemblyStateCreateFlags* = VkFlags
  VkPipelineTessellationStateCreateFlags* = VkFlags
  VkPipelineViewportStateCreateFlags* = VkFlags
  VkPipelineRasterizationStateCreateFlags* = VkFlags
  VkCullModeFlagBits* = distinct cint
  VkCullModeFlags* = VkFlags
  VkPipelineMultisampleStateCreateFlags* = VkFlags
  VkPipelineDepthStencilStateCreateFlags* = VkFlags
  VkPipelineColorBlendStateCreateFlags* = VkFlags
  VkColorComponentFlagBits* = distinct cint
  VkColorComponentFlags* = VkFlags
  VkPipelineDynamicStateCreateFlags* = VkFlags
  VkPipelineLayoutCreateFlags* = VkFlags
  VkShaderStageFlags* = VkFlags
  VkSamplerCreateFlags* = VkFlags
  VkDescriptorSetLayoutCreateFlagBits* = distinct cint
  VkDescriptorSetLayoutCreateFlags* = VkFlags
  VkDescriptorPoolCreateFlagBits* = distinct cint
  VkDescriptorPoolCreateFlags* = VkFlags
  VkDescriptorPoolResetFlags* = VkFlags
  VkFramebufferCreateFlags* = VkFlags
  VkRenderPassCreateFlags* = VkFlags
  VkAttachmentDescriptionFlagBits* = distinct cint
  VkAttachmentDescriptionFlags* = VkFlags
  VkSubpassDescriptionFlagBits* = distinct cint
  VkSubpassDescriptionFlags* = VkFlags
  VkAccessFlagBits* = distinct cint
  VkAccessFlags* = VkFlags
  VkDependencyFlagBits* = distinct cint
  VkDependencyFlags* = VkFlags
  VkCommandPoolCreateFlagBits* = distinct cint
  VkCommandPoolCreateFlags* = VkFlags
  VkCommandPoolResetFlagBits* = distinct cint
  VkCommandPoolResetFlags* = VkFlags
  VkCommandBufferUsageFlagBits* = distinct cint
  VkCommandBufferUsageFlags* = VkFlags
  VkQueryControlFlagBits* = distinct cint
  VkQueryControlFlags* = VkFlags
  VkCommandBufferResetFlagBits* = distinct cint
  VkCommandBufferResetFlags* = VkFlags
  VkStencilFaceFlagBits* = distinct cint
  VkStencilFaceFlags* = VkFlags
  VkRenderPassCreateFlagBits* = distinct cint
  VkApplicationInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pApplicationName*: cstring
    applicationVersion*: uint32
    pEngineName*: cstring
    engineVersion*: uint32
    apiVersion*: uint32

  VkInstanceCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkInstanceCreateFlags
    pApplicationInfo*: ptr VkApplicationInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray

  PFNVkallocationfunction* = proc (pUserData: pointer; size: csize; alignment: csize; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}
  PFNVkreallocationfunction* = proc (pUserData: pointer; pOriginal: pointer; size: csize; alignment: csize; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}
  PFNVkfreefunction* = proc (pUserData: pointer; pMemory: pointer) {.cdecl.}
  PFNVkinternalallocationnotification* = proc (pUserData: pointer; size: csize; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}
  PFNVkinternalfreenotification* = proc (pUserData: pointer; size: csize; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}
  VkAllocationCallbacks* {.bycopy.} = object
    pUserData*: pointer
    pfnAllocation*: PFNVkallocationfunction
    pfnReallocation*: PFNVkreallocationfunction
    pfnFree*: PFNVkfreefunction
    pfnInternalAllocation*: PFNVkinternalallocationnotification
    pfnInternalFree*: PFNVkinternalfreenotification

  VkPhysicalDeviceFeatures* {.bycopy.} = object
    robustBufferAccess*: VkBool32
    fullDrawIndexUint32*: VkBool32
    imageCubeArray*: VkBool32
    independentBlend*: VkBool32
    geometryShader*: VkBool32
    tessellationShader*: VkBool32
    sampleRateShading*: VkBool32
    dualSrcBlend*: VkBool32
    logicOp*: VkBool32
    multiDrawIndirect*: VkBool32
    drawIndirectFirstInstance*: VkBool32
    depthClamp*: VkBool32
    depthBiasClamp*: VkBool32
    fillModeNonSolid*: VkBool32
    depthBounds*: VkBool32
    wideLines*: VkBool32
    largePoints*: VkBool32
    alphaToOne*: VkBool32
    multiViewport*: VkBool32
    samplerAnisotropy*: VkBool32
    textureCompressionETC2*: VkBool32
    textureCompressionASTCLdr*: VkBool32
    textureCompressionBC*: VkBool32
    occlusionQueryPrecise*: VkBool32
    pipelineStatisticsQuery*: VkBool32
    vertexPipelineStoresAndAtomics*: VkBool32
    fragmentStoresAndAtomics*: VkBool32
    shaderTessellationAndGeometryPointSize*: VkBool32
    shaderImageGatherExtended*: VkBool32
    shaderStorageImageExtendedFormats*: VkBool32
    shaderStorageImageMultisample*: VkBool32
    shaderStorageImageReadWithoutFormat*: VkBool32
    shaderStorageImageWriteWithoutFormat*: VkBool32
    shaderUniformBufferArrayDynamicIndexing*: VkBool32
    shaderSampledImageArrayDynamicIndexing*: VkBool32
    shaderStorageBufferArrayDynamicIndexing*: VkBool32
    shaderStorageImageArrayDynamicIndexing*: VkBool32
    shaderClipDistance*: VkBool32
    shaderCullDistance*: VkBool32
    shaderFloat64*: VkBool32
    shaderInt64*: VkBool32
    shaderInt16*: VkBool32
    shaderResourceResidency*: VkBool32
    shaderResourceMinLod*: VkBool32
    sparseBinding*: VkBool32
    sparseResidencyBuffer*: VkBool32
    sparseResidencyImage2D*: VkBool32
    sparseResidencyImage3D*: VkBool32
    sparseResidency2Samples*: VkBool32
    sparseResidency4Samples*: VkBool32
    sparseResidency8Samples*: VkBool32
    sparseResidency16Samples*: VkBool32
    sparseResidencyAliased*: VkBool32
    variableMultisampleRate*: VkBool32
    inheritedQueries*: VkBool32

  VkFormatProperties* {.bycopy.} = object
    linearTilingFeatures*: VkFormatFeatureFlags
    optimalTilingFeatures*: VkFormatFeatureFlags
    bufferFeatures*: VkFormatFeatureFlags

  VkExtent3D* {.bycopy.} = object
    width*: uint32
    height*: uint32
    depth*: uint32

  VkImageFormatProperties* {.bycopy.} = object
    maxExtent*: VkExtent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts*: VkSampleCountFlags
    maxResourceSize*: VkDeviceSize

  VkPhysicalDeviceLimits* {.bycopy.} = object
    maxImageDimension1D*: uint32
    maxImageDimension2D*: uint32
    maxImageDimension3D*: uint32
    maxImageDimensionCube*: uint32
    maxImageArrayLayers*: uint32
    maxTexelBufferElements*: uint32
    maxUniformBufferRange*: uint32
    maxStorageBufferRange*: uint32
    maxPushConstantsSize*: uint32
    maxMemoryAllocationCount*: uint32
    maxSamplerAllocationCount*: uint32
    bufferImageGranularity*: VkDeviceSize
    sparseAddressSpaceSize*: VkDeviceSize
    maxBoundDescriptorSets*: uint32
    maxPerStageDescriptorSamplers*: uint32
    maxPerStageDescriptorUniformBuffers*: uint32
    maxPerStageDescriptorStorageBuffers*: uint32
    maxPerStageDescriptorSampledImages*: uint32
    maxPerStageDescriptorStorageImages*: uint32
    maxPerStageDescriptorInputAttachments*: uint32
    maxPerStageResources*: uint32
    maxDescriptorSetSamplers*: uint32
    maxDescriptorSetUniformBuffers*: uint32
    maxDescriptorSetUniformBuffersDynamic*: uint32
    maxDescriptorSetStorageBuffers*: uint32
    maxDescriptorSetStorageBuffersDynamic*: uint32
    maxDescriptorSetSampledImages*: uint32
    maxDescriptorSetStorageImages*: uint32
    maxDescriptorSetInputAttachments*: uint32
    maxVertexInputAttributes*: uint32
    maxVertexInputBindings*: uint32
    maxVertexInputAttributeOffset*: uint32
    maxVertexInputBindingStride*: uint32
    maxVertexOutputComponents*: uint32
    maxTessellationGenerationLevel*: uint32
    maxTessellationPatchSize*: uint32
    maxTessellationControlPerVertexInputComponents*: uint32
    maxTessellationControlPerVertexOutputComponents*: uint32
    maxTessellationControlPerPatchOutputComponents*: uint32
    maxTessellationControlTotalOutputComponents*: uint32
    maxTessellationEvaluationInputComponents*: uint32
    maxTessellationEvaluationOutputComponents*: uint32
    maxGeometryShaderInvocations*: uint32
    maxGeometryInputComponents*: uint32
    maxGeometryOutputComponents*: uint32
    maxGeometryOutputVertices*: uint32
    maxGeometryTotalOutputComponents*: uint32
    maxFragmentInputComponents*: uint32
    maxFragmentOutputAttachments*: uint32
    maxFragmentDualSrcAttachments*: uint32
    maxFragmentCombinedOutputResources*: uint32
    maxComputeSharedMemorySize*: uint32
    maxComputeWorkGroupCount*: array[3, uint32]
    maxComputeWorkGroupInvocations*: uint32
    maxComputeWorkGroupSize*: array[3, uint32]
    subPixelPrecisionBits*: uint32
    subTexelPrecisionBits*: uint32
    mipmapPrecisionBits*: uint32
    maxDrawIndexedIndexValue*: uint32
    maxDrawIndirectCount*: uint32
    maxSamplerLodBias*: cfloat
    maxSamplerAnisotropy*: cfloat
    maxViewports*: uint32
    maxViewportDimensions*: array[2, uint32]
    viewportBoundsRange*: array[2, cfloat]
    viewportSubPixelBits*: uint32
    minMemoryMapAlignment*: csize
    minTexelBufferOffsetAlignment*: VkDeviceSize
    minUniformBufferOffsetAlignment*: VkDeviceSize
    minStorageBufferOffsetAlignment*: VkDeviceSize
    minTexelOffset*: int32
    maxTexelOffset*: uint32
    minTexelGatherOffset*: int32
    maxTexelGatherOffset*: uint32
    minInterpolationOffset*: cfloat
    maxInterpolationOffset*: cfloat
    subPixelInterpolationOffsetBits*: uint32
    maxFramebufferWidth*: uint32
    maxFramebufferHeight*: uint32
    maxFramebufferLayers*: uint32
    framebufferColorSampleCounts*: VkSampleCountFlags
    framebufferDepthSampleCounts*: VkSampleCountFlags
    framebufferStencilSampleCounts*: VkSampleCountFlags
    framebufferNoAttachmentsSampleCounts*: VkSampleCountFlags
    maxColorAttachments*: uint32
    sampledImageColorSampleCounts*: VkSampleCountFlags
    sampledImageIntegerSampleCounts*: VkSampleCountFlags
    sampledImageDepthSampleCounts*: VkSampleCountFlags
    sampledImageStencilSampleCounts*: VkSampleCountFlags
    storageImageSampleCounts*: VkSampleCountFlags
    maxSampleMaskWords*: uint32
    timestampComputeAndGraphics*: VkBool32
    timestampPeriod*: cfloat
    maxClipDistances*: uint32
    maxCullDistances*: uint32
    maxCombinedClipAndCullDistances*: uint32
    discreteQueuePriorities*: uint32
    pointSizeRange*: array[2, cfloat]
    lineWidthRange*: array[2, cfloat]
    pointSizeGranularity*: cfloat
    lineWidthGranularity*: cfloat
    strictLines*: VkBool32
    standardSampleLocations*: VkBool32
    optimalBufferCopyOffsetAlignment*: VkDeviceSize
    optimalBufferCopyRowPitchAlignment*: VkDeviceSize
    nonCoherentAtomSize*: VkDeviceSize

  VkPhysicalDeviceSparseProperties* {.bycopy.} = object
    residencyStandard2DBlockShape*: VkBool32
    residencyStandard2DMultisampleBlockShape*: VkBool32
    residencyStandard3DBlockShape*: VkBool32
    residencyAlignedMipSize*: VkBool32
    residencyNonResidentStrict*: VkBool32

  VkPhysicalDeviceProperties* {.bycopy.} = object
    apiVersion*: uint32
    driverVersion*: uint32
    vendorID*: uint32
    deviceID*: uint32
    deviceType*: VkPhysicalDeviceType
    deviceName*: array[vkMaxPhysicalDeviceNameSize, char]
    pipelineCacheUUID*: array[vkUuidSize, uint8]
    limits*: VkPhysicalDeviceLimits
    sparseProperties*: VkPhysicalDeviceSparseProperties

  VkQueueFamilyProperties* {.bycopy.} = object
    queueFlags*: VkQueueFlags
    queueCount*: uint32
    timestampValidBits*: uint32
    minImageTransferGranularity*: VkExtent3D

  VkMemoryType* {.bycopy.} = object
    propertyFlags*: VkMemoryPropertyFlags
    heapIndex*: uint32

  VkMemoryHeap* {.bycopy.} = object
    size*: VkDeviceSize
    flags*: VkMemoryHeapFlags

  VkPhysicalDeviceMemoryProperties* {.bycopy.} = object
    memoryTypeCount*: uint32
    memoryTypes*: array[vkMaxMemoryTypes, VkMemoryType]
    memoryHeapCount*: uint32
    memoryHeaps*: array[vkMaxMemoryHeaps, VkMemoryHeap]

  PFNVkvoidfunction* = proc () {.cdecl.}
  VkDeviceQueueCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueCount*: uint32
    pQueuePriorities*: ptr cfloat

  VkDeviceCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceCreateFlags
    queueCreateInfoCount*: uint32
    pQueueCreateInfos*: ptr VkDeviceQueueCreateInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray
    pEnabledFeatures*: ptr VkPhysicalDeviceFeatures

  VkExtensionProperties* {.bycopy.} = object
    extensionName*: array[vkMaxExtensionNameSize, char]
    specVersion*: uint32

  VkLayerProperties* {.bycopy.} = object
    layerName*: array[vkMaxExtensionNameSize, char]
    specVersion*: uint32
    implementationVersion*: uint32
    description*: array[vkMaxDescriptionSize, char]

  VkSubmitInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr VkSemaphore
    pWaitDstStageMask*: ptr VkPipelineStageFlags
    commandBufferCount*: uint32
    pCommandBuffers*: ptr VkCommandBuffer
    signalSemaphoreCount*: uint32
    pSignalSemaphores*: ptr VkSemaphore

  VkMemoryAllocateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    allocationSize*: VkDeviceSize
    memoryTypeIndex*: uint32

  VkMappedMemoryRange* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory
    offset*: VkDeviceSize
    size*: VkDeviceSize

  VkMemoryRequirements* {.bycopy.} = object
    size*: VkDeviceSize
    alignment*: VkDeviceSize
    memoryTypeBits*: uint32

  VkSparseImageFormatProperties* {.bycopy.} = object
    aspectMask*: VkImageAspectFlags
    imageGranularity*: VkExtent3D
    flags*: VkSparseImageFormatFlags

  VkSparseImageMemoryRequirements* {.bycopy.} = object
    formatProperties*: VkSparseImageFormatProperties
    imageMipTailFirstLod*: uint32
    imageMipTailSize*: VkDeviceSize
    imageMipTailOffset*: VkDeviceSize
    imageMipTailStride*: VkDeviceSize

  VkSparseMemoryBind* {.bycopy.} = object
    resourceOffset*: VkDeviceSize
    size*: VkDeviceSize
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize
    flags*: VkSparseMemoryBindFlags

  VkSparseBufferMemoryBindInfo* {.bycopy.} = object
    buffer*: VkBuffer
    bindCount*: uint32
    pBinds*: ptr VkSparseMemoryBind

  VkSparseImageOpaqueMemoryBindInfo* {.bycopy.} = object
    image*: VkImage
    bindCount*: uint32
    pBinds*: ptr VkSparseMemoryBind

  VkImageSubresource* {.bycopy.} = object
    aspectMask*: VkImageAspectFlags
    mipLevel*: uint32
    arrayLayer*: uint32

  VkOffset3D* {.bycopy.} = object
    x*: int32
    y*: int32
    z*: int32

  VkSparseImageMemoryBind* {.bycopy.} = object
    subresource*: VkImageSubresource
    offset*: VkOffset3D
    extent*: VkExtent3D
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize
    flags*: VkSparseMemoryBindFlags

  VkSparseImageMemoryBindInfo* {.bycopy.} = object
    image*: VkImage
    bindCount*: uint32
    pBinds*: ptr VkSparseImageMemoryBind

  VkBindSparseInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr VkSemaphore
    bufferBindCount*: uint32
    pBufferBinds*: ptr VkSparseBufferMemoryBindInfo
    imageOpaqueBindCount*: uint32
    pImageOpaqueBinds*: ptr VkSparseImageOpaqueMemoryBindInfo
    imageBindCount*: uint32
    pImageBinds*: ptr VkSparseImageMemoryBindInfo
    signalSemaphoreCount*: uint32
    pSignalSemaphores*: ptr VkSemaphore

  VkFenceCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkFenceCreateFlags

  VkSemaphoreCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSemaphoreCreateFlags

  VkEventCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkEventCreateFlags

  VkQueryPoolCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkQueryPoolCreateFlags
    queryType*: VkQueryType
    queryCount*: uint32
    pipelineStatistics*: VkQueryPipelineStatisticFlags

  VkBufferCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferCreateFlags
    size*: VkDeviceSize
    usage*: VkBufferUsageFlags
    sharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32

  VkBufferViewCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferViewCreateFlags
    buffer*: VkBuffer
    format*: VkFormat
    offset*: VkDeviceSize
    range*: VkDeviceSize

  VkImageCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkImageCreateFlags
    imageType*: VkImageType
    format*: VkFormat
    extent*: VkExtent3D
    mipLevels*: uint32
    arrayLayers*: uint32
    samples*: VkSampleCountFlagBits
    tiling*: VkImageTiling
    usage*: VkImageUsageFlags
    sharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
    initialLayout*: VkImageLayout

  VkSubresourceLayout* {.bycopy.} = object
    offset*: VkDeviceSize
    size*: VkDeviceSize
    rowPitch*: VkDeviceSize
    arrayPitch*: VkDeviceSize
    depthPitch*: VkDeviceSize

  VkComponentMapping* {.bycopy.} = object
    r*: VkComponentSwizzle
    g*: VkComponentSwizzle
    b*: VkComponentSwizzle
    a*: VkComponentSwizzle

  VkImageSubresourceRange* {.bycopy.} = object
    aspectMask*: VkImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkImageViewCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkImageViewCreateFlags
    image*: VkImage
    viewType*: VkImageViewType
    format*: VkFormat
    components*: VkComponentMapping
    subresourceRange*: VkImageSubresourceRange

  VkShaderModuleCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkShaderModuleCreateFlags
    codeSize*: csize
    pCode*: ptr uint32

  VkPipelineCacheCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCacheCreateFlags
    initialDataSize*: csize
    pInitialData*: pointer

  VkSpecializationMapEntry* {.bycopy.} = object
    constantID*: uint32
    offset*: uint32
    size*: csize

  VkSpecializationInfo* {.bycopy.} = object
    mapEntryCount*: uint32
    pMapEntries*: ptr VkSpecializationMapEntry
    dataSize*: csize
    pData*: pointer

  VkPipelineShaderStageCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineShaderStageCreateFlags
    stage*: VkShaderStageFlagBits
    module*: VkShaderModule
    pName*: cstring
    pSpecializationInfo*: ptr VkSpecializationInfo

  VkVertexInputBindingDescription* {.bycopy.} = object
    binding*: uint32
    stride*: uint32
    inputRate*: VkVertexInputRate

  VkVertexInputAttributeDescription* {.bycopy.} = object
    location*: uint32
    binding*: uint32
    format*: VkFormat
    offset*: uint32

  VkPipelineVertexInputStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineVertexInputStateCreateFlags
    vertexBindingDescriptionCount*: uint32
    pVertexBindingDescriptions*: ptr VkVertexInputBindingDescription
    vertexAttributeDescriptionCount*: uint32
    pVertexAttributeDescriptions*: ptr VkVertexInputAttributeDescription

  VkPipelineInputAssemblyStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineInputAssemblyStateCreateFlags
    topology*: VkPrimitiveTopology
    primitiveRestartEnable*: VkBool32

  VkPipelineTessellationStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineTessellationStateCreateFlags
    patchControlPoints*: uint32

  VkViewport* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    width*: cfloat
    height*: cfloat
    minDepth*: cfloat
    maxDepth*: cfloat

  VkOffset2D* {.bycopy.} = object
    x*: int32
    y*: int32

  VkExtent2D* {.bycopy.} = object
    width*: uint32
    height*: uint32

  VkRect2D* {.bycopy.} = object
    offset*: VkOffset2D
    extent*: VkExtent2D

  VkPipelineViewportStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineViewportStateCreateFlags
    viewportCount*: uint32
    pViewports*: ptr VkViewport
    scissorCount*: uint32
    pScissors*: ptr VkRect2D

  VkPipelineRasterizationStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationStateCreateFlags
    depthClampEnable*: VkBool32
    rasterizerDiscardEnable*: VkBool32
    polygonMode*: VkPolygonMode
    cullMode*: VkCullModeFlags
    frontFace*: VkFrontFace
    depthBiasEnable*: VkBool32
    depthBiasConstantFactor*: cfloat
    depthBiasClamp*: cfloat
    depthBiasSlopeFactor*: cfloat
    lineWidth*: cfloat

  VkPipelineMultisampleStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineMultisampleStateCreateFlags
    rasterizationSamples*: VkSampleCountFlagBits
    sampleShadingEnable*: VkBool32
    minSampleShading*: cfloat
    pSampleMask*: ptr VkSampleMask
    alphaToCoverageEnable*: VkBool32
    alphaToOneEnable*: VkBool32

  VkStencilOpState* {.bycopy.} = object
    failOp*: VkStencilOp
    passOp*: VkStencilOp
    depthFailOp*: VkStencilOp
    compareOp*: VkCompareOp
    compareMask*: uint32
    writeMask*: uint32
    reference*: uint32

  VkPipelineDepthStencilStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineDepthStencilStateCreateFlags
    depthTestEnable*: VkBool32
    depthWriteEnable*: VkBool32
    depthCompareOp*: VkCompareOp
    depthBoundsTestEnable*: VkBool32
    stencilTestEnable*: VkBool32
    front*: VkStencilOpState
    back*: VkStencilOpState
    minDepthBounds*: cfloat
    maxDepthBounds*: cfloat

  VkPipelineColorBlendAttachmentState* {.bycopy.} = object
    blendEnable*: VkBool32
    srcColorBlendFactor*: VkBlendFactor
    dstColorBlendFactor*: VkBlendFactor
    colorBlendOp*: VkBlendOp
    srcAlphaBlendFactor*: VkBlendFactor
    dstAlphaBlendFactor*: VkBlendFactor
    alphaBlendOp*: VkBlendOp
    colorWriteMask*: VkColorComponentFlags

  VkPipelineColorBlendStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineColorBlendStateCreateFlags
    logicOpEnable*: VkBool32
    logicOp*: VkLogicOp
    attachmentCount*: uint32
    pAttachments*: ptr VkPipelineColorBlendAttachmentState
    blendConstants*: array[4, cfloat]

  VkPipelineDynamicStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineDynamicStateCreateFlags
    dynamicStateCount*: uint32
    pDynamicStates*: ptr VkDynamicState

  VkGraphicsPipelineCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stageCount*: uint32
    pStages*: ptr VkPipelineShaderStageCreateInfo
    pVertexInputState*: ptr VkPipelineVertexInputStateCreateInfo
    pInputAssemblyState*: ptr VkPipelineInputAssemblyStateCreateInfo
    pTessellationState*: ptr VkPipelineTessellationStateCreateInfo
    pViewportState*: ptr VkPipelineViewportStateCreateInfo
    pRasterizationState*: ptr VkPipelineRasterizationStateCreateInfo
    pMultisampleState*: ptr VkPipelineMultisampleStateCreateInfo
    pDepthStencilState*: ptr VkPipelineDepthStencilStateCreateInfo
    pColorBlendState*: ptr VkPipelineColorBlendStateCreateInfo
    pDynamicState*: ptr VkPipelineDynamicStateCreateInfo
    layout*: VkPipelineLayout
    renderPass*: VkRenderPass
    subpass*: uint32
    basePipelineHandle*: VkPipeline
    basePipelineIndex*: int32

  VkComputePipelineCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stage*: VkPipelineShaderStageCreateInfo
    layout*: VkPipelineLayout
    basePipelineHandle*: VkPipeline
    basePipelineIndex*: int32

  VkPushConstantRange* {.bycopy.} = object
    stageFlags*: VkShaderStageFlags
    offset*: uint32
    size*: uint32

  VkPipelineLayoutCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineLayoutCreateFlags
    setLayoutCount*: uint32
    pSetLayouts*: ptr VkDescriptorSetLayout
    pushConstantRangeCount*: uint32
    pPushConstantRanges*: ptr VkPushConstantRange

  VkSamplerCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSamplerCreateFlags
    magFilter*: VkFilter
    minFilter*: VkFilter
    mipmapMode*: VkSamplerMipmapMode
    addressModeU*: VkSamplerAddressMode
    addressModeV*: VkSamplerAddressMode
    addressModeW*: VkSamplerAddressMode
    mipLodBias*: cfloat
    anisotropyEnable*: VkBool32
    maxAnisotropy*: cfloat
    compareEnable*: VkBool32
    compareOp*: VkCompareOp
    minLod*: cfloat
    maxLod*: cfloat
    borderColor*: VkBorderColor
    unnormalizedCoordinates*: VkBool32

  VkDescriptorSetLayoutBinding* {.bycopy.} = object
    binding*: uint32
    descriptorType*: VkDescriptorType
    descriptorCount*: uint32
    stageFlags*: VkShaderStageFlags
    pImmutableSamplers*: ptr VkSampler

  VkDescriptorSetLayoutCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDescriptorSetLayoutCreateFlags
    bindingCount*: uint32
    pBindings*: ptr VkDescriptorSetLayoutBinding

  VkDescriptorPoolSize* {.bycopy.} = object
    descriptorType*: VkDescriptorType
    descriptorCount*: uint32

  VkDescriptorPoolCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDescriptorPoolCreateFlags
    maxSets*: uint32
    poolSizeCount*: uint32
    pPoolSizes*: ptr VkDescriptorPoolSize

  VkDescriptorSetAllocateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    descriptorPool*: VkDescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts*: ptr VkDescriptorSetLayout

  VkDescriptorImageInfo* {.bycopy.} = object
    sampler*: VkSampler
    imageView*: VkImageView
    imageLayout*: VkImageLayout

  VkDescriptorBufferInfo* {.bycopy.} = object
    buffer*: VkBuffer
    offset*: VkDeviceSize
    range*: VkDeviceSize

  VkWriteDescriptorSet* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    dstSet*: VkDescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: VkDescriptorType
    pImageInfo*: ptr VkDescriptorImageInfo
    pBufferInfo*: ptr VkDescriptorBufferInfo
    pTexelBufferView*: ptr VkBufferView

  VkCopyDescriptorSet* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcSet*: VkDescriptorSet
    srcBinding*: uint32
    srcArrayElement*: uint32
    dstSet*: VkDescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32

  VkFramebufferCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkFramebufferCreateFlags
    renderPass*: VkRenderPass
    attachmentCount*: uint32
    pAttachments*: ptr VkImageView
    width*: uint32
    height*: uint32
    layers*: uint32

  VkAttachmentDescription* {.bycopy.} = object
    flags*: VkAttachmentDescriptionFlags
    format*: VkFormat
    samples*: VkSampleCountFlagBits
    loadOp*: VkAttachmentLoadOp
    storeOp*: VkAttachmentStoreOp
    stencilLoadOp*: VkAttachmentLoadOp
    stencilStoreOp*: VkAttachmentStoreOp
    initialLayout*: VkImageLayout
    finalLayout*: VkImageLayout

  VkAttachmentReference* {.bycopy.} = object
    attachment*: uint32
    layout*: VkImageLayout

  VkSubpassDescription* {.bycopy.} = object
    flags*: VkSubpassDescriptionFlags
    pipelineBindPoint*: VkPipelineBindPoint
    inputAttachmentCount*: uint32
    pInputAttachments*: ptr VkAttachmentReference
    colorAttachmentCount*: uint32
    pColorAttachments*: ptr VkAttachmentReference
    pResolveAttachments*: ptr VkAttachmentReference
    pDepthStencilAttachment*: ptr VkAttachmentReference
    preserveAttachmentCount*: uint32
    pPreserveAttachments*: ptr uint32

  VkSubpassDependency* {.bycopy.} = object
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: VkPipelineStageFlags
    dstStageMask*: VkPipelineStageFlags
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    dependencyFlags*: VkDependencyFlags

  VkRenderPassCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkRenderPassCreateFlags
    attachmentCount*: uint32
    pAttachments*: ptr VkAttachmentDescription
    subpassCount*: uint32
    pSubpasses*: ptr VkSubpassDescription
    dependencyCount*: uint32
    pDependencies*: ptr VkSubpassDependency

  VkCommandPoolCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkCommandPoolCreateFlags
    queueFamilyIndex*: uint32

  VkCommandBufferAllocateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    commandPool*: VkCommandPool
    level*: VkCommandBufferLevel
    commandBufferCount*: uint32

  VkCommandBufferInheritanceInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    renderPass*: VkRenderPass
    subpass*: uint32
    framebuffer*: VkFramebuffer
    occlusionQueryEnable*: VkBool32
    queryFlags*: VkQueryControlFlags
    pipelineStatistics*: VkQueryPipelineStatisticFlags

  VkCommandBufferBeginInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkCommandBufferUsageFlags
    pInheritanceInfo*: ptr VkCommandBufferInheritanceInfo

  VkBufferCopy* {.bycopy.} = object
    srcOffset*: VkDeviceSize
    dstOffset*: VkDeviceSize
    size*: VkDeviceSize

  VkImageSubresourceLayers* {.bycopy.} = object
    aspectMask*: VkImageAspectFlags
    mipLevel*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkImageCopy* {.bycopy.} = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkImageBlit* {.bycopy.} = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffsets*: array[2, VkOffset3D]
    dstSubresource*: VkImageSubresourceLayers
    dstOffsets*: array[2, VkOffset3D]

  VkBufferImageCopy* {.bycopy.} = object
    bufferOffset*: VkDeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: VkImageSubresourceLayers
    imageOffset*: VkOffset3D
    imageExtent*: VkExtent3D

  VkClearColorValue* {.bycopy.} = object {.union.}
    float32*: array[4, cfloat]
    int32*: array[4, int32]
    uint32*: array[4, uint32]

  VkClearDepthStencilValue* {.bycopy.} = object
    depth*: cfloat
    stencil*: uint32

  VkClearValue* {.bycopy.} = object {.union.}
    color*: VkClearColorValue
    depthStencil*: VkClearDepthStencilValue

  VkClearAttachment* {.bycopy.} = object
    aspectMask*: VkImageAspectFlags
    colorAttachment*: uint32
    clearValue*: VkClearValue

  VkClearRect* {.bycopy.} = object
    rect*: VkRect2D
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkImageResolve* {.bycopy.} = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkMemoryBarrier* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags

  VkBufferMemoryBarrier* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    buffer*: VkBuffer
    offset*: VkDeviceSize
    size*: VkDeviceSize

  VkImageMemoryBarrier* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    oldLayout*: VkImageLayout
    newLayout*: VkImageLayout
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    image*: VkImage
    subresourceRange*: VkImageSubresourceRange

  VkRenderPassBeginInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    renderPass*: VkRenderPass
    framebuffer*: VkFramebuffer
    renderArea*: VkRect2D
    clearValueCount*: uint32
    pClearValues*: ptr VkClearValue

  VkDispatchIndirectCommand* {.bycopy.} = object
    x*: uint32
    y*: uint32
    z*: uint32

  VkDrawIndexedIndirectCommand* {.bycopy.} = object
    indexCount*: uint32
    instanceCount*: uint32
    firstIndex*: uint32
    vertexOffset*: int32
    firstInstance*: uint32

  VkDrawIndirectCommand* {.bycopy.} = object
    vertexCount*: uint32
    instanceCount*: uint32
    firstVertex*: uint32
    firstInstance*: uint32

  VkBaseOutStructure* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: ptr VkBaseOutStructure

  VkBaseInStructure* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: ptr VkBaseInStructure

  PFNVkcreateinstance* = proc (pCreateInfo: ptr VkInstanceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pInstance: ptr VkInstance): VkResult {.cdecl.}
  PFNVkdestroyinstance* = proc (instance: VkInstance; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkenumeratephysicaldevices* = proc (instance: VkInstance; pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr VkPhysicalDevice): VkResult {.cdecl.}
  PFNVkgetphysicaldevicefeatures* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures) {.cdecl.}
  PFNVkgetphysicaldeviceformatproperties* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties) {.cdecl.}
  PFNVkgetphysicaldeviceimageformatproperties* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; pImageFormatProperties: ptr VkImageFormatProperties): VkResult {.cdecl.}
  PFNVkgetphysicaldeviceproperties* = proc (physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties) {.cdecl.}
  PFNVkgetphysicaldevicequeuefamilyproperties* = proc (physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties) {.cdecl.}
  PFNVkgetphysicaldevicememoryproperties* = proc (physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties) {.cdecl.}
  PFNVkgetinstanceprocaddr* = proc (instance: VkInstance; pName: cstring): PFNVkvoidfunction {.cdecl.}
  PFNVkgetdeviceprocaddr* = proc (device: VkDevice; pName: cstring): PFNVkvoidfunction {.cdecl.}
  PFNVkcreatedevice* = proc (physicalDevice: VkPhysicalDevice; pCreateInfo: ptr VkDeviceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDevice: ptr VkDevice): VkResult {.cdecl.}
  PFNVkdestroydevice* = proc (device: VkDevice; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkenumerateinstanceextensionproperties* = proc (pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl.}
  PFNVkenumeratedeviceextensionproperties* = proc (physicalDevice: VkPhysicalDevice; pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl.}
  PFNVkenumerateinstancelayerproperties* = proc (pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl.}
  PFNVkenumeratedevicelayerproperties* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl.}
  PFNVkgetdevicequeue* = proc (device: VkDevice; queueFamilyIndex: uint32; queueIndex: uint32; pQueue: ptr VkQueue) {.cdecl.}
  PFNVkqueuesubmit* = proc (queue: VkQueue; submitCount: uint32; pSubmits: ptr VkSubmitInfo; fence: VkFence): VkResult {.cdecl.}
  PFNVkqueuewaitidle* = proc (queue: VkQueue): VkResult {.cdecl.}
  PFNVkdevicewaitidle* = proc (device: VkDevice): VkResult {.cdecl.}
  PFNVkallocatememory* = proc (device: VkDevice; pAllocateInfo: ptr VkMemoryAllocateInfo; pAllocator: ptr VkAllocationCallbacks; pMemory: ptr VkDeviceMemory): VkResult {.cdecl.}
  PFNVkfreememory* = proc (device: VkDevice; memory: VkDeviceMemory; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkmapmemory* = proc (device: VkDevice; memory: VkDeviceMemory; offset: VkDeviceSize; size: VkDeviceSize; flags: VkMemoryMapFlags; ppData: ptr pointer): VkResult {.cdecl.}
  PFNVkunmapmemory* = proc (device: VkDevice; memory: VkDeviceMemory) {.cdecl.}
  PFNVkflushmappedmemoryranges* = proc (device: VkDevice; memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult {.cdecl.}
  PFNVkinvalidatemappedmemoryranges* = proc (device: VkDevice; memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult {.cdecl.}
  PFNVkgetdevicememorycommitment* = proc (device: VkDevice; memory: VkDeviceMemory; pCommittedMemoryInBytes: ptr VkDeviceSize) {.cdecl.}
  PFNVkbindbuffermemory* = proc (device: VkDevice; buffer: VkBuffer; memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult {.cdecl.}
  PFNVkbindimagememory* = proc (device: VkDevice; image: VkImage; memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult {.cdecl.}
  PFNVkgetbuffermemoryrequirements* = proc (device: VkDevice; buffer: VkBuffer; pMemoryRequirements: ptr VkMemoryRequirements) {.cdecl.}
  PFNVkgetimagememoryrequirements* = proc (device: VkDevice; image: VkImage; pMemoryRequirements: ptr VkMemoryRequirements) {.cdecl.}
  PFNVkgetimagesparsememoryrequirements* = proc (device: VkDevice; image: VkImage; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements) {.cdecl.}
  PFNVkgetphysicaldevicesparseimageformatproperties* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; samples: VkSampleCountFlagBits; usage: VkImageUsageFlags; tiling: VkImageTiling; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties) {.cdecl.}
  PFNVkqueuebindsparse* = proc (queue: VkQueue; bindInfoCount: uint32; pBindInfo: ptr VkBindSparseInfo; fence: VkFence): VkResult {.cdecl.}
  PFNVkcreatefence* = proc (device: VkDevice; pCreateInfo: ptr VkFenceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl.}
  PFNVkdestroyfence* = proc (device: VkDevice; fence: VkFence; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkresetfences* = proc (device: VkDevice; fenceCount: uint32; pFences: ptr VkFence): VkResult {.cdecl.}
  PFNVkgetfencestatus* = proc (device: VkDevice; fence: VkFence): VkResult {.cdecl.}
  PFNVkwaitforfences* = proc (device: VkDevice; fenceCount: uint32; pFences: ptr VkFence; waitAll: VkBool32; timeout: uint64): VkResult {.cdecl.}
  PFNVkcreatesemaphore* = proc (device: VkDevice; pCreateInfo: ptr VkSemaphoreCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSemaphore: ptr VkSemaphore): VkResult {.cdecl.}
  PFNVkdestroysemaphore* = proc (device: VkDevice; semaphore: VkSemaphore; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreateevent* = proc (device: VkDevice; pCreateInfo: ptr VkEventCreateInfo; pAllocator: ptr VkAllocationCallbacks; pEvent: ptr VkEvent): VkResult {.cdecl.}
  PFNVkdestroyevent* = proc (device: VkDevice; event: VkEvent; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkgeteventstatus* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFNVksetevent* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFNVkresetevent* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFNVkcreatequerypool* = proc (device: VkDevice; pCreateInfo: ptr VkQueryPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pQueryPool: ptr VkQueryPool): VkResult {.cdecl.}
  PFNVkdestroyquerypool* = proc (device: VkDevice; queryPool: VkQueryPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkgetquerypoolresults* = proc (device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dataSize: csize; pData: pointer; stride: VkDeviceSize; flags: VkQueryResultFlags): VkResult {.cdecl.}
  PFNVkcreatebuffer* = proc (device: VkDevice; pCreateInfo: ptr VkBufferCreateInfo; pAllocator: ptr VkAllocationCallbacks; pBuffer: ptr VkBuffer): VkResult {.cdecl.}
  PFNVkdestroybuffer* = proc (device: VkDevice; buffer: VkBuffer; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreatebufferview* = proc (device: VkDevice; pCreateInfo: ptr VkBufferViewCreateInfo; pAllocator: ptr VkAllocationCallbacks; pView: ptr VkBufferView): VkResult {.cdecl.}
  PFNVkdestroybufferview* = proc (device: VkDevice; bufferView: VkBufferView; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreateimage* = proc (device: VkDevice; pCreateInfo: ptr VkImageCreateInfo; pAllocator: ptr VkAllocationCallbacks; pImage: ptr VkImage): VkResult {.cdecl.}
  PFNVkdestroyimage* = proc (device: VkDevice; image: VkImage; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkgetimagesubresourcelayout* = proc (device: VkDevice; image: VkImage; pSubresource: ptr VkImageSubresource; pLayout: ptr VkSubresourceLayout) {.cdecl.}
  PFNVkcreateimageview* = proc (device: VkDevice; pCreateInfo: ptr VkImageViewCreateInfo; pAllocator: ptr VkAllocationCallbacks; pView: ptr VkImageView): VkResult {.cdecl.}
  PFNVkdestroyimageview* = proc (device: VkDevice; imageView: VkImageView; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreateshadermodule* = proc (device: VkDevice; pCreateInfo: ptr VkShaderModuleCreateInfo; pAllocator: ptr VkAllocationCallbacks; pShaderModule: ptr VkShaderModule): VkResult {.cdecl.}
  PFNVkdestroyshadermodule* = proc (device: VkDevice; shaderModule: VkShaderModule; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreatepipelinecache* = proc (device: VkDevice; pCreateInfo: ptr VkPipelineCacheCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelineCache: ptr VkPipelineCache): VkResult {.cdecl.}
  PFNVkdestroypipelinecache* = proc (device: VkDevice; pipelineCache: VkPipelineCache; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkgetpipelinecachedata* = proc (device: VkDevice; pipelineCache: VkPipelineCache; pDataSize: ptr csize; pData: pointer): VkResult {.cdecl.}
  PFNVkmergepipelinecaches* = proc (device: VkDevice; dstCache: VkPipelineCache; srcCacheCount: uint32; pSrcCaches: ptr VkPipelineCache): VkResult {.cdecl.}
  PFNVkcreategraphicspipelines* = proc (device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkGraphicsPipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFNVkcreatecomputepipelines* = proc (device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkComputePipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFNVkdestroypipeline* = proc (device: VkDevice; pipeline: VkPipeline; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreatepipelinelayout* = proc (device: VkDevice; pCreateInfo: ptr VkPipelineLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelineLayout: ptr VkPipelineLayout): VkResult {.cdecl.}
  PFNVkdestroypipelinelayout* = proc (device: VkDevice; pipelineLayout: VkPipelineLayout; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreatesampler* = proc (device: VkDevice; pCreateInfo: ptr VkSamplerCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSampler: ptr VkSampler): VkResult {.cdecl.}
  PFNVkdestroysampler* = proc (device: VkDevice; sampler: VkSampler; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreatedescriptorsetlayout* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSetLayout: ptr VkDescriptorSetLayout): VkResult {.cdecl.}
  PFNVkdestroydescriptorsetlayout* = proc (device: VkDevice; descriptorSetLayout: VkDescriptorSetLayout; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreatedescriptorpool* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDescriptorPool: ptr VkDescriptorPool): VkResult {.cdecl.}
  PFNVkdestroydescriptorpool* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkresetdescriptorpool* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; flags: VkDescriptorPoolResetFlags): VkResult {.cdecl.}
  PFNVkallocatedescriptorsets* = proc (device: VkDevice; pAllocateInfo: ptr VkDescriptorSetAllocateInfo; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl.}
  PFNVkfreedescriptorsets* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl.}
  PFNVkupdatedescriptorsets* = proc (device: VkDevice; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet; descriptorCopyCount: uint32; pDescriptorCopies: ptr VkCopyDescriptorSet) {.cdecl.}
  PFNVkcreateframebuffer* = proc (device: VkDevice; pCreateInfo: ptr VkFramebufferCreateInfo; pAllocator: ptr VkAllocationCallbacks; pFramebuffer: ptr VkFramebuffer): VkResult {.cdecl.}
  PFNVkdestroyframebuffer* = proc (device: VkDevice; framebuffer: VkFramebuffer; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreaterenderpass* = proc (device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo; pAllocator: ptr VkAllocationCallbacks; pRenderPass: ptr VkRenderPass): VkResult {.cdecl.}
  PFNVkdestroyrenderpass* = proc (device: VkDevice; renderPass: VkRenderPass; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkgetrenderareagranularity* = proc (device: VkDevice; renderPass: VkRenderPass; pGranularity: ptr VkExtent2D) {.cdecl.}
  PFNVkcreatecommandpool* = proc (device: VkDevice; pCreateInfo: ptr VkCommandPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pCommandPool: ptr VkCommandPool): VkResult {.cdecl.}
  PFNVkdestroycommandpool* = proc (device: VkDevice; commandPool: VkCommandPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkresetcommandpool* = proc (device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolResetFlags): VkResult {.cdecl.}
  PFNVkallocatecommandbuffers* = proc (device: VkDevice; pAllocateInfo: ptr VkCommandBufferAllocateInfo; pCommandBuffers: ptr VkCommandBuffer): VkResult {.cdecl.}
  PFNVkfreecommandbuffers* = proc (device: VkDevice; commandPool: VkCommandPool; commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer) {.cdecl.}
  PFNVkbegincommandbuffer* = proc (commandBuffer: VkCommandBuffer; pBeginInfo: ptr VkCommandBufferBeginInfo): VkResult {.cdecl.}
  PFNVkendcommandbuffer* = proc (commandBuffer: VkCommandBuffer): VkResult {.cdecl.}
  PFNVkresetcommandbuffer* = proc (commandBuffer: VkCommandBuffer; flags: VkCommandBufferResetFlags): VkResult {.cdecl.}
  PFNVkcmdbindpipeline* = proc (commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; pipeline: VkPipeline) {.cdecl.}
  PFNVkcmdsetviewport* = proc (commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewports: ptr VkViewport) {.cdecl.}
  PFNVkcmdsetscissor* = proc (commandBuffer: VkCommandBuffer; firstScissor: uint32; scissorCount: uint32; pScissors: ptr VkRect2D) {.cdecl.}
  PFNVkcmdsetlinewidth* = proc (commandBuffer: VkCommandBuffer; lineWidth: cfloat) {.cdecl.}
  PFNVkcmdsetdepthbias* = proc (commandBuffer: VkCommandBuffer; depthBiasConstantFactor: cfloat; depthBiasClamp: cfloat; depthBiasSlopeFactor: cfloat) {.cdecl.}
  PFNVkcmdsetblendconstants* = proc (commandBuffer: VkCommandBuffer; blendConstants: array[4, cfloat]) {.cdecl.}
  PFNVkcmdsetdepthbounds* = proc (commandBuffer: VkCommandBuffer; minDepthBounds: cfloat; maxDepthBounds: cfloat) {.cdecl.}
  PFNVkcmdsetstencilcomparemask* = proc (commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; compareMask: uint32) {.cdecl.}
  PFNVkcmdsetstencilwritemask* = proc (commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; writeMask: uint32) {.cdecl.}
  PFNVkcmdsetstencilreference* = proc (commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; reference: uint32) {.cdecl.}
  PFNVkcmdbinddescriptorsets* = proc (commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout; firstSet: uint32; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet; dynamicOffsetCount: uint32; pDynamicOffsets: ptr uint32) {.cdecl.}
  PFNVkcmdbindindexbuffer* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; indexType: VkIndexType) {.cdecl.}
  PFNVkcmdbindvertexbuffers* = proc (commandBuffer: VkCommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer; pOffsets: ptr VkDeviceSize) {.cdecl.}
  PFNVkcmddraw* = proc (commandBuffer: VkCommandBuffer; vertexCount: uint32; instanceCount: uint32; firstVertex: uint32; firstInstance: uint32) {.cdecl.}
  PFNVkcmddrawindexed* = proc (commandBuffer: VkCommandBuffer; indexCount: uint32; instanceCount: uint32; firstIndex: uint32; vertexOffset: int32; firstInstance: uint32) {.cdecl.}
  PFNVkcmddrawindirect* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcmddrawindexedindirect* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcmddispatch* = proc (commandBuffer: VkCommandBuffer; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl.}
  PFNVkcmddispatchindirect* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize) {.cdecl.}
  PFNVkcmdcopybuffer* = proc (commandBuffer: VkCommandBuffer; srcBuffer: VkBuffer; dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferCopy) {.cdecl.}
  PFNVkcmdcopyimage* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageCopy) {.cdecl.}
  PFNVkcmdblitimage* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageBlit; filter: VkFilter) {.cdecl.}
  PFNVkcmdcopybuffertoimage* = proc (commandBuffer: VkCommandBuffer; srcBuffer: VkBuffer; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkBufferImageCopy) {.cdecl.}
  PFNVkcmdcopyimagetobuffer* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferImageCopy) {.cdecl.}
  PFNVkcmdupdatebuffer* = proc (commandBuffer: VkCommandBuffer; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; dataSize: VkDeviceSize; pData: pointer) {.cdecl.}
  PFNVkcmdfillbuffer* = proc (commandBuffer: VkCommandBuffer; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; size: VkDeviceSize; data: uint32) {.cdecl.}
  PFNVkcmdclearcolorimage* = proc (commandBuffer: VkCommandBuffer; image: VkImage; imageLayout: VkImageLayout; pColor: ptr VkClearColorValue; rangeCount: uint32; pRanges: ptr VkImageSubresourceRange) {.cdecl.}
  PFNVkcmdcleardepthstencilimage* = proc (commandBuffer: VkCommandBuffer; image: VkImage; imageLayout: VkImageLayout; pDepthStencil: ptr VkClearDepthStencilValue; rangeCount: uint32; pRanges: ptr VkImageSubresourceRange) {.cdecl.}
  PFNVkcmdclearattachments* = proc (commandBuffer: VkCommandBuffer; attachmentCount: uint32; pAttachments: ptr VkClearAttachment; rectCount: uint32; pRects: ptr VkClearRect) {.cdecl.}
  PFNVkcmdresolveimage* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageResolve) {.cdecl.}
  PFNVkcmdsetevent* = proc (commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags) {.cdecl.}
  PFNVkcmdresetevent* = proc (commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags) {.cdecl.}
  PFNVkcmdwaitevents* = proc (commandBuffer: VkCommandBuffer; eventCount: uint32; pEvents: ptr VkEvent; srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr VkBufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr VkImageMemoryBarrier) {.cdecl.}
  PFNVkcmdpipelinebarrier* = proc (commandBuffer: VkCommandBuffer; srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags; dependencyFlags: VkDependencyFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr VkBufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr VkImageMemoryBarrier) {.cdecl.}
  PFNVkcmdbeginquery* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32; flags: VkQueryControlFlags) {.cdecl.}
  PFNVkcmdendquery* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32) {.cdecl.}
  PFNVkcmdresetquerypool* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32) {.cdecl.}
  PFNVkcmdwritetimestamp* = proc (commandBuffer: VkCommandBuffer; pipelineStage: VkPipelineStageFlagBits; queryPool: VkQueryPool; query: uint32) {.cdecl.}
  PFNVkcmdcopyquerypoolresults* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; stride: VkDeviceSize; flags: VkQueryResultFlags) {.cdecl.}
  PFNVkcmdpushconstants* = proc (commandBuffer: VkCommandBuffer; layout: VkPipelineLayout; stageFlags: VkShaderStageFlags; offset: uint32; size: uint32; pValues: pointer) {.cdecl.}
  PFNVkcmdbeginrenderpass* = proc (commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; contents: VkSubpassContents) {.cdecl.}
  PFNVkcmdnextsubpass* = proc (commandBuffer: VkCommandBuffer; contents: VkSubpassContents) {.cdecl.}
  PFNVkcmdendrenderpass* = proc (commandBuffer: VkCommandBuffer) {.cdecl.}
  PFNVkcmdexecutecommands* = proc (commandBuffer: VkCommandBuffer; commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer) {.cdecl.}

const
  vkPipelineCacheHeaderVersionOne* = 1.VkPipelineCacheHeaderVersion
  vkPipelineCacheHeaderVersionBeginRange: VkPipelineCacheHeaderVersion = vkPipelineCacheHeaderVersionOne
  vkPipelineCacheHeaderVersionEndRange: VkPipelineCacheHeaderVersion = vkPipelineCacheHeaderVersionOne
  vkPipelineCacheHeaderVersionRangeSize: VkPipelineCacheHeaderVersion = (vkPipelineCacheHeaderVersionOne - vkPipelineCacheHeaderVersionOne + 1)
  vkPipelineCacheHeaderVersionMaxEnum* = 0x7FFFFFFF.VkPipelineCacheHeaderVersion

const
  vkErrorNotPermittedExt* = -1000174001.VkResult
  vkErrorOutOfPoolMemoryKhr: VkResult = vkErrorOutOfPoolMemory
  vkErrorInvalidExternalHandleKhr: VkResult = vkErrorInvalidExternalHandle
  vkResultBeginRange: VkResult = vkErrorFragmentedPool
  vkResultEndRange: VkResult = vkIncomplete
  vkResultRangeSize: VkResult = (vkIncomplete - vkErrorFragmentedPool + 1)
  vkErrorFragmentationExt* = -1000161000.VkResult
  vkErrorInvalidDrmFormatModifierPlaneLayoutExt* = -1000158000.VkResult
  vkErrorInvalidExternalHandle* = -1000072003.VkResult
  vkErrorOutOfPoolMemory* = -1000069000.VkResult
  vkErrorInvalidShaderNv* = -1000012000.VkResult
  vkErrorValidationFailedExt* = -1000011001.VkResult
  vkErrorIncompatibleDisplayKhr* = -1000003001.VkResult
  vkErrorOutOfDateKhr* = -1000001004.VkResult
  vkErrorNativeWindowInUseKhr* = -1000000001.VkResult
  vkErrorSurfaceLostKhr* = -1000000000.VkResult
  vkErrorFragmentedPool* = -12.VkResult
  vkErrorFormatNotSupported* = -11.VkResult
  vkErrorTooManyObjects* = -10.VkResult
  vkErrorIncompatibleDriver* = -9.VkResult
  vkErrorFeatureNotPresent* = -8.VkResult
  vkErrorExtensionNotPresent* = -7.VkResult
  vkErrorLayerNotPresent* = -6.VkResult
  vkErrorMemoryMapFailed* = -5.VkResult
  vkErrorDeviceLost* = -4.VkResult
  vkErrorInitializationFailed* = -3.VkResult
  vkErrorOutOfDeviceMemory* = -2.VkResult
  vkErrorOutOfHostMemory* = -1.VkResult
  vkSuccess* = 0.VkResult
  vkNotReady* = 1.VkResult
  vkTimeout* = 2.VkResult
  vkEventSet* = 3.VkResult
  vkEventReset* = 4.VkResult
  vkIncomplete* = 5.VkResult
  vkSuboptimalKhr* = 1000001003.VkResult
  vkResultMaxEnum* = 0x7FFFFFFF.VkResult

const
  vkStructureTypeApplicationInfo* = 0.VkStructureType
  vkStructureTypeInstanceCreateInfo* = 1.VkStructureType
  vkStructureTypeDeviceQueueCreateInfo* = 2.VkStructureType
  vkStructureTypeDeviceCreateInfo* = 3.VkStructureType
  vkStructureTypeSubmitInfo* = 4.VkStructureType
  vkStructureTypeMemoryAllocateInfo* = 5.VkStructureType
  vkStructureTypeMappedMemoryRange* = 6.VkStructureType
  vkStructureTypeBindSparseInfo* = 7.VkStructureType
  vkStructureTypeFenceCreateInfo* = 8.VkStructureType
  vkStructureTypeSemaphoreCreateInfo* = 9.VkStructureType
  vkStructureTypeEventCreateInfo* = 10.VkStructureType
  vkStructureTypeQueryPoolCreateInfo* = 11.VkStructureType
  vkStructureTypeBufferCreateInfo* = 12.VkStructureType
  vkStructureTypeBufferViewCreateInfo* = 13.VkStructureType
  vkStructureTypeImageCreateInfo* = 14.VkStructureType
  vkStructureTypeImageViewCreateInfo* = 15.VkStructureType
  vkStructureTypeShaderModuleCreateInfo* = 16.VkStructureType
  vkStructureTypePipelineCacheCreateInfo* = 17.VkStructureType
  vkStructureTypePipelineShaderStageCreateInfo* = 18.VkStructureType
  vkStructureTypePipelineVertexInputStateCreateInfo* = 19.VkStructureType
  vkStructureTypePipelineInputAssemblyStateCreateInfo* = 20.VkStructureType
  vkStructureTypePipelineTessellationStateCreateInfo* = 21.VkStructureType
  vkStructureTypePipelineViewportStateCreateInfo* = 22.VkStructureType
  vkStructureTypePipelineRasterizationStateCreateInfo* = 23.VkStructureType
  vkStructureTypePipelineMultisampleStateCreateInfo* = 24.VkStructureType
  vkStructureTypePipelineDepthStencilStateCreateInfo* = 25.VkStructureType
  vkStructureTypePipelineColorBlendStateCreateInfo* = 26.VkStructureType
  vkStructureTypePipelineDynamicStateCreateInfo* = 27.VkStructureType
  vkStructureTypeGraphicsPipelineCreateInfo* = 28.VkStructureType
  vkStructureTypeComputePipelineCreateInfo* = 29.VkStructureType
  vkStructureTypePipelineLayoutCreateInfo* = 30.VkStructureType
  vkStructureTypeSamplerCreateInfo* = 31.VkStructureType
  vkStructureTypeDescriptorSetLayoutCreateInfo* = 32.VkStructureType
  vkStructureTypeDescriptorPoolCreateInfo* = 33.VkStructureType
  vkStructureTypeDescriptorSetAllocateInfo* = 34.VkStructureType
  vkStructureTypeWriteDescriptorSet* = 35.VkStructureType
  vkStructureTypeCopyDescriptorSet* = 36.VkStructureType
  vkStructureTypeFramebufferCreateInfo* = 37.VkStructureType
  vkStructureTypeRenderPassCreateInfo* = 38.VkStructureType
  vkStructureTypeCommandPoolCreateInfo* = 39.VkStructureType
  vkStructureTypeCommandBufferAllocateInfo* = 40.VkStructureType
  vkStructureTypeCommandBufferInheritanceInfo* = 41.VkStructureType
  vkStructureTypeCommandBufferBeginInfo* = 42.VkStructureType
  vkStructureTypeRenderPassBeginInfo* = 43.VkStructureType
  vkStructureTypeBufferMemoryBarrier* = 44.VkStructureType
  vkStructureTypeImageMemoryBarrier* = 45.VkStructureType
  vkStructureTypeMemoryBarrier* = 46.VkStructureType
  vkStructureTypeLoaderInstanceCreateInfo* = 47.VkStructureType
  vkStructureTypeLoaderDeviceCreateInfo* = 48.VkStructureType
  vkStructureTypeSwapchainCreateInfoKhr* = 1000001000.VkStructureType
  vkStructureTypePresentInfoKhr* = 1000001001.VkStructureType
  vkStructureTypeDisplayModeCreateInfoKhr* = 1000002000.VkStructureType
  vkStructureTypeDisplaySurfaceCreateInfoKhr* = 1000002001.VkStructureType
  vkStructureTypeDisplayPresentInfoKhr* = 1000003000.VkStructureType
  vkStructureTypeXlibSurfaceCreateInfoKhr* = 1000004000.VkStructureType
  vkStructureTypeXcbSurfaceCreateInfoKhr* = 1000005000.VkStructureType
  vkStructureTypeWaylandSurfaceCreateInfoKhr* = 1000006000.VkStructureType
  vkStructureTypeAndroidSurfaceCreateInfoKhr* = 1000008000.VkStructureType
  vkStructureTypeWin32SurfaceCreateInfoKhr* = 1000009000.VkStructureType
  vkStructureTypeDebugReportCallbackCreateInfoExt* = 1000011000.VkStructureType
  vkStructureTypePipelineRasterizationStateRasterizationOrderAmd* = 1000018000.VkStructureType
  vkStructureTypeDebugMarkerObjectNameInfoExt* = 1000022000.VkStructureType
  vkStructureTypeDebugMarkerObjectTagInfoExt* = 1000022001.VkStructureType
  vkStructureTypeDebugMarkerMarkerInfoExt* = 1000022002.VkStructureType
  vkStructureTypeDedicatedAllocationImageCreateInfoNv* = 1000026000.VkStructureType
  vkStructureTypeDedicatedAllocationBufferCreateInfoNv* = 1000026001.VkStructureType
  vkStructureTypeDedicatedAllocationMemoryAllocateInfoNv* = 1000026002.VkStructureType
  vkStructureTypePhysicalDeviceTransformFeedbackFeaturesExt* = 1000028000.VkStructureType
  vkStructureTypePhysicalDeviceTransformFeedbackPropertiesExt* = 1000028001.VkStructureType
  vkStructureTypePipelineRasterizationStateStreamCreateInfoExt* = 1000028002.VkStructureType
  vkStructureTypeTextureLodGatherFormatPropertiesAmd* = 1000041000.VkStructureType
  vkStructureTypePhysicalDeviceCornerSampledImageFeaturesNv* = 1000050000.VkStructureType
  vkStructureTypeRenderPassMultiviewCreateInfo* = 1000053000.VkStructureType
  vkStructureTypePhysicalDeviceMultiviewFeatures* = 1000053001.VkStructureType
  vkStructureTypePhysicalDeviceMultiviewProperties* = 1000053002.VkStructureType
  vkStructureTypeExternalMemoryImageCreateInfoNv* = 1000056000.VkStructureType
  vkStructureTypeExportMemoryAllocateInfoNv* = 1000056001.VkStructureType
  vkStructureTypeImportMemoryWin32HandleInfoNv* = 1000057000.VkStructureType
  vkStructureTypeExportMemoryWin32HandleInfoNv* = 1000057001.VkStructureType
  vkStructureTypeWin32KeyedMutexAcquireReleaseInfoNv* = 1000058000.VkStructureType
  vkStructureTypePhysicalDeviceFeatures_2* = 1000059000.VkStructureType
  vkStructureTypePhysicalDeviceProperties_2* = 1000059001.VkStructureType
  vkStructureTypeFormatProperties_2* = 1000059002.VkStructureType
  vkStructureTypeImageFormatProperties_2* = 1000059003.VkStructureType
  vkStructureTypePhysicalDeviceImageFormatInfo_2* = 1000059004.VkStructureType
  vkStructureTypeQueueFamilyProperties_2* = 1000059005.VkStructureType
  vkStructureTypePhysicalDeviceMemoryProperties_2* = 1000059006.VkStructureType
  vkStructureTypeSparseImageFormatProperties_2* = 1000059007.VkStructureType
  vkStructureTypePhysicalDeviceSparseImageFormatInfo_2* = 1000059008.VkStructureType
  vkStructureTypeMemoryAllocateFlagsInfo* = 1000060000.VkStructureType
  vkStructureTypeDeviceGroupRenderPassBeginInfo* = 1000060003.VkStructureType
  vkStructureTypeDeviceGroupCommandBufferBeginInfo* = 1000060004.VkStructureType
  vkStructureTypeDeviceGroupSubmitInfo* = 1000060005.VkStructureType
  vkStructureTypeDeviceGroupBindSparseInfo* = 1000060006.VkStructureType
  vkStructureTypeDeviceGroupPresentCapabilitiesKhr* = 1000060007.VkStructureType
  vkStructureTypeImageSwapchainCreateInfoKhr* = 1000060008.VkStructureType
  vkStructureTypeBindImageMemorySwapchainInfoKhr* = 1000060009.VkStructureType
  vkStructureTypeAcquireNextImageInfoKhr* = 1000060010.VkStructureType
  vkStructureTypeDeviceGroupPresentInfoKhr* = 1000060011.VkStructureType
  vkStructureTypeDeviceGroupSwapchainCreateInfoKhr* = 1000060012.VkStructureType
  vkStructureTypeBindBufferMemoryDeviceGroupInfo* = 1000060013.VkStructureType
  vkStructureTypeBindImageMemoryDeviceGroupInfo* = 1000060014.VkStructureType
  vkStructureTypeValidationFlagsExt* = 1000061000.VkStructureType
  vkStructureTypeViSurfaceCreateInfoNn* = 1000062000.VkStructureType
  vkStructureTypePhysicalDeviceShaderDrawParameterFeatures* = 1000063000.VkStructureType
  vkStructureTypeImageViewAstcDecodeModeExt* = 1000067000.VkStructureType
  vkStructureTypePhysicalDeviceAstcDecodeFeaturesExt* = 1000067001.VkStructureType
  vkStructureTypePhysicalDeviceGroupProperties* = 1000070000.VkStructureType
  vkStructureTypeDeviceGroupDeviceCreateInfo* = 1000070001.VkStructureType
  vkStructureTypePhysicalDeviceExternalImageFormatInfo* = 1000071000.VkStructureType
  vkStructureTypeExternalImageFormatProperties* = 1000071001.VkStructureType
  vkStructureTypePhysicalDeviceExternalBufferInfo* = 1000071002.VkStructureType
  vkStructureTypeExternalBufferProperties* = 1000071003.VkStructureType
  vkStructureTypePhysicalDeviceIdProperties* = 1000071004.VkStructureType
  vkStructureTypeExternalMemoryBufferCreateInfo* = 1000072000.VkStructureType
  vkStructureTypeExternalMemoryImageCreateInfo* = 1000072001.VkStructureType
  vkStructureTypeExportMemoryAllocateInfo* = 1000072002.VkStructureType
  vkStructureTypeImportMemoryWin32HandleInfoKhr* = 1000073000.VkStructureType
  vkStructureTypeExportMemoryWin32HandleInfoKhr* = 1000073001.VkStructureType
  vkStructureTypeMemoryWin32HandlePropertiesKhr* = 1000073002.VkStructureType
  vkStructureTypeMemoryGetWin32HandleInfoKhr* = 1000073003.VkStructureType
  vkStructureTypeImportMemoryFdInfoKhr* = 1000074000.VkStructureType
  vkStructureTypeMemoryFdPropertiesKhr* = 1000074001.VkStructureType
  vkStructureTypeMemoryGetFdInfoKhr* = 1000074002.VkStructureType
  vkStructureTypeWin32KeyedMutexAcquireReleaseInfoKhr* = 1000075000.VkStructureType
  vkStructureTypePhysicalDeviceExternalSemaphoreInfo* = 1000076000.VkStructureType
  vkStructureTypeExternalSemaphoreProperties* = 1000076001.VkStructureType
  vkStructureTypeExportSemaphoreCreateInfo* = 1000077000.VkStructureType
  vkStructureTypeImportSemaphoreWin32HandleInfoKhr* = 1000078000.VkStructureType
  vkStructureTypeExportSemaphoreWin32HandleInfoKhr* = 1000078001.VkStructureType
  vkStructureTypeD3D12FenceSubmitInfoKhr* = 1000078002.VkStructureType
  vkStructureTypeSemaphoreGetWin32HandleInfoKhr* = 1000078003.VkStructureType
  vkStructureTypeImportSemaphoreFdInfoKhr* = 1000079000.VkStructureType
  vkStructureTypeSemaphoreGetFdInfoKhr* = 1000079001.VkStructureType
  vkStructureTypePhysicalDevicePushDescriptorPropertiesKhr* = 1000080000.VkStructureType
  vkStructureTypeCommandBufferInheritanceConditionalRenderingInfoExt* = 1000081000.VkStructureType
  vkStructureTypePhysicalDeviceConditionalRenderingFeaturesExt* = 1000081001.VkStructureType
  vkStructureTypeConditionalRenderingBeginInfoExt* = 1000081002.VkStructureType
  vkStructureTypePhysicalDevice_16BITStorageFeatures* = 1000083000.VkStructureType
  vkStructureTypePresentRegionsKhr* = 1000084000.VkStructureType
  vkStructureTypeDescriptorUpdateTemplateCreateInfo* = 1000085000.VkStructureType
  vkStructureTypeObjectTableCreateInfoNvx* = 1000086000.VkStructureType
  vkStructureTypeIndirectCommandsLayoutCreateInfoNvx* = 1000086001.VkStructureType
  vkStructureTypeCmdProcessCommandsInfoNvx* = 1000086002.VkStructureType
  vkStructureTypeCmdReserveSpaceForCommandsInfoNvx* = 1000086003.VkStructureType
  vkStructureTypeDeviceGeneratedCommandsLimitsNvx* = 1000086004.VkStructureType
  vkStructureTypeDeviceGeneratedCommandsFeaturesNvx* = 1000086005.VkStructureType
  vkStructureTypePipelineViewportWScalingStateCreateInfoNv* = 1000087000.VkStructureType
  vkStructureTypeSurfaceCapabilities_2Ext* = 1000090000.VkStructureType
  vkStructureTypeDisplayPowerInfoExt* = 1000091000.VkStructureType
  vkStructureTypeDeviceEventInfoExt* = 1000091001.VkStructureType
  vkStructureTypeDisplayEventInfoExt* = 1000091002.VkStructureType
  vkStructureTypeSwapchainCounterCreateInfoExt* = 1000091003.VkStructureType
  vkStructureTypePresentTimesInfoGoogle* = 1000092000.VkStructureType
  vkStructureTypePhysicalDeviceSubgroupProperties* = 1000094000.VkStructureType
  vkStructureTypePhysicalDeviceMultiviewPerViewAttributesPropertiesNvx* = 1000097000.VkStructureType
  vkStructureTypePipelineViewportSwizzleStateCreateInfoNv* = 1000098000.VkStructureType
  vkStructureTypePhysicalDeviceDiscardRectanglePropertiesExt* = 1000099000.VkStructureType
  vkStructureTypePipelineDiscardRectangleStateCreateInfoExt* = 1000099001.VkStructureType
  vkStructureTypePhysicalDeviceConservativeRasterizationPropertiesExt* = 1000101000.VkStructureType
  vkStructureTypePipelineRasterizationConservativeStateCreateInfoExt* = 1000101001.VkStructureType
  vkStructureTypeHdrMetadataExt* = 1000105000.VkStructureType
  vkStructureTypeAttachmentDescription_2Khr* = 1000109000.VkStructureType
  vkStructureTypeAttachmentReference_2Khr* = 1000109001.VkStructureType
  vkStructureTypeSubpassDescription_2Khr* = 1000109002.VkStructureType
  vkStructureTypeSubpassDependency_2Khr* = 1000109003.VkStructureType
  vkStructureTypeRenderPassCreateInfo_2Khr* = 1000109004.VkStructureType
  vkStructureTypeSubpassBeginInfoKhr* = 1000109005.VkStructureType
  vkStructureTypeSubpassEndInfoKhr* = 1000109006.VkStructureType
  vkStructureTypeSharedPresentSurfaceCapabilitiesKhr* = 1000111000.VkStructureType
  vkStructureTypePhysicalDeviceExternalFenceInfo* = 1000112000.VkStructureType
  vkStructureTypeExternalFenceProperties* = 1000112001.VkStructureType
  vkStructureTypeExportFenceCreateInfo* = 1000113000.VkStructureType
  vkStructureTypeImportFenceWin32HandleInfoKhr* = 1000114000.VkStructureType
  vkStructureTypeExportFenceWin32HandleInfoKhr* = 1000114001.VkStructureType
  vkStructureTypeFenceGetWin32HandleInfoKhr* = 1000114002.VkStructureType
  vkStructureTypeImportFenceFdInfoKhr* = 1000115000.VkStructureType
  vkStructureTypeFenceGetFdInfoKhr* = 1000115001.VkStructureType
  vkStructureTypePhysicalDevicePointClippingProperties* = 1000117000.VkStructureType
  vkStructureTypeRenderPassInputAttachmentAspectCreateInfo* = 1000117001.VkStructureType
  vkStructureTypeImageViewUsageCreateInfo* = 1000117002.VkStructureType
  vkStructureTypePipelineTessellationDomainOriginStateCreateInfo* = 1000117003.VkStructureType
  vkStructureTypePhysicalDeviceSurfaceInfo_2Khr* = 1000119000.VkStructureType
  vkStructureTypeSurfaceCapabilities_2Khr* = 1000119001.VkStructureType
  vkStructureTypeSurfaceFormat_2Khr* = 1000119002.VkStructureType
  vkStructureTypePhysicalDeviceVariablePointerFeatures* = 1000120000.VkStructureType
  vkStructureTypeDisplayProperties_2Khr* = 1000121000.VkStructureType
  vkStructureTypeDisplayPlaneProperties_2Khr* = 1000121001.VkStructureType
  vkStructureTypeDisplayModeProperties_2Khr* = 1000121002.VkStructureType
  vkStructureTypeDisplayPlaneInfo_2Khr* = 1000121003.VkStructureType
  vkStructureTypeDisplayPlaneCapabilities_2Khr* = 1000121004.VkStructureType
  vkStructureTypeIosSurfaceCreateInfoMvk* = 1000122000.VkStructureType
  vkStructureTypeMacosSurfaceCreateInfoMvk* = 1000123000.VkStructureType
  vkStructureTypeMemoryDedicatedRequirements* = 1000127000.VkStructureType
  vkStructureTypeMemoryDedicatedAllocateInfo* = 1000127001.VkStructureType
  vkStructureTypeDebugUtilsObjectNameInfoExt* = 1000128000.VkStructureType
  vkStructureTypeDebugUtilsObjectTagInfoExt* = 1000128001.VkStructureType
  vkStructureTypeDebugUtilsLabelExt* = 1000128002.VkStructureType
  vkStructureTypeDebugUtilsMessengerCallbackDataExt* = 1000128003.VkStructureType
  vkStructureTypeDebugUtilsMessengerCreateInfoExt* = 1000128004.VkStructureType
  vkStructureTypeAndroidHardwareBufferUsageAndroid* = 1000129000.VkStructureType
  vkStructureTypeAndroidHardwareBufferPropertiesAndroid* = 1000129001.VkStructureType
  vkStructureTypeAndroidHardwareBufferFormatPropertiesAndroid* = 1000129002.VkStructureType
  vkStructureTypeImportAndroidHardwareBufferInfoAndroid* = 1000129003.VkStructureType
  vkStructureTypeMemoryGetAndroidHardwareBufferInfoAndroid* = 1000129004.VkStructureType
  vkStructureTypeExternalFormatAndroid* = 1000129005.VkStructureType
  vkStructureTypePhysicalDeviceSamplerFilterMinmaxPropertiesExt* = 1000130000.VkStructureType
  vkStructureTypeSamplerReductionModeCreateInfoExt* = 1000130001.VkStructureType
  vkStructureTypePhysicalDeviceInlineUniformBlockFeaturesExt* = 1000138000.VkStructureType
  vkStructureTypePhysicalDeviceInlineUniformBlockPropertiesExt* = 1000138001.VkStructureType
  vkStructureTypeWriteDescriptorSetInlineUniformBlockExt* = 1000138002.VkStructureType
  vkStructureTypeDescriptorPoolInlineUniformBlockCreateInfoExt* = 1000138003.VkStructureType
  vkStructureTypeSampleLocationsInfoExt* = 1000143000.VkStructureType
  vkStructureTypeRenderPassSampleLocationsBeginInfoExt* = 1000143001.VkStructureType
  vkStructureTypePipelineSampleLocationsStateCreateInfoExt* = 1000143002.VkStructureType
  vkStructureTypePhysicalDeviceSampleLocationsPropertiesExt* = 1000143003.VkStructureType
  vkStructureTypeMultisamplePropertiesExt* = 1000143004.VkStructureType
  vkStructureTypeProtectedSubmitInfo* = 1000145000.VkStructureType
  vkStructureTypePhysicalDeviceProtectedMemoryFeatures* = 1000145001.VkStructureType
  vkStructureTypePhysicalDeviceProtectedMemoryProperties* = 1000145002.VkStructureType
  vkStructureTypeDeviceQueueInfo_2* = 1000145003.VkStructureType
  vkStructureTypeBufferMemoryRequirementsInfo_2* = 1000146000.VkStructureType
  vkStructureTypeImageMemoryRequirementsInfo_2* = 1000146001.VkStructureType
  vkStructureTypeImageSparseMemoryRequirementsInfo_2* = 1000146002.VkStructureType
  vkStructureTypeMemoryRequirements_2* = 1000146003.VkStructureType
  vkStructureTypeSparseImageMemoryRequirements_2* = 1000146004.VkStructureType
  vkStructureTypeImageFormatListCreateInfoKhr* = 1000147000.VkStructureType
  vkStructureTypePhysicalDeviceBlendOperationAdvancedFeaturesExt* = 1000148000.VkStructureType
  vkStructureTypePhysicalDeviceBlendOperationAdvancedPropertiesExt* = 1000148001.VkStructureType
  vkStructureTypePipelineColorBlendAdvancedStateCreateInfoExt* = 1000148002.VkStructureType
  vkStructureTypePipelineCoverageToColorStateCreateInfoNv* = 1000149000.VkStructureType
  vkStructureTypePipelineCoverageModulationStateCreateInfoNv* = 1000152000.VkStructureType
  vkStructureTypeSamplerYcbcrConversionCreateInfo* = 1000156000.VkStructureType
  vkStructureTypeSamplerYcbcrConversionInfo* = 1000156001.VkStructureType
  vkStructureTypeBindImagePlaneMemoryInfo* = 1000156002.VkStructureType
  vkStructureTypeImagePlaneMemoryRequirementsInfo* = 1000156003.VkStructureType
  vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeatures* = 1000156004.VkStructureType
  vkStructureTypeSamplerYcbcrConversionImageFormatProperties* = 1000156005.VkStructureType
  vkStructureTypeBindBufferMemoryInfo* = 1000157000.VkStructureType
  vkStructureTypeBindImageMemoryInfo* = 1000157001.VkStructureType
  vkStructureTypeDrmFormatModifierPropertiesListExt* = 1000158000.VkStructureType
  vkStructureTypeDrmFormatModifierPropertiesExt* = 1000158001.VkStructureType
  vkStructureTypePhysicalDeviceImageDrmFormatModifierInfoExt* = 1000158002.VkStructureType
  vkStructureTypeImageDrmFormatModifierListCreateInfoExt* = 1000158003.VkStructureType
  vkStructureTypeImageDrmFormatModifierExplicitCreateInfoExt* = 1000158004.VkStructureType
  vkStructureTypeImageDrmFormatModifierPropertiesExt* = 1000158005.VkStructureType
  vkStructureTypeValidationCacheCreateInfoExt* = 1000160000.VkStructureType
  vkStructureTypeShaderModuleValidationCacheCreateInfoExt* = 1000160001.VkStructureType
  vkStructureTypeDescriptorSetLayoutBindingFlagsCreateInfoExt* = 1000161000.VkStructureType
  vkStructureTypePhysicalDeviceDescriptorIndexingFeaturesExt* = 1000161001.VkStructureType
  vkStructureTypePhysicalDeviceDescriptorIndexingPropertiesExt* = 1000161002.VkStructureType
  vkStructureTypeDescriptorSetVariableDescriptorCountAllocateInfoExt* = 1000161003.VkStructureType
  vkStructureTypeDescriptorSetVariableDescriptorCountLayoutSupportExt* = 1000161004.VkStructureType
  vkStructureTypePipelineViewportShadingRateImageStateCreateInfoNv* = 1000164000.VkStructureType
  vkStructureTypePhysicalDeviceShadingRateImageFeaturesNv* = 1000164001.VkStructureType
  vkStructureTypePhysicalDeviceShadingRateImagePropertiesNv* = 1000164002.VkStructureType
  vkStructureTypePipelineViewportCoarseSampleOrderStateCreateInfoNv* = 1000164005.VkStructureType
  vkStructureTypeRayTracingPipelineCreateInfoNv* = 1000165000.VkStructureType
  vkStructureTypeAccelerationStructureCreateInfoNv* = 1000165001.VkStructureType
  vkStructureTypeGeometryNv* = 1000165003.VkStructureType
  vkStructureTypeGeometryTrianglesNv* = 1000165004.VkStructureType
  vkStructureTypeGeometryAabbNv* = 1000165005.VkStructureType
  vkStructureTypeBindAccelerationStructureMemoryInfoNv* = 1000165006.VkStructureType
  vkStructureTypeWriteDescriptorSetAccelerationStructureNv* = 1000165007.VkStructureType
  vkStructureTypeAccelerationStructureMemoryRequirementsInfoNv* = 1000165008.VkStructureType
  vkStructureTypePhysicalDeviceRayTracingPropertiesNv* = 1000165009.VkStructureType
  vkStructureTypeRayTracingShaderGroupCreateInfoNv* = 1000165011.VkStructureType
  vkStructureTypeAccelerationStructureInfoNv* = 1000165012.VkStructureType
  vkStructureTypePhysicalDeviceRepresentativeFragmentTestFeaturesNv* = 1000166000.VkStructureType
  vkStructureTypePipelineRepresentativeFragmentTestStateCreateInfoNv* = 1000166001.VkStructureType
  vkStructureTypePhysicalDeviceMaintenance_3Properties* = 1000168000.VkStructureType
  vkStructureTypeDescriptorSetLayoutSupport* = 1000168001.VkStructureType
  vkStructureTypeDeviceQueueGlobalPriorityCreateInfoExt* = 1000174000.VkStructureType
  vkStructureTypePhysicalDevice_8BITStorageFeaturesKhr* = 1000177000.VkStructureType
  vkStructureTypeImportMemoryHostPointerInfoExt* = 1000178000.VkStructureType
  vkStructureTypeMemoryHostPointerPropertiesExt* = 1000178001.VkStructureType
  vkStructureTypePhysicalDeviceExternalMemoryHostPropertiesExt* = 1000178002.VkStructureType
  vkStructureTypePhysicalDeviceShaderAtomicInt64FeaturesKhr* = 1000180000.VkStructureType
  vkStructureTypeCalibratedTimestampInfoExt* = 1000184000.VkStructureType
  vkStructureTypePhysicalDeviceShaderCorePropertiesAmd* = 1000185000.VkStructureType
  vkStructureTypeDeviceMemoryOverallocationCreateInfoAmd* = 1000189000.VkStructureType
  vkStructureTypePhysicalDeviceVertexAttributeDivisorPropertiesExt* = 1000190000.VkStructureType
  vkStructureTypePipelineVertexInputDivisorStateCreateInfoExt* = 1000190001.VkStructureType
  vkStructureTypePhysicalDeviceVertexAttributeDivisorFeaturesExt* = 1000190002.VkStructureType
  vkStructureTypePhysicalDeviceDriverPropertiesKhr* = 1000196000.VkStructureType
  vkStructureTypePhysicalDeviceComputeShaderDerivativesFeaturesNv* = 1000201000.VkStructureType
  vkStructureTypePhysicalDeviceMeshShaderFeaturesNv* = 1000202000.VkStructureType
  vkStructureTypePhysicalDeviceMeshShaderPropertiesNv* = 1000202001.VkStructureType
  vkStructureTypePhysicalDeviceFragmentShaderBarycentricFeaturesNv* = 1000203000.VkStructureType
  vkStructureTypePhysicalDeviceShaderImageFootprintFeaturesNv* = 1000204000.VkStructureType
  vkStructureTypePipelineViewportExclusiveScissorStateCreateInfoNv* = 1000205000.VkStructureType
  vkStructureTypePhysicalDeviceExclusiveScissorFeaturesNv* = 1000205002.VkStructureType
  vkStructureTypeCheckpointDataNv* = 1000206000.VkStructureType
  vkStructureTypeQueueFamilyCheckpointPropertiesNv* = 1000206001.VkStructureType
  vkStructureTypePhysicalDeviceVulkanMemoryModelFeaturesKhr* = 1000211000.VkStructureType
  vkStructureTypePhysicalDevicePciBusInfoPropertiesExt* = 1000212000.VkStructureType
  vkStructureTypeImagepipeSurfaceCreateInfoFuchsia* = 1000214000.VkStructureType
  vkStructureTypeDebugReportCreateInfoExt: VkStructureType = vkStructureTypeDebugReportCallbackCreateInfoExt
  vkStructureTypeRenderPassMultiviewCreateInfoKhr: VkStructureType = vkStructureTypeRenderPassMultiviewCreateInfo
  vkStructureTypePhysicalDeviceMultiviewFeaturesKhr: VkStructureType = vkStructureTypePhysicalDeviceMultiviewFeatures
  vkStructureTypePhysicalDeviceMultiviewPropertiesKhr: VkStructureType = vkStructureTypePhysicalDeviceMultiviewProperties
  vkStructureTypePhysicalDeviceFeatures_2Khr: VkStructureType = vkStructureTypePhysicalDeviceFeatures_2
  vkStructureTypePhysicalDeviceProperties_2Khr: VkStructureType = vkStructureTypePhysicalDeviceProperties_2
  vkStructureTypeFormatProperties_2Khr: VkStructureType = vkStructureTypeFormatProperties_2
  vkStructureTypeImageFormatProperties_2Khr: VkStructureType = vkStructureTypeImageFormatProperties_2
  vkStructureTypePhysicalDeviceImageFormatInfo_2Khr: VkStructureType = vkStructureTypePhysicalDeviceImageFormatInfo_2
  vkStructureTypeQueueFamilyProperties_2Khr: VkStructureType = vkStructureTypeQueueFamilyProperties_2
  vkStructureTypePhysicalDeviceMemoryProperties_2Khr: VkStructureType = vkStructureTypePhysicalDeviceMemoryProperties_2
  vkStructureTypeSparseImageFormatProperties_2Khr: VkStructureType = vkStructureTypeSparseImageFormatProperties_2
  vkStructureTypePhysicalDeviceSparseImageFormatInfo_2Khr: VkStructureType = vkStructureTypePhysicalDeviceSparseImageFormatInfo_2
  vkStructureTypeMemoryAllocateFlagsInfoKhr: VkStructureType = vkStructureTypeMemoryAllocateFlagsInfo
  vkStructureTypeDeviceGroupRenderPassBeginInfoKhr: VkStructureType = vkStructureTypeDeviceGroupRenderPassBeginInfo
  vkStructureTypeDeviceGroupCommandBufferBeginInfoKhr: VkStructureType = vkStructureTypeDeviceGroupCommandBufferBeginInfo
  vkStructureTypeDeviceGroupSubmitInfoKhr: VkStructureType = vkStructureTypeDeviceGroupSubmitInfo
  vkStructureTypeDeviceGroupBindSparseInfoKhr: VkStructureType = vkStructureTypeDeviceGroupBindSparseInfo
  vkStructureTypeBindBufferMemoryDeviceGroupInfoKhr: VkStructureType = vkStructureTypeBindBufferMemoryDeviceGroupInfo
  vkStructureTypeBindImageMemoryDeviceGroupInfoKhr: VkStructureType = vkStructureTypeBindImageMemoryDeviceGroupInfo
  vkStructureTypePhysicalDeviceGroupPropertiesKhr: VkStructureType = vkStructureTypePhysicalDeviceGroupProperties
  vkStructureTypeDeviceGroupDeviceCreateInfoKhr: VkStructureType = vkStructureTypeDeviceGroupDeviceCreateInfo
  vkStructureTypePhysicalDeviceExternalImageFormatInfoKhr: VkStructureType = vkStructureTypePhysicalDeviceExternalImageFormatInfo
  vkStructureTypeExternalImageFormatPropertiesKhr: VkStructureType = vkStructureTypeExternalImageFormatProperties
  vkStructureTypePhysicalDeviceExternalBufferInfoKhr: VkStructureType = vkStructureTypePhysicalDeviceExternalBufferInfo
  vkStructureTypeExternalBufferPropertiesKhr: VkStructureType = vkStructureTypeExternalBufferProperties
  vkStructureTypePhysicalDeviceIdPropertiesKhr: VkStructureType = vkStructureTypePhysicalDeviceIdProperties
  vkStructureTypeExternalMemoryBufferCreateInfoKhr: VkStructureType = vkStructureTypeExternalMemoryBufferCreateInfo
  vkStructureTypeExternalMemoryImageCreateInfoKhr: VkStructureType = vkStructureTypeExternalMemoryImageCreateInfo
  vkStructureTypeExportMemoryAllocateInfoKhr: VkStructureType = vkStructureTypeExportMemoryAllocateInfo
  vkStructureTypePhysicalDeviceExternalSemaphoreInfoKhr: VkStructureType = vkStructureTypePhysicalDeviceExternalSemaphoreInfo
  vkStructureTypeExternalSemaphorePropertiesKhr: VkStructureType = vkStructureTypeExternalSemaphoreProperties
  vkStructureTypeExportSemaphoreCreateInfoKhr: VkStructureType = vkStructureTypeExportSemaphoreCreateInfo
  vkStructureTypePhysicalDevice_16BITStorageFeaturesKhr: VkStructureType = vkStructureTypePhysicalDevice_16BITStorageFeatures
  vkStructureTypeDescriptorUpdateTemplateCreateInfoKhr: VkStructureType = vkStructureTypeDescriptorUpdateTemplateCreateInfo
  vkStructureTypePhysicalDeviceExternalFenceInfoKhr: VkStructureType = vkStructureTypePhysicalDeviceExternalFenceInfo
  vkStructureTypeExternalFencePropertiesKhr: VkStructureType = vkStructureTypeExternalFenceProperties
  vkStructureTypeExportFenceCreateInfoKhr: VkStructureType = vkStructureTypeExportFenceCreateInfo
  vkStructureTypePhysicalDevicePointClippingPropertiesKhr: VkStructureType = vkStructureTypePhysicalDevicePointClippingProperties
  vkStructureTypeRenderPassInputAttachmentAspectCreateInfoKhr: VkStructureType = vkStructureTypeRenderPassInputAttachmentAspectCreateInfo
  vkStructureTypeImageViewUsageCreateInfoKhr: VkStructureType = vkStructureTypeImageViewUsageCreateInfo
  vkStructureTypePipelineTessellationDomainOriginStateCreateInfoKhr: VkStructureType = vkStructureTypePipelineTessellationDomainOriginStateCreateInfo
  vkStructureTypePhysicalDeviceVariablePointerFeaturesKhr: VkStructureType = vkStructureTypePhysicalDeviceVariablePointerFeatures
  vkStructureTypeMemoryDedicatedRequirementsKhr: VkStructureType = vkStructureTypeMemoryDedicatedRequirements
  vkStructureTypeMemoryDedicatedAllocateInfoKhr: VkStructureType = vkStructureTypeMemoryDedicatedAllocateInfo
  vkStructureTypeBufferMemoryRequirementsInfo_2Khr: VkStructureType = vkStructureTypeBufferMemoryRequirementsInfo_2
  vkStructureTypeImageMemoryRequirementsInfo_2Khr: VkStructureType = vkStructureTypeImageMemoryRequirementsInfo_2
  vkStructureTypeImageSparseMemoryRequirementsInfo_2Khr: VkStructureType = vkStructureTypeImageSparseMemoryRequirementsInfo_2
  vkStructureTypeMemoryRequirements_2Khr: VkStructureType = vkStructureTypeMemoryRequirements_2
  vkStructureTypeSparseImageMemoryRequirements_2Khr: VkStructureType = vkStructureTypeSparseImageMemoryRequirements_2
  vkStructureTypeSamplerYcbcrConversionCreateInfoKhr: VkStructureType = vkStructureTypeSamplerYcbcrConversionCreateInfo
  vkStructureTypeSamplerYcbcrConversionInfoKhr: VkStructureType = vkStructureTypeSamplerYcbcrConversionInfo
  vkStructureTypeBindImagePlaneMemoryInfoKhr: VkStructureType = vkStructureTypeBindImagePlaneMemoryInfo
  vkStructureTypeImagePlaneMemoryRequirementsInfoKhr: VkStructureType = vkStructureTypeImagePlaneMemoryRequirementsInfo
  vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeaturesKhr: VkStructureType = vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeatures
  vkStructureTypeSamplerYcbcrConversionImageFormatPropertiesKhr: VkStructureType = vkStructureTypeSamplerYcbcrConversionImageFormatProperties
  vkStructureTypeBindBufferMemoryInfoKhr: VkStructureType = vkStructureTypeBindBufferMemoryInfo
  vkStructureTypeBindImageMemoryInfoKhr: VkStructureType = vkStructureTypeBindImageMemoryInfo
  vkStructureTypePhysicalDeviceMaintenance_3PropertiesKhr: VkStructureType = vkStructureTypePhysicalDeviceMaintenance_3Properties
  vkStructureTypeDescriptorSetLayoutSupportKhr: VkStructureType = vkStructureTypeDescriptorSetLayoutSupport
  vkStructureTypeBeginRange: VkStructureType = vkStructureTypeApplicationInfo
  vkStructureTypeEndRange: VkStructureType = vkStructureTypeLoaderDeviceCreateInfo
  vkStructureTypeRangeSize: VkStructureType = (vkStructureTypeLoaderDeviceCreateInfo - vkStructureTypeApplicationInfo + 1)
  vkStructureTypeMaxEnum* = 0x7FFFFFFF.VkStructureType

const
  vkSystemAllocationScopeCommand* = 0.VkSystemAllocationScope
  vkSystemAllocationScopeObject* = 1.VkSystemAllocationScope
  vkSystemAllocationScopeCache* = 2.VkSystemAllocationScope
  vkSystemAllocationScopeDevice* = 3.VkSystemAllocationScope
  vkSystemAllocationScopeInstance* = 4.VkSystemAllocationScope
  vkSystemAllocationScopeBeginRange: VkSystemAllocationScope = vkSystemAllocationScopeCommand
  vkSystemAllocationScopeEndRange: VkSystemAllocationScope = vkSystemAllocationScopeInstance
  vkSystemAllocationScopeRangeSize: VkSystemAllocationScope = (vkSystemAllocationScopeInstance - vkSystemAllocationScopeCommand + 1)
  vkSystemAllocationScopeMaxEnum* = 0x7FFFFFFF.VkSystemAllocationScope

const
  vkInternalAllocationTypeExecutable* = 0.VkInternalAllocationType
  vkInternalAllocationTypeBeginRange: VkInternalAllocationType = vkInternalAllocationTypeExecutable
  vkInternalAllocationTypeEndRange: VkInternalAllocationType = vkInternalAllocationTypeExecutable
  vkInternalAllocationTypeRangeSize: VkInternalAllocationType = (vkInternalAllocationTypeExecutable - vkInternalAllocationTypeExecutable + 1)
  vkInternalAllocationTypeMaxEnum* = 0x7FFFFFFF.VkInternalAllocationType

const
  vkFormatUndefined* = 0.VkFormat
  vkFormatR4G4UnormPack8* = 1.VkFormat
  vkFormatR4G4B4A4UnormPack16* = 2.VkFormat
  vkFormatB4G4R4A4UnormPack16* = 3.VkFormat
  vkFormatR5G6B5UnormPack16* = 4.VkFormat
  vkFormatB5G6R5UnormPack16* = 5.VkFormat
  vkFormatR5G5B5A1UnormPack16* = 6.VkFormat
  vkFormatB5G5R5A1UnormPack16* = 7.VkFormat
  vkFormatA1R5G5B5UnormPack16* = 8.VkFormat
  vkFormatR8Unorm* = 9.VkFormat
  vkFormatR8Snorm* = 10.VkFormat
  vkFormatR8Uscaled* = 11.VkFormat
  vkFormatR8Sscaled* = 12.VkFormat
  vkFormatR8Uint* = 13.VkFormat
  vkFormatR8Sint* = 14.VkFormat
  vkFormatR8Srgb* = 15.VkFormat
  vkFormatR8G8Unorm* = 16.VkFormat
  vkFormatR8G8Snorm* = 17.VkFormat
  vkFormatR8G8Uscaled* = 18.VkFormat
  vkFormatR8G8Sscaled* = 19.VkFormat
  vkFormatR8G8Uint* = 20.VkFormat
  vkFormatR8G8Sint* = 21.VkFormat
  vkFormatR8G8Srgb* = 22.VkFormat
  vkFormatR8G8B8Unorm* = 23.VkFormat
  vkFormatR8G8B8Snorm* = 24.VkFormat
  vkFormatR8G8B8Uscaled* = 25.VkFormat
  vkFormatR8G8B8Sscaled* = 26.VkFormat
  vkFormatR8G8B8Uint* = 27.VkFormat
  vkFormatR8G8B8Sint* = 28.VkFormat
  vkFormatR8G8B8Srgb* = 29.VkFormat
  vkFormatB8G8R8Unorm* = 30.VkFormat
  vkFormatB8G8R8Snorm* = 31.VkFormat
  vkFormatB8G8R8Uscaled* = 32.VkFormat
  vkFormatB8G8R8Sscaled* = 33.VkFormat
  vkFormatB8G8R8Uint* = 34.VkFormat
  vkFormatB8G8R8Sint* = 35.VkFormat
  vkFormatB8G8R8Srgb* = 36.VkFormat
  vkFormatR8G8B8A8Unorm* = 37.VkFormat
  vkFormatR8G8B8A8Snorm* = 38.VkFormat
  vkFormatR8G8B8A8Uscaled* = 39.VkFormat
  vkFormatR8G8B8A8Sscaled* = 40.VkFormat
  vkFormatR8G8B8A8Uint* = 41.VkFormat
  vkFormatR8G8B8A8Sint* = 42.VkFormat
  vkFormatR8G8B8A8Srgb* = 43.VkFormat
  vkFormatB8G8R8A8Unorm* = 44.VkFormat
  vkFormatB8G8R8A8Snorm* = 45.VkFormat
  vkFormatB8G8R8A8Uscaled* = 46.VkFormat
  vkFormatB8G8R8A8Sscaled* = 47.VkFormat
  vkFormatB8G8R8A8Uint* = 48.VkFormat
  vkFormatB8G8R8A8Sint* = 49.VkFormat
  vkFormatB8G8R8A8Srgb* = 50.VkFormat
  vkFormatA8B8G8R8UnormPack32* = 51.VkFormat
  vkFormatA8B8G8R8SnormPack32* = 52.VkFormat
  vkFormatA8B8G8R8UscaledPack32* = 53.VkFormat
  vkFormatA8B8G8R8SscaledPack32* = 54.VkFormat
  vkFormatA8B8G8R8UintPack32* = 55.VkFormat
  vkFormatA8B8G8R8SintPack32* = 56.VkFormat
  vkFormatA8B8G8R8SrgbPack32* = 57.VkFormat
  vkFormatA2R10G10B10UnormPack32* = 58.VkFormat
  vkFormatA2R10G10B10SnormPack32* = 59.VkFormat
  vkFormatA2R10G10B10UscaledPack32* = 60.VkFormat
  vkFormatA2R10G10B10SscaledPack32* = 61.VkFormat
  vkFormatA2R10G10B10UintPack32* = 62.VkFormat
  vkFormatA2R10G10B10SintPack32* = 63.VkFormat
  vkFormatA2B10G10R10UnormPack32* = 64.VkFormat
  vkFormatA2B10G10R10SnormPack32* = 65.VkFormat
  vkFormatA2B10G10R10UscaledPack32* = 66.VkFormat
  vkFormatA2B10G10R10SscaledPack32* = 67.VkFormat
  vkFormatA2B10G10R10UintPack32* = 68.VkFormat
  vkFormatA2B10G10R10SintPack32* = 69.VkFormat
  vkFormatR16Unorm* = 70.VkFormat
  vkFormatR16Snorm* = 71.VkFormat
  vkFormatR16Uscaled* = 72.VkFormat
  vkFormatR16Sscaled* = 73.VkFormat
  vkFormatR16Uint* = 74.VkFormat
  vkFormatR16Sint* = 75.VkFormat
  vkFormatR16Sfloat* = 76.VkFormat
  vkFormatR16G16Unorm* = 77.VkFormat
  vkFormatR16G16Snorm* = 78.VkFormat
  vkFormatR16G16Uscaled* = 79.VkFormat
  vkFormatR16G16Sscaled* = 80.VkFormat
  vkFormatR16G16Uint* = 81.VkFormat
  vkFormatR16G16Sint* = 82.VkFormat
  vkFormatR16G16Sfloat* = 83.VkFormat
  vkFormatR16G16B16Unorm* = 84.VkFormat
  vkFormatR16G16B16Snorm* = 85.VkFormat
  vkFormatR16G16B16Uscaled* = 86.VkFormat
  vkFormatR16G16B16Sscaled* = 87.VkFormat
  vkFormatR16G16B16Uint* = 88.VkFormat
  vkFormatR16G16B16Sint* = 89.VkFormat
  vkFormatR16G16B16Sfloat* = 90.VkFormat
  vkFormatR16G16B16A16Unorm* = 91.VkFormat
  vkFormatR16G16B16A16Snorm* = 92.VkFormat
  vkFormatR16G16B16A16Uscaled* = 93.VkFormat
  vkFormatR16G16B16A16Sscaled* = 94.VkFormat
  vkFormatR16G16B16A16Uint* = 95.VkFormat
  vkFormatR16G16B16A16Sint* = 96.VkFormat
  vkFormatR16G16B16A16Sfloat* = 97.VkFormat
  vkFormatR32Uint* = 98.VkFormat
  vkFormatR32Sint* = 99.VkFormat
  vkFormatR32Sfloat* = 100.VkFormat
  vkFormatR32G32Uint* = 101.VkFormat
  vkFormatR32G32Sint* = 102.VkFormat
  vkFormatR32G32Sfloat* = 103.VkFormat
  vkFormatR32G32B32Uint* = 104.VkFormat
  vkFormatR32G32B32Sint* = 105.VkFormat
  vkFormatR32G32B32Sfloat* = 106.VkFormat
  vkFormatR32G32B32A32Uint* = 107.VkFormat
  vkFormatR32G32B32A32Sint* = 108.VkFormat
  vkFormatR32G32B32A32Sfloat* = 109.VkFormat
  vkFormatR64Uint* = 110.VkFormat
  vkFormatR64Sint* = 111.VkFormat
  vkFormatR64Sfloat* = 112.VkFormat
  vkFormatR64G64Uint* = 113.VkFormat
  vkFormatR64G64Sint* = 114.VkFormat
  vkFormatR64G64Sfloat* = 115.VkFormat
  vkFormatR64G64B64Uint* = 116.VkFormat
  vkFormatR64G64B64Sint* = 117.VkFormat
  vkFormatR64G64B64Sfloat* = 118.VkFormat
  vkFormatR64G64B64A64Uint* = 119.VkFormat
  vkFormatR64G64B64A64Sint* = 120.VkFormat
  vkFormatR64G64B64A64Sfloat* = 121.VkFormat
  vkFormatB10G11R11UfloatPack32* = 122.VkFormat
  vkFormatE5B9G9R9UfloatPack32* = 123.VkFormat
  vkFormatD16Unorm* = 124.VkFormat
  vkFormatX8D24UnormPack32* = 125.VkFormat
  vkFormatD32Sfloat* = 126.VkFormat
  vkFormatS8Uint* = 127.VkFormat
  vkFormatD16UnormS8Uint* = 128.VkFormat
  vkFormatD24UnormS8Uint* = 129.VkFormat
  vkFormatD32SfloatS8Uint* = 130.VkFormat
  vkFormatBc1RgbUnormBlock* = 131.VkFormat
  vkFormatBc1RgbSrgbBlock* = 132.VkFormat
  vkFormatBc1RgbaUnormBlock* = 133.VkFormat
  vkFormatBc1RgbaSrgbBlock* = 134.VkFormat
  vkFormatBc2UnormBlock* = 135.VkFormat
  vkFormatBc2SrgbBlock* = 136.VkFormat
  vkFormatBc3UnormBlock* = 137.VkFormat
  vkFormatBc3SrgbBlock* = 138.VkFormat
  vkFormatBc4UnormBlock* = 139.VkFormat
  vkFormatBc4SnormBlock* = 140.VkFormat
  vkFormatBc5UnormBlock* = 141.VkFormat
  vkFormatBc5SnormBlock* = 142.VkFormat
  vkFormatBc6HUfloatBlock* = 143.VkFormat
  vkFormatBc6HSfloatBlock* = 144.VkFormat
  vkFormatBc7UnormBlock* = 145.VkFormat
  vkFormatBc7SrgbBlock* = 146.VkFormat
  vkFormatEtc2R8G8B8UnormBlock* = 147.VkFormat
  vkFormatEtc2R8G8B8SrgbBlock* = 148.VkFormat
  vkFormatEtc2R8G8B8A1UnormBlock* = 149.VkFormat
  vkFormatEtc2R8G8B8A1SrgbBlock* = 150.VkFormat
  vkFormatEtc2R8G8B8A8UnormBlock* = 151.VkFormat
  vkFormatEtc2R8G8B8A8SrgbBlock* = 152.VkFormat
  vkFormatEacR11UnormBlock* = 153.VkFormat
  vkFormatEacR11SnormBlock* = 154.VkFormat
  vkFormatEacR11G11UnormBlock* = 155.VkFormat
  vkFormatEacR11G11SnormBlock* = 156.VkFormat
  vkFormatAstc_4x4UnormBlock* = 157.VkFormat
  vkFormatAstc_4x4SrgbBlock* = 158.VkFormat
  vkFormatAstc_5x4UnormBlock* = 159.VkFormat
  vkFormatAstc_5x4SrgbBlock* = 160.VkFormat
  vkFormatAstc_5x5UnormBlock* = 161.VkFormat
  vkFormatAstc_5x5SrgbBlock* = 162.VkFormat
  vkFormatAstc_6x5UnormBlock* = 163.VkFormat
  vkFormatAstc_6x5SrgbBlock* = 164.VkFormat
  vkFormatAstc_6x6UnormBlock* = 165.VkFormat
  vkFormatAstc_6x6SrgbBlock* = 166.VkFormat
  vkFormatAstc_8x5UnormBlock* = 167.VkFormat
  vkFormatAstc_8x5SrgbBlock* = 168.VkFormat
  vkFormatAstc_8x6UnormBlock* = 169.VkFormat
  vkFormatAstc_8x6SrgbBlock* = 170.VkFormat
  vkFormatAstc_8x8UnormBlock* = 171.VkFormat
  vkFormatAstc_8x8SrgbBlock* = 172.VkFormat
  vkFormatAstc_10x5UnormBlock* = 173.VkFormat
  vkFormatAstc_10x5SrgbBlock* = 174.VkFormat
  vkFormatAstc_10x6UnormBlock* = 175.VkFormat
  vkFormatAstc_10x6SrgbBlock* = 176.VkFormat
  vkFormatAstc_10x8UnormBlock* = 177.VkFormat
  vkFormatAstc_10x8SrgbBlock* = 178.VkFormat
  vkFormatAstc_10x10UnormBlock* = 179.VkFormat
  vkFormatAstc_10x10SrgbBlock* = 180.VkFormat
  vkFormatAstc_12x10UnormBlock* = 181.VkFormat
  vkFormatAstc_12x10SrgbBlock* = 182.VkFormat
  vkFormatAstc_12x12UnormBlock* = 183.VkFormat
  vkFormatAstc_12x12SrgbBlock* = 184.VkFormat
  vkFormatPvrtc1_2BPPUnormBlockImg* = 1000054000.VkFormat
  vkFormatPvrtc1_4BPPUnormBlockImg* = 1000054001.VkFormat
  vkFormatPvrtc2_2BPPUnormBlockImg* = 1000054002.VkFormat
  vkFormatPvrtc2_4BPPUnormBlockImg* = 1000054003.VkFormat
  vkFormatPvrtc1_2BPPSrgbBlockImg* = 1000054004.VkFormat
  vkFormatPvrtc1_4BPPSrgbBlockImg* = 1000054005.VkFormat
  vkFormatPvrtc2_2BPPSrgbBlockImg* = 1000054006.VkFormat
  vkFormatPvrtc2_4BPPSrgbBlockImg* = 1000054007.VkFormat
  vkFormatG8B8G8R8_422UnormKhr: VkFormat = vkFormatG8B8G8R8_422Unorm
  vkFormatB8G8R8G8_422UnormKhr: VkFormat = vkFormatB8G8R8G8_422Unorm
  vkFormatG8B8R8_3PLANE_420UnormKhr: VkFormat = vkFormatG8B8R8_3PLANE_420Unorm
  vkFormatG8B8R8_2PLANE_420UnormKhr: VkFormat = vkFormatG8B8R8_2PLANE_420Unorm
  vkFormatG8B8R8_3PLANE_422UnormKhr: VkFormat = vkFormatG8B8R8_3PLANE_422Unorm
  vkFormatG8B8R8_2PLANE_422UnormKhr: VkFormat = vkFormatG8B8R8_2PLANE_422Unorm
  vkFormatG8B8R8_3PLANE_444UnormKhr: VkFormat = vkFormatG8B8R8_3PLANE_444Unorm
  vkFormatR10X6UnormPack16Khr: VkFormat = vkFormatR10X6UnormPack16
  vkFormatR10X6G10X6Unorm_2PACK16Khr: VkFormat = vkFormatR10X6G10X6Unorm_2PACK16
  vkFormatR10X6G10X6B10X6A10X6Unorm_4PACK16Khr: VkFormat = vkFormatR10X6G10X6B10X6A10X6Unorm_4PACK16
  vkFormatG10X6B10X6G10X6R10X6_422Unorm_4PACK16Khr: VkFormat = vkFormatG10X6B10X6G10X6R10X6_422Unorm_4PACK16
  vkFormatB10X6G10X6R10X6G10X6_422Unorm_4PACK16Khr: VkFormat = vkFormatB10X6G10X6R10X6G10X6_422Unorm_4PACK16
  vkFormatG10X6B10X6R10X6_3PLANE_420Unorm_3PACK16Khr: VkFormat = vkFormatG10X6B10X6R10X6_3PLANE_420Unorm_3PACK16
  vkFormatG10X6B10X6R10X6_2PLANE_420Unorm_3PACK16Khr: VkFormat = vkFormatG10X6B10X6R10X6_2PLANE_420Unorm_3PACK16
  vkFormatG10X6B10X6R10X6_3PLANE_422Unorm_3PACK16Khr: VkFormat = vkFormatG10X6B10X6R10X6_3PLANE_422Unorm_3PACK16
  vkFormatG10X6B10X6R10X6_2PLANE_422Unorm_3PACK16Khr: VkFormat = vkFormatG10X6B10X6R10X6_2PLANE_422Unorm_3PACK16
  vkFormatG10X6B10X6R10X6_3PLANE_444Unorm_3PACK16Khr: VkFormat = vkFormatG10X6B10X6R10X6_3PLANE_444Unorm_3PACK16
  vkFormatR12X4UnormPack16Khr: VkFormat = vkFormatR12X4UnormPack16
  vkFormatR12X4G12X4Unorm_2PACK16Khr: VkFormat = vkFormatR12X4G12X4Unorm_2PACK16
  vkFormatR12X4G12X4B12X4A12X4Unorm_4PACK16Khr: VkFormat = vkFormatR12X4G12X4B12X4A12X4Unorm_4PACK16
  vkFormatG12X4B12X4G12X4R12X4_422Unorm_4PACK16Khr: VkFormat = vkFormatG12X4B12X4G12X4R12X4_422Unorm_4PACK16
  vkFormatB12X4G12X4R12X4G12X4_422Unorm_4PACK16Khr: VkFormat = vkFormatB12X4G12X4R12X4G12X4_422Unorm_4PACK16
  vkFormatG12X4B12X4R12X4_3PLANE_420Unorm_3PACK16Khr: VkFormat = vkFormatG12X4B12X4R12X4_3PLANE_420Unorm_3PACK16
  vkFormatG12X4B12X4R12X4_2PLANE_420Unorm_3PACK16Khr: VkFormat = vkFormatG12X4B12X4R12X4_2PLANE_420Unorm_3PACK16
  vkFormatG12X4B12X4R12X4_3PLANE_422Unorm_3PACK16Khr: VkFormat = vkFormatG12X4B12X4R12X4_3PLANE_422Unorm_3PACK16
  vkFormatG12X4B12X4R12X4_2PLANE_422Unorm_3PACK16Khr: VkFormat = vkFormatG12X4B12X4R12X4_2PLANE_422Unorm_3PACK16
  vkFormatG12X4B12X4R12X4_3PLANE_444Unorm_3PACK16Khr: VkFormat = vkFormatG12X4B12X4R12X4_3PLANE_444Unorm_3PACK16
  vkFormatG16B16G16R16_422UnormKhr: VkFormat = vkFormatG16B16G16R16_422Unorm
  vkFormatB16G16R16G16_422UnormKhr: VkFormat = vkFormatB16G16R16G16_422Unorm
  vkFormatG16B16R16_3PLANE_420UnormKhr: VkFormat = vkFormatG16B16R16_3PLANE_420Unorm
  vkFormatG16B16R16_2PLANE_420UnormKhr: VkFormat = vkFormatG16B16R16_2PLANE_420Unorm
  vkFormatG16B16R16_3PLANE_422UnormKhr: VkFormat = vkFormatG16B16R16_3PLANE_422Unorm
  vkFormatG16B16R16_2PLANE_422UnormKhr: VkFormat = vkFormatG16B16R16_2PLANE_422Unorm
  vkFormatG16B16R16_3PLANE_444UnormKhr: VkFormat = vkFormatG16B16R16_3PLANE_444Unorm
  vkFormatBeginRange: VkFormat = vkFormatUndefined
  vkFormatEndRange: VkFormat = vkFormatAstc_12x12SrgbBlock
  vkFormatRangeSize: VkFormat = (vkFormatAstc_12x12SrgbBlock - vkFormatUndefined + 1)
  vkFormatG8B8G8R8_422Unorm* = 1000156000.VkFormat
  vkFormatB8G8R8G8_422Unorm* = 1000156001.VkFormat
  vkFormatG8B8R8_3PLANE_420Unorm* = 1000156002.VkFormat
  vkFormatG8B8R8_2PLANE_420Unorm* = 1000156003.VkFormat
  vkFormatG8B8R8_3PLANE_422Unorm* = 1000156004.VkFormat
  vkFormatG8B8R8_2PLANE_422Unorm* = 1000156005.VkFormat
  vkFormatG8B8R8_3PLANE_444Unorm* = 1000156006.VkFormat
  vkFormatR10X6UnormPack16* = 1000156007.VkFormat
  vkFormatR10X6G10X6Unorm_2PACK16* = 1000156008.VkFormat
  vkFormatR10X6G10X6B10X6A10X6Unorm_4PACK16* = 1000156009.VkFormat
  vkFormatG10X6B10X6G10X6R10X6_422Unorm_4PACK16* = 1000156010.VkFormat
  vkFormatB10X6G10X6R10X6G10X6_422Unorm_4PACK16* = 1000156011.VkFormat
  vkFormatG10X6B10X6R10X6_3PLANE_420Unorm_3PACK16* = 1000156012.VkFormat
  vkFormatG10X6B10X6R10X6_2PLANE_420Unorm_3PACK16* = 1000156013.VkFormat
  vkFormatG10X6B10X6R10X6_3PLANE_422Unorm_3PACK16* = 1000156014.VkFormat
  vkFormatG10X6B10X6R10X6_2PLANE_422Unorm_3PACK16* = 1000156015.VkFormat
  vkFormatG10X6B10X6R10X6_3PLANE_444Unorm_3PACK16* = 1000156016.VkFormat
  vkFormatR12X4UnormPack16* = 1000156017.VkFormat
  vkFormatR12X4G12X4Unorm_2PACK16* = 1000156018.VkFormat
  vkFormatR12X4G12X4B12X4A12X4Unorm_4PACK16* = 1000156019.VkFormat
  vkFormatG12X4B12X4G12X4R12X4_422Unorm_4PACK16* = 1000156020.VkFormat
  vkFormatB12X4G12X4R12X4G12X4_422Unorm_4PACK16* = 1000156021.VkFormat
  vkFormatG12X4B12X4R12X4_3PLANE_420Unorm_3PACK16* = 1000156022.VkFormat
  vkFormatG12X4B12X4R12X4_2PLANE_420Unorm_3PACK16* = 1000156023.VkFormat
  vkFormatG12X4B12X4R12X4_3PLANE_422Unorm_3PACK16* = 1000156024.VkFormat
  vkFormatG12X4B12X4R12X4_2PLANE_422Unorm_3PACK16* = 1000156025.VkFormat
  vkFormatG12X4B12X4R12X4_3PLANE_444Unorm_3PACK16* = 1000156026.VkFormat
  vkFormatG16B16G16R16_422Unorm* = 1000156027.VkFormat
  vkFormatB16G16R16G16_422Unorm* = 1000156028.VkFormat
  vkFormatG16B16R16_3PLANE_420Unorm* = 1000156029.VkFormat
  vkFormatG16B16R16_2PLANE_420Unorm* = 1000156030.VkFormat
  vkFormatG16B16R16_3PLANE_422Unorm* = 1000156031.VkFormat
  vkFormatG16B16R16_2PLANE_422Unorm* = 1000156032.VkFormat
  vkFormatG16B16R16_3PLANE_444Unorm* = 1000156033.VkFormat
  vkFormatMaxEnum* = 0x7FFFFFFF.VkFormat

const
  vkImageType_1D* = 0.VkImageType
  vkImageType_2D* = 1.VkImageType
  vkImageType_3D* = 2.VkImageType
  vkImageTypeBeginRange: VkImageType = vkImageType_1D
  vkImageTypeEndRange: VkImageType = vkImageType_3D
  vkImageTypeRangeSize: VkImageType = (vkImageType_3D - vkImageType_1D + 1)
  vkImageTypeMaxEnum* = 0x7FFFFFFF.VkImageType

const
  vkImageTilingOptimal* = 0.VkImageTiling
  vkImageTilingLinear* = 1.VkImageTiling
  vkImageTilingDrmFormatModifierExt* = 1000158000.VkImageTiling
  vkImageTilingBeginRange: VkImageTiling = vkImageTilingOptimal
  vkImageTilingEndRange: VkImageTiling = vkImageTilingLinear
  vkImageTilingRangeSize: VkImageTiling = (vkImageTilingLinear - vkImageTilingOptimal + 1)
  vkImageTilingMaxEnum* = 0x7FFFFFFF.VkImageTiling

const
  vkPhysicalDeviceTypeOther* = 0.VkPhysicalDeviceType
  vkPhysicalDeviceTypeIntegratedGpu* = 1.VkPhysicalDeviceType
  vkPhysicalDeviceTypeDiscreteGpu* = 2.VkPhysicalDeviceType
  vkPhysicalDeviceTypeVirtualGpu* = 3.VkPhysicalDeviceType
  vkPhysicalDeviceTypeCpu* = 4.VkPhysicalDeviceType
  vkPhysicalDeviceTypeBeginRange: VkPhysicalDeviceType = vkPhysicalDeviceTypeOther
  vkPhysicalDeviceTypeEndRange: VkPhysicalDeviceType = vkPhysicalDeviceTypeCpu
  vkPhysicalDeviceTypeRangeSize: VkPhysicalDeviceType = (vkPhysicalDeviceTypeCpu - vkPhysicalDeviceTypeOther + 1)
  vkPhysicalDeviceTypeMaxEnum* = 0x7FFFFFFF.VkPhysicalDeviceType

const
  vkQueryTypeOcclusion* = 0.VkQueryType
  vkQueryTypePipelineStatistics* = 1.VkQueryType
  vkQueryTypeTimestamp* = 2.VkQueryType
  vkQueryTypeTransformFeedbackStreamExt* = 1000028004.VkQueryType
  vkQueryTypeAccelerationStructureCompactedSizeNv* = 1000165000.VkQueryType
  vkQueryTypeBeginRange: VkQueryType = vkQueryTypeOcclusion
  vkQueryTypeEndRange: VkQueryType = vkQueryTypeTimestamp
  vkQueryTypeRangeSize: VkQueryType = (vkQueryTypeTimestamp - vkQueryTypeOcclusion + 1)
  vkQueryTypeMaxEnum* = 0x7FFFFFFF.VkQueryType

const
  vkSharingModeExclusive* = 0.VkSharingMode
  vkSharingModeConcurrent* = 1.VkSharingMode
  vkSharingModeBeginRange: VkSharingMode = vkSharingModeExclusive
  vkSharingModeEndRange: VkSharingMode = vkSharingModeConcurrent
  vkSharingModeRangeSize: VkSharingMode = (vkSharingModeConcurrent - vkSharingModeExclusive + 1)
  vkSharingModeMaxEnum* = 0x7FFFFFFF.VkSharingMode

const
  vkImageLayoutUndefined* = 0.VkImageLayout
  vkImageLayoutGeneral* = 1.VkImageLayout
  vkImageLayoutColorAttachmentOptimal* = 2.VkImageLayout
  vkImageLayoutDepthStencilAttachmentOptimal* = 3.VkImageLayout
  vkImageLayoutDepthStencilReadOnlyOptimal* = 4.VkImageLayout
  vkImageLayoutShaderReadOnlyOptimal* = 5.VkImageLayout
  vkImageLayoutTransferSrcOptimal* = 6.VkImageLayout
  vkImageLayoutTransferDstOptimal* = 7.VkImageLayout
  vkImageLayoutPreinitialized* = 8.VkImageLayout
  vkImageLayoutPresentSrcKhr* = 1000001002.VkImageLayout
  vkImageLayoutSharedPresentKhr* = 1000111000.VkImageLayout
  vkImageLayoutDepthReadOnlyStencilAttachmentOptimal* = 1000117000.VkImageLayout
  vkImageLayoutDepthAttachmentStencilReadOnlyOptimal* = 1000117001.VkImageLayout
  vkImageLayoutShadingRateOptimalNv* = 1000164003.VkImageLayout
  vkImageLayoutDepthReadOnlyStencilAttachmentOptimalKhr: VkImageLayout = vkImageLayoutDepthReadOnlyStencilAttachmentOptimal
  vkImageLayoutDepthAttachmentStencilReadOnlyOptimalKhr: VkImageLayout = vkImageLayoutDepthAttachmentStencilReadOnlyOptimal
  vkImageLayoutBeginRange: VkImageLayout = vkImageLayoutUndefined
  vkImageLayoutEndRange: VkImageLayout = vkImageLayoutPreinitialized
  vkImageLayoutRangeSize: VkImageLayout = (vkImageLayoutPreinitialized - vkImageLayoutUndefined + 1)
  vkImageLayoutMaxEnum* = 0x7FFFFFFF.VkImageLayout

const
  vkImageViewType_1D* = 0.VkImageViewType
  vkImageViewType_2D* = 1.VkImageViewType
  vkImageViewType_3D* = 2.VkImageViewType
  vkImageViewTypeCube* = 3.VkImageViewType
  vkImageViewType_1DArray* = 4.VkImageViewType
  vkImageViewType_2DArray* = 5.VkImageViewType
  vkImageViewTypeCubeArray* = 6.VkImageViewType
  vkImageViewTypeBeginRange: VkImageViewType = vkImageViewType_1D
  vkImageViewTypeEndRange: VkImageViewType = vkImageViewTypeCubeArray
  vkImageViewTypeRangeSize: VkImageViewType = (vkImageViewTypeCubeArray - vkImageViewType_1D + 1)
  vkImageViewTypeMaxEnum* = 0x7FFFFFFF.VkImageViewType

const
  vkComponentSwizzleIdentity* = 0.VkComponentSwizzle
  vkComponentSwizzleZero* = 1.VkComponentSwizzle
  vkComponentSwizzleOne* = 2.VkComponentSwizzle
  vkComponentSwizzleR* = 3.VkComponentSwizzle
  vkComponentSwizzleG* = 4.VkComponentSwizzle
  vkComponentSwizzleB* = 5.VkComponentSwizzle
  vkComponentSwizzleA* = 6.VkComponentSwizzle
  vkComponentSwizzleBeginRange: VkComponentSwizzle = vkComponentSwizzleIdentity
  vkComponentSwizzleEndRange: VkComponentSwizzle = vkComponentSwizzleA
  vkComponentSwizzleRangeSize: VkComponentSwizzle = (vkComponentSwizzleA - vkComponentSwizzleIdentity + 1)
  vkComponentSwizzleMaxEnum* = 0x7FFFFFFF.VkComponentSwizzle

const
  vkVertexInputRateVertex* = 0.VkVertexInputRate
  vkVertexInputRateInstance* = 1.VkVertexInputRate
  vkVertexInputRateBeginRange: VkVertexInputRate = vkVertexInputRateVertex
  vkVertexInputRateEndRange: VkVertexInputRate = vkVertexInputRateInstance
  vkVertexInputRateRangeSize: VkVertexInputRate = (vkVertexInputRateInstance - vkVertexInputRateVertex + 1)
  vkVertexInputRateMaxEnum* = 0x7FFFFFFF.VkVertexInputRate

const
  vkPrimitiveTopologyPointList* = 0.VkPrimitiveTopology
  vkPrimitiveTopologyLineList* = 1.VkPrimitiveTopology
  vkPrimitiveTopologyLineStrip* = 2.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleList* = 3.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleStrip* = 4.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleFan* = 5.VkPrimitiveTopology
  vkPrimitiveTopologyLineListWithAdjacency* = 6.VkPrimitiveTopology
  vkPrimitiveTopologyLineStripWithAdjacency* = 7.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleListWithAdjacency* = 8.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleStripWithAdjacency* = 9.VkPrimitiveTopology
  vkPrimitiveTopologyPatchList* = 10.VkPrimitiveTopology
  vkPrimitiveTopologyBeginRange: VkPrimitiveTopology = vkPrimitiveTopologyPointList
  vkPrimitiveTopologyEndRange: VkPrimitiveTopology = vkPrimitiveTopologyPatchList
  vkPrimitiveTopologyRangeSize: VkPrimitiveTopology = (vkPrimitiveTopologyPatchList - vkPrimitiveTopologyPointList + 1)
  vkPrimitiveTopologyMaxEnum* = 0x7FFFFFFF.VkPrimitiveTopology

const
  vkPolygonModeFill* = 0.VkPolygonMode
  vkPolygonModeLine* = 1.VkPolygonMode
  vkPolygonModePoint* = 2.VkPolygonMode
  vkPolygonModeFillRectangleNv* = 1000153000.VkPolygonMode
  vkPolygonModeBeginRange: VkPolygonMode = vkPolygonModeFill
  vkPolygonModeEndRange: VkPolygonMode = vkPolygonModePoint
  vkPolygonModeRangeSize: VkPolygonMode = (vkPolygonModePoint - vkPolygonModeFill + 1)
  vkPolygonModeMaxEnum* = 0x7FFFFFFF.VkPolygonMode

const
  vkFrontFaceCounterClockwise* = 0.VkFrontFace
  vkFrontFaceClockwise* = 1.VkFrontFace
  vkFrontFaceBeginRange: VkFrontFace = vkFrontFaceCounterClockwise
  vkFrontFaceEndRange: VkFrontFace = vkFrontFaceClockwise
  vkFrontFaceRangeSize: VkFrontFace = (vkFrontFaceClockwise - vkFrontFaceCounterClockwise + 1)
  vkFrontFaceMaxEnum* = 0x7FFFFFFF.VkFrontFace

const
  vkCompareOpNever* = 0.VkCompareOp
  vkCompareOpLess* = 1.VkCompareOp
  vkCompareOpEqual* = 2.VkCompareOp
  vkCompareOpLessOrEqual* = 3.VkCompareOp
  vkCompareOpGreater* = 4.VkCompareOp
  vkCompareOpNotEqual* = 5.VkCompareOp
  vkCompareOpGreaterOrEqual* = 6.VkCompareOp
  vkCompareOpAlways* = 7.VkCompareOp
  vkCompareOpBeginRange: VkCompareOp = vkCompareOpNever
  vkCompareOpEndRange: VkCompareOp = vkCompareOpAlways
  vkCompareOpRangeSize: VkCompareOp = (vkCompareOpAlways - vkCompareOpNever + 1)
  vkCompareOpMaxEnum* = 0x7FFFFFFF.VkCompareOp

const
  vkStencilOpKeep* = 0.VkStencilOp
  vkStencilOpZero* = 1.VkStencilOp
  vkStencilOpReplace* = 2.VkStencilOp
  vkStencilOpIncrementAndClamp* = 3.VkStencilOp
  vkStencilOpDecrementAndClamp* = 4.VkStencilOp
  vkStencilOpInvert* = 5.VkStencilOp
  vkStencilOpIncrementAndWrap* = 6.VkStencilOp
  vkStencilOpDecrementAndWrap* = 7.VkStencilOp
  vkStencilOpBeginRange: VkStencilOp = vkStencilOpKeep
  vkStencilOpEndRange: VkStencilOp = vkStencilOpDecrementAndWrap
  vkStencilOpRangeSize: VkStencilOp = (vkStencilOpDecrementAndWrap - vkStencilOpKeep + 1)
  vkStencilOpMaxEnum* = 0x7FFFFFFF.VkStencilOp

const
  vkLogicOpClear* = 0.VkLogicOp
  vkLogicOpAnd* = 1.VkLogicOp
  vkLogicOpAndReverse* = 2.VkLogicOp
  vkLogicOpCopy* = 3.VkLogicOp
  vkLogicOpAndInverted* = 4.VkLogicOp
  vkLogicOpNoOp* = 5.VkLogicOp
  vkLogicOpXor* = 6.VkLogicOp
  vkLogicOpOr* = 7.VkLogicOp
  vkLogicOpNor* = 8.VkLogicOp
  vkLogicOpEquivalent* = 9.VkLogicOp
  vkLogicOpInvert* = 10.VkLogicOp
  vkLogicOpOrReverse* = 11.VkLogicOp
  vkLogicOpCopyInverted* = 12.VkLogicOp
  vkLogicOpOrInverted* = 13.VkLogicOp
  vkLogicOpNand* = 14.VkLogicOp
  vkLogicOpSet* = 15.VkLogicOp
  vkLogicOpBeginRange: VkLogicOp = vkLogicOpClear
  vkLogicOpEndRange: VkLogicOp = vkLogicOpSet
  vkLogicOpRangeSize: VkLogicOp = (vkLogicOpSet - vkLogicOpClear + 1)
  vkLogicOpMaxEnum* = 0x7FFFFFFF.VkLogicOp

const
  vkBlendFactorZero* = 0.VkBlendFactor
  vkBlendFactorOne* = 1.VkBlendFactor
  vkBlendFactorSrcColor* = 2.VkBlendFactor
  vkBlendFactorOneMinusSrcColor* = 3.VkBlendFactor
  vkBlendFactorDstColor* = 4.VkBlendFactor
  vkBlendFactorOneMinusDstColor* = 5.VkBlendFactor
  vkBlendFactorSrcAlpha* = 6.VkBlendFactor
  vkBlendFactorOneMinusSrcAlpha* = 7.VkBlendFactor
  vkBlendFactorDstAlpha* = 8.VkBlendFactor
  vkBlendFactorOneMinusDstAlpha* = 9.VkBlendFactor
  vkBlendFactorConstantColor* = 10.VkBlendFactor
  vkBlendFactorOneMinusConstantColor* = 11.VkBlendFactor
  vkBlendFactorConstantAlpha* = 12.VkBlendFactor
  vkBlendFactorOneMinusConstantAlpha* = 13.VkBlendFactor
  vkBlendFactorSrcAlphaSaturate* = 14.VkBlendFactor
  vkBlendFactorSrc1Color* = 15.VkBlendFactor
  vkBlendFactorOneMinusSrc1Color* = 16.VkBlendFactor
  vkBlendFactorSrc1Alpha* = 17.VkBlendFactor
  vkBlendFactorOneMinusSrc1Alpha* = 18.VkBlendFactor
  vkBlendFactorBeginRange: VkBlendFactor = vkBlendFactorZero
  vkBlendFactorEndRange: VkBlendFactor = vkBlendFactorOneMinusSrc1Alpha
  vkBlendFactorRangeSize: VkBlendFactor = (vkBlendFactorOneMinusSrc1Alpha - vkBlendFactorZero + 1)
  vkBlendFactorMaxEnum* = 0x7FFFFFFF.VkBlendFactor

const
  vkBlendOpAdd* = 0.VkBlendOp
  vkBlendOpSubtract* = 1.VkBlendOp
  vkBlendOpReverseSubtract* = 2.VkBlendOp
  vkBlendOpMin* = 3.VkBlendOp
  vkBlendOpMax* = 4.VkBlendOp
  vkBlendOpZeroExt* = 1000148000.VkBlendOp
  vkBlendOpSrcExt* = 1000148001.VkBlendOp
  vkBlendOpDstExt* = 1000148002.VkBlendOp
  vkBlendOpSrcOverExt* = 1000148003.VkBlendOp
  vkBlendOpDstOverExt* = 1000148004.VkBlendOp
  vkBlendOpSrcInExt* = 1000148005.VkBlendOp
  vkBlendOpDstInExt* = 1000148006.VkBlendOp
  vkBlendOpSrcOutExt* = 1000148007.VkBlendOp
  vkBlendOpDstOutExt* = 1000148008.VkBlendOp
  vkBlendOpSrcAtopExt* = 1000148009.VkBlendOp
  vkBlendOpDstAtopExt* = 1000148010.VkBlendOp
  vkBlendOpXorExt* = 1000148011.VkBlendOp
  vkBlendOpMultiplyExt* = 1000148012.VkBlendOp
  vkBlendOpScreenExt* = 1000148013.VkBlendOp
  vkBlendOpOverlayExt* = 1000148014.VkBlendOp
  vkBlendOpDarkenExt* = 1000148015.VkBlendOp
  vkBlendOpLightenExt* = 1000148016.VkBlendOp
  vkBlendOpColordodgeExt* = 1000148017.VkBlendOp
  vkBlendOpColorburnExt* = 1000148018.VkBlendOp
  vkBlendOpHardlightExt* = 1000148019.VkBlendOp
  vkBlendOpSoftlightExt* = 1000148020.VkBlendOp
  vkBlendOpDifferenceExt* = 1000148021.VkBlendOp
  vkBlendOpExclusionExt* = 1000148022.VkBlendOp
  vkBlendOpInvertExt* = 1000148023.VkBlendOp
  vkBlendOpInvertRgbExt* = 1000148024.VkBlendOp
  vkBlendOpLineardodgeExt* = 1000148025.VkBlendOp
  vkBlendOpLinearburnExt* = 1000148026.VkBlendOp
  vkBlendOpVividlightExt* = 1000148027.VkBlendOp
  vkBlendOpLinearlightExt* = 1000148028.VkBlendOp
  vkBlendOpPinlightExt* = 1000148029.VkBlendOp
  vkBlendOpHardmixExt* = 1000148030.VkBlendOp
  vkBlendOpHslHueExt* = 1000148031.VkBlendOp
  vkBlendOpHslSaturationExt* = 1000148032.VkBlendOp
  vkBlendOpHslColorExt* = 1000148033.VkBlendOp
  vkBlendOpHslLuminosityExt* = 1000148034.VkBlendOp
  vkBlendOpPlusExt* = 1000148035.VkBlendOp
  vkBlendOpPlusClampedExt* = 1000148036.VkBlendOp
  vkBlendOpPlusClampedAlphaExt* = 1000148037.VkBlendOp
  vkBlendOpPlusDarkerExt* = 1000148038.VkBlendOp
  vkBlendOpMinusExt* = 1000148039.VkBlendOp
  vkBlendOpMinusClampedExt* = 1000148040.VkBlendOp
  vkBlendOpContrastExt* = 1000148041.VkBlendOp
  vkBlendOpInvertOvgExt* = 1000148042.VkBlendOp
  vkBlendOpRedExt* = 1000148043.VkBlendOp
  vkBlendOpGreenExt* = 1000148044.VkBlendOp
  vkBlendOpBlueExt* = 1000148045.VkBlendOp
  vkBlendOpBeginRange: VkBlendOp = vkBlendOpAdd
  vkBlendOpEndRange: VkBlendOp = vkBlendOpMax
  vkBlendOpRangeSize: VkBlendOp = (vkBlendOpMax - vkBlendOpAdd + 1)
  vkBlendOpMaxEnum* = 0x7FFFFFFF.VkBlendOp

const
  vkDynamicStateViewport* = 0.VkDynamicState
  vkDynamicStateScissor* = 1.VkDynamicState
  vkDynamicStateLineWidth* = 2.VkDynamicState
  vkDynamicStateDepthBias* = 3.VkDynamicState
  vkDynamicStateBlendConstants* = 4.VkDynamicState
  vkDynamicStateDepthBounds* = 5.VkDynamicState
  vkDynamicStateStencilCompareMask* = 6.VkDynamicState
  vkDynamicStateStencilWriteMask* = 7.VkDynamicState
  vkDynamicStateStencilReference* = 8.VkDynamicState
  vkDynamicStateViewportWScalingNv* = 1000087000.VkDynamicState
  vkDynamicStateDiscardRectangleExt* = 1000099000.VkDynamicState
  vkDynamicStateSampleLocationsExt* = 1000143000.VkDynamicState
  vkDynamicStateViewportShadingRatePaletteNv* = 1000164004.VkDynamicState
  vkDynamicStateViewportCoarseSampleOrderNv* = 1000164006.VkDynamicState
  vkDynamicStateExclusiveScissorNv* = 1000205001.VkDynamicState
  vkDynamicStateBeginRange: VkDynamicState = vkDynamicStateViewport
  vkDynamicStateEndRange: VkDynamicState = vkDynamicStateStencilReference
  vkDynamicStateRangeSize: VkDynamicState = (vkDynamicStateStencilReference - vkDynamicStateViewport + 1)
  vkDynamicStateMaxEnum* = 0x7FFFFFFF.VkDynamicState

const
  vkFilterNearest* = 0.VkFilter
  vkFilterLinear* = 1.VkFilter
  vkFilterCubicImg* = 1000015000.VkFilter
  vkFilterBeginRange: VkFilter = vkFilterNearest
  vkFilterEndRange: VkFilter = vkFilterLinear
  vkFilterRangeSize: VkFilter = (vkFilterLinear - vkFilterNearest + 1)
  vkFilterMaxEnum* = 0x7FFFFFFF.VkFilter

const
  vkSamplerMipmapModeNearest* = 0.VkSamplerMipmapMode
  vkSamplerMipmapModeLinear* = 1.VkSamplerMipmapMode
  vkSamplerMipmapModeBeginRange: VkSamplerMipmapMode = vkSamplerMipmapModeNearest
  vkSamplerMipmapModeEndRange: VkSamplerMipmapMode = vkSamplerMipmapModeLinear
  vkSamplerMipmapModeRangeSize: VkSamplerMipmapMode = (vkSamplerMipmapModeLinear - vkSamplerMipmapModeNearest + 1)
  vkSamplerMipmapModeMaxEnum* = 0x7FFFFFFF.VkSamplerMipmapMode

const
  vkSamplerAddressModeRepeat* = 0.VkSamplerAddressMode
  vkSamplerAddressModeMirroredRepeat* = 1.VkSamplerAddressMode
  vkSamplerAddressModeClampToEdge* = 2.VkSamplerAddressMode
  vkSamplerAddressModeClampToBorder* = 3.VkSamplerAddressMode
  vkSamplerAddressModeMirrorClampToEdge* = 4.VkSamplerAddressMode
  vkSamplerAddressModeBeginRange: VkSamplerAddressMode = vkSamplerAddressModeRepeat
  vkSamplerAddressModeEndRange: VkSamplerAddressMode = vkSamplerAddressModeClampToBorder
  vkSamplerAddressModeRangeSize: VkSamplerAddressMode = (vkSamplerAddressModeClampToBorder - vkSamplerAddressModeRepeat + 1)
  vkSamplerAddressModeMaxEnum* = 0x7FFFFFFF.VkSamplerAddressMode

const
  vkBorderColorFloatTransparentBlack* = 0.VkBorderColor
  vkBorderColorIntTransparentBlack* = 1.VkBorderColor
  vkBorderColorFloatOpaqueBlack* = 2.VkBorderColor
  vkBorderColorIntOpaqueBlack* = 3.VkBorderColor
  vkBorderColorFloatOpaqueWhite* = 4.VkBorderColor
  vkBorderColorIntOpaqueWhite* = 5.VkBorderColor
  vkBorderColorBeginRange: VkBorderColor = vkBorderColorFloatTransparentBlack
  vkBorderColorEndRange: VkBorderColor = vkBorderColorIntOpaqueWhite
  vkBorderColorRangeSize: VkBorderColor = (vkBorderColorIntOpaqueWhite - vkBorderColorFloatTransparentBlack + 1)
  vkBorderColorMaxEnum* = 0x7FFFFFFF.VkBorderColor

const
  vkDescriptorTypeSampler* = 0.VkDescriptorType
  vkDescriptorTypeCombinedImageSampler* = 1.VkDescriptorType
  vkDescriptorTypeSampledImage* = 2.VkDescriptorType
  vkDescriptorTypeStorageImage* = 3.VkDescriptorType
  vkDescriptorTypeUniformTexelBuffer* = 4.VkDescriptorType
  vkDescriptorTypeStorageTexelBuffer* = 5.VkDescriptorType
  vkDescriptorTypeUniformBuffer* = 6.VkDescriptorType
  vkDescriptorTypeStorageBuffer* = 7.VkDescriptorType
  vkDescriptorTypeUniformBufferDynamic* = 8.VkDescriptorType
  vkDescriptorTypeStorageBufferDynamic* = 9.VkDescriptorType
  vkDescriptorTypeInputAttachment* = 10.VkDescriptorType
  vkDescriptorTypeInlineUniformBlockExt* = 1000138000.VkDescriptorType
  vkDescriptorTypeAccelerationStructureNv* = 1000165000.VkDescriptorType
  vkDescriptorTypeBeginRange: VkDescriptorType = vkDescriptorTypeSampler
  vkDescriptorTypeEndRange: VkDescriptorType = vkDescriptorTypeInputAttachment
  vkDescriptorTypeRangeSize: VkDescriptorType = (vkDescriptorTypeInputAttachment - vkDescriptorTypeSampler + 1)
  vkDescriptorTypeMaxEnum* = 0x7FFFFFFF.VkDescriptorType

const
  vkAttachmentLoadOpLoad* = 0.VkAttachmentLoadOp
  vkAttachmentLoadOpClear* = 1.VkAttachmentLoadOp
  vkAttachmentLoadOpDontCare* = 2.VkAttachmentLoadOp
  vkAttachmentLoadOpBeginRange: VkAttachmentLoadOp = vkAttachmentLoadOpLoad
  vkAttachmentLoadOpEndRange: VkAttachmentLoadOp = vkAttachmentLoadOpDontCare
  vkAttachmentLoadOpRangeSize: VkAttachmentLoadOp = (vkAttachmentLoadOpDontCare - vkAttachmentLoadOpLoad + 1)
  vkAttachmentLoadOpMaxEnum* = 0x7FFFFFFF.VkAttachmentLoadOp

const
  vkAttachmentStoreOpStore* = 0.VkAttachmentStoreOp
  vkAttachmentStoreOpDontCare* = 1.VkAttachmentStoreOp
  vkAttachmentStoreOpBeginRange: VkAttachmentStoreOp = vkAttachmentStoreOpStore
  vkAttachmentStoreOpEndRange: VkAttachmentStoreOp = vkAttachmentStoreOpDontCare
  vkAttachmentStoreOpRangeSize: VkAttachmentStoreOp = (vkAttachmentStoreOpDontCare - vkAttachmentStoreOpStore + 1)
  vkAttachmentStoreOpMaxEnum* = 0x7FFFFFFF.VkAttachmentStoreOp

const
  vkPipelineBindPointGraphics* = 0.VkPipelineBindPoint
  vkPipelineBindPointCompute* = 1.VkPipelineBindPoint
  vkPipelineBindPointRayTracingNv* = 1000165000.VkPipelineBindPoint
  vkPipelineBindPointBeginRange: VkPipelineBindPoint = vkPipelineBindPointGraphics
  vkPipelineBindPointEndRange: VkPipelineBindPoint = vkPipelineBindPointCompute
  vkPipelineBindPointRangeSize: VkPipelineBindPoint = (vkPipelineBindPointCompute - vkPipelineBindPointGraphics + 1)
  vkPipelineBindPointMaxEnum* = 0x7FFFFFFF.VkPipelineBindPoint

const
  vkCommandBufferLevelPrimary* = 0.VkCommandBufferLevel
  vkCommandBufferLevelSecondary* = 1.VkCommandBufferLevel
  vkCommandBufferLevelBeginRange: VkCommandBufferLevel = vkCommandBufferLevelPrimary
  vkCommandBufferLevelEndRange: VkCommandBufferLevel = vkCommandBufferLevelSecondary
  vkCommandBufferLevelRangeSize: VkCommandBufferLevel = (vkCommandBufferLevelSecondary - vkCommandBufferLevelPrimary + 1)
  vkCommandBufferLevelMaxEnum* = 0x7FFFFFFF.VkCommandBufferLevel

const
  vkIndexTypeUint16* = 0.VkIndexType
  vkIndexTypeUint32* = 1.VkIndexType
  vkIndexTypeNoneNv* = 1000165000.VkIndexType
  vkIndexTypeBeginRange: VkIndexType = vkIndexTypeUint16
  vkIndexTypeEndRange: VkIndexType = vkIndexTypeUint32
  vkIndexTypeRangeSize: VkIndexType = (vkIndexTypeUint32 - vkIndexTypeUint16 + 1)
  vkIndexTypeMaxEnum* = 0x7FFFFFFF.VkIndexType

const
  vkSubpassContentsInline* = 0.VkSubpassContents
  vkSubpassContentsSecondaryCommandBuffers* = 1.VkSubpassContents
  vkSubpassContentsBeginRange: VkSubpassContents = vkSubpassContentsInline
  vkSubpassContentsEndRange: VkSubpassContents = vkSubpassContentsSecondaryCommandBuffers
  vkSubpassContentsRangeSize: VkSubpassContents = (vkSubpassContentsSecondaryCommandBuffers - vkSubpassContentsInline + 1)
  vkSubpassContentsMaxEnum* = 0x7FFFFFFF.VkSubpassContents

const
  vkObjectTypeUnknown* = 0.VkObjectType
  vkObjectTypeInstance* = 1.VkObjectType
  vkObjectTypePhysicalDevice* = 2.VkObjectType
  vkObjectTypeDevice* = 3.VkObjectType
  vkObjectTypeQueue* = 4.VkObjectType
  vkObjectTypeSemaphore* = 5.VkObjectType
  vkObjectTypeCommandBuffer* = 6.VkObjectType
  vkObjectTypeFence* = 7.VkObjectType
  vkObjectTypeDeviceMemory* = 8.VkObjectType
  vkObjectTypeBuffer* = 9.VkObjectType
  vkObjectTypeImage* = 10.VkObjectType
  vkObjectTypeEvent* = 11.VkObjectType
  vkObjectTypeQueryPool* = 12.VkObjectType
  vkObjectTypeBufferView* = 13.VkObjectType
  vkObjectTypeImageView* = 14.VkObjectType
  vkObjectTypeShaderModule* = 15.VkObjectType
  vkObjectTypePipelineCache* = 16.VkObjectType
  vkObjectTypePipelineLayout* = 17.VkObjectType
  vkObjectTypeRenderPass* = 18.VkObjectType
  vkObjectTypePipeline* = 19.VkObjectType
  vkObjectTypeDescriptorSetLayout* = 20.VkObjectType
  vkObjectTypeSampler* = 21.VkObjectType
  vkObjectTypeDescriptorPool* = 22.VkObjectType
  vkObjectTypeDescriptorSet* = 23.VkObjectType
  vkObjectTypeFramebuffer* = 24.VkObjectType
  vkObjectTypeCommandPool* = 25.VkObjectType
  vkObjectTypeSurfaceKhr* = 1000000000.VkObjectType
  vkObjectTypeSwapchainKhr* = 1000001000.VkObjectType
  vkObjectTypeDisplayKhr* = 1000002000.VkObjectType
  vkObjectTypeDisplayModeKhr* = 1000002001.VkObjectType
  vkObjectTypeDebugReportCallbackExt* = 1000011000.VkObjectType
  vkObjectTypeDescriptorUpdateTemplate* = 1000085000.VkObjectType
  vkObjectTypeObjectTableNvx* = 1000086000.VkObjectType
  vkObjectTypeIndirectCommandsLayoutNvx* = 1000086001.VkObjectType
  vkObjectTypeDebugUtilsMessengerExt* = 1000128000.VkObjectType
  vkObjectTypeSamplerYcbcrConversion* = 1000156000.VkObjectType
  vkObjectTypeValidationCacheExt* = 1000160000.VkObjectType
  vkObjectTypeAccelerationStructureNv* = 1000165000.VkObjectType
  vkObjectTypeDescriptorUpdateTemplateKhr: VkObjectType = vkObjectTypeDescriptorUpdateTemplate
  vkObjectTypeSamplerYcbcrConversionKhr: VkObjectType = vkObjectTypeSamplerYcbcrConversion
  vkObjectTypeBeginRange: VkObjectType = vkObjectTypeUnknown
  vkObjectTypeEndRange: VkObjectType = vkObjectTypeCommandPool
  vkObjectTypeRangeSize: VkObjectType = (vkObjectTypeCommandPool - vkObjectTypeUnknown + 1)
  vkObjectTypeMaxEnum* = 0x7FFFFFFF.VkObjectType

const
  vkVendorIdViv* = 0x00010001.VkVendorId
  vkVendorIdVsi* = 0x00010002.VkVendorId
  vkVendorIdKazan* = 0x00010003.VkVendorId
  vkVendorIdBeginRange: VkVendorId = vkVendorIdViv
  vkVendorIdEndRange: VkVendorId = vkVendorIdKazan
  vkVendorIdRangeSize: VkVendorId = (vkVendorIdKazan - vkVendorIdViv + 1)
  vkVendorIdMaxEnum* = 0x7FFFFFFF.VkVendorId

const
  vkFormatFeatureSampledImageBit* = 0x00000001.VkFormatFeatureFlagBits
  vkFormatFeatureStorageImageBit* = 0x00000002.VkFormatFeatureFlagBits
  vkFormatFeatureStorageImageAtomicBit* = 0x00000004.VkFormatFeatureFlagBits
  vkFormatFeatureUniformTexelBufferBit* = 0x00000008.VkFormatFeatureFlagBits
  vkFormatFeatureStorageTexelBufferBit* = 0x00000010.VkFormatFeatureFlagBits
  vkFormatFeatureStorageTexelBufferAtomicBit* = 0x00000020.VkFormatFeatureFlagBits
  vkFormatFeatureVertexBufferBit* = 0x00000040.VkFormatFeatureFlagBits
  vkFormatFeatureColorAttachmentBit* = 0x00000080.VkFormatFeatureFlagBits
  vkFormatFeatureColorAttachmentBlendBit* = 0x00000100.VkFormatFeatureFlagBits
  vkFormatFeatureDepthStencilAttachmentBit* = 0x00000200.VkFormatFeatureFlagBits
  vkFormatFeatureBlitSrcBit* = 0x00000400.VkFormatFeatureFlagBits
  vkFormatFeatureBlitDstBit* = 0x00000800.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageFilterLinearBit* = 0x00001000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageFilterCubicBitImg* = 0x00002000.VkFormatFeatureFlagBits
  vkFormatFeatureTransferSrcBit* = 0x00004000.VkFormatFeatureFlagBits
  vkFormatFeatureTransferDstBit* = 0x00008000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageFilterMinmaxBitExt* = 0x00010000.VkFormatFeatureFlagBits
  vkFormatFeatureTransferSrcBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureTransferSrcBit
  vkFormatFeatureTransferDstBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureTransferDstBit
  vkFormatFeatureMidpointChromaSamplesBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureMidpointChromaSamplesBit
  vkFormatFeatureSampledImageYcbcrConversionLinearFilterBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageYcbcrConversionLinearFilterBit
  vkFormatFeatureSampledImageYcbcrConversionSeparateReconstructionFilterBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageYcbcrConversionSeparateReconstructionFilterBit
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitBit
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitForceableBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitForceableBit
  vkFormatFeatureDisjointBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureDisjointBit
  vkFormatFeatureCositedChromaSamplesBitKhr: VkFormatFeatureFlagBits = vkFormatFeatureCositedChromaSamplesBit
  vkFormatFeatureMidpointChromaSamplesBit* = 0x00020000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageYcbcrConversionLinearFilterBit* = 0x00040000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageYcbcrConversionSeparateReconstructionFilterBit* = 0x00080000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitBit* = 0x00100000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitForceableBit* = 0x00200000.VkFormatFeatureFlagBits
  vkFormatFeatureDisjointBit* = 0x00400000.VkFormatFeatureFlagBits
  vkFormatFeatureCositedChromaSamplesBit* = 0x00800000.VkFormatFeatureFlagBits
  vkFormatFeatureFlagBitsMaxEnum* = 0x7FFFFFFF.VkFormatFeatureFlagBits

const
  vkImageUsageTransferSrcBit* = 0x00000001.VkImageUsageFlagBits
  vkImageUsageTransferDstBit* = 0x00000002.VkImageUsageFlagBits
  vkImageUsageSampledBit* = 0x00000004.VkImageUsageFlagBits
  vkImageUsageStorageBit* = 0x00000008.VkImageUsageFlagBits
  vkImageUsageColorAttachmentBit* = 0x00000010.VkImageUsageFlagBits
  vkImageUsageDepthStencilAttachmentBit* = 0x00000020.VkImageUsageFlagBits
  vkImageUsageTransientAttachmentBit* = 0x00000040.VkImageUsageFlagBits
  vkImageUsageInputAttachmentBit* = 0x00000080.VkImageUsageFlagBits
  vkImageUsageShadingRateImageBitNv* = 0x00000100.VkImageUsageFlagBits
  vkImageUsageFlagBitsMaxEnum* = 0x7FFFFFFF.VkImageUsageFlagBits

const
  vkImageCreateSparseBindingBit* = 0x00000001.VkImageCreateFlagBits
  vkImageCreateSparseResidencyBit* = 0x00000002.VkImageCreateFlagBits
  vkImageCreateSparseAliasedBit* = 0x00000004.VkImageCreateFlagBits
  vkImageCreateMutableFormatBit* = 0x00000008.VkImageCreateFlagBits
  vkImageCreateCubeCompatibleBit* = 0x00000010.VkImageCreateFlagBits
  vkImageCreate_2DArrayCompatibleBit* = 0x00000020.VkImageCreateFlagBits
  vkImageCreateSplitInstanceBindRegionsBit* = 0x00000040.VkImageCreateFlagBits
  vkImageCreateBlockTexelViewCompatibleBit* = 0x00000080.VkImageCreateFlagBits
  vkImageCreateExtendedUsageBit* = 0x00000100.VkImageCreateFlagBits
  vkImageCreateDisjointBit* = 0x00000200.VkImageCreateFlagBits
  vkImageCreateAliasBit* = 0x00000400.VkImageCreateFlagBits
  vkImageCreateProtectedBit* = 0x00000800.VkImageCreateFlagBits
  vkImageCreateSampleLocationsCompatibleDepthBitExt* = 0x00001000.VkImageCreateFlagBits
  vkImageCreateSplitInstanceBindRegionsBitKhr: VkImageCreateFlagBits = vkImageCreateSplitInstanceBindRegionsBit
  vkImageCreate_2DArrayCompatibleBitKhr: VkImageCreateFlagBits = vkImageCreate_2DArrayCompatibleBit
  vkImageCreateBlockTexelViewCompatibleBitKhr: VkImageCreateFlagBits = vkImageCreateBlockTexelViewCompatibleBit
  vkImageCreateExtendedUsageBitKhr: VkImageCreateFlagBits = vkImageCreateExtendedUsageBit
  vkImageCreateDisjointBitKhr: VkImageCreateFlagBits = vkImageCreateDisjointBit
  vkImageCreateAliasBitKhr: VkImageCreateFlagBits = vkImageCreateAliasBit
  vkImageCreateCornerSampledBitNv* = 0x00002000.VkImageCreateFlagBits
  vkImageCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkImageCreateFlagBits

const
  vkSampleCount_1Bit* = 0x00000001.VkSampleCountFlagBits
  vkSampleCount_2Bit* = 0x00000002.VkSampleCountFlagBits
  vkSampleCount_4Bit* = 0x00000004.VkSampleCountFlagBits
  vkSampleCount_8Bit* = 0x00000008.VkSampleCountFlagBits
  vkSampleCount_16Bit* = 0x00000010.VkSampleCountFlagBits
  vkSampleCount_32Bit* = 0x00000020.VkSampleCountFlagBits
  vkSampleCount_64Bit* = 0x00000040.VkSampleCountFlagBits
  vkSampleCountFlagBitsMaxEnum* = 0x7FFFFFFF.VkSampleCountFlagBits

const
  vkQueueGraphicsBit* = 0x00000001.VkQueueFlagBits
  vkQueueComputeBit* = 0x00000002.VkQueueFlagBits
  vkQueueTransferBit* = 0x00000004.VkQueueFlagBits
  vkQueueSparseBindingBit* = 0x00000008.VkQueueFlagBits
  vkQueueProtectedBit* = 0x00000010.VkQueueFlagBits
  vkQueueFlagBitsMaxEnum* = 0x7FFFFFFF.VkQueueFlagBits

const
  vkMemoryPropertyDeviceLocalBit* = 0x00000001.VkMemoryPropertyFlagBits
  vkMemoryPropertyHostVisibleBit* = 0x00000002.VkMemoryPropertyFlagBits
  vkMemoryPropertyHostCoherentBit* = 0x00000004.VkMemoryPropertyFlagBits
  vkMemoryPropertyHostCachedBit* = 0x00000008.VkMemoryPropertyFlagBits
  vkMemoryPropertyLazilyAllocatedBit* = 0x00000010.VkMemoryPropertyFlagBits
  vkMemoryPropertyProtectedBit* = 0x00000020.VkMemoryPropertyFlagBits
  vkMemoryPropertyFlagBitsMaxEnum* = 0x7FFFFFFF.VkMemoryPropertyFlagBits

const
  vkMemoryHeapDeviceLocalBit* = 0x00000001.VkMemoryHeapFlagBits
  vkMemoryHeapMultiInstanceBit* = 0x00000002.VkMemoryHeapFlagBits
  vkMemoryHeapMultiInstanceBitKhr: VkMemoryHeapFlagBits = vkMemoryHeapMultiInstanceBit
  vkMemoryHeapFlagBitsMaxEnum* = 0x7FFFFFFF.VkMemoryHeapFlagBits

const
  vkDeviceQueueCreateProtectedBit* = 0x00000001.VkDeviceQueueCreateFlagBits
  vkDeviceQueueCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkDeviceQueueCreateFlagBits

const
  vkPipelineStageTopOfPipeBit* = 0x00000001.VkPipelineStageFlagBits
  vkPipelineStageDrawIndirectBit* = 0x00000002.VkPipelineStageFlagBits
  vkPipelineStageVertexInputBit* = 0x00000004.VkPipelineStageFlagBits
  vkPipelineStageVertexShaderBit* = 0x00000008.VkPipelineStageFlagBits
  vkPipelineStageTessellationControlShaderBit* = 0x00000010.VkPipelineStageFlagBits
  vkPipelineStageTessellationEvaluationShaderBit* = 0x00000020.VkPipelineStageFlagBits
  vkPipelineStageGeometryShaderBit* = 0x00000040.VkPipelineStageFlagBits
  vkPipelineStageFragmentShaderBit* = 0x00000080.VkPipelineStageFlagBits
  vkPipelineStageEarlyFragmentTestsBit* = 0x00000100.VkPipelineStageFlagBits
  vkPipelineStageLateFragmentTestsBit* = 0x00000200.VkPipelineStageFlagBits
  vkPipelineStageColorAttachmentOutputBit* = 0x00000400.VkPipelineStageFlagBits
  vkPipelineStageComputeShaderBit* = 0x00000800.VkPipelineStageFlagBits
  vkPipelineStageTransferBit* = 0x00001000.VkPipelineStageFlagBits
  vkPipelineStageBottomOfPipeBit* = 0x00002000.VkPipelineStageFlagBits
  vkPipelineStageHostBit* = 0x00004000.VkPipelineStageFlagBits
  vkPipelineStageAllGraphicsBit* = 0x00008000.VkPipelineStageFlagBits
  vkPipelineStageAllCommandsBit* = 0x00010000.VkPipelineStageFlagBits
  vkPipelineStageCommandProcessBitNvx* = 0x00020000.VkPipelineStageFlagBits
  vkPipelineStageConditionalRenderingBitExt* = 0x00040000.VkPipelineStageFlagBits
  vkPipelineStageTaskShaderBitNv* = 0x00080000.VkPipelineStageFlagBits
  vkPipelineStageMeshShaderBitNv* = 0x00100000.VkPipelineStageFlagBits
  vkPipelineStageRayTracingShaderBitNv* = 0x00200000.VkPipelineStageFlagBits
  vkPipelineStageShadingRateImageBitNv* = 0x00400000.VkPipelineStageFlagBits
  vkPipelineStageTransformFeedbackBitExt* = 0x01000000.VkPipelineStageFlagBits
  vkPipelineStageAccelerationStructureBuildBitNv* = 0x02000000.VkPipelineStageFlagBits
  vkPipelineStageFlagBitsMaxEnum* = 0x7FFFFFFF.VkPipelineStageFlagBits

const
  vkImageAspectColorBit* = 0x00000001.VkImageAspectFlagBits
  vkImageAspectDepthBit* = 0x00000002.VkImageAspectFlagBits
  vkImageAspectStencilBit* = 0x00000004.VkImageAspectFlagBits
  vkImageAspectMetadataBit* = 0x00000008.VkImageAspectFlagBits
  vkImageAspectPlane_0Bit* = 0x00000010.VkImageAspectFlagBits
  vkImageAspectPlane_1Bit* = 0x00000020.VkImageAspectFlagBits
  vkImageAspectPlane_2Bit* = 0x00000040.VkImageAspectFlagBits
  vkImageAspectMemoryPlane_0BitExt* = 0x00000080.VkImageAspectFlagBits
  vkImageAspectMemoryPlane_1BitExt* = 0x00000100.VkImageAspectFlagBits
  vkImageAspectMemoryPlane_2BitExt* = 0x00000200.VkImageAspectFlagBits
  vkImageAspectMemoryPlane_3BitExt* = 0x00000400.VkImageAspectFlagBits
  vkImageAspectPlane_0BitKhr: VkImageAspectFlagBits = vkImageAspectPlane_0Bit
  vkImageAspectPlane_1BitKhr: VkImageAspectFlagBits = vkImageAspectPlane_1Bit
  vkImageAspectPlane_2BitKhr: VkImageAspectFlagBits = vkImageAspectPlane_2Bit
  vkImageAspectFlagBitsMaxEnum* = 0x7FFFFFFF.VkImageAspectFlagBits

const
  vkSparseImageFormatSingleMiptailBit* = 0x00000001.VkSparseImageFormatFlagBits
  vkSparseImageFormatAlignedMipSizeBit* = 0x00000002.VkSparseImageFormatFlagBits
  vkSparseImageFormatNonstandardBlockSizeBit* = 0x00000004.VkSparseImageFormatFlagBits
  vkSparseImageFormatFlagBitsMaxEnum* = 0x7FFFFFFF.VkSparseImageFormatFlagBits

const
  vkSparseMemoryBindMetadataBit* = 0x00000001.VkSparseMemoryBindFlagBits
  vkSparseMemoryBindFlagBitsMaxEnum* = 0x7FFFFFFF.VkSparseMemoryBindFlagBits

const
  vkFenceCreateSignaledBit* = 0x00000001.VkFenceCreateFlagBits
  vkFenceCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkFenceCreateFlagBits

const
  vkQueryPipelineStatisticInputAssemblyVerticesBit* = 0x00000001.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticInputAssemblyPrimitivesBit* = 0x00000002.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticVertexShaderInvocationsBit* = 0x00000004.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticGeometryShaderInvocationsBit* = 0x00000008.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticGeometryShaderPrimitivesBit* = 0x00000010.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticClippingInvocationsBit* = 0x00000020.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticClippingPrimitivesBit* = 0x00000040.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticFragmentShaderInvocationsBit* = 0x00000080.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticTessellationControlShaderPatchesBit* = 0x00000100.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticTessellationEvaluationShaderInvocationsBit* = 0x00000200.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticComputeShaderInvocationsBit* = 0x00000400.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticFlagBitsMaxEnum* = 0x7FFFFFFF.VkQueryPipelineStatisticFlagBits

const
  vkQueryResult_64Bit* = 0x00000001.VkQueryResultFlagBits
  vkQueryResultWaitBit* = 0x00000002.VkQueryResultFlagBits
  vkQueryResultWithAvailabilityBit* = 0x00000004.VkQueryResultFlagBits
  vkQueryResultPartialBit* = 0x00000008.VkQueryResultFlagBits
  vkQueryResultFlagBitsMaxEnum* = 0x7FFFFFFF.VkQueryResultFlagBits

const
  vkBufferCreateSparseBindingBit* = 0x00000001.VkBufferCreateFlagBits
  vkBufferCreateSparseResidencyBit* = 0x00000002.VkBufferCreateFlagBits
  vkBufferCreateSparseAliasedBit* = 0x00000004.VkBufferCreateFlagBits
  vkBufferCreateProtectedBit* = 0x00000008.VkBufferCreateFlagBits
  vkBufferCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkBufferCreateFlagBits

const
  vkBufferUsageTransferSrcBit* = 0x00000001.VkBufferUsageFlagBits
  vkBufferUsageTransferDstBit* = 0x00000002.VkBufferUsageFlagBits
  vkBufferUsageUniformTexelBufferBit* = 0x00000004.VkBufferUsageFlagBits
  vkBufferUsageStorageTexelBufferBit* = 0x00000008.VkBufferUsageFlagBits
  vkBufferUsageUniformBufferBit* = 0x00000010.VkBufferUsageFlagBits
  vkBufferUsageStorageBufferBit* = 0x00000020.VkBufferUsageFlagBits
  vkBufferUsageIndexBufferBit* = 0x00000040.VkBufferUsageFlagBits
  vkBufferUsageVertexBufferBit* = 0x00000080.VkBufferUsageFlagBits
  vkBufferUsageIndirectBufferBit* = 0x00000100.VkBufferUsageFlagBits
  vkBufferUsageConditionalRenderingBitExt* = 0x00000200.VkBufferUsageFlagBits
  vkBufferUsageRayTracingBitNv* = 0x00000400.VkBufferUsageFlagBits
  vkBufferUsageTransformFeedbackBufferBitExt* = 0x00000800.VkBufferUsageFlagBits
  vkBufferUsageTransformFeedbackCounterBufferBitExt* = 0x00001000.VkBufferUsageFlagBits
  vkBufferUsageFlagBitsMaxEnum* = 0x7FFFFFFF.VkBufferUsageFlagBits

const
  vkPipelineCreateDisableOptimizationBit* = 0x00000001.VkPipelineCreateFlagBits
  vkPipelineCreateAllowDerivativesBit* = 0x00000002.VkPipelineCreateFlagBits
  vkPipelineCreateDerivativeBit* = 0x00000004.VkPipelineCreateFlagBits
  vkPipelineCreateViewIndexFromDeviceIndexBit* = 0x00000008.VkPipelineCreateFlagBits
  vkPipelineCreateDispatchBase* = 0x00000010.VkPipelineCreateFlagBits
  vkPipelineCreateDeferCompileBitNv* = 0x00000020.VkPipelineCreateFlagBits
  vkPipelineCreateViewIndexFromDeviceIndexBitKhr: VkPipelineCreateFlagBits = vkPipelineCreateViewIndexFromDeviceIndexBit
  vkPipelineCreateDispatchBaseKhr: VkPipelineCreateFlagBits = vkPipelineCreateDispatchBase
  vkPipelineCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkPipelineCreateFlagBits

const
  vkShaderStageVertexBit* = 0x00000001.VkShaderStageFlagBits
  vkShaderStageTessellationControlBit* = 0x00000002.VkShaderStageFlagBits
  vkShaderStageTessellationEvaluationBit* = 0x00000004.VkShaderStageFlagBits
  vkShaderStageGeometryBit* = 0x00000008.VkShaderStageFlagBits
  vkShaderStageFragmentBit* = 0x00000010.VkShaderStageFlagBits
  vkShaderStageAllGraphics* = 0x0000001F.VkShaderStageFlagBits
  vkShaderStageComputeBit* = 0x00000020.VkShaderStageFlagBits
  vkShaderStageTaskBitNv* = 0x00000040.VkShaderStageFlagBits
  vkShaderStageMeshBitNv* = 0x00000080.VkShaderStageFlagBits
  vkShaderStageRaygenBitNv* = 0x00000100.VkShaderStageFlagBits
  vkShaderStageAnyHitBitNv* = 0x00000200.VkShaderStageFlagBits
  vkShaderStageClosestHitBitNv* = 0x00000400.VkShaderStageFlagBits
  vkShaderStageMissBitNv* = 0x00000800.VkShaderStageFlagBits
  vkShaderStageIntersectionBitNv* = 0x00001000.VkShaderStageFlagBits
  vkShaderStageCallableBitNv* = 0x00002000.VkShaderStageFlagBits
  vkShaderStageAll* = 0x7FFFFFFF.VkShaderStageFlagBits
  vkShaderStageFlagBitsMaxEnum* = 0x7FFFFFFF.VkShaderStageFlagBits

const
  vkCullModeNone* = 0.VkCullModeFlagBits
  vkCullModeFrontBit* = 0x00000001.VkCullModeFlagBits
  vkCullModeBackBit* = 0x00000002.VkCullModeFlagBits
  vkCullModeFrontAndBack* = 0x00000003.VkCullModeFlagBits
  vkCullModeFlagBitsMaxEnum* = 0x7FFFFFFF.VkCullModeFlagBits

const
  vkColorComponentRBit* = 0x00000001.VkColorComponentFlagBits
  vkColorComponentGBit* = 0x00000002.VkColorComponentFlagBits
  vkColorComponentBBit* = 0x00000004.VkColorComponentFlagBits
  vkColorComponentABit* = 0x00000008.VkColorComponentFlagBits
  vkColorComponentFlagBitsMaxEnum* = 0x7FFFFFFF.VkColorComponentFlagBits

const
  vkDescriptorSetLayoutCreatePushDescriptorBitKhr* = 0x00000001.VkDescriptorSetLayoutCreateFlagBits
  vkDescriptorSetLayoutCreateUpdateAfterBindPoolBitExt* = 0x00000002.VkDescriptorSetLayoutCreateFlagBits
  vkDescriptorSetLayoutCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkDescriptorSetLayoutCreateFlagBits

const
  vkDescriptorPoolCreateFreeDescriptorSetBit* = 0x00000001.VkDescriptorPoolCreateFlagBits
  vkDescriptorPoolCreateUpdateAfterBindBitExt* = 0x00000002.VkDescriptorPoolCreateFlagBits
  vkDescriptorPoolCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkDescriptorPoolCreateFlagBits

const
  vkAttachmentDescriptionMayAliasBit* = 0x00000001.VkAttachmentDescriptionFlagBits
  vkAttachmentDescriptionFlagBitsMaxEnum* = 0x7FFFFFFF.VkAttachmentDescriptionFlagBits

const
  vkSubpassDescriptionPerViewAttributesBitNvx* = 0x00000001.VkSubpassDescriptionFlagBits
  vkSubpassDescriptionPerViewPositionXOnlyBitNvx* = 0x00000002.VkSubpassDescriptionFlagBits
  vkSubpassDescriptionFlagBitsMaxEnum* = 0x7FFFFFFF.VkSubpassDescriptionFlagBits

const
  vkAccessIndirectCommandReadBit* = 0x00000001.VkAccessFlagBits
  vkAccessIndexReadBit* = 0x00000002.VkAccessFlagBits
  vkAccessVertexAttributeReadBit* = 0x00000004.VkAccessFlagBits
  vkAccessUniformReadBit* = 0x00000008.VkAccessFlagBits
  vkAccessInputAttachmentReadBit* = 0x00000010.VkAccessFlagBits
  vkAccessShaderReadBit* = 0x00000020.VkAccessFlagBits
  vkAccessShaderWriteBit* = 0x00000040.VkAccessFlagBits
  vkAccessColorAttachmentReadBit* = 0x00000080.VkAccessFlagBits
  vkAccessColorAttachmentWriteBit* = 0x00000100.VkAccessFlagBits
  vkAccessDepthStencilAttachmentReadBit* = 0x00000200.VkAccessFlagBits
  vkAccessDepthStencilAttachmentWriteBit* = 0x00000400.VkAccessFlagBits
  vkAccessTransferReadBit* = 0x00000800.VkAccessFlagBits
  vkAccessTransferWriteBit* = 0x00001000.VkAccessFlagBits
  vkAccessHostReadBit* = 0x00002000.VkAccessFlagBits
  vkAccessHostWriteBit* = 0x00004000.VkAccessFlagBits
  vkAccessMemoryReadBit* = 0x00008000.VkAccessFlagBits
  vkAccessMemoryWriteBit* = 0x00010000.VkAccessFlagBits
  vkAccessCommandProcessReadBitNvx* = 0x00020000.VkAccessFlagBits
  vkAccessCommandProcessWriteBitNvx* = 0x00040000.VkAccessFlagBits
  vkAccessColorAttachmentReadNoncoherentBitExt* = 0x00080000.VkAccessFlagBits
  vkAccessConditionalRenderingReadBitExt* = 0x00100000.VkAccessFlagBits
  vkAccessAccelerationStructureReadBitNv* = 0x00200000.VkAccessFlagBits
  vkAccessAccelerationStructureWriteBitNv* = 0x00400000.VkAccessFlagBits
  vkAccessShadingRateImageReadBitNv* = 0x00800000.VkAccessFlagBits
  vkAccessTransformFeedbackWriteBitExt* = 0x02000000.VkAccessFlagBits
  vkAccessTransformFeedbackCounterReadBitExt* = 0x04000000.VkAccessFlagBits
  vkAccessTransformFeedbackCounterWriteBitExt* = 0x08000000.VkAccessFlagBits
  vkAccessFlagBitsMaxEnum* = 0x7FFFFFFF.VkAccessFlagBits

const
  vkDependencyByRegionBit* = 0x00000001.VkDependencyFlagBits
  vkDependencyViewLocalBit* = 0x00000002.VkDependencyFlagBits
  vkDependencyViewLocalBitKhr: VkDependencyFlagBits = vkDependencyViewLocalBit
  vkDependencyDeviceGroupBitKhr: VkDependencyFlagBits = vkDependencyDeviceGroupBit
  vkDependencyDeviceGroupBit* = 0x00000004.VkDependencyFlagBits
  vkDependencyFlagBitsMaxEnum* = 0x7FFFFFFF.VkDependencyFlagBits

const
  vkCommandPoolCreateTransientBit* = 0x00000001.VkCommandPoolCreateFlagBits
  vkCommandPoolCreateResetCommandBufferBit* = 0x00000002.VkCommandPoolCreateFlagBits
  vkCommandPoolCreateProtectedBit* = 0x00000004.VkCommandPoolCreateFlagBits
  vkCommandPoolCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkCommandPoolCreateFlagBits

const
  vkCommandPoolResetReleaseResourcesBit* = 0x00000001.VkCommandPoolResetFlagBits
  vkCommandPoolResetFlagBitsMaxEnum* = 0x7FFFFFFF.VkCommandPoolResetFlagBits

const
  vkCommandBufferUsageOneTimeSubmitBit* = 0x00000001.VkCommandBufferUsageFlagBits
  vkCommandBufferUsageRenderPassContinueBit* = 0x00000002.VkCommandBufferUsageFlagBits
  vkCommandBufferUsageSimultaneousUseBit* = 0x00000004.VkCommandBufferUsageFlagBits
  vkCommandBufferUsageFlagBitsMaxEnum* = 0x7FFFFFFF.VkCommandBufferUsageFlagBits

const
  vkQueryControlPreciseBit* = 0x00000001.VkQueryControlFlagBits
  vkQueryControlFlagBitsMaxEnum* = 0x7FFFFFFF.VkQueryControlFlagBits

const
  vkCommandBufferResetReleaseResourcesBit* = 0x00000001.VkCommandBufferResetFlagBits
  vkCommandBufferResetFlagBitsMaxEnum* = 0x7FFFFFFF.VkCommandBufferResetFlagBits

const
  vkStencilFaceFrontBit* = 0x00000001.VkStencilFaceFlagBits
  vkStencilFaceBackBit* = 0x00000002.VkStencilFaceFlagBits
  vkStencilFrontAndBack* = 0x00000003.VkStencilFaceFlagBits
  vkStencilFaceFlagBitsMaxEnum* = 0x7FFFFFFF.VkStencilFaceFlagBits

const
  vkRenderPassCreateFlagBitsMaxEnum* = 0x7FFFFFFF.VkRenderPassCreateFlagBits

when not defined(vkNoPrototypes):
  proc vkCreateInstance*(pCreateInfo: ptr VkInstanceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pInstance: ptr VkInstance): VkResult {.cdecl, importc.}
  proc vkDestroyInstance*(instance: VkInstance; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkEnumeratePhysicalDevices*(instance: VkInstance; pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr VkPhysicalDevice): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceFeatures*(physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures) {.cdecl, importc.}
  proc vkGetPhysicalDeviceFormatProperties*(physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceImageFormatProperties*(physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; pImageFormatProperties: ptr VkImageFormatProperties): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceProperties*(physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceQueueFamilyProperties*(physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceMemoryProperties*(physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties) {.cdecl, importc.}
  proc vkGetInstanceProcAddr*(instance: VkInstance; pName: cstring): PFNVkvoidfunction {.cdecl, importc.}
  proc vkGetDeviceProcAddr*(device: VkDevice; pName: cstring): PFNVkvoidfunction {.cdecl, importc.}
  proc vkCreateDevice*(physicalDevice: VkPhysicalDevice; pCreateInfo: ptr VkDeviceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDevice: ptr VkDevice): VkResult {.cdecl, importc.}
  proc vkDestroyDevice*(device: VkDevice; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkEnumerateInstanceExtensionProperties*(pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateDeviceExtensionProperties*(physicalDevice: VkPhysicalDevice; pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateInstanceLayerProperties*(pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateDeviceLayerProperties*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl, importc.}
  proc vkGetDeviceQueue*(device: VkDevice; queueFamilyIndex: uint32; queueIndex: uint32; pQueue: ptr VkQueue) {.cdecl, importc.}
  proc vkQueueSubmit*(queue: VkQueue; submitCount: uint32; pSubmits: ptr VkSubmitInfo; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkQueueWaitIdle*(queue: VkQueue): VkResult {.cdecl, importc.}
  proc vkDeviceWaitIdle*(device: VkDevice): VkResult {.cdecl, importc.}
  proc vkAllocateMemory*(device: VkDevice; pAllocateInfo: ptr VkMemoryAllocateInfo; pAllocator: ptr VkAllocationCallbacks; pMemory: ptr VkDeviceMemory): VkResult {.cdecl, importc.}
  proc vkFreeMemory*(device: VkDevice; memory: VkDeviceMemory; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkMapMemory*(device: VkDevice; memory: VkDeviceMemory; offset: VkDeviceSize; size: VkDeviceSize; flags: VkMemoryMapFlags; ppData: ptr pointer): VkResult {.cdecl, importc.}
  proc vkUnmapMemory*(device: VkDevice; memory: VkDeviceMemory) {.cdecl, importc.}
  proc vkFlushMappedMemoryRanges*(device: VkDevice; memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult {.cdecl, importc.}
  proc vkInvalidateMappedMemoryRanges*(device: VkDevice; memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult {.cdecl, importc.}
  proc vkGetDeviceMemoryCommitment*(device: VkDevice; memory: VkDeviceMemory; pCommittedMemoryInBytes: ptr VkDeviceSize) {.cdecl, importc.}
  proc vkBindBufferMemory*(device: VkDevice; buffer: VkBuffer; memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult {.cdecl, importc.}
  proc vkBindImageMemory*(device: VkDevice; image: VkImage; memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult {.cdecl, importc.}
  proc vkGetBufferMemoryRequirements*(device: VkDevice; buffer: VkBuffer; pMemoryRequirements: ptr VkMemoryRequirements) {.cdecl, importc.}
  proc vkGetImageMemoryRequirements*(device: VkDevice; image: VkImage; pMemoryRequirements: ptr VkMemoryRequirements) {.cdecl, importc.}
  proc vkGetImageSparseMemoryRequirements*(device: VkDevice; image: VkImage; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements) {.cdecl, importc.}
  proc vkGetPhysicalDeviceSparseImageFormatProperties*(physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; samples: VkSampleCountFlagBits; usage: VkImageUsageFlags; tiling: VkImageTiling; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties) {.cdecl, importc.}
  proc vkQueueBindSparse*(queue: VkQueue; bindInfoCount: uint32; pBindInfo: ptr VkBindSparseInfo; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkCreateFence*(device: VkDevice; pCreateInfo: ptr VkFenceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkDestroyFence*(device: VkDevice; fence: VkFence; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkResetFences*(device: VkDevice; fenceCount: uint32; pFences: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkGetFenceStatus*(device: VkDevice; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkWaitForFences*(device: VkDevice; fenceCount: uint32; pFences: ptr VkFence; waitAll: VkBool32; timeout: uint64): VkResult {.cdecl, importc.}
  proc vkCreateSemaphore*(device: VkDevice; pCreateInfo: ptr VkSemaphoreCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSemaphore: ptr VkSemaphore): VkResult {.cdecl, importc.}
  proc vkDestroySemaphore*(device: VkDevice; semaphore: VkSemaphore; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateEvent*(device: VkDevice; pCreateInfo: ptr VkEventCreateInfo; pAllocator: ptr VkAllocationCallbacks; pEvent: ptr VkEvent): VkResult {.cdecl, importc.}
  proc vkDestroyEvent*(device: VkDevice; event: VkEvent; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetEventStatus*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkSetEvent*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkResetEvent*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkCreateQueryPool*(device: VkDevice; pCreateInfo: ptr VkQueryPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pQueryPool: ptr VkQueryPool): VkResult {.cdecl, importc.}
  proc vkDestroyQueryPool*(device: VkDevice; queryPool: VkQueryPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetQueryPoolResults*(device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dataSize: csize; pData: pointer; stride: VkDeviceSize; flags: VkQueryResultFlags): VkResult {.cdecl, importc.}
  proc vkCreateBuffer*(device: VkDevice; pCreateInfo: ptr VkBufferCreateInfo; pAllocator: ptr VkAllocationCallbacks; pBuffer: ptr VkBuffer): VkResult {.cdecl, importc.}
  proc vkDestroyBuffer*(device: VkDevice; buffer: VkBuffer; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateBufferView*(device: VkDevice; pCreateInfo: ptr VkBufferViewCreateInfo; pAllocator: ptr VkAllocationCallbacks; pView: ptr VkBufferView): VkResult {.cdecl, importc.}
  proc vkDestroyBufferView*(device: VkDevice; bufferView: VkBufferView; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateImage*(device: VkDevice; pCreateInfo: ptr VkImageCreateInfo; pAllocator: ptr VkAllocationCallbacks; pImage: ptr VkImage): VkResult {.cdecl, importc.}
  proc vkDestroyImage*(device: VkDevice; image: VkImage; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetImageSubresourceLayout*(device: VkDevice; image: VkImage; pSubresource: ptr VkImageSubresource; pLayout: ptr VkSubresourceLayout) {.cdecl, importc.}
  proc vkCreateImageView*(device: VkDevice; pCreateInfo: ptr VkImageViewCreateInfo; pAllocator: ptr VkAllocationCallbacks; pView: ptr VkImageView): VkResult {.cdecl, importc.}
  proc vkDestroyImageView*(device: VkDevice; imageView: VkImageView; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateShaderModule*(device: VkDevice; pCreateInfo: ptr VkShaderModuleCreateInfo; pAllocator: ptr VkAllocationCallbacks; pShaderModule: ptr VkShaderModule): VkResult {.cdecl, importc.}
  proc vkDestroyShaderModule*(device: VkDevice; shaderModule: VkShaderModule; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreatePipelineCache*(device: VkDevice; pCreateInfo: ptr VkPipelineCacheCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelineCache: ptr VkPipelineCache): VkResult {.cdecl, importc.}
  proc vkDestroyPipelineCache*(device: VkDevice; pipelineCache: VkPipelineCache; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetPipelineCacheData*(device: VkDevice; pipelineCache: VkPipelineCache; pDataSize: ptr csize; pData: pointer): VkResult {.cdecl, importc.}
  proc vkMergePipelineCaches*(device: VkDevice; dstCache: VkPipelineCache; srcCacheCount: uint32; pSrcCaches: ptr VkPipelineCache): VkResult {.cdecl, importc.}
  proc vkCreateGraphicsPipelines*(device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkGraphicsPipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkCreateComputePipelines*(device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkComputePipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkDestroyPipeline*(device: VkDevice; pipeline: VkPipeline; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreatePipelineLayout*(device: VkDevice; pCreateInfo: ptr VkPipelineLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelineLayout: ptr VkPipelineLayout): VkResult {.cdecl, importc.}
  proc vkDestroyPipelineLayout*(device: VkDevice; pipelineLayout: VkPipelineLayout; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateSampler*(device: VkDevice; pCreateInfo: ptr VkSamplerCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSampler: ptr VkSampler): VkResult {.cdecl, importc.}
  proc vkDestroySampler*(device: VkDevice; sampler: VkSampler; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateDescriptorSetLayout*(device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSetLayout: ptr VkDescriptorSetLayout): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorSetLayout*(device: VkDevice; descriptorSetLayout: VkDescriptorSetLayout; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateDescriptorPool*(device: VkDevice; pCreateInfo: ptr VkDescriptorPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDescriptorPool: ptr VkDescriptorPool): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorPool*(device: VkDevice; descriptorPool: VkDescriptorPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkResetDescriptorPool*(device: VkDevice; descriptorPool: VkDescriptorPool; flags: VkDescriptorPoolResetFlags): VkResult {.cdecl, importc.}
  proc vkAllocateDescriptorSets*(device: VkDevice; pAllocateInfo: ptr VkDescriptorSetAllocateInfo; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl, importc.}
  proc vkFreeDescriptorSets*(device: VkDevice; descriptorPool: VkDescriptorPool; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl, importc.}
  proc vkUpdateDescriptorSets*(device: VkDevice; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet; descriptorCopyCount: uint32; pDescriptorCopies: ptr VkCopyDescriptorSet) {.cdecl, importc.}
  proc vkCreateFramebuffer*(device: VkDevice; pCreateInfo: ptr VkFramebufferCreateInfo; pAllocator: ptr VkAllocationCallbacks; pFramebuffer: ptr VkFramebuffer): VkResult {.cdecl, importc.}
  proc vkDestroyFramebuffer*(device: VkDevice; framebuffer: VkFramebuffer; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateRenderPass*(device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo; pAllocator: ptr VkAllocationCallbacks; pRenderPass: ptr VkRenderPass): VkResult {.cdecl, importc.}
  proc vkDestroyRenderPass*(device: VkDevice; renderPass: VkRenderPass; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetRenderAreaGranularity*(device: VkDevice; renderPass: VkRenderPass; pGranularity: ptr VkExtent2D) {.cdecl, importc.}
  proc vkCreateCommandPool*(device: VkDevice; pCreateInfo: ptr VkCommandPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pCommandPool: ptr VkCommandPool): VkResult {.cdecl, importc.}
  proc vkDestroyCommandPool*(device: VkDevice; commandPool: VkCommandPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkResetCommandPool*(device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolResetFlags): VkResult {.cdecl, importc.}
  proc vkAllocateCommandBuffers*(device: VkDevice; pAllocateInfo: ptr VkCommandBufferAllocateInfo; pCommandBuffers: ptr VkCommandBuffer): VkResult {.cdecl, importc.}
  proc vkFreeCommandBuffers*(device: VkDevice; commandPool: VkCommandPool; commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer) {.cdecl, importc.}
  proc vkBeginCommandBuffer*(commandBuffer: VkCommandBuffer; pBeginInfo: ptr VkCommandBufferBeginInfo): VkResult {.cdecl, importc.}
  proc vkEndCommandBuffer*(commandBuffer: VkCommandBuffer): VkResult {.cdecl, importc.}
  proc vkResetCommandBuffer*(commandBuffer: VkCommandBuffer; flags: VkCommandBufferResetFlags): VkResult {.cdecl, importc.}
  proc vkCmdBindPipeline*(commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; pipeline: VkPipeline) {.cdecl, importc.}
  proc vkCmdSetViewport*(commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewports: ptr VkViewport) {.cdecl, importc.}
  proc vkCmdSetScissor*(commandBuffer: VkCommandBuffer; firstScissor: uint32; scissorCount: uint32; pScissors: ptr VkRect2D) {.cdecl, importc.}
  proc vkCmdSetLineWidth*(commandBuffer: VkCommandBuffer; lineWidth: cfloat) {.cdecl, importc.}
  proc vkCmdSetDepthBias*(commandBuffer: VkCommandBuffer; depthBiasConstantFactor: cfloat; depthBiasClamp: cfloat; depthBiasSlopeFactor: cfloat) {.cdecl, importc.}
  proc vkCmdSetBlendConstants*(commandBuffer: VkCommandBuffer; blendConstants: array[4, cfloat]) {.cdecl, importc.}
  proc vkCmdSetDepthBounds*(commandBuffer: VkCommandBuffer; minDepthBounds: cfloat; maxDepthBounds: cfloat) {.cdecl, importc.}
  proc vkCmdSetStencilCompareMask*(commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; compareMask: uint32) {.cdecl, importc.}
  proc vkCmdSetStencilWriteMask*(commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; writeMask: uint32) {.cdecl, importc.}
  proc vkCmdSetStencilReference*(commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; reference: uint32) {.cdecl, importc.}
  proc vkCmdBindDescriptorSets*(commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout; firstSet: uint32; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet; dynamicOffsetCount: uint32; pDynamicOffsets: ptr uint32) {.cdecl, importc.}
  proc vkCmdBindIndexBuffer*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; indexType: VkIndexType) {.cdecl, importc.}
  proc vkCmdBindVertexBuffers*(commandBuffer: VkCommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer; pOffsets: ptr VkDeviceSize) {.cdecl, importc.}
  proc vkCmdDraw*(commandBuffer: VkCommandBuffer; vertexCount: uint32; instanceCount: uint32; firstVertex: uint32; firstInstance: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexed*(commandBuffer: VkCommandBuffer; indexCount: uint32; instanceCount: uint32; firstIndex: uint32; vertexOffset: int32; firstInstance: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndirect*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexedIndirect*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDispatch*(commandBuffer: VkCommandBuffer; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl, importc.}
  proc vkCmdDispatchIndirect*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize) {.cdecl, importc.}
  proc vkCmdCopyBuffer*(commandBuffer: VkCommandBuffer; srcBuffer: VkBuffer; dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferCopy) {.cdecl, importc.}
  proc vkCmdCopyImage*(commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageCopy) {.cdecl, importc.}
  proc vkCmdBlitImage*(commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageBlit; filter: VkFilter) {.cdecl, importc.}
  proc vkCmdCopyBufferToImage*(commandBuffer: VkCommandBuffer; srcBuffer: VkBuffer; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkBufferImageCopy) {.cdecl, importc.}
  proc vkCmdCopyImageToBuffer*(commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferImageCopy) {.cdecl, importc.}
  proc vkCmdUpdateBuffer*(commandBuffer: VkCommandBuffer; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; dataSize: VkDeviceSize; pData: pointer) {.cdecl, importc.}
  proc vkCmdFillBuffer*(commandBuffer: VkCommandBuffer; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; size: VkDeviceSize; data: uint32) {.cdecl, importc.}
  proc vkCmdClearColorImage*(commandBuffer: VkCommandBuffer; image: VkImage; imageLayout: VkImageLayout; pColor: ptr VkClearColorValue; rangeCount: uint32; pRanges: ptr VkImageSubresourceRange) {.cdecl, importc.}
  proc vkCmdClearDepthStencilImage*(commandBuffer: VkCommandBuffer; image: VkImage; imageLayout: VkImageLayout; pDepthStencil: ptr VkClearDepthStencilValue; rangeCount: uint32; pRanges: ptr VkImageSubresourceRange) {.cdecl, importc.}
  proc vkCmdClearAttachments*(commandBuffer: VkCommandBuffer; attachmentCount: uint32; pAttachments: ptr VkClearAttachment; rectCount: uint32; pRects: ptr VkClearRect) {.cdecl, importc.}
  proc vkCmdResolveImage*(commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageResolve) {.cdecl, importc.}
  proc vkCmdSetEvent*(commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags) {.cdecl, importc.}
  proc vkCmdResetEvent*(commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags) {.cdecl, importc.}
  proc vkCmdWaitEvents*(commandBuffer: VkCommandBuffer; eventCount: uint32; pEvents: ptr VkEvent; srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr VkBufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr VkImageMemoryBarrier) {.cdecl, importc.}
  proc vkCmdPipelineBarrier*(commandBuffer: VkCommandBuffer; srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags; dependencyFlags: VkDependencyFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr VkBufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr VkImageMemoryBarrier) {.cdecl, importc.}
  proc vkCmdBeginQuery*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32; flags: VkQueryControlFlags) {.cdecl, importc.}
  proc vkCmdEndQuery*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32) {.cdecl, importc.}
  proc vkCmdResetQueryPool*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32) {.cdecl, importc.}
  proc vkCmdWriteTimestamp*(commandBuffer: VkCommandBuffer; pipelineStage: VkPipelineStageFlagBits; queryPool: VkQueryPool; query: uint32) {.cdecl, importc.}
  proc vkCmdCopyQueryPoolResults*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; stride: VkDeviceSize; flags: VkQueryResultFlags) {.cdecl, importc.}
  proc vkCmdPushConstants*(commandBuffer: VkCommandBuffer; layout: VkPipelineLayout; stageFlags: VkShaderStageFlags; offset: uint32; size: uint32; pValues: pointer) {.cdecl, importc.}
  proc vkCmdBeginRenderPass*(commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; contents: VkSubpassContents) {.cdecl, importc.}
  proc vkCmdNextSubpass*(commandBuffer: VkCommandBuffer; contents: VkSubpassContents) {.cdecl, importc.}
  proc vkCmdEndRenderPass*(commandBuffer: VkCommandBuffer) {.cdecl, importc.}
  proc vkCmdExecuteCommands*(commandBuffer: VkCommandBuffer; commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer) {.cdecl, importc.}
const
  vkVersion_1_1* = 1

##  Vulkan 1.1 version number

const
  vkApiVersion_1_1* = vkMakeVersion(1, 1, 0) ##  Patch version should always be set to 0

type
  VkSamplerYcbcrConversion* = VkNonDispatchableHandle
  VkDescriptorUpdateTemplate* = VkNonDispatchableHandle

const
  vkMaxDeviceGroupSize* = 32
  vkLuidSize* = 8
  vkQueueFamilyExternal* = (not 0 - 1)

type
  VkPointClippingBehavior* = distinct cint
  VkTessellationDomainOrigin* = distinct cint
  VkSamplerYcbcrModelConversion* = distinct cint
  VkSamplerYcbcrRange* = distinct cint
  VkChromaLocation* = distinct cint
  VkDescriptorUpdateTemplateType* = distinct cint
  VkSubgroupFeatureFlagBits* = distinct cint
  VkSubgroupFeatureFlags* = VkFlags
  VkPeerMemoryFeatureFlagBits* = distinct cint
  VkPeerMemoryFeatureFlags* = VkFlags
  VkMemoryAllocateFlagBits* = distinct cint
  VkMemoryAllocateFlags* = VkFlags
  VkCommandPoolTrimFlags* = VkFlags
  VkDescriptorUpdateTemplateCreateFlags* = VkFlags
  VkExternalMemoryHandleTypeFlagBits* = distinct cint
  VkExternalMemoryHandleTypeFlags* = VkFlags
  VkExternalMemoryFeatureFlagBits* = distinct cint
  VkExternalMemoryFeatureFlags* = VkFlags
  VkExternalFenceHandleTypeFlagBits* = distinct cint
  VkExternalFenceHandleTypeFlags* = VkFlags
  VkExternalFenceFeatureFlagBits* = distinct cint
  VkExternalFenceFeatureFlags* = VkFlags
  VkFenceImportFlagBits* = distinct cint
  VkFenceImportFlags* = VkFlags
  VkSemaphoreImportFlagBits* = distinct cint
  VkSemaphoreImportFlags* = VkFlags
  VkExternalSemaphoreHandleTypeFlagBits* = distinct cint
  VkExternalSemaphoreHandleTypeFlags* = VkFlags
  VkExternalSemaphoreFeatureFlagBits* = distinct cint
  VkExternalSemaphoreFeatureFlags* = VkFlags
  VkPhysicalDeviceSubgroupProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    subgroupSize*: uint32
    supportedStages*: VkShaderStageFlags
    supportedOperations*: VkSubgroupFeatureFlags
    quadOperationsInAllStages*: VkBool32

  VkBindBufferMemoryInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize

  VkBindImageMemoryInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize

  VkPhysicalDevice16BitStorageFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    storageBuffer16BitAccess*: VkBool32
    uniformAndStorageBuffer16BitAccess*: VkBool32
    storagePushConstant16*: VkBool32
    storageInputOutput16*: VkBool32

  VkMemoryDedicatedRequirements* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    prefersDedicatedAllocation*: VkBool32
    requiresDedicatedAllocation*: VkBool32

  VkMemoryDedicatedAllocateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    buffer*: VkBuffer

  VkMemoryAllocateFlagsInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkMemoryAllocateFlags
    deviceMask*: uint32

  VkDeviceGroupRenderPassBeginInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceMask*: uint32
    deviceRenderAreaCount*: uint32
    pDeviceRenderAreas*: ptr VkRect2D

  VkDeviceGroupCommandBufferBeginInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceMask*: uint32

  VkDeviceGroupSubmitInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphoreDeviceIndices*: ptr uint32
    commandBufferCount*: uint32
    pCommandBufferDeviceMasks*: ptr uint32
    signalSemaphoreCount*: uint32
    pSignalSemaphoreDeviceIndices*: ptr uint32

  VkDeviceGroupBindSparseInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    resourceDeviceIndex*: uint32
    memoryDeviceIndex*: uint32

  VkBindBufferMemoryDeviceGroupInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32

  VkBindImageMemoryDeviceGroupInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32
    splitInstanceBindRegionCount*: uint32
    pSplitInstanceBindRegions*: ptr VkRect2D

  VkPhysicalDeviceGroupProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    physicalDevices*: array[vkMaxDeviceGroupSize, VkPhysicalDevice]
    subsetAllocation*: VkBool32

  VkDeviceGroupDeviceCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    pPhysicalDevices*: ptr VkPhysicalDevice

  VkBufferMemoryRequirementsInfo2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer

  VkImageMemoryRequirementsInfo2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage

  VkImageSparseMemoryRequirementsInfo2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage

  VkMemoryRequirements2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memoryRequirements*: VkMemoryRequirements

  VkMemoryRequirements2KHR* = VkMemoryRequirements2
  VkSparseImageMemoryRequirements2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memoryRequirements*: VkSparseImageMemoryRequirements

  VkPhysicalDeviceFeatures2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    features*: VkPhysicalDeviceFeatures

  VkPhysicalDeviceProperties2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    properties*: VkPhysicalDeviceProperties

  VkFormatProperties2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    formatProperties*: VkFormatProperties

  VkImageFormatProperties2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    imageFormatProperties*: VkImageFormatProperties

  VkPhysicalDeviceImageFormatInfo2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    `type`*: VkImageType
    tiling*: VkImageTiling
    usage*: VkImageUsageFlags
    flags*: VkImageCreateFlags

  VkQueueFamilyProperties2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    queueFamilyProperties*: VkQueueFamilyProperties

  VkPhysicalDeviceMemoryProperties2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memoryProperties*: VkPhysicalDeviceMemoryProperties

  VkSparseImageFormatProperties2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    properties*: VkSparseImageFormatProperties

  VkPhysicalDeviceSparseImageFormatInfo2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    `type`*: VkImageType
    samples*: VkSampleCountFlagBits
    usage*: VkImageUsageFlags
    tiling*: VkImageTiling

  VkPhysicalDevicePointClippingProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pointClippingBehavior*: VkPointClippingBehavior

  VkInputAttachmentAspectReference* {.bycopy.} = object
    subpass*: uint32
    inputAttachmentIndex*: uint32
    aspectMask*: VkImageAspectFlags

  VkRenderPassInputAttachmentAspectCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    aspectReferenceCount*: uint32
    pAspectReferences*: ptr VkInputAttachmentAspectReference

  VkImageViewUsageCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    usage*: VkImageUsageFlags

  VkPipelineTessellationDomainOriginStateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    domainOrigin*: VkTessellationDomainOrigin

  VkRenderPassMultiviewCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    subpassCount*: uint32
    pViewMasks*: ptr uint32
    dependencyCount*: uint32
    pViewOffsets*: ptr int32
    correlationMaskCount*: uint32
    pCorrelationMasks*: ptr uint32

  VkPhysicalDeviceMultiviewFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    multiview*: VkBool32
    multiviewGeometryShader*: VkBool32
    multiviewTessellationShader*: VkBool32

  VkPhysicalDeviceMultiviewProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxMultiviewViewCount*: uint32
    maxMultiviewInstanceIndex*: uint32

  VkPhysicalDeviceVariablePointerFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    variablePointersStorageBuffer*: VkBool32
    variablePointers*: VkBool32

  VkPhysicalDeviceProtectedMemoryFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    protectedMemory*: VkBool32

  VkPhysicalDeviceProtectedMemoryProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    protectedNoFault*: VkBool32

  VkDeviceQueueInfo2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueIndex*: uint32

  VkProtectedSubmitInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    protectedSubmit*: VkBool32

  VkSamplerYcbcrConversionCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    ycbcrModel*: VkSamplerYcbcrModelConversion
    ycbcrRange*: VkSamplerYcbcrRange
    components*: VkComponentMapping
    xChromaOffset*: VkChromaLocation
    yChromaOffset*: VkChromaLocation
    chromaFilter*: VkFilter
    forceExplicitReconstruction*: VkBool32

  VkSamplerYcbcrConversionInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    conversion*: VkSamplerYcbcrConversion

  VkBindImagePlaneMemoryInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    planeAspect*: VkImageAspectFlagBits

  VkImagePlaneMemoryRequirementsInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    planeAspect*: VkImageAspectFlagBits

  VkPhysicalDeviceSamplerYcbcrConversionFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    samplerYcbcrConversion*: VkBool32

  VkSamplerYcbcrConversionImageFormatProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    combinedImageSamplerDescriptorCount*: uint32

  VkDescriptorUpdateTemplateEntry* {.bycopy.} = object
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: VkDescriptorType
    offset*: csize
    stride*: csize

  VkDescriptorUpdateTemplateCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDescriptorUpdateTemplateCreateFlags
    descriptorUpdateEntryCount*: uint32
    pDescriptorUpdateEntries*: ptr VkDescriptorUpdateTemplateEntry
    templateType*: VkDescriptorUpdateTemplateType
    descriptorSetLayout*: VkDescriptorSetLayout
    pipelineBindPoint*: VkPipelineBindPoint
    pipelineLayout*: VkPipelineLayout
    set*: uint32

  VkExternalMemoryProperties* {.bycopy.} = object
    externalMemoryFeatures*: VkExternalMemoryFeatureFlags
    exportFromImportedHandleTypes*: VkExternalMemoryHandleTypeFlags
    compatibleHandleTypes*: VkExternalMemoryHandleTypeFlags

  VkPhysicalDeviceExternalImageFormatInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBits

  VkExternalImageFormatProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    externalMemoryProperties*: VkExternalMemoryProperties

  VkPhysicalDeviceExternalBufferInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferCreateFlags
    usage*: VkBufferUsageFlags
    handleType*: VkExternalMemoryHandleTypeFlagBits

  VkExternalBufferProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    externalMemoryProperties*: VkExternalMemoryProperties

  VkPhysicalDeviceIDProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceUUID*: array[vkUuidSize, uint8]
    driverUUID*: array[vkUuidSize, uint8]
    deviceLUID*: array[vkLuidSize, uint8]
    deviceNodeMask*: uint32
    deviceLUIDValid*: VkBool32

  VkExternalMemoryImageCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlags

  VkExternalMemoryBufferCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlags

  VkExportMemoryAllocateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlags

  VkPhysicalDeviceExternalFenceInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalFenceHandleTypeFlagBits

  VkExternalFenceProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: VkExternalFenceHandleTypeFlags
    compatibleHandleTypes*: VkExternalFenceHandleTypeFlags
    externalFenceFeatures*: VkExternalFenceFeatureFlags

  VkExportFenceCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalFenceHandleTypeFlags

  VkExportSemaphoreCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalSemaphoreHandleTypeFlags

  VkPhysicalDeviceExternalSemaphoreInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalSemaphoreHandleTypeFlagBits

  VkExternalSemaphoreProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: VkExternalSemaphoreHandleTypeFlags
    compatibleHandleTypes*: VkExternalSemaphoreHandleTypeFlags
    externalSemaphoreFeatures*: VkExternalSemaphoreFeatureFlags

  VkPhysicalDeviceMaintenance3Properties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxPerSetDescriptors*: uint32
    maxMemoryAllocationSize*: VkDeviceSize

  VkDescriptorSetLayoutSupport* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    supported*: VkBool32

  VkPhysicalDeviceShaderDrawParameterFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderDrawParameters*: VkBool32

  PFNVkenumerateinstanceversion* = proc (pApiVersion: ptr uint32): VkResult {.cdecl.}
  PFNVkbindbuffermemory2* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindBufferMemoryInfo): VkResult {.cdecl.}
  PFNVkbindimagememory2* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindImageMemoryInfo): VkResult {.cdecl.}
  PFNVkgetdevicegrouppeermemoryfeatures* = proc (device: VkDevice; heapIndex: uint32; localDeviceIndex: uint32; remoteDeviceIndex: uint32; pPeerMemoryFeatures: ptr VkPeerMemoryFeatureFlags) {.cdecl.}
  PFNVkcmdsetdevicemask* = proc (commandBuffer: VkCommandBuffer; deviceMask: uint32) {.cdecl.}
  PFNVkcmddispatchbase* = proc (commandBuffer: VkCommandBuffer; baseGroupX: uint32; baseGroupY: uint32; baseGroupZ: uint32; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl.}
  PFNVkenumeratephysicaldevicegroups* = proc (instance: VkInstance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr VkPhysicalDeviceGroupProperties): VkResult {.cdecl.}
  PFNVkgetimagememoryrequirements2* = proc (device: VkDevice; pInfo: ptr VkImageMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl.}
  PFNVkgetbuffermemoryrequirements2* = proc (device: VkDevice; pInfo: ptr VkBufferMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl.}
  PFNVkgetimagesparsememoryrequirements2* = proc (device: VkDevice; pInfo: ptr VkImageSparseMemoryRequirementsInfo2; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2) {.cdecl.}
  PFNVkgetphysicaldevicefeatures2* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures2) {.cdecl.}
  PFNVkgetphysicaldeviceproperties2* = proc (physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties2) {.cdecl.}
  PFNVkgetphysicaldeviceformatproperties2* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties2) {.cdecl.}
  PFNVkgetphysicaldeviceimageformatproperties2* = proc (physicalDevice: VkPhysicalDevice; pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2; pImageFormatProperties: ptr VkImageFormatProperties2): VkResult {.cdecl.}
  PFNVkgetphysicaldevicequeuefamilyproperties2* = proc (physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties2) {.cdecl.}
  PFNVkgetphysicaldevicememoryproperties2* = proc (physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2) {.cdecl.}
  PFNVkgetphysicaldevicesparseimageformatproperties2* = proc (physicalDevice: VkPhysicalDevice; pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties2) {.cdecl.}
  PFNVktrimcommandpool* = proc (device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolTrimFlags) {.cdecl.}
  PFNVkgetdevicequeue2* = proc (device: VkDevice; pQueueInfo: ptr VkDeviceQueueInfo2; pQueue: ptr VkQueue) {.cdecl.}
  PFNVkcreatesamplerycbcrconversion* = proc (device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo; pAllocator: ptr VkAllocationCallbacks; pYcbcrConversion: ptr VkSamplerYcbcrConversion): VkResult {.cdecl.}
  PFNVkdestroysamplerycbcrconversion* = proc (device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversion; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreatedescriptorupdatetemplate* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate): VkResult {.cdecl.}
  PFNVkdestroydescriptorupdatetemplate* = proc (device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkupdatedescriptorsetwithtemplate* = proc (device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pData: pointer) {.cdecl.}
  PFNVkgetphysicaldeviceexternalbufferproperties* = proc (physicalDevice: VkPhysicalDevice; pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfo; pExternalBufferProperties: ptr VkExternalBufferProperties) {.cdecl.}
  PFNVkgetphysicaldeviceexternalfenceproperties* = proc (physicalDevice: VkPhysicalDevice; pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfo; pExternalFenceProperties: ptr VkExternalFenceProperties) {.cdecl.}
  PFNVkgetphysicaldeviceexternalsemaphoreproperties* = proc (physicalDevice: VkPhysicalDevice; pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfo; pExternalSemaphoreProperties: ptr VkExternalSemaphoreProperties) {.cdecl.}
  PFNVkgetdescriptorsetlayoutsupport* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pSupport: ptr VkDescriptorSetLayoutSupport) {.cdecl.}

const
  vkPointClippingBehaviorAllClipPlanes* = 0.VkPointClippingBehavior
  vkPointClippingBehaviorUserClipPlanesOnly* = 1.VkPointClippingBehavior
  vkPointClippingBehaviorAllClipPlanesKhr: VkPointClippingBehavior = vkPointClippingBehaviorAllClipPlanes
  vkPointClippingBehaviorUserClipPlanesOnlyKhr: VkPointClippingBehavior = vkPointClippingBehaviorUserClipPlanesOnly
  vkPointClippingBehaviorBeginRange: VkPointClippingBehavior = vkPointClippingBehaviorAllClipPlanes
  vkPointClippingBehaviorEndRange: VkPointClippingBehavior = vkPointClippingBehaviorUserClipPlanesOnly
  vkPointClippingBehaviorRangeSize: VkPointClippingBehavior = (vkPointClippingBehaviorUserClipPlanesOnly - vkPointClippingBehaviorAllClipPlanes + 1)
  vkPointClippingBehaviorMaxEnum* = 0x7FFFFFFF.VkPointClippingBehavior

const
  vkTessellationDomainOriginUpperLeft* = 0.VkTessellationDomainOrigin
  vkTessellationDomainOriginLowerLeft* = 1.VkTessellationDomainOrigin
  vkTessellationDomainOriginUpperLeftKhr: VkTessellationDomainOrigin = vkTessellationDomainOriginUpperLeft
  vkTessellationDomainOriginLowerLeftKhr: VkTessellationDomainOrigin = vkTessellationDomainOriginLowerLeft
  vkTessellationDomainOriginBeginRange: VkTessellationDomainOrigin = vkTessellationDomainOriginUpperLeft
  vkTessellationDomainOriginEndRange: VkTessellationDomainOrigin = vkTessellationDomainOriginLowerLeft
  vkTessellationDomainOriginRangeSize: VkTessellationDomainOrigin = (vkTessellationDomainOriginLowerLeft - vkTessellationDomainOriginUpperLeft + 1)
  vkTessellationDomainOriginMaxEnum* = 0x7FFFFFFF.VkTessellationDomainOrigin

const
  vkSamplerYcbcrModelConversionRgbIdentity* = 0.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionYcbcrIdentity* = 1.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionYcbcr_709* = 2.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionYcbcr_601* = 3.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionYcbcr_2020* = 4.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionRgbIdentityKhr: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionRgbIdentity
  vkSamplerYcbcrModelConversionYcbcrIdentityKhr: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcrIdentity
  vkSamplerYcbcrModelConversionYcbcr_709Khr: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcr_709
  vkSamplerYcbcrModelConversionYcbcr_601Khr: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcr_601
  vkSamplerYcbcrModelConversionYcbcr_2020Khr: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcr_2020
  vkSamplerYcbcrModelConversionBeginRange: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionRgbIdentity
  vkSamplerYcbcrModelConversionEndRange: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcr_2020
  vkSamplerYcbcrModelConversionRangeSize: VkSamplerYcbcrModelConversion = (vkSamplerYcbcrModelConversionYcbcr_2020 - vkSamplerYcbcrModelConversionRgbIdentity + 1)
  vkSamplerYcbcrModelConversionMaxEnum* = 0x7FFFFFFF.VkSamplerYcbcrModelConversion

const
  vkSamplerYcbcrRangeItuFull* = 0.VkSamplerYcbcrRange
  vkSamplerYcbcrRangeItuNarrow* = 1.VkSamplerYcbcrRange
  vkSamplerYcbcrRangeItuFullKhr: VkSamplerYcbcrRange = vkSamplerYcbcrRangeItuFull
  vkSamplerYcbcrRangeItuNarrowKhr: VkSamplerYcbcrRange = vkSamplerYcbcrRangeItuNarrow
  vkSamplerYcbcrRangeBeginRange: VkSamplerYcbcrRange = vkSamplerYcbcrRangeItuFull
  vkSamplerYcbcrRangeEndRange: VkSamplerYcbcrRange = vkSamplerYcbcrRangeItuNarrow
  vkSamplerYcbcrRangeRangeSize: VkSamplerYcbcrRange = (vkSamplerYcbcrRangeItuNarrow - vkSamplerYcbcrRangeItuFull + 1)
  vkSamplerYcbcrRangeMaxEnum* = 0x7FFFFFFF.VkSamplerYcbcrRange

const
  vkChromaLocationCositedEven* = 0.VkChromaLocation
  vkChromaLocationMidpoint* = 1.VkChromaLocation
  vkChromaLocationCositedEvenKhr: VkChromaLocation = vkChromaLocationCositedEven
  vkChromaLocationMidpointKhr: VkChromaLocation = vkChromaLocationMidpoint
  vkChromaLocationBeginRange: VkChromaLocation = vkChromaLocationCositedEven
  vkChromaLocationEndRange: VkChromaLocation = vkChromaLocationMidpoint
  vkChromaLocationRangeSize: VkChromaLocation = (vkChromaLocationMidpoint - vkChromaLocationCositedEven + 1)
  vkChromaLocationMaxEnum* = 0x7FFFFFFF.VkChromaLocation

const
  vkDescriptorUpdateTemplateTypeDescriptorSet* = 0.VkDescriptorUpdateTemplateType
  vkDescriptorUpdateTemplateTypePushDescriptorsKhr* = 1.VkDescriptorUpdateTemplateType
  vkDescriptorUpdateTemplateTypeDescriptorSetKhr: VkDescriptorUpdateTemplateType = vkDescriptorUpdateTemplateTypeDescriptorSet
  vkDescriptorUpdateTemplateTypeBeginRange: VkDescriptorUpdateTemplateType = vkDescriptorUpdateTemplateTypeDescriptorSet
  vkDescriptorUpdateTemplateTypeEndRange: VkDescriptorUpdateTemplateType = vkDescriptorUpdateTemplateTypeDescriptorSet
  vkDescriptorUpdateTemplateTypeRangeSize: VkDescriptorUpdateTemplateType = (vkDescriptorUpdateTemplateTypeDescriptorSet - vkDescriptorUpdateTemplateTypeDescriptorSet + 1)
  vkDescriptorUpdateTemplateTypeMaxEnum* = 0x7FFFFFFF.VkDescriptorUpdateTemplateType

const
  vkSubgroupFeatureBasicBit* = 0x00000001.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureVoteBit* = 0x00000002.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureArithmeticBit* = 0x00000004.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureBallotBit* = 0x00000008.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureShuffleBit* = 0x00000010.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureShuffleRelativeBit* = 0x00000020.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureClusteredBit* = 0x00000040.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureQuadBit* = 0x00000080.VkSubgroupFeatureFlagBits
  vkSubgroupFeaturePartitionedBitNv* = 0x00000100.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureFlagBitsMaxEnum* = 0x7FFFFFFF.VkSubgroupFeatureFlagBits

const
  vkPeerMemoryFeatureCopySrcBit* = 0x00000001.VkPeerMemoryFeatureFlagBits
  vkPeerMemoryFeatureCopyDstBit* = 0x00000002.VkPeerMemoryFeatureFlagBits
  vkPeerMemoryFeatureGenericSrcBit* = 0x00000004.VkPeerMemoryFeatureFlagBits
  vkPeerMemoryFeatureGenericDstBit* = 0x00000008.VkPeerMemoryFeatureFlagBits
  vkPeerMemoryFeatureCopySrcBitKhr: VkPeerMemoryFeatureFlagBits = vkPeerMemoryFeatureCopySrcBit
  vkPeerMemoryFeatureCopyDstBitKhr: VkPeerMemoryFeatureFlagBits = vkPeerMemoryFeatureCopyDstBit
  vkPeerMemoryFeatureGenericSrcBitKhr: VkPeerMemoryFeatureFlagBits = vkPeerMemoryFeatureGenericSrcBit
  vkPeerMemoryFeatureGenericDstBitKhr: VkPeerMemoryFeatureFlagBits = vkPeerMemoryFeatureGenericDstBit
  vkPeerMemoryFeatureFlagBitsMaxEnum* = 0x7FFFFFFF.VkPeerMemoryFeatureFlagBits

const
  vkMemoryAllocateDeviceMaskBit* = 0x00000001.VkMemoryAllocateFlagBits
  vkMemoryAllocateDeviceMaskBitKhr: VkMemoryAllocateFlagBits = vkMemoryAllocateDeviceMaskBit
  vkMemoryAllocateFlagBitsMaxEnum* = 0x7FFFFFFF.VkMemoryAllocateFlagBits

const
  vkExternalMemoryHandleTypeOpaqueFdBit* = 0x00000001.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeOpaqueWin32Bit* = 0x00000002.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeOpaqueWin32KmtBit* = 0x00000004.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeD3D11TextureBit* = 0x00000008.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeD3D11TextureKmtBit* = 0x00000010.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeD3D12HeapBit* = 0x00000020.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeD3D12ResourceBit* = 0x00000040.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeHostAllocationBitExt* = 0x00000080.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeHostMappedForeignMemoryBitExt* = 0x00000100.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeOpaqueFdBitKhr: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeOpaqueFdBit
  vkExternalMemoryHandleTypeOpaqueWin32BitKhr: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeOpaqueWin32Bit
  vkExternalMemoryHandleTypeOpaqueWin32KmtBitKhr: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeOpaqueWin32KmtBit
  vkExternalMemoryHandleTypeD3D11TextureBitKhr: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeD3D11TextureBit
  vkExternalMemoryHandleTypeD3D11TextureKmtBitKhr: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeD3D11TextureKmtBit
  vkExternalMemoryHandleTypeD3D12HeapBitKhr: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeD3D12HeapBit
  vkExternalMemoryHandleTypeD3D12ResourceBitKhr: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeD3D12ResourceBit
  vkExternalMemoryHandleTypeDmaBufBitExt* = 0x00000200.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeAndroidHardwareBufferBitAndroid* = 0x00000400.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeFlagBitsMaxEnum* = 0x7FFFFFFF.VkExternalMemoryHandleTypeFlagBits

const
  vkExternalMemoryFeatureDedicatedOnlyBit* = 0x00000001.VkExternalMemoryFeatureFlagBits
  vkExternalMemoryFeatureExportableBit* = 0x00000002.VkExternalMemoryFeatureFlagBits
  vkExternalMemoryFeatureImportableBit* = 0x00000004.VkExternalMemoryFeatureFlagBits
  vkExternalMemoryFeatureDedicatedOnlyBitKhr: VkExternalMemoryFeatureFlagBits = vkExternalMemoryFeatureDedicatedOnlyBit
  vkExternalMemoryFeatureExportableBitKhr: VkExternalMemoryFeatureFlagBits = vkExternalMemoryFeatureExportableBit
  vkExternalMemoryFeatureImportableBitKhr: VkExternalMemoryFeatureFlagBits = vkExternalMemoryFeatureImportableBit
  vkExternalMemoryFeatureFlagBitsMaxEnum* = 0x7FFFFFFF.VkExternalMemoryFeatureFlagBits

const
  vkExternalFenceHandleTypeOpaqueFdBit* = 0x00000001.VkExternalFenceHandleTypeFlagBits
  vkExternalFenceHandleTypeOpaqueWin32Bit* = 0x00000002.VkExternalFenceHandleTypeFlagBits
  vkExternalFenceHandleTypeOpaqueWin32KmtBit* = 0x00000004.VkExternalFenceHandleTypeFlagBits
  vkExternalFenceHandleTypeSyncFdBit* = 0x00000008.VkExternalFenceHandleTypeFlagBits
  vkExternalFenceHandleTypeOpaqueFdBitKhr: VkExternalFenceHandleTypeFlagBits = vkExternalFenceHandleTypeOpaqueFdBit
  vkExternalFenceHandleTypeOpaqueWin32BitKhr: VkExternalFenceHandleTypeFlagBits = vkExternalFenceHandleTypeOpaqueWin32Bit
  vkExternalFenceHandleTypeOpaqueWin32KmtBitKhr: VkExternalFenceHandleTypeFlagBits = vkExternalFenceHandleTypeOpaqueWin32KmtBit
  vkExternalFenceHandleTypeSyncFdBitKhr: VkExternalFenceHandleTypeFlagBits = vkExternalFenceHandleTypeSyncFdBit
  vkExternalFenceHandleTypeFlagBitsMaxEnum* = 0x7FFFFFFF.VkExternalFenceHandleTypeFlagBits

const
  vkExternalFenceFeatureExportableBit* = 0x00000001.VkExternalFenceFeatureFlagBits
  vkExternalFenceFeatureImportableBit* = 0x00000002.VkExternalFenceFeatureFlagBits
  vkExternalFenceFeatureExportableBitKhr: VkExternalFenceFeatureFlagBits = vkExternalFenceFeatureExportableBit
  vkExternalFenceFeatureImportableBitKhr: VkExternalFenceFeatureFlagBits = vkExternalFenceFeatureImportableBit
  vkExternalFenceFeatureFlagBitsMaxEnum* = 0x7FFFFFFF.VkExternalFenceFeatureFlagBits

const
  vkFenceImportTemporaryBit* = 0x00000001.VkFenceImportFlagBits
  vkFenceImportTemporaryBitKhr: VkFenceImportFlagBits = vkFenceImportTemporaryBit
  vkFenceImportFlagBitsMaxEnum* = 0x7FFFFFFF.VkFenceImportFlagBits

const
  vkSemaphoreImportTemporaryBit* = 0x00000001.VkSemaphoreImportFlagBits
  vkSemaphoreImportTemporaryBitKhr: VkSemaphoreImportFlagBits = vkSemaphoreImportTemporaryBit
  vkSemaphoreImportFlagBitsMaxEnum* = 0x7FFFFFFF.VkSemaphoreImportFlagBits

const
  vkExternalSemaphoreHandleTypeOpaqueFdBit* = 0x00000001.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeOpaqueWin32Bit* = 0x00000002.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeOpaqueWin32KmtBit* = 0x00000004.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeD3D12FenceBit* = 0x00000008.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeSyncFdBit* = 0x00000010.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeOpaqueFdBitKhr: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeOpaqueFdBit
  vkExternalSemaphoreHandleTypeOpaqueWin32BitKhr: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeOpaqueWin32Bit
  vkExternalSemaphoreHandleTypeOpaqueWin32KmtBitKhr: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeOpaqueWin32KmtBit
  vkExternalSemaphoreHandleTypeD3D12FenceBitKhr: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeD3D12FenceBit
  vkExternalSemaphoreHandleTypeSyncFdBitKhr: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeSyncFdBit
  vkExternalSemaphoreHandleTypeFlagBitsMaxEnum* = 0x7FFFFFFF.VkExternalSemaphoreHandleTypeFlagBits

const
  vkExternalSemaphoreFeatureExportableBit* = 0x00000001.VkExternalSemaphoreFeatureFlagBits
  vkExternalSemaphoreFeatureImportableBit* = 0x00000002.VkExternalSemaphoreFeatureFlagBits
  vkExternalSemaphoreFeatureExportableBitKhr: VkExternalSemaphoreFeatureFlagBits = vkExternalSemaphoreFeatureExportableBit
  vkExternalSemaphoreFeatureImportableBitKhr: VkExternalSemaphoreFeatureFlagBits = vkExternalSemaphoreFeatureImportableBit
  vkExternalSemaphoreFeatureFlagBitsMaxEnum* = 0x7FFFFFFF.VkExternalSemaphoreFeatureFlagBits

when not defined(vkNoPrototypes):
  proc vkEnumerateInstanceVersion*(pApiVersion: ptr uint32): VkResult {.cdecl, importc.}
  proc vkBindBufferMemory2*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindBufferMemoryInfo): VkResult {.cdecl, importc.}
  proc vkBindImageMemory2*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindImageMemoryInfo): VkResult {.cdecl, importc.}
  proc vkGetDeviceGroupPeerMemoryFeatures*(device: VkDevice; heapIndex: uint32; localDeviceIndex: uint32; remoteDeviceIndex: uint32; pPeerMemoryFeatures: ptr VkPeerMemoryFeatureFlags) {.cdecl, importc.}
  proc vkCmdSetDeviceMask*(commandBuffer: VkCommandBuffer; deviceMask: uint32) {.cdecl, importc.}
  proc vkCmdDispatchBase*(commandBuffer: VkCommandBuffer; baseGroupX: uint32; baseGroupY: uint32; baseGroupZ: uint32; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl, importc.}
  proc vkEnumeratePhysicalDeviceGroups*(instance: VkInstance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr VkPhysicalDeviceGroupProperties): VkResult {.cdecl, importc.}
  proc vkGetImageMemoryRequirements2*(device: VkDevice; pInfo: ptr VkImageMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl, importc.}
  proc vkGetBufferMemoryRequirements2*(device: VkDevice; pInfo: ptr VkBufferMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl, importc.}
  proc vkGetImageSparseMemoryRequirements2*(device: VkDevice; pInfo: ptr VkImageSparseMemoryRequirementsInfo2; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceFeatures2*(physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceProperties2*(physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceFormatProperties2*(physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceImageFormatProperties2*(physicalDevice: VkPhysicalDevice; pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2; pImageFormatProperties: ptr VkImageFormatProperties2): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceQueueFamilyProperties2*(physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceMemoryProperties2*(physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceSparseImageFormatProperties2*(physicalDevice: VkPhysicalDevice; pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties2) {.cdecl, importc.}
  proc vkTrimCommandPool*(device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolTrimFlags) {.cdecl, importc.}
  proc vkGetDeviceQueue2*(device: VkDevice; pQueueInfo: ptr VkDeviceQueueInfo2; pQueue: ptr VkQueue) {.cdecl, importc.}
  proc vkCreateSamplerYcbcrConversion*(device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo; pAllocator: ptr VkAllocationCallbacks; pYcbcrConversion: ptr VkSamplerYcbcrConversion): VkResult {.cdecl, importc.}
  proc vkDestroySamplerYcbcrConversion*(device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversion; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateDescriptorUpdateTemplate*(device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorUpdateTemplate*(device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkUpdateDescriptorSetWithTemplate*(device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pData: pointer) {.cdecl, importc.}
  proc vkGetPhysicalDeviceExternalBufferProperties*(physicalDevice: VkPhysicalDevice; pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfo; pExternalBufferProperties: ptr VkExternalBufferProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceExternalFenceProperties*(physicalDevice: VkPhysicalDevice; pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfo; pExternalFenceProperties: ptr VkExternalFenceProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceExternalSemaphoreProperties*(physicalDevice: VkPhysicalDevice; pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfo; pExternalSemaphoreProperties: ptr VkExternalSemaphoreProperties) {.cdecl, importc.}
  proc vkGetDescriptorSetLayoutSupport*(device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pSupport: ptr VkDescriptorSetLayoutSupport) {.cdecl, importc.}
const
  vkKhrSurface* = 1

type
  VkSurfaceKHR* = VkNonDispatchableHandle

const
  vkKhrSurfaceSpecVersion* = 25
  vkKhrSurfaceExtensionName* = "vkKhrSurface"

type
  VkColorSpaceKHR* = distinct cint
  VkPresentModeKHR* = distinct cint
  VkSurfaceTransformFlagBitsKHR* = distinct cint
  VkSurfaceTransformFlagsKHR* = VkFlags
  VkCompositeAlphaFlagBitsKHR* = distinct cint
  VkCompositeAlphaFlagsKHR* = VkFlags
  VkSurfaceCapabilitiesKHR* {.bycopy.} = object
    minImageCount*: uint32
    maxImageCount*: uint32
    currentExtent*: VkExtent2D
    minImageExtent*: VkExtent2D
    maxImageExtent*: VkExtent2D
    maxImageArrayLayers*: uint32
    supportedTransforms*: VkSurfaceTransformFlagsKHR
    currentTransform*: VkSurfaceTransformFlagBitsKHR
    supportedCompositeAlpha*: VkCompositeAlphaFlagsKHR
    supportedUsageFlags*: VkImageUsageFlags

  VkSurfaceFormatKHR* {.bycopy.} = object
    format*: VkFormat
    colorSpace*: VkColorSpaceKHR

  PFNVkdestroysurfacekhr* = proc (instance: VkInstance; surface: VkSurfaceKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkgetphysicaldevicesurfacesupportkhr* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; surface: VkSurfaceKHR; pSupported: ptr VkBool32): VkResult {.cdecl.}
  PFNVkgetphysicaldevicesurfacecapabilitieskhr* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicesurfaceformatskhr* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormatKHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicesurfacepresentmodeskhr* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pPresentModeCount: ptr uint32; pPresentModes: ptr VkPresentModeKHR): VkResult {.cdecl.}

const
  vkColorSpaceSrgbNonlinearKhr* = 0.VkColorSpaceKHR
  vkColorSpaceDisplayP3NonlinearExt* = 1000104001.VkColorSpaceKHR
  vkColorSpaceExtendedSrgbLinearExt* = 1000104002.VkColorSpaceKHR
  vkColorSpaceDciP3LinearExt* = 1000104003.VkColorSpaceKHR
  vkColorSpaceDciP3NonlinearExt* = 1000104004.VkColorSpaceKHR
  vkColorSpaceBt709LinearExt* = 1000104005.VkColorSpaceKHR
  vkColorSpaceBt709NonlinearExt* = 1000104006.VkColorSpaceKHR
  vkColorSpaceBt2020LinearExt* = 1000104007.VkColorSpaceKHR
  vkColorSpaceHdr10St2084Ext* = 1000104008.VkColorSpaceKHR
  vkColorSpaceDolbyvisionExt* = 1000104009.VkColorSpaceKHR
  vkColorSpaceHdr10HlgExt* = 1000104010.VkColorSpaceKHR
  vkColorSpaceAdobergbLinearExt* = 1000104011.VkColorSpaceKHR
  vkColorSpaceAdobergbNonlinearExt* = 1000104012.VkColorSpaceKHR
  vkColorSpacePassThroughExt* = 1000104013.VkColorSpaceKHR
  vkColorSpaceExtendedSrgbNonlinearExt* = 1000104014.VkColorSpaceKHR
  vkColorSpaceBeginRangeKhr: VkColorSpaceKHR = vkColorSpaceSrgbNonlinearKhr
  vkColorSpaceEndRangeKhr: VkColorSpaceKHR = vkColorSpaceSrgbNonlinearKhr
  vkColorSpaceRangeSizeKhr: VkColorSpaceKHR = (vkColorSpaceSrgbNonlinearKhr - vkColorSpaceSrgbNonlinearKhr + 1)
  vkColorSpaceMaxEnumKhr* = 0x7FFFFFFF.VkColorSpaceKHR

const
  vkPresentModeImmediateKhr* = 0.VkPresentModeKHR
  vkPresentModeMailboxKhr* = 1.VkPresentModeKHR
  vkPresentModeFifoKhr* = 2.VkPresentModeKHR
  vkPresentModeFifoRelaxedKhr* = 3.VkPresentModeKHR
  vkPresentModeSharedDemandRefreshKhr* = 1000111000.VkPresentModeKHR
  vkPresentModeSharedContinuousRefreshKhr* = 1000111001.VkPresentModeKHR
  vkPresentModeBeginRangeKhr: VkPresentModeKHR = vkPresentModeImmediateKhr
  vkPresentModeEndRangeKhr: VkPresentModeKHR = vkPresentModeFifoRelaxedKhr
  vkPresentModeRangeSizeKhr: VkPresentModeKHR = (vkPresentModeFifoRelaxedKhr - vkPresentModeImmediateKhr + 1)
  vkPresentModeMaxEnumKhr* = 0x7FFFFFFF.VkPresentModeKHR

const
  vkSurfaceTransformIdentityBitKhr* = 0x00000001.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformRotate_90BitKhr* = 0x00000002.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformRotate_180BitKhr* = 0x00000004.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformRotate_270BitKhr* = 0x00000008.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformHorizontalMirrorBitKhr* = 0x00000010.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformHorizontalMirrorRotate_90BitKhr* = 0x00000020.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformHorizontalMirrorRotate_180BitKhr* = 0x00000040.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformHorizontalMirrorRotate_270BitKhr* = 0x00000080.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformInheritBitKhr* = 0x00000100.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformFlagBitsMaxEnumKhr* = 0x7FFFFFFF.VkSurfaceTransformFlagBitsKHR

const
  vkCompositeAlphaOpaqueBitKhr* = 0x00000001.VkCompositeAlphaFlagBitsKHR
  vkCompositeAlphaPreMultipliedBitKhr* = 0x00000002.VkCompositeAlphaFlagBitsKHR
  vkCompositeAlphaPostMultipliedBitKhr* = 0x00000004.VkCompositeAlphaFlagBitsKHR
  vkCompositeAlphaInheritBitKhr* = 0x00000008.VkCompositeAlphaFlagBitsKHR
  vkCompositeAlphaFlagBitsMaxEnumKhr* = 0x7FFFFFFF.VkCompositeAlphaFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkDestroySurfaceKHR*(instance: VkInstance; surface: VkSurfaceKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceSupportKHR*(physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; surface: VkSurfaceKHR; pSupported: ptr VkBool32): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceCapabilitiesKHR*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceFormatsKHR*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormatKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfacePresentModesKHR*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pPresentModeCount: ptr uint32; pPresentModes: ptr VkPresentModeKHR): VkResult {.cdecl, importc.}
const
  vkKhrSwapchain* = 1

type
  VkSwapchainKHR* = VkNonDispatchableHandle

const
  vkKhrSwapchainSpecVersion* = 70
  vkKhrSwapchainExtensionName* = "vkKhrSwapchain"

type
  VkSwapchainCreateFlagBitsKHR* = distinct cint
  VkSwapchainCreateFlagsKHR* = VkFlags
  VkDeviceGroupPresentModeFlagBitsKHR* = distinct cint
  VkDeviceGroupPresentModeFlagsKHR* = VkFlags
  VkSwapchainCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSwapchainCreateFlagsKHR
    surface*: VkSurfaceKHR
    minImageCount*: uint32
    imageFormat*: VkFormat
    imageColorSpace*: VkColorSpaceKHR
    imageExtent*: VkExtent2D
    imageArrayLayers*: uint32
    imageUsage*: VkImageUsageFlags
    imageSharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
    preTransform*: VkSurfaceTransformFlagBitsKHR
    compositeAlpha*: VkCompositeAlphaFlagBitsKHR
    presentMode*: VkPresentModeKHR
    clipped*: VkBool32
    oldSwapchain*: VkSwapchainKHR

  VkPresentInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr VkSemaphore
    swapchainCount*: uint32
    pSwapchains*: ptr VkSwapchainKHR
    pImageIndices*: ptr uint32
    pResults*: ptr VkResult

  VkImageSwapchainCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR

  VkBindImageMemorySwapchainInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR
    imageIndex*: uint32

  VkAcquireNextImageInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR
    timeout*: uint64
    semaphore*: VkSemaphore
    fence*: VkFence
    deviceMask*: uint32

  VkDeviceGroupPresentCapabilitiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    presentMask*: array[vkMaxDeviceGroupSize, uint32]
    modes*: VkDeviceGroupPresentModeFlagsKHR

  VkDeviceGroupPresentInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pDeviceMasks*: ptr uint32
    mode*: VkDeviceGroupPresentModeFlagBitsKHR

  VkDeviceGroupSwapchainCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    modes*: VkDeviceGroupPresentModeFlagsKHR

  PFNVkcreateswapchainkhr* = proc (device: VkDevice; pCreateInfo: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSwapchain: ptr VkSwapchainKHR): VkResult {.cdecl.}
  PFNVkdestroyswapchainkhr* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkgetswapchainimageskhr* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pSwapchainImageCount: ptr uint32; pSwapchainImages: ptr VkImage): VkResult {.cdecl.}
  PFNVkacquirenextimagekhr* = proc (device: VkDevice; swapchain: VkSwapchainKHR; timeout: uint64; semaphore: VkSemaphore; fence: VkFence; pImageIndex: ptr uint32): VkResult {.cdecl.}
  PFNVkqueuepresentkhr* = proc (queue: VkQueue; pPresentInfo: ptr VkPresentInfoKHR): VkResult {.cdecl.}
  PFNVkgetdevicegrouppresentcapabilitieskhr* = proc (device: VkDevice; pDeviceGroupPresentCapabilities: ptr VkDeviceGroupPresentCapabilitiesKHR): VkResult {.cdecl.}
  PFNVkgetdevicegroupsurfacepresentmodeskhr* = proc (device: VkDevice; surface: VkSurfaceKHR; pModes: ptr VkDeviceGroupPresentModeFlagsKHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicepresentrectangleskhr* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pRectCount: ptr uint32; pRects: ptr VkRect2D): VkResult {.cdecl.}
  PFNVkacquirenextimage2KHR* = proc (device: VkDevice; pAcquireInfo: ptr VkAcquireNextImageInfoKHR; pImageIndex: ptr uint32): VkResult {.cdecl.}

const
  vkSwapchainCreateSplitInstanceBindRegionsBitKhr* = 0x00000001.VkSwapchainCreateFlagBitsKHR
  vkSwapchainCreateProtectedBitKhr* = 0x00000002.VkSwapchainCreateFlagBitsKHR
  vkSwapchainCreateFlagBitsMaxEnumKhr* = 0x7FFFFFFF.VkSwapchainCreateFlagBitsKHR

const
  vkDeviceGroupPresentModeLocalBitKhr* = 0x00000001.VkDeviceGroupPresentModeFlagBitsKHR
  vkDeviceGroupPresentModeRemoteBitKhr* = 0x00000002.VkDeviceGroupPresentModeFlagBitsKHR
  vkDeviceGroupPresentModeSumBitKhr* = 0x00000004.VkDeviceGroupPresentModeFlagBitsKHR
  vkDeviceGroupPresentModeLocalMultiDeviceBitKhr* = 0x00000008.VkDeviceGroupPresentModeFlagBitsKHR
  vkDeviceGroupPresentModeFlagBitsMaxEnumKhr* = 0x7FFFFFFF.VkDeviceGroupPresentModeFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkCreateSwapchainKHR*(device: VkDevice; pCreateInfo: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSwapchain: ptr VkSwapchainKHR): VkResult {.cdecl, importc.}
  proc vkDestroySwapchainKHR*(device: VkDevice; swapchain: VkSwapchainKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetSwapchainImagesKHR*(device: VkDevice; swapchain: VkSwapchainKHR; pSwapchainImageCount: ptr uint32; pSwapchainImages: ptr VkImage): VkResult {.cdecl, importc.}
  proc vkAcquireNextImageKHR*(device: VkDevice; swapchain: VkSwapchainKHR; timeout: uint64; semaphore: VkSemaphore; fence: VkFence; pImageIndex: ptr uint32): VkResult {.cdecl, importc.}
  proc vkQueuePresentKHR*(queue: VkQueue; pPresentInfo: ptr VkPresentInfoKHR): VkResult {.cdecl, importc.}
  proc vkGetDeviceGroupPresentCapabilitiesKHR*(device: VkDevice; pDeviceGroupPresentCapabilities: ptr VkDeviceGroupPresentCapabilitiesKHR): VkResult {.cdecl, importc.}
  proc vkGetDeviceGroupSurfacePresentModesKHR*(device: VkDevice; surface: VkSurfaceKHR; pModes: ptr VkDeviceGroupPresentModeFlagsKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDevicePresentRectanglesKHR*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pRectCount: ptr uint32; pRects: ptr VkRect2D): VkResult {.cdecl, importc.}
  proc vkAcquireNextImage2KHR*(device: VkDevice; pAcquireInfo: ptr VkAcquireNextImageInfoKHR; pImageIndex: ptr uint32): VkResult {.cdecl, importc.}
const
  vkKhrDisplay* = 1

type
  VkDisplayKHR* = VkNonDispatchableHandle
  VkDisplayModeKHR* = VkNonDispatchableHandle

const
  vkKhrDisplaySpecVersion* = 21
  vkKhrDisplayExtensionName* = "vkKhrDisplay"

type
  VkDisplayPlaneAlphaFlagBitsKHR* = distinct cint
  VkDisplayPlaneAlphaFlagsKHR* = VkFlags
  VkDisplayModeCreateFlagsKHR* = VkFlags
  VkDisplaySurfaceCreateFlagsKHR* = VkFlags
  VkDisplayPropertiesKHR* {.bycopy.} = object
    display*: VkDisplayKHR
    displayName*: cstring
    physicalDimensions*: VkExtent2D
    physicalResolution*: VkExtent2D
    supportedTransforms*: VkSurfaceTransformFlagsKHR
    planeReorderPossible*: VkBool32
    persistentContent*: VkBool32

  VkDisplayModeParametersKHR* {.bycopy.} = object
    visibleRegion*: VkExtent2D
    refreshRate*: uint32

  VkDisplayModePropertiesKHR* {.bycopy.} = object
    displayMode*: VkDisplayModeKHR
    parameters*: VkDisplayModeParametersKHR

  VkDisplayModeCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDisplayModeCreateFlagsKHR
    parameters*: VkDisplayModeParametersKHR

  VkDisplayPlaneCapabilitiesKHR* {.bycopy.} = object
    supportedAlpha*: VkDisplayPlaneAlphaFlagsKHR
    minSrcPosition*: VkOffset2D
    maxSrcPosition*: VkOffset2D
    minSrcExtent*: VkExtent2D
    maxSrcExtent*: VkExtent2D
    minDstPosition*: VkOffset2D
    maxDstPosition*: VkOffset2D
    minDstExtent*: VkExtent2D
    maxDstExtent*: VkExtent2D

  VkDisplayPlanePropertiesKHR* {.bycopy.} = object
    currentDisplay*: VkDisplayKHR
    currentStackIndex*: uint32

  VkDisplaySurfaceCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDisplaySurfaceCreateFlagsKHR
    displayMode*: VkDisplayModeKHR
    planeIndex*: uint32
    planeStackIndex*: uint32
    transform*: VkSurfaceTransformFlagBitsKHR
    globalAlpha*: cfloat
    alphaMode*: VkDisplayPlaneAlphaFlagBitsKHR
    imageExtent*: VkExtent2D

  PFNVkgetphysicaldevicedisplaypropertieskhr* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPropertiesKHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicedisplayplanepropertieskhr* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlanePropertiesKHR): VkResult {.cdecl.}
  PFNVkgetdisplayplanesupporteddisplayskhr* = proc (physicalDevice: VkPhysicalDevice; planeIndex: uint32; pDisplayCount: ptr uint32; pDisplays: ptr VkDisplayKHR): VkResult {.cdecl.}
  PFNVkgetdisplaymodepropertieskhr* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModePropertiesKHR): VkResult {.cdecl.}
  PFNVkcreatedisplaymodekhr* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pCreateInfo: ptr VkDisplayModeCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pMode: ptr VkDisplayModeKHR): VkResult {.cdecl.}
  PFNVkgetdisplayplanecapabilitieskhr* = proc (physicalDevice: VkPhysicalDevice; mode: VkDisplayModeKHR; planeIndex: uint32; pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR): VkResult {.cdecl.}
  PFNVkcreatedisplayplanesurfacekhr* = proc (instance: VkInstance; pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}

const
  vkDisplayPlaneAlphaOpaqueBitKhr* = 0x00000001.VkDisplayPlaneAlphaFlagBitsKHR
  vkDisplayPlaneAlphaGlobalBitKhr* = 0x00000002.VkDisplayPlaneAlphaFlagBitsKHR
  vkDisplayPlaneAlphaPerPixelBitKhr* = 0x00000004.VkDisplayPlaneAlphaFlagBitsKHR
  vkDisplayPlaneAlphaPerPixelPremultipliedBitKhr* = 0x00000008.VkDisplayPlaneAlphaFlagBitsKHR
  vkDisplayPlaneAlphaFlagBitsMaxEnumKhr* = 0x7FFFFFFF.VkDisplayPlaneAlphaFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceDisplayPropertiesKHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPropertiesKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceDisplayPlanePropertiesKHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlanePropertiesKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayPlaneSupportedDisplaysKHR*(physicalDevice: VkPhysicalDevice; planeIndex: uint32; pDisplayCount: ptr uint32; pDisplays: ptr VkDisplayKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayModePropertiesKHR*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModePropertiesKHR): VkResult {.cdecl, importc.}
  proc vkCreateDisplayModeKHR*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pCreateInfo: ptr VkDisplayModeCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pMode: ptr VkDisplayModeKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayPlaneCapabilitiesKHR*(physicalDevice: VkPhysicalDevice; mode: VkDisplayModeKHR; planeIndex: uint32; pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR): VkResult {.cdecl, importc.}
  proc vkCreateDisplayPlaneSurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}
const
  vkKhrDisplaySwapchain* = 1
  vkKhrDisplaySwapchainSpecVersion* = 9
  vkKhrDisplaySwapchainExtensionName* = "vkKhrDisplaySwapchain"

type
  VkDisplayPresentInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcRect*: VkRect2D
    dstRect*: VkRect2D
    persistent*: VkBool32

  PFNVkcreatesharedswapchainskhr* = proc (device: VkDevice; swapchainCount: uint32; pCreateInfos: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSwapchains: ptr VkSwapchainKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateSharedSwapchainsKHR*(device: VkDevice; swapchainCount: uint32; pCreateInfos: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSwapchains: ptr VkSwapchainKHR): VkResult {.cdecl, importc.}
const
  vkKhrSamplerMirrorClampoEdge* = 1
  vkKhrSamplerMirrorClampToEdgeSpecVersion* = 1
  vkKhrSamplerMirrorClampToEdgeExtensionName* = "vkKhrSamplerMirrorClampoEdge"
  vkKhrMultiview* = 1
  vkKhrMultiviewSpecVersion* = 1
  vkKhrMultiviewExtensionName* = "vkKhrMultiview"

type
  VkRenderPassMultiviewCreateInfoKHR* = VkRenderPassMultiviewCreateInfo
  VkPhysicalDeviceMultiviewFeaturesKHR* = VkPhysicalDeviceMultiviewFeatures
  VkPhysicalDeviceMultiviewPropertiesKHR* = VkPhysicalDeviceMultiviewProperties

const
  vkKhrGetPhysicalDeviceProperties2* = 1
  vkKhrGetPhysicalDeviceProperties_2SpecVersion* = 1
  vkKhrGetPhysicalDeviceProperties_2ExtensionName* = "vkKhrGetPhysicalDeviceProperties2"

type
  VkPhysicalDeviceFeatures2KHR* = VkPhysicalDeviceFeatures2
  VkPhysicalDeviceProperties2KHR* = VkPhysicalDeviceProperties2
  VkFormatProperties2KHR* = VkFormatProperties2
  VkImageFormatProperties2KHR* = VkImageFormatProperties2
  VkPhysicalDeviceImageFormatInfo2KHR* = VkPhysicalDeviceImageFormatInfo2
  VkQueueFamilyProperties2KHR* = VkQueueFamilyProperties2
  VkPhysicalDeviceMemoryProperties2KHR* = VkPhysicalDeviceMemoryProperties2
  VkSparseImageFormatProperties2KHR* = VkSparseImageFormatProperties2
  VkPhysicalDeviceSparseImageFormatInfo2KHR* = VkPhysicalDeviceSparseImageFormatInfo2
  PFNVkgetphysicaldevicefeatures2KHR* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures2) {.cdecl.}
  PFNVkgetphysicaldeviceproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties2) {.cdecl.}
  PFNVkgetphysicaldeviceformatproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties2) {.cdecl.}
  PFNVkgetphysicaldeviceimageformatproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2; pImageFormatProperties: ptr VkImageFormatProperties2): VkResult {.cdecl.}
  PFNVkgetphysicaldevicequeuefamilyproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties2) {.cdecl.}
  PFNVkgetphysicaldevicememoryproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2) {.cdecl.}
  PFNVkgetphysicaldevicesparseimageformatproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties2) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceFeatures2KHR*(physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceProperties2KHR*(physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceFormatProperties2KHR*(physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceImageFormatProperties2KHR*(physicalDevice: VkPhysicalDevice; pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2; pImageFormatProperties: ptr VkImageFormatProperties2): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceQueueFamilyProperties2KHR*(physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceMemoryProperties2KHR*(physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2) {.cdecl, importc.}
  proc vkGetPhysicalDeviceSparseImageFormatProperties2KHR*(physicalDevice: VkPhysicalDevice; pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties2) {.cdecl, importc.}
const
  vkKhrDeviceGroup* = 1
  vkKhrDeviceGroupSpecVersion* = 3
  vkKhrDeviceGroupExtensionName* = "vkKhrDeviceGroup"

type
  VkPeerMemoryFeatureFlagsKHR* = VkPeerMemoryFeatureFlags
  VkPeerMemoryFeatureFlagBitsKHR* = VkPeerMemoryFeatureFlagBits
  VkMemoryAllocateFlagsKHR* = VkMemoryAllocateFlags
  VkMemoryAllocateFlagBitsKHR* = VkMemoryAllocateFlagBits
  VkMemoryAllocateFlagsInfoKHR* = VkMemoryAllocateFlagsInfo
  VkDeviceGroupRenderPassBeginInfoKHR* = VkDeviceGroupRenderPassBeginInfo
  VkDeviceGroupCommandBufferBeginInfoKHR* = VkDeviceGroupCommandBufferBeginInfo
  VkDeviceGroupSubmitInfoKHR* = VkDeviceGroupSubmitInfo
  VkDeviceGroupBindSparseInfoKHR* = VkDeviceGroupBindSparseInfo
  VkBindBufferMemoryDeviceGroupInfoKHR* = VkBindBufferMemoryDeviceGroupInfo
  VkBindImageMemoryDeviceGroupInfoKHR* = VkBindImageMemoryDeviceGroupInfo
  PFNVkgetdevicegrouppeermemoryfeatureskhr* = proc (device: VkDevice; heapIndex: uint32; localDeviceIndex: uint32; remoteDeviceIndex: uint32; pPeerMemoryFeatures: ptr VkPeerMemoryFeatureFlags) {.cdecl.}
  PFNVkcmdsetdevicemaskkhr* = proc (commandBuffer: VkCommandBuffer; deviceMask: uint32) {.cdecl.}
  PFNVkcmddispatchbasekhr* = proc (commandBuffer: VkCommandBuffer; baseGroupX: uint32; baseGroupY: uint32; baseGroupZ: uint32; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetDeviceGroupPeerMemoryFeaturesKHR*(device: VkDevice; heapIndex: uint32; localDeviceIndex: uint32; remoteDeviceIndex: uint32; pPeerMemoryFeatures: ptr VkPeerMemoryFeatureFlags) {.cdecl, importc.}
  proc vkCmdSetDeviceMaskKHR*(commandBuffer: VkCommandBuffer; deviceMask: uint32) {.cdecl, importc.}
  proc vkCmdDispatchBaseKHR*(commandBuffer: VkCommandBuffer; baseGroupX: uint32; baseGroupY: uint32; baseGroupZ: uint32; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl, importc.}
const
  vkKhrShaderDrawParameters* = 1
  vkKhrShaderDrawParametersSpecVersion* = 1
  vkKhrShaderDrawParametersExtensionName* = "vkKhrShaderDrawParameters"
  vkKhrMaintenance1* = 1
  vkKhrMaintenance1SpecVersion* = 2
  vkKhrMaintenance1ExtensionName* = "vkKhrMaintenance1"

type
  VkCommandPoolTrimFlagsKHR* = VkCommandPoolTrimFlags
  PFNVktrimcommandpoolkhr* = proc (device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolTrimFlags) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkTrimCommandPoolKHR*(device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolTrimFlags) {.cdecl, importc.}
const
  vkKhrDeviceGroupCreation* = 1
  vkKhrDeviceGroupCreationSpecVersion* = 1
  vkKhrDeviceGroupCreationExtensionName* = "vkKhrDeviceGroupCreation"
  vkMaxDeviceGroupSizeKhr* = vkMaxDeviceGroupSize

type
  VkPhysicalDeviceGroupPropertiesKHR* = VkPhysicalDeviceGroupProperties
  VkDeviceGroupDeviceCreateInfoKHR* = VkDeviceGroupDeviceCreateInfo
  PFNVkenumeratephysicaldevicegroupskhr* = proc (instance: VkInstance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr VkPhysicalDeviceGroupProperties): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkEnumeratePhysicalDeviceGroupsKHR*(instance: VkInstance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr VkPhysicalDeviceGroupProperties): VkResult {.cdecl, importc.}
const
  vkKhrExternalMemoryCapabilities* = 1
  vkKhrExternalMemoryCapabilitiesSpecVersion* = 1
  vkKhrExternalMemoryCapabilitiesExtensionName* = "vkKhrExternalMemoryCapabilities"
  vkLuidSizeKhr* = vkLuidSize

type
  VkExternalMemoryHandleTypeFlagsKHR* = VkExternalMemoryHandleTypeFlags
  VkExternalMemoryHandleTypeFlagBitsKHR* = VkExternalMemoryHandleTypeFlagBits
  VkExternalMemoryFeatureFlagsKHR* = VkExternalMemoryFeatureFlags
  VkExternalMemoryFeatureFlagBitsKHR* = VkExternalMemoryFeatureFlagBits
  VkExternalMemoryPropertiesKHR* = VkExternalMemoryProperties
  VkPhysicalDeviceExternalImageFormatInfoKHR* = VkPhysicalDeviceExternalImageFormatInfo
  VkExternalImageFormatPropertiesKHR* = VkExternalImageFormatProperties
  VkPhysicalDeviceExternalBufferInfoKHR* = VkPhysicalDeviceExternalBufferInfo
  VkExternalBufferPropertiesKHR* = VkExternalBufferProperties
  VkPhysicalDeviceIDPropertiesKHR* = VkPhysicalDeviceIDProperties
  PFNVkgetphysicaldeviceexternalbufferpropertieskhr* = proc (physicalDevice: VkPhysicalDevice; pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfo; pExternalBufferProperties: ptr VkExternalBufferProperties) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceExternalBufferPropertiesKHR*(physicalDevice: VkPhysicalDevice; pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfo; pExternalBufferProperties: ptr VkExternalBufferProperties) {.cdecl, importc.}
const
  vkKhrExternalMemory* = 1
  vkKhrExternalMemorySpecVersion* = 1
  vkKhrExternalMemoryExtensionName* = "vkKhrExternalMemory"
  vkQueueFamilyExternalKhr* = vkQueueFamilyExternal

type
  VkExternalMemoryImageCreateInfoKHR* = VkExternalMemoryImageCreateInfo
  VkExternalMemoryBufferCreateInfoKHR* = VkExternalMemoryBufferCreateInfo
  VkExportMemoryAllocateInfoKHR* = VkExportMemoryAllocateInfo

const
  vkKhrExternalMemoryFd* = 1
  vkKhrExternalMemoryFdSpecVersion* = 1
  vkKhrExternalMemoryFdExtensionName* = "vkKhrExternalMemoryFd"

type
  VkImportMemoryFdInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBits
    fd*: cint

  VkMemoryFdPropertiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memoryTypeBits*: uint32

  VkMemoryGetFdInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory
    handleType*: VkExternalMemoryHandleTypeFlagBits

  PFNVkgetmemoryfdkhr* = proc (device: VkDevice; pGetFdInfo: ptr VkMemoryGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl.}
  PFNVkgetmemoryfdpropertieskhr* = proc (device: VkDevice; handleType: VkExternalMemoryHandleTypeFlagBits; fd: cint; pMemoryFdProperties: ptr VkMemoryFdPropertiesKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetMemoryFdKHR*(device: VkDevice; pGetFdInfo: ptr VkMemoryGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl, importc.}
  proc vkGetMemoryFdPropertiesKHR*(device: VkDevice; handleType: VkExternalMemoryHandleTypeFlagBits; fd: cint; pMemoryFdProperties: ptr VkMemoryFdPropertiesKHR): VkResult {.cdecl, importc.}
const
  vkKhrExternalSemaphoreCapabilities* = 1
  vkKhrExternalSemaphoreCapabilitiesSpecVersion* = 1
  vkKhrExternalSemaphoreCapabilitiesExtensionName* = "vkKhrExternalSemaphoreCapabilities"

type
  VkExternalSemaphoreHandleTypeFlagsKHR* = VkExternalSemaphoreHandleTypeFlags
  VkExternalSemaphoreHandleTypeFlagBitsKHR* = VkExternalSemaphoreHandleTypeFlagBits
  VkExternalSemaphoreFeatureFlagsKHR* = VkExternalSemaphoreFeatureFlags
  VkExternalSemaphoreFeatureFlagBitsKHR* = VkExternalSemaphoreFeatureFlagBits
  VkPhysicalDeviceExternalSemaphoreInfoKHR* = VkPhysicalDeviceExternalSemaphoreInfo
  VkExternalSemaphorePropertiesKHR* = VkExternalSemaphoreProperties
  PFNVkgetphysicaldeviceexternalsemaphorepropertieskhr* = proc (physicalDevice: VkPhysicalDevice; pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfo; pExternalSemaphoreProperties: ptr VkExternalSemaphoreProperties) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceExternalSemaphorePropertiesKHR*(physicalDevice: VkPhysicalDevice; pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfo; pExternalSemaphoreProperties: ptr VkExternalSemaphoreProperties) {.cdecl, importc.}
const
  vkKhrExternalSemaphore* = 1
  vkKhrExternalSemaphoreSpecVersion* = 1
  vkKhrExternalSemaphoreExtensionName* = "vkKhrExternalSemaphore"

type
  VkSemaphoreImportFlagsKHR* = VkSemaphoreImportFlags
  VkSemaphoreImportFlagBitsKHR* = VkSemaphoreImportFlagBits
  VkExportSemaphoreCreateInfoKHR* = VkExportSemaphoreCreateInfo

const
  vkKhrExternalSemaphoreFd* = 1
  vkKhrExternalSemaphoreFdSpecVersion* = 1
  vkKhrExternalSemaphoreFdExtensionName* = "vkKhrExternalSemaphoreFd"

type
  VkImportSemaphoreFdInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    flags*: VkSemaphoreImportFlags
    handleType*: VkExternalSemaphoreHandleTypeFlagBits
    fd*: cint

  VkSemaphoreGetFdInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    handleType*: VkExternalSemaphoreHandleTypeFlagBits

  PFNVkimportsemaphorefdkhr* = proc (device: VkDevice; pImportSemaphoreFdInfo: ptr VkImportSemaphoreFdInfoKHR): VkResult {.cdecl.}
  PFNVkgetsemaphorefdkhr* = proc (device: VkDevice; pGetFdInfo: ptr VkSemaphoreGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkImportSemaphoreFdKHR*(device: VkDevice; pImportSemaphoreFdInfo: ptr VkImportSemaphoreFdInfoKHR): VkResult {.cdecl, importc.}
  proc vkGetSemaphoreFdKHR*(device: VkDevice; pGetFdInfo: ptr VkSemaphoreGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl, importc.}
const
  vkKhrPushDescriptor* = 1
  vkKhrPushDescriptorSpecVersion* = 2
  vkKhrPushDescriptorExtensionName* = "vkKhrPushDescriptor"

type
  VkPhysicalDevicePushDescriptorPropertiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxPushDescriptors*: uint32

  PFNVkcmdpushdescriptorsetkhr* = proc (commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout; set: uint32; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet) {.cdecl.}
  PFNVkcmdpushdescriptorsetwithtemplatekhr* = proc (commandBuffer: VkCommandBuffer; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; layout: VkPipelineLayout; set: uint32; pData: pointer) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdPushDescriptorSetKHR*(commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout; set: uint32; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet) {.cdecl, importc.}
  proc vkCmdPushDescriptorSetWithTemplateKHR*(commandBuffer: VkCommandBuffer; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; layout: VkPipelineLayout; set: uint32; pData: pointer) {.cdecl, importc.}
const
  vkKhr_16bitStorage* = 1
  vkKhr_16BITStorageSpecVersion* = 1
  vkKhr_16BITStorageExtensionName* = "vkKhr_16bitStorage"

type
  VkPhysicalDevice16BitStorageFeaturesKHR* = VkPhysicalDevice16BitStorageFeatures

const
  vkKhrIncrementalPresent* = 1
  vkKhrIncrementalPresentSpecVersion* = 1
  vkKhrIncrementalPresentExtensionName* = "vkKhrIncrementalPresent"

type
  VkRectLayerKHR* {.bycopy.} = object
    offset*: VkOffset2D
    extent*: VkExtent2D
    layer*: uint32

  VkPresentRegionKHR* {.bycopy.} = object
    rectangleCount*: uint32
    pRectangles*: ptr VkRectLayerKHR

  VkPresentRegionsKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pRegions*: ptr VkPresentRegionKHR


const
  vkKhrDescriptorUpdateTemplate* = 1

type
  VkDescriptorUpdateTemplateKHR* = VkDescriptorUpdateTemplate

const
  vkKhrDescriptorUpdateTemplateSpecVersion* = 1
  vkKhrDescriptorUpdateTemplateExtensionName* = "vkKhrDescriptorUpdateTemplate"

type
  VkDescriptorUpdateTemplateTypeKHR* = VkDescriptorUpdateTemplateType
  VkDescriptorUpdateTemplateCreateFlagsKHR* = VkDescriptorUpdateTemplateCreateFlags
  VkDescriptorUpdateTemplateEntryKHR* = VkDescriptorUpdateTemplateEntry
  VkDescriptorUpdateTemplateCreateInfoKHR* = VkDescriptorUpdateTemplateCreateInfo
  PFNVkcreatedescriptorupdatetemplatekhr* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate): VkResult {.cdecl.}
  PFNVkdestroydescriptorupdatetemplatekhr* = proc (device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkupdatedescriptorsetwithtemplatekhr* = proc (device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pData: pointer) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateDescriptorUpdateTemplateKHR*(device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorUpdateTemplateKHR*(device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkUpdateDescriptorSetWithTemplateKHR*(device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pData: pointer) {.cdecl, importc.}
const
  vkKhrCreateRenderpass2* = 1
  vkKhrCreateRenderpass_2SpecVersion* = 1
  vkKhrCreateRenderpass_2ExtensionName* = "vkKhrCreateRenderpass2"

type
  VkAttachmentDescription2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkAttachmentDescriptionFlags
    format*: VkFormat
    samples*: VkSampleCountFlagBits
    loadOp*: VkAttachmentLoadOp
    storeOp*: VkAttachmentStoreOp
    stencilLoadOp*: VkAttachmentLoadOp
    stencilStoreOp*: VkAttachmentStoreOp
    initialLayout*: VkImageLayout
    finalLayout*: VkImageLayout

  VkAttachmentReference2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    attachment*: uint32
    layout*: VkImageLayout
    aspectMask*: VkImageAspectFlags

  VkSubpassDescription2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSubpassDescriptionFlags
    pipelineBindPoint*: VkPipelineBindPoint
    viewMask*: uint32
    inputAttachmentCount*: uint32
    pInputAttachments*: ptr VkAttachmentReference2KHR
    colorAttachmentCount*: uint32
    pColorAttachments*: ptr VkAttachmentReference2KHR
    pResolveAttachments*: ptr VkAttachmentReference2KHR
    pDepthStencilAttachment*: ptr VkAttachmentReference2KHR
    preserveAttachmentCount*: uint32
    pPreserveAttachments*: ptr uint32

  VkSubpassDependency2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: VkPipelineStageFlags
    dstStageMask*: VkPipelineStageFlags
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    dependencyFlags*: VkDependencyFlags
    viewOffset*: int32

  VkRenderPassCreateInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkRenderPassCreateFlags
    attachmentCount*: uint32
    pAttachments*: ptr VkAttachmentDescription2KHR
    subpassCount*: uint32
    pSubpasses*: ptr VkSubpassDescription2KHR
    dependencyCount*: uint32
    pDependencies*: ptr VkSubpassDependency2KHR
    correlatedViewMaskCount*: uint32
    pCorrelatedViewMasks*: ptr uint32

  VkSubpassBeginInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    contents*: VkSubpassContents

  VkSubpassEndInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer

  PFNVkcreaterenderpass2KHR* = proc (device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo2KHR; pAllocator: ptr VkAllocationCallbacks; pRenderPass: ptr VkRenderPass): VkResult {.cdecl.}
  PFNVkcmdbeginrenderpass2KHR* = proc (commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; pSubpassBeginInfo: ptr VkSubpassBeginInfoKHR) {.cdecl.}
  PFNVkcmdnextsubpass2KHR* = proc (commandBuffer: VkCommandBuffer; pSubpassBeginInfo: ptr VkSubpassBeginInfoKHR; pSubpassEndInfo: ptr VkSubpassEndInfoKHR) {.cdecl.}
  PFNVkcmdendrenderpass2KHR* = proc (commandBuffer: VkCommandBuffer; pSubpassEndInfo: ptr VkSubpassEndInfoKHR) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateRenderPass2KHR*(device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo2KHR; pAllocator: ptr VkAllocationCallbacks; pRenderPass: ptr VkRenderPass): VkResult {.cdecl, importc.}
  proc vkCmdBeginRenderPass2KHR*(commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; pSubpassBeginInfo: ptr VkSubpassBeginInfoKHR) {.cdecl, importc.}
  proc vkCmdNextSubpass2KHR*(commandBuffer: VkCommandBuffer; pSubpassBeginInfo: ptr VkSubpassBeginInfoKHR; pSubpassEndInfo: ptr VkSubpassEndInfoKHR) {.cdecl, importc.}
  proc vkCmdEndRenderPass2KHR*(commandBuffer: VkCommandBuffer; pSubpassEndInfo: ptr VkSubpassEndInfoKHR) {.cdecl, importc.}
const
  vkKhrSharedPresentableImage* = 1
  vkKhrSharedPresentableImageSpecVersion* = 1
  vkKhrSharedPresentableImageExtensionName* = "vkKhrSharedPresentableImage"

type
  VkSharedPresentSurfaceCapabilitiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    sharedPresentSupportedUsageFlags*: VkImageUsageFlags

  PFNVkgetswapchainstatuskhr* = proc (device: VkDevice; swapchain: VkSwapchainKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetSwapchainStatusKHR*(device: VkDevice; swapchain: VkSwapchainKHR): VkResult {.cdecl, importc.}
const
  vkKhrExternalFenceCapabilities* = 1
  vkKhrExternalFenceCapabilitiesSpecVersion* = 1
  vkKhrExternalFenceCapabilitiesExtensionName* = "vkKhrExternalFenceCapabilities"

type
  VkExternalFenceHandleTypeFlagsKHR* = VkExternalFenceHandleTypeFlags
  VkExternalFenceHandleTypeFlagBitsKHR* = VkExternalFenceHandleTypeFlagBits
  VkExternalFenceFeatureFlagsKHR* = VkExternalFenceFeatureFlags
  VkExternalFenceFeatureFlagBitsKHR* = VkExternalFenceFeatureFlagBits
  VkPhysicalDeviceExternalFenceInfoKHR* = VkPhysicalDeviceExternalFenceInfo
  VkExternalFencePropertiesKHR* = VkExternalFenceProperties
  PFNVkgetphysicaldeviceexternalfencepropertieskhr* = proc (physicalDevice: VkPhysicalDevice; pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfo; pExternalFenceProperties: ptr VkExternalFenceProperties) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceExternalFencePropertiesKHR*(physicalDevice: VkPhysicalDevice; pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfo; pExternalFenceProperties: ptr VkExternalFenceProperties) {.cdecl, importc.}
const
  vkKhrExternalFence* = 1
  vkKhrExternalFenceSpecVersion* = 1
  vkKhrExternalFenceExtensionName* = "vkKhrExternalFence"

type
  VkFenceImportFlagsKHR* = VkFenceImportFlags
  VkFenceImportFlagBitsKHR* = VkFenceImportFlagBits
  VkExportFenceCreateInfoKHR* = VkExportFenceCreateInfo

const
  vkKhrExternalFenceFd* = 1
  vkKhrExternalFenceFdSpecVersion* = 1
  vkKhrExternalFenceFdExtensionName* = "vkKhrExternalFenceFd"

type
  VkImportFenceFdInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fence*: VkFence
    flags*: VkFenceImportFlags
    handleType*: VkExternalFenceHandleTypeFlagBits
    fd*: cint

  VkFenceGetFdInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fence*: VkFence
    handleType*: VkExternalFenceHandleTypeFlagBits

  PFNVkimportfencefdkhr* = proc (device: VkDevice; pImportFenceFdInfo: ptr VkImportFenceFdInfoKHR): VkResult {.cdecl.}
  PFNVkgetfencefdkhr* = proc (device: VkDevice; pGetFdInfo: ptr VkFenceGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkImportFenceFdKHR*(device: VkDevice; pImportFenceFdInfo: ptr VkImportFenceFdInfoKHR): VkResult {.cdecl, importc.}
  proc vkGetFenceFdKHR*(device: VkDevice; pGetFdInfo: ptr VkFenceGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl, importc.}
const
  vkKhrMaintenance2* = 1
  vkKhrMaintenance2SpecVersion* = 1
  vkKhrMaintenance2ExtensionName* = "vkKhrMaintenance2"

type
  VkPointClippingBehaviorKHR* = VkPointClippingBehavior
  VkTessellationDomainOriginKHR* = VkTessellationDomainOrigin
  VkPhysicalDevicePointClippingPropertiesKHR* = VkPhysicalDevicePointClippingProperties
  VkRenderPassInputAttachmentAspectCreateInfoKHR* = VkRenderPassInputAttachmentAspectCreateInfo
  VkInputAttachmentAspectReferenceKHR* = VkInputAttachmentAspectReference
  VkImageViewUsageCreateInfoKHR* = VkImageViewUsageCreateInfo
  VkPipelineTessellationDomainOriginStateCreateInfoKHR* = VkPipelineTessellationDomainOriginStateCreateInfo

const
  vkKhrGetSurfaceCapabilities2* = 1
  vkKhrGetSurfaceCapabilities_2SpecVersion* = 1
  vkKhrGetSurfaceCapabilities_2ExtensionName* = "vkKhrGetSurfaceCapabilities2"

type
  VkPhysicalDeviceSurfaceInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    surface*: VkSurfaceKHR

  VkSurfaceCapabilities2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceCapabilities*: VkSurfaceCapabilitiesKHR

  VkSurfaceFormat2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceFormat*: VkSurfaceFormatKHR

  PFNVkgetphysicaldevicesurfacecapabilities2KHR* = proc (physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2KHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicesurfaceformats2KHR* = proc (physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormat2KHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceSurfaceCapabilities2KHR*(physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2KHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceFormats2KHR*(physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormat2KHR): VkResult {.cdecl, importc.}
const
  vkKhrVariablePointers* = 1
  vkKhrVariablePointersSpecVersion* = 1
  vkKhrVariablePointersExtensionName* = "vkKhrVariablePointers"

type
  VkPhysicalDeviceVariablePointerFeaturesKHR* = VkPhysicalDeviceVariablePointerFeatures

const
  vkKhrGetDisplayProperties2* = 1
  vkKhrGetDisplayProperties_2SpecVersion* = 1
  vkKhrGetDisplayProperties_2ExtensionName* = "vkKhrGetDisplayProperties2"

type
  VkDisplayProperties2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    displayProperties*: VkDisplayPropertiesKHR

  VkDisplayPlaneProperties2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    displayPlaneProperties*: VkDisplayPlanePropertiesKHR

  VkDisplayModeProperties2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    displayModeProperties*: VkDisplayModePropertiesKHR

  VkDisplayPlaneInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    mode*: VkDisplayModeKHR
    planeIndex*: uint32

  VkDisplayPlaneCapabilities2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    capabilities*: VkDisplayPlaneCapabilitiesKHR

  PFNVkgetphysicaldevicedisplayproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayProperties2KHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicedisplayplaneproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlaneProperties2KHR): VkResult {.cdecl.}
  PFNVkgetdisplaymodeproperties2KHR* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModeProperties2KHR): VkResult {.cdecl.}
  PFNVkgetdisplayplanecapabilities2KHR* = proc (physicalDevice: VkPhysicalDevice; pDisplayPlaneInfo: ptr VkDisplayPlaneInfo2KHR; pCapabilities: ptr VkDisplayPlaneCapabilities2KHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceDisplayProperties2KHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayProperties2KHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceDisplayPlaneProperties2KHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlaneProperties2KHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayModeProperties2KHR*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModeProperties2KHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayPlaneCapabilities2KHR*(physicalDevice: VkPhysicalDevice; pDisplayPlaneInfo: ptr VkDisplayPlaneInfo2KHR; pCapabilities: ptr VkDisplayPlaneCapabilities2KHR): VkResult {.cdecl, importc.}
const
  vkKhrDedicatedAllocation* = 1
  vkKhrDedicatedAllocationSpecVersion* = 3
  vkKhrDedicatedAllocationExtensionName* = "vkKhrDedicatedAllocation"

type
  VkMemoryDedicatedRequirementsKHR* = VkMemoryDedicatedRequirements
  VkMemoryDedicatedAllocateInfoKHR* = VkMemoryDedicatedAllocateInfo

const
  vkKhrStorageBufferStorageClass* = 1
  vkKhrStorageBufferStorageClassSpecVersion* = 1
  vkKhrStorageBufferStorageClassExtensionName* = "vkKhrStorageBufferStorageClass"
  vkKhrRelaxedBlockLayout* = 1
  vkKhrRelaxedBlockLayoutSpecVersion* = 1
  vkKhrRelaxedBlockLayoutExtensionName* = "vkKhrRelaxedBlockLayout"
  vkKhrGetMemoryRequirements2* = 1
  vkKhrGetMemoryRequirements_2SpecVersion* = 1
  vkKhrGetMemoryRequirements_2ExtensionName* = "vkKhrGetMemoryRequirements2"

type
  VkBufferMemoryRequirementsInfo2KHR* = VkBufferMemoryRequirementsInfo2
  VkImageMemoryRequirementsInfo2KHR* = VkImageMemoryRequirementsInfo2
  VkImageSparseMemoryRequirementsInfo2KHR* = VkImageSparseMemoryRequirementsInfo2
  VkSparseImageMemoryRequirements2KHR* = VkSparseImageMemoryRequirements2
  PFNVkgetimagememoryrequirements2KHR* = proc (device: VkDevice; pInfo: ptr VkImageMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl.}
  PFNVkgetbuffermemoryrequirements2KHR* = proc (device: VkDevice; pInfo: ptr VkBufferMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl.}
  PFNVkgetimagesparsememoryrequirements2KHR* = proc (device: VkDevice; pInfo: ptr VkImageSparseMemoryRequirementsInfo2; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetImageMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkImageMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl, importc.}
  proc vkGetBufferMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkBufferMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl, importc.}
  proc vkGetImageSparseMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkImageSparseMemoryRequirementsInfo2; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2) {.cdecl, importc.}
const
  vkKhrImageFormatList* = 1
  vkKhrImageFormatListSpecVersion* = 1
  vkKhrImageFormatListExtensionName* = "vkKhrImageFormatList"

type
  VkImageFormatListCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    viewFormatCount*: uint32
    pViewFormats*: ptr VkFormat


const
  vkKhrSamplerYcbcrConversion* = 1

type
  VkSamplerYcbcrConversionKHR* = VkSamplerYcbcrConversion

const
  vkKhrSamplerYcbcrConversionSpecVersion* = 1
  vkKhrSamplerYcbcrConversionExtensionName* = "vkKhrSamplerYcbcrConversion"

type
  VkSamplerYcbcrModelConversionKHR* = VkSamplerYcbcrModelConversion
  VkSamplerYcbcrRangeKHR* = VkSamplerYcbcrRange
  VkChromaLocationKHR* = VkChromaLocation
  VkSamplerYcbcrConversionCreateInfoKHR* = VkSamplerYcbcrConversionCreateInfo
  VkSamplerYcbcrConversionInfoKHR* = VkSamplerYcbcrConversionInfo
  VkBindImagePlaneMemoryInfoKHR* = VkBindImagePlaneMemoryInfo
  VkImagePlaneMemoryRequirementsInfoKHR* = VkImagePlaneMemoryRequirementsInfo
  VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR* = VkPhysicalDeviceSamplerYcbcrConversionFeatures
  VkSamplerYcbcrConversionImageFormatPropertiesKHR* = VkSamplerYcbcrConversionImageFormatProperties
  PFNVkcreatesamplerycbcrconversionkhr* = proc (device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo; pAllocator: ptr VkAllocationCallbacks; pYcbcrConversion: ptr VkSamplerYcbcrConversion): VkResult {.cdecl.}
  PFNVkdestroysamplerycbcrconversionkhr* = proc (device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversion; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateSamplerYcbcrConversionKHR*(device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo; pAllocator: ptr VkAllocationCallbacks; pYcbcrConversion: ptr VkSamplerYcbcrConversion): VkResult {.cdecl, importc.}
  proc vkDestroySamplerYcbcrConversionKHR*(device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversion; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
const
  vkKhrBindMemory2* = 1
  vkKhrBindMemory_2SpecVersion* = 1
  vkKhrBindMemory_2ExtensionName* = "vkKhrBindMemory2"

type
  VkBindBufferMemoryInfoKHR* = VkBindBufferMemoryInfo
  VkBindImageMemoryInfoKHR* = VkBindImageMemoryInfo
  PFNVkbindbuffermemory2KHR* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindBufferMemoryInfo): VkResult {.cdecl.}
  PFNVkbindimagememory2KHR* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindImageMemoryInfo): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkBindBufferMemory2KHR*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindBufferMemoryInfo): VkResult {.cdecl, importc.}
  proc vkBindImageMemory2KHR*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindImageMemoryInfo): VkResult {.cdecl, importc.}
const
  vkKhrMaintenance3* = 1
  vkKhrMaintenance3SpecVersion* = 1
  vkKhrMaintenance3ExtensionName* = "vkKhrMaintenance3"

type
  VkPhysicalDeviceMaintenance3PropertiesKHR* = VkPhysicalDeviceMaintenance3Properties
  VkDescriptorSetLayoutSupportKHR* = VkDescriptorSetLayoutSupport
  PFNVkgetdescriptorsetlayoutsupportkhr* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pSupport: ptr VkDescriptorSetLayoutSupport) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetDescriptorSetLayoutSupportKHR*(device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pSupport: ptr VkDescriptorSetLayoutSupport) {.cdecl, importc.}
const
  vkKhrDrawIndirectCount* = 1
  vkKhrDrawIndirectCountSpecVersion* = 1
  vkKhrDrawIndirectCountExtensionName* = "vkKhrDrawIndirectCount"

type
  PFNVkcmddrawindirectcountkhr* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcmddrawindexedindirectcountkhr* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdDrawIndirectCountKHR*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexedIndirectCountKHR*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
const
  vkKhr_8bitStorage* = 1
  vkKhr_8BITStorageSpecVersion* = 1
  vkKhr_8BITStorageExtensionName* = "vkKhr_8bitStorage"

type
  VkPhysicalDevice8BitStorageFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    storageBuffer8BitAccess*: VkBool32
    uniformAndStorageBuffer8BitAccess*: VkBool32
    storagePushConstant8*: VkBool32


const
  vkKhrShaderAtomicInt64* = 1
  vkKhrShaderAtomicInt64SpecVersion* = 1
  vkKhrShaderAtomicInt64ExtensionName* = "vkKhrShaderAtomicInt64"

type
  VkPhysicalDeviceShaderAtomicInt64FeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderBufferInt64Atomics*: VkBool32
    shaderSharedInt64Atomics*: VkBool32


const
  vkKhrDriverProperties* = 1
  vkMaxDriverNameSizeKhr* = 256
  vkMaxDriverInfoSizeKhr* = 256
  vkKhrDriverPropertiesSpecVersion* = 1
  vkKhrDriverPropertiesExtensionName* = "vkKhrDriverProperties"

type
  VkDriverIdKHR* = distinct cint
  VkConformanceVersionKHR* {.bycopy.} = object
    major*: uint8
    minor*: uint8
    subminor*: uint8
    patch*: uint8

  VkPhysicalDeviceDriverPropertiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    driverID*: VkDriverIdKHR
    driverName*: array[vkMaxDriverNameSizeKhr, char]
    driverInfo*: array[vkMaxDriverInfoSizeKhr, char]
    conformanceVersion*: VkConformanceVersionKHR


const
  vkDriverIdAmdProprietaryKhr* = 1.VkDriverIdKHR
  vkDriverIdAmdOpenSourceKhr* = 2.VkDriverIdKHR
  vkDriverIdMesaRadvKhr* = 3.VkDriverIdKHR
  vkDriverIdNvidiaProprietaryKhr* = 4.VkDriverIdKHR
  vkDriverIdIntelProprietaryWindowsKhr* = 5.VkDriverIdKHR
  vkDriverIdIntelOpenSourceMesaKhr* = 6.VkDriverIdKHR
  vkDriverIdImaginationProprietaryKhr* = 7.VkDriverIdKHR
  vkDriverIdQualcommProprietaryKhr* = 8.VkDriverIdKHR
  vkDriverIdArmProprietaryKhr* = 9.VkDriverIdKHR
  vkDriverIdBeginRangeKhr: VkDriverIdKHR = vkDriverIdAmdProprietaryKhr
  vkDriverIdEndRangeKhr: VkDriverIdKHR = vkDriverIdArmProprietaryKhr
  vkDriverIdRangeSizeKhr: VkDriverIdKHR = (vkDriverIdArmProprietaryKhr - vkDriverIdAmdProprietaryKhr + 1)
  vkDriverIdMaxEnumKhr* = 0x7FFFFFFF.VkDriverIdKHR

const
  vkKhrVulkanMemoryModel* = 1
  vkKhrVulkanMemoryModelSpecVersion* = 2
  vkKhrVulkanMemoryModelExtensionName* = "vkKhrVulkanMemoryModel"

type
  VkPhysicalDeviceVulkanMemoryModelFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    vulkanMemoryModel*: VkBool32
    vulkanMemoryModelDeviceScope*: VkBool32


const
  vkExtDebugReport* = 1

type
  VkDebugReportCallbackEXT* = VkNonDispatchableHandle

const
  vkExtDebugReportSpecVersion* = 9
  vkExtDebugReportExtensionName* = "vkExtDebugReport"

type
  VkDebugReportObjectTypeEXT* = distinct cint
  VkDebugReportFlagBitsEXT* = distinct cint
  VkDebugReportFlagsEXT* = VkFlags
  PFNVkdebugreportcallbackext* = proc (flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; `object`: uint64; location: csize; messageCode: int32; pLayerPrefix: cstring; pMessage: cstring; pUserData: pointer): VkBool32 {.cdecl.}
  VkDebugReportCallbackCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDebugReportFlagsEXT
    pfnCallback*: PFNVkdebugreportcallbackext
    pUserData*: pointer

  PFNVkcreatedebugreportcallbackext* = proc (instance: VkInstance; pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pCallback: ptr VkDebugReportCallbackEXT): VkResult {.cdecl.}
  PFNVkdestroydebugreportcallbackext* = proc (instance: VkInstance; callback: VkDebugReportCallbackEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkdebugreportmessageext* = proc (instance: VkInstance; flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; `object`: uint64; location: csize; messageCode: int32; pLayerPrefix: cstring; pMessage: cstring) {.cdecl.}

const
  vkDebugReportObjectTypeUnknownExt* = 0.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeInstanceExt* = 1.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypePhysicalDeviceExt* = 2.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDeviceExt* = 3.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeQueueExt* = 4.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSemaphoreExt* = 5.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeCommandBufferExt* = 6.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeFenceExt* = 7.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDeviceMemoryExt* = 8.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeBufferExt* = 9.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeImageExt* = 10.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeEventExt* = 11.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeQueryPoolExt* = 12.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeBufferViewExt* = 13.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeImageViewExt* = 14.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeShaderModuleExt* = 15.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypePipelineCacheExt* = 16.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypePipelineLayoutExt* = 17.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeRenderPassExt* = 18.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypePipelineExt* = 19.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDescriptorSetLayoutExt* = 20.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSamplerExt* = 21.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDescriptorPoolExt* = 22.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDescriptorSetExt* = 23.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeFramebufferExt* = 24.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeCommandPoolExt* = 25.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSurfaceKhrExt* = 26.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSwapchainKhrExt* = 27.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDebugReportCallbackExtExt* = 28.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDisplayKhrExt* = 29.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDisplayModeKhrExt* = 30.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeObjectTableNvxExt* = 31.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeIndirectCommandsLayoutNvxExt* = 32.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeValidationCacheExtExt* = 33.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDescriptorUpdateTemplateExt* = 1000085000.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSamplerYcbcrConversionExt* = 1000156000.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeAccelerationStructureNvExt* = 1000165000.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDebugReportExt: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeDebugReportCallbackExtExt
  vkDebugReportObjectTypeValidationCacheExt: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeValidationCacheExtExt
  vkDebugReportObjectTypeDescriptorUpdateTemplateKhrExt: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeDescriptorUpdateTemplateExt
  vkDebugReportObjectTypeSamplerYcbcrConversionKhrExt: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeSamplerYcbcrConversionExt
  vkDebugReportObjectTypeBeginRangeExt: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeUnknownExt
  vkDebugReportObjectTypeEndRangeExt: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeValidationCacheExtExt
  vkDebugReportObjectTypeRangeSizeExt: VkDebugReportObjectTypeEXT = (vkDebugReportObjectTypeValidationCacheExtExt - vkDebugReportObjectTypeUnknownExt + 1)
  vkDebugReportObjectTypeMaxEnumExt* = 0x7FFFFFFF.VkDebugReportObjectTypeEXT

const
  vkDebugReportInformationBitExt* = 0x00000001.VkDebugReportFlagBitsEXT
  vkDebugReportWarningBitExt* = 0x00000002.VkDebugReportFlagBitsEXT
  vkDebugReportPerformanceWarningBitExt* = 0x00000004.VkDebugReportFlagBitsEXT
  vkDebugReportErrorBitExt* = 0x00000008.VkDebugReportFlagBitsEXT
  vkDebugReportDebugBitExt* = 0x00000010.VkDebugReportFlagBitsEXT
  vkDebugReportFlagBitsMaxEnumExt* = 0x7FFFFFFF.VkDebugReportFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkCreateDebugReportCallbackEXT*(instance: VkInstance; pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pCallback: ptr VkDebugReportCallbackEXT): VkResult {.cdecl, importc.}
  proc vkDestroyDebugReportCallbackEXT*(instance: VkInstance; callback: VkDebugReportCallbackEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkDebugReportMessageEXT*(instance: VkInstance; flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; `object`: uint64; location: csize; messageCode: int32; pLayerPrefix: cstring; pMessage: cstring) {.cdecl, importc.}
const
  vkNvGlslShader* = 1
  vkNvGlslShaderSpecVersion* = 1
  vkNvGlslShaderExtensionName* = "vkNvGlslShader"
  vkExtDepthRangeUnrestricted* = 1
  vkExtDepthRangeUnrestrictedSpecVersion* = 1
  vkExtDepthRangeUnrestrictedExtensionName* = "vkExtDepthRangeUnrestricted"
  vkImgFilterCubic* = 1
  vkImgFilterCubicSpecVersion* = 1
  vkImgFilterCubicExtensionName* = "vkImgFilterCubic"
  vkAmdRasterizationOrder* = 1
  vkAmdRasterizationOrderSpecVersion* = 1
  vkAmdRasterizationOrderExtensionName* = "vkAmdRasterizationOrder"

type
  VkRasterizationOrderAMD* = distinct cint
  VkPipelineRasterizationStateRasterizationOrderAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    rasterizationOrder*: VkRasterizationOrderAMD


const
  vkRasterizationOrderStrictAmd* = 0.VkRasterizationOrderAMD
  vkRasterizationOrderRelaxedAmd* = 1.VkRasterizationOrderAMD
  vkRasterizationOrderBeginRangeAmd: VkRasterizationOrderAMD = vkRasterizationOrderStrictAmd
  vkRasterizationOrderEndRangeAmd: VkRasterizationOrderAMD = vkRasterizationOrderRelaxedAmd
  vkRasterizationOrderRangeSizeAmd: VkRasterizationOrderAMD = (vkRasterizationOrderRelaxedAmd - vkRasterizationOrderStrictAmd + 1)
  vkRasterizationOrderMaxEnumAmd* = 0x7FFFFFFF.VkRasterizationOrderAMD

const
  vkAmdShaderrinaryMinmax* = 1
  vkAmdShaderTrinaryMinmaxSpecVersion* = 1
  vkAmdShaderTrinaryMinmaxExtensionName* = "vkAmdShaderrinaryMinmax"
  vkAmdShaderExplicitVertexParameter* = 1
  vkAmdShaderExplicitVertexParameterSpecVersion* = 1
  vkAmdShaderExplicitVertexParameterExtensionName* = "vkAmdShaderExplicitVertexParameter"
  vkExtDebugMarker* = 1
  vkExtDebugMarkerSpecVersion* = 4
  vkExtDebugMarkerExtensionName* = "vkExtDebugMarker"

type
  VkDebugMarkerObjectNameInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkDebugReportObjectTypeEXT
    `object`*: uint64
    pObjectName*: cstring

  VkDebugMarkerObjectTagInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkDebugReportObjectTypeEXT
    `object`*: uint64
    tagName*: uint64
    tagSize*: csize
    pTag*: pointer

  VkDebugMarkerMarkerInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pMarkerName*: cstring
    color*: array[4, cfloat]

  PFNVkdebugmarkersetobjecttagext* = proc (device: VkDevice; pTagInfo: ptr VkDebugMarkerObjectTagInfoEXT): VkResult {.cdecl.}
  PFNVkdebugmarkersetobjectnameext* = proc (device: VkDevice; pNameInfo: ptr VkDebugMarkerObjectNameInfoEXT): VkResult {.cdecl.}
  PFNVkcmddebugmarkerbeginext* = proc (commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT) {.cdecl.}
  PFNVkcmddebugmarkerendext* = proc (commandBuffer: VkCommandBuffer) {.cdecl.}
  PFNVkcmddebugmarkerinsertext* = proc (commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkDebugMarkerSetObjectTagEXT*(device: VkDevice; pTagInfo: ptr VkDebugMarkerObjectTagInfoEXT): VkResult {.cdecl, importc.}
  proc vkDebugMarkerSetObjectNameEXT*(device: VkDevice; pNameInfo: ptr VkDebugMarkerObjectNameInfoEXT): VkResult {.cdecl, importc.}
  proc vkCmdDebugMarkerBeginEXT*(commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT) {.cdecl, importc.}
  proc vkCmdDebugMarkerEndEXT*(commandBuffer: VkCommandBuffer) {.cdecl, importc.}
  proc vkCmdDebugMarkerInsertEXT*(commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT) {.cdecl, importc.}
const
  vkAmdGcnShader* = 1
  vkAmdGcnShaderSpecVersion* = 1
  vkAmdGcnShaderExtensionName* = "vkAmdGcnShader"
  vkNvDedicatedAllocation* = 1
  vkNvDedicatedAllocationSpecVersion* = 1
  vkNvDedicatedAllocationExtensionName* = "vkNvDedicatedAllocation"

type
  VkDedicatedAllocationImageCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    dedicatedAllocation*: VkBool32

  VkDedicatedAllocationBufferCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    dedicatedAllocation*: VkBool32

  VkDedicatedAllocationMemoryAllocateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    buffer*: VkBuffer


const
  vkExtransformFeedback* = 1
  vkExtTransformFeedbackSpecVersion* = 1
  vkExtTransformFeedbackExtensionName* = "vkExtransformFeedback"

type
  VkPipelineRasterizationStateStreamCreateFlagsEXT* = VkFlags
  VkPhysicalDeviceTransformFeedbackFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    transformFeedback*: VkBool32
    geometryStreams*: VkBool32

  VkPhysicalDeviceTransformFeedbackPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxTransformFeedbackStreams*: uint32
    maxTransformFeedbackBuffers*: uint32
    maxTransformFeedbackBufferSize*: VkDeviceSize
    maxTransformFeedbackStreamDataSize*: uint32
    maxTransformFeedbackBufferDataSize*: uint32
    maxTransformFeedbackBufferDataStride*: uint32
    transformFeedbackQueries*: VkBool32
    transformFeedbackStreamsLinesTriangles*: VkBool32
    transformFeedbackRasterizationStreamSelect*: VkBool32
    transformFeedbackDraw*: VkBool32

  VkPipelineRasterizationStateStreamCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationStateStreamCreateFlagsEXT
    rasterizationStream*: uint32

  PFNVkcmdbindtransformfeedbackbuffersext* = proc (commandBuffer: VkCommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer; pOffsets: ptr VkDeviceSize; pSizes: ptr VkDeviceSize) {.cdecl.}
  PFNVkcmdbegintransformfeedbackext* = proc (commandBuffer: VkCommandBuffer; firstCounterBuffer: uint32; counterBufferCount: uint32; pCounterBuffers: ptr VkBuffer; pCounterBufferOffsets: ptr VkDeviceSize) {.cdecl.}
  PFNVkcmdendtransformfeedbackext* = proc (commandBuffer: VkCommandBuffer; firstCounterBuffer: uint32; counterBufferCount: uint32; pCounterBuffers: ptr VkBuffer; pCounterBufferOffsets: ptr VkDeviceSize) {.cdecl.}
  PFNVkcmdbeginqueryindexedext* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32; flags: VkQueryControlFlags; index: uint32) {.cdecl.}
  PFNVkcmdendqueryindexedext* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32; index: uint32) {.cdecl.}
  PFNVkcmddrawindirectbytecountext* = proc (commandBuffer: VkCommandBuffer; instanceCount: uint32; firstInstance: uint32; counterBuffer: VkBuffer; counterBufferOffset: VkDeviceSize; counterOffset: uint32; vertexStride: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdBindTransformFeedbackBuffersEXT*(commandBuffer: VkCommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer; pOffsets: ptr VkDeviceSize; pSizes: ptr VkDeviceSize) {.cdecl, importc.}
  proc vkCmdBeginTransformFeedbackEXT*(commandBuffer: VkCommandBuffer; firstCounterBuffer: uint32; counterBufferCount: uint32; pCounterBuffers: ptr VkBuffer; pCounterBufferOffsets: ptr VkDeviceSize) {.cdecl, importc.}
  proc vkCmdEndTransformFeedbackEXT*(commandBuffer: VkCommandBuffer; firstCounterBuffer: uint32; counterBufferCount: uint32; pCounterBuffers: ptr VkBuffer; pCounterBufferOffsets: ptr VkDeviceSize) {.cdecl, importc.}
  proc vkCmdBeginQueryIndexedEXT*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32; flags: VkQueryControlFlags; index: uint32) {.cdecl, importc.}
  proc vkCmdEndQueryIndexedEXT*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32; index: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndirectByteCountEXT*(commandBuffer: VkCommandBuffer; instanceCount: uint32; firstInstance: uint32; counterBuffer: VkBuffer; counterBufferOffset: VkDeviceSize; counterOffset: uint32; vertexStride: uint32) {.cdecl, importc.}
const
  vkAmdDrawIndirectCount* = 1
  vkAmdDrawIndirectCountSpecVersion* = 1
  vkAmdDrawIndirectCountExtensionName* = "vkAmdDrawIndirectCount"

type
  PFNVkcmddrawindirectcountamd* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcmddrawindexedindirectcountamd* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdDrawIndirectCountAMD*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexedIndirectCountAMD*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
const
  vkAmdNegativeViewportHeight* = 1
  vkAmdNegativeViewportHeightSpecVersion* = 1
  vkAmdNegativeViewportHeightExtensionName* = "vkAmdNegativeViewportHeight"
  vkAmdGpuShaderHalfFloat* = 1
  vkAmdGpuShaderHalfFloatSpecVersion* = 1
  vkAmdGpuShaderHalfFloatExtensionName* = "vkAmdGpuShaderHalfFloat"
  vkAmdShaderBallot* = 1
  vkAmdShaderBallotSpecVersion* = 1
  vkAmdShaderBallotExtensionName* = "vkAmdShaderBallot"
  vkAmdextureGatherBiasLod* = 1
  vkAmdTextureGatherBiasLodSpecVersion* = 1
  vkAmdTextureGatherBiasLodExtensionName* = "vkAmdextureGatherBiasLod"

type
  VkTextureLODGatherFormatPropertiesAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    supportsTextureGatherLODBiasAMD*: VkBool32


const
  vkAmdShaderInfo* = 1
  vkAmdShaderInfoSpecVersion* = 1
  vkAmdShaderInfoExtensionName* = "vkAmdShaderInfo"

type
  VkShaderInfoTypeAMD* = distinct cint
  VkShaderResourceUsageAMD* {.bycopy.} = object
    numUsedVgprs*: uint32
    numUsedSgprs*: uint32
    ldsSizePerLocalWorkGroup*: uint32
    ldsUsageSizeInBytes*: csize
    scratchMemUsageInBytes*: csize

  VkShaderStatisticsInfoAMD* {.bycopy.} = object
    shaderStageMask*: VkShaderStageFlags
    resourceUsage*: VkShaderResourceUsageAMD
    numPhysicalVgprs*: uint32
    numPhysicalSgprs*: uint32
    numAvailableVgprs*: uint32
    numAvailableSgprs*: uint32
    computeWorkGroupSize*: array[3, uint32]

  PFNVkgetshaderinfoamd* = proc (device: VkDevice; pipeline: VkPipeline; shaderStage: VkShaderStageFlagBits; infoType: VkShaderInfoTypeAMD; pInfoSize: ptr csize; pInfo: pointer): VkResult {.cdecl.}

const
  vkShaderInfoTypeStatisticsAmd* = 0.VkShaderInfoTypeAMD
  vkShaderInfoTypeBinaryAmd* = 1.VkShaderInfoTypeAMD
  vkShaderInfoTypeDisassemblyAmd* = 2.VkShaderInfoTypeAMD
  vkShaderInfoTypeBeginRangeAmd: VkShaderInfoTypeAMD = vkShaderInfoTypeStatisticsAmd
  vkShaderInfoTypeEndRangeAmd: VkShaderInfoTypeAMD = vkShaderInfoTypeDisassemblyAmd
  vkShaderInfoTypeRangeSizeAmd: VkShaderInfoTypeAMD = (vkShaderInfoTypeDisassemblyAmd - vkShaderInfoTypeStatisticsAmd + 1)
  vkShaderInfoTypeMaxEnumAmd* = 0x7FFFFFFF.VkShaderInfoTypeAMD

when not defined(vkNoPrototypes):
  proc vkGetShaderInfoAMD*(device: VkDevice; pipeline: VkPipeline; shaderStage: VkShaderStageFlagBits; infoType: VkShaderInfoTypeAMD; pInfoSize: ptr csize; pInfo: pointer): VkResult {.cdecl, importc.}
const
  vkAmdShaderImageLoadStoreLod* = 1
  vkAmdShaderImageLoadStoreLodSpecVersion* = 1
  vkAmdShaderImageLoadStoreLodExtensionName* = "vkAmdShaderImageLoadStoreLod"
  vkNvCornerSampledImage* = 1
  vkNvCornerSampledImageSpecVersion* = 2
  vkNvCornerSampledImageExtensionName* = "vkNvCornerSampledImage"

type
  VkPhysicalDeviceCornerSampledImageFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    cornerSampledImage*: VkBool32


const
  vkImgFormatPvrtc* = 1
  vkImgFormatPvrtcSpecVersion* = 1
  vkImgFormatPvrtcExtensionName* = "vkImgFormatPvrtc"
  vkNvExternalMemoryCapabilities* = 1
  vkNvExternalMemoryCapabilitiesSpecVersion* = 1
  vkNvExternalMemoryCapabilitiesExtensionName* = "vkNvExternalMemoryCapabilities"

type
  VkExternalMemoryHandleTypeFlagBitsNV* = distinct cint
  VkExternalMemoryHandleTypeFlagsNV* = VkFlags
  VkExternalMemoryFeatureFlagBitsNV* = distinct cint
  VkExternalMemoryFeatureFlagsNV* = VkFlags
  VkExternalImageFormatPropertiesNV* {.bycopy.} = object
    imageFormatProperties*: VkImageFormatProperties
    externalMemoryFeatures*: VkExternalMemoryFeatureFlagsNV
    exportFromImportedHandleTypes*: VkExternalMemoryHandleTypeFlagsNV
    compatibleHandleTypes*: VkExternalMemoryHandleTypeFlagsNV

  PFNVkgetphysicaldeviceexternalimageformatpropertiesnv* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; externalHandleType: VkExternalMemoryHandleTypeFlagsNV; pExternalImageFormatProperties: ptr VkExternalImageFormatPropertiesNV): VkResult {.cdecl.}

const
  vkExternalMemoryHandleTypeOpaqueWin32BitNv* = 0x00000001.VkExternalMemoryHandleTypeFlagBitsNV
  vkExternalMemoryHandleTypeOpaqueWin32KmtBitNv* = 0x00000002.VkExternalMemoryHandleTypeFlagBitsNV
  vkExternalMemoryHandleTypeD3D11ImageBitNv* = 0x00000004.VkExternalMemoryHandleTypeFlagBitsNV
  vkExternalMemoryHandleTypeD3D11ImageKmtBitNv* = 0x00000008.VkExternalMemoryHandleTypeFlagBitsNV
  vkExternalMemoryHandleTypeFlagBitsMaxEnumNv* = 0x7FFFFFFF.VkExternalMemoryHandleTypeFlagBitsNV

const
  vkExternalMemoryFeatureDedicatedOnlyBitNv* = 0x00000001.VkExternalMemoryFeatureFlagBitsNV
  vkExternalMemoryFeatureExportableBitNv* = 0x00000002.VkExternalMemoryFeatureFlagBitsNV
  vkExternalMemoryFeatureImportableBitNv* = 0x00000004.VkExternalMemoryFeatureFlagBitsNV
  vkExternalMemoryFeatureFlagBitsMaxEnumNv* = 0x7FFFFFFF.VkExternalMemoryFeatureFlagBitsNV

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceExternalImageFormatPropertiesNV*(physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; externalHandleType: VkExternalMemoryHandleTypeFlagsNV; pExternalImageFormatProperties: ptr VkExternalImageFormatPropertiesNV): VkResult {.cdecl, importc.}
const
  vkNvExternalMemory* = 1
  vkNvExternalMemorySpecVersion* = 1
  vkNvExternalMemoryExtensionName* = "vkNvExternalMemory"

type
  VkExternalMemoryImageCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsNV

  VkExportMemoryAllocateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsNV


const
  vkExtValidationFlags* = 1
  vkExtValidationFlagsSpecVersion* = 1
  vkExtValidationFlagsExtensionName* = "vkExtValidationFlags"

type
  VkValidationCheckEXT* = distinct cint
  VkValidationFlagsEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks*: ptr VkValidationCheckEXT


const
  vkValidationCheckAllExt* = 0.VkValidationCheckEXT
  vkValidationCheckShadersExt* = 1.VkValidationCheckEXT
  vkValidationCheckBeginRangeExt: VkValidationCheckEXT = vkValidationCheckAllExt
  vkValidationCheckEndRangeExt: VkValidationCheckEXT = vkValidationCheckShadersExt
  vkValidationCheckRangeSizeExt: VkValidationCheckEXT = (vkValidationCheckShadersExt - vkValidationCheckAllExt + 1)
  vkValidationCheckMaxEnumExt* = 0x7FFFFFFF.VkValidationCheckEXT

const
  vkExtShaderSubgroupBallot* = 1
  vkExtShaderSubgroupBallotSpecVersion* = 1
  vkExtShaderSubgroupBallotExtensionName* = "vkExtShaderSubgroupBallot"
  vkExtShaderSubgroupVote* = 1
  vkExtShaderSubgroupVoteSpecVersion* = 1
  vkExtShaderSubgroupVoteExtensionName* = "vkExtShaderSubgroupVote"
  vkExtAstcDecodeMode* = 1
  vkExtAstcDecodeModeSpecVersion* = 1
  vkExtAstcDecodeModeExtensionName* = "vkExtAstcDecodeMode"

type
  VkImageViewASTCDecodeModeEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    decodeMode*: VkFormat

  VkPhysicalDeviceASTCDecodeFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    decodeModeSharedExponent*: VkBool32


const
  vkExtConditionalRendering* = 1
  vkExtConditionalRenderingSpecVersion* = 1
  vkExtConditionalRenderingExtensionName* = "vkExtConditionalRendering"

type
  VkConditionalRenderingFlagBitsEXT* = distinct cint
  VkConditionalRenderingFlagsEXT* = VkFlags
  VkConditionalRenderingBeginInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer
    offset*: VkDeviceSize
    flags*: VkConditionalRenderingFlagsEXT

  VkPhysicalDeviceConditionalRenderingFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    conditionalRendering*: VkBool32
    inheritedConditionalRendering*: VkBool32

  VkCommandBufferInheritanceConditionalRenderingInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    conditionalRenderingEnable*: VkBool32

  PFNVkcmdbeginconditionalrenderingext* = proc (commandBuffer: VkCommandBuffer; pConditionalRenderingBegin: ptr VkConditionalRenderingBeginInfoEXT) {.cdecl.}
  PFNVkcmdendconditionalrenderingext* = proc (commandBuffer: VkCommandBuffer) {.cdecl.}

const
  vkConditionalRenderingInvertedBitExt* = 0x00000001.VkConditionalRenderingFlagBitsEXT
  vkConditionalRenderingFlagBitsMaxEnumExt* = 0x7FFFFFFF.VkConditionalRenderingFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkCmdBeginConditionalRenderingEXT*(commandBuffer: VkCommandBuffer; pConditionalRenderingBegin: ptr VkConditionalRenderingBeginInfoEXT) {.cdecl, importc.}
  proc vkCmdEndConditionalRenderingEXT*(commandBuffer: VkCommandBuffer) {.cdecl, importc.}
const
  vkNvxDeviceGeneratedCommands* = 1

type
  VkObjectTableNVX* = VkNonDispatchableHandle
  VkIndirectCommandsLayoutNVX* = VkNonDispatchableHandle

const
  vkNvxDeviceGeneratedCommandsSpecVersion* = 3
  vkNvxDeviceGeneratedCommandsExtensionName* = "vkNvxDeviceGeneratedCommands"

type
  VkIndirectCommandsTokenTypeNVX* = distinct cint
  VkObjectEntryTypeNVX* = distinct cint
  VkIndirectCommandsLayoutUsageFlagBitsNVX* = distinct cint
  VkIndirectCommandsLayoutUsageFlagsNVX* = VkFlags
  VkObjectEntryUsageFlagBitsNVX* = distinct cint
  VkObjectEntryUsageFlagsNVX* = VkFlags
  VkDeviceGeneratedCommandsFeaturesNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    computeBindingPointSupport*: VkBool32

  VkDeviceGeneratedCommandsLimitsNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxIndirectCommandsLayoutTokenCount*: uint32
    maxObjectEntryCounts*: uint32
    minSequenceCountBufferOffsetAlignment*: uint32
    minSequenceIndexBufferOffsetAlignment*: uint32
    minCommandsTokenBufferOffsetAlignment*: uint32

  VkIndirectCommandsTokenNVX* {.bycopy.} = object
    tokenType*: VkIndirectCommandsTokenTypeNVX
    buffer*: VkBuffer
    offset*: VkDeviceSize

  VkIndirectCommandsLayoutTokenNVX* {.bycopy.} = object
    tokenType*: VkIndirectCommandsTokenTypeNVX
    bindingUnit*: uint32
    dynamicCount*: uint32
    divisor*: uint32

  VkIndirectCommandsLayoutCreateInfoNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineBindPoint*: VkPipelineBindPoint
    flags*: VkIndirectCommandsLayoutUsageFlagsNVX
    tokenCount*: uint32
    pTokens*: ptr VkIndirectCommandsLayoutTokenNVX

  VkCmdProcessCommandsInfoNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectTable*: VkObjectTableNVX
    indirectCommandsLayout*: VkIndirectCommandsLayoutNVX
    indirectCommandsTokenCount*: uint32
    pIndirectCommandsTokens*: ptr VkIndirectCommandsTokenNVX
    maxSequencesCount*: uint32
    targetCommandBuffer*: VkCommandBuffer
    sequencesCountBuffer*: VkBuffer
    sequencesCountOffset*: VkDeviceSize
    sequencesIndexBuffer*: VkBuffer
    sequencesIndexOffset*: VkDeviceSize

  VkCmdReserveSpaceForCommandsInfoNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectTable*: VkObjectTableNVX
    indirectCommandsLayout*: VkIndirectCommandsLayoutNVX
    maxSequencesCount*: uint32

  VkObjectTableCreateInfoNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectCount*: uint32
    pObjectEntryTypes*: ptr VkObjectEntryTypeNVX
    pObjectEntryCounts*: ptr uint32
    pObjectEntryUsageFlags*: ptr VkObjectEntryUsageFlagsNVX
    maxUniformBuffersPerDescriptor*: uint32
    maxStorageBuffersPerDescriptor*: uint32
    maxStorageImagesPerDescriptor*: uint32
    maxSampledImagesPerDescriptor*: uint32
    maxPipelineLayouts*: uint32

  VkObjectTableEntryNVX* {.bycopy.} = object
    `type`*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX

  VkObjectTablePipelineEntryNVX* {.bycopy.} = object
    `type`*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    pipeline*: VkPipeline

  VkObjectTableDescriptorSetEntryNVX* {.bycopy.} = object
    `type`*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    pipelineLayout*: VkPipelineLayout
    descriptorSet*: VkDescriptorSet

  VkObjectTableVertexBufferEntryNVX* {.bycopy.} = object
    `type`*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    buffer*: VkBuffer

  VkObjectTableIndexBufferEntryNVX* {.bycopy.} = object
    `type`*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    buffer*: VkBuffer
    indexType*: VkIndexType

  VkObjectTablePushConstantEntryNVX* {.bycopy.} = object
    `type`*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    pipelineLayout*: VkPipelineLayout
    stageFlags*: VkShaderStageFlags

  PFNVkcmdprocesscommandsnvx* = proc (commandBuffer: VkCommandBuffer; pProcessCommandsInfo: ptr VkCmdProcessCommandsInfoNVX) {.cdecl.}
  PFNVkcmdreservespaceforcommandsnvx* = proc (commandBuffer: VkCommandBuffer; pReserveSpaceInfo: ptr VkCmdReserveSpaceForCommandsInfoNVX) {.cdecl.}
  PFNVkcreateindirectcommandslayoutnvx* = proc (device: VkDevice; pCreateInfo: ptr VkIndirectCommandsLayoutCreateInfoNVX; pAllocator: ptr VkAllocationCallbacks; pIndirectCommandsLayout: ptr VkIndirectCommandsLayoutNVX): VkResult {.cdecl.}
  PFNVkdestroyindirectcommandslayoutnvx* = proc (device: VkDevice; indirectCommandsLayout: VkIndirectCommandsLayoutNVX; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkcreateobjecttablenvx* = proc (device: VkDevice; pCreateInfo: ptr VkObjectTableCreateInfoNVX; pAllocator: ptr VkAllocationCallbacks; pObjectTable: ptr VkObjectTableNVX): VkResult {.cdecl.}
  PFNVkdestroyobjecttablenvx* = proc (device: VkDevice; objectTable: VkObjectTableNVX; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkregisterobjectsnvx* = proc (device: VkDevice; objectTable: VkObjectTableNVX; objectCount: uint32; ppObjectTableEntries: ptr ptr VkObjectTableEntryNVX; pObjectIndices: ptr uint32): VkResult {.cdecl.}
  PFNVkunregisterobjectsnvx* = proc (device: VkDevice; objectTable: VkObjectTableNVX; objectCount: uint32; pObjectEntryTypes: ptr VkObjectEntryTypeNVX; pObjectIndices: ptr uint32): VkResult {.cdecl.}
  PFNVkgetphysicaldevicegeneratedcommandspropertiesnvx* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkDeviceGeneratedCommandsFeaturesNVX; pLimits: ptr VkDeviceGeneratedCommandsLimitsNVX) {.cdecl.}

const
  vkIndirectCommandsTokenTypePipelineNvx* = 0.VkIndirectCommandsTokenTypeNVX
  vkIndirectCommandsTokenTypeDescriptorSetNvx* = 1.VkIndirectCommandsTokenTypeNVX
  vkIndirectCommandsTokenTypeIndexBufferNvx* = 2.VkIndirectCommandsTokenTypeNVX
  vkIndirectCommandsTokenTypeVertexBufferNvx* = 3.VkIndirectCommandsTokenTypeNVX
  vkIndirectCommandsTokenTypePushConstantNvx* = 4.VkIndirectCommandsTokenTypeNVX
  vkIndirectCommandsTokenTypeDrawIndexedNvx* = 5.VkIndirectCommandsTokenTypeNVX
  vkIndirectCommandsTokenTypeDrawNvx* = 6.VkIndirectCommandsTokenTypeNVX
  vkIndirectCommandsTokenTypeDispatchNvx* = 7.VkIndirectCommandsTokenTypeNVX
  vkIndirectCommandsTokenTypeBeginRangeNvx: VkIndirectCommandsTokenTypeNVX = vkIndirectCommandsTokenTypePipelineNvx
  vkIndirectCommandsTokenTypeEndRangeNvx: VkIndirectCommandsTokenTypeNVX = vkIndirectCommandsTokenTypeDispatchNvx
  vkIndirectCommandsTokenTypeRangeSizeNvx: VkIndirectCommandsTokenTypeNVX = (vkIndirectCommandsTokenTypeDispatchNvx - vkIndirectCommandsTokenTypePipelineNvx + 1)
  vkIndirectCommandsTokenTypeMaxEnumNvx* = 0x7FFFFFFF.VkIndirectCommandsTokenTypeNVX

const
  vkObjectEntryTypeDescriptorSetNvx* = 0.VkObjectEntryTypeNVX
  vkObjectEntryTypePipelineNvx* = 1.VkObjectEntryTypeNVX
  vkObjectEntryTypeIndexBufferNvx* = 2.VkObjectEntryTypeNVX
  vkObjectEntryTypeVertexBufferNvx* = 3.VkObjectEntryTypeNVX
  vkObjectEntryTypePushConstantNvx* = 4.VkObjectEntryTypeNVX
  vkObjectEntryTypeBeginRangeNvx: VkObjectEntryTypeNVX = vkObjectEntryTypeDescriptorSetNvx
  vkObjectEntryTypeEndRangeNvx: VkObjectEntryTypeNVX = vkObjectEntryTypePushConstantNvx
  vkObjectEntryTypeRangeSizeNvx: VkObjectEntryTypeNVX = (vkObjectEntryTypePushConstantNvx - vkObjectEntryTypeDescriptorSetNvx + 1)
  vkObjectEntryTypeMaxEnumNvx* = 0x7FFFFFFF.VkObjectEntryTypeNVX

const
  vkIndirectCommandsLayoutUsageUnorderedSequencesBitNvx* = 0x00000001.VkIndirectCommandsLayoutUsageFlagBitsNVX
  vkIndirectCommandsLayoutUsageSparseSequencesBitNvx* = 0x00000002.VkIndirectCommandsLayoutUsageFlagBitsNVX
  vkIndirectCommandsLayoutUsageEmptyExecutionsBitNvx* = 0x00000004.VkIndirectCommandsLayoutUsageFlagBitsNVX
  vkIndirectCommandsLayoutUsageIndexedSequencesBitNvx* = 0x00000008.VkIndirectCommandsLayoutUsageFlagBitsNVX
  vkIndirectCommandsLayoutUsageFlagBitsMaxEnumNvx* = 0x7FFFFFFF.VkIndirectCommandsLayoutUsageFlagBitsNVX

const
  vkObjectEntryUsageGraphicsBitNvx* = 0x00000001.VkObjectEntryUsageFlagBitsNVX
  vkObjectEntryUsageComputeBitNvx* = 0x00000002.VkObjectEntryUsageFlagBitsNVX
  vkObjectEntryUsageFlagBitsMaxEnumNvx* = 0x7FFFFFFF.VkObjectEntryUsageFlagBitsNVX

when not defined(vkNoPrototypes):
  proc vkCmdProcessCommandsNVX*(commandBuffer: VkCommandBuffer; pProcessCommandsInfo: ptr VkCmdProcessCommandsInfoNVX) {.cdecl, importc.}
  proc vkCmdReserveSpaceForCommandsNVX*(commandBuffer: VkCommandBuffer; pReserveSpaceInfo: ptr VkCmdReserveSpaceForCommandsInfoNVX) {.cdecl, importc.}
  proc vkCreateIndirectCommandsLayoutNVX*(device: VkDevice; pCreateInfo: ptr VkIndirectCommandsLayoutCreateInfoNVX; pAllocator: ptr VkAllocationCallbacks; pIndirectCommandsLayout: ptr VkIndirectCommandsLayoutNVX): VkResult {.cdecl, importc.}
  proc vkDestroyIndirectCommandsLayoutNVX*(device: VkDevice; indirectCommandsLayout: VkIndirectCommandsLayoutNVX; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateObjectTableNVX*(device: VkDevice; pCreateInfo: ptr VkObjectTableCreateInfoNVX; pAllocator: ptr VkAllocationCallbacks; pObjectTable: ptr VkObjectTableNVX): VkResult {.cdecl, importc.}
  proc vkDestroyObjectTableNVX*(device: VkDevice; objectTable: VkObjectTableNVX; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkRegisterObjectsNVX*(device: VkDevice; objectTable: VkObjectTableNVX; objectCount: uint32; ppObjectTableEntries: ptr ptr VkObjectTableEntryNVX; pObjectIndices: ptr uint32): VkResult {.cdecl, importc.}
  proc vkUnregisterObjectsNVX*(device: VkDevice; objectTable: VkObjectTableNVX; objectCount: uint32; pObjectEntryTypes: ptr VkObjectEntryTypeNVX; pObjectIndices: ptr uint32): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceGeneratedCommandsPropertiesNVX*(physicalDevice: VkPhysicalDevice; pFeatures: ptr VkDeviceGeneratedCommandsFeaturesNVX; pLimits: ptr VkDeviceGeneratedCommandsLimitsNVX) {.cdecl, importc.}
const
  vkNvClipSpaceWScaling* = 1
  vkNvClipSpaceWScalingSpecVersion* = 1
  vkNvClipSpaceWScalingExtensionName* = "vkNvClipSpaceWScaling"

type
  VkViewportWScalingNV* {.bycopy.} = object
    xcoeff*: cfloat
    ycoeff*: cfloat

  VkPipelineViewportWScalingStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    viewportWScalingEnable*: VkBool32
    viewportCount*: uint32
    pViewportWScalings*: ptr VkViewportWScalingNV

  PFNVkcmdsetviewportwscalingnv* = proc (commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewportWScalings: ptr VkViewportWScalingNV) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdSetViewportWScalingNV*(commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewportWScalings: ptr VkViewportWScalingNV) {.cdecl, importc.}
const
  vkExtDirectModeDisplay* = 1
  vkExtDirectModeDisplaySpecVersion* = 1
  vkExtDirectModeDisplayExtensionName* = "vkExtDirectModeDisplay"

type
  PFNVkreleasedisplayext* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkReleaseDisplayEXT*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR): VkResult {.cdecl, importc.}
const
  vkExtDisplaySurfaceCounter* = 1
  vkExtDisplaySurfaceCounterSpecVersion* = 1
  vkExtDisplaySurfaceCounterExtensionName* = "vkExtDisplaySurfaceCounter"

type
  VkSurfaceCounterFlagBitsEXT* = distinct cint
  VkSurfaceCounterFlagsEXT* = VkFlags
  VkSurfaceCapabilities2EXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    minImageCount*: uint32
    maxImageCount*: uint32
    currentExtent*: VkExtent2D
    minImageExtent*: VkExtent2D
    maxImageExtent*: VkExtent2D
    maxImageArrayLayers*: uint32
    supportedTransforms*: VkSurfaceTransformFlagsKHR
    currentTransform*: VkSurfaceTransformFlagBitsKHR
    supportedCompositeAlpha*: VkCompositeAlphaFlagsKHR
    supportedUsageFlags*: VkImageUsageFlags
    supportedSurfaceCounters*: VkSurfaceCounterFlagsEXT

  PFNVkgetphysicaldevicesurfacecapabilities2EXT* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2EXT): VkResult {.cdecl.}

const
  vkSurfaceCounterVblankExt* = 0x00000001.VkSurfaceCounterFlagBitsEXT
  vkSurfaceCounterFlagBitsMaxEnumExt* = 0x7FFFFFFF.VkSurfaceCounterFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceSurfaceCapabilities2EXT*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2EXT): VkResult {.cdecl, importc.}
const
  vkExtDisplayControl* = 1
  vkExtDisplayControlSpecVersion* = 1
  vkExtDisplayControlExtensionName* = "vkExtDisplayControl"

type
  VkDisplayPowerStateEXT* = distinct cint
  VkDeviceEventTypeEXT* = distinct cint
  VkDisplayEventTypeEXT* = distinct cint
  VkDisplayPowerInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    powerState*: VkDisplayPowerStateEXT

  VkDeviceEventInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceEvent*: VkDeviceEventTypeEXT

  VkDisplayEventInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    displayEvent*: VkDisplayEventTypeEXT

  VkSwapchainCounterCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceCounters*: VkSurfaceCounterFlagsEXT

  PFNVkdisplaypowercontrolext* = proc (device: VkDevice; display: VkDisplayKHR; pDisplayPowerInfo: ptr VkDisplayPowerInfoEXT): VkResult {.cdecl.}
  PFNVkregisterdeviceeventext* = proc (device: VkDevice; pDeviceEventInfo: ptr VkDeviceEventInfoEXT; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl.}
  PFNVkregisterdisplayeventext* = proc (device: VkDevice; display: VkDisplayKHR; pDisplayEventInfo: ptr VkDisplayEventInfoEXT; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl.}
  PFNVkgetswapchaincounterext* = proc (device: VkDevice; swapchain: VkSwapchainKHR; counter: VkSurfaceCounterFlagBitsEXT; pCounterValue: ptr uint64): VkResult {.cdecl.}

const
  vkDisplayPowerStateOffExt* = 0.VkDisplayPowerStateEXT
  vkDisplayPowerStateSuspendExt* = 1.VkDisplayPowerStateEXT
  vkDisplayPowerStateOnExt* = 2.VkDisplayPowerStateEXT
  vkDisplayPowerStateBeginRangeExt: VkDisplayPowerStateEXT = vkDisplayPowerStateOffExt
  vkDisplayPowerStateEndRangeExt: VkDisplayPowerStateEXT = vkDisplayPowerStateOnExt
  vkDisplayPowerStateRangeSizeExt: VkDisplayPowerStateEXT = (vkDisplayPowerStateOnExt - vkDisplayPowerStateOffExt + 1)
  vkDisplayPowerStateMaxEnumExt* = 0x7FFFFFFF.VkDisplayPowerStateEXT

const
  vkDeviceEventTypeDisplayHotplugExt* = 0.VkDeviceEventTypeEXT
  vkDeviceEventTypeBeginRangeExt: VkDeviceEventTypeEXT = vkDeviceEventTypeDisplayHotplugExt
  vkDeviceEventTypeEndRangeExt: VkDeviceEventTypeEXT = vkDeviceEventTypeDisplayHotplugExt
  vkDeviceEventTypeRangeSizeExt: VkDeviceEventTypeEXT = (vkDeviceEventTypeDisplayHotplugExt - vkDeviceEventTypeDisplayHotplugExt + 1)
  vkDeviceEventTypeMaxEnumExt* = 0x7FFFFFFF.VkDeviceEventTypeEXT

const
  vkDisplayEventTypeFirstPixelOutExt* = 0.VkDisplayEventTypeEXT
  vkDisplayEventTypeBeginRangeExt: VkDisplayEventTypeEXT = vkDisplayEventTypeFirstPixelOutExt
  vkDisplayEventTypeEndRangeExt: VkDisplayEventTypeEXT = vkDisplayEventTypeFirstPixelOutExt
  vkDisplayEventTypeRangeSizeExt: VkDisplayEventTypeEXT = (vkDisplayEventTypeFirstPixelOutExt - vkDisplayEventTypeFirstPixelOutExt + 1)
  vkDisplayEventTypeMaxEnumExt* = 0x7FFFFFFF.VkDisplayEventTypeEXT

when not defined(vkNoPrototypes):
  proc vkDisplayPowerControlEXT*(device: VkDevice; display: VkDisplayKHR; pDisplayPowerInfo: ptr VkDisplayPowerInfoEXT): VkResult {.cdecl, importc.}
  proc vkRegisterDeviceEventEXT*(device: VkDevice; pDeviceEventInfo: ptr VkDeviceEventInfoEXT; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkRegisterDisplayEventEXT*(device: VkDevice; display: VkDisplayKHR; pDisplayEventInfo: ptr VkDisplayEventInfoEXT; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkGetSwapchainCounterEXT*(device: VkDevice; swapchain: VkSwapchainKHR; counter: VkSurfaceCounterFlagBitsEXT; pCounterValue: ptr uint64): VkResult {.cdecl, importc.}
const
  vkGoogleDisplayiming* = 1
  vkGoogleDisplayTimingSpecVersion* = 1
  vkGoogleDisplayTimingExtensionName* = "vkGoogleDisplayiming"

type
  VkRefreshCycleDurationGOOGLE* {.bycopy.} = object
    refreshDuration*: uint64

  VkPastPresentationTimingGOOGLE* {.bycopy.} = object
    presentID*: uint32
    desiredPresentTime*: uint64
    actualPresentTime*: uint64
    earliestPresentTime*: uint64
    presentMargin*: uint64

  VkPresentTimeGOOGLE* {.bycopy.} = object
    presentID*: uint32
    desiredPresentTime*: uint64

  VkPresentTimesInfoGOOGLE* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pTimes*: ptr VkPresentTimeGOOGLE

  PFNVkgetrefreshcycledurationgoogle* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pDisplayTimingProperties: ptr VkRefreshCycleDurationGOOGLE): VkResult {.cdecl.}
  PFNVkgetpastpresentationtiminggoogle* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pPresentationTimingCount: ptr uint32; pPresentationTimings: ptr VkPastPresentationTimingGOOGLE): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetRefreshCycleDurationGOOGLE*(device: VkDevice; swapchain: VkSwapchainKHR; pDisplayTimingProperties: ptr VkRefreshCycleDurationGOOGLE): VkResult {.cdecl, importc.}
  proc vkGetPastPresentationTimingGOOGLE*(device: VkDevice; swapchain: VkSwapchainKHR; pPresentationTimingCount: ptr uint32; pPresentationTimings: ptr VkPastPresentationTimingGOOGLE): VkResult {.cdecl, importc.}
const
  vkNvSampleMaskOverrideCoverage* = 1
  vkNvSampleMaskOverrideCoverageSpecVersion* = 1
  vkNvSampleMaskOverrideCoverageExtensionName* = "vkNvSampleMaskOverrideCoverage"
  vkNvGeometryShaderPassthrough* = 1
  vkNvGeometryShaderPassthroughSpecVersion* = 1
  vkNvGeometryShaderPassthroughExtensionName* = "vkNvGeometryShaderPassthrough"
  vkNvViewportArray2* = 1
  vkNvViewportArray2SpecVersion* = 1
  vkNvViewportArray2ExtensionName* = "vkNvViewportArray2"
  vkNvxMultiviewPerViewAttributes* = 1
  vkNvxMultiviewPerViewAttributesSpecVersion* = 1
  vkNvxMultiviewPerViewAttributesExtensionName* = "vkNvxMultiviewPerViewAttributes"

type
  VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    perViewPositionAllComponents*: VkBool32


const
  vkNvViewportSwizzle* = 1
  vkNvViewportSwizzleSpecVersion* = 1
  vkNvViewportSwizzleExtensionName* = "vkNvViewportSwizzle"

type
  VkViewportCoordinateSwizzleNV* = distinct cint
  VkPipelineViewportSwizzleStateCreateFlagsNV* = VkFlags
  VkViewportSwizzleNV* {.bycopy.} = object
    x*: VkViewportCoordinateSwizzleNV
    y*: VkViewportCoordinateSwizzleNV
    z*: VkViewportCoordinateSwizzleNV
    w*: VkViewportCoordinateSwizzleNV

  VkPipelineViewportSwizzleStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineViewportSwizzleStateCreateFlagsNV
    viewportCount*: uint32
    pViewportSwizzles*: ptr VkViewportSwizzleNV


const
  vkViewportCoordinateSwizzlePositiveXNv* = 0.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleNegativeXNv* = 1.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzlePositiveYNv* = 2.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleNegativeYNv* = 3.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzlePositiveZNv* = 4.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleNegativeZNv* = 5.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzlePositiveWNv* = 6.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleNegativeWNv* = 7.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleBeginRangeNv: VkViewportCoordinateSwizzleNV = vkViewportCoordinateSwizzlePositiveXNv
  vkViewportCoordinateSwizzleEndRangeNv: VkViewportCoordinateSwizzleNV = vkViewportCoordinateSwizzleNegativeWNv
  vkViewportCoordinateSwizzleRangeSizeNv: VkViewportCoordinateSwizzleNV = (vkViewportCoordinateSwizzleNegativeWNv - vkViewportCoordinateSwizzlePositiveXNv + 1)
  vkViewportCoordinateSwizzleMaxEnumNv* = 0x7FFFFFFF.VkViewportCoordinateSwizzleNV

const
  vkExtDiscardRectangles* = 1
  vkExtDiscardRectanglesSpecVersion* = 1
  vkExtDiscardRectanglesExtensionName* = "vkExtDiscardRectangles"

type
  VkDiscardRectangleModeEXT* = distinct cint
  VkPipelineDiscardRectangleStateCreateFlagsEXT* = VkFlags
  VkPhysicalDeviceDiscardRectanglePropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxDiscardRectangles*: uint32

  VkPipelineDiscardRectangleStateCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineDiscardRectangleStateCreateFlagsEXT
    discardRectangleMode*: VkDiscardRectangleModeEXT
    discardRectangleCount*: uint32
    pDiscardRectangles*: ptr VkRect2D

  PFNVkcmdsetdiscardrectangleext* = proc (commandBuffer: VkCommandBuffer; firstDiscardRectangle: uint32; discardRectangleCount: uint32; pDiscardRectangles: ptr VkRect2D) {.cdecl.}

const
  vkDiscardRectangleModeInclusiveExt* = 0.VkDiscardRectangleModeEXT
  vkDiscardRectangleModeExclusiveExt* = 1.VkDiscardRectangleModeEXT
  vkDiscardRectangleModeBeginRangeExt: VkDiscardRectangleModeEXT = vkDiscardRectangleModeInclusiveExt
  vkDiscardRectangleModeEndRangeExt: VkDiscardRectangleModeEXT = vkDiscardRectangleModeExclusiveExt
  vkDiscardRectangleModeRangeSizeExt: VkDiscardRectangleModeEXT = (vkDiscardRectangleModeExclusiveExt - vkDiscardRectangleModeInclusiveExt + 1)
  vkDiscardRectangleModeMaxEnumExt* = 0x7FFFFFFF.VkDiscardRectangleModeEXT

when not defined(vkNoPrototypes):
  proc vkCmdSetDiscardRectangleEXT*(commandBuffer: VkCommandBuffer; firstDiscardRectangle: uint32; discardRectangleCount: uint32; pDiscardRectangles: ptr VkRect2D) {.cdecl, importc.}
const
  vkExtConservativeRasterization* = 1
  vkExtConservativeRasterizationSpecVersion* = 1
  vkExtConservativeRasterizationExtensionName* = "vkExtConservativeRasterization"

type
  VkConservativeRasterizationModeEXT* = distinct cint
  VkPipelineRasterizationConservativeStateCreateFlagsEXT* = VkFlags
  VkPhysicalDeviceConservativeRasterizationPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    primitiveOverestimationSize*: cfloat
    maxExtraPrimitiveOverestimationSize*: cfloat
    extraPrimitiveOverestimationSizeGranularity*: cfloat
    primitiveUnderestimation*: VkBool32
    conservativePointAndLineRasterization*: VkBool32
    degenerateTrianglesRasterized*: VkBool32
    degenerateLinesRasterized*: VkBool32
    fullyCoveredFragmentShaderInputVariable*: VkBool32
    conservativeRasterizationPostDepthCoverage*: VkBool32

  VkPipelineRasterizationConservativeStateCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationConservativeStateCreateFlagsEXT
    conservativeRasterizationMode*: VkConservativeRasterizationModeEXT
    extraPrimitiveOverestimationSize*: cfloat


const
  vkConservativeRasterizationModeDisabledExt* = 0.VkConservativeRasterizationModeEXT
  vkConservativeRasterizationModeOverestimateExt* = 1.VkConservativeRasterizationModeEXT
  vkConservativeRasterizationModeUnderestimateExt* = 2.VkConservativeRasterizationModeEXT
  vkConservativeRasterizationModeBeginRangeExt: VkConservativeRasterizationModeEXT = vkConservativeRasterizationModeDisabledExt
  vkConservativeRasterizationModeEndRangeExt: VkConservativeRasterizationModeEXT = vkConservativeRasterizationModeUnderestimateExt
  vkConservativeRasterizationModeRangeSizeExt: VkConservativeRasterizationModeEXT = (vkConservativeRasterizationModeUnderestimateExt - vkConservativeRasterizationModeDisabledExt + 1)
  vkConservativeRasterizationModeMaxEnumExt* = 0x7FFFFFFF.VkConservativeRasterizationModeEXT

const
  vkExtSwapchainColorspace* = 1
  vkExtSwapchainColorSpaceSpecVersion* = 3
  vkExtSwapchainColorSpaceExtensionName* = "vkExtSwapchainColorspace"
  vkExtHdrMetadata* = 1
  vkExtHdrMetadataSpecVersion* = 1
  vkExtHdrMetadataExtensionName* = "vkExtHdrMetadata"

type
  VkXYColorEXT* {.bycopy.} = object
    x*: cfloat
    y*: cfloat

  VkHdrMetadataEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    displayPrimaryRed*: VkXYColorEXT
    displayPrimaryGreen*: VkXYColorEXT
    displayPrimaryBlue*: VkXYColorEXT
    whitePoint*: VkXYColorEXT
    maxLuminance*: cfloat
    minLuminance*: cfloat
    maxContentLightLevel*: cfloat
    maxFrameAverageLightLevel*: cfloat

  PFNVksethdrmetadataext* = proc (device: VkDevice; swapchainCount: uint32; pSwapchains: ptr VkSwapchainKHR; pMetadata: ptr VkHdrMetadataEXT) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkSetHdrMetadataEXT*(device: VkDevice; swapchainCount: uint32; pSwapchains: ptr VkSwapchainKHR; pMetadata: ptr VkHdrMetadataEXT) {.cdecl, importc.}
const
  vkExtExternalMemoryDmaBuf* = 1
  vkExtExternalMemoryDmaBufSpecVersion* = 1
  vkExtExternalMemoryDmaBufExtensionName* = "vkExtExternalMemoryDmaBuf"
  vkExtQueueFamilyForeign* = 1
  vkExtQueueFamilyForeignSpecVersion* = 1
  vkExtQueueFamilyForeignExtensionName* = "vkExtQueueFamilyForeign"
  vkQueueFamilyForeignExt* = (not 0 - 2)
  vkExtDebugUtils* = 1

type
  VkDebugUtilsMessengerEXT* = VkNonDispatchableHandle

const
  vkExtDebugUtilsSpecVersion* = 1
  vkExtDebugUtilsExtensionName* = "vkExtDebugUtils"

type
  VkDebugUtilsMessengerCallbackDataFlagsEXT* = VkFlags
  VkDebugUtilsMessengerCreateFlagsEXT* = VkFlags
  VkDebugUtilsMessageSeverityFlagBitsEXT* = distinct cint
  VkDebugUtilsMessageSeverityFlagsEXT* = VkFlags
  VkDebugUtilsMessageTypeFlagBitsEXT* = distinct cint
  VkDebugUtilsMessageTypeFlagsEXT* = VkFlags
  VkDebugUtilsObjectNameInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkObjectType
    objectHandle*: uint64
    pObjectName*: cstring

  VkDebugUtilsObjectTagInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkObjectType
    objectHandle*: uint64
    tagName*: uint64
    tagSize*: csize
    pTag*: pointer

  VkDebugUtilsLabelEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pLabelName*: cstring
    color*: array[4, cfloat]

  VkDebugUtilsMessengerCallbackDataEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDebugUtilsMessengerCallbackDataFlagsEXT
    pMessageIdName*: cstring
    messageIdNumber*: int32
    pMessage*: cstring
    queueLabelCount*: uint32
    pQueueLabels*: ptr VkDebugUtilsLabelEXT
    cmdBufLabelCount*: uint32
    pCmdBufLabels*: ptr VkDebugUtilsLabelEXT
    objectCount*: uint32
    pObjects*: ptr VkDebugUtilsObjectNameInfoEXT

  PFNVkdebugutilsmessengercallbackext* = proc (messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT; messageTypes: VkDebugUtilsMessageTypeFlagsEXT; pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT; pUserData: pointer): VkBool32 {.cdecl.}
  VkDebugUtilsMessengerCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDebugUtilsMessengerCreateFlagsEXT
    messageSeverity*: VkDebugUtilsMessageSeverityFlagsEXT
    messageType*: VkDebugUtilsMessageTypeFlagsEXT
    pfnUserCallback*: PFNVkdebugutilsmessengercallbackext
    pUserData*: pointer

  PFNVksetdebugutilsobjectnameext* = proc (device: VkDevice; pNameInfo: ptr VkDebugUtilsObjectNameInfoEXT): VkResult {.cdecl.}
  PFNVksetdebugutilsobjecttagext* = proc (device: VkDevice; pTagInfo: ptr VkDebugUtilsObjectTagInfoEXT): VkResult {.cdecl.}
  PFNVkqueuebegindebugutilslabelext* = proc (queue: VkQueue; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl.}
  PFNVkqueueenddebugutilslabelext* = proc (queue: VkQueue) {.cdecl.}
  PFNVkqueueinsertdebugutilslabelext* = proc (queue: VkQueue; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl.}
  PFNVkcmdbegindebugutilslabelext* = proc (commandBuffer: VkCommandBuffer; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl.}
  PFNVkcmdenddebugutilslabelext* = proc (commandBuffer: VkCommandBuffer) {.cdecl.}
  PFNVkcmdinsertdebugutilslabelext* = proc (commandBuffer: VkCommandBuffer; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl.}
  PFNVkcreatedebugutilsmessengerext* = proc (instance: VkInstance; pCreateInfo: ptr VkDebugUtilsMessengerCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pMessenger: ptr VkDebugUtilsMessengerEXT): VkResult {.cdecl.}
  PFNVkdestroydebugutilsmessengerext* = proc (instance: VkInstance; messenger: VkDebugUtilsMessengerEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVksubmitdebugutilsmessageext* = proc (instance: VkInstance; messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT; messageTypes: VkDebugUtilsMessageTypeFlagsEXT; pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT) {.cdecl.}

const
  vkDebugUtilsMessageSeverityVerboseBitExt* = 0x00000001.VkDebugUtilsMessageSeverityFlagBitsEXT
  vkDebugUtilsMessageSeverityInfoBitExt* = 0x00000010.VkDebugUtilsMessageSeverityFlagBitsEXT
  vkDebugUtilsMessageSeverityWarningBitExt* = 0x00000100.VkDebugUtilsMessageSeverityFlagBitsEXT
  vkDebugUtilsMessageSeverityErrorBitExt* = 0x00001000.VkDebugUtilsMessageSeverityFlagBitsEXT
  vkDebugUtilsMessageSeverityFlagBitsMaxEnumExt* = 0x7FFFFFFF.VkDebugUtilsMessageSeverityFlagBitsEXT

const
  vkDebugUtilsMessageTypeGeneralBitExt* = 0x00000001.VkDebugUtilsMessageTypeFlagBitsEXT
  vkDebugUtilsMessageTypeValidationBitExt* = 0x00000002.VkDebugUtilsMessageTypeFlagBitsEXT
  vkDebugUtilsMessageTypePerformanceBitExt* = 0x00000004.VkDebugUtilsMessageTypeFlagBitsEXT
  vkDebugUtilsMessageTypeFlagBitsMaxEnumExt* = 0x7FFFFFFF.VkDebugUtilsMessageTypeFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkSetDebugUtilsObjectNameEXT*(device: VkDevice; pNameInfo: ptr VkDebugUtilsObjectNameInfoEXT): VkResult {.cdecl, importc.}
  proc vkSetDebugUtilsObjectTagEXT*(device: VkDevice; pTagInfo: ptr VkDebugUtilsObjectTagInfoEXT): VkResult {.cdecl, importc.}
  proc vkQueueBeginDebugUtilsLabelEXT*(queue: VkQueue; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl, importc.}
  proc vkQueueEndDebugUtilsLabelEXT*(queue: VkQueue) {.cdecl, importc.}
  proc vkQueueInsertDebugUtilsLabelEXT*(queue: VkQueue; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl, importc.}
  proc vkCmdBeginDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl, importc.}
  proc vkCmdEndDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer) {.cdecl, importc.}
  proc vkCmdInsertDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl, importc.}
  proc vkCreateDebugUtilsMessengerEXT*(instance: VkInstance; pCreateInfo: ptr VkDebugUtilsMessengerCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pMessenger: ptr VkDebugUtilsMessengerEXT): VkResult {.cdecl, importc.}
  proc vkDestroyDebugUtilsMessengerEXT*(instance: VkInstance; messenger: VkDebugUtilsMessengerEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkSubmitDebugUtilsMessageEXT*(instance: VkInstance; messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT; messageTypes: VkDebugUtilsMessageTypeFlagsEXT; pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT) {.cdecl, importc.}
const
  vkExtSamplerFilterMinmax* = 1
  vkExtSamplerFilterMinmaxSpecVersion* = 1
  vkExtSamplerFilterMinmaxExtensionName* = "vkExtSamplerFilterMinmax"

type
  VkSamplerReductionModeEXT* = distinct cint
  VkSamplerReductionModeCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    reductionMode*: VkSamplerReductionModeEXT

  VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    filterMinmaxSingleComponentFormats*: VkBool32
    filterMinmaxImageComponentMapping*: VkBool32


const
  vkSamplerReductionModeWeightedAverageExt* = 0.VkSamplerReductionModeEXT
  vkSamplerReductionModeMinExt* = 1.VkSamplerReductionModeEXT
  vkSamplerReductionModeMaxExt* = 2.VkSamplerReductionModeEXT
  vkSamplerReductionModeBeginRangeExt: VkSamplerReductionModeEXT = vkSamplerReductionModeWeightedAverageExt
  vkSamplerReductionModeEndRangeExt: VkSamplerReductionModeEXT = vkSamplerReductionModeMaxExt
  vkSamplerReductionModeRangeSizeExt: VkSamplerReductionModeEXT = (vkSamplerReductionModeMaxExt - vkSamplerReductionModeWeightedAverageExt + 1)
  vkSamplerReductionModeMaxEnumExt* = 0x7FFFFFFF.VkSamplerReductionModeEXT

const
  vkAmdGpuShaderInt16* = 1
  vkAmdGpuShaderInt16SpecVersion* = 1
  vkAmdGpuShaderInt16ExtensionName* = "vkAmdGpuShaderInt16"
  vkAmdMixedAttachmentSamples* = 1
  vkAmdMixedAttachmentSamplesSpecVersion* = 1
  vkAmdMixedAttachmentSamplesExtensionName* = "vkAmdMixedAttachmentSamples"
  vkAmdShaderFragmentMask* = 1
  vkAmdShaderFragmentMaskSpecVersion* = 1
  vkAmdShaderFragmentMaskExtensionName* = "vkAmdShaderFragmentMask"
  vkExtInlineUniformBlock* = 1
  vkExtInlineUniformBlockSpecVersion* = 1
  vkExtInlineUniformBlockExtensionName* = "vkExtInlineUniformBlock"

type
  VkPhysicalDeviceInlineUniformBlockFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    inlineUniformBlock*: VkBool32
    descriptorBindingInlineUniformBlockUpdateAfterBind*: VkBool32

  VkPhysicalDeviceInlineUniformBlockPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxInlineUniformBlockSize*: uint32
    maxPerStageDescriptorInlineUniformBlocks*: uint32
    maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks*: uint32
    maxDescriptorSetInlineUniformBlocks*: uint32
    maxDescriptorSetUpdateAfterBindInlineUniformBlocks*: uint32

  VkWriteDescriptorSetInlineUniformBlockEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    dataSize*: uint32
    pData*: pointer

  VkDescriptorPoolInlineUniformBlockCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxInlineUniformBlockBindings*: uint32


const
  vkExtShaderStencilExport* = 1
  vkExtShaderStencilExportSpecVersion* = 1
  vkExtShaderStencilExportExtensionName* = "vkExtShaderStencilExport"
  vkExtSampleLocations* = 1
  vkExtSampleLocationsSpecVersion* = 1
  vkExtSampleLocationsExtensionName* = "vkExtSampleLocations"

type
  VkSampleLocationEXT* {.bycopy.} = object
    x*: cfloat
    y*: cfloat

  VkSampleLocationsInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationsPerPixel*: VkSampleCountFlagBits
    sampleLocationGridSize*: VkExtent2D
    sampleLocationsCount*: uint32
    pSampleLocations*: ptr VkSampleLocationEXT

  VkAttachmentSampleLocationsEXT* {.bycopy.} = object
    attachmentIndex*: uint32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkSubpassSampleLocationsEXT* {.bycopy.} = object
    subpassIndex*: uint32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkRenderPassSampleLocationsBeginInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    attachmentInitialSampleLocationsCount*: uint32
    pAttachmentInitialSampleLocations*: ptr VkAttachmentSampleLocationsEXT
    postSubpassSampleLocationsCount*: uint32
    pPostSubpassSampleLocations*: ptr VkSubpassSampleLocationsEXT

  VkPipelineSampleLocationsStateCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationsEnable*: VkBool32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkPhysicalDeviceSampleLocationsPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationSampleCounts*: VkSampleCountFlags
    maxSampleLocationGridSize*: VkExtent2D
    sampleLocationCoordinateRange*: array[2, cfloat]
    sampleLocationSubPixelBits*: uint32
    variableSampleLocations*: VkBool32

  VkMultisamplePropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxSampleLocationGridSize*: VkExtent2D

  PFNVkcmdsetsamplelocationsext* = proc (commandBuffer: VkCommandBuffer; pSampleLocationsInfo: ptr VkSampleLocationsInfoEXT) {.cdecl.}
  PFNVkgetphysicaldevicemultisamplepropertiesext* = proc (physicalDevice: VkPhysicalDevice; samples: VkSampleCountFlagBits; pMultisampleProperties: ptr VkMultisamplePropertiesEXT) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdSetSampleLocationsEXT*(commandBuffer: VkCommandBuffer; pSampleLocationsInfo: ptr VkSampleLocationsInfoEXT) {.cdecl, importc.}
  proc vkGetPhysicalDeviceMultisamplePropertiesEXT*(physicalDevice: VkPhysicalDevice; samples: VkSampleCountFlagBits; pMultisampleProperties: ptr VkMultisamplePropertiesEXT) {.cdecl, importc.}
const
  vkExtBlendOperationAdvanced* = 1
  vkExtBlendOperationAdvancedSpecVersion* = 2
  vkExtBlendOperationAdvancedExtensionName* = "vkExtBlendOperationAdvanced"

type
  VkBlendOverlapEXT* = distinct cint
  VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    advancedBlendCoherentOperations*: VkBool32

  VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    advancedBlendMaxColorAttachments*: uint32
    advancedBlendIndependentBlend*: VkBool32
    advancedBlendNonPremultipliedSrcColor*: VkBool32
    advancedBlendNonPremultipliedDstColor*: VkBool32
    advancedBlendCorrelatedOverlap*: VkBool32
    advancedBlendAllOperations*: VkBool32

  VkPipelineColorBlendAdvancedStateCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcPremultiplied*: VkBool32
    dstPremultiplied*: VkBool32
    blendOverlap*: VkBlendOverlapEXT


const
  vkBlendOverlapUncorrelatedExt* = 0.VkBlendOverlapEXT
  vkBlendOverlapDisjointExt* = 1.VkBlendOverlapEXT
  vkBlendOverlapConjointExt* = 2.VkBlendOverlapEXT
  vkBlendOverlapBeginRangeExt: VkBlendOverlapEXT = vkBlendOverlapUncorrelatedExt
  vkBlendOverlapEndRangeExt: VkBlendOverlapEXT = vkBlendOverlapConjointExt
  vkBlendOverlapRangeSizeExt: VkBlendOverlapEXT = (vkBlendOverlapConjointExt - vkBlendOverlapUncorrelatedExt + 1)
  vkBlendOverlapMaxEnumExt* = 0x7FFFFFFF.VkBlendOverlapEXT

const
  vkNvFragmentCoverageToColor* = 1
  vkNvFragmentCoverageToColorSpecVersion* = 1
  vkNvFragmentCoverageToColorExtensionName* = "vkNvFragmentCoverageToColor"

type
  VkPipelineCoverageToColorStateCreateFlagsNV* = VkFlags
  VkPipelineCoverageToColorStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: VkBool32
    coverageToColorLocation*: uint32


const
  vkNvFramebufferMixedSamples* = 1
  vkNvFramebufferMixedSamplesSpecVersion* = 1
  vkNvFramebufferMixedSamplesExtensionName* = "vkNvFramebufferMixedSamples"

type
  VkCoverageModulationModeNV* = distinct cint
  VkPipelineCoverageModulationStateCreateFlagsNV* = VkFlags
  VkPipelineCoverageModulationStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCoverageModulationStateCreateFlagsNV
    coverageModulationMode*: VkCoverageModulationModeNV
    coverageModulationTableEnable*: VkBool32
    coverageModulationTableCount*: uint32
    pCoverageModulationTable*: ptr cfloat


const
  vkCoverageModulationModeNoneNv* = 0.VkCoverageModulationModeNV
  vkCoverageModulationModeRgbNv* = 1.VkCoverageModulationModeNV
  vkCoverageModulationModeAlphaNv* = 2.VkCoverageModulationModeNV
  vkCoverageModulationModeRgbaNv* = 3.VkCoverageModulationModeNV
  vkCoverageModulationModeBeginRangeNv: VkCoverageModulationModeNV = vkCoverageModulationModeNoneNv
  vkCoverageModulationModeEndRangeNv: VkCoverageModulationModeNV = vkCoverageModulationModeRgbaNv
  vkCoverageModulationModeRangeSizeNv: VkCoverageModulationModeNV = (vkCoverageModulationModeRgbaNv - vkCoverageModulationModeNoneNv + 1)
  vkCoverageModulationModeMaxEnumNv* = 0x7FFFFFFF.VkCoverageModulationModeNV

const
  vkNvFillRectangle* = 1
  vkNvFillRectangleSpecVersion* = 1
  vkNvFillRectangleExtensionName* = "vkNvFillRectangle"
  vkExtPostDepthCoverage* = 1
  vkExtPostDepthCoverageSpecVersion* = 1
  vkExtPostDepthCoverageExtensionName* = "vkExtPostDepthCoverage"
  vkExtImageDrmFormatModifier* = 1
  vkExtImageDrmFormatModifierSpecVersion* = 1
  vkExtImageDrmFormatModifierExtensionName* = "vkExtImageDrmFormatModifier"

type
  VkDrmFormatModifierPropertiesEXT* {.bycopy.} = object
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    drmFormatModifierTilingFeatures*: VkFormatFeatureFlags

  VkDrmFormatModifierPropertiesListEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifierCount*: uint32
    pDrmFormatModifierProperties*: ptr VkDrmFormatModifierPropertiesEXT

  VkPhysicalDeviceImageDrmFormatModifierInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifier*: uint64
    sharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32

  VkImageDrmFormatModifierListCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifierCount*: uint32
    pDrmFormatModifiers*: ptr uint64

  VkImageDrmFormatModifierExplicitCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    pPlaneLayouts*: ptr VkSubresourceLayout

  VkImageDrmFormatModifierPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifier*: uint64

  PFNVkgetimagedrmformatmodifierpropertiesext* = proc (device: VkDevice; image: VkImage; pProperties: ptr VkImageDrmFormatModifierPropertiesEXT): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetImageDrmFormatModifierPropertiesEXT*(device: VkDevice; image: VkImage; pProperties: ptr VkImageDrmFormatModifierPropertiesEXT): VkResult {.cdecl, importc.}
const
  vkExtValidationCache* = 1

type
  VkValidationCacheEXT* = VkNonDispatchableHandle

const
  vkExtValidationCacheSpecVersion* = 1
  vkExtValidationCacheExtensionName* = "vkExtValidationCache"

type
  VkValidationCacheHeaderVersionEXT* = distinct cint
  VkValidationCacheCreateFlagsEXT* = VkFlags
  VkValidationCacheCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkValidationCacheCreateFlagsEXT
    initialDataSize*: csize
    pInitialData*: pointer

  VkShaderModuleValidationCacheCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    validationCache*: VkValidationCacheEXT

  PFNVkcreatevalidationcacheext* = proc (device: VkDevice; pCreateInfo: ptr VkValidationCacheCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pValidationCache: ptr VkValidationCacheEXT): VkResult {.cdecl.}
  PFNVkdestroyvalidationcacheext* = proc (device: VkDevice; validationCache: VkValidationCacheEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkmergevalidationcachesext* = proc (device: VkDevice; dstCache: VkValidationCacheEXT; srcCacheCount: uint32; pSrcCaches: ptr VkValidationCacheEXT): VkResult {.cdecl.}
  PFNVkgetvalidationcachedataext* = proc (device: VkDevice; validationCache: VkValidationCacheEXT; pDataSize: ptr csize; pData: pointer): VkResult {.cdecl.}

const
  vkValidationCacheHeaderVersionOneExt* = 1.VkValidationCacheHeaderVersionEXT
  vkValidationCacheHeaderVersionBeginRangeExt: VkValidationCacheHeaderVersionEXT = vkValidationCacheHeaderVersionOneExt
  vkValidationCacheHeaderVersionEndRangeExt: VkValidationCacheHeaderVersionEXT = vkValidationCacheHeaderVersionOneExt
  vkValidationCacheHeaderVersionRangeSizeExt: VkValidationCacheHeaderVersionEXT = (vkValidationCacheHeaderVersionOneExt - vkValidationCacheHeaderVersionOneExt + 1)
  vkValidationCacheHeaderVersionMaxEnumExt* = 0x7FFFFFFF.VkValidationCacheHeaderVersionEXT

when not defined(vkNoPrototypes):
  proc vkCreateValidationCacheEXT*(device: VkDevice; pCreateInfo: ptr VkValidationCacheCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pValidationCache: ptr VkValidationCacheEXT): VkResult {.cdecl, importc.}
  proc vkDestroyValidationCacheEXT*(device: VkDevice; validationCache: VkValidationCacheEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkMergeValidationCachesEXT*(device: VkDevice; dstCache: VkValidationCacheEXT; srcCacheCount: uint32; pSrcCaches: ptr VkValidationCacheEXT): VkResult {.cdecl, importc.}
  proc vkGetValidationCacheDataEXT*(device: VkDevice; validationCache: VkValidationCacheEXT; pDataSize: ptr csize; pData: pointer): VkResult {.cdecl, importc.}
const
  vkExtDescriptorIndexing* = 1
  vkExtDescriptorIndexingSpecVersion* = 2
  vkExtDescriptorIndexingExtensionName* = "vkExtDescriptorIndexing"

type
  VkDescriptorBindingFlagBitsEXT* = distinct cint
  VkDescriptorBindingFlagsEXT* = VkFlags
  VkDescriptorSetLayoutBindingFlagsCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    bindingCount*: uint32
    pBindingFlags*: ptr VkDescriptorBindingFlagsEXT

  VkPhysicalDeviceDescriptorIndexingFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderInputAttachmentArrayDynamicIndexing*: VkBool32
    shaderUniformTexelBufferArrayDynamicIndexing*: VkBool32
    shaderStorageTexelBufferArrayDynamicIndexing*: VkBool32
    shaderUniformBufferArrayNonUniformIndexing*: VkBool32
    shaderSampledImageArrayNonUniformIndexing*: VkBool32
    shaderStorageBufferArrayNonUniformIndexing*: VkBool32
    shaderStorageImageArrayNonUniformIndexing*: VkBool32
    shaderInputAttachmentArrayNonUniformIndexing*: VkBool32
    shaderUniformTexelBufferArrayNonUniformIndexing*: VkBool32
    shaderStorageTexelBufferArrayNonUniformIndexing*: VkBool32
    descriptorBindingUniformBufferUpdateAfterBind*: VkBool32
    descriptorBindingSampledImageUpdateAfterBind*: VkBool32
    descriptorBindingStorageImageUpdateAfterBind*: VkBool32
    descriptorBindingStorageBufferUpdateAfterBind*: VkBool32
    descriptorBindingUniformTexelBufferUpdateAfterBind*: VkBool32
    descriptorBindingStorageTexelBufferUpdateAfterBind*: VkBool32
    descriptorBindingUpdateUnusedWhilePending*: VkBool32
    descriptorBindingPartiallyBound*: VkBool32
    descriptorBindingVariableDescriptorCount*: VkBool32
    runtimeDescriptorArray*: VkBool32

  VkPhysicalDeviceDescriptorIndexingPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxUpdateAfterBindDescriptorsInAllPools*: uint32
    shaderUniformBufferArrayNonUniformIndexingNative*: VkBool32
    shaderSampledImageArrayNonUniformIndexingNative*: VkBool32
    shaderStorageBufferArrayNonUniformIndexingNative*: VkBool32
    shaderStorageImageArrayNonUniformIndexingNative*: VkBool32
    shaderInputAttachmentArrayNonUniformIndexingNative*: VkBool32
    robustBufferAccessUpdateAfterBind*: VkBool32
    quadDivergentImplicitLod*: VkBool32
    maxPerStageDescriptorUpdateAfterBindSamplers*: uint32
    maxPerStageDescriptorUpdateAfterBindUniformBuffers*: uint32
    maxPerStageDescriptorUpdateAfterBindStorageBuffers*: uint32
    maxPerStageDescriptorUpdateAfterBindSampledImages*: uint32
    maxPerStageDescriptorUpdateAfterBindStorageImages*: uint32
    maxPerStageDescriptorUpdateAfterBindInputAttachments*: uint32
    maxPerStageUpdateAfterBindResources*: uint32
    maxDescriptorSetUpdateAfterBindSamplers*: uint32
    maxDescriptorSetUpdateAfterBindUniformBuffers*: uint32
    maxDescriptorSetUpdateAfterBindUniformBuffersDynamic*: uint32
    maxDescriptorSetUpdateAfterBindStorageBuffers*: uint32
    maxDescriptorSetUpdateAfterBindStorageBuffersDynamic*: uint32
    maxDescriptorSetUpdateAfterBindSampledImages*: uint32
    maxDescriptorSetUpdateAfterBindStorageImages*: uint32
    maxDescriptorSetUpdateAfterBindInputAttachments*: uint32

  VkDescriptorSetVariableDescriptorCountAllocateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    descriptorSetCount*: uint32
    pDescriptorCounts*: ptr uint32

  VkDescriptorSetVariableDescriptorCountLayoutSupportEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxVariableDescriptorCount*: uint32


const
  vkDescriptorBindingUpdateAfterBindBitExt* = 0x00000001.VkDescriptorBindingFlagBitsEXT
  vkDescriptorBindingUpdateUnusedWhilePendingBitExt* = 0x00000002.VkDescriptorBindingFlagBitsEXT
  vkDescriptorBindingPartiallyBoundBitExt* = 0x00000004.VkDescriptorBindingFlagBitsEXT
  vkDescriptorBindingVariableDescriptorCountBitExt* = 0x00000008.VkDescriptorBindingFlagBitsEXT
  vkDescriptorBindingFlagBitsMaxEnumExt* = 0x7FFFFFFF.VkDescriptorBindingFlagBitsEXT

const
  vkExtShaderViewportIndexLayer* = 1
  vkExtShaderViewportIndexLayerSpecVersion* = 1
  vkExtShaderViewportIndexLayerExtensionName* = "vkExtShaderViewportIndexLayer"
  vkNvShadingRateImage* = 1
  vkNvShadingRateImageSpecVersion* = 3
  vkNvShadingRateImageExtensionName* = "vkNvShadingRateImage"

type
  VkShadingRatePaletteEntryNV* = distinct cint
  VkCoarseSampleOrderTypeNV* = distinct cint
  VkShadingRatePaletteNV* {.bycopy.} = object
    shadingRatePaletteEntryCount*: uint32
    pShadingRatePaletteEntries*: ptr VkShadingRatePaletteEntryNV

  VkPipelineViewportShadingRateImageStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shadingRateImageEnable*: VkBool32
    viewportCount*: uint32
    pShadingRatePalettes*: ptr VkShadingRatePaletteNV

  VkPhysicalDeviceShadingRateImageFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shadingRateImage*: VkBool32
    shadingRateCoarseSampleOrder*: VkBool32

  VkPhysicalDeviceShadingRateImagePropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shadingRateTexelSize*: VkExtent2D
    shadingRatePaletteSize*: uint32
    shadingRateMaxCoarseSamples*: uint32

  VkCoarseSampleLocationNV* {.bycopy.} = object
    pixelX*: uint32
    pixelY*: uint32
    sample*: uint32

  VkCoarseSampleOrderCustomNV* {.bycopy.} = object
    shadingRate*: VkShadingRatePaletteEntryNV
    sampleCount*: uint32
    sampleLocationCount*: uint32
    pSampleLocations*: ptr VkCoarseSampleLocationNV

  VkPipelineViewportCoarseSampleOrderStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    sampleOrderType*: VkCoarseSampleOrderTypeNV
    customSampleOrderCount*: uint32
    pCustomSampleOrders*: ptr VkCoarseSampleOrderCustomNV

  PFNVkcmdbindshadingrateimagenv* = proc (commandBuffer: VkCommandBuffer; imageView: VkImageView; imageLayout: VkImageLayout) {.cdecl.}
  PFNVkcmdsetviewportshadingratepalettenv* = proc (commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pShadingRatePalettes: ptr VkShadingRatePaletteNV) {.cdecl.}
  PFNVkcmdsetcoarsesampleordernv* = proc (commandBuffer: VkCommandBuffer; sampleOrderType: VkCoarseSampleOrderTypeNV; customSampleOrderCount: uint32; pCustomSampleOrders: ptr VkCoarseSampleOrderCustomNV) {.cdecl.}

const
  vkShadingRatePaletteEntryNoInvocationsNv* = 0.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_16InvocationsPerPixelNv* = 1.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_8InvocationsPerPixelNv* = 2.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_4InvocationsPerPixelNv* = 3.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_2InvocationsPerPixelNv* = 4.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_1InvocationPerPixelNv* = 5.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_1InvocationPer_2X1PixelsNv* = 6.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_1InvocationPer_1X2PixelsNv* = 7.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_1InvocationPer_2X2PixelsNv* = 8.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_1InvocationPer_4X2PixelsNv* = 9.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_1InvocationPer_2X4PixelsNv* = 10.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry_1InvocationPer_4X4PixelsNv* = 11.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntryBeginRangeNv: VkShadingRatePaletteEntryNV = vkShadingRatePaletteEntryNoInvocationsNv
  vkShadingRatePaletteEntryEndRangeNv: VkShadingRatePaletteEntryNV = vkShadingRatePaletteEntry_1InvocationPer_4X4PixelsNv
  vkShadingRatePaletteEntryRangeSizeNv: VkShadingRatePaletteEntryNV = (vkShadingRatePaletteEntry_1InvocationPer_4X4PixelsNv - vkShadingRatePaletteEntryNoInvocationsNv + 1)
  vkShadingRatePaletteEntryMaxEnumNv* = 0x7FFFFFFF.VkShadingRatePaletteEntryNV

const
  vkCoarseSampleOrderTypeDefaultNv* = 0.VkCoarseSampleOrderTypeNV
  vkCoarseSampleOrderTypeCustomNv* = 1.VkCoarseSampleOrderTypeNV
  vkCoarseSampleOrderTypePixelMajorNv* = 2.VkCoarseSampleOrderTypeNV
  vkCoarseSampleOrderTypeSampleMajorNv* = 3.VkCoarseSampleOrderTypeNV
  vkCoarseSampleOrderTypeBeginRangeNv: VkCoarseSampleOrderTypeNV = vkCoarseSampleOrderTypeDefaultNv
  vkCoarseSampleOrderTypeEndRangeNv: VkCoarseSampleOrderTypeNV = vkCoarseSampleOrderTypeSampleMajorNv
  vkCoarseSampleOrderTypeRangeSizeNv: VkCoarseSampleOrderTypeNV = (vkCoarseSampleOrderTypeSampleMajorNv - vkCoarseSampleOrderTypeDefaultNv + 1)
  vkCoarseSampleOrderTypeMaxEnumNv* = 0x7FFFFFFF.VkCoarseSampleOrderTypeNV

when not defined(vkNoPrototypes):
  proc vkCmdBindShadingRateImageNV*(commandBuffer: VkCommandBuffer; imageView: VkImageView; imageLayout: VkImageLayout) {.cdecl, importc.}
  proc vkCmdSetViewportShadingRatePaletteNV*(commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pShadingRatePalettes: ptr VkShadingRatePaletteNV) {.cdecl, importc.}
  proc vkCmdSetCoarseSampleOrderNV*(commandBuffer: VkCommandBuffer; sampleOrderType: VkCoarseSampleOrderTypeNV; customSampleOrderCount: uint32; pCustomSampleOrders: ptr VkCoarseSampleOrderCustomNV) {.cdecl, importc.}
const
  vkNvRayracing* = 1

type
  VkAccelerationStructureNV* = VkNonDispatchableHandle

const
  vkNvRayTracingSpecVersion* = 2
  vkNvRayTracingExtensionName* = "vkNvRayracing"
  vkShaderUnusedNv* = (not 0)

type
  VkRayTracingShaderGroupTypeNV* = distinct cint
  VkGeometryTypeNV* = distinct cint
  VkAccelerationStructureTypeNV* = distinct cint
  VkCopyAccelerationStructureModeNV* = distinct cint
  VkAccelerationStructureMemoryRequirementsTypeNV* = distinct cint
  VkGeometryFlagBitsNV* = distinct cint
  VkGeometryFlagsNV* = VkFlags
  VkGeometryInstanceFlagBitsNV* = distinct cint
  VkGeometryInstanceFlagsNV* = VkFlags
  VkBuildAccelerationStructureFlagBitsNV* = distinct cint
  VkBuildAccelerationStructureFlagsNV* = VkFlags
  VkRayTracingShaderGroupCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkRayTracingShaderGroupTypeNV
    generalShader*: uint32
    closestHitShader*: uint32
    anyHitShader*: uint32
    intersectionShader*: uint32

  VkRayTracingPipelineCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stageCount*: uint32
    pStages*: ptr VkPipelineShaderStageCreateInfo
    groupCount*: uint32
    pGroups*: ptr VkRayTracingShaderGroupCreateInfoNV
    maxRecursionDepth*: uint32
    layout*: VkPipelineLayout
    basePipelineHandle*: VkPipeline
    basePipelineIndex*: int32

  VkGeometryTrianglesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    vertexData*: VkBuffer
    vertexOffset*: VkDeviceSize
    vertexCount*: uint32
    vertexStride*: VkDeviceSize
    vertexFormat*: VkFormat
    indexData*: VkBuffer
    indexOffset*: VkDeviceSize
    indexCount*: uint32
    indexType*: VkIndexType
    transformData*: VkBuffer
    transformOffset*: VkDeviceSize

  VkGeometryAABBNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    aabbData*: VkBuffer
    numAABBs*: uint32
    stride*: uint32
    offset*: VkDeviceSize

  VkGeometryDataNV* {.bycopy.} = object
    triangles*: VkGeometryTrianglesNV
    aabbs*: VkGeometryAABBNV

  VkGeometryNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    geometryType*: VkGeometryTypeNV
    geometry*: VkGeometryDataNV
    flags*: VkGeometryFlagsNV

  VkAccelerationStructureInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkAccelerationStructureTypeNV
    flags*: VkBuildAccelerationStructureFlagsNV
    instanceCount*: uint32
    geometryCount*: uint32
    pGeometries*: ptr VkGeometryNV

  VkAccelerationStructureCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    compactedSize*: VkDeviceSize
    info*: VkAccelerationStructureInfoNV

  VkBindAccelerationStructureMemoryInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructure*: VkAccelerationStructureNV
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32

  VkWriteDescriptorSetAccelerationStructureNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructureCount*: uint32
    pAccelerationStructures*: ptr VkAccelerationStructureNV

  VkAccelerationStructureMemoryRequirementsInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkAccelerationStructureMemoryRequirementsTypeNV
    accelerationStructure*: VkAccelerationStructureNV

  VkPhysicalDeviceRayTracingPropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderGroupHandleSize*: uint32
    maxRecursionDepth*: uint32
    maxShaderGroupStride*: uint32
    shaderGroupBaseAlignment*: uint32
    maxGeometryCount*: uint64
    maxInstanceCount*: uint64
    maxTriangleCount*: uint64
    maxDescriptorSetAccelerationStructures*: uint32

  PFNVkcreateaccelerationstructurenv* = proc (device: VkDevice; pCreateInfo: ptr VkAccelerationStructureCreateInfoNV; pAllocator: ptr VkAllocationCallbacks; pAccelerationStructure: ptr VkAccelerationStructureNV): VkResult {.cdecl.}
  PFNVkdestroyaccelerationstructurenv* = proc (device: VkDevice; accelerationStructure: VkAccelerationStructureNV; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFNVkgetaccelerationstructurememoryrequirementsnv* = proc (device: VkDevice; pInfo: ptr VkAccelerationStructureMemoryRequirementsInfoNV; pMemoryRequirements: ptr VkMemoryRequirements2KHR) {.cdecl.}
  PFNVkbindaccelerationstructurememorynv* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindAccelerationStructureMemoryInfoNV): VkResult {.cdecl.}
  PFNVkcmdbuildaccelerationstructurenv* = proc (commandBuffer: VkCommandBuffer; pInfo: ptr VkAccelerationStructureInfoNV; instanceData: VkBuffer; instanceOffset: VkDeviceSize; update: VkBool32; dst: VkAccelerationStructureNV; src: VkAccelerationStructureNV; scratch: VkBuffer; scratchOffset: VkDeviceSize) {.cdecl.}
  PFNVkcmdcopyaccelerationstructurenv* = proc (commandBuffer: VkCommandBuffer; dst: VkAccelerationStructureNV; src: VkAccelerationStructureNV; mode: VkCopyAccelerationStructureModeNV) {.cdecl.}
  PFNVkcmdtraceraysnv* = proc (commandBuffer: VkCommandBuffer; raygenShaderBindingTableBuffer: VkBuffer; raygenShaderBindingOffset: VkDeviceSize; missShaderBindingTableBuffer: VkBuffer; missShaderBindingOffset: VkDeviceSize; missShaderBindingStride: VkDeviceSize; hitShaderBindingTableBuffer: VkBuffer; hitShaderBindingOffset: VkDeviceSize; hitShaderBindingStride: VkDeviceSize; callableShaderBindingTableBuffer: VkBuffer; callableShaderBindingOffset: VkDeviceSize; callableShaderBindingStride: VkDeviceSize; width: uint32; height: uint32; depth: uint32) {.cdecl.}
  PFNVkcreateraytracingpipelinesnv* = proc (device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkRayTracingPipelineCreateInfoNV; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFNVkgetraytracingshadergrouphandlesnv* = proc (device: VkDevice; pipeline: VkPipeline; firstGroup: uint32; groupCount: uint32; dataSize: csize; pData: pointer): VkResult {.cdecl.}
  PFNVkgetaccelerationstructurehandlenv* = proc (device: VkDevice; accelerationStructure: VkAccelerationStructureNV; dataSize: csize; pData: pointer): VkResult {.cdecl.}
  PFNVkcmdwriteaccelerationstructurespropertiesnv* = proc (commandBuffer: VkCommandBuffer; accelerationStructureCount: uint32; pAccelerationStructures: ptr VkAccelerationStructureNV; queryType: VkQueryType; queryPool: VkQueryPool; firstQuery: uint32) {.cdecl.}
  PFNVkcompiledeferrednv* = proc (device: VkDevice; pipeline: VkPipeline; shader: uint32): VkResult {.cdecl.}

const
  vkRayTracingShaderGroupTypeGeneralNv* = 0.VkRayTracingShaderGroupTypeNV
  vkRayTracingShaderGroupTypeTrianglesHitGroupNv* = 1.VkRayTracingShaderGroupTypeNV
  vkRayTracingShaderGroupTypeProceduralHitGroupNv* = 2.VkRayTracingShaderGroupTypeNV
  vkRayTracingShaderGroupTypeBeginRangeNv: VkRayTracingShaderGroupTypeNV = vkRayTracingShaderGroupTypeGeneralNv
  vkRayTracingShaderGroupTypeEndRangeNv: VkRayTracingShaderGroupTypeNV = vkRayTracingShaderGroupTypeProceduralHitGroupNv
  vkRayTracingShaderGroupTypeRangeSizeNv: VkRayTracingShaderGroupTypeNV = (vkRayTracingShaderGroupTypeProceduralHitGroupNv - vkRayTracingShaderGroupTypeGeneralNv + 1)
  vkRayTracingShaderGroupTypeMaxEnumNv* = 0x7FFFFFFF.VkRayTracingShaderGroupTypeNV

const
  vkGeometryTypeTrianglesNv* = 0.VkGeometryTypeNV
  vkGeometryTypeAabbsNv* = 1.VkGeometryTypeNV
  vkGeometryTypeBeginRangeNv: VkGeometryTypeNV = vkGeometryTypeTrianglesNv
  vkGeometryTypeEndRangeNv: VkGeometryTypeNV = vkGeometryTypeAabbsNv
  vkGeometryTypeRangeSizeNv: VkGeometryTypeNV = (vkGeometryTypeAabbsNv - vkGeometryTypeTrianglesNv + 1)
  vkGeometryTypeMaxEnumNv* = 0x7FFFFFFF.VkGeometryTypeNV

const
  vkAccelerationStructureTypeTopLevelNv* = 0.VkAccelerationStructureTypeNV
  vkAccelerationStructureTypeBottomLevelNv* = 1.VkAccelerationStructureTypeNV
  vkAccelerationStructureTypeBeginRangeNv: VkAccelerationStructureTypeNV = vkAccelerationStructureTypeTopLevelNv
  vkAccelerationStructureTypeEndRangeNv: VkAccelerationStructureTypeNV = vkAccelerationStructureTypeBottomLevelNv
  vkAccelerationStructureTypeRangeSizeNv: VkAccelerationStructureTypeNV = (vkAccelerationStructureTypeBottomLevelNv - vkAccelerationStructureTypeTopLevelNv + 1)
  vkAccelerationStructureTypeMaxEnumNv* = 0x7FFFFFFF.VkAccelerationStructureTypeNV

const
  vkCopyAccelerationStructureModeCloneNv* = 0.VkCopyAccelerationStructureModeNV
  vkCopyAccelerationStructureModeCompactNv* = 1.VkCopyAccelerationStructureModeNV
  vkCopyAccelerationStructureModeBeginRangeNv: VkCopyAccelerationStructureModeNV = vkCopyAccelerationStructureModeCloneNv
  vkCopyAccelerationStructureModeEndRangeNv: VkCopyAccelerationStructureModeNV = vkCopyAccelerationStructureModeCompactNv
  vkCopyAccelerationStructureModeRangeSizeNv: VkCopyAccelerationStructureModeNV = (vkCopyAccelerationStructureModeCompactNv - vkCopyAccelerationStructureModeCloneNv + 1)
  vkCopyAccelerationStructureModeMaxEnumNv* = 0x7FFFFFFF.VkCopyAccelerationStructureModeNV

const
  vkAccelerationStructureMemoryRequirementsTypeObjectNv* = 0.VkAccelerationStructureMemoryRequirementsTypeNV
  vkAccelerationStructureMemoryRequirementsTypeBuildScratchNv* = 1.VkAccelerationStructureMemoryRequirementsTypeNV
  vkAccelerationStructureMemoryRequirementsTypeUpdateScratchNv* = 2.VkAccelerationStructureMemoryRequirementsTypeNV
  vkAccelerationStructureMemoryRequirementsTypeBeginRangeNv: VkAccelerationStructureMemoryRequirementsTypeNV = vkAccelerationStructureMemoryRequirementsTypeObjectNv
  vkAccelerationStructureMemoryRequirementsTypeEndRangeNv: VkAccelerationStructureMemoryRequirementsTypeNV = vkAccelerationStructureMemoryRequirementsTypeUpdateScratchNv
  vkAccelerationStructureMemoryRequirementsTypeRangeSizeNv: VkAccelerationStructureMemoryRequirementsTypeNV = (vkAccelerationStructureMemoryRequirementsTypeUpdateScratchNv - vkAccelerationStructureMemoryRequirementsTypeObjectNv + 1)
  vkAccelerationStructureMemoryRequirementsTypeMaxEnumNv* = 0x7FFFFFFF.VkAccelerationStructureMemoryRequirementsTypeNV

const
  vkGeometryOpaqueBitNv* = 0x00000001.VkGeometryFlagBitsNV
  vkGeometryNoDuplicateAnyHitInvocationBitNv* = 0x00000002.VkGeometryFlagBitsNV
  vkGeometryFlagBitsMaxEnumNv* = 0x7FFFFFFF.VkGeometryFlagBitsNV

const
  vkGeometryInstanceTriangleCullDisableBitNv* = 0x00000001.VkGeometryInstanceFlagBitsNV
  vkGeometryInstanceTriangleFrontCounterclockwiseBitNv* = 0x00000002.VkGeometryInstanceFlagBitsNV
  vkGeometryInstanceForceOpaqueBitNv* = 0x00000004.VkGeometryInstanceFlagBitsNV
  vkGeometryInstanceForceNoOpaqueBitNv* = 0x00000008.VkGeometryInstanceFlagBitsNV
  vkGeometryInstanceFlagBitsMaxEnumNv* = 0x7FFFFFFF.VkGeometryInstanceFlagBitsNV

const
  vkBuildAccelerationStructureAllowUpdateBitNv* = 0x00000001.VkBuildAccelerationStructureFlagBitsNV
  vkBuildAccelerationStructureAllowCompactionBitNv* = 0x00000002.VkBuildAccelerationStructureFlagBitsNV
  vkBuildAccelerationStructurePreferFastTraceBitNv* = 0x00000004.VkBuildAccelerationStructureFlagBitsNV
  vkBuildAccelerationStructurePreferFastBuildBitNv* = 0x00000008.VkBuildAccelerationStructureFlagBitsNV
  vkBuildAccelerationStructureLowMemoryBitNv* = 0x00000010.VkBuildAccelerationStructureFlagBitsNV
  vkBuildAccelerationStructureFlagBitsMaxEnumNv* = 0x7FFFFFFF.VkBuildAccelerationStructureFlagBitsNV

when not defined(vkNoPrototypes):
  proc vkCreateAccelerationStructureNV*(device: VkDevice; pCreateInfo: ptr VkAccelerationStructureCreateInfoNV; pAllocator: ptr VkAllocationCallbacks; pAccelerationStructure: ptr VkAccelerationStructureNV): VkResult {.cdecl, importc.}
  proc vkDestroyAccelerationStructureNV*(device: VkDevice; accelerationStructure: VkAccelerationStructureNV; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetAccelerationStructureMemoryRequirementsNV*(device: VkDevice; pInfo: ptr VkAccelerationStructureMemoryRequirementsInfoNV; pMemoryRequirements: ptr VkMemoryRequirements2KHR) {.cdecl, importc.}
  proc vkBindAccelerationStructureMemoryNV*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindAccelerationStructureMemoryInfoNV): VkResult {.cdecl, importc.}
  proc vkCmdBuildAccelerationStructureNV*(commandBuffer: VkCommandBuffer; pInfo: ptr VkAccelerationStructureInfoNV; instanceData: VkBuffer; instanceOffset: VkDeviceSize; update: VkBool32; dst: VkAccelerationStructureNV; src: VkAccelerationStructureNV; scratch: VkBuffer; scratchOffset: VkDeviceSize) {.cdecl, importc.}
  proc vkCmdCopyAccelerationStructureNV*(commandBuffer: VkCommandBuffer; dst: VkAccelerationStructureNV; src: VkAccelerationStructureNV; mode: VkCopyAccelerationStructureModeNV) {.cdecl, importc.}
  proc vkCmdTraceRaysNV*(commandBuffer: VkCommandBuffer; raygenShaderBindingTableBuffer: VkBuffer; raygenShaderBindingOffset: VkDeviceSize; missShaderBindingTableBuffer: VkBuffer; missShaderBindingOffset: VkDeviceSize; missShaderBindingStride: VkDeviceSize; hitShaderBindingTableBuffer: VkBuffer; hitShaderBindingOffset: VkDeviceSize; hitShaderBindingStride: VkDeviceSize; callableShaderBindingTableBuffer: VkBuffer; callableShaderBindingOffset: VkDeviceSize; callableShaderBindingStride: VkDeviceSize; width: uint32; height: uint32; depth: uint32) {.cdecl, importc.}
  proc vkCreateRayTracingPipelinesNV*(device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkRayTracingPipelineCreateInfoNV; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkGetRayTracingShaderGroupHandlesNV*(device: VkDevice; pipeline: VkPipeline; firstGroup: uint32; groupCount: uint32; dataSize: csize; pData: pointer): VkResult {.cdecl, importc.}
  proc vkGetAccelerationStructureHandleNV*(device: VkDevice; accelerationStructure: VkAccelerationStructureNV; dataSize: csize; pData: pointer): VkResult {.cdecl, importc.}
  proc vkCmdWriteAccelerationStructuresPropertiesNV*(commandBuffer: VkCommandBuffer; accelerationStructureCount: uint32; pAccelerationStructures: ptr VkAccelerationStructureNV; queryType: VkQueryType; queryPool: VkQueryPool; firstQuery: uint32) {.cdecl, importc.}
  proc vkCompileDeferredNV*(device: VkDevice; pipeline: VkPipeline; shader: uint32): VkResult {.cdecl, importc.}
const
  vkNvRepresentativeFragmentest* = 1
  vkNvRepresentativeFragmentTestSpecVersion* = 1
  vkNvRepresentativeFragmentTestExtensionName* = "vkNvRepresentativeFragmentest"

type
  VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    representativeFragmentTest*: VkBool32

  VkPipelineRepresentativeFragmentTestStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    representativeFragmentTestEnable*: VkBool32


const
  vkExtGlobalPriority* = 1
  vkExtGlobalPrioritySpecVersion* = 2
  vkExtGlobalPriorityExtensionName* = "vkExtGlobalPriority"

type
  VkQueueGlobalPriorityEXT* = distinct cint
  VkDeviceQueueGlobalPriorityCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    globalPriority*: VkQueueGlobalPriorityEXT


const
  vkQueueGlobalPriorityLowExt* = 128.VkQueueGlobalPriorityEXT
  vkQueueGlobalPriorityMediumExt* = 256.VkQueueGlobalPriorityEXT
  vkQueueGlobalPriorityHighExt* = 512.VkQueueGlobalPriorityEXT
  vkQueueGlobalPriorityRealtimeExt* = 1024.VkQueueGlobalPriorityEXT
  vkQueueGlobalPriorityBeginRangeExt: VkQueueGlobalPriorityEXT = vkQueueGlobalPriorityLowExt
  vkQueueGlobalPriorityEndRangeExt: VkQueueGlobalPriorityEXT = vkQueueGlobalPriorityRealtimeExt
  vkQueueGlobalPriorityRangeSizeExt: VkQueueGlobalPriorityEXT = (vkQueueGlobalPriorityRealtimeExt - vkQueueGlobalPriorityLowExt + 1)
  vkQueueGlobalPriorityMaxEnumExt* = 0x7FFFFFFF.VkQueueGlobalPriorityEXT

const
  vkExtExternalMemoryHost* = 1
  vkExtExternalMemoryHostSpecVersion* = 1
  vkExtExternalMemoryHostExtensionName* = "vkExtExternalMemoryHost"

type
  VkImportMemoryHostPointerInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBits
    pHostPointer*: pointer

  VkMemoryHostPointerPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memoryTypeBits*: uint32

  VkPhysicalDeviceExternalMemoryHostPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    minImportedHostPointerAlignment*: VkDeviceSize

  PFNVkgetmemoryhostpointerpropertiesext* = proc (device: VkDevice; handleType: VkExternalMemoryHandleTypeFlagBits; pHostPointer: pointer; pMemoryHostPointerProperties: ptr VkMemoryHostPointerPropertiesEXT): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetMemoryHostPointerPropertiesEXT*(device: VkDevice; handleType: VkExternalMemoryHandleTypeFlagBits; pHostPointer: pointer; pMemoryHostPointerProperties: ptr VkMemoryHostPointerPropertiesEXT): VkResult {.cdecl, importc.}
const
  vkAmdBufferMarker* = 1
  vkAmdBufferMarkerSpecVersion* = 1
  vkAmdBufferMarkerExtensionName* = "vkAmdBufferMarker"

type
  PFNVkcmdwritebuffermarkeramd* = proc (commandBuffer: VkCommandBuffer; pipelineStage: VkPipelineStageFlagBits; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; marker: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdWriteBufferMarkerAMD*(commandBuffer: VkCommandBuffer; pipelineStage: VkPipelineStageFlagBits; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; marker: uint32) {.cdecl, importc.}
const
  vkExtCalibratedimestamps* = 1
  vkExtCalibratedTimestampsSpecVersion* = 1
  vkExtCalibratedTimestampsExtensionName* = "vkExtCalibratedimestamps"

type
  VkTimeDomainEXT* = distinct cint
  VkCalibratedTimestampInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    timeDomain*: VkTimeDomainEXT

  PFNVkgetphysicaldevicecalibrateabletimedomainsext* = proc (physicalDevice: VkPhysicalDevice; pTimeDomainCount: ptr uint32; pTimeDomains: ptr VkTimeDomainEXT): VkResult {.cdecl.}
  PFNVkgetcalibratedtimestampsext* = proc (device: VkDevice; timestampCount: uint32; pTimestampInfos: ptr VkCalibratedTimestampInfoEXT; pTimestamps: ptr uint64; pMaxDeviation: ptr uint64): VkResult {.cdecl.}

const
  vkTimeDomainDeviceExt* = 0.VkTimeDomainEXT
  vkTimeDomainClockMonotonicExt* = 1.VkTimeDomainEXT
  vkTimeDomainClockMonotonicRawExt* = 2.VkTimeDomainEXT
  vkTimeDomainQueryPerformanceCounterExt* = 3.VkTimeDomainEXT
  vkTimeDomainBeginRangeExt: VkTimeDomainEXT = vkTimeDomainDeviceExt
  vkTimeDomainEndRangeExt: VkTimeDomainEXT = vkTimeDomainQueryPerformanceCounterExt
  vkTimeDomainRangeSizeExt: VkTimeDomainEXT = (vkTimeDomainQueryPerformanceCounterExt - vkTimeDomainDeviceExt + 1)
  vkTimeDomainMaxEnumExt* = 0x7FFFFFFF.VkTimeDomainEXT

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceCalibrateableTimeDomainsEXT*(physicalDevice: VkPhysicalDevice; pTimeDomainCount: ptr uint32; pTimeDomains: ptr VkTimeDomainEXT): VkResult {.cdecl, importc.}
  proc vkGetCalibratedTimestampsEXT*(device: VkDevice; timestampCount: uint32; pTimestampInfos: ptr VkCalibratedTimestampInfoEXT; pTimestamps: ptr uint64; pMaxDeviation: ptr uint64): VkResult {.cdecl, importc.}
const
  vkAmdShaderCoreProperties* = 1
  vkAmdShaderCorePropertiesSpecVersion* = 1
  vkAmdShaderCorePropertiesExtensionName* = "vkAmdShaderCoreProperties"

type
  VkPhysicalDeviceShaderCorePropertiesAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderEngineCount*: uint32
    shaderArraysPerEngineCount*: uint32
    computeUnitsPerShaderArray*: uint32
    simdPerComputeUnit*: uint32
    wavefrontsPerSimd*: uint32
    wavefrontSize*: uint32
    sgprsPerSimd*: uint32
    minSgprAllocation*: uint32
    maxSgprAllocation*: uint32
    sgprAllocationGranularity*: uint32
    vgprsPerSimd*: uint32
    minVgprAllocation*: uint32
    maxVgprAllocation*: uint32
    vgprAllocationGranularity*: uint32


const
  vkAmdMemoryOverallocationBehavior* = 1
  vkAmdMemoryOverallocationBehaviorSpecVersion* = 1
  vkAmdMemoryOverallocationBehaviorExtensionName* = "vkAmdMemoryOverallocationBehavior"

type
  VkMemoryOverallocationBehaviorAMD* = distinct cint
  VkDeviceMemoryOverallocationCreateInfoAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    overallocationBehavior*: VkMemoryOverallocationBehaviorAMD


const
  vkMemoryOverallocationBehaviorDefaultAmd* = 0.VkMemoryOverallocationBehaviorAMD
  vkMemoryOverallocationBehaviorAllowedAmd* = 1.VkMemoryOverallocationBehaviorAMD
  vkMemoryOverallocationBehaviorDisallowedAmd* = 2.VkMemoryOverallocationBehaviorAMD
  vkMemoryOverallocationBehaviorBeginRangeAmd: VkMemoryOverallocationBehaviorAMD = vkMemoryOverallocationBehaviorDefaultAmd
  vkMemoryOverallocationBehaviorEndRangeAmd: VkMemoryOverallocationBehaviorAMD = vkMemoryOverallocationBehaviorDisallowedAmd
  vkMemoryOverallocationBehaviorRangeSizeAmd: VkMemoryOverallocationBehaviorAMD = (vkMemoryOverallocationBehaviorDisallowedAmd - vkMemoryOverallocationBehaviorDefaultAmd + 1)
  vkMemoryOverallocationBehaviorMaxEnumAmd* = 0x7FFFFFFF.VkMemoryOverallocationBehaviorAMD

const
  vkExtVertexAttributeDivisor* = 1
  vkExtVertexAttributeDivisorSpecVersion* = 3
  vkExtVertexAttributeDivisorExtensionName* = "vkExtVertexAttributeDivisor"

type
  VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxVertexAttribDivisor*: uint32

  VkVertexInputBindingDivisorDescriptionEXT* {.bycopy.} = object
    binding*: uint32
    divisor*: uint32

  VkPipelineVertexInputDivisorStateCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    vertexBindingDivisorCount*: uint32
    pVertexBindingDivisors*: ptr VkVertexInputBindingDivisorDescriptionEXT

  VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    vertexAttributeInstanceRateDivisor*: VkBool32
    vertexAttributeInstanceRateZeroDivisor*: VkBool32


const
  vkNvShaderSubgroupPartitioned* = 1
  vkNvShaderSubgroupPartitionedSpecVersion* = 1
  vkNvShaderSubgroupPartitionedExtensionName* = "vkNvShaderSubgroupPartitioned"
  vkNvComputeShaderDerivatives* = 1
  vkNvComputeShaderDerivativesSpecVersion* = 1
  vkNvComputeShaderDerivativesExtensionName* = "vkNvComputeShaderDerivatives"

type
  VkPhysicalDeviceComputeShaderDerivativesFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    computeDerivativeGroupQuads*: VkBool32
    computeDerivativeGroupLinear*: VkBool32


const
  vkNvMeshShader* = 1
  vkNvMeshShaderSpecVersion* = 1
  vkNvMeshShaderExtensionName* = "vkNvMeshShader"

type
  VkPhysicalDeviceMeshShaderFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    taskShader*: VkBool32
    meshShader*: VkBool32

  VkPhysicalDeviceMeshShaderPropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxDrawMeshTasksCount*: uint32
    maxTaskWorkGroupInvocations*: uint32
    maxTaskWorkGroupSize*: array[3, uint32]
    maxTaskTotalMemorySize*: uint32
    maxTaskOutputCount*: uint32
    maxMeshWorkGroupInvocations*: uint32
    maxMeshWorkGroupSize*: array[3, uint32]
    maxMeshTotalMemorySize*: uint32
    maxMeshOutputVertices*: uint32
    maxMeshOutputPrimitives*: uint32
    maxMeshMultiviewViewCount*: uint32
    meshOutputPerVertexGranularity*: uint32
    meshOutputPerPrimitiveGranularity*: uint32

  VkDrawMeshTasksIndirectCommandNV* {.bycopy.} = object
    taskCount*: uint32
    firstTask*: uint32

  PFNVkcmddrawmeshtasksnv* = proc (commandBuffer: VkCommandBuffer; taskCount: uint32; firstTask: uint32) {.cdecl.}
  PFNVkcmddrawmeshtasksindirectnv* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcmddrawmeshtasksindirectcountnv* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdDrawMeshTasksNV*(commandBuffer: VkCommandBuffer; taskCount: uint32; firstTask: uint32) {.cdecl, importc.}
  proc vkCmdDrawMeshTasksIndirectNV*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawMeshTasksIndirectCountNV*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
const
  vkNvFragmentShaderBarycentric* = 1
  vkNvFragmentShaderBarycentricSpecVersion* = 1
  vkNvFragmentShaderBarycentricExtensionName* = "vkNvFragmentShaderBarycentric"

type
  VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentShaderBarycentric*: VkBool32


const
  vkNvShaderImageFootprint* = 1
  vkNvShaderImageFootprintSpecVersion* = 1
  vkNvShaderImageFootprintExtensionName* = "vkNvShaderImageFootprint"

type
  VkPhysicalDeviceShaderImageFootprintFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    imageFootprint*: VkBool32


const
  vkNvScissorExclusive* = 1
  vkNvScissorExclusiveSpecVersion* = 1
  vkNvScissorExclusiveExtensionName* = "vkNvScissorExclusive"

type
  VkPipelineViewportExclusiveScissorStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    exclusiveScissorCount*: uint32
    pExclusiveScissors*: ptr VkRect2D

  VkPhysicalDeviceExclusiveScissorFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    exclusiveScissor*: VkBool32

  PFNVkcmdsetexclusivescissornv* = proc (commandBuffer: VkCommandBuffer; firstExclusiveScissor: uint32; exclusiveScissorCount: uint32; pExclusiveScissors: ptr VkRect2D) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdSetExclusiveScissorNV*(commandBuffer: VkCommandBuffer; firstExclusiveScissor: uint32; exclusiveScissorCount: uint32; pExclusiveScissors: ptr VkRect2D) {.cdecl, importc.}
const
  vkNvDeviceDiagnosticCheckpoints* = 1
  vkNvDeviceDiagnosticCheckpointsSpecVersion* = 2
  vkNvDeviceDiagnosticCheckpointsExtensionName* = "vkNvDeviceDiagnosticCheckpoints"

type
  VkQueueFamilyCheckpointPropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    checkpointExecutionStageMask*: VkPipelineStageFlags

  VkCheckpointDataNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    stage*: VkPipelineStageFlagBits
    pCheckpointMarker*: pointer

  PFNVkcmdsetcheckpointnv* = proc (commandBuffer: VkCommandBuffer; pCheckpointMarker: pointer) {.cdecl.}
  PFNVkgetqueuecheckpointdatanv* = proc (queue: VkQueue; pCheckpointDataCount: ptr uint32; pCheckpointData: ptr VkCheckpointDataNV) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdSetCheckpointNV*(commandBuffer: VkCommandBuffer; pCheckpointMarker: pointer) {.cdecl, importc.}
  proc vkGetQueueCheckpointDataNV*(queue: VkQueue; pCheckpointDataCount: ptr uint32; pCheckpointData: ptr VkCheckpointDataNV) {.cdecl, importc.}
const
  vkExtPciBusInfo* = 1
  vkExtPciBusInfoSpecVersion* = 1
  vkExtPciBusInfoExtensionName* = "vkExtPciBusInfo"

type
  VkPhysicalDevicePCIBusInfoPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pciDomain*: uint16
    pciBus*: uint8
    pciDevice*: uint8
    pciFunction*: uint8


const
  vkGoogleHlslFunctionality1* = 1
  vkGoogleHlslFunctionality1SpecVersion* = 0
  vkGoogleHlslFunctionality1ExtensionName* = "vkGoogleHlslFunctionality1"
  vkGoogleDecorateString* = 1
  vkGoogleDecorateStringSpecVersion* = 0
  vkGoogleDecorateStringExtensionName* = "vkGoogleDecorateString"

from strutils import replace

macro genFlagConverters(identifiers: untyped): untyped =
  result =  nnkStmtList.newTree() #same as newNimNode()
  for identifier in identifiers: #Identifiers of the FlagBits types
    var flagType = identifier.strVal.replace("Bit")
    result.add(
      nnkConverterDef.newTree(
        nnkPostfix.newTree(
          newIdentNode("*"),
          newIdentNode("to" & flagType)
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          newIdentNode(flagType ),
          nnkIdentDefs.newTree(
            newIdentNode("i"),
            newIdentNode(identifier.strVal),
            newEmptyNode()
          )
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkStmtList.newTree(
          nnkDotExpr.newTree(
            newIdentNode("i"),
            newIdentNode(flagType )
          )
        )
      )
    )

genFlagConverters:
  VkFormatFeatureFlagBits
  VkImageUsageFlagBits
  VkImageCreateFlagBits
  VkSampleCountFlagBits
  VkQueueFlagBits
  VkMemoryPropertyFlagBits
  VkMemoryHeapFlagBits
  VkDeviceQueueCreateFlagBits
  VkPipelineStageFlagBits
  VkImageAspectFlagBits
  VkSparseImageFormatFlagBits
  VkSparseMemoryBindFlagBits
  VkFenceCreateFlagBits
  VkQueryPipelineStatisticFlagBits
  VkQueryResultFlagBits
  VkBufferCreateFlagBits
  VkBufferUsageFlagBits
  VkPipelineCreateFlagBits
  VkShaderStageFlagBits
  VkCullModeFlagBits
  VkColorComponentFlagBits
  VkDescriptorSetLayoutCreateFlagBits
  VkDescriptorPoolCreateFlagBits
  VkAttachmentDescriptionFlagBits
  VkSubpassDescriptionFlagBits
  VkAccessFlagBits
  VkDependencyFlagBits
  VkCommandPoolCreateFlagBits
  VkCommandPoolResetFlagBits
  VkCommandBufferUsageFlagBits
  VkQueryControlFlagBits
  VkCommandBufferResetFlagBits
  VkStencilFaceFlagBits
  VkRenderPassCreateFlagBits
  VkSubgroupFeatureFlagBits
  VkPeerMemoryFeatureFlagBits
  VkMemoryAllocateFlagBits
  VkExternalMemoryHandleTypeFlagBits
  VkExternalMemoryFeatureFlagBits
  VkExternalFenceHandleTypeFlagBits
  VkExternalFenceFeatureFlagBits
  VkFenceImportFlagBits
  VkSemaphoreImportFlagBits
  VkExternalSemaphoreHandleTypeFlagBits
  VkExternalSemaphoreFeatureFlagBits
  VkSurfaceTransformFlagBitsKHR
  VkCompositeAlphaFlagBitsKHR
  VkSwapchainCreateFlagBitsKHR
  VkDeviceGroupPresentModeFlagBitsKHR
  VkDisplayPlaneAlphaFlagBitsKHR
  VkDebugReportFlagBitsEXT
  VkExternalMemoryHandleTypeFlagBitsNV
  VkExternalMemoryFeatureFlagBitsNV
  VkConditionalRenderingFlagBitsEXT
  VkIndirectCommandsLayoutUsageFlagBitsNVX
  VkObjectEntryUsageFlagBitsNVX
  VkSurfaceCounterFlagBitsEXT
  VkDebugUtilsMessageSeverityFlagBitsEXT
  VkDebugUtilsMessageTypeFlagBitsEXT
  VkDescriptorBindingFlagBitsEXT
  VkGeometryFlagBitsNV
  VkGeometryInstanceFlagBitsNV
  VkBuildAccelerationStructureFlagBitsNV
