##
## * Copyright 2015-2021 The Khronos Group Inc.
## *
## * SPDX-License-Identifier: Apache-2.0
##
##
## * This header is generated from the Khronos Vulkan XML API Registry.
## *
##

import macros
{.experimental: "codeReordering".}

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

macro genDistinctOps(identifiers: untyped): untyped =
  result =  nnkStmtList.newTree()
  for identifier in identifiers:
    result.add(
      #Negative sign for distincts
      nnkProcDef.newTree(
        nnkPostfix.newTree(
          ident"*",
          nnkAccQuoted.newTree(ident"-")
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          identifier,
          nnkIdentDefs.newTree(
            ident"x",
            identifier,
            newEmptyNode()
        ) ),
        nnkPragma.newTree(ident"borrow"),
        newEmptyNode(),
        newEmptyNode()
      ),
      #Subtract distincts
      nnkProcDef.newTree(
        nnkPostfix.newTree(
          ident"*",
          nnkAccQuoted.newTree(ident"-")
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          identifier,
          nnkIdentDefs.newTree(
            ident"x",
            ident"y",
            identifier,
            newEmptyNode()
        ) ),
        nnkPragma.newTree(ident"borrow"),
        newEmptyNode(),
        newEmptyNode()
      ),
      #Add distincts
      nnkProcDef.newTree(
        nnkPostfix.newTree(
          ident"*",
          nnkAccQuoted.newTree(ident"+")
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          identifier,
          nnkIdentDefs.newTree(
            ident"x",
            ident"y",
            identifier,
            newEmptyNode()
        ) ),
        nnkPragma.newTree(ident"borrow"),
        newEmptyNode(),
        newEmptyNode()
      ),
      #Check distincts for equality
      nnkProcDef.newTree(
        nnkPostfix.newTree(
          ident"*",
          nnkAccQuoted.newTree(ident"==")
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          ident"bool",
          nnkIdentDefs.newTree(
            ident"x",
            ident"y",
            identifier,
            newEmptyNode()
        ) ),
        nnkPragma.newTree(ident"borrow"),
        newEmptyNode(),
        newEmptyNode()
      ),
      #Add int literal to distinct
      nnkTemplateDef.newTree(
        nnkAccQuoted.newTree(ident"+"),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          identifier,
          nnkIdentDefs.newTree(
            ident"x",
            identifier,
            newEmptyNode()
          ),
          nnkIdentDefs.newTree(
            ident"y",
            ident"int",
            newEmptyNode()
        ) ),
        nnkPragma.newTree(ident"used"),
        newEmptyNode(),
        nnkStmtList.newTree(
          nnkInfix.newTree(
            ident"+",
            ident"x",
            nnkDotExpr.newTree(
              ident"y",
              identifier
    ) ) ) ) )

type
  VkHandle = int64
  VkNonDispatchableHandle = int64

genDistinctOps:
  VkResult
  VkStructureType
  VkImageLayout
  VkObjectType
  VkVendorId
  VkPipelineCacheHeaderVersion
  VkSystemAllocationScope
  VkInternalAllocationType
  VkFormat
  VkImageTiling
  VkImageType
  VkPhysicalDeviceType
  VkQueryType
  VkSharingMode
  VkComponentSwizzle
  VkImageViewType
  VkBlendFactor
  VkBlendOp
  VkCompareOp
  VkDynamicState
  VkFrontFace
  VkVertexInputRate
  VkPrimitiveTopology
  VkPolygonMode
  VkStencilOp
  VkLogicOp
  VkBorderColor
  VkFilter
  VkSamplerAddressMode
  VkSamplerMipmapMode
  VkDescriptorType
  VkAttachmentLoadOp
  VkAttachmentStoreOp
  VkPipelineBindPoint
  VkCommandBufferLevel
  VkIndexType
  VkSubpassContents
  VkAccessFlagBits
  VkImageAspectFlagBits
  VkFormatFeatureFlagBits
  VkImageCreateFlagBits
  VkSampleCountFlagBits
  VkImageUsageFlagBits
  VkMemoryHeapFlagBits
  VkMemoryPropertyFlagBits
  VkQueueFlagBits
  VkDeviceQueueCreateFlagBits
  VkPipelineStageFlagBits
  VkSparseMemoryBindFlagBits
  VkSparseImageFormatFlagBits
  VkFenceCreateFlagBits
  VkEventCreateFlagBits
  VkQueryPipelineStatisticFlagBits
  VkQueryResultFlagBits
  VkBufferCreateFlagBits
  VkBufferUsageFlagBits
  VkImageViewCreateFlagBits
  VkShaderModuleCreateFlagBits
  VkPipelineCacheCreateFlagBits
  VkColorComponentFlagBits
  VkPipelineCreateFlagBits
  VkPipelineShaderStageCreateFlagBits
  VkShaderStageFlagBits
  VkCullModeFlagBits
  VkSamplerCreateFlagBits
  VkDescriptorPoolCreateFlagBits
  VkDescriptorSetLayoutCreateFlagBits
  VkAttachmentDescriptionFlagBits
  VkDependencyFlagBits
  VkFramebufferCreateFlagBits
  VkRenderPassCreateFlagBits
  VkSubpassDescriptionFlagBits
  VkCommandPoolCreateFlagBits
  VkCommandPoolResetFlagBits
  VkCommandBufferUsageFlagBits
  VkQueryControlFlagBits
  VkCommandBufferResetFlagBits
  VkStencilFaceFlagBits
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
  VkDriverId
  VkShaderFloatControlsIndependence
  VkSamplerReductionMode
  VkSemaphoreType
  VkResolveModeFlagBits
  VkDescriptorBindingFlagBits
  VkSemaphoreWaitFlagBits
  VkPresentModeKHR
  VkColorSpaceKHR
  VkSurfaceTransformFlagBitsKHR
  VkCompositeAlphaFlagBitsKHR
  VkSwapchainCreateFlagBitsKHR
  VkDeviceGroupPresentModeFlagBitsKHR
  VkDisplayPlaneAlphaFlagBitsKHR
  VkPerformanceCounterUnitKHR
  VkPerformanceCounterScopeKHR
  VkPerformanceCounterStorageKHR
  VkPerformanceCounterDescriptionFlagBitsKHR
  VkAcquireProfilingLockFlagBitsKHR
  VkFragmentShadingRateCombinerOpKHR
  VkPipelineExecutableStatisticFormatKHR
  VkSubmitFlagBitsKHR
  VkDebugReportObjectTypeEXT
  VkDebugReportFlagBitsEXT
  VkRasterizationOrderAMD
  VkShaderInfoTypeAMD
  VkExternalMemoryHandleTypeFlagBitsNV
  VkExternalMemoryFeatureFlagBitsNV
  VkValidationCheckEXT
  VkConditionalRenderingFlagBitsEXT
  VkSurfaceCounterFlagBitsEXT
  VkDisplayPowerStateEXT
  VkDeviceEventTypeEXT
  VkDisplayEventTypeEXT
  VkViewportCoordinateSwizzleNV
  VkDiscardRectangleModeEXT
  VkConservativeRasterizationModeEXT
  VkDebugUtilsMessageSeverityFlagBitsEXT
  VkDebugUtilsMessageTypeFlagBitsEXT
  VkBlendOverlapEXT
  VkCoverageModulationModeNV
  VkValidationCacheHeaderVersionEXT
  VkShadingRatePaletteEntryNV
  VkCoarseSampleOrderTypeNV
  VkRayTracingShaderGroupTypeKHR
  VkGeometryTypeKHR
  VkAccelerationStructureTypeKHR
  VkCopyAccelerationStructureModeKHR
  VkAccelerationStructureMemoryRequirementsTypeNV
  VkGeometryFlagBitsKHR
  VkGeometryInstanceFlagBitsKHR
  VkBuildAccelerationStructureFlagBitsKHR
  VkQueueGlobalPriorityEXT
  VkPipelineCompilerControlFlagBitsAMD
  VkTimeDomainEXT
  VkMemoryOverallocationBehaviorAMD
  VkPipelineCreationFeedbackFlagBitsEXT
  VkPerformanceConfigurationTypeINTEL
  VkQueryPoolSamplingModeINTEL
  VkPerformanceOverrideTypeINTEL
  VkPerformanceParameterTypeINTEL
  VkPerformanceValueTypeINTEL
  VkShaderCorePropertiesFlagBitsAMD
  VkToolPurposeFlagBitsEXT
  VkValidationFeatureEnableEXT
  VkValidationFeatureDisableEXT
  VkComponentTypeNV
  VkScopeNV
  VkCoverageReductionModeNV
  VkLineRasterizationModeEXT
  VkIndirectCommandsTokenTypeNV
  VkIndirectStateFlagBitsNV
  VkIndirectCommandsLayoutUsageFlagBitsNV
  VkDeviceMemoryReportEventTypeEXT
  VkPrivateDataSlotCreateFlagBitsEXT
  VkDeviceDiagnosticsConfigFlagBitsNV
  VkFragmentShadingRateTypeNV
  VkFragmentShadingRateNV
  VkBuildAccelerationStructureModeKHR
  VkAccelerationStructureBuildTypeKHR
  VkAccelerationStructureCompatibilityKHR
  VkAccelerationStructureCreateFlagBitsKHR
  VkShaderGroupShaderKHR

const
  vkVersion10* = 1

template vkMakeVersion*(major, minor, patch: untyped): untyped =
  ((((uint32)(major)) shl 22) or (((uint32)(minor)) shl 12) or ((uint32)(patch)))

##  DEPRECATED: This define has been removed. Specific version defines (e.g. vkApiVersion10), or the vkMakeVersion macro, should be used instead.
## #define vkApiVersion vkMakeVersion(1, 0, 0) // Patch version should always be set to 0
##  Vulkan 1.0 version number

const
  vkApiVersion10* = vkMakeVersion(1, 0, 0) ##  Patch version should always be set to 0

##  Version of this file

const
  vkHeaderVersion* = 172

##  Complete version of this file

const
  vkHeaderVersionComplete* = vkMakeVersion(1, 2, vkHeaderVersion)

template vkVersionMajor*(version: untyped): untyped =
  ((uint32)(version) shr 22)

template vkVersionMinor*(version: untyped): untyped =
  (((uint32)(version) shr 12) and 0x000003FF)

template vkVersionPatch*(version: untyped): untyped =
  ((uint32)(version) and 0x00000FFF)

const
  vkNullHandle* = 0

type
  VkBool32* = uint32
  VkDeviceAddress* = uint64
  VkDeviceSize* = uint64
  VkFlags* = uint32
  VkSampleMask* = uint32
  VkBuffer* = VkNonDispatchableHandle
  VkImage* = VkNonDispatchableHandle
  VkInstance* = VkHandle
  VkPhysicalDevice* = VkHandle
  VkDevice* = VkHandle
  VkQueue* = VkHandle
  VkSemaphore* = VkNonDispatchableHandle
  VkCommandBuffer* = VkHandle
  VkFence* = VkNonDispatchableHandle
  VkDeviceMemory* = VkNonDispatchableHandle
  VkEvent* = VkNonDispatchableHandle
  VkQueryPool* = VkNonDispatchableHandle
  VkBufferView* = VkNonDispatchableHandle
  VkImageView* = VkNonDispatchableHandle
  VkShaderModule* = VkNonDispatchableHandle
  VkPipelineCache* = VkNonDispatchableHandle
  VkPipelineLayout* = VkNonDispatchableHandle
  VkPipeline* = VkNonDispatchableHandle
  VkRenderPass* = VkNonDispatchableHandle
  VkDescriptorSetLayout* = VkNonDispatchableHandle
  VkSampler* = VkNonDispatchableHandle
  VkDescriptorSet* = VkNonDispatchableHandle
  VkDescriptorPool* = VkNonDispatchableHandle
  VkFramebuffer* = VkNonDispatchableHandle
  VkCommandPool* = VkNonDispatchableHandle

const
  vkAttachmentUnused* = (not 0'u32)
  vkFalse* = 0
  vkLodClampNone* = 1000.0
  vkQueueFamilyIgnored* = (not 0'u32)
  vkRemainingArrayLayers* = (not 0'u32)
  vkRemainingMipLevels* = (not 0'u32)
  vkSubpassExternal* = (not 0'u32)
  vkTrue* = 1
  vkWholeSize* = (not 0'u64)
  vkMaxMemoryTypes* = 32
  vkMaxMemoryHeaps* = 16
  vkMaxPhysicalDeviceNameSize* = 256
  vkUuidSize* = 16
  vkMaxExtensionNameSize* = 256
  vkMaxDescriptionSize* = 256

type
  VkResult* = distinct cint
  VkStructureType* = distinct cint
  VkImageLayout* = distinct cint
  VkObjectType* = distinct cint
  VkVendorId* = distinct cint
  VkPipelineCacheHeaderVersion* = distinct cint
  VkSystemAllocationScope* = distinct cint
  VkInternalAllocationType* = distinct cint
  VkFormat* = distinct cint
  VkImageTiling* = distinct cint
  VkImageType* = distinct cint
  VkPhysicalDeviceType* = distinct cint
  VkQueryType* = distinct cint
  VkSharingMode* = distinct cint
  VkComponentSwizzle* = distinct cint
  VkImageViewType* = distinct cint
  VkBlendFactor* = distinct cint
  VkBlendOp* = distinct cint
  VkCompareOp* = distinct cint
  VkDynamicState* = distinct cint
  VkFrontFace* = distinct cint
  VkVertexInputRate* = distinct cint
  VkPrimitiveTopology* = distinct cint
  VkPolygonMode* = distinct cint
  VkStencilOp* = distinct cint
  VkLogicOp* = distinct cint
  VkBorderColor* = distinct cint
  VkFilter* = distinct cint
  VkSamplerAddressMode* = distinct cint
  VkSamplerMipmapMode* = distinct cint
  VkDescriptorType* = distinct cint
  VkAttachmentLoadOp* = distinct cint
  VkAttachmentStoreOp* = distinct cint
  VkPipelineBindPoint* = distinct cint
  VkCommandBufferLevel* = distinct cint
  VkIndexType* = distinct cint
  VkSubpassContents* = distinct cint
  VkAccessFlagBits* = distinct cint
  VkAccessFlags* = VkFlags
  VkImageAspectFlagBits* = distinct cint
  VkImageAspectFlags* = VkFlags
  VkFormatFeatureFlagBits* = distinct cint
  VkFormatFeatureFlags* = VkFlags
  VkImageCreateFlagBits* = distinct cint
  VkImageCreateFlags* = VkFlags
  VkSampleCountFlagBits* = distinct cint
  VkSampleCountFlags* = VkFlags
  VkImageUsageFlagBits* = distinct cint
  VkImageUsageFlags* = VkFlags
  VkInstanceCreateFlags* = VkFlags
  VkMemoryHeapFlagBits* = distinct cint
  VkMemoryHeapFlags* = VkFlags
  VkMemoryPropertyFlagBits* = distinct cint
  VkMemoryPropertyFlags* = VkFlags
  VkQueueFlagBits* = distinct cint
  VkQueueFlags* = VkFlags
  VkDeviceCreateFlags* = VkFlags
  VkDeviceQueueCreateFlagBits* = distinct cint
  VkDeviceQueueCreateFlags* = VkFlags
  VkPipelineStageFlagBits* = distinct cint
  VkPipelineStageFlags* = VkFlags
  VkMemoryMapFlags* = VkFlags
  VkSparseMemoryBindFlagBits* = distinct cint
  VkSparseMemoryBindFlags* = VkFlags
  VkSparseImageFormatFlagBits* = distinct cint
  VkSparseImageFormatFlags* = VkFlags
  VkFenceCreateFlagBits* = distinct cint
  VkFenceCreateFlags* = VkFlags
  VkSemaphoreCreateFlags* = VkFlags
  VkEventCreateFlagBits* = distinct cint
  VkEventCreateFlags* = VkFlags
  VkQueryPipelineStatisticFlagBits* = distinct cint
  VkQueryPipelineStatisticFlags* = VkFlags
  VkQueryPoolCreateFlags* = VkFlags
  VkQueryResultFlagBits* = distinct cint
  VkQueryResultFlags* = VkFlags
  VkBufferCreateFlagBits* = distinct cint
  VkBufferCreateFlags* = VkFlags
  VkBufferUsageFlagBits* = distinct cint
  VkBufferUsageFlags* = VkFlags
  VkBufferViewCreateFlags* = VkFlags
  VkImageViewCreateFlagBits* = distinct cint
  VkImageViewCreateFlags* = VkFlags
  VkShaderModuleCreateFlagBits* = distinct cint
  VkShaderModuleCreateFlags* = VkFlags
  VkPipelineCacheCreateFlagBits* = distinct cint
  VkPipelineCacheCreateFlags* = VkFlags
  VkColorComponentFlagBits* = distinct cint
  VkColorComponentFlags* = VkFlags
  VkPipelineCreateFlagBits* = distinct cint
  VkPipelineCreateFlags* = VkFlags
  VkPipelineShaderStageCreateFlagBits* = distinct cint
  VkPipelineShaderStageCreateFlags* = VkFlags
  VkShaderStageFlagBits* = distinct cint
  VkCullModeFlagBits* = distinct cint
  VkCullModeFlags* = VkFlags
  VkPipelineVertexInputStateCreateFlags* = VkFlags
  VkPipelineInputAssemblyStateCreateFlags* = VkFlags
  VkPipelineTessellationStateCreateFlags* = VkFlags
  VkPipelineViewportStateCreateFlags* = VkFlags
  VkPipelineRasterizationStateCreateFlags* = VkFlags
  VkPipelineMultisampleStateCreateFlags* = VkFlags
  VkPipelineDepthStencilStateCreateFlags* = VkFlags
  VkPipelineColorBlendStateCreateFlags* = VkFlags
  VkPipelineDynamicStateCreateFlags* = VkFlags
  VkPipelineLayoutCreateFlags* = VkFlags
  VkShaderStageFlags* = VkFlags
  VkSamplerCreateFlagBits* = distinct cint
  VkSamplerCreateFlags* = VkFlags
  VkDescriptorPoolCreateFlagBits* = distinct cint
  VkDescriptorPoolCreateFlags* = VkFlags
  VkDescriptorPoolResetFlags* = VkFlags
  VkDescriptorSetLayoutCreateFlagBits* = distinct cint
  VkDescriptorSetLayoutCreateFlags* = VkFlags
  VkAttachmentDescriptionFlagBits* = distinct cint
  VkAttachmentDescriptionFlags* = VkFlags
  VkDependencyFlagBits* = distinct cint
  VkDependencyFlags* = VkFlags
  VkFramebufferCreateFlagBits* = distinct cint
  VkFramebufferCreateFlags* = VkFlags
  VkRenderPassCreateFlagBits* = distinct cint
  VkRenderPassCreateFlags* = VkFlags
  VkSubpassDescriptionFlagBits* = distinct cint
  VkSubpassDescriptionFlags* = VkFlags
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
  VkExtent2D* {.bycopy.} = object
    width*: uint32
    height*: uint32

  VkExtent3D* {.bycopy.} = object
    width*: uint32
    height*: uint32
    depth*: uint32

  VkOffset2D* {.bycopy.} = object
    x*: int32
    y*: int32

  VkOffset3D* {.bycopy.} = object
    x*: int32
    y*: int32
    z*: int32

  VkRect2D* {.bycopy.} = object
    offset*: VkOffset2D
    extent*: VkExtent2D

  VkBaseInStructure* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: ptr VkBaseInStructure

  VkBaseOutStructure* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: ptr VkBaseOutStructure

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

  VkImageSubresourceRange* {.bycopy.} = object
    aspectMask*: VkImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32

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

  VkMemoryBarrier* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags

  PFNVkallocationfunction* = proc (pUserData: pointer; size: csize_t; alignment: csize_t; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}
  PFNVkfreefunction* = proc (pUserData: pointer; pMemory: pointer) {.cdecl.}
  PFNVkinternalallocationnotification* = proc (pUserData: pointer; size: csize_t; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}
  PFNVkinternalfreenotification* = proc (pUserData: pointer; size: csize_t; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}
  PFNVkreallocationfunction* = proc (pUserData: pointer; pOriginal: pointer; size: csize_t; alignment: csize_t; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}
  PFNVkvoidfunction* = proc () {.cdecl.}
  VkAllocationCallbacks* {.bycopy.} = object
    pUserData*: pointer
    pfnAllocation*: PFNVkallocationfunction
    pfnReallocation*: PFNVkreallocationfunction
    pfnFree*: PFNVkfreefunction
    pfnInternalAllocation*: PFNVkinternalallocationnotification
    pfnInternalFree*: PFNVkinternalfreenotification

  VkApplicationInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pApplicationName*: cstring
    applicationVersion*: uint32
    pEngineName*: cstring
    engineVersion*: uint32
    apiVersion*: uint32

  VkFormatProperties* {.bycopy.} = object
    linearTilingFeatures*: VkFormatFeatureFlags
    optimalTilingFeatures*: VkFormatFeatureFlags
    bufferFeatures*: VkFormatFeatureFlags

  VkImageFormatProperties* {.bycopy.} = object
    maxExtent*: VkExtent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts*: VkSampleCountFlags
    maxResourceSize*: VkDeviceSize

  VkInstanceCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkInstanceCreateFlags
    pApplicationInfo*: ptr VkApplicationInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray

  VkMemoryHeap* {.bycopy.} = object
    size*: VkDeviceSize
    flags*: VkMemoryHeapFlags

  VkMemoryType* {.bycopy.} = object
    propertyFlags*: VkMemoryPropertyFlags
    heapIndex*: uint32

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
    textureCompressionASTC_LDR*: VkBool32
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
    minMemoryMapAlignment*: csize_t
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

  VkPhysicalDeviceMemoryProperties* {.bycopy.} = object
    memoryTypeCount*: uint32
    memoryTypes*: array[vkMaxMemoryTypes, VkMemoryType]
    memoryHeapCount*: uint32
    memoryHeaps*: array[vkMaxMemoryHeaps, VkMemoryHeap]

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

  VkMappedMemoryRange* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory
    offset*: VkDeviceSize
    size*: VkDeviceSize

  VkMemoryAllocateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    allocationSize*: VkDeviceSize
    memoryTypeIndex*: uint32

  VkMemoryRequirements* {.bycopy.} = object
    size*: VkDeviceSize
    alignment*: VkDeviceSize
    memoryTypeBits*: uint32

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
    codeSize*: csize_t
    pCode*: ptr uint32

  VkPipelineCacheCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCacheCreateFlags
    initialDataSize*: csize_t
    pInitialData*: pointer

  VkSpecializationMapEntry* {.bycopy.} = object
    constantID*: uint32
    offset*: uint32
    size*: csize_t

  VkSpecializationInfo* {.bycopy.} = object
    mapEntryCount*: uint32
    pMapEntries*: ptr VkSpecializationMapEntry
    dataSize*: csize_t
    pData*: pointer

  VkPipelineShaderStageCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineShaderStageCreateFlags
    stage*: VkShaderStageFlagBits
    module*: VkShaderModule
    pName*: cstring
    pSpecializationInfo*: ptr VkSpecializationInfo

  VkComputePipelineCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stage*: VkPipelineShaderStageCreateInfo
    layout*: VkPipelineLayout
    basePipelineHandle*: VkPipeline
    basePipelineIndex*: int32

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

  VkDescriptorBufferInfo* {.bycopy.} = object
    buffer*: VkBuffer
    offset*: VkDeviceSize
    range*: VkDeviceSize

  VkDescriptorImageInfo* {.bycopy.} = object
    sampler*: VkSampler
    imageView*: VkImageView
    imageLayout*: VkImageLayout

  VkDescriptorPoolSize* {.bycopy.} = object
    `type`*: VkDescriptorType
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

  VkBufferImageCopy* {.bycopy.} = object
    bufferOffset*: VkDeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: VkImageSubresourceLayers
    imageOffset*: VkOffset3D
    imageExtent*: VkExtent3D

  VkClearColorValue* {.bycopy, union.} = object
    float32*: array[4, cfloat]
    int32*: array[4, int32]
    uint32*: array[4, uint32]

  VkClearDepthStencilValue* {.bycopy.} = object
    depth*: cfloat
    stencil*: uint32

  VkClearValue* {.bycopy, union.} = object
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

  VkImageBlit* {.bycopy.} = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffsets*: array[2, VkOffset3D]
    dstSubresource*: VkImageSubresourceLayers
    dstOffsets*: array[2, VkOffset3D]

  VkImageCopy* {.bycopy.} = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkImageResolve* {.bycopy.} = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkRenderPassBeginInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    renderPass*: VkRenderPass
    framebuffer*: VkFramebuffer
    renderArea*: VkRect2D
    clearValueCount*: uint32
    pClearValues*: ptr VkClearValue

  PFNVkcreateinstance* = proc (pCreateInfo: ptr VkInstanceCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pInstance: ptr VkInstance): VkResult {.cdecl.}
  PFNVkdestroyinstance* = proc (instance: VkInstance; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkenumeratephysicaldevices* = proc (instance: VkInstance; pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr VkPhysicalDevice): VkResult {.cdecl.}
  PFNVkgetphysicaldevicefeatures* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures) {.cdecl.}
  PFNVkgetphysicaldeviceformatproperties* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties) {.cdecl.}
  PFNVkgetphysicaldeviceimageformatproperties* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; pImageFormatProperties: ptr VkImageFormatProperties): VkResult {.cdecl.}
  PFNVkgetphysicaldeviceproperties* = proc (physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties) {.cdecl.}
  PFNVkgetphysicaldevicequeuefamilyproperties* = proc (physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties) {.cdecl.}
  PFNVkgetphysicaldevicememoryproperties* = proc (physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties) {.cdecl.}
  PFNVkgetinstanceprocaddr* = proc (instance: VkInstance; pName: cstring): PFNVkvoidfunction {.cdecl.}
  PFNVkgetdeviceprocaddr* = proc (device: VkDevice; pName: cstring): PFNVkvoidfunction {.cdecl.}
  PFNVkcreatedevice* = proc (physicalDevice: VkPhysicalDevice; pCreateInfo: ptr VkDeviceCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pDevice: ptr VkDevice): VkResult {.cdecl.}
  PFNVkdestroydevice* = proc (device: VkDevice; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkenumerateinstanceextensionproperties* = proc (pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl.}
  PFNVkenumeratedeviceextensionproperties* = proc (physicalDevice: VkPhysicalDevice; pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl.}
  PFNVkenumerateinstancelayerproperties* = proc (pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl.}
  PFNVkenumeratedevicelayerproperties* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl.}
  PFNVkgetdevicequeue* = proc (device: VkDevice; queueFamilyIndex: uint32; queueIndex: uint32; pQueue: ptr VkQueue) {.cdecl.}
  PFNVkqueuesubmit* = proc (queue: VkQueue; submitCount: uint32; pSubmits: ptr VkSubmitInfo; fence: VkFence): VkResult {.cdecl.}
  PFNVkqueuewaitidle* = proc (queue: VkQueue): VkResult {.cdecl.}
  PFNVkdevicewaitidle* = proc (device: VkDevice): VkResult {.cdecl.}
  PFNVkallocatememory* = proc (device: VkDevice; pAllocateInfo: ptr VkMemoryAllocateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pMemory: ptr VkDeviceMemory): VkResult {.cdecl.}
  PFNVkfreememory* = proc (device: VkDevice; memory: VkDeviceMemory; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
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
  PFNVkcreatefence* = proc (device: VkDevice; pCreateInfo: ptr VkFenceCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pFence: ptr VkFence): VkResult {.cdecl.}
  PFNVkdestroyfence* = proc (device: VkDevice; fence: VkFence; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkresetfences* = proc (device: VkDevice; fenceCount: uint32; pFences: ptr VkFence): VkResult {.cdecl.}
  PFNVkgetfencestatus* = proc (device: VkDevice; fence: VkFence): VkResult {.cdecl.}
  PFNVkwaitforfences* = proc (device: VkDevice; fenceCount: uint32; pFences: ptr VkFence; waitAll: VkBool32; timeout: uint64): VkResult {.cdecl.}
  PFNVkcreatesemaphore* = proc (device: VkDevice; pCreateInfo: ptr VkSemaphoreCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pSemaphore: ptr VkSemaphore): VkResult {.cdecl.}
  PFNVkdestroysemaphore* = proc (device: VkDevice; semaphore: VkSemaphore; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreateevent* = proc (device: VkDevice; pCreateInfo: ptr VkEventCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pEvent: ptr VkEvent): VkResult {.cdecl.}
  PFNVkdestroyevent* = proc (device: VkDevice; event: VkEvent; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgeteventstatus* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFNVksetevent* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFNVkresetevent* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFNVkcreatequerypool* = proc (device: VkDevice; pCreateInfo: ptr VkQueryPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pQueryPool: ptr VkQueryPool): VkResult {.cdecl.}
  PFNVkdestroyquerypool* = proc (device: VkDevice; queryPool: VkQueryPool; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgetquerypoolresults* = proc (device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dataSize: csize_t; pData: pointer; stride: VkDeviceSize; flags: VkQueryResultFlags): VkResult {.cdecl.}
  PFNVkcreatebuffer* = proc (device: VkDevice; pCreateInfo: ptr VkBufferCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pBuffer: ptr VkBuffer): VkResult {.cdecl.}
  PFNVkdestroybuffer* = proc (device: VkDevice; buffer: VkBuffer; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreatebufferview* = proc (device: VkDevice; pCreateInfo: ptr VkBufferViewCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pView: ptr VkBufferView): VkResult {.cdecl.}
  PFNVkdestroybufferview* = proc (device: VkDevice; bufferView: VkBufferView; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreateimage* = proc (device: VkDevice; pCreateInfo: ptr VkImageCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pImage: ptr VkImage): VkResult {.cdecl.}
  PFNVkdestroyimage* = proc (device: VkDevice; image: VkImage; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgetimagesubresourcelayout* = proc (device: VkDevice; image: VkImage; pSubresource: ptr VkImageSubresource; pLayout: ptr VkSubresourceLayout) {.cdecl.}
  PFNVkcreateimageview* = proc (device: VkDevice; pCreateInfo: ptr VkImageViewCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pView: ptr VkImageView): VkResult {.cdecl.}
  PFNVkdestroyimageview* = proc (device: VkDevice; imageView: VkImageView; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreateshadermodule* = proc (device: VkDevice; pCreateInfo: ptr VkShaderModuleCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pShaderModule: ptr VkShaderModule): VkResult {.cdecl.}
  PFNVkdestroyshadermodule* = proc (device: VkDevice; shaderModule: VkShaderModule; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreatepipelinecache* = proc (device: VkDevice; pCreateInfo: ptr VkPipelineCacheCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pPipelineCache: ptr VkPipelineCache): VkResult {.cdecl.}
  PFNVkdestroypipelinecache* = proc (device: VkDevice; pipelineCache: VkPipelineCache; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgetpipelinecachedata* = proc (device: VkDevice; pipelineCache: VkPipelineCache; pDataSize: ptr csize_t; pData: pointer): VkResult {.cdecl.}
  PFNVkmergepipelinecaches* = proc (device: VkDevice; dstCache: VkPipelineCache; srcCacheCount: uint32; pSrcCaches: ptr VkPipelineCache): VkResult {.cdecl.}
  PFNVkcreategraphicspipelines* = proc (device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkGraphicsPipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFNVkcreatecomputepipelines* = proc (device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkComputePipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFNVkdestroypipeline* = proc (device: VkDevice; pipeline: VkPipeline; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreatepipelinelayout* = proc (device: VkDevice; pCreateInfo: ptr VkPipelineLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pPipelineLayout: ptr VkPipelineLayout): VkResult {.cdecl.}
  PFNVkdestroypipelinelayout* = proc (device: VkDevice; pipelineLayout: VkPipelineLayout; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreatesampler* = proc (device: VkDevice; pCreateInfo: ptr VkSamplerCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pSampler: ptr VkSampler): VkResult {.cdecl.}
  PFNVkdestroysampler* = proc (device: VkDevice; sampler: VkSampler; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreatedescriptorsetlayout* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pSetLayout: ptr VkDescriptorSetLayout): VkResult {.cdecl.}
  PFNVkdestroydescriptorsetlayout* = proc (device: VkDevice; descriptorSetLayout: VkDescriptorSetLayout; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreatedescriptorpool* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pDescriptorPool: ptr VkDescriptorPool): VkResult {.cdecl.}
  PFNVkdestroydescriptorpool* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkresetdescriptorpool* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; flags: VkDescriptorPoolResetFlags): VkResult {.cdecl.}
  PFNVkallocatedescriptorsets* = proc (device: VkDevice; pAllocateInfo: ptr VkDescriptorSetAllocateInfo; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl.}
  PFNVkfreedescriptorsets* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl.}
  PFNVkupdatedescriptorsets* = proc (device: VkDevice; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet; descriptorCopyCount: uint32; pDescriptorCopies: ptr VkCopyDescriptorSet) {.cdecl.}
  PFNVkcreateframebuffer* = proc (device: VkDevice; pCreateInfo: ptr VkFramebufferCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pFramebuffer: ptr VkFramebuffer): VkResult {.cdecl.}
  PFNVkdestroyframebuffer* = proc (device: VkDevice; framebuffer: VkFramebuffer; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreaterenderpass* = proc (device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pRenderPass: ptr VkRenderPass): VkResult {.cdecl.}
  PFNVkdestroyrenderpass* = proc (device: VkDevice; renderPass: VkRenderPass; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgetrenderareagranularity* = proc (device: VkDevice; renderPass: VkRenderPass; pGranularity: ptr VkExtent2D) {.cdecl.}
  PFNVkcreatecommandpool* = proc (device: VkDevice; pCreateInfo: ptr VkCommandPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pCommandPool: ptr VkCommandPool): VkResult {.cdecl.}
  PFNVkdestroycommandpool* = proc (device: VkDevice; commandPool: VkCommandPool; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
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
  vkErrorInvalidOpaqueCaptureAddress* {.used.} = -1000257000.VkResult
  vkErrorFullScreenExclusiveModeLostExt* {.used.} = -1000255000.VkResult
  vkErrorNotPermittedExt* {.used.} = -1000174001.VkResult
  vkErrorFragmentation* {.used.} = -1000161000.VkResult
  vkErrorInvalidDrmFormatModifierPlaneLayoutExt* {.used.} = -1000158000.VkResult
  vkErrorInvalidExternalHandle* {.used.} = -1000072003.VkResult
  vkErrorOutOfPoolMemory* {.used.} = -1000069000.VkResult
  vkErrorInvalidShaderNv* {.used.} = -1000012000.VkResult
  vkErrorValidationFailedExt* {.used.} = -1000011001.VkResult
  vkErrorIncompatibleDisplayKhr* {.used.} = -1000003001.VkResult
  vkErrorOutOfDateKhr* {.used.} = -1000001004.VkResult
  vkErrorNativeWindowInUseKhr* {.used.} = -1000000001.VkResult
  vkErrorSurfaceLostKhr* {.used.} = -1000000000.VkResult
  vkErrorUnknown* {.used.} = -13.VkResult
  vkErrorFragmentedPool* {.used.} = -12.VkResult
  vkErrorFormatNotSupported* {.used.} = -11.VkResult
  vkErrorTooManyObjects* {.used.} = -10.VkResult
  vkErrorIncompatibleDriver* {.used.} = -9.VkResult
  vkErrorFeatureNotPresent* {.used.} = -8.VkResult
  vkErrorExtensionNotPresent* {.used.} = -7.VkResult
  vkErrorLayerNotPresent* {.used.} = -6.VkResult
  vkErrorMemoryMapFailed* {.used.} = -5.VkResult
  vkErrorDeviceLost* {.used.} = -4.VkResult
  vkErrorInitializationFailed* {.used.} = -3.VkResult
  vkErrorOutOfDeviceMemory* {.used.} = -2.VkResult
  vkErrorOutOfHostMemory* {.used.} = -1.VkResult
  vkSuccess* {.used.} = 0.VkResult
  vkNotReady* {.used.} = 1.VkResult
  vkTimeout* {.used.} = 2.VkResult
  vkEventSet* {.used.} = 3.VkResult
  vkEventReset* {.used.} = 4.VkResult
  vkIncomplete* {.used.} = 5.VkResult
  vkSuboptimalKhr* {.used.} = 1000001003.VkResult
  vkThreadIdleKhr* {.used.} = 1000268000.VkResult
  vkThreadDoneKhr* {.used.} = 1000268001.VkResult
  vkOperationDeferredKhr* {.used.} = 1000268002.VkResult
  vkOperationNotDeferredKhr* {.used.} = 1000268003.VkResult
  vkPipelineCompileRequiredExt* {.used.} = 1000297000.VkResult
  vkErrorOutOfPoolMemoryKhr* {.used.}: VkResult = vkErrorOutOfPoolMemory
  vkErrorInvalidExternalHandleKhr* {.used.}: VkResult = vkErrorInvalidExternalHandle
  vkErrorFragmentationExt* {.used.}: VkResult = vkErrorFragmentation
  vkErrorInvalidDeviceAddressExt* {.used.}: VkResult = vkErrorInvalidOpaqueCaptureAddress
  vkErrorInvalidOpaqueCaptureAddressKhr* {.used.}: VkResult = vkErrorInvalidOpaqueCaptureAddress
  vkErrorPipelineCompileRequiredExt* {.used.}: VkResult = vkPipelineCompileRequiredExt
  vkResultMaxEnum* {.used.} = 0x7FFFFFFF.VkResult

const
  vkStructureTypeApplicationInfo* {.used.} = 0.VkStructureType
  vkStructureTypeInstanceCreateInfo* {.used.} = 1.VkStructureType
  vkStructureTypeDeviceQueueCreateInfo* {.used.} = 2.VkStructureType
  vkStructureTypeDeviceCreateInfo* {.used.} = 3.VkStructureType
  vkStructureTypeSubmitInfo* {.used.} = 4.VkStructureType
  vkStructureTypeMemoryAllocateInfo* {.used.} = 5.VkStructureType
  vkStructureTypeMappedMemoryRange* {.used.} = 6.VkStructureType
  vkStructureTypeBindSparseInfo* {.used.} = 7.VkStructureType
  vkStructureTypeFenceCreateInfo* {.used.} = 8.VkStructureType
  vkStructureTypeSemaphoreCreateInfo* {.used.} = 9.VkStructureType
  vkStructureTypeEventCreateInfo* {.used.} = 10.VkStructureType
  vkStructureTypeQueryPoolCreateInfo* {.used.} = 11.VkStructureType
  vkStructureTypeBufferCreateInfo* {.used.} = 12.VkStructureType
  vkStructureTypeBufferViewCreateInfo* {.used.} = 13.VkStructureType
  vkStructureTypeImageCreateInfo* {.used.} = 14.VkStructureType
  vkStructureTypeImageViewCreateInfo* {.used.} = 15.VkStructureType
  vkStructureTypeShaderModuleCreateInfo* {.used.} = 16.VkStructureType
  vkStructureTypePipelineCacheCreateInfo* {.used.} = 17.VkStructureType
  vkStructureTypePipelineShaderStageCreateInfo* {.used.} = 18.VkStructureType
  vkStructureTypePipelineVertexInputStateCreateInfo* {.used.} = 19.VkStructureType
  vkStructureTypePipelineInputAssemblyStateCreateInfo* {.used.} = 20.VkStructureType
  vkStructureTypePipelineTessellationStateCreateInfo* {.used.} = 21.VkStructureType
  vkStructureTypePipelineViewportStateCreateInfo* {.used.} = 22.VkStructureType
  vkStructureTypePipelineRasterizationStateCreateInfo* {.used.} = 23.VkStructureType
  vkStructureTypePipelineMultisampleStateCreateInfo* {.used.} = 24.VkStructureType
  vkStructureTypePipelineDepthStencilStateCreateInfo* {.used.} = 25.VkStructureType
  vkStructureTypePipelineColorBlendStateCreateInfo* {.used.} = 26.VkStructureType
  vkStructureTypePipelineDynamicStateCreateInfo* {.used.} = 27.VkStructureType
  vkStructureTypeGraphicsPipelineCreateInfo* {.used.} = 28.VkStructureType
  vkStructureTypeComputePipelineCreateInfo* {.used.} = 29.VkStructureType
  vkStructureTypePipelineLayoutCreateInfo* {.used.} = 30.VkStructureType
  vkStructureTypeSamplerCreateInfo* {.used.} = 31.VkStructureType
  vkStructureTypeDescriptorSetLayoutCreateInfo* {.used.} = 32.VkStructureType
  vkStructureTypeDescriptorPoolCreateInfo* {.used.} = 33.VkStructureType
  vkStructureTypeDescriptorSetAllocateInfo* {.used.} = 34.VkStructureType
  vkStructureTypeWriteDescriptorSet* {.used.} = 35.VkStructureType
  vkStructureTypeCopyDescriptorSet* {.used.} = 36.VkStructureType
  vkStructureTypeFramebufferCreateInfo* {.used.} = 37.VkStructureType
  vkStructureTypeRenderPassCreateInfo* {.used.} = 38.VkStructureType
  vkStructureTypeCommandPoolCreateInfo* {.used.} = 39.VkStructureType
  vkStructureTypeCommandBufferAllocateInfo* {.used.} = 40.VkStructureType
  vkStructureTypeCommandBufferInheritanceInfo* {.used.} = 41.VkStructureType
  vkStructureTypeCommandBufferBeginInfo* {.used.} = 42.VkStructureType
  vkStructureTypeRenderPassBeginInfo* {.used.} = 43.VkStructureType
  vkStructureTypeBufferMemoryBarrier* {.used.} = 44.VkStructureType
  vkStructureTypeImageMemoryBarrier* {.used.} = 45.VkStructureType
  vkStructureTypeMemoryBarrier* {.used.} = 46.VkStructureType
  vkStructureTypeLoaderInstanceCreateInfo* {.used.} = 47.VkStructureType
  vkStructureTypeLoaderDeviceCreateInfo* {.used.} = 48.VkStructureType
  vkStructureTypePhysicalDeviceVulkan11Features* {.used.} = 49.VkStructureType
  vkStructureTypePhysicalDeviceVulkan11Properties* {.used.} = 50.VkStructureType
  vkStructureTypePhysicalDeviceVulkan12Features* {.used.} = 51.VkStructureType
  vkStructureTypePhysicalDeviceVulkan12Properties* {.used.} = 52.VkStructureType
  vkStructureTypeSwapchainCreateInfoKhr* {.used.} = 1000001000.VkStructureType
  vkStructureTypePresentInfoKhr* {.used.} = 1000001001.VkStructureType
  vkStructureTypeDisplayModeCreateInfoKhr* {.used.} = 1000002000.VkStructureType
  vkStructureTypeDisplaySurfaceCreateInfoKhr* {.used.} = 1000002001.VkStructureType
  vkStructureTypeDisplayPresentInfoKhr* {.used.} = 1000003000.VkStructureType
  vkStructureTypeXlibSurfaceCreateInfoKhr* {.used.} = 1000004000.VkStructureType
  vkStructureTypeXcbSurfaceCreateInfoKhr* {.used.} = 1000005000.VkStructureType
  vkStructureTypeWaylandSurfaceCreateInfoKhr* {.used.} = 1000006000.VkStructureType
  vkStructureTypeAndroidSurfaceCreateInfoKhr* {.used.} = 1000008000.VkStructureType
  vkStructureTypeWin32SurfaceCreateInfoKhr* {.used.} = 1000009000.VkStructureType
  vkStructureTypeDebugReportCallbackCreateInfoExt* {.used.} = 1000011000.VkStructureType
  vkStructureTypePipelineRasterizationStateRasterizationOrderAmd* {.used.} = 1000018000.VkStructureType
  vkStructureTypeDebugMarkerObjectNameInfoExt* {.used.} = 1000022000.VkStructureType
  vkStructureTypeDebugMarkerObjectTagInfoExt* {.used.} = 1000022001.VkStructureType
  vkStructureTypeDebugMarkerMarkerInfoExt* {.used.} = 1000022002.VkStructureType
  vkStructureTypeDedicatedAllocationImageCreateInfoNv* {.used.} = 1000026000.VkStructureType
  vkStructureTypeDedicatedAllocationBufferCreateInfoNv* {.used.} = 1000026001.VkStructureType
  vkStructureTypeDedicatedAllocationMemoryAllocateInfoNv* {.used.} = 1000026002.VkStructureType
  vkStructureTypePhysicalDeviceTransformFeedbackFeaturesExt* {.used.} = 1000028000.VkStructureType
  vkStructureTypePhysicalDeviceTransformFeedbackPropertiesExt* {.used.} = 1000028001.VkStructureType
  vkStructureTypePipelineRasterizationStateStreamCreateInfoExt* {.used.} = 1000028002.VkStructureType
  vkStructureTypeImageViewHandleInfoNvx* {.used.} = 1000030000.VkStructureType
  vkStructureTypeImageViewAddressPropertiesNvx* {.used.} = 1000030001.VkStructureType
  vkStructureTypeTextureLodGatherFormatPropertiesAmd* {.used.} = 1000041000.VkStructureType
  vkStructureTypeStreamDescriptorSurfaceCreateInfoGgp* {.used.} = 1000049000.VkStructureType
  vkStructureTypePhysicalDeviceCornerSampledImageFeaturesNv* {.used.} = 1000050000.VkStructureType
  vkStructureTypeRenderPassMultiviewCreateInfo* {.used.} = 1000053000.VkStructureType
  vkStructureTypePhysicalDeviceMultiviewFeatures* {.used.} = 1000053001.VkStructureType
  vkStructureTypePhysicalDeviceMultiviewProperties* {.used.} = 1000053002.VkStructureType
  vkStructureTypeExternalMemoryImageCreateInfoNv* {.used.} = 1000056000.VkStructureType
  vkStructureTypeExportMemoryAllocateInfoNv* {.used.} = 1000056001.VkStructureType
  vkStructureTypeImportMemoryWin32HandleInfoNv* {.used.} = 1000057000.VkStructureType
  vkStructureTypeExportMemoryWin32HandleInfoNv* {.used.} = 1000057001.VkStructureType
  vkStructureTypeWin32KeyedMutexAcquireReleaseInfoNv* {.used.} = 1000058000.VkStructureType
  vkStructureTypePhysicalDeviceFeatures2* {.used.} = 1000059000.VkStructureType
  vkStructureTypePhysicalDeviceProperties2* {.used.} = 1000059001.VkStructureType
  vkStructureTypeFormatProperties2* {.used.} = 1000059002.VkStructureType
  vkStructureTypeImageFormatProperties2* {.used.} = 1000059003.VkStructureType
  vkStructureTypePhysicalDeviceImageFormatInfo2* {.used.} = 1000059004.VkStructureType
  vkStructureTypeQueueFamilyProperties2* {.used.} = 1000059005.VkStructureType
  vkStructureTypePhysicalDeviceMemoryProperties2* {.used.} = 1000059006.VkStructureType
  vkStructureTypeSparseImageFormatProperties2* {.used.} = 1000059007.VkStructureType
  vkStructureTypePhysicalDeviceSparseImageFormatInfo2* {.used.} = 1000059008.VkStructureType
  vkStructureTypeMemoryAllocateFlagsInfo* {.used.} = 1000060000.VkStructureType
  vkStructureTypeDeviceGroupRenderPassBeginInfo* {.used.} = 1000060003.VkStructureType
  vkStructureTypeDeviceGroupCommandBufferBeginInfo* {.used.} = 1000060004.VkStructureType
  vkStructureTypeDeviceGroupSubmitInfo* {.used.} = 1000060005.VkStructureType
  vkStructureTypeDeviceGroupBindSparseInfo* {.used.} = 1000060006.VkStructureType
  vkStructureTypeDeviceGroupPresentCapabilitiesKhr* {.used.} = 1000060007.VkStructureType
  vkStructureTypeImageSwapchainCreateInfoKhr* {.used.} = 1000060008.VkStructureType
  vkStructureTypeBindImageMemorySwapchainInfoKhr* {.used.} = 1000060009.VkStructureType
  vkStructureTypeAcquireNextImageInfoKhr* {.used.} = 1000060010.VkStructureType
  vkStructureTypeDeviceGroupPresentInfoKhr* {.used.} = 1000060011.VkStructureType
  vkStructureTypeDeviceGroupSwapchainCreateInfoKhr* {.used.} = 1000060012.VkStructureType
  vkStructureTypeBindBufferMemoryDeviceGroupInfo* {.used.} = 1000060013.VkStructureType
  vkStructureTypeBindImageMemoryDeviceGroupInfo* {.used.} = 1000060014.VkStructureType
  vkStructureTypeValidationFlagsExt* {.used.} = 1000061000.VkStructureType
  vkStructureTypeViSurfaceCreateInfoNn* {.used.} = 1000062000.VkStructureType
  vkStructureTypePhysicalDeviceShaderDrawParametersFeatures* {.used.} = 1000063000.VkStructureType
  vkStructureTypePhysicalDeviceTextureCompressionAstcHdrFeaturesExt* {.used.} = 1000066000.VkStructureType
  vkStructureTypeImageViewAstcDecodeModeExt* {.used.} = 1000067000.VkStructureType
  vkStructureTypePhysicalDeviceAstcDecodeFeaturesExt* {.used.} = 1000067001.VkStructureType
  vkStructureTypePhysicalDeviceGroupProperties* {.used.} = 1000070000.VkStructureType
  vkStructureTypeDeviceGroupDeviceCreateInfo* {.used.} = 1000070001.VkStructureType
  vkStructureTypePhysicalDeviceExternalImageFormatInfo* {.used.} = 1000071000.VkStructureType
  vkStructureTypeExternalImageFormatProperties* {.used.} = 1000071001.VkStructureType
  vkStructureTypePhysicalDeviceExternalBufferInfo* {.used.} = 1000071002.VkStructureType
  vkStructureTypeExternalBufferProperties* {.used.} = 1000071003.VkStructureType
  vkStructureTypePhysicalDeviceIdProperties* {.used.} = 1000071004.VkStructureType
  vkStructureTypeExternalMemoryBufferCreateInfo* {.used.} = 1000072000.VkStructureType
  vkStructureTypeExternalMemoryImageCreateInfo* {.used.} = 1000072001.VkStructureType
  vkStructureTypeExportMemoryAllocateInfo* {.used.} = 1000072002.VkStructureType
  vkStructureTypeImportMemoryWin32HandleInfoKhr* {.used.} = 1000073000.VkStructureType
  vkStructureTypeExportMemoryWin32HandleInfoKhr* {.used.} = 1000073001.VkStructureType
  vkStructureTypeMemoryWin32HandlePropertiesKhr* {.used.} = 1000073002.VkStructureType
  vkStructureTypeMemoryGetWin32HandleInfoKhr* {.used.} = 1000073003.VkStructureType
  vkStructureTypeImportMemoryFdInfoKhr* {.used.} = 1000074000.VkStructureType
  vkStructureTypeMemoryFdPropertiesKhr* {.used.} = 1000074001.VkStructureType
  vkStructureTypeMemoryGetFdInfoKhr* {.used.} = 1000074002.VkStructureType
  vkStructureTypeWin32KeyedMutexAcquireReleaseInfoKhr* {.used.} = 1000075000.VkStructureType
  vkStructureTypePhysicalDeviceExternalSemaphoreInfo* {.used.} = 1000076000.VkStructureType
  vkStructureTypeExternalSemaphoreProperties* {.used.} = 1000076001.VkStructureType
  vkStructureTypeExportSemaphoreCreateInfo* {.used.} = 1000077000.VkStructureType
  vkStructureTypeImportSemaphoreWin32HandleInfoKhr* {.used.} = 1000078000.VkStructureType
  vkStructureTypeExportSemaphoreWin32HandleInfoKhr* {.used.} = 1000078001.VkStructureType
  vkStructureTypeD3d12FenceSubmitInfoKhr* {.used.} = 1000078002.VkStructureType
  vkStructureTypeSemaphoreGetWin32HandleInfoKhr* {.used.} = 1000078003.VkStructureType
  vkStructureTypeImportSemaphoreFdInfoKhr* {.used.} = 1000079000.VkStructureType
  vkStructureTypeSemaphoreGetFdInfoKhr* {.used.} = 1000079001.VkStructureType
  vkStructureTypePhysicalDevicePushDescriptorPropertiesKhr* {.used.} = 1000080000.VkStructureType
  vkStructureTypeCommandBufferInheritanceConditionalRenderingInfoExt* {.used.} = 1000081000.VkStructureType
  vkStructureTypePhysicalDeviceConditionalRenderingFeaturesExt* {.used.} = 1000081001.VkStructureType
  vkStructureTypeConditionalRenderingBeginInfoExt* {.used.} = 1000081002.VkStructureType
  vkStructureTypePhysicalDeviceShaderFloat16Int8Features* {.used.} = 1000082000.VkStructureType
  vkStructureTypePhysicalDevice16bitStorageFeatures* {.used.} = 1000083000.VkStructureType
  vkStructureTypePresentRegionsKhr* {.used.} = 1000084000.VkStructureType
  vkStructureTypeDescriptorUpdateTemplateCreateInfo* {.used.} = 1000085000.VkStructureType
  vkStructureTypePipelineViewportWScalingStateCreateInfoNv* {.used.} = 1000087000.VkStructureType
  vkStructureTypeSurfaceCapabilities2Ext* {.used.} = 1000090000.VkStructureType
  vkStructureTypeDisplayPowerInfoExt* {.used.} = 1000091000.VkStructureType
  vkStructureTypeDeviceEventInfoExt* {.used.} = 1000091001.VkStructureType
  vkStructureTypeDisplayEventInfoExt* {.used.} = 1000091002.VkStructureType
  vkStructureTypeSwapchainCounterCreateInfoExt* {.used.} = 1000091003.VkStructureType
  vkStructureTypePresentTimesInfoGoogle* {.used.} = 1000092000.VkStructureType
  vkStructureTypePhysicalDeviceSubgroupProperties* {.used.} = 1000094000.VkStructureType
  vkStructureTypePhysicalDeviceMultiviewPerViewAttributesPropertiesNvx* {.used.} = 1000097000.VkStructureType
  vkStructureTypePipelineViewportSwizzleStateCreateInfoNv* {.used.} = 1000098000.VkStructureType
  vkStructureTypePhysicalDeviceDiscardRectanglePropertiesExt* {.used.} = 1000099000.VkStructureType
  vkStructureTypePipelineDiscardRectangleStateCreateInfoExt* {.used.} = 1000099001.VkStructureType
  vkStructureTypePhysicalDeviceConservativeRasterizationPropertiesExt* {.used.} = 1000101000.VkStructureType
  vkStructureTypePipelineRasterizationConservativeStateCreateInfoExt* {.used.} = 1000101001.VkStructureType
  vkStructureTypePhysicalDeviceDepthClipEnableFeaturesExt* {.used.} = 1000102000.VkStructureType
  vkStructureTypePipelineRasterizationDepthClipStateCreateInfoExt* {.used.} = 1000102001.VkStructureType
  vkStructureTypeHdrMetadataExt* {.used.} = 1000105000.VkStructureType
  vkStructureTypePhysicalDeviceImagelessFramebufferFeatures* {.used.} = 1000108000.VkStructureType
  vkStructureTypeFramebufferAttachmentsCreateInfo* {.used.} = 1000108001.VkStructureType
  vkStructureTypeFramebufferAttachmentImageInfo* {.used.} = 1000108002.VkStructureType
  vkStructureTypeRenderPassAttachmentBeginInfo* {.used.} = 1000108003.VkStructureType
  vkStructureTypeAttachmentDescription2* {.used.} = 1000109000.VkStructureType
  vkStructureTypeAttachmentReference2* {.used.} = 1000109001.VkStructureType
  vkStructureTypeSubpassDescription2* {.used.} = 1000109002.VkStructureType
  vkStructureTypeSubpassDependency2* {.used.} = 1000109003.VkStructureType
  vkStructureTypeRenderPassCreateInfo2* {.used.} = 1000109004.VkStructureType
  vkStructureTypeSubpassBeginInfo* {.used.} = 1000109005.VkStructureType
  vkStructureTypeSubpassEndInfo* {.used.} = 1000109006.VkStructureType
  vkStructureTypeSharedPresentSurfaceCapabilitiesKhr* {.used.} = 1000111000.VkStructureType
  vkStructureTypePhysicalDeviceExternalFenceInfo* {.used.} = 1000112000.VkStructureType
  vkStructureTypeExternalFenceProperties* {.used.} = 1000112001.VkStructureType
  vkStructureTypeExportFenceCreateInfo* {.used.} = 1000113000.VkStructureType
  vkStructureTypeImportFenceWin32HandleInfoKhr* {.used.} = 1000114000.VkStructureType
  vkStructureTypeExportFenceWin32HandleInfoKhr* {.used.} = 1000114001.VkStructureType
  vkStructureTypeFenceGetWin32HandleInfoKhr* {.used.} = 1000114002.VkStructureType
  vkStructureTypeImportFenceFdInfoKhr* {.used.} = 1000115000.VkStructureType
  vkStructureTypeFenceGetFdInfoKhr* {.used.} = 1000115001.VkStructureType
  vkStructureTypePhysicalDevicePerformanceQueryFeaturesKhr* {.used.} = 1000116000.VkStructureType
  vkStructureTypePhysicalDevicePerformanceQueryPropertiesKhr* {.used.} = 1000116001.VkStructureType
  vkStructureTypeQueryPoolPerformanceCreateInfoKhr* {.used.} = 1000116002.VkStructureType
  vkStructureTypePerformanceQuerySubmitInfoKhr* {.used.} = 1000116003.VkStructureType
  vkStructureTypeAcquireProfilingLockInfoKhr* {.used.} = 1000116004.VkStructureType
  vkStructureTypePerformanceCounterKhr* {.used.} = 1000116005.VkStructureType
  vkStructureTypePerformanceCounterDescriptionKhr* {.used.} = 1000116006.VkStructureType
  vkStructureTypePhysicalDevicePointClippingProperties* {.used.} = 1000117000.VkStructureType
  vkStructureTypeRenderPassInputAttachmentAspectCreateInfo* {.used.} = 1000117001.VkStructureType
  vkStructureTypeImageViewUsageCreateInfo* {.used.} = 1000117002.VkStructureType
  vkStructureTypePipelineTessellationDomainOriginStateCreateInfo* {.used.} = 1000117003.VkStructureType
  vkStructureTypePhysicalDeviceSurfaceInfo2Khr* {.used.} = 1000119000.VkStructureType
  vkStructureTypeSurfaceCapabilities2Khr* {.used.} = 1000119001.VkStructureType
  vkStructureTypeSurfaceFormat2Khr* {.used.} = 1000119002.VkStructureType
  vkStructureTypePhysicalDeviceVariablePointersFeatures* {.used.} = 1000120000.VkStructureType
  vkStructureTypeDisplayProperties2Khr* {.used.} = 1000121000.VkStructureType
  vkStructureTypeDisplayPlaneProperties2Khr* {.used.} = 1000121001.VkStructureType
  vkStructureTypeDisplayModeProperties2Khr* {.used.} = 1000121002.VkStructureType
  vkStructureTypeDisplayPlaneInfo2Khr* {.used.} = 1000121003.VkStructureType
  vkStructureTypeDisplayPlaneCapabilities2Khr* {.used.} = 1000121004.VkStructureType
  vkStructureTypeIosSurfaceCreateInfoMvk* {.used.} = 1000122000.VkStructureType
  vkStructureTypeMacosSurfaceCreateInfoMvk* {.used.} = 1000123000.VkStructureType
  vkStructureTypeMemoryDedicatedRequirements* {.used.} = 1000127000.VkStructureType
  vkStructureTypeMemoryDedicatedAllocateInfo* {.used.} = 1000127001.VkStructureType
  vkStructureTypeDebugUtilsObjectNameInfoExt* {.used.} = 1000128000.VkStructureType
  vkStructureTypeDebugUtilsObjectTagInfoExt* {.used.} = 1000128001.VkStructureType
  vkStructureTypeDebugUtilsLabelExt* {.used.} = 1000128002.VkStructureType
  vkStructureTypeDebugUtilsMessengerCallbackDataExt* {.used.} = 1000128003.VkStructureType
  vkStructureTypeDebugUtilsMessengerCreateInfoExt* {.used.} = 1000128004.VkStructureType
  vkStructureTypeAndroidHardwareBufferUsageAndroid* {.used.} = 1000129000.VkStructureType
  vkStructureTypeAndroidHardwareBufferPropertiesAndroid* {.used.} = 1000129001.VkStructureType
  vkStructureTypeAndroidHardwareBufferFormatPropertiesAndroid* {.used.} = 1000129002.VkStructureType
  vkStructureTypeImportAndroidHardwareBufferInfoAndroid* {.used.} = 1000129003.VkStructureType
  vkStructureTypeMemoryGetAndroidHardwareBufferInfoAndroid* {.used.} = 1000129004.VkStructureType
  vkStructureTypeExternalFormatAndroid* {.used.} = 1000129005.VkStructureType
  vkStructureTypePhysicalDeviceSamplerFilterMinmaxProperties* {.used.} = 1000130000.VkStructureType
  vkStructureTypeSamplerReductionModeCreateInfo* {.used.} = 1000130001.VkStructureType
  vkStructureTypePhysicalDeviceInlineUniformBlockFeaturesExt* {.used.} = 1000138000.VkStructureType
  vkStructureTypePhysicalDeviceInlineUniformBlockPropertiesExt* {.used.} = 1000138001.VkStructureType
  vkStructureTypeWriteDescriptorSetInlineUniformBlockExt* {.used.} = 1000138002.VkStructureType
  vkStructureTypeDescriptorPoolInlineUniformBlockCreateInfoExt* {.used.} = 1000138003.VkStructureType
  vkStructureTypeSampleLocationsInfoExt* {.used.} = 1000143000.VkStructureType
  vkStructureTypeRenderPassSampleLocationsBeginInfoExt* {.used.} = 1000143001.VkStructureType
  vkStructureTypePipelineSampleLocationsStateCreateInfoExt* {.used.} = 1000143002.VkStructureType
  vkStructureTypePhysicalDeviceSampleLocationsPropertiesExt* {.used.} = 1000143003.VkStructureType
  vkStructureTypeMultisamplePropertiesExt* {.used.} = 1000143004.VkStructureType
  vkStructureTypeProtectedSubmitInfo* {.used.} = 1000145000.VkStructureType
  vkStructureTypePhysicalDeviceProtectedMemoryFeatures* {.used.} = 1000145001.VkStructureType
  vkStructureTypePhysicalDeviceProtectedMemoryProperties* {.used.} = 1000145002.VkStructureType
  vkStructureTypeDeviceQueueInfo2* {.used.} = 1000145003.VkStructureType
  vkStructureTypeBufferMemoryRequirementsInfo2* {.used.} = 1000146000.VkStructureType
  vkStructureTypeImageMemoryRequirementsInfo2* {.used.} = 1000146001.VkStructureType
  vkStructureTypeImageSparseMemoryRequirementsInfo2* {.used.} = 1000146002.VkStructureType
  vkStructureTypeMemoryRequirements2* {.used.} = 1000146003.VkStructureType
  vkStructureTypeSparseImageMemoryRequirements2* {.used.} = 1000146004.VkStructureType
  vkStructureTypeImageFormatListCreateInfo* {.used.} = 1000147000.VkStructureType
  vkStructureTypePhysicalDeviceBlendOperationAdvancedFeaturesExt* {.used.} = 1000148000.VkStructureType
  vkStructureTypePhysicalDeviceBlendOperationAdvancedPropertiesExt* {.used.} = 1000148001.VkStructureType
  vkStructureTypePipelineColorBlendAdvancedStateCreateInfoExt* {.used.} = 1000148002.VkStructureType
  vkStructureTypePipelineCoverageToColorStateCreateInfoNv* {.used.} = 1000149000.VkStructureType
  vkStructureTypeAccelerationStructureBuildGeometryInfoKhr* {.used.} = 1000150000.VkStructureType
  vkStructureTypeAccelerationStructureDeviceAddressInfoKhr* {.used.} = 1000150002.VkStructureType
  vkStructureTypeAccelerationStructureGeometryAabbsDataKhr* {.used.} = 1000150003.VkStructureType
  vkStructureTypeAccelerationStructureGeometryInstancesDataKhr* {.used.} = 1000150004.VkStructureType
  vkStructureTypeAccelerationStructureGeometryTrianglesDataKhr* {.used.} = 1000150005.VkStructureType
  vkStructureTypeAccelerationStructureGeometryKhr* {.used.} = 1000150006.VkStructureType
  vkStructureTypeWriteDescriptorSetAccelerationStructureKhr* {.used.} = 1000150007.VkStructureType
  vkStructureTypeAccelerationStructureVersionInfoKhr* {.used.} = 1000150009.VkStructureType
  vkStructureTypeCopyAccelerationStructureInfoKhr* {.used.} = 1000150010.VkStructureType
  vkStructureTypeCopyAccelerationStructureToMemoryInfoKhr* {.used.} = 1000150011.VkStructureType
  vkStructureTypeCopyMemoryToAccelerationStructureInfoKhr* {.used.} = 1000150012.VkStructureType
  vkStructureTypePhysicalDeviceAccelerationStructureFeaturesKhr* {.used.} = 1000150013.VkStructureType
  vkStructureTypePhysicalDeviceAccelerationStructurePropertiesKhr* {.used.} = 1000150014.VkStructureType
  vkStructureTypeRayTracingPipelineCreateInfoKhr* {.used.} = 1000150015.VkStructureType
  vkStructureTypeRayTracingShaderGroupCreateInfoKhr* {.used.} = 1000150016.VkStructureType
  vkStructureTypeAccelerationStructureCreateInfoKhr* {.used.} = 1000150017.VkStructureType
  vkStructureTypeRayTracingPipelineInterfaceCreateInfoKhr* {.used.} = 1000150018.VkStructureType
  vkStructureTypeAccelerationStructureBuildSizesInfoKhr* {.used.} = 1000150020.VkStructureType
  vkStructureTypePipelineCoverageModulationStateCreateInfoNv* {.used.} = 1000152000.VkStructureType
  vkStructureTypePhysicalDeviceShaderSmBuiltinsFeaturesNv* {.used.} = 1000154000.VkStructureType
  vkStructureTypePhysicalDeviceShaderSmBuiltinsPropertiesNv* {.used.} = 1000154001.VkStructureType
  vkStructureTypeSamplerYcbcrConversionCreateInfo* {.used.} = 1000156000.VkStructureType
  vkStructureTypeSamplerYcbcrConversionInfo* {.used.} = 1000156001.VkStructureType
  vkStructureTypeBindImagePlaneMemoryInfo* {.used.} = 1000156002.VkStructureType
  vkStructureTypeImagePlaneMemoryRequirementsInfo* {.used.} = 1000156003.VkStructureType
  vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeatures* {.used.} = 1000156004.VkStructureType
  vkStructureTypeSamplerYcbcrConversionImageFormatProperties* {.used.} = 1000156005.VkStructureType
  vkStructureTypeBindBufferMemoryInfo* {.used.} = 1000157000.VkStructureType
  vkStructureTypeBindImageMemoryInfo* {.used.} = 1000157001.VkStructureType
  vkStructureTypeDrmFormatModifierPropertiesListExt* {.used.} = 1000158000.VkStructureType
  vkStructureTypePhysicalDeviceImageDrmFormatModifierInfoExt* {.used.} = 1000158002.VkStructureType
  vkStructureTypeImageDrmFormatModifierListCreateInfoExt* {.used.} = 1000158003.VkStructureType
  vkStructureTypeImageDrmFormatModifierExplicitCreateInfoExt* {.used.} = 1000158004.VkStructureType
  vkStructureTypeImageDrmFormatModifierPropertiesExt* {.used.} = 1000158005.VkStructureType
  vkStructureTypeValidationCacheCreateInfoExt* {.used.} = 1000160000.VkStructureType
  vkStructureTypeShaderModuleValidationCacheCreateInfoExt* {.used.} = 1000160001.VkStructureType
  vkStructureTypeDescriptorSetLayoutBindingFlagsCreateInfo* {.used.} = 1000161000.VkStructureType
  vkStructureTypePhysicalDeviceDescriptorIndexingFeatures* {.used.} = 1000161001.VkStructureType
  vkStructureTypePhysicalDeviceDescriptorIndexingProperties* {.used.} = 1000161002.VkStructureType
  vkStructureTypeDescriptorSetVariableDescriptorCountAllocateInfo* {.used.} = 1000161003.VkStructureType
  vkStructureTypeDescriptorSetVariableDescriptorCountLayoutSupport* {.used.} = 1000161004.VkStructureType
  vkStructureTypePipelineViewportShadingRateImageStateCreateInfoNv* {.used.} = 1000164000.VkStructureType
  vkStructureTypePhysicalDeviceShadingRateImageFeaturesNv* {.used.} = 1000164001.VkStructureType
  vkStructureTypePhysicalDeviceShadingRateImagePropertiesNv* {.used.} = 1000164002.VkStructureType
  vkStructureTypePipelineViewportCoarseSampleOrderStateCreateInfoNv* {.used.} = 1000164005.VkStructureType
  vkStructureTypeRayTracingPipelineCreateInfoNv* {.used.} = 1000165000.VkStructureType
  vkStructureTypeAccelerationStructureCreateInfoNv* {.used.} = 1000165001.VkStructureType
  vkStructureTypeGeometryNv* {.used.} = 1000165003.VkStructureType
  vkStructureTypeGeometryTrianglesNv* {.used.} = 1000165004.VkStructureType
  vkStructureTypeGeometryAabbNv* {.used.} = 1000165005.VkStructureType
  vkStructureTypeBindAccelerationStructureMemoryInfoNv* {.used.} = 1000165006.VkStructureType
  vkStructureTypeWriteDescriptorSetAccelerationStructureNv* {.used.} = 1000165007.VkStructureType
  vkStructureTypeAccelerationStructureMemoryRequirementsInfoNv* {.used.} = 1000165008.VkStructureType
  vkStructureTypePhysicalDeviceRayTracingPropertiesNv* {.used.} = 1000165009.VkStructureType
  vkStructureTypeRayTracingShaderGroupCreateInfoNv* {.used.} = 1000165011.VkStructureType
  vkStructureTypeAccelerationStructureInfoNv* {.used.} = 1000165012.VkStructureType
  vkStructureTypePhysicalDeviceRepresentativeFragmentTestFeaturesNv* {.used.} = 1000166000.VkStructureType
  vkStructureTypePipelineRepresentativeFragmentTestStateCreateInfoNv* {.used.} = 1000166001.VkStructureType
  vkStructureTypePhysicalDeviceMaintenance3Properties* {.used.} = 1000168000.VkStructureType
  vkStructureTypeDescriptorSetLayoutSupport* {.used.} = 1000168001.VkStructureType
  vkStructureTypePhysicalDeviceImageViewImageFormatInfoExt* {.used.} = 1000170000.VkStructureType
  vkStructureTypeFilterCubicImageViewImageFormatPropertiesExt* {.used.} = 1000170001.VkStructureType
  vkStructureTypeDeviceQueueGlobalPriorityCreateInfoExt* {.used.} = 1000174000.VkStructureType
  vkStructureTypePhysicalDeviceShaderSubgroupExtendedTypesFeatures* {.used.} = 1000175000.VkStructureType
  vkStructureTypePhysicalDevice8bitStorageFeatures* {.used.} = 1000177000.VkStructureType
  vkStructureTypeImportMemoryHostPointerInfoExt* {.used.} = 1000178000.VkStructureType
  vkStructureTypeMemoryHostPointerPropertiesExt* {.used.} = 1000178001.VkStructureType
  vkStructureTypePhysicalDeviceExternalMemoryHostPropertiesExt* {.used.} = 1000178002.VkStructureType
  vkStructureTypePhysicalDeviceShaderAtomicInt64Features* {.used.} = 1000180000.VkStructureType
  vkStructureTypePhysicalDeviceShaderClockFeaturesKhr* {.used.} = 1000181000.VkStructureType
  vkStructureTypePipelineCompilerControlCreateInfoAmd* {.used.} = 1000183000.VkStructureType
  vkStructureTypeCalibratedTimestampInfoExt* {.used.} = 1000184000.VkStructureType
  vkStructureTypePhysicalDeviceShaderCorePropertiesAmd* {.used.} = 1000185000.VkStructureType
  vkStructureTypeDeviceMemoryOverallocationCreateInfoAmd* {.used.} = 1000189000.VkStructureType
  vkStructureTypePhysicalDeviceVertexAttributeDivisorPropertiesExt* {.used.} = 1000190000.VkStructureType
  vkStructureTypePipelineVertexInputDivisorStateCreateInfoExt* {.used.} = 1000190001.VkStructureType
  vkStructureTypePhysicalDeviceVertexAttributeDivisorFeaturesExt* {.used.} = 1000190002.VkStructureType
  vkStructureTypePresentFrameTokenGgp* {.used.} = 1000191000.VkStructureType
  vkStructureTypePipelineCreationFeedbackCreateInfoExt* {.used.} = 1000192000.VkStructureType
  vkStructureTypePhysicalDeviceDriverProperties* {.used.} = 1000196000.VkStructureType
  vkStructureTypePhysicalDeviceFloatControlsProperties* {.used.} = 1000197000.VkStructureType
  vkStructureTypePhysicalDeviceDepthStencilResolveProperties* {.used.} = 1000199000.VkStructureType
  vkStructureTypeSubpassDescriptionDepthStencilResolve* {.used.} = 1000199001.VkStructureType
  vkStructureTypePhysicalDeviceComputeShaderDerivativesFeaturesNv* {.used.} = 1000201000.VkStructureType
  vkStructureTypePhysicalDeviceMeshShaderFeaturesNv* {.used.} = 1000202000.VkStructureType
  vkStructureTypePhysicalDeviceMeshShaderPropertiesNv* {.used.} = 1000202001.VkStructureType
  vkStructureTypePhysicalDeviceFragmentShaderBarycentricFeaturesNv* {.used.} = 1000203000.VkStructureType
  vkStructureTypePhysicalDeviceShaderImageFootprintFeaturesNv* {.used.} = 1000204000.VkStructureType
  vkStructureTypePipelineViewportExclusiveScissorStateCreateInfoNv* {.used.} = 1000205000.VkStructureType
  vkStructureTypePhysicalDeviceExclusiveScissorFeaturesNv* {.used.} = 1000205002.VkStructureType
  vkStructureTypeCheckpointDataNv* {.used.} = 1000206000.VkStructureType
  vkStructureTypeQueueFamilyCheckpointPropertiesNv* {.used.} = 1000206001.VkStructureType
  vkStructureTypePhysicalDeviceTimelineSemaphoreFeatures* {.used.} = 1000207000.VkStructureType
  vkStructureTypePhysicalDeviceTimelineSemaphoreProperties* {.used.} = 1000207001.VkStructureType
  vkStructureTypeSemaphoreTypeCreateInfo* {.used.} = 1000207002.VkStructureType
  vkStructureTypeTimelineSemaphoreSubmitInfo* {.used.} = 1000207003.VkStructureType
  vkStructureTypeSemaphoreWaitInfo* {.used.} = 1000207004.VkStructureType
  vkStructureTypeSemaphoreSignalInfo* {.used.} = 1000207005.VkStructureType
  vkStructureTypePhysicalDeviceShaderIntegerFunctions2FeaturesIntel* {.used.} = 1000209000.VkStructureType
  vkStructureTypeQueryPoolPerformanceQueryCreateInfoIntel* {.used.} = 1000210000.VkStructureType
  vkStructureTypeInitializePerformanceApiInfoIntel* {.used.} = 1000210001.VkStructureType
  vkStructureTypePerformanceMarkerInfoIntel* {.used.} = 1000210002.VkStructureType
  vkStructureTypePerformanceStreamMarkerInfoIntel* {.used.} = 1000210003.VkStructureType
  vkStructureTypePerformanceOverrideInfoIntel* {.used.} = 1000210004.VkStructureType
  vkStructureTypePerformanceConfigurationAcquireInfoIntel* {.used.} = 1000210005.VkStructureType
  vkStructureTypePhysicalDeviceVulkanMemoryModelFeatures* {.used.} = 1000211000.VkStructureType
  vkStructureTypePhysicalDevicePciBusInfoPropertiesExt* {.used.} = 1000212000.VkStructureType
  vkStructureTypeDisplayNativeHdrSurfaceCapabilitiesAmd* {.used.} = 1000213000.VkStructureType
  vkStructureTypeSwapchainDisplayNativeHdrCreateInfoAmd* {.used.} = 1000213001.VkStructureType
  vkStructureTypeImagepipeSurfaceCreateInfoFuchsia* {.used.} = 1000214000.VkStructureType
  vkStructureTypePhysicalDeviceShaderTerminateInvocationFeaturesKhr* {.used.} = 1000215000.VkStructureType
  vkStructureTypeMetalSurfaceCreateInfoExt* {.used.} = 1000217000.VkStructureType
  vkStructureTypePhysicalDeviceFragmentDensityMapFeaturesExt* {.used.} = 1000218000.VkStructureType
  vkStructureTypePhysicalDeviceFragmentDensityMapPropertiesExt* {.used.} = 1000218001.VkStructureType
  vkStructureTypeRenderPassFragmentDensityMapCreateInfoExt* {.used.} = 1000218002.VkStructureType
  vkStructureTypePhysicalDeviceScalarBlockLayoutFeatures* {.used.} = 1000221000.VkStructureType
  vkStructureTypePhysicalDeviceSubgroupSizeControlPropertiesExt* {.used.} = 1000225000.VkStructureType
  vkStructureTypePipelineShaderStageRequiredSubgroupSizeCreateInfoExt* {.used.} = 1000225001.VkStructureType
  vkStructureTypePhysicalDeviceSubgroupSizeControlFeaturesExt* {.used.} = 1000225002.VkStructureType
  vkStructureTypeFragmentShadingRateAttachmentInfoKhr* {.used.} = 1000226000.VkStructureType
  vkStructureTypePipelineFragmentShadingRateStateCreateInfoKhr* {.used.} = 1000226001.VkStructureType
  vkStructureTypePhysicalDeviceFragmentShadingRatePropertiesKhr* {.used.} = 1000226002.VkStructureType
  vkStructureTypePhysicalDeviceFragmentShadingRateFeaturesKhr* {.used.} = 1000226003.VkStructureType
  vkStructureTypePhysicalDeviceFragmentShadingRateKhr* {.used.} = 1000226004.VkStructureType
  vkStructureTypePhysicalDeviceShaderCoreProperties2Amd* {.used.} = 1000227000.VkStructureType
  vkStructureTypePhysicalDeviceCoherentMemoryFeaturesAmd* {.used.} = 1000229000.VkStructureType
  vkStructureTypePhysicalDeviceShaderImageAtomicInt64FeaturesExt* {.used.} = 1000234000.VkStructureType
  vkStructureTypePhysicalDeviceMemoryBudgetPropertiesExt* {.used.} = 1000237000.VkStructureType
  vkStructureTypePhysicalDeviceMemoryPriorityFeaturesExt* {.used.} = 1000238000.VkStructureType
  vkStructureTypeMemoryPriorityAllocateInfoExt* {.used.} = 1000238001.VkStructureType
  vkStructureTypeSurfaceProtectedCapabilitiesKhr* {.used.} = 1000239000.VkStructureType
  vkStructureTypePhysicalDeviceDedicatedAllocationImageAliasingFeaturesNv* {.used.} = 1000240000.VkStructureType
  vkStructureTypePhysicalDeviceSeparateDepthStencilLayoutsFeatures* {.used.} = 1000241000.VkStructureType
  vkStructureTypeAttachmentReferenceStencilLayout* {.used.} = 1000241001.VkStructureType
  vkStructureTypeAttachmentDescriptionStencilLayout* {.used.} = 1000241002.VkStructureType
  vkStructureTypePhysicalDeviceBufferDeviceAddressFeaturesExt* {.used.} = 1000244000.VkStructureType
  vkStructureTypeBufferDeviceAddressInfo* {.used.} = 1000244001.VkStructureType
  vkStructureTypeBufferDeviceAddressCreateInfoExt* {.used.} = 1000244002.VkStructureType
  vkStructureTypePhysicalDeviceToolPropertiesExt* {.used.} = 1000245000.VkStructureType
  vkStructureTypeImageStencilUsageCreateInfo* {.used.} = 1000246000.VkStructureType
  vkStructureTypeValidationFeaturesExt* {.used.} = 1000247000.VkStructureType
  vkStructureTypePhysicalDeviceCooperativeMatrixFeaturesNv* {.used.} = 1000249000.VkStructureType
  vkStructureTypeCooperativeMatrixPropertiesNv* {.used.} = 1000249001.VkStructureType
  vkStructureTypePhysicalDeviceCooperativeMatrixPropertiesNv* {.used.} = 1000249002.VkStructureType
  vkStructureTypePhysicalDeviceCoverageReductionModeFeaturesNv* {.used.} = 1000250000.VkStructureType
  vkStructureTypePipelineCoverageReductionStateCreateInfoNv* {.used.} = 1000250001.VkStructureType
  vkStructureTypeFramebufferMixedSamplesCombinationNv* {.used.} = 1000250002.VkStructureType
  vkStructureTypePhysicalDeviceFragmentShaderInterlockFeaturesExt* {.used.} = 1000251000.VkStructureType
  vkStructureTypePhysicalDeviceYcbcrImageArraysFeaturesExt* {.used.} = 1000252000.VkStructureType
  vkStructureTypePhysicalDeviceUniformBufferStandardLayoutFeatures* {.used.} = 1000253000.VkStructureType
  vkStructureTypeSurfaceFullScreenExclusiveInfoExt* {.used.} = 1000255000.VkStructureType
  vkStructureTypeSurfaceFullScreenExclusiveWin32InfoExt* {.used.} = 1000255001.VkStructureType
  vkStructureTypeSurfaceCapabilitiesFullScreenExclusiveExt* {.used.} = 1000255002.VkStructureType
  vkStructureTypeHeadlessSurfaceCreateInfoExt* {.used.} = 1000256000.VkStructureType
  vkStructureTypePhysicalDeviceBufferDeviceAddressFeatures* {.used.} = 1000257000.VkStructureType
  vkStructureTypeBufferOpaqueCaptureAddressCreateInfo* {.used.} = 1000257002.VkStructureType
  vkStructureTypeMemoryOpaqueCaptureAddressAllocateInfo* {.used.} = 1000257003.VkStructureType
  vkStructureTypeDeviceMemoryOpaqueCaptureAddressInfo* {.used.} = 1000257004.VkStructureType
  vkStructureTypePhysicalDeviceLineRasterizationFeaturesExt* {.used.} = 1000259000.VkStructureType
  vkStructureTypePipelineRasterizationLineStateCreateInfoExt* {.used.} = 1000259001.VkStructureType
  vkStructureTypePhysicalDeviceLineRasterizationPropertiesExt* {.used.} = 1000259002.VkStructureType
  vkStructureTypePhysicalDeviceShaderAtomicFloatFeaturesExt* {.used.} = 1000260000.VkStructureType
  vkStructureTypePhysicalDeviceHostQueryResetFeatures* {.used.} = 1000261000.VkStructureType
  vkStructureTypePhysicalDeviceIndexTypeUint8FeaturesExt* {.used.} = 1000265000.VkStructureType
  vkStructureTypePhysicalDeviceExtendedDynamicStateFeaturesExt* {.used.} = 1000267000.VkStructureType
  vkStructureTypePhysicalDevicePipelineExecutablePropertiesFeaturesKhr* {.used.} = 1000269000.VkStructureType
  vkStructureTypePipelineInfoKhr* {.used.} = 1000269001.VkStructureType
  vkStructureTypePipelineExecutablePropertiesKhr* {.used.} = 1000269002.VkStructureType
  vkStructureTypePipelineExecutableInfoKhr* {.used.} = 1000269003.VkStructureType
  vkStructureTypePipelineExecutableStatisticKhr* {.used.} = 1000269004.VkStructureType
  vkStructureTypePipelineExecutableInternalRepresentationKhr* {.used.} = 1000269005.VkStructureType
  vkStructureTypePhysicalDeviceShaderDemoteToHelperInvocationFeaturesExt* {.used.} = 1000276000.VkStructureType
  vkStructureTypePhysicalDeviceDeviceGeneratedCommandsPropertiesNv* {.used.} = 1000277000.VkStructureType
  vkStructureTypeGraphicsShaderGroupCreateInfoNv* {.used.} = 1000277001.VkStructureType
  vkStructureTypeGraphicsPipelineShaderGroupsCreateInfoNv* {.used.} = 1000277002.VkStructureType
  vkStructureTypeIndirectCommandsLayoutTokenNv* {.used.} = 1000277003.VkStructureType
  vkStructureTypeIndirectCommandsLayoutCreateInfoNv* {.used.} = 1000277004.VkStructureType
  vkStructureTypeGeneratedCommandsInfoNv* {.used.} = 1000277005.VkStructureType
  vkStructureTypeGeneratedCommandsMemoryRequirementsInfoNv* {.used.} = 1000277006.VkStructureType
  vkStructureTypePhysicalDeviceDeviceGeneratedCommandsFeaturesNv* {.used.} = 1000277007.VkStructureType
  vkStructureTypePhysicalDeviceTexelBufferAlignmentFeaturesExt* {.used.} = 1000281000.VkStructureType
  vkStructureTypePhysicalDeviceTexelBufferAlignmentPropertiesExt* {.used.} = 1000281001.VkStructureType
  vkStructureTypeCommandBufferInheritanceRenderPassTransformInfoQcom* {.used.} = 1000282000.VkStructureType
  vkStructureTypeRenderPassTransformBeginInfoQcom* {.used.} = 1000282001.VkStructureType
  vkStructureTypePhysicalDeviceDeviceMemoryReportFeaturesExt* {.used.} = 1000284000.VkStructureType
  vkStructureTypeDeviceDeviceMemoryReportCreateInfoExt* {.used.} = 1000284001.VkStructureType
  vkStructureTypeDeviceMemoryReportCallbackDataExt* {.used.} = 1000284002.VkStructureType
  vkStructureTypePhysicalDeviceRobustness2FeaturesExt* {.used.} = 1000286000.VkStructureType
  vkStructureTypePhysicalDeviceRobustness2PropertiesExt* {.used.} = 1000286001.VkStructureType
  vkStructureTypeSamplerCustomBorderColorCreateInfoExt* {.used.} = 1000287000.VkStructureType
  vkStructureTypePhysicalDeviceCustomBorderColorPropertiesExt* {.used.} = 1000287001.VkStructureType
  vkStructureTypePhysicalDeviceCustomBorderColorFeaturesExt* {.used.} = 1000287002.VkStructureType
  vkStructureTypePipelineLibraryCreateInfoKhr* {.used.} = 1000290000.VkStructureType
  vkStructureTypePhysicalDevicePrivateDataFeaturesExt* {.used.} = 1000295000.VkStructureType
  vkStructureTypeDevicePrivateDataCreateInfoExt* {.used.} = 1000295001.VkStructureType
  vkStructureTypePrivateDataSlotCreateInfoExt* {.used.} = 1000295002.VkStructureType
  vkStructureTypePhysicalDevicePipelineCreationCacheControlFeaturesExt* {.used.} = 1000297000.VkStructureType
  vkStructureTypePhysicalDeviceDiagnosticsConfigFeaturesNv* {.used.} = 1000300000.VkStructureType
  vkStructureTypeDeviceDiagnosticsConfigCreateInfoNv* {.used.} = 1000300001.VkStructureType
  vkStructureTypeMemoryBarrier2Khr* {.used.} = 1000314000.VkStructureType
  vkStructureTypeBufferMemoryBarrier2Khr* {.used.} = 1000314001.VkStructureType
  vkStructureTypeImageMemoryBarrier2Khr* {.used.} = 1000314002.VkStructureType
  vkStructureTypeDependencyInfoKhr* {.used.} = 1000314003.VkStructureType
  vkStructureTypeSubmitInfo2Khr* {.used.} = 1000314004.VkStructureType
  vkStructureTypeSemaphoreSubmitInfoKhr* {.used.} = 1000314005.VkStructureType
  vkStructureTypeCommandBufferSubmitInfoKhr* {.used.} = 1000314006.VkStructureType
  vkStructureTypePhysicalDeviceSynchronization2FeaturesKhr* {.used.} = 1000314007.VkStructureType
  vkStructureTypeQueueFamilyCheckpointProperties2Nv* {.used.} = 1000314008.VkStructureType
  vkStructureTypeCheckpointData2Nv* {.used.} = 1000314009.VkStructureType
  vkStructureTypePhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKhr* {.used.} = 1000325000.VkStructureType
  vkStructureTypePhysicalDeviceFragmentShadingRateEnumsPropertiesNv* {.used.} = 1000326000.VkStructureType
  vkStructureTypePhysicalDeviceFragmentShadingRateEnumsFeaturesNv* {.used.} = 1000326001.VkStructureType
  vkStructureTypePipelineFragmentShadingRateEnumStateCreateInfoNv* {.used.} = 1000326002.VkStructureType
  vkStructureTypePhysicalDeviceFragmentDensityMap2FeaturesExt* {.used.} = 1000332000.VkStructureType
  vkStructureTypePhysicalDeviceFragmentDensityMap2PropertiesExt* {.used.} = 1000332001.VkStructureType
  vkStructureTypeCopyCommandTransformInfoQcom* {.used.} = 1000333000.VkStructureType
  vkStructureTypePhysicalDeviceImageRobustnessFeaturesExt* {.used.} = 1000335000.VkStructureType
  vkStructureTypePhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKhr* {.used.} = 1000336000.VkStructureType
  vkStructureTypeCopyBufferInfo2Khr* {.used.} = 1000337000.VkStructureType
  vkStructureTypeCopyImageInfo2Khr* {.used.} = 1000337001.VkStructureType
  vkStructureTypeCopyBufferToImageInfo2Khr* {.used.} = 1000337002.VkStructureType
  vkStructureTypeCopyImageToBufferInfo2Khr* {.used.} = 1000337003.VkStructureType
  vkStructureTypeBlitImageInfo2Khr* {.used.} = 1000337004.VkStructureType
  vkStructureTypeResolveImageInfo2Khr* {.used.} = 1000337005.VkStructureType
  vkStructureTypeBufferCopy2Khr* {.used.} = 1000337006.VkStructureType
  vkStructureTypeImageCopy2Khr* {.used.} = 1000337007.VkStructureType
  vkStructureTypeImageBlit2Khr* {.used.} = 1000337008.VkStructureType
  vkStructureTypeBufferImageCopy2Khr* {.used.} = 1000337009.VkStructureType
  vkStructureTypeImageResolve2Khr* {.used.} = 1000337010.VkStructureType
  vkStructureTypePhysicalDevice4444FormatsFeaturesExt* {.used.} = 1000340000.VkStructureType
  vkStructureTypeDirectfbSurfaceCreateInfoExt* {.used.} = 1000346000.VkStructureType
  vkStructureTypePhysicalDeviceRayTracingPipelineFeaturesKhr* {.used.} = 1000347000.VkStructureType
  vkStructureTypePhysicalDeviceRayTracingPipelinePropertiesKhr* {.used.} = 1000347001.VkStructureType
  vkStructureTypePhysicalDeviceRayQueryFeaturesKhr* {.used.} = 1000348013.VkStructureType
  vkStructureTypePhysicalDeviceMutableDescriptorTypeFeaturesValve* {.used.} = 1000351000.VkStructureType
  vkStructureTypeMutableDescriptorTypeCreateInfoValve* {.used.} = 1000351002.VkStructureType
  vkStructureTypeScreenSurfaceCreateInfoQnx* {.used.} = 1000378000.VkStructureType
  vkStructureTypePhysicalDeviceVariablePointerFeatures* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceVariablePointersFeatures
  vkStructureTypePhysicalDeviceShaderDrawParameterFeatures* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceShaderDrawParametersFeatures
  vkStructureTypeDebugReportCreateInfoExt* {.used.}: VkStructureType = vkStructureTypeDebugReportCallbackCreateInfoExt
  vkStructureTypeRenderPassMultiviewCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeRenderPassMultiviewCreateInfo
  vkStructureTypePhysicalDeviceMultiviewFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceMultiviewFeatures
  vkStructureTypePhysicalDeviceMultiviewPropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceMultiviewProperties
  vkStructureTypePhysicalDeviceFeatures2Khr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceFeatures2
  vkStructureTypePhysicalDeviceProperties2Khr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceProperties2
  vkStructureTypeFormatProperties2Khr* {.used.}: VkStructureType = vkStructureTypeFormatProperties2
  vkStructureTypeImageFormatProperties2Khr* {.used.}: VkStructureType = vkStructureTypeImageFormatProperties2
  vkStructureTypePhysicalDeviceImageFormatInfo2Khr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceImageFormatInfo2
  vkStructureTypeQueueFamilyProperties2Khr* {.used.}: VkStructureType = vkStructureTypeQueueFamilyProperties2
  vkStructureTypePhysicalDeviceMemoryProperties2Khr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceMemoryProperties2
  vkStructureTypeSparseImageFormatProperties2Khr* {.used.}: VkStructureType = vkStructureTypeSparseImageFormatProperties2
  vkStructureTypePhysicalDeviceSparseImageFormatInfo2Khr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceSparseImageFormatInfo2
  vkStructureTypeMemoryAllocateFlagsInfoKhr* {.used.}: VkStructureType = vkStructureTypeMemoryAllocateFlagsInfo
  vkStructureTypeDeviceGroupRenderPassBeginInfoKhr* {.used.}: VkStructureType = vkStructureTypeDeviceGroupRenderPassBeginInfo
  vkStructureTypeDeviceGroupCommandBufferBeginInfoKhr* {.used.}: VkStructureType = vkStructureTypeDeviceGroupCommandBufferBeginInfo
  vkStructureTypeDeviceGroupSubmitInfoKhr* {.used.}: VkStructureType = vkStructureTypeDeviceGroupSubmitInfo
  vkStructureTypeDeviceGroupBindSparseInfoKhr* {.used.}: VkStructureType = vkStructureTypeDeviceGroupBindSparseInfo
  vkStructureTypeBindBufferMemoryDeviceGroupInfoKhr* {.used.}: VkStructureType = vkStructureTypeBindBufferMemoryDeviceGroupInfo
  vkStructureTypeBindImageMemoryDeviceGroupInfoKhr* {.used.}: VkStructureType = vkStructureTypeBindImageMemoryDeviceGroupInfo
  vkStructureTypePhysicalDeviceGroupPropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceGroupProperties
  vkStructureTypeDeviceGroupDeviceCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeDeviceGroupDeviceCreateInfo
  vkStructureTypePhysicalDeviceExternalImageFormatInfoKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceExternalImageFormatInfo
  vkStructureTypeExternalImageFormatPropertiesKhr* {.used.}: VkStructureType = vkStructureTypeExternalImageFormatProperties
  vkStructureTypePhysicalDeviceExternalBufferInfoKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceExternalBufferInfo
  vkStructureTypeExternalBufferPropertiesKhr* {.used.}: VkStructureType = vkStructureTypeExternalBufferProperties
  vkStructureTypePhysicalDeviceIdPropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceIdProperties
  vkStructureTypeExternalMemoryBufferCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeExternalMemoryBufferCreateInfo
  vkStructureTypeExternalMemoryImageCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeExternalMemoryImageCreateInfo
  vkStructureTypeExportMemoryAllocateInfoKhr* {.used.}: VkStructureType = vkStructureTypeExportMemoryAllocateInfo
  vkStructureTypePhysicalDeviceExternalSemaphoreInfoKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceExternalSemaphoreInfo
  vkStructureTypeExternalSemaphorePropertiesKhr* {.used.}: VkStructureType = vkStructureTypeExternalSemaphoreProperties
  vkStructureTypeExportSemaphoreCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeExportSemaphoreCreateInfo
  vkStructureTypePhysicalDeviceShaderFloat16Int8FeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceShaderFloat16Int8Features
  vkStructureTypePhysicalDeviceFloat16Int8FeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceShaderFloat16Int8Features
  vkStructureTypePhysicalDevice16bitStorageFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDevice16bitStorageFeatures
  vkStructureTypeDescriptorUpdateTemplateCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeDescriptorUpdateTemplateCreateInfo
  vkStructureTypePhysicalDeviceImagelessFramebufferFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceImagelessFramebufferFeatures
  vkStructureTypeFramebufferAttachmentsCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeFramebufferAttachmentsCreateInfo
  vkStructureTypeFramebufferAttachmentImageInfoKhr* {.used.}: VkStructureType = vkStructureTypeFramebufferAttachmentImageInfo
  vkStructureTypeRenderPassAttachmentBeginInfoKhr* {.used.}: VkStructureType = vkStructureTypeRenderPassAttachmentBeginInfo
  vkStructureTypeAttachmentDescription2Khr* {.used.}: VkStructureType = vkStructureTypeAttachmentDescription2
  vkStructureTypeAttachmentReference2Khr* {.used.}: VkStructureType = vkStructureTypeAttachmentReference2
  vkStructureTypeSubpassDescription2Khr* {.used.}: VkStructureType = vkStructureTypeSubpassDescription2
  vkStructureTypeSubpassDependency2Khr* {.used.}: VkStructureType = vkStructureTypeSubpassDependency2
  vkStructureTypeRenderPassCreateInfo2Khr* {.used.}: VkStructureType = vkStructureTypeRenderPassCreateInfo2
  vkStructureTypeSubpassBeginInfoKhr* {.used.}: VkStructureType = vkStructureTypeSubpassBeginInfo
  vkStructureTypeSubpassEndInfoKhr* {.used.}: VkStructureType = vkStructureTypeSubpassEndInfo
  vkStructureTypePhysicalDeviceExternalFenceInfoKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceExternalFenceInfo
  vkStructureTypeExternalFencePropertiesKhr* {.used.}: VkStructureType = vkStructureTypeExternalFenceProperties
  vkStructureTypeExportFenceCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeExportFenceCreateInfo
  vkStructureTypePhysicalDevicePointClippingPropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDevicePointClippingProperties
  vkStructureTypeRenderPassInputAttachmentAspectCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeRenderPassInputAttachmentAspectCreateInfo
  vkStructureTypeImageViewUsageCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeImageViewUsageCreateInfo
  vkStructureTypePipelineTessellationDomainOriginStateCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypePipelineTessellationDomainOriginStateCreateInfo
  vkStructureTypePhysicalDeviceVariablePointersFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceVariablePointersFeatures
  vkStructureTypePhysicalDeviceVariablePointerFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceVariablePointersFeaturesKhr
  vkStructureTypeMemoryDedicatedRequirementsKhr* {.used.}: VkStructureType = vkStructureTypeMemoryDedicatedRequirements
  vkStructureTypeMemoryDedicatedAllocateInfoKhr* {.used.}: VkStructureType = vkStructureTypeMemoryDedicatedAllocateInfo
  vkStructureTypePhysicalDeviceSamplerFilterMinmaxPropertiesExt* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceSamplerFilterMinmaxProperties
  vkStructureTypeSamplerReductionModeCreateInfoExt* {.used.}: VkStructureType = vkStructureTypeSamplerReductionModeCreateInfo
  vkStructureTypeBufferMemoryRequirementsInfo2Khr* {.used.}: VkStructureType = vkStructureTypeBufferMemoryRequirementsInfo2
  vkStructureTypeImageMemoryRequirementsInfo2Khr* {.used.}: VkStructureType = vkStructureTypeImageMemoryRequirementsInfo2
  vkStructureTypeImageSparseMemoryRequirementsInfo2Khr* {.used.}: VkStructureType = vkStructureTypeImageSparseMemoryRequirementsInfo2
  vkStructureTypeMemoryRequirements2Khr* {.used.}: VkStructureType = vkStructureTypeMemoryRequirements2
  vkStructureTypeSparseImageMemoryRequirements2Khr* {.used.}: VkStructureType = vkStructureTypeSparseImageMemoryRequirements2
  vkStructureTypeImageFormatListCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeImageFormatListCreateInfo
  vkStructureTypeSamplerYcbcrConversionCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeSamplerYcbcrConversionCreateInfo
  vkStructureTypeSamplerYcbcrConversionInfoKhr* {.used.}: VkStructureType = vkStructureTypeSamplerYcbcrConversionInfo
  vkStructureTypeBindImagePlaneMemoryInfoKhr* {.used.}: VkStructureType = vkStructureTypeBindImagePlaneMemoryInfo
  vkStructureTypeImagePlaneMemoryRequirementsInfoKhr* {.used.}: VkStructureType = vkStructureTypeImagePlaneMemoryRequirementsInfo
  vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeatures
  vkStructureTypeSamplerYcbcrConversionImageFormatPropertiesKhr* {.used.}: VkStructureType = vkStructureTypeSamplerYcbcrConversionImageFormatProperties
  vkStructureTypeBindBufferMemoryInfoKhr* {.used.}: VkStructureType = vkStructureTypeBindBufferMemoryInfo
  vkStructureTypeBindImageMemoryInfoKhr* {.used.}: VkStructureType = vkStructureTypeBindImageMemoryInfo
  vkStructureTypeDescriptorSetLayoutBindingFlagsCreateInfoExt* {.used.}: VkStructureType = vkStructureTypeDescriptorSetLayoutBindingFlagsCreateInfo
  vkStructureTypePhysicalDeviceDescriptorIndexingFeaturesExt* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceDescriptorIndexingFeatures
  vkStructureTypePhysicalDeviceDescriptorIndexingPropertiesExt* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceDescriptorIndexingProperties
  vkStructureTypeDescriptorSetVariableDescriptorCountAllocateInfoExt* {.used.}: VkStructureType = vkStructureTypeDescriptorSetVariableDescriptorCountAllocateInfo
  vkStructureTypeDescriptorSetVariableDescriptorCountLayoutSupportExt* {.used.}: VkStructureType = vkStructureTypeDescriptorSetVariableDescriptorCountLayoutSupport
  vkStructureTypePhysicalDeviceMaintenance3PropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceMaintenance3Properties
  vkStructureTypeDescriptorSetLayoutSupportKhr* {.used.}: VkStructureType = vkStructureTypeDescriptorSetLayoutSupport
  vkStructureTypePhysicalDeviceShaderSubgroupExtendedTypesFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceShaderSubgroupExtendedTypesFeatures
  vkStructureTypePhysicalDevice8bitStorageFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDevice8bitStorageFeatures
  vkStructureTypePhysicalDeviceShaderAtomicInt64FeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceShaderAtomicInt64Features
  vkStructureTypePhysicalDeviceDriverPropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceDriverProperties
  vkStructureTypePhysicalDeviceFloatControlsPropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceFloatControlsProperties
  vkStructureTypePhysicalDeviceDepthStencilResolvePropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceDepthStencilResolveProperties
  vkStructureTypeSubpassDescriptionDepthStencilResolveKhr* {.used.}: VkStructureType = vkStructureTypeSubpassDescriptionDepthStencilResolve
  vkStructureTypePhysicalDeviceTimelineSemaphoreFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceTimelineSemaphoreFeatures
  vkStructureTypePhysicalDeviceTimelineSemaphorePropertiesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceTimelineSemaphoreProperties
  vkStructureTypeSemaphoreTypeCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeSemaphoreTypeCreateInfo
  vkStructureTypeTimelineSemaphoreSubmitInfoKhr* {.used.}: VkStructureType = vkStructureTypeTimelineSemaphoreSubmitInfo
  vkStructureTypeSemaphoreWaitInfoKhr* {.used.}: VkStructureType = vkStructureTypeSemaphoreWaitInfo
  vkStructureTypeSemaphoreSignalInfoKhr* {.used.}: VkStructureType = vkStructureTypeSemaphoreSignalInfo
  vkStructureTypeQueryPoolCreateInfoIntel* {.used.}: VkStructureType = vkStructureTypeQueryPoolPerformanceQueryCreateInfoIntel
  vkStructureTypePhysicalDeviceVulkanMemoryModelFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceVulkanMemoryModelFeatures
  vkStructureTypePhysicalDeviceScalarBlockLayoutFeaturesExt* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceScalarBlockLayoutFeatures
  vkStructureTypePhysicalDeviceSeparateDepthStencilLayoutsFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceSeparateDepthStencilLayoutsFeatures
  vkStructureTypeAttachmentReferenceStencilLayoutKhr* {.used.}: VkStructureType = vkStructureTypeAttachmentReferenceStencilLayout
  vkStructureTypeAttachmentDescriptionStencilLayoutKhr* {.used.}: VkStructureType = vkStructureTypeAttachmentDescriptionStencilLayout
  vkStructureTypePhysicalDeviceBufferAddressFeaturesExt* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceBufferDeviceAddressFeaturesExt
  vkStructureTypeBufferDeviceAddressInfoExt* {.used.}: VkStructureType = vkStructureTypeBufferDeviceAddressInfo
  vkStructureTypeImageStencilUsageCreateInfoExt* {.used.}: VkStructureType = vkStructureTypeImageStencilUsageCreateInfo
  vkStructureTypePhysicalDeviceUniformBufferStandardLayoutFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceUniformBufferStandardLayoutFeatures
  vkStructureTypePhysicalDeviceBufferDeviceAddressFeaturesKhr* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceBufferDeviceAddressFeatures
  vkStructureTypeBufferDeviceAddressInfoKhr* {.used.}: VkStructureType = vkStructureTypeBufferDeviceAddressInfo
  vkStructureTypeBufferOpaqueCaptureAddressCreateInfoKhr* {.used.}: VkStructureType = vkStructureTypeBufferOpaqueCaptureAddressCreateInfo
  vkStructureTypeMemoryOpaqueCaptureAddressAllocateInfoKhr* {.used.}: VkStructureType = vkStructureTypeMemoryOpaqueCaptureAddressAllocateInfo
  vkStructureTypeDeviceMemoryOpaqueCaptureAddressInfoKhr* {.used.}: VkStructureType = vkStructureTypeDeviceMemoryOpaqueCaptureAddressInfo
  vkStructureTypePhysicalDeviceHostQueryResetFeaturesExt* {.used.}: VkStructureType = vkStructureTypePhysicalDeviceHostQueryResetFeatures
  vkStructureTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkStructureType

const
  vkImageLayoutUndefined* {.used.} = 0.VkImageLayout
  vkImageLayoutGeneral* {.used.} = 1.VkImageLayout
  vkImageLayoutColorAttachmentOptimal* {.used.} = 2.VkImageLayout
  vkImageLayoutDepthStencilAttachmentOptimal* {.used.} = 3.VkImageLayout
  vkImageLayoutDepthStencilReadOnlyOptimal* {.used.} = 4.VkImageLayout
  vkImageLayoutShaderReadOnlyOptimal* {.used.} = 5.VkImageLayout
  vkImageLayoutTransferSrcOptimal* {.used.} = 6.VkImageLayout
  vkImageLayoutTransferDstOptimal* {.used.} = 7.VkImageLayout
  vkImageLayoutPreinitialized* {.used.} = 8.VkImageLayout
  vkImageLayoutPresentSrcKhr* {.used.} = 1000001002.VkImageLayout
  vkImageLayoutSharedPresentKhr* {.used.} = 1000111000.VkImageLayout
  vkImageLayoutDepthReadOnlyStencilAttachmentOptimal* {.used.} = 1000117000.VkImageLayout
  vkImageLayoutDepthAttachmentStencilReadOnlyOptimal* {.used.} = 1000117001.VkImageLayout
  vkImageLayoutShadingRateOptimalNv* {.used.} = 1000164003.VkImageLayout
  vkImageLayoutFragmentDensityMapOptimalExt* {.used.} = 1000218000.VkImageLayout
  vkImageLayoutDepthAttachmentOptimal* {.used.} = 1000241000.VkImageLayout
  vkImageLayoutDepthReadOnlyOptimal* {.used.} = 1000241001.VkImageLayout
  vkImageLayoutStencilAttachmentOptimal* {.used.} = 1000241002.VkImageLayout
  vkImageLayoutStencilReadOnlyOptimal* {.used.} = 1000241003.VkImageLayout
  vkImageLayoutReadOnlyOptimalKhr* {.used.} = 1000314000.VkImageLayout
  vkImageLayoutAttachmentOptimalKhr* {.used.} = 1000314001.VkImageLayout
  vkImageLayoutDepthReadOnlyStencilAttachmentOptimalKhr* {.used.}: VkImageLayout = vkImageLayoutDepthReadOnlyStencilAttachmentOptimal
  vkImageLayoutDepthAttachmentStencilReadOnlyOptimalKhr* {.used.}: VkImageLayout = vkImageLayoutDepthAttachmentStencilReadOnlyOptimal
  vkImageLayoutFragmentShadingRateAttachmentOptimalKhr* {.used.}: VkImageLayout = vkImageLayoutShadingRateOptimalNv
  vkImageLayoutDepthAttachmentOptimalKhr* {.used.}: VkImageLayout = vkImageLayoutDepthAttachmentOptimal
  vkImageLayoutDepthReadOnlyOptimalKhr* {.used.}: VkImageLayout = vkImageLayoutDepthReadOnlyOptimal
  vkImageLayoutStencilAttachmentOptimalKhr* {.used.}: VkImageLayout = vkImageLayoutStencilAttachmentOptimal
  vkImageLayoutStencilReadOnlyOptimalKhr* {.used.}: VkImageLayout = vkImageLayoutStencilReadOnlyOptimal
  vkImageLayoutMaxEnum* {.used.} = 0x7FFFFFFF.VkImageLayout

const
  vkObjectTypeUnknown* {.used.} = 0.VkObjectType
  vkObjectTypeInstance* {.used.} = 1.VkObjectType
  vkObjectTypePhysicalDevice* {.used.} = 2.VkObjectType
  vkObjectTypeDevice* {.used.} = 3.VkObjectType
  vkObjectTypeQueue* {.used.} = 4.VkObjectType
  vkObjectTypeSemaphore* {.used.} = 5.VkObjectType
  vkObjectTypeCommandBuffer* {.used.} = 6.VkObjectType
  vkObjectTypeFence* {.used.} = 7.VkObjectType
  vkObjectTypeDeviceMemory* {.used.} = 8.VkObjectType
  vkObjectTypeBuffer* {.used.} = 9.VkObjectType
  vkObjectTypeImage* {.used.} = 10.VkObjectType
  vkObjectTypeEvent* {.used.} = 11.VkObjectType
  vkObjectTypeQueryPool* {.used.} = 12.VkObjectType
  vkObjectTypeBufferView* {.used.} = 13.VkObjectType
  vkObjectTypeImageView* {.used.} = 14.VkObjectType
  vkObjectTypeShaderModule* {.used.} = 15.VkObjectType
  vkObjectTypePipelineCache* {.used.} = 16.VkObjectType
  vkObjectTypePipelineLayout* {.used.} = 17.VkObjectType
  vkObjectTypeRenderPass* {.used.} = 18.VkObjectType
  vkObjectTypePipeline* {.used.} = 19.VkObjectType
  vkObjectTypeDescriptorSetLayout* {.used.} = 20.VkObjectType
  vkObjectTypeSampler* {.used.} = 21.VkObjectType
  vkObjectTypeDescriptorPool* {.used.} = 22.VkObjectType
  vkObjectTypeDescriptorSet* {.used.} = 23.VkObjectType
  vkObjectTypeFramebuffer* {.used.} = 24.VkObjectType
  vkObjectTypeCommandPool* {.used.} = 25.VkObjectType
  vkObjectTypeSurfaceKhr* {.used.} = 1000000000.VkObjectType
  vkObjectTypeSwapchainKhr* {.used.} = 1000001000.VkObjectType
  vkObjectTypeDisplayKhr* {.used.} = 1000002000.VkObjectType
  vkObjectTypeDisplayModeKhr* {.used.} = 1000002001.VkObjectType
  vkObjectTypeDebugReportCallbackExt* {.used.} = 1000011000.VkObjectType
  vkObjectTypeDescriptorUpdateTemplate* {.used.} = 1000085000.VkObjectType
  vkObjectTypeDebugUtilsMessengerExt* {.used.} = 1000128000.VkObjectType
  vkObjectTypeAccelerationStructureKhr* {.used.} = 1000150000.VkObjectType
  vkObjectTypeSamplerYcbcrConversion* {.used.} = 1000156000.VkObjectType
  vkObjectTypeValidationCacheExt* {.used.} = 1000160000.VkObjectType
  vkObjectTypeAccelerationStructureNv* {.used.} = 1000165000.VkObjectType
  vkObjectTypePerformanceConfigurationIntel* {.used.} = 1000210000.VkObjectType
  vkObjectTypeDeferredOperationKhr* {.used.} = 1000268000.VkObjectType
  vkObjectTypeIndirectCommandsLayoutNv* {.used.} = 1000277000.VkObjectType
  vkObjectTypePrivateDataSlotExt* {.used.} = 1000295000.VkObjectType
  vkObjectTypeDescriptorUpdateTemplateKhr* {.used.}: VkObjectType = vkObjectTypeDescriptorUpdateTemplate
  vkObjectTypeSamplerYcbcrConversionKhr* {.used.}: VkObjectType = vkObjectTypeSamplerYcbcrConversion
  vkObjectTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkObjectType

const
  vkVendorIdViv* {.used.} = 0x00010001.VkVendorId
  vkVendorIdVsi* {.used.} = 0x00010002.VkVendorId
  vkVendorIdKazan* {.used.} = 0x00010003.VkVendorId
  vkVendorIdCodeplay* {.used.} = 0x00010004.VkVendorId
  vkVendorIdMesa* {.used.} = 0x00010005.VkVendorId
  vkVendorIdPocl* {.used.} = 0x00010006.VkVendorId
  vkVendorIdMaxEnum* {.used.} = 0x7FFFFFFF.VkVendorId

const
  vkPipelineCacheHeaderVersionOne* {.used.} = 1.VkPipelineCacheHeaderVersion
  vkPipelineCacheHeaderVersionMaxEnum* {.used.} = 0x7FFFFFFF.VkPipelineCacheHeaderVersion

const
  vkSystemAllocationScopeCommand* {.used.} = 0.VkSystemAllocationScope
  vkSystemAllocationScopeObject* {.used.} = 1.VkSystemAllocationScope
  vkSystemAllocationScopeCache* {.used.} = 2.VkSystemAllocationScope
  vkSystemAllocationScopeDevice* {.used.} = 3.VkSystemAllocationScope
  vkSystemAllocationScopeInstance* {.used.} = 4.VkSystemAllocationScope
  vkSystemAllocationScopeMaxEnum* {.used.} = 0x7FFFFFFF.VkSystemAllocationScope

const
  vkInternalAllocationTypeExecutable* {.used.} = 0.VkInternalAllocationType
  vkInternalAllocationTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkInternalAllocationType

const
  vkFormatUndefined* {.used.} = 0.VkFormat
  vkFormatR4g4UnormPack8* {.used.} = 1.VkFormat
  vkFormatR4g4b4a4UnormPack16* {.used.} = 2.VkFormat
  vkFormatB4g4r4a4UnormPack16* {.used.} = 3.VkFormat
  vkFormatR5g6b5UnormPack16* {.used.} = 4.VkFormat
  vkFormatB5g6r5UnormPack16* {.used.} = 5.VkFormat
  vkFormatR5g5b5a1UnormPack16* {.used.} = 6.VkFormat
  vkFormatB5g5r5a1UnormPack16* {.used.} = 7.VkFormat
  vkFormatA1r5g5b5UnormPack16* {.used.} = 8.VkFormat
  vkFormatR8Unorm* {.used.} = 9.VkFormat
  vkFormatR8Snorm* {.used.} = 10.VkFormat
  vkFormatR8Uscaled* {.used.} = 11.VkFormat
  vkFormatR8Sscaled* {.used.} = 12.VkFormat
  vkFormatR8Uint* {.used.} = 13.VkFormat
  vkFormatR8Sint* {.used.} = 14.VkFormat
  vkFormatR8Srgb* {.used.} = 15.VkFormat
  vkFormatR8g8Unorm* {.used.} = 16.VkFormat
  vkFormatR8g8Snorm* {.used.} = 17.VkFormat
  vkFormatR8g8Uscaled* {.used.} = 18.VkFormat
  vkFormatR8g8Sscaled* {.used.} = 19.VkFormat
  vkFormatR8g8Uint* {.used.} = 20.VkFormat
  vkFormatR8g8Sint* {.used.} = 21.VkFormat
  vkFormatR8g8Srgb* {.used.} = 22.VkFormat
  vkFormatR8g8b8Unorm* {.used.} = 23.VkFormat
  vkFormatR8g8b8Snorm* {.used.} = 24.VkFormat
  vkFormatR8g8b8Uscaled* {.used.} = 25.VkFormat
  vkFormatR8g8b8Sscaled* {.used.} = 26.VkFormat
  vkFormatR8g8b8Uint* {.used.} = 27.VkFormat
  vkFormatR8g8b8Sint* {.used.} = 28.VkFormat
  vkFormatR8g8b8Srgb* {.used.} = 29.VkFormat
  vkFormatB8g8r8Unorm* {.used.} = 30.VkFormat
  vkFormatB8g8r8Snorm* {.used.} = 31.VkFormat
  vkFormatB8g8r8Uscaled* {.used.} = 32.VkFormat
  vkFormatB8g8r8Sscaled* {.used.} = 33.VkFormat
  vkFormatB8g8r8Uint* {.used.} = 34.VkFormat
  vkFormatB8g8r8Sint* {.used.} = 35.VkFormat
  vkFormatB8g8r8Srgb* {.used.} = 36.VkFormat
  vkFormatR8g8b8a8Unorm* {.used.} = 37.VkFormat
  vkFormatR8g8b8a8Snorm* {.used.} = 38.VkFormat
  vkFormatR8g8b8a8Uscaled* {.used.} = 39.VkFormat
  vkFormatR8g8b8a8Sscaled* {.used.} = 40.VkFormat
  vkFormatR8g8b8a8Uint* {.used.} = 41.VkFormat
  vkFormatR8g8b8a8Sint* {.used.} = 42.VkFormat
  vkFormatR8g8b8a8Srgb* {.used.} = 43.VkFormat
  vkFormatB8g8r8a8Unorm* {.used.} = 44.VkFormat
  vkFormatB8g8r8a8Snorm* {.used.} = 45.VkFormat
  vkFormatB8g8r8a8Uscaled* {.used.} = 46.VkFormat
  vkFormatB8g8r8a8Sscaled* {.used.} = 47.VkFormat
  vkFormatB8g8r8a8Uint* {.used.} = 48.VkFormat
  vkFormatB8g8r8a8Sint* {.used.} = 49.VkFormat
  vkFormatB8g8r8a8Srgb* {.used.} = 50.VkFormat
  vkFormatA8b8g8r8UnormPack32* {.used.} = 51.VkFormat
  vkFormatA8b8g8r8SnormPack32* {.used.} = 52.VkFormat
  vkFormatA8b8g8r8UscaledPack32* {.used.} = 53.VkFormat
  vkFormatA8b8g8r8SscaledPack32* {.used.} = 54.VkFormat
  vkFormatA8b8g8r8UintPack32* {.used.} = 55.VkFormat
  vkFormatA8b8g8r8SintPack32* {.used.} = 56.VkFormat
  vkFormatA8b8g8r8SrgbPack32* {.used.} = 57.VkFormat
  vkFormatA2r10g10b10UnormPack32* {.used.} = 58.VkFormat
  vkFormatA2r10g10b10SnormPack32* {.used.} = 59.VkFormat
  vkFormatA2r10g10b10UscaledPack32* {.used.} = 60.VkFormat
  vkFormatA2r10g10b10SscaledPack32* {.used.} = 61.VkFormat
  vkFormatA2r10g10b10UintPack32* {.used.} = 62.VkFormat
  vkFormatA2r10g10b10SintPack32* {.used.} = 63.VkFormat
  vkFormatA2b10g10r10UnormPack32* {.used.} = 64.VkFormat
  vkFormatA2b10g10r10SnormPack32* {.used.} = 65.VkFormat
  vkFormatA2b10g10r10UscaledPack32* {.used.} = 66.VkFormat
  vkFormatA2b10g10r10SscaledPack32* {.used.} = 67.VkFormat
  vkFormatA2b10g10r10UintPack32* {.used.} = 68.VkFormat
  vkFormatA2b10g10r10SintPack32* {.used.} = 69.VkFormat
  vkFormatR16Unorm* {.used.} = 70.VkFormat
  vkFormatR16Snorm* {.used.} = 71.VkFormat
  vkFormatR16Uscaled* {.used.} = 72.VkFormat
  vkFormatR16Sscaled* {.used.} = 73.VkFormat
  vkFormatR16Uint* {.used.} = 74.VkFormat
  vkFormatR16Sint* {.used.} = 75.VkFormat
  vkFormatR16Sfloat* {.used.} = 76.VkFormat
  vkFormatR16g16Unorm* {.used.} = 77.VkFormat
  vkFormatR16g16Snorm* {.used.} = 78.VkFormat
  vkFormatR16g16Uscaled* {.used.} = 79.VkFormat
  vkFormatR16g16Sscaled* {.used.} = 80.VkFormat
  vkFormatR16g16Uint* {.used.} = 81.VkFormat
  vkFormatR16g16Sint* {.used.} = 82.VkFormat
  vkFormatR16g16Sfloat* {.used.} = 83.VkFormat
  vkFormatR16g16b16Unorm* {.used.} = 84.VkFormat
  vkFormatR16g16b16Snorm* {.used.} = 85.VkFormat
  vkFormatR16g16b16Uscaled* {.used.} = 86.VkFormat
  vkFormatR16g16b16Sscaled* {.used.} = 87.VkFormat
  vkFormatR16g16b16Uint* {.used.} = 88.VkFormat
  vkFormatR16g16b16Sint* {.used.} = 89.VkFormat
  vkFormatR16g16b16Sfloat* {.used.} = 90.VkFormat
  vkFormatR16g16b16a16Unorm* {.used.} = 91.VkFormat
  vkFormatR16g16b16a16Snorm* {.used.} = 92.VkFormat
  vkFormatR16g16b16a16Uscaled* {.used.} = 93.VkFormat
  vkFormatR16g16b16a16Sscaled* {.used.} = 94.VkFormat
  vkFormatR16g16b16a16Uint* {.used.} = 95.VkFormat
  vkFormatR16g16b16a16Sint* {.used.} = 96.VkFormat
  vkFormatR16g16b16a16Sfloat* {.used.} = 97.VkFormat
  vkFormatR32Uint* {.used.} = 98.VkFormat
  vkFormatR32Sint* {.used.} = 99.VkFormat
  vkFormatR32Sfloat* {.used.} = 100.VkFormat
  vkFormatR32g32Uint* {.used.} = 101.VkFormat
  vkFormatR32g32Sint* {.used.} = 102.VkFormat
  vkFormatR32g32Sfloat* {.used.} = 103.VkFormat
  vkFormatR32g32b32Uint* {.used.} = 104.VkFormat
  vkFormatR32g32b32Sint* {.used.} = 105.VkFormat
  vkFormatR32g32b32Sfloat* {.used.} = 106.VkFormat
  vkFormatR32g32b32a32Uint* {.used.} = 107.VkFormat
  vkFormatR32g32b32a32Sint* {.used.} = 108.VkFormat
  vkFormatR32g32b32a32Sfloat* {.used.} = 109.VkFormat
  vkFormatR64Uint* {.used.} = 110.VkFormat
  vkFormatR64Sint* {.used.} = 111.VkFormat
  vkFormatR64Sfloat* {.used.} = 112.VkFormat
  vkFormatR64g64Uint* {.used.} = 113.VkFormat
  vkFormatR64g64Sint* {.used.} = 114.VkFormat
  vkFormatR64g64Sfloat* {.used.} = 115.VkFormat
  vkFormatR64g64b64Uint* {.used.} = 116.VkFormat
  vkFormatR64g64b64Sint* {.used.} = 117.VkFormat
  vkFormatR64g64b64Sfloat* {.used.} = 118.VkFormat
  vkFormatR64g64b64a64Uint* {.used.} = 119.VkFormat
  vkFormatR64g64b64a64Sint* {.used.} = 120.VkFormat
  vkFormatR64g64b64a64Sfloat* {.used.} = 121.VkFormat
  vkFormatB10g11r11UfloatPack32* {.used.} = 122.VkFormat
  vkFormatE5b9g9r9UfloatPack32* {.used.} = 123.VkFormat
  vkFormatD16Unorm* {.used.} = 124.VkFormat
  vkFormatX8D24UnormPack32* {.used.} = 125.VkFormat
  vkFormatD32Sfloat* {.used.} = 126.VkFormat
  vkFormatS8Uint* {.used.} = 127.VkFormat
  vkFormatD16UnormS8Uint* {.used.} = 128.VkFormat
  vkFormatD24UnormS8Uint* {.used.} = 129.VkFormat
  vkFormatD32SfloatS8Uint* {.used.} = 130.VkFormat
  vkFormatBc1RgbUnormBlock* {.used.} = 131.VkFormat
  vkFormatBc1RgbSrgbBlock* {.used.} = 132.VkFormat
  vkFormatBc1RgbaUnormBlock* {.used.} = 133.VkFormat
  vkFormatBc1RgbaSrgbBlock* {.used.} = 134.VkFormat
  vkFormatBc2UnormBlock* {.used.} = 135.VkFormat
  vkFormatBc2SrgbBlock* {.used.} = 136.VkFormat
  vkFormatBc3UnormBlock* {.used.} = 137.VkFormat
  vkFormatBc3SrgbBlock* {.used.} = 138.VkFormat
  vkFormatBc4UnormBlock* {.used.} = 139.VkFormat
  vkFormatBc4SnormBlock* {.used.} = 140.VkFormat
  vkFormatBc5UnormBlock* {.used.} = 141.VkFormat
  vkFormatBc5SnormBlock* {.used.} = 142.VkFormat
  vkFormatBc6hUfloatBlock* {.used.} = 143.VkFormat
  vkFormatBc6hSfloatBlock* {.used.} = 144.VkFormat
  vkFormatBc7UnormBlock* {.used.} = 145.VkFormat
  vkFormatBc7SrgbBlock* {.used.} = 146.VkFormat
  vkFormatEtc2R8g8b8UnormBlock* {.used.} = 147.VkFormat
  vkFormatEtc2R8g8b8SrgbBlock* {.used.} = 148.VkFormat
  vkFormatEtc2R8g8b8a1UnormBlock* {.used.} = 149.VkFormat
  vkFormatEtc2R8g8b8a1SrgbBlock* {.used.} = 150.VkFormat
  vkFormatEtc2R8g8b8a8UnormBlock* {.used.} = 151.VkFormat
  vkFormatEtc2R8g8b8a8SrgbBlock* {.used.} = 152.VkFormat
  vkFormatEacR11UnormBlock* {.used.} = 153.VkFormat
  vkFormatEacR11SnormBlock* {.used.} = 154.VkFormat
  vkFormatEacR11g11UnormBlock* {.used.} = 155.VkFormat
  vkFormatEacR11g11SnormBlock* {.used.} = 156.VkFormat
  vkFormatAstc4x4UnormBlock* {.used.} = 157.VkFormat
  vkFormatAstc4x4SrgbBlock* {.used.} = 158.VkFormat
  vkFormatAstc5x4UnormBlock* {.used.} = 159.VkFormat
  vkFormatAstc5x4SrgbBlock* {.used.} = 160.VkFormat
  vkFormatAstc5x5UnormBlock* {.used.} = 161.VkFormat
  vkFormatAstc5x5SrgbBlock* {.used.} = 162.VkFormat
  vkFormatAstc6x5UnormBlock* {.used.} = 163.VkFormat
  vkFormatAstc6x5SrgbBlock* {.used.} = 164.VkFormat
  vkFormatAstc6x6UnormBlock* {.used.} = 165.VkFormat
  vkFormatAstc6x6SrgbBlock* {.used.} = 166.VkFormat
  vkFormatAstc8x5UnormBlock* {.used.} = 167.VkFormat
  vkFormatAstc8x5SrgbBlock* {.used.} = 168.VkFormat
  vkFormatAstc8x6UnormBlock* {.used.} = 169.VkFormat
  vkFormatAstc8x6SrgbBlock* {.used.} = 170.VkFormat
  vkFormatAstc8x8UnormBlock* {.used.} = 171.VkFormat
  vkFormatAstc8x8SrgbBlock* {.used.} = 172.VkFormat
  vkFormatAstc10x5UnormBlock* {.used.} = 173.VkFormat
  vkFormatAstc10x5SrgbBlock* {.used.} = 174.VkFormat
  vkFormatAstc10x6UnormBlock* {.used.} = 175.VkFormat
  vkFormatAstc10x6SrgbBlock* {.used.} = 176.VkFormat
  vkFormatAstc10x8UnormBlock* {.used.} = 177.VkFormat
  vkFormatAstc10x8SrgbBlock* {.used.} = 178.VkFormat
  vkFormatAstc10x10UnormBlock* {.used.} = 179.VkFormat
  vkFormatAstc10x10SrgbBlock* {.used.} = 180.VkFormat
  vkFormatAstc12x10UnormBlock* {.used.} = 181.VkFormat
  vkFormatAstc12x10SrgbBlock* {.used.} = 182.VkFormat
  vkFormatAstc12x12UnormBlock* {.used.} = 183.VkFormat
  vkFormatAstc12x12SrgbBlock* {.used.} = 184.VkFormat
  vkFormatPvrtc12bppUnormBlockImg* {.used.} = 1000054000.VkFormat
  vkFormatPvrtc14bppUnormBlockImg* {.used.} = 1000054001.VkFormat
  vkFormatPvrtc22bppUnormBlockImg* {.used.} = 1000054002.VkFormat
  vkFormatPvrtc24bppUnormBlockImg* {.used.} = 1000054003.VkFormat
  vkFormatPvrtc12bppSrgbBlockImg* {.used.} = 1000054004.VkFormat
  vkFormatPvrtc14bppSrgbBlockImg* {.used.} = 1000054005.VkFormat
  vkFormatPvrtc22bppSrgbBlockImg* {.used.} = 1000054006.VkFormat
  vkFormatPvrtc24bppSrgbBlockImg* {.used.} = 1000054007.VkFormat
  vkFormatAstc4x4SfloatBlockExt* {.used.} = 1000066000.VkFormat
  vkFormatAstc5x4SfloatBlockExt* {.used.} = 1000066001.VkFormat
  vkFormatAstc5x5SfloatBlockExt* {.used.} = 1000066002.VkFormat
  vkFormatAstc6x5SfloatBlockExt* {.used.} = 1000066003.VkFormat
  vkFormatAstc6x6SfloatBlockExt* {.used.} = 1000066004.VkFormat
  vkFormatAstc8x5SfloatBlockExt* {.used.} = 1000066005.VkFormat
  vkFormatAstc8x6SfloatBlockExt* {.used.} = 1000066006.VkFormat
  vkFormatAstc8x8SfloatBlockExt* {.used.} = 1000066007.VkFormat
  vkFormatAstc10x5SfloatBlockExt* {.used.} = 1000066008.VkFormat
  vkFormatAstc10x6SfloatBlockExt* {.used.} = 1000066009.VkFormat
  vkFormatAstc10x8SfloatBlockExt* {.used.} = 1000066010.VkFormat
  vkFormatAstc10x10SfloatBlockExt* {.used.} = 1000066011.VkFormat
  vkFormatAstc12x10SfloatBlockExt* {.used.} = 1000066012.VkFormat
  vkFormatAstc12x12SfloatBlockExt* {.used.} = 1000066013.VkFormat
  vkFormatG8b8g8r8422Unorm* {.used.} = 1000156000.VkFormat
  vkFormatB8g8r8g8422Unorm* {.used.} = 1000156001.VkFormat
  vkFormatG8B8R83plane420Unorm* {.used.} = 1000156002.VkFormat
  vkFormatG8B8r82plane420Unorm* {.used.} = 1000156003.VkFormat
  vkFormatG8B8R83plane422Unorm* {.used.} = 1000156004.VkFormat
  vkFormatG8B8r82plane422Unorm* {.used.} = 1000156005.VkFormat
  vkFormatG8B8R83plane444Unorm* {.used.} = 1000156006.VkFormat
  vkFormatR10x6UnormPack16* {.used.} = 1000156007.VkFormat
  vkFormatR10x6g10x6Unorm2pack16* {.used.} = 1000156008.VkFormat
  vkFormatR10x6g10x6b10x6a10x6Unorm4pack16* {.used.} = 1000156009.VkFormat
  vkFormatG10x6b10x6g10x6r10x6422Unorm4pack16* {.used.} = 1000156010.VkFormat
  vkFormatB10x6g10x6r10x6g10x6422Unorm4pack16* {.used.} = 1000156011.VkFormat
  vkFormatG10x6B10x6R10x63plane420Unorm3pack16* {.used.} = 1000156012.VkFormat
  vkFormatG10x6B10x6r10x62plane420Unorm3pack16* {.used.} = 1000156013.VkFormat
  vkFormatG10x6B10x6R10x63plane422Unorm3pack16* {.used.} = 1000156014.VkFormat
  vkFormatG10x6B10x6r10x62plane422Unorm3pack16* {.used.} = 1000156015.VkFormat
  vkFormatG10x6B10x6R10x63plane444Unorm3pack16* {.used.} = 1000156016.VkFormat
  vkFormatR12x4UnormPack16* {.used.} = 1000156017.VkFormat
  vkFormatR12x4g12x4Unorm2pack16* {.used.} = 1000156018.VkFormat
  vkFormatR12x4g12x4b12x4a12x4Unorm4pack16* {.used.} = 1000156019.VkFormat
  vkFormatG12x4b12x4g12x4r12x4422Unorm4pack16* {.used.} = 1000156020.VkFormat
  vkFormatB12x4g12x4r12x4g12x4422Unorm4pack16* {.used.} = 1000156021.VkFormat
  vkFormatG12x4B12x4R12x43plane420Unorm3pack16* {.used.} = 1000156022.VkFormat
  vkFormatG12x4B12x4r12x42plane420Unorm3pack16* {.used.} = 1000156023.VkFormat
  vkFormatG12x4B12x4R12x43plane422Unorm3pack16* {.used.} = 1000156024.VkFormat
  vkFormatG12x4B12x4r12x42plane422Unorm3pack16* {.used.} = 1000156025.VkFormat
  vkFormatG12x4B12x4R12x43plane444Unorm3pack16* {.used.} = 1000156026.VkFormat
  vkFormatG16b16g16r16422Unorm* {.used.} = 1000156027.VkFormat
  vkFormatB16g16r16g16422Unorm* {.used.} = 1000156028.VkFormat
  vkFormatG16B16R163plane420Unorm* {.used.} = 1000156029.VkFormat
  vkFormatG16B16r162plane420Unorm* {.used.} = 1000156030.VkFormat
  vkFormatG16B16R163plane422Unorm* {.used.} = 1000156031.VkFormat
  vkFormatG16B16r162plane422Unorm* {.used.} = 1000156032.VkFormat
  vkFormatG16B16R163plane444Unorm* {.used.} = 1000156033.VkFormat
  vkFormatA4r4g4b4UnormPack16Ext* {.used.} = 1000340000.VkFormat
  vkFormatA4b4g4r4UnormPack16Ext* {.used.} = 1000340001.VkFormat
  vkFormatG8b8g8r8422UnormKhr* {.used.}: VkFormat = vkFormatG8b8g8r8422Unorm
  vkFormatB8g8r8g8422UnormKhr* {.used.}: VkFormat = vkFormatB8g8r8g8422Unorm
  vkFormatG8B8R83plane420UnormKhr* {.used.}: VkFormat = vkFormatG8B8R83plane420Unorm
  vkFormatG8B8r82plane420UnormKhr* {.used.}: VkFormat = vkFormatG8B8r82plane420Unorm
  vkFormatG8B8R83plane422UnormKhr* {.used.}: VkFormat = vkFormatG8B8R83plane422Unorm
  vkFormatG8B8r82plane422UnormKhr* {.used.}: VkFormat = vkFormatG8B8r82plane422Unorm
  vkFormatG8B8R83plane444UnormKhr* {.used.}: VkFormat = vkFormatG8B8R83plane444Unorm
  vkFormatR10x6UnormPack16Khr* {.used.}: VkFormat = vkFormatR10x6UnormPack16
  vkFormatR10x6g10x6Unorm2pack16Khr* {.used.}: VkFormat = vkFormatR10x6g10x6Unorm2pack16
  vkFormatR10x6g10x6b10x6a10x6Unorm4pack16Khr* {.used.}: VkFormat = vkFormatR10x6g10x6b10x6a10x6Unorm4pack16
  vkFormatG10x6b10x6g10x6r10x6422Unorm4pack16Khr* {.used.}: VkFormat = vkFormatG10x6b10x6g10x6r10x6422Unorm4pack16
  vkFormatB10x6g10x6r10x6g10x6422Unorm4pack16Khr* {.used.}: VkFormat = vkFormatB10x6g10x6r10x6g10x6422Unorm4pack16
  vkFormatG10x6B10x6R10x63plane420Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG10x6B10x6R10x63plane420Unorm3pack16
  vkFormatG10x6B10x6r10x62plane420Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG10x6B10x6r10x62plane420Unorm3pack16
  vkFormatG10x6B10x6R10x63plane422Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG10x6B10x6R10x63plane422Unorm3pack16
  vkFormatG10x6B10x6r10x62plane422Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG10x6B10x6r10x62plane422Unorm3pack16
  vkFormatG10x6B10x6R10x63plane444Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG10x6B10x6R10x63plane444Unorm3pack16
  vkFormatR12x4UnormPack16Khr* {.used.}: VkFormat = vkFormatR12x4UnormPack16
  vkFormatR12x4g12x4Unorm2pack16Khr* {.used.}: VkFormat = vkFormatR12x4g12x4Unorm2pack16
  vkFormatR12x4g12x4b12x4a12x4Unorm4pack16Khr* {.used.}: VkFormat = vkFormatR12x4g12x4b12x4a12x4Unorm4pack16
  vkFormatG12x4b12x4g12x4r12x4422Unorm4pack16Khr* {.used.}: VkFormat = vkFormatG12x4b12x4g12x4r12x4422Unorm4pack16
  vkFormatB12x4g12x4r12x4g12x4422Unorm4pack16Khr* {.used.}: VkFormat = vkFormatB12x4g12x4r12x4g12x4422Unorm4pack16
  vkFormatG12x4B12x4R12x43plane420Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG12x4B12x4R12x43plane420Unorm3pack16
  vkFormatG12x4B12x4r12x42plane420Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG12x4B12x4r12x42plane420Unorm3pack16
  vkFormatG12x4B12x4R12x43plane422Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG12x4B12x4R12x43plane422Unorm3pack16
  vkFormatG12x4B12x4r12x42plane422Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG12x4B12x4r12x42plane422Unorm3pack16
  vkFormatG12x4B12x4R12x43plane444Unorm3pack16Khr* {.used.}: VkFormat = vkFormatG12x4B12x4R12x43plane444Unorm3pack16
  vkFormatG16b16g16r16422UnormKhr* {.used.}: VkFormat = vkFormatG16b16g16r16422Unorm
  vkFormatB16g16r16g16422UnormKhr* {.used.}: VkFormat = vkFormatB16g16r16g16422Unorm
  vkFormatG16B16R163plane420UnormKhr* {.used.}: VkFormat = vkFormatG16B16R163plane420Unorm
  vkFormatG16B16r162plane420UnormKhr* {.used.}: VkFormat = vkFormatG16B16r162plane420Unorm
  vkFormatG16B16R163plane422UnormKhr* {.used.}: VkFormat = vkFormatG16B16R163plane422Unorm
  vkFormatG16B16r162plane422UnormKhr* {.used.}: VkFormat = vkFormatG16B16r162plane422Unorm
  vkFormatG16B16R163plane444UnormKhr* {.used.}: VkFormat = vkFormatG16B16R163plane444Unorm
  vkFormatMaxEnum* {.used.} = 0x7FFFFFFF.VkFormat

const
  vkImageTilingOptimal* {.used.} = 0.VkImageTiling
  vkImageTilingLinear* {.used.} = 1.VkImageTiling
  vkImageTilingDrmFormatModifierExt* {.used.} = 1000158000.VkImageTiling
  vkImageTilingMaxEnum* {.used.} = 0x7FFFFFFF.VkImageTiling

const
  vkImageType1d* {.used.} = 0.VkImageType
  vkImageType2d* {.used.} = 1.VkImageType
  vkImageType3d* {.used.} = 2.VkImageType
  vkImageTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkImageType

const
  vkPhysicalDeviceTypeOther* {.used.} = 0.VkPhysicalDeviceType
  vkPhysicalDeviceTypeIntegratedGpu* {.used.} = 1.VkPhysicalDeviceType
  vkPhysicalDeviceTypeDiscreteGpu* {.used.} = 2.VkPhysicalDeviceType
  vkPhysicalDeviceTypeVirtualGpu* {.used.} = 3.VkPhysicalDeviceType
  vkPhysicalDeviceTypeCpu* {.used.} = 4.VkPhysicalDeviceType
  vkPhysicalDeviceTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkPhysicalDeviceType

const
  vkQueryTypeOcclusion* {.used.} = 0.VkQueryType
  vkQueryTypePipelineStatistics* {.used.} = 1.VkQueryType
  vkQueryTypeTimestamp* {.used.} = 2.VkQueryType
  vkQueryTypeTransformFeedbackStreamExt* {.used.} = 1000028004.VkQueryType
  vkQueryTypePerformanceQueryKhr* {.used.} = 1000116000.VkQueryType
  vkQueryTypeAccelerationStructureCompactedSizeKhr* {.used.} = 1000150000.VkQueryType
  vkQueryTypeAccelerationStructureSerializationSizeKhr* {.used.} = 1000150001.VkQueryType
  vkQueryTypeAccelerationStructureCompactedSizeNv* {.used.} = 1000165000.VkQueryType
  vkQueryTypePerformanceQueryIntel* {.used.} = 1000210000.VkQueryType
  vkQueryTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkQueryType

const
  vkSharingModeExclusive* {.used.} = 0.VkSharingMode
  vkSharingModeConcurrent* {.used.} = 1.VkSharingMode
  vkSharingModeMaxEnum* {.used.} = 0x7FFFFFFF.VkSharingMode

const
  vkComponentSwizzleIdentity* {.used.} = 0.VkComponentSwizzle
  vkComponentSwizzleZero* {.used.} = 1.VkComponentSwizzle
  vkComponentSwizzleOne* {.used.} = 2.VkComponentSwizzle
  vkComponentSwizzleR* {.used.} = 3.VkComponentSwizzle
  vkComponentSwizzleG* {.used.} = 4.VkComponentSwizzle
  vkComponentSwizzleB* {.used.} = 5.VkComponentSwizzle
  vkComponentSwizzleA* {.used.} = 6.VkComponentSwizzle
  vkComponentSwizzleMaxEnum* {.used.} = 0x7FFFFFFF.VkComponentSwizzle

const
  vkImageViewType1d* {.used.} = 0.VkImageViewType
  vkImageViewType2d* {.used.} = 1.VkImageViewType
  vkImageViewType3d* {.used.} = 2.VkImageViewType
  vkImageViewTypeCube* {.used.} = 3.VkImageViewType
  vkImageViewType1dArray* {.used.} = 4.VkImageViewType
  vkImageViewType2dArray* {.used.} = 5.VkImageViewType
  vkImageViewTypeCubeArray* {.used.} = 6.VkImageViewType
  vkImageViewTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkImageViewType

const
  vkBlendFactorZero* {.used.} = 0.VkBlendFactor
  vkBlendFactorOne* {.used.} = 1.VkBlendFactor
  vkBlendFactorSrcColor* {.used.} = 2.VkBlendFactor
  vkBlendFactorOneMinusSrcColor* {.used.} = 3.VkBlendFactor
  vkBlendFactorDstColor* {.used.} = 4.VkBlendFactor
  vkBlendFactorOneMinusDstColor* {.used.} = 5.VkBlendFactor
  vkBlendFactorSrcAlpha* {.used.} = 6.VkBlendFactor
  vkBlendFactorOneMinusSrcAlpha* {.used.} = 7.VkBlendFactor
  vkBlendFactorDstAlpha* {.used.} = 8.VkBlendFactor
  vkBlendFactorOneMinusDstAlpha* {.used.} = 9.VkBlendFactor
  vkBlendFactorConstantColor* {.used.} = 10.VkBlendFactor
  vkBlendFactorOneMinusConstantColor* {.used.} = 11.VkBlendFactor
  vkBlendFactorConstantAlpha* {.used.} = 12.VkBlendFactor
  vkBlendFactorOneMinusConstantAlpha* {.used.} = 13.VkBlendFactor
  vkBlendFactorSrcAlphaSaturate* {.used.} = 14.VkBlendFactor
  vkBlendFactorSrc1Color* {.used.} = 15.VkBlendFactor
  vkBlendFactorOneMinusSrc1Color* {.used.} = 16.VkBlendFactor
  vkBlendFactorSrc1Alpha* {.used.} = 17.VkBlendFactor
  vkBlendFactorOneMinusSrc1Alpha* {.used.} = 18.VkBlendFactor
  vkBlendFactorMaxEnum* {.used.} = 0x7FFFFFFF.VkBlendFactor

const
  vkBlendOpAdd* {.used.} = 0.VkBlendOp
  vkBlendOpSubtract* {.used.} = 1.VkBlendOp
  vkBlendOpReverseSubtract* {.used.} = 2.VkBlendOp
  vkBlendOpMin* {.used.} = 3.VkBlendOp
  vkBlendOpMax* {.used.} = 4.VkBlendOp
  vkBlendOpZeroExt* {.used.} = 1000148000.VkBlendOp
  vkBlendOpSrcExt* {.used.} = 1000148001.VkBlendOp
  vkBlendOpDstExt* {.used.} = 1000148002.VkBlendOp
  vkBlendOpSrcOverExt* {.used.} = 1000148003.VkBlendOp
  vkBlendOpDstOverExt* {.used.} = 1000148004.VkBlendOp
  vkBlendOpSrcInExt* {.used.} = 1000148005.VkBlendOp
  vkBlendOpDstInExt* {.used.} = 1000148006.VkBlendOp
  vkBlendOpSrcOutExt* {.used.} = 1000148007.VkBlendOp
  vkBlendOpDstOutExt* {.used.} = 1000148008.VkBlendOp
  vkBlendOpSrcAtopExt* {.used.} = 1000148009.VkBlendOp
  vkBlendOpDstAtopExt* {.used.} = 1000148010.VkBlendOp
  vkBlendOpXorExt* {.used.} = 1000148011.VkBlendOp
  vkBlendOpMultiplyExt* {.used.} = 1000148012.VkBlendOp
  vkBlendOpScreenExt* {.used.} = 1000148013.VkBlendOp
  vkBlendOpOverlayExt* {.used.} = 1000148014.VkBlendOp
  vkBlendOpDarkenExt* {.used.} = 1000148015.VkBlendOp
  vkBlendOpLightenExt* {.used.} = 1000148016.VkBlendOp
  vkBlendOpColordodgeExt* {.used.} = 1000148017.VkBlendOp
  vkBlendOpColorburnExt* {.used.} = 1000148018.VkBlendOp
  vkBlendOpHardlightExt* {.used.} = 1000148019.VkBlendOp
  vkBlendOpSoftlightExt* {.used.} = 1000148020.VkBlendOp
  vkBlendOpDifferenceExt* {.used.} = 1000148021.VkBlendOp
  vkBlendOpExclusionExt* {.used.} = 1000148022.VkBlendOp
  vkBlendOpInvertExt* {.used.} = 1000148023.VkBlendOp
  vkBlendOpInvertRgbExt* {.used.} = 1000148024.VkBlendOp
  vkBlendOpLineardodgeExt* {.used.} = 1000148025.VkBlendOp
  vkBlendOpLinearburnExt* {.used.} = 1000148026.VkBlendOp
  vkBlendOpVividlightExt* {.used.} = 1000148027.VkBlendOp
  vkBlendOpLinearlightExt* {.used.} = 1000148028.VkBlendOp
  vkBlendOpPinlightExt* {.used.} = 1000148029.VkBlendOp
  vkBlendOpHardmixExt* {.used.} = 1000148030.VkBlendOp
  vkBlendOpHslHueExt* {.used.} = 1000148031.VkBlendOp
  vkBlendOpHslSaturationExt* {.used.} = 1000148032.VkBlendOp
  vkBlendOpHslColorExt* {.used.} = 1000148033.VkBlendOp
  vkBlendOpHslLuminosityExt* {.used.} = 1000148034.VkBlendOp
  vkBlendOpPlusExt* {.used.} = 1000148035.VkBlendOp
  vkBlendOpPlusClampedExt* {.used.} = 1000148036.VkBlendOp
  vkBlendOpPlusClampedAlphaExt* {.used.} = 1000148037.VkBlendOp
  vkBlendOpPlusDarkerExt* {.used.} = 1000148038.VkBlendOp
  vkBlendOpMinusExt* {.used.} = 1000148039.VkBlendOp
  vkBlendOpMinusClampedExt* {.used.} = 1000148040.VkBlendOp
  vkBlendOpContrastExt* {.used.} = 1000148041.VkBlendOp
  vkBlendOpInvertOvgExt* {.used.} = 1000148042.VkBlendOp
  vkBlendOpRedExt* {.used.} = 1000148043.VkBlendOp
  vkBlendOpGreenExt* {.used.} = 1000148044.VkBlendOp
  vkBlendOpBlueExt* {.used.} = 1000148045.VkBlendOp
  vkBlendOpMaxEnum* {.used.} = 0x7FFFFFFF.VkBlendOp

const
  vkCompareOpNever* {.used.} = 0.VkCompareOp
  vkCompareOpLess* {.used.} = 1.VkCompareOp
  vkCompareOpEqual* {.used.} = 2.VkCompareOp
  vkCompareOpLessOrEqual* {.used.} = 3.VkCompareOp
  vkCompareOpGreater* {.used.} = 4.VkCompareOp
  vkCompareOpNotEqual* {.used.} = 5.VkCompareOp
  vkCompareOpGreaterOrEqual* {.used.} = 6.VkCompareOp
  vkCompareOpAlways* {.used.} = 7.VkCompareOp
  vkCompareOpMaxEnum* {.used.} = 0x7FFFFFFF.VkCompareOp

const
  vkDynamicStateViewport* {.used.} = 0.VkDynamicState
  vkDynamicStateScissor* {.used.} = 1.VkDynamicState
  vkDynamicStateLineWidth* {.used.} = 2.VkDynamicState
  vkDynamicStateDepthBias* {.used.} = 3.VkDynamicState
  vkDynamicStateBlendConstants* {.used.} = 4.VkDynamicState
  vkDynamicStateDepthBounds* {.used.} = 5.VkDynamicState
  vkDynamicStateStencilCompareMask* {.used.} = 6.VkDynamicState
  vkDynamicStateStencilWriteMask* {.used.} = 7.VkDynamicState
  vkDynamicStateStencilReference* {.used.} = 8.VkDynamicState
  vkDynamicStateViewportWScalingNv* {.used.} = 1000087000.VkDynamicState
  vkDynamicStateDiscardRectangleExt* {.used.} = 1000099000.VkDynamicState
  vkDynamicStateSampleLocationsExt* {.used.} = 1000143000.VkDynamicState
  vkDynamicStateViewportShadingRatePaletteNv* {.used.} = 1000164004.VkDynamicState
  vkDynamicStateViewportCoarseSampleOrderNv* {.used.} = 1000164006.VkDynamicState
  vkDynamicStateExclusiveScissorNv* {.used.} = 1000205001.VkDynamicState
  vkDynamicStateFragmentShadingRateKhr* {.used.} = 1000226000.VkDynamicState
  vkDynamicStateLineStippleExt* {.used.} = 1000259000.VkDynamicState
  vkDynamicStateCullModeExt* {.used.} = 1000267000.VkDynamicState
  vkDynamicStateFrontFaceExt* {.used.} = 1000267001.VkDynamicState
  vkDynamicStatePrimitiveTopologyExt* {.used.} = 1000267002.VkDynamicState
  vkDynamicStateViewportWithCountExt* {.used.} = 1000267003.VkDynamicState
  vkDynamicStateScissorWithCountExt* {.used.} = 1000267004.VkDynamicState
  vkDynamicStateVertexInputBindingStrideExt* {.used.} = 1000267005.VkDynamicState
  vkDynamicStateDepthTestEnableExt* {.used.} = 1000267006.VkDynamicState
  vkDynamicStateDepthWriteEnableExt* {.used.} = 1000267007.VkDynamicState
  vkDynamicStateDepthCompareOpExt* {.used.} = 1000267008.VkDynamicState
  vkDynamicStateDepthBoundsTestEnableExt* {.used.} = 1000267009.VkDynamicState
  vkDynamicStateStencilTestEnableExt* {.used.} = 1000267010.VkDynamicState
  vkDynamicStateStencilOpExt* {.used.} = 1000267011.VkDynamicState
  vkDynamicStateRayTracingPipelineStackSizeKhr* {.used.} = 1000347000.VkDynamicState
  vkDynamicStateMaxEnum* {.used.} = 0x7FFFFFFF.VkDynamicState

const
  vkFrontFaceCounterClockwise* {.used.} = 0.VkFrontFace
  vkFrontFaceClockwise* {.used.} = 1.VkFrontFace
  vkFrontFaceMaxEnum* {.used.} = 0x7FFFFFFF.VkFrontFace

const
  vkVertexInputRateVertex* {.used.} = 0.VkVertexInputRate
  vkVertexInputRateInstance* {.used.} = 1.VkVertexInputRate
  vkVertexInputRateMaxEnum* {.used.} = 0x7FFFFFFF.VkVertexInputRate

const
  vkPrimitiveTopologyPointList* {.used.} = 0.VkPrimitiveTopology
  vkPrimitiveTopologyLineList* {.used.} = 1.VkPrimitiveTopology
  vkPrimitiveTopologyLineStrip* {.used.} = 2.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleList* {.used.} = 3.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleStrip* {.used.} = 4.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleFan* {.used.} = 5.VkPrimitiveTopology
  vkPrimitiveTopologyLineListWithAdjacency* {.used.} = 6.VkPrimitiveTopology
  vkPrimitiveTopologyLineStripWithAdjacency* {.used.} = 7.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleListWithAdjacency* {.used.} = 8.VkPrimitiveTopology
  vkPrimitiveTopologyTriangleStripWithAdjacency* {.used.} = 9.VkPrimitiveTopology
  vkPrimitiveTopologyPatchList* {.used.} = 10.VkPrimitiveTopology
  vkPrimitiveTopologyMaxEnum* {.used.} = 0x7FFFFFFF.VkPrimitiveTopology

const
  vkPolygonModeFill* {.used.} = 0.VkPolygonMode
  vkPolygonModeLine* {.used.} = 1.VkPolygonMode
  vkPolygonModePoint* {.used.} = 2.VkPolygonMode
  vkPolygonModeFillRectangleNv* {.used.} = 1000153000.VkPolygonMode
  vkPolygonModeMaxEnum* {.used.} = 0x7FFFFFFF.VkPolygonMode

const
  vkStencilOpKeep* {.used.} = 0.VkStencilOp
  vkStencilOpZero* {.used.} = 1.VkStencilOp
  vkStencilOpReplace* {.used.} = 2.VkStencilOp
  vkStencilOpIncrementAndClamp* {.used.} = 3.VkStencilOp
  vkStencilOpDecrementAndClamp* {.used.} = 4.VkStencilOp
  vkStencilOpInvert* {.used.} = 5.VkStencilOp
  vkStencilOpIncrementAndWrap* {.used.} = 6.VkStencilOp
  vkStencilOpDecrementAndWrap* {.used.} = 7.VkStencilOp
  vkStencilOpMaxEnum* {.used.} = 0x7FFFFFFF.VkStencilOp

const
  vkLogicOpClear* {.used.} = 0.VkLogicOp
  vkLogicOpAnd* {.used.} = 1.VkLogicOp
  vkLogicOpAndReverse* {.used.} = 2.VkLogicOp
  vkLogicOpCopy* {.used.} = 3.VkLogicOp
  vkLogicOpAndInverted* {.used.} = 4.VkLogicOp
  vkLogicOpNoOp* {.used.} = 5.VkLogicOp
  vkLogicOpXor* {.used.} = 6.VkLogicOp
  vkLogicOpOr* {.used.} = 7.VkLogicOp
  vkLogicOpNor* {.used.} = 8.VkLogicOp
  vkLogicOpEquivalent* {.used.} = 9.VkLogicOp
  vkLogicOpInvert* {.used.} = 10.VkLogicOp
  vkLogicOpOrReverse* {.used.} = 11.VkLogicOp
  vkLogicOpCopyInverted* {.used.} = 12.VkLogicOp
  vkLogicOpOrInverted* {.used.} = 13.VkLogicOp
  vkLogicOpNand* {.used.} = 14.VkLogicOp
  vkLogicOpSet* {.used.} = 15.VkLogicOp
  vkLogicOpMaxEnum* {.used.} = 0x7FFFFFFF.VkLogicOp

const
  vkBorderColorFloatTransparentBlack* {.used.} = 0.VkBorderColor
  vkBorderColorIntTransparentBlack* {.used.} = 1.VkBorderColor
  vkBorderColorFloatOpaqueBlack* {.used.} = 2.VkBorderColor
  vkBorderColorIntOpaqueBlack* {.used.} = 3.VkBorderColor
  vkBorderColorFloatOpaqueWhite* {.used.} = 4.VkBorderColor
  vkBorderColorIntOpaqueWhite* {.used.} = 5.VkBorderColor
  vkBorderColorFloatCustomExt* {.used.} = 1000287003.VkBorderColor
  vkBorderColorIntCustomExt* {.used.} = 1000287004.VkBorderColor
  vkBorderColorMaxEnum* {.used.} = 0x7FFFFFFF.VkBorderColor

const
  vkFilterNearest* {.used.} = 0.VkFilter
  vkFilterLinear* {.used.} = 1.VkFilter
  vkFilterCubicImg* {.used.} = 1000015000.VkFilter
  vkFilterCubicExt* {.used.}: VkFilter = vkFilterCubicImg
  vkFilterMaxEnum* {.used.} = 0x7FFFFFFF.VkFilter

const
  vkSamplerAddressModeRepeat* {.used.} = 0.VkSamplerAddressMode
  vkSamplerAddressModeMirroredRepeat* {.used.} = 1.VkSamplerAddressMode
  vkSamplerAddressModeClampToEdge* {.used.} = 2.VkSamplerAddressMode
  vkSamplerAddressModeClampToBorder* {.used.} = 3.VkSamplerAddressMode
  vkSamplerAddressModeMirrorClampToEdge* {.used.} = 4.VkSamplerAddressMode
  vkSamplerAddressModeMirrorClampToEdgeKhr* {.used.}: VkSamplerAddressMode = vkSamplerAddressModeMirrorClampToEdge
  vkSamplerAddressModeMaxEnum* {.used.} = 0x7FFFFFFF.VkSamplerAddressMode

const
  vkSamplerMipmapModeNearest* {.used.} = 0.VkSamplerMipmapMode
  vkSamplerMipmapModeLinear* {.used.} = 1.VkSamplerMipmapMode
  vkSamplerMipmapModeMaxEnum* {.used.} = 0x7FFFFFFF.VkSamplerMipmapMode

const
  vkDescriptorTypeSampler* {.used.} = 0.VkDescriptorType
  vkDescriptorTypeCombinedImageSampler* {.used.} = 1.VkDescriptorType
  vkDescriptorTypeSampledImage* {.used.} = 2.VkDescriptorType
  vkDescriptorTypeStorageImage* {.used.} = 3.VkDescriptorType
  vkDescriptorTypeUniformTexelBuffer* {.used.} = 4.VkDescriptorType
  vkDescriptorTypeStorageTexelBuffer* {.used.} = 5.VkDescriptorType
  vkDescriptorTypeUniformBuffer* {.used.} = 6.VkDescriptorType
  vkDescriptorTypeStorageBuffer* {.used.} = 7.VkDescriptorType
  vkDescriptorTypeUniformBufferDynamic* {.used.} = 8.VkDescriptorType
  vkDescriptorTypeStorageBufferDynamic* {.used.} = 9.VkDescriptorType
  vkDescriptorTypeInputAttachment* {.used.} = 10.VkDescriptorType
  vkDescriptorTypeInlineUniformBlockExt* {.used.} = 1000138000.VkDescriptorType
  vkDescriptorTypeAccelerationStructureKhr* {.used.} = 1000150000.VkDescriptorType
  vkDescriptorTypeAccelerationStructureNv* {.used.} = 1000165000.VkDescriptorType
  vkDescriptorTypeMutableValve* {.used.} = 1000351000.VkDescriptorType
  vkDescriptorTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkDescriptorType

const
  vkAttachmentLoadOpLoad* {.used.} = 0.VkAttachmentLoadOp
  vkAttachmentLoadOpClear* {.used.} = 1.VkAttachmentLoadOp
  vkAttachmentLoadOpDontCare* {.used.} = 2.VkAttachmentLoadOp
  vkAttachmentLoadOpMaxEnum* {.used.} = 0x7FFFFFFF.VkAttachmentLoadOp

const
  vkAttachmentStoreOpStore* {.used.} = 0.VkAttachmentStoreOp
  vkAttachmentStoreOpDontCare* {.used.} = 1.VkAttachmentStoreOp
  vkAttachmentStoreOpNoneQcom* {.used.} = 1000301000.VkAttachmentStoreOp
  vkAttachmentStoreOpMaxEnum* {.used.} = 0x7FFFFFFF.VkAttachmentStoreOp

const
  vkPipelineBindPointGraphics* {.used.} = 0.VkPipelineBindPoint
  vkPipelineBindPointCompute* {.used.} = 1.VkPipelineBindPoint
  vkPipelineBindPointRayTracingKhr* {.used.} = 1000165000.VkPipelineBindPoint
  vkPipelineBindPointRayTracingNv* {.used.}: VkPipelineBindPoint = vkPipelineBindPointRayTracingKhr
  vkPipelineBindPointMaxEnum* {.used.} = 0x7FFFFFFF.VkPipelineBindPoint

const
  vkCommandBufferLevelPrimary* {.used.} = 0.VkCommandBufferLevel
  vkCommandBufferLevelSecondary* {.used.} = 1.VkCommandBufferLevel
  vkCommandBufferLevelMaxEnum* {.used.} = 0x7FFFFFFF.VkCommandBufferLevel

const
  vkIndexTypeUint16* {.used.} = 0.VkIndexType
  vkIndexTypeUint32* {.used.} = 1.VkIndexType
  vkIndexTypeNoneKhr* {.used.} = 1000165000.VkIndexType
  vkIndexTypeUint8Ext* {.used.} = 1000265000.VkIndexType
  vkIndexTypeNoneNv* {.used.}: VkIndexType = vkIndexTypeNoneKhr
  vkIndexTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkIndexType

const
  vkSubpassContentsInline* {.used.} = 0.VkSubpassContents
  vkSubpassContentsSecondaryCommandBuffers* {.used.} = 1.VkSubpassContents
  vkSubpassContentsMaxEnum* {.used.} = 0x7FFFFFFF.VkSubpassContents

const
  vkAccessNoneKhr* {.used.} = 0.VkAccessFlagBits
  vkAccessAccelerationStructureReadBitNv* {.used.}: VkAccessFlagBits = vkAccessAccelerationStructureReadBitKhr
  vkAccessAccelerationStructureWriteBitNv* {.used.}: VkAccessFlagBits = vkAccessAccelerationStructureWriteBitKhr
  vkAccessFragmentShadingRateAttachmentReadBitKhr* {.used.}: VkAccessFlagBits = vkAccessShadingRateImageReadBitNv
  vkAccessIndirectCommandReadBit* {.used.} = 0x00000001.VkAccessFlagBits
  vkAccessIndexReadBit* {.used.} = 0x00000002.VkAccessFlagBits
  vkAccessVertexAttributeReadBit* {.used.} = 0x00000004.VkAccessFlagBits
  vkAccessUniformReadBit* {.used.} = 0x00000008.VkAccessFlagBits
  vkAccessInputAttachmentReadBit* {.used.} = 0x00000010.VkAccessFlagBits
  vkAccessShaderReadBit* {.used.} = 0x00000020.VkAccessFlagBits
  vkAccessShaderWriteBit* {.used.} = 0x00000040.VkAccessFlagBits
  vkAccessColorAttachmentReadBit* {.used.} = 0x00000080.VkAccessFlagBits
  vkAccessColorAttachmentWriteBit* {.used.} = 0x00000100.VkAccessFlagBits
  vkAccessDepthStencilAttachmentReadBit* {.used.} = 0x00000200.VkAccessFlagBits
  vkAccessDepthStencilAttachmentWriteBit* {.used.} = 0x00000400.VkAccessFlagBits
  vkAccessTransferReadBit* {.used.} = 0x00000800.VkAccessFlagBits
  vkAccessTransferWriteBit* {.used.} = 0x00001000.VkAccessFlagBits
  vkAccessHostReadBit* {.used.} = 0x00002000.VkAccessFlagBits
  vkAccessHostWriteBit* {.used.} = 0x00004000.VkAccessFlagBits
  vkAccessMemoryReadBit* {.used.} = 0x00008000.VkAccessFlagBits
  vkAccessMemoryWriteBit* {.used.} = 0x00010000.VkAccessFlagBits
  vkAccessCommandPreprocessReadBitNv* {.used.} = 0x00020000.VkAccessFlagBits
  vkAccessCommandPreprocessWriteBitNv* {.used.} = 0x00040000.VkAccessFlagBits
  vkAccessColorAttachmentReadNoncoherentBitExt* {.used.} = 0x00080000.VkAccessFlagBits
  vkAccessConditionalRenderingReadBitExt* {.used.} = 0x00100000.VkAccessFlagBits
  vkAccessAccelerationStructureReadBitKhr* {.used.} = 0x00200000.VkAccessFlagBits
  vkAccessAccelerationStructureWriteBitKhr* {.used.} = 0x00400000.VkAccessFlagBits
  vkAccessShadingRateImageReadBitNv* {.used.} = 0x00800000.VkAccessFlagBits
  vkAccessFragmentDensityMapReadBitExt* {.used.} = 0x01000000.VkAccessFlagBits
  vkAccessTransformFeedbackWriteBitExt* {.used.} = 0x02000000.VkAccessFlagBits
  vkAccessTransformFeedbackCounterReadBitExt* {.used.} = 0x04000000.VkAccessFlagBits
  vkAccessTransformFeedbackCounterWriteBitExt* {.used.} = 0x08000000.VkAccessFlagBits
  vkAccessFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkAccessFlagBits

const
  vkImageAspectColorBit* {.used.} = 0x00000001.VkImageAspectFlagBits
  vkImageAspectDepthBit* {.used.} = 0x00000002.VkImageAspectFlagBits
  vkImageAspectStencilBit* {.used.} = 0x00000004.VkImageAspectFlagBits
  vkImageAspectMetadataBit* {.used.} = 0x00000008.VkImageAspectFlagBits
  vkImageAspectPlane0Bit* {.used.} = 0x00000010.VkImageAspectFlagBits
  vkImageAspectPlane1Bit* {.used.} = 0x00000020.VkImageAspectFlagBits
  vkImageAspectPlane2Bit* {.used.} = 0x00000040.VkImageAspectFlagBits
  vkImageAspectMemoryPlane0BitExt* {.used.} = 0x00000080.VkImageAspectFlagBits
  vkImageAspectMemoryPlane1BitExt* {.used.} = 0x00000100.VkImageAspectFlagBits
  vkImageAspectMemoryPlane2BitExt* {.used.} = 0x00000200.VkImageAspectFlagBits
  vkImageAspectMemoryPlane3BitExt* {.used.} = 0x00000400.VkImageAspectFlagBits
  vkImageAspectPlane0BitKhr* {.used.}: VkImageAspectFlagBits = vkImageAspectPlane0Bit
  vkImageAspectPlane1BitKhr* {.used.}: VkImageAspectFlagBits = vkImageAspectPlane1Bit
  vkImageAspectPlane2BitKhr* {.used.}: VkImageAspectFlagBits = vkImageAspectPlane2Bit
  vkImageAspectFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkImageAspectFlagBits

const
  vkFormatFeatureSampledImageBit* {.used.} = 0x00000001.VkFormatFeatureFlagBits
  vkFormatFeatureStorageImageBit* {.used.} = 0x00000002.VkFormatFeatureFlagBits
  vkFormatFeatureStorageImageAtomicBit* {.used.} = 0x00000004.VkFormatFeatureFlagBits
  vkFormatFeatureUniformTexelBufferBit* {.used.} = 0x00000008.VkFormatFeatureFlagBits
  vkFormatFeatureStorageTexelBufferBit* {.used.} = 0x00000010.VkFormatFeatureFlagBits
  vkFormatFeatureStorageTexelBufferAtomicBit* {.used.} = 0x00000020.VkFormatFeatureFlagBits
  vkFormatFeatureVertexBufferBit* {.used.} = 0x00000040.VkFormatFeatureFlagBits
  vkFormatFeatureColorAttachmentBit* {.used.} = 0x00000080.VkFormatFeatureFlagBits
  vkFormatFeatureColorAttachmentBlendBit* {.used.} = 0x00000100.VkFormatFeatureFlagBits
  vkFormatFeatureDepthStencilAttachmentBit* {.used.} = 0x00000200.VkFormatFeatureFlagBits
  vkFormatFeatureBlitSrcBit* {.used.} = 0x00000400.VkFormatFeatureFlagBits
  vkFormatFeatureBlitDstBit* {.used.} = 0x00000800.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageFilterLinearBit* {.used.} = 0x00001000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageFilterCubicBitImg* {.used.} = 0x00002000.VkFormatFeatureFlagBits
  vkFormatFeatureTransferSrcBit* {.used.} = 0x00004000.VkFormatFeatureFlagBits
  vkFormatFeatureTransferDstBit* {.used.} = 0x00008000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageFilterMinmaxBit* {.used.} = 0x00010000.VkFormatFeatureFlagBits
  vkFormatFeatureMidpointChromaSamplesBit* {.used.} = 0x00020000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageYcbcrConversionLinearFilterBit* {.used.} = 0x00040000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageYcbcrConversionSeparateReconstructionFilterBit* {.used.} = 0x00080000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitBit* {.used.} = 0x00100000.VkFormatFeatureFlagBits
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitForceableBit* {.used.} = 0x00200000.VkFormatFeatureFlagBits
  vkFormatFeatureDisjointBit* {.used.} = 0x00400000.VkFormatFeatureFlagBits
  vkFormatFeatureCositedChromaSamplesBit* {.used.} = 0x00800000.VkFormatFeatureFlagBits
  vkFormatFeatureFragmentDensityMapBitExt* {.used.} = 0x01000000.VkFormatFeatureFlagBits
  vkFormatFeatureAccelerationStructureVertexBufferBitKhr* {.used.} = 0x20000000.VkFormatFeatureFlagBits
  vkFormatFeatureFragmentShadingRateAttachmentBitKhr* {.used.} = 0x40000000.VkFormatFeatureFlagBits
  vkFormatFeatureTransferSrcBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureTransferSrcBit
  vkFormatFeatureTransferDstBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureTransferDstBit
  vkFormatFeatureSampledImageFilterMinmaxBitExt* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageFilterMinmaxBit
  vkFormatFeatureMidpointChromaSamplesBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureMidpointChromaSamplesBit
  vkFormatFeatureSampledImageYcbcrConversionLinearFilterBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageYcbcrConversionLinearFilterBit
  vkFormatFeatureSampledImageYcbcrConversionSeparateReconstructionFilterBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageYcbcrConversionSeparateReconstructionFilterBit
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitBit
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitForceableBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitForceableBit
  vkFormatFeatureDisjointBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureDisjointBit
  vkFormatFeatureCositedChromaSamplesBitKhr* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureCositedChromaSamplesBit
  vkFormatFeatureSampledImageFilterCubicBitExt* {.used.}: VkFormatFeatureFlagBits = vkFormatFeatureSampledImageFilterCubicBitImg
  vkFormatFeatureFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkFormatFeatureFlagBits

const
  vkImageCreateSparseBindingBit* {.used.} = 0x00000001.VkImageCreateFlagBits
  vkImageCreateSparseResidencyBit* {.used.} = 0x00000002.VkImageCreateFlagBits
  vkImageCreateSparseAliasedBit* {.used.} = 0x00000004.VkImageCreateFlagBits
  vkImageCreateMutableFormatBit* {.used.} = 0x00000008.VkImageCreateFlagBits
  vkImageCreateCubeCompatibleBit* {.used.} = 0x00000010.VkImageCreateFlagBits
  vkImageCreate2dArrayCompatibleBit* {.used.} = 0x00000020.VkImageCreateFlagBits
  vkImageCreateSplitInstanceBindRegionsBit* {.used.} = 0x00000040.VkImageCreateFlagBits
  vkImageCreateBlockTexelViewCompatibleBit* {.used.} = 0x00000080.VkImageCreateFlagBits
  vkImageCreateExtendedUsageBit* {.used.} = 0x00000100.VkImageCreateFlagBits
  vkImageCreateDisjointBit* {.used.} = 0x00000200.VkImageCreateFlagBits
  vkImageCreateAliasBit* {.used.} = 0x00000400.VkImageCreateFlagBits
  vkImageCreateProtectedBit* {.used.} = 0x00000800.VkImageCreateFlagBits
  vkImageCreateSampleLocationsCompatibleDepthBitExt* {.used.} = 0x00001000.VkImageCreateFlagBits
  vkImageCreateCornerSampledBitNv* {.used.} = 0x00002000.VkImageCreateFlagBits
  vkImageCreateSubsampledBitExt* {.used.} = 0x00004000.VkImageCreateFlagBits
  vkImageCreateSplitInstanceBindRegionsBitKhr* {.used.}: VkImageCreateFlagBits = vkImageCreateSplitInstanceBindRegionsBit
  vkImageCreate2dArrayCompatibleBitKhr* {.used.}: VkImageCreateFlagBits = vkImageCreate2dArrayCompatibleBit
  vkImageCreateBlockTexelViewCompatibleBitKhr* {.used.}: VkImageCreateFlagBits = vkImageCreateBlockTexelViewCompatibleBit
  vkImageCreateExtendedUsageBitKhr* {.used.}: VkImageCreateFlagBits = vkImageCreateExtendedUsageBit
  vkImageCreateDisjointBitKhr* {.used.}: VkImageCreateFlagBits = vkImageCreateDisjointBit
  vkImageCreateAliasBitKhr* {.used.}: VkImageCreateFlagBits = vkImageCreateAliasBit
  vkImageCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkImageCreateFlagBits

const
  vkSampleCount1Bit* {.used.} = 0x00000001.VkSampleCountFlagBits
  vkSampleCount2Bit* {.used.} = 0x00000002.VkSampleCountFlagBits
  vkSampleCount4Bit* {.used.} = 0x00000004.VkSampleCountFlagBits
  vkSampleCount8Bit* {.used.} = 0x00000008.VkSampleCountFlagBits
  vkSampleCount16Bit* {.used.} = 0x00000010.VkSampleCountFlagBits
  vkSampleCount32Bit* {.used.} = 0x00000020.VkSampleCountFlagBits
  vkSampleCount64Bit* {.used.} = 0x00000040.VkSampleCountFlagBits
  vkSampleCountFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkSampleCountFlagBits

const
  vkImageUsageTransferSrcBit* {.used.} = 0x00000001.VkImageUsageFlagBits
  vkImageUsageTransferDstBit* {.used.} = 0x00000002.VkImageUsageFlagBits
  vkImageUsageSampledBit* {.used.} = 0x00000004.VkImageUsageFlagBits
  vkImageUsageStorageBit* {.used.} = 0x00000008.VkImageUsageFlagBits
  vkImageUsageColorAttachmentBit* {.used.} = 0x00000010.VkImageUsageFlagBits
  vkImageUsageDepthStencilAttachmentBit* {.used.} = 0x00000020.VkImageUsageFlagBits
  vkImageUsageTransientAttachmentBit* {.used.} = 0x00000040.VkImageUsageFlagBits
  vkImageUsageInputAttachmentBit* {.used.} = 0x00000080.VkImageUsageFlagBits
  vkImageUsageShadingRateImageBitNv* {.used.} = 0x00000100.VkImageUsageFlagBits
  vkImageUsageFragmentDensityMapBitExt* {.used.} = 0x00000200.VkImageUsageFlagBits
  vkImageUsageFragmentShadingRateAttachmentBitKhr* {.used.}: VkImageUsageFlagBits = vkImageUsageShadingRateImageBitNv
  vkImageUsageFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkImageUsageFlagBits

const
  vkMemoryHeapDeviceLocalBit* {.used.} = 0x00000001.VkMemoryHeapFlagBits
  vkMemoryHeapMultiInstanceBit* {.used.} = 0x00000002.VkMemoryHeapFlagBits
  vkMemoryHeapMultiInstanceBitKhr* {.used.}: VkMemoryHeapFlagBits = vkMemoryHeapMultiInstanceBit
  vkMemoryHeapFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkMemoryHeapFlagBits

const
  vkMemoryPropertyDeviceLocalBit* {.used.} = 0x00000001.VkMemoryPropertyFlagBits
  vkMemoryPropertyHostVisibleBit* {.used.} = 0x00000002.VkMemoryPropertyFlagBits
  vkMemoryPropertyHostCoherentBit* {.used.} = 0x00000004.VkMemoryPropertyFlagBits
  vkMemoryPropertyHostCachedBit* {.used.} = 0x00000008.VkMemoryPropertyFlagBits
  vkMemoryPropertyLazilyAllocatedBit* {.used.} = 0x00000010.VkMemoryPropertyFlagBits
  vkMemoryPropertyProtectedBit* {.used.} = 0x00000020.VkMemoryPropertyFlagBits
  vkMemoryPropertyDeviceCoherentBitAmd* {.used.} = 0x00000040.VkMemoryPropertyFlagBits
  vkMemoryPropertyDeviceUncachedBitAmd* {.used.} = 0x00000080.VkMemoryPropertyFlagBits
  vkMemoryPropertyFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkMemoryPropertyFlagBits

const
  vkQueueGraphicsBit* {.used.} = 0x00000001.VkQueueFlagBits
  vkQueueComputeBit* {.used.} = 0x00000002.VkQueueFlagBits
  vkQueueTransferBit* {.used.} = 0x00000004.VkQueueFlagBits
  vkQueueSparseBindingBit* {.used.} = 0x00000008.VkQueueFlagBits
  vkQueueProtectedBit* {.used.} = 0x00000010.VkQueueFlagBits
  vkQueueFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkQueueFlagBits

const
  vkDeviceQueueCreateProtectedBit* {.used.} = 0x00000001.VkDeviceQueueCreateFlagBits
  vkDeviceQueueCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkDeviceQueueCreateFlagBits

const
  vkPipelineStageNoneKhr* {.used.} = 0.VkPipelineStageFlagBits
  vkPipelineStageRayTracingShaderBitNv* {.used.}: VkPipelineStageFlagBits = vkPipelineStageRayTracingShaderBitKhr
  vkPipelineStageAccelerationStructureBuildBitNv* {.used.}: VkPipelineStageFlagBits = vkPipelineStageAccelerationStructureBuildBitKhr
  vkPipelineStageFragmentShadingRateAttachmentBitKhr* {.used.}: VkPipelineStageFlagBits = vkPipelineStageShadingRateImageBitNv
  vkPipelineStageTopOfPipeBit* {.used.} = 0x00000001.VkPipelineStageFlagBits
  vkPipelineStageDrawIndirectBit* {.used.} = 0x00000002.VkPipelineStageFlagBits
  vkPipelineStageVertexInputBit* {.used.} = 0x00000004.VkPipelineStageFlagBits
  vkPipelineStageVertexShaderBit* {.used.} = 0x00000008.VkPipelineStageFlagBits
  vkPipelineStageTessellationControlShaderBit* {.used.} = 0x00000010.VkPipelineStageFlagBits
  vkPipelineStageTessellationEvaluationShaderBit* {.used.} = 0x00000020.VkPipelineStageFlagBits
  vkPipelineStageGeometryShaderBit* {.used.} = 0x00000040.VkPipelineStageFlagBits
  vkPipelineStageFragmentShaderBit* {.used.} = 0x00000080.VkPipelineStageFlagBits
  vkPipelineStageEarlyFragmentTestsBit* {.used.} = 0x00000100.VkPipelineStageFlagBits
  vkPipelineStageLateFragmentTestsBit* {.used.} = 0x00000200.VkPipelineStageFlagBits
  vkPipelineStageColorAttachmentOutputBit* {.used.} = 0x00000400.VkPipelineStageFlagBits
  vkPipelineStageComputeShaderBit* {.used.} = 0x00000800.VkPipelineStageFlagBits
  vkPipelineStageTransferBit* {.used.} = 0x00001000.VkPipelineStageFlagBits
  vkPipelineStageBottomOfPipeBit* {.used.} = 0x00002000.VkPipelineStageFlagBits
  vkPipelineStageHostBit* {.used.} = 0x00004000.VkPipelineStageFlagBits
  vkPipelineStageAllGraphicsBit* {.used.} = 0x00008000.VkPipelineStageFlagBits
  vkPipelineStageAllCommandsBit* {.used.} = 0x00010000.VkPipelineStageFlagBits
  vkPipelineStageCommandPreprocessBitNv* {.used.} = 0x00020000.VkPipelineStageFlagBits
  vkPipelineStageConditionalRenderingBitExt* {.used.} = 0x00040000.VkPipelineStageFlagBits
  vkPipelineStageTaskShaderBitNv* {.used.} = 0x00080000.VkPipelineStageFlagBits
  vkPipelineStageMeshShaderBitNv* {.used.} = 0x00100000.VkPipelineStageFlagBits
  vkPipelineStageRayTracingShaderBitKhr* {.used.} = 0x00200000.VkPipelineStageFlagBits
  vkPipelineStageShadingRateImageBitNv* {.used.} = 0x00400000.VkPipelineStageFlagBits
  vkPipelineStageFragmentDensityProcessBitExt* {.used.} = 0x00800000.VkPipelineStageFlagBits
  vkPipelineStageTransformFeedbackBitExt* {.used.} = 0x01000000.VkPipelineStageFlagBits
  vkPipelineStageAccelerationStructureBuildBitKhr* {.used.} = 0x02000000.VkPipelineStageFlagBits
  vkPipelineStageFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkPipelineStageFlagBits

const
  vkSparseMemoryBindMetadataBit* {.used.} = 0x00000001.VkSparseMemoryBindFlagBits
  vkSparseMemoryBindFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkSparseMemoryBindFlagBits

const
  vkSparseImageFormatSingleMiptailBit* {.used.} = 0x00000001.VkSparseImageFormatFlagBits
  vkSparseImageFormatAlignedMipSizeBit* {.used.} = 0x00000002.VkSparseImageFormatFlagBits
  vkSparseImageFormatNonstandardBlockSizeBit* {.used.} = 0x00000004.VkSparseImageFormatFlagBits
  vkSparseImageFormatFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkSparseImageFormatFlagBits

const
  vkFenceCreateSignaledBit* {.used.} = 0x00000001.VkFenceCreateFlagBits
  vkFenceCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkFenceCreateFlagBits

const
  vkEventCreateDeviceOnlyBitKhr* {.used.} = 0x00000001.VkEventCreateFlagBits
  vkEventCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkEventCreateFlagBits

const
  vkQueryPipelineStatisticInputAssemblyVerticesBit* {.used.} = 0x00000001.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticInputAssemblyPrimitivesBit* {.used.} = 0x00000002.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticVertexShaderInvocationsBit* {.used.} = 0x00000004.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticGeometryShaderInvocationsBit* {.used.} = 0x00000008.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticGeometryShaderPrimitivesBit* {.used.} = 0x00000010.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticClippingInvocationsBit* {.used.} = 0x00000020.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticClippingPrimitivesBit* {.used.} = 0x00000040.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticFragmentShaderInvocationsBit* {.used.} = 0x00000080.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticTessellationControlShaderPatchesBit* {.used.} = 0x00000100.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticTessellationEvaluationShaderInvocationsBit* {.used.} = 0x00000200.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticComputeShaderInvocationsBit* {.used.} = 0x00000400.VkQueryPipelineStatisticFlagBits
  vkQueryPipelineStatisticFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkQueryPipelineStatisticFlagBits

const
  vkQueryResult64Bit* {.used.} = 0x00000001.VkQueryResultFlagBits
  vkQueryResultWaitBit* {.used.} = 0x00000002.VkQueryResultFlagBits
  vkQueryResultWithAvailabilityBit* {.used.} = 0x00000004.VkQueryResultFlagBits
  vkQueryResultPartialBit* {.used.} = 0x00000008.VkQueryResultFlagBits
  vkQueryResultFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkQueryResultFlagBits

const
  vkBufferCreateSparseBindingBit* {.used.} = 0x00000001.VkBufferCreateFlagBits
  vkBufferCreateSparseResidencyBit* {.used.} = 0x00000002.VkBufferCreateFlagBits
  vkBufferCreateSparseAliasedBit* {.used.} = 0x00000004.VkBufferCreateFlagBits
  vkBufferCreateProtectedBit* {.used.} = 0x00000008.VkBufferCreateFlagBits
  vkBufferCreateDeviceAddressCaptureReplayBit* {.used.} = 0x00000010.VkBufferCreateFlagBits
  vkBufferCreateDeviceAddressCaptureReplayBitExt* {.used.}: VkBufferCreateFlagBits = vkBufferCreateDeviceAddressCaptureReplayBit
  vkBufferCreateDeviceAddressCaptureReplayBitKhr* {.used.}: VkBufferCreateFlagBits = vkBufferCreateDeviceAddressCaptureReplayBit
  vkBufferCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkBufferCreateFlagBits

const
  vkBufferUsageTransferSrcBit* {.used.} = 0x00000001.VkBufferUsageFlagBits
  vkBufferUsageTransferDstBit* {.used.} = 0x00000002.VkBufferUsageFlagBits
  vkBufferUsageUniformTexelBufferBit* {.used.} = 0x00000004.VkBufferUsageFlagBits
  vkBufferUsageStorageTexelBufferBit* {.used.} = 0x00000008.VkBufferUsageFlagBits
  vkBufferUsageUniformBufferBit* {.used.} = 0x00000010.VkBufferUsageFlagBits
  vkBufferUsageStorageBufferBit* {.used.} = 0x00000020.VkBufferUsageFlagBits
  vkBufferUsageIndexBufferBit* {.used.} = 0x00000040.VkBufferUsageFlagBits
  vkBufferUsageVertexBufferBit* {.used.} = 0x00000080.VkBufferUsageFlagBits
  vkBufferUsageIndirectBufferBit* {.used.} = 0x00000100.VkBufferUsageFlagBits
  vkBufferUsageConditionalRenderingBitExt* {.used.} = 0x00000200.VkBufferUsageFlagBits
  vkBufferUsageShaderBindingTableBitKhr* {.used.} = 0x00000400.VkBufferUsageFlagBits
  vkBufferUsageRayTracingBitNv* {.used.}: VkBufferUsageFlagBits = vkBufferUsageShaderBindingTableBitKhr
  vkBufferUsageShaderDeviceAddressBitExt* {.used.}: VkBufferUsageFlagBits = vkBufferUsageShaderDeviceAddressBit
  vkBufferUsageShaderDeviceAddressBitKhr* {.used.}: VkBufferUsageFlagBits = vkBufferUsageShaderDeviceAddressBit
  vkBufferUsageTransformFeedbackBufferBitExt* {.used.} = 0x00000800.VkBufferUsageFlagBits
  vkBufferUsageTransformFeedbackCounterBufferBitExt* {.used.} = 0x00001000.VkBufferUsageFlagBits
  vkBufferUsageShaderDeviceAddressBit* {.used.} = 0x00020000.VkBufferUsageFlagBits
  vkBufferUsageAccelerationStructureBuildInputReadOnlyBitKhr* {.used.} = 0x00080000.VkBufferUsageFlagBits
  vkBufferUsageAccelerationStructureStorageBitKhr* {.used.} = 0x00100000.VkBufferUsageFlagBits
  vkBufferUsageFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkBufferUsageFlagBits

const
  vkImageViewCreateFragmentDensityMapDynamicBitExt* {.used.} = 0x00000001.VkImageViewCreateFlagBits
  vkImageViewCreateFragmentDensityMapDeferredBitExt* {.used.} = 0x00000002.VkImageViewCreateFlagBits
  vkImageViewCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkImageViewCreateFlagBits

const
  vkShaderModuleCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkShaderModuleCreateFlagBits

const
  vkPipelineCacheCreateExternallySynchronizedBitExt* {.used.} = 0x00000001.VkPipelineCacheCreateFlagBits
  vkPipelineCacheCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkPipelineCacheCreateFlagBits

const
  vkColorComponentRBit* {.used.} = 0x00000001.VkColorComponentFlagBits
  vkColorComponentGBit* {.used.} = 0x00000002.VkColorComponentFlagBits
  vkColorComponentBBit* {.used.} = 0x00000004.VkColorComponentFlagBits
  vkColorComponentABit* {.used.} = 0x00000008.VkColorComponentFlagBits
  vkColorComponentFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkColorComponentFlagBits

const
  vkPipelineCreateDisableOptimizationBit* {.used.} = 0x00000001.VkPipelineCreateFlagBits
  vkPipelineCreateAllowDerivativesBit* {.used.} = 0x00000002.VkPipelineCreateFlagBits
  vkPipelineCreateDerivativeBit* {.used.} = 0x00000004.VkPipelineCreateFlagBits
  vkPipelineCreateViewIndexFromDeviceIndexBit* {.used.} = 0x00000008.VkPipelineCreateFlagBits
  vkPipelineCreateDispatchBaseBit* {.used.} = 0x00000010.VkPipelineCreateFlagBits
  vkPipelineCreateDeferCompileBitNv* {.used.} = 0x00000020.VkPipelineCreateFlagBits
  vkPipelineCreateCaptureStatisticsBitKhr* {.used.} = 0x00000040.VkPipelineCreateFlagBits
  vkPipelineCreateCaptureInternalRepresentationsBitKhr* {.used.} = 0x00000080.VkPipelineCreateFlagBits
  vkPipelineCreateFailOnPipelineCompileRequiredBitExt* {.used.} = 0x00000100.VkPipelineCreateFlagBits
  vkPipelineCreateEarlyReturnOnFailureBitExt* {.used.} = 0x00000200.VkPipelineCreateFlagBits
  vkPipelineCreateDispatchBase* {.used.}: VkPipelineCreateFlagBits = vkPipelineCreateDispatchBaseBit
  vkPipelineCreateViewIndexFromDeviceIndexBitKhr* {.used.}: VkPipelineCreateFlagBits = vkPipelineCreateViewIndexFromDeviceIndexBit
  vkPipelineCreateDispatchBaseKhr* {.used.}: VkPipelineCreateFlagBits = vkPipelineCreateDispatchBase
  vkPipelineCreateLibraryBitKhr* {.used.} = 0x00000800.VkPipelineCreateFlagBits
  vkPipelineCreateRayTracingSkipTrianglesBitKhr* {.used.} = 0x00001000.VkPipelineCreateFlagBits
  vkPipelineCreateRayTracingSkipAabbsBitKhr* {.used.} = 0x00002000.VkPipelineCreateFlagBits
  vkPipelineCreateRayTracingNoNullAnyHitShadersBitKhr* {.used.} = 0x00004000.VkPipelineCreateFlagBits
  vkPipelineCreateRayTracingNoNullClosestHitShadersBitKhr* {.used.} = 0x00008000.VkPipelineCreateFlagBits
  vkPipelineCreateRayTracingNoNullMissShadersBitKhr* {.used.} = 0x00010000.VkPipelineCreateFlagBits
  vkPipelineCreateRayTracingNoNullIntersectionShadersBitKhr* {.used.} = 0x00020000.VkPipelineCreateFlagBits
  vkPipelineCreateIndirectBindableBitNv* {.used.} = 0x00040000.VkPipelineCreateFlagBits
  vkPipelineCreateRayTracingShaderGroupHandleCaptureReplayBitKhr* {.used.} = 0x00080000.VkPipelineCreateFlagBits
  vkPipelineCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkPipelineCreateFlagBits

const
  vkPipelineShaderStageCreateAllowVaryingSubgroupSizeBitExt* {.used.} = 0x00000001.VkPipelineShaderStageCreateFlagBits
  vkPipelineShaderStageCreateRequireFullSubgroupsBitExt* {.used.} = 0x00000002.VkPipelineShaderStageCreateFlagBits
  vkPipelineShaderStageCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkPipelineShaderStageCreateFlagBits

const
  vkShaderStageVertexBit* {.used.} = 0x00000001.VkShaderStageFlagBits
  vkShaderStageTessellationControlBit* {.used.} = 0x00000002.VkShaderStageFlagBits
  vkShaderStageTessellationEvaluationBit* {.used.} = 0x00000004.VkShaderStageFlagBits
  vkShaderStageGeometryBit* {.used.} = 0x00000008.VkShaderStageFlagBits
  vkShaderStageFragmentBit* {.used.} = 0x00000010.VkShaderStageFlagBits
  vkShaderStageAllGraphics* {.used.} = 0x0000001F.VkShaderStageFlagBits
  vkShaderStageComputeBit* {.used.} = 0x00000020.VkShaderStageFlagBits
  vkShaderStageTaskBitNv* {.used.} = 0x00000040.VkShaderStageFlagBits
  vkShaderStageMeshBitNv* {.used.} = 0x00000080.VkShaderStageFlagBits
  vkShaderStageRaygenBitNv* {.used.}: VkShaderStageFlagBits = vkShaderStageRaygenBitKhr
  vkShaderStageAnyHitBitNv* {.used.}: VkShaderStageFlagBits = vkShaderStageAnyHitBitKhr
  vkShaderStageClosestHitBitNv* {.used.}: VkShaderStageFlagBits = vkShaderStageClosestHitBitKhr
  vkShaderStageMissBitNv* {.used.}: VkShaderStageFlagBits = vkShaderStageMissBitKhr
  vkShaderStageIntersectionBitNv* {.used.}: VkShaderStageFlagBits = vkShaderStageIntersectionBitKhr
  vkShaderStageCallableBitNv* {.used.}: VkShaderStageFlagBits = vkShaderStageCallableBitKhr
  vkShaderStageRaygenBitKhr* {.used.} = 0x00000100.VkShaderStageFlagBits
  vkShaderStageAnyHitBitKhr* {.used.} = 0x00000200.VkShaderStageFlagBits
  vkShaderStageClosestHitBitKhr* {.used.} = 0x00000400.VkShaderStageFlagBits
  vkShaderStageMissBitKhr* {.used.} = 0x00000800.VkShaderStageFlagBits
  vkShaderStageIntersectionBitKhr* {.used.} = 0x00001000.VkShaderStageFlagBits
  vkShaderStageCallableBitKhr* {.used.} = 0x00002000.VkShaderStageFlagBits
  vkShaderStageAll* {.used.} = 0x7FFFFFFF.VkShaderStageFlagBits
  vkShaderStageFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkShaderStageFlagBits

const
  vkCullModeNone* {.used.} = 0.VkCullModeFlagBits
  vkCullModeFrontBit* {.used.} = 0x00000001.VkCullModeFlagBits
  vkCullModeBackBit* {.used.} = 0x00000002.VkCullModeFlagBits
  vkCullModeFrontAndBack* {.used.} = 0x00000003.VkCullModeFlagBits
  vkCullModeFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkCullModeFlagBits

const
  vkSamplerCreateSubsampledBitExt* {.used.} = 0x00000001.VkSamplerCreateFlagBits
  vkSamplerCreateSubsampledCoarseReconstructionBitExt* {.used.} = 0x00000002.VkSamplerCreateFlagBits
  vkSamplerCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkSamplerCreateFlagBits

const
  vkDescriptorPoolCreateFreeDescriptorSetBit* {.used.} = 0x00000001.VkDescriptorPoolCreateFlagBits
  vkDescriptorPoolCreateUpdateAfterBindBit* {.used.} = 0x00000002.VkDescriptorPoolCreateFlagBits
  vkDescriptorPoolCreateHostOnlyBitValve* {.used.} = 0x00000004.VkDescriptorPoolCreateFlagBits
  vkDescriptorPoolCreateUpdateAfterBindBitExt* {.used.}: VkDescriptorPoolCreateFlagBits = vkDescriptorPoolCreateUpdateAfterBindBit
  vkDescriptorPoolCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkDescriptorPoolCreateFlagBits

const
  vkDescriptorSetLayoutCreatePushDescriptorBitKhr* {.used.} = 0x00000001.VkDescriptorSetLayoutCreateFlagBits
  vkDescriptorSetLayoutCreateUpdateAfterBindPoolBit* {.used.} = 0x00000002.VkDescriptorSetLayoutCreateFlagBits
  vkDescriptorSetLayoutCreateHostOnlyPoolBitValve* {.used.} = 0x00000004.VkDescriptorSetLayoutCreateFlagBits
  vkDescriptorSetLayoutCreateUpdateAfterBindPoolBitExt* {.used.}: VkDescriptorSetLayoutCreateFlagBits = vkDescriptorSetLayoutCreateUpdateAfterBindPoolBit
  vkDescriptorSetLayoutCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkDescriptorSetLayoutCreateFlagBits

const
  vkAttachmentDescriptionMayAliasBit* {.used.} = 0x00000001.VkAttachmentDescriptionFlagBits
  vkAttachmentDescriptionFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkAttachmentDescriptionFlagBits

const
  vkDependencyByRegionBit* {.used.} = 0x00000001.VkDependencyFlagBits
  vkDependencyViewLocalBit* {.used.} = 0x00000002.VkDependencyFlagBits
  vkDependencyViewLocalBitKhr* {.used.}: VkDependencyFlagBits = vkDependencyViewLocalBit
  vkDependencyDeviceGroupBitKhr* {.used.}: VkDependencyFlagBits = vkDependencyDeviceGroupBit
  vkDependencyDeviceGroupBit* {.used.} = 0x00000004.VkDependencyFlagBits
  vkDependencyFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkDependencyFlagBits

const
  vkFramebufferCreateImagelessBit* {.used.} = 0x00000001.VkFramebufferCreateFlagBits
  vkFramebufferCreateImagelessBitKhr* {.used.}: VkFramebufferCreateFlagBits = vkFramebufferCreateImagelessBit
  vkFramebufferCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkFramebufferCreateFlagBits

const
  vkRenderPassCreateTransformBitQcom* {.used.} = 0x00000002.VkRenderPassCreateFlagBits
  vkRenderPassCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkRenderPassCreateFlagBits

const
  vkSubpassDescriptionPerViewAttributesBitNvx* {.used.} = 0x00000001.VkSubpassDescriptionFlagBits
  vkSubpassDescriptionPerViewPositionXOnlyBitNvx* {.used.} = 0x00000002.VkSubpassDescriptionFlagBits
  vkSubpassDescriptionFragmentRegionBitQcom* {.used.} = 0x00000004.VkSubpassDescriptionFlagBits
  vkSubpassDescriptionShaderResolveBitQcom* {.used.} = 0x00000008.VkSubpassDescriptionFlagBits
  vkSubpassDescriptionFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkSubpassDescriptionFlagBits

const
  vkCommandPoolCreateTransientBit* {.used.} = 0x00000001.VkCommandPoolCreateFlagBits
  vkCommandPoolCreateResetCommandBufferBit* {.used.} = 0x00000002.VkCommandPoolCreateFlagBits
  vkCommandPoolCreateProtectedBit* {.used.} = 0x00000004.VkCommandPoolCreateFlagBits
  vkCommandPoolCreateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkCommandPoolCreateFlagBits

const
  vkCommandPoolResetReleaseResourcesBit* {.used.} = 0x00000001.VkCommandPoolResetFlagBits
  vkCommandPoolResetFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkCommandPoolResetFlagBits

const
  vkCommandBufferUsageOneTimeSubmitBit* {.used.} = 0x00000001.VkCommandBufferUsageFlagBits
  vkCommandBufferUsageRenderPassContinueBit* {.used.} = 0x00000002.VkCommandBufferUsageFlagBits
  vkCommandBufferUsageSimultaneousUseBit* {.used.} = 0x00000004.VkCommandBufferUsageFlagBits
  vkCommandBufferUsageFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkCommandBufferUsageFlagBits

const
  vkQueryControlPreciseBit* {.used.} = 0x00000001.VkQueryControlFlagBits
  vkQueryControlFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkQueryControlFlagBits

const
  vkCommandBufferResetReleaseResourcesBit* {.used.} = 0x00000001.VkCommandBufferResetFlagBits
  vkCommandBufferResetFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkCommandBufferResetFlagBits

const
  vkStencilFaceFrontBit* {.used.} = 0x00000001.VkStencilFaceFlagBits
  vkStencilFaceBackBit* {.used.} = 0x00000002.VkStencilFaceFlagBits
  vkStencilFaceFrontAndBack* {.used.} = 0x00000003.VkStencilFaceFlagBits
  vkStencilFrontAndBack* {.used.}: VkStencilFaceFlagBits = vkStencilFaceFrontAndBack
  vkStencilFaceFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkStencilFaceFlagBits

when not defined(vkNoPrototypes):
  proc vkCreateInstance*(pCreateInfo: ptr VkInstanceCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pInstance: ptr VkInstance): VkResult {.cdecl, importc.}
  proc vkDestroyInstance*(instance: VkInstance; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkEnumeratePhysicalDevices*(instance: VkInstance; pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr VkPhysicalDevice): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceFeatures*(physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures) {.cdecl, importc.}
  proc vkGetPhysicalDeviceFormatProperties*(physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceImageFormatProperties*(physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; pImageFormatProperties: ptr VkImageFormatProperties): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceProperties*(physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceQueueFamilyProperties*(physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceMemoryProperties*(physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties) {.cdecl, importc.}
  proc vkGetInstanceProcAddr*(instance: VkInstance; pName: cstring): PFNVkvoidfunction {.cdecl, importc.}
  proc vkGetDeviceProcAddr*(device: VkDevice; pName: cstring): PFNVkvoidfunction {.cdecl, importc.}
  proc vkCreateDevice*(physicalDevice: VkPhysicalDevice; pCreateInfo: ptr VkDeviceCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pDevice: ptr VkDevice): VkResult {.cdecl, importc.}
  proc vkDestroyDevice*(device: VkDevice; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkEnumerateInstanceExtensionProperties*(pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateDeviceExtensionProperties*(physicalDevice: VkPhysicalDevice; pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateInstanceLayerProperties*(pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateDeviceLayerProperties*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl, importc.}
  proc vkGetDeviceQueue*(device: VkDevice; queueFamilyIndex: uint32; queueIndex: uint32; pQueue: ptr VkQueue) {.cdecl, importc.}
  proc vkQueueSubmit*(queue: VkQueue; submitCount: uint32; pSubmits: ptr VkSubmitInfo; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkQueueWaitIdle*(queue: VkQueue): VkResult {.cdecl, importc.}
  proc vkDeviceWaitIdle*(device: VkDevice): VkResult {.cdecl, importc.}
  proc vkAllocateMemory*(device: VkDevice; pAllocateInfo: ptr VkMemoryAllocateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pMemory: ptr VkDeviceMemory): VkResult {.cdecl, importc.}
  proc vkFreeMemory*(device: VkDevice; memory: VkDeviceMemory; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
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
  proc vkCreateFence*(device: VkDevice; pCreateInfo: ptr VkFenceCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkDestroyFence*(device: VkDevice; fence: VkFence; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkResetFences*(device: VkDevice; fenceCount: uint32; pFences: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkGetFenceStatus*(device: VkDevice; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkWaitForFences*(device: VkDevice; fenceCount: uint32; pFences: ptr VkFence; waitAll: VkBool32; timeout: uint64): VkResult {.cdecl, importc.}
  proc vkCreateSemaphore*(device: VkDevice; pCreateInfo: ptr VkSemaphoreCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pSemaphore: ptr VkSemaphore): VkResult {.cdecl, importc.}
  proc vkDestroySemaphore*(device: VkDevice; semaphore: VkSemaphore; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateEvent*(device: VkDevice; pCreateInfo: ptr VkEventCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pEvent: ptr VkEvent): VkResult {.cdecl, importc.}
  proc vkDestroyEvent*(device: VkDevice; event: VkEvent; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkGetEventStatus*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkSetEvent*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkResetEvent*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkCreateQueryPool*(device: VkDevice; pCreateInfo: ptr VkQueryPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pQueryPool: ptr VkQueryPool): VkResult {.cdecl, importc.}
  proc vkDestroyQueryPool*(device: VkDevice; queryPool: VkQueryPool; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkGetQueryPoolResults*(device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dataSize: csize_t; pData: pointer; stride: VkDeviceSize; flags: VkQueryResultFlags): VkResult {.cdecl, importc.}
  proc vkCreateBuffer*(device: VkDevice; pCreateInfo: ptr VkBufferCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pBuffer: ptr VkBuffer): VkResult {.cdecl, importc.}
  proc vkDestroyBuffer*(device: VkDevice; buffer: VkBuffer; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateBufferView*(device: VkDevice; pCreateInfo: ptr VkBufferViewCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pView: ptr VkBufferView): VkResult {.cdecl, importc.}
  proc vkDestroyBufferView*(device: VkDevice; bufferView: VkBufferView; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateImage*(device: VkDevice; pCreateInfo: ptr VkImageCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pImage: ptr VkImage): VkResult {.cdecl, importc.}
  proc vkDestroyImage*(device: VkDevice; image: VkImage; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkGetImageSubresourceLayout*(device: VkDevice; image: VkImage; pSubresource: ptr VkImageSubresource; pLayout: ptr VkSubresourceLayout) {.cdecl, importc.}
  proc vkCreateImageView*(device: VkDevice; pCreateInfo: ptr VkImageViewCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pView: ptr VkImageView): VkResult {.cdecl, importc.}
  proc vkDestroyImageView*(device: VkDevice; imageView: VkImageView; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateShaderModule*(device: VkDevice; pCreateInfo: ptr VkShaderModuleCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pShaderModule: ptr VkShaderModule): VkResult {.cdecl, importc.}
  proc vkDestroyShaderModule*(device: VkDevice; shaderModule: VkShaderModule; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreatePipelineCache*(device: VkDevice; pCreateInfo: ptr VkPipelineCacheCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pPipelineCache: ptr VkPipelineCache): VkResult {.cdecl, importc.}
  proc vkDestroyPipelineCache*(device: VkDevice; pipelineCache: VkPipelineCache; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkGetPipelineCacheData*(device: VkDevice; pipelineCache: VkPipelineCache; pDataSize: ptr csize_t; pData: pointer): VkResult {.cdecl, importc.}
  proc vkMergePipelineCaches*(device: VkDevice; dstCache: VkPipelineCache; srcCacheCount: uint32; pSrcCaches: ptr VkPipelineCache): VkResult {.cdecl, importc.}
  proc vkCreateGraphicsPipelines*(device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkGraphicsPipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkCreateComputePipelines*(device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkComputePipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkDestroyPipeline*(device: VkDevice; pipeline: VkPipeline; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreatePipelineLayout*(device: VkDevice; pCreateInfo: ptr VkPipelineLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pPipelineLayout: ptr VkPipelineLayout): VkResult {.cdecl, importc.}
  proc vkDestroyPipelineLayout*(device: VkDevice; pipelineLayout: VkPipelineLayout; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateSampler*(device: VkDevice; pCreateInfo: ptr VkSamplerCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pSampler: ptr VkSampler): VkResult {.cdecl, importc.}
  proc vkDestroySampler*(device: VkDevice; sampler: VkSampler; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateDescriptorSetLayout*(device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pSetLayout: ptr VkDescriptorSetLayout): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorSetLayout*(device: VkDevice; descriptorSetLayout: VkDescriptorSetLayout; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateDescriptorPool*(device: VkDevice; pCreateInfo: ptr VkDescriptorPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pDescriptorPool: ptr VkDescriptorPool): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorPool*(device: VkDevice; descriptorPool: VkDescriptorPool; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkResetDescriptorPool*(device: VkDevice; descriptorPool: VkDescriptorPool; flags: VkDescriptorPoolResetFlags): VkResult {.cdecl, importc.}
  proc vkAllocateDescriptorSets*(device: VkDevice; pAllocateInfo: ptr VkDescriptorSetAllocateInfo; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl, importc.}
  proc vkFreeDescriptorSets*(device: VkDevice; descriptorPool: VkDescriptorPool; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl, importc.}
  proc vkUpdateDescriptorSets*(device: VkDevice; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet; descriptorCopyCount: uint32; pDescriptorCopies: ptr VkCopyDescriptorSet) {.cdecl, importc.}
  proc vkCreateFramebuffer*(device: VkDevice; pCreateInfo: ptr VkFramebufferCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pFramebuffer: ptr VkFramebuffer): VkResult {.cdecl, importc.}
  proc vkDestroyFramebuffer*(device: VkDevice; framebuffer: VkFramebuffer; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateRenderPass*(device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pRenderPass: ptr VkRenderPass): VkResult {.cdecl, importc.}
  proc vkDestroyRenderPass*(device: VkDevice; renderPass: VkRenderPass; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkGetRenderAreaGranularity*(device: VkDevice; renderPass: VkRenderPass; pGranularity: ptr VkExtent2D) {.cdecl, importc.}
  proc vkCreateCommandPool*(device: VkDevice; pCreateInfo: ptr VkCommandPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pCommandPool: ptr VkCommandPool): VkResult {.cdecl, importc.}
  proc vkDestroyCommandPool*(device: VkDevice; commandPool: VkCommandPool; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
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
  vkVersion11* = 1

##  Vulkan 1.1 version number

const
  vkApiVersion11* = vkMakeVersion(1, 1, 0) ##  Patch version should always be set to 0

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

  VkPhysicalDeviceVariablePointersFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    variablePointersStorageBuffer*: VkBool32
    variablePointers*: VkBool32

  VkPhysicalDeviceVariablePointerFeatures* = VkPhysicalDeviceVariablePointersFeatures
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
    offset*: csize_t
    stride*: csize_t

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

  VkPhysicalDeviceShaderDrawParametersFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderDrawParameters*: VkBool32

  VkPhysicalDeviceShaderDrawParameterFeatures* = VkPhysicalDeviceShaderDrawParametersFeatures
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
  PFNVkcreatesamplerycbcrconversion* = proc (device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pYcbcrConversion: ptr VkSamplerYcbcrConversion): VkResult {.cdecl.}
  PFNVkdestroysamplerycbcrconversion* = proc (device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversion; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcreatedescriptorupdatetemplate* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate): VkResult {.cdecl.}
  PFNVkdestroydescriptorupdatetemplate* = proc (device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkupdatedescriptorsetwithtemplate* = proc (device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pData: pointer) {.cdecl.}
  PFNVkgetphysicaldeviceexternalbufferproperties* = proc (physicalDevice: VkPhysicalDevice; pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfo; pExternalBufferProperties: ptr VkExternalBufferProperties) {.cdecl.}
  PFNVkgetphysicaldeviceexternalfenceproperties* = proc (physicalDevice: VkPhysicalDevice; pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfo; pExternalFenceProperties: ptr VkExternalFenceProperties) {.cdecl.}
  PFNVkgetphysicaldeviceexternalsemaphoreproperties* = proc (physicalDevice: VkPhysicalDevice; pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfo; pExternalSemaphoreProperties: ptr VkExternalSemaphoreProperties) {.cdecl.}
  PFNVkgetdescriptorsetlayoutsupport* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pSupport: ptr VkDescriptorSetLayoutSupport) {.cdecl.}

const
  vkPointClippingBehaviorAllClipPlanes* {.used.} = 0.VkPointClippingBehavior
  vkPointClippingBehaviorUserClipPlanesOnly* {.used.} = 1.VkPointClippingBehavior
  vkPointClippingBehaviorAllClipPlanesKhr* {.used.}: VkPointClippingBehavior = vkPointClippingBehaviorAllClipPlanes
  vkPointClippingBehaviorUserClipPlanesOnlyKhr* {.used.}: VkPointClippingBehavior = vkPointClippingBehaviorUserClipPlanesOnly
  vkPointClippingBehaviorMaxEnum* {.used.} = 0x7FFFFFFF.VkPointClippingBehavior

const
  vkTessellationDomainOriginUpperLeft* {.used.} = 0.VkTessellationDomainOrigin
  vkTessellationDomainOriginLowerLeft* {.used.} = 1.VkTessellationDomainOrigin
  vkTessellationDomainOriginUpperLeftKhr* {.used.}: VkTessellationDomainOrigin = vkTessellationDomainOriginUpperLeft
  vkTessellationDomainOriginLowerLeftKhr* {.used.}: VkTessellationDomainOrigin = vkTessellationDomainOriginLowerLeft
  vkTessellationDomainOriginMaxEnum* {.used.} = 0x7FFFFFFF.VkTessellationDomainOrigin

const
  vkSamplerYcbcrModelConversionRgbIdentity* {.used.} = 0.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionYcbcrIdentity* {.used.} = 1.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionYcbcr709* {.used.} = 2.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionYcbcr601* {.used.} = 3.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionYcbcr2020* {.used.} = 4.VkSamplerYcbcrModelConversion
  vkSamplerYcbcrModelConversionRgbIdentityKhr* {.used.}: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionRgbIdentity
  vkSamplerYcbcrModelConversionYcbcrIdentityKhr* {.used.}: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcrIdentity
  vkSamplerYcbcrModelConversionYcbcr709Khr* {.used.}: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcr709
  vkSamplerYcbcrModelConversionYcbcr601Khr* {.used.}: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcr601
  vkSamplerYcbcrModelConversionYcbcr2020Khr* {.used.}: VkSamplerYcbcrModelConversion = vkSamplerYcbcrModelConversionYcbcr2020
  vkSamplerYcbcrModelConversionMaxEnum* {.used.} = 0x7FFFFFFF.VkSamplerYcbcrModelConversion

const
  vkSamplerYcbcrRangeItuFull* {.used.} = 0.VkSamplerYcbcrRange
  vkSamplerYcbcrRangeItuNarrow* {.used.} = 1.VkSamplerYcbcrRange
  vkSamplerYcbcrRangeItuFullKhr* {.used.}: VkSamplerYcbcrRange = vkSamplerYcbcrRangeItuFull
  vkSamplerYcbcrRangeItuNarrowKhr* {.used.}: VkSamplerYcbcrRange = vkSamplerYcbcrRangeItuNarrow
  vkSamplerYcbcrRangeMaxEnum* {.used.} = 0x7FFFFFFF.VkSamplerYcbcrRange

const
  vkChromaLocationCositedEven* {.used.} = 0.VkChromaLocation
  vkChromaLocationMidpoint* {.used.} = 1.VkChromaLocation
  vkChromaLocationCositedEvenKhr* {.used.}: VkChromaLocation = vkChromaLocationCositedEven
  vkChromaLocationMidpointKhr* {.used.}: VkChromaLocation = vkChromaLocationMidpoint
  vkChromaLocationMaxEnum* {.used.} = 0x7FFFFFFF.VkChromaLocation

const
  vkDescriptorUpdateTemplateTypeDescriptorSet* {.used.} = 0.VkDescriptorUpdateTemplateType
  vkDescriptorUpdateTemplateTypePushDescriptorsKhr* {.used.} = 1.VkDescriptorUpdateTemplateType
  vkDescriptorUpdateTemplateTypeDescriptorSetKhr* {.used.}: VkDescriptorUpdateTemplateType = vkDescriptorUpdateTemplateTypeDescriptorSet
  vkDescriptorUpdateTemplateTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkDescriptorUpdateTemplateType

const
  vkSubgroupFeatureBasicBit* {.used.} = 0x00000001.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureVoteBit* {.used.} = 0x00000002.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureArithmeticBit* {.used.} = 0x00000004.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureBallotBit* {.used.} = 0x00000008.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureShuffleBit* {.used.} = 0x00000010.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureShuffleRelativeBit* {.used.} = 0x00000020.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureClusteredBit* {.used.} = 0x00000040.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureQuadBit* {.used.} = 0x00000080.VkSubgroupFeatureFlagBits
  vkSubgroupFeaturePartitionedBitNv* {.used.} = 0x00000100.VkSubgroupFeatureFlagBits
  vkSubgroupFeatureFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkSubgroupFeatureFlagBits

const
  vkPeerMemoryFeatureCopySrcBit* {.used.} = 0x00000001.VkPeerMemoryFeatureFlagBits
  vkPeerMemoryFeatureCopyDstBit* {.used.} = 0x00000002.VkPeerMemoryFeatureFlagBits
  vkPeerMemoryFeatureGenericSrcBit* {.used.} = 0x00000004.VkPeerMemoryFeatureFlagBits
  vkPeerMemoryFeatureGenericDstBit* {.used.} = 0x00000008.VkPeerMemoryFeatureFlagBits
  vkPeerMemoryFeatureCopySrcBitKhr* {.used.}: VkPeerMemoryFeatureFlagBits = vkPeerMemoryFeatureCopySrcBit
  vkPeerMemoryFeatureCopyDstBitKhr* {.used.}: VkPeerMemoryFeatureFlagBits = vkPeerMemoryFeatureCopyDstBit
  vkPeerMemoryFeatureGenericSrcBitKhr* {.used.}: VkPeerMemoryFeatureFlagBits = vkPeerMemoryFeatureGenericSrcBit
  vkPeerMemoryFeatureGenericDstBitKhr* {.used.}: VkPeerMemoryFeatureFlagBits = vkPeerMemoryFeatureGenericDstBit
  vkPeerMemoryFeatureFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkPeerMemoryFeatureFlagBits

const
  vkMemoryAllocateDeviceMaskBit* {.used.} = 0x00000001.VkMemoryAllocateFlagBits
  vkMemoryAllocateDeviceAddressBit* {.used.} = 0x00000002.VkMemoryAllocateFlagBits
  vkMemoryAllocateDeviceAddressCaptureReplayBit* {.used.} = 0x00000004.VkMemoryAllocateFlagBits
  vkMemoryAllocateDeviceMaskBitKhr* {.used.}: VkMemoryAllocateFlagBits = vkMemoryAllocateDeviceMaskBit
  vkMemoryAllocateDeviceAddressBitKhr* {.used.}: VkMemoryAllocateFlagBits = vkMemoryAllocateDeviceAddressBit
  vkMemoryAllocateDeviceAddressCaptureReplayBitKhr* {.used.}: VkMemoryAllocateFlagBits = vkMemoryAllocateDeviceAddressCaptureReplayBit
  vkMemoryAllocateFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkMemoryAllocateFlagBits

const
  vkExternalMemoryHandleTypeOpaqueFdBit* {.used.} = 0x00000001.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeOpaqueWin32Bit* {.used.} = 0x00000002.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeOpaqueWin32KmtBit* {.used.} = 0x00000004.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeD3d11TextureBit* {.used.} = 0x00000008.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeD3d11TextureKmtBit* {.used.} = 0x00000010.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeD3d12HeapBit* {.used.} = 0x00000020.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeD3d12ResourceBit* {.used.} = 0x00000040.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeHostAllocationBitExt* {.used.} = 0x00000080.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeHostMappedForeignMemoryBitExt* {.used.} = 0x00000100.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeOpaqueFdBitKhr* {.used.}: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeOpaqueFdBit
  vkExternalMemoryHandleTypeOpaqueWin32BitKhr* {.used.}: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeOpaqueWin32Bit
  vkExternalMemoryHandleTypeOpaqueWin32KmtBitKhr* {.used.}: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeOpaqueWin32KmtBit
  vkExternalMemoryHandleTypeD3d11TextureBitKhr* {.used.}: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeD3d11TextureBit
  vkExternalMemoryHandleTypeD3d11TextureKmtBitKhr* {.used.}: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeD3d11TextureKmtBit
  vkExternalMemoryHandleTypeD3d12HeapBitKhr* {.used.}: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeD3d12HeapBit
  vkExternalMemoryHandleTypeD3d12ResourceBitKhr* {.used.}: VkExternalMemoryHandleTypeFlagBits = vkExternalMemoryHandleTypeD3d12ResourceBit
  vkExternalMemoryHandleTypeDmaBufBitExt* {.used.} = 0x00000200.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeAndroidHardwareBufferBitAndroid* {.used.} = 0x00000400.VkExternalMemoryHandleTypeFlagBits
  vkExternalMemoryHandleTypeFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkExternalMemoryHandleTypeFlagBits

const
  vkExternalMemoryFeatureDedicatedOnlyBit* {.used.} = 0x00000001.VkExternalMemoryFeatureFlagBits
  vkExternalMemoryFeatureExportableBit* {.used.} = 0x00000002.VkExternalMemoryFeatureFlagBits
  vkExternalMemoryFeatureImportableBit* {.used.} = 0x00000004.VkExternalMemoryFeatureFlagBits
  vkExternalMemoryFeatureDedicatedOnlyBitKhr* {.used.}: VkExternalMemoryFeatureFlagBits = vkExternalMemoryFeatureDedicatedOnlyBit
  vkExternalMemoryFeatureExportableBitKhr* {.used.}: VkExternalMemoryFeatureFlagBits = vkExternalMemoryFeatureExportableBit
  vkExternalMemoryFeatureImportableBitKhr* {.used.}: VkExternalMemoryFeatureFlagBits = vkExternalMemoryFeatureImportableBit
  vkExternalMemoryFeatureFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkExternalMemoryFeatureFlagBits

const
  vkExternalFenceHandleTypeOpaqueFdBit* {.used.} = 0x00000001.VkExternalFenceHandleTypeFlagBits
  vkExternalFenceHandleTypeOpaqueWin32Bit* {.used.} = 0x00000002.VkExternalFenceHandleTypeFlagBits
  vkExternalFenceHandleTypeOpaqueWin32KmtBit* {.used.} = 0x00000004.VkExternalFenceHandleTypeFlagBits
  vkExternalFenceHandleTypeSyncFdBit* {.used.} = 0x00000008.VkExternalFenceHandleTypeFlagBits
  vkExternalFenceHandleTypeOpaqueFdBitKhr* {.used.}: VkExternalFenceHandleTypeFlagBits = vkExternalFenceHandleTypeOpaqueFdBit
  vkExternalFenceHandleTypeOpaqueWin32BitKhr* {.used.}: VkExternalFenceHandleTypeFlagBits = vkExternalFenceHandleTypeOpaqueWin32Bit
  vkExternalFenceHandleTypeOpaqueWin32KmtBitKhr* {.used.}: VkExternalFenceHandleTypeFlagBits = vkExternalFenceHandleTypeOpaqueWin32KmtBit
  vkExternalFenceHandleTypeSyncFdBitKhr* {.used.}: VkExternalFenceHandleTypeFlagBits = vkExternalFenceHandleTypeSyncFdBit
  vkExternalFenceHandleTypeFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkExternalFenceHandleTypeFlagBits

const
  vkExternalFenceFeatureExportableBit* {.used.} = 0x00000001.VkExternalFenceFeatureFlagBits
  vkExternalFenceFeatureImportableBit* {.used.} = 0x00000002.VkExternalFenceFeatureFlagBits
  vkExternalFenceFeatureExportableBitKhr* {.used.}: VkExternalFenceFeatureFlagBits = vkExternalFenceFeatureExportableBit
  vkExternalFenceFeatureImportableBitKhr* {.used.}: VkExternalFenceFeatureFlagBits = vkExternalFenceFeatureImportableBit
  vkExternalFenceFeatureFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkExternalFenceFeatureFlagBits

const
  vkFenceImportTemporaryBit* {.used.} = 0x00000001.VkFenceImportFlagBits
  vkFenceImportTemporaryBitKhr* {.used.}: VkFenceImportFlagBits = vkFenceImportTemporaryBit
  vkFenceImportFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkFenceImportFlagBits

const
  vkSemaphoreImportTemporaryBit* {.used.} = 0x00000001.VkSemaphoreImportFlagBits
  vkSemaphoreImportTemporaryBitKhr* {.used.}: VkSemaphoreImportFlagBits = vkSemaphoreImportTemporaryBit
  vkSemaphoreImportFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkSemaphoreImportFlagBits

const
  vkExternalSemaphoreHandleTypeOpaqueFdBit* {.used.} = 0x00000001.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeOpaqueWin32Bit* {.used.} = 0x00000002.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeOpaqueWin32KmtBit* {.used.} = 0x00000004.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeD3d12FenceBit* {.used.} = 0x00000008.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeSyncFdBit* {.used.} = 0x00000010.VkExternalSemaphoreHandleTypeFlagBits
  vkExternalSemaphoreHandleTypeD3d11FenceBit* {.used.}: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeD3d12FenceBit
  vkExternalSemaphoreHandleTypeOpaqueFdBitKhr* {.used.}: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeOpaqueFdBit
  vkExternalSemaphoreHandleTypeOpaqueWin32BitKhr* {.used.}: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeOpaqueWin32Bit
  vkExternalSemaphoreHandleTypeOpaqueWin32KmtBitKhr* {.used.}: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeOpaqueWin32KmtBit
  vkExternalSemaphoreHandleTypeD3d12FenceBitKhr* {.used.}: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeD3d12FenceBit
  vkExternalSemaphoreHandleTypeSyncFdBitKhr* {.used.}: VkExternalSemaphoreHandleTypeFlagBits = vkExternalSemaphoreHandleTypeSyncFdBit
  vkExternalSemaphoreHandleTypeFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkExternalSemaphoreHandleTypeFlagBits

const
  vkExternalSemaphoreFeatureExportableBit* {.used.} = 0x00000001.VkExternalSemaphoreFeatureFlagBits
  vkExternalSemaphoreFeatureImportableBit* {.used.} = 0x00000002.VkExternalSemaphoreFeatureFlagBits
  vkExternalSemaphoreFeatureExportableBitKhr* {.used.}: VkExternalSemaphoreFeatureFlagBits = vkExternalSemaphoreFeatureExportableBit
  vkExternalSemaphoreFeatureImportableBitKhr* {.used.}: VkExternalSemaphoreFeatureFlagBits = vkExternalSemaphoreFeatureImportableBit
  vkExternalSemaphoreFeatureFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkExternalSemaphoreFeatureFlagBits

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
  proc vkCreateSamplerYcbcrConversion*(device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pYcbcrConversion: ptr VkSamplerYcbcrConversion): VkResult {.cdecl, importc.}
  proc vkDestroySamplerYcbcrConversion*(device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversion; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCreateDescriptorUpdateTemplate*(device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorUpdateTemplate*(device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkUpdateDescriptorSetWithTemplate*(device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pData: pointer) {.cdecl, importc.}
  proc vkGetPhysicalDeviceExternalBufferProperties*(physicalDevice: VkPhysicalDevice; pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfo; pExternalBufferProperties: ptr VkExternalBufferProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceExternalFenceProperties*(physicalDevice: VkPhysicalDevice; pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfo; pExternalFenceProperties: ptr VkExternalFenceProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceExternalSemaphoreProperties*(physicalDevice: VkPhysicalDevice; pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfo; pExternalSemaphoreProperties: ptr VkExternalSemaphoreProperties) {.cdecl, importc.}
  proc vkGetDescriptorSetLayoutSupport*(device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pSupport: ptr VkDescriptorSetLayoutSupport) {.cdecl, importc.}
const
  vkVersion12* = 1

##  Vulkan 1.2 version number

const
  vkApiVersion12* = vkMakeVersion(1, 2, 0) ##  Patch version should always be set to 0
  vkMaxDriverNameSize* = 256
  vkMaxDriverInfoSize* = 256

type
  VkDriverId* = distinct cint
  VkShaderFloatControlsIndependence* = distinct cint
  VkSamplerReductionMode* = distinct cint
  VkSemaphoreType* = distinct cint
  VkResolveModeFlagBits* = distinct cint
  VkResolveModeFlags* = VkFlags
  VkDescriptorBindingFlagBits* = distinct cint
  VkDescriptorBindingFlags* = VkFlags
  VkSemaphoreWaitFlagBits* = distinct cint
  VkSemaphoreWaitFlags* = VkFlags
  VkPhysicalDeviceVulkan11Features* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    storageBuffer16BitAccess*: VkBool32
    uniformAndStorageBuffer16BitAccess*: VkBool32
    storagePushConstant16*: VkBool32
    storageInputOutput16*: VkBool32
    multiview*: VkBool32
    multiviewGeometryShader*: VkBool32
    multiviewTessellationShader*: VkBool32
    variablePointersStorageBuffer*: VkBool32
    variablePointers*: VkBool32
    protectedMemory*: VkBool32
    samplerYcbcrConversion*: VkBool32
    shaderDrawParameters*: VkBool32

  VkPhysicalDeviceVulkan11Properties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceUUID*: array[vkUuidSize, uint8]
    driverUUID*: array[vkUuidSize, uint8]
    deviceLUID*: array[vkLuidSize, uint8]
    deviceNodeMask*: uint32
    deviceLUIDValid*: VkBool32
    subgroupSize*: uint32
    subgroupSupportedStages*: VkShaderStageFlags
    subgroupSupportedOperations*: VkSubgroupFeatureFlags
    subgroupQuadOperationsInAllStages*: VkBool32
    pointClippingBehavior*: VkPointClippingBehavior
    maxMultiviewViewCount*: uint32
    maxMultiviewInstanceIndex*: uint32
    protectedNoFault*: VkBool32
    maxPerSetDescriptors*: uint32
    maxMemoryAllocationSize*: VkDeviceSize

  VkPhysicalDeviceVulkan12Features* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    samplerMirrorClampToEdge*: VkBool32
    drawIndirectCount*: VkBool32
    storageBuffer8BitAccess*: VkBool32
    uniformAndStorageBuffer8BitAccess*: VkBool32
    storagePushConstant8*: VkBool32
    shaderBufferInt64Atomics*: VkBool32
    shaderSharedInt64Atomics*: VkBool32
    shaderFloat16*: VkBool32
    shaderInt8*: VkBool32
    descriptorIndexing*: VkBool32
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
    samplerFilterMinmax*: VkBool32
    scalarBlockLayout*: VkBool32
    imagelessFramebuffer*: VkBool32
    uniformBufferStandardLayout*: VkBool32
    shaderSubgroupExtendedTypes*: VkBool32
    separateDepthStencilLayouts*: VkBool32
    hostQueryReset*: VkBool32
    timelineSemaphore*: VkBool32
    bufferDeviceAddress*: VkBool32
    bufferDeviceAddressCaptureReplay*: VkBool32
    bufferDeviceAddressMultiDevice*: VkBool32
    vulkanMemoryModel*: VkBool32
    vulkanMemoryModelDeviceScope*: VkBool32
    vulkanMemoryModelAvailabilityVisibilityChains*: VkBool32
    shaderOutputViewportIndex*: VkBool32
    shaderOutputLayer*: VkBool32
    subgroupBroadcastDynamicId*: VkBool32

  VkConformanceVersion* {.bycopy.} = object
    major*: uint8
    minor*: uint8
    subminor*: uint8
    patch*: uint8

  VkPhysicalDeviceVulkan12Properties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    driverID*: VkDriverId
    driverName*: array[vkMaxDriverNameSize, char]
    driverInfo*: array[vkMaxDriverInfoSize, char]
    conformanceVersion*: VkConformanceVersion
    denormBehaviorIndependence*: VkShaderFloatControlsIndependence
    roundingModeIndependence*: VkShaderFloatControlsIndependence
    shaderSignedZeroInfNanPreserveFloat16*: VkBool32
    shaderSignedZeroInfNanPreserveFloat32*: VkBool32
    shaderSignedZeroInfNanPreserveFloat64*: VkBool32
    shaderDenormPreserveFloat16*: VkBool32
    shaderDenormPreserveFloat32*: VkBool32
    shaderDenormPreserveFloat64*: VkBool32
    shaderDenormFlushToZeroFloat16*: VkBool32
    shaderDenormFlushToZeroFloat32*: VkBool32
    shaderDenormFlushToZeroFloat64*: VkBool32
    shaderRoundingModeRTEFloat16*: VkBool32
    shaderRoundingModeRTEFloat32*: VkBool32
    shaderRoundingModeRTEFloat64*: VkBool32
    shaderRoundingModeRTZFloat16*: VkBool32
    shaderRoundingModeRTZFloat32*: VkBool32
    shaderRoundingModeRTZFloat64*: VkBool32
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
    supportedDepthResolveModes*: VkResolveModeFlags
    supportedStencilResolveModes*: VkResolveModeFlags
    independentResolveNone*: VkBool32
    independentResolve*: VkBool32
    filterMinmaxSingleComponentFormats*: VkBool32
    filterMinmaxImageComponentMapping*: VkBool32
    maxTimelineSemaphoreValueDifference*: uint64
    framebufferIntegerColorSampleCounts*: VkSampleCountFlags

  VkImageFormatListCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    viewFormatCount*: uint32
    pViewFormats*: ptr VkFormat

  VkAttachmentDescription2* {.bycopy.} = object
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

  VkAttachmentReference2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    attachment*: uint32
    layout*: VkImageLayout
    aspectMask*: VkImageAspectFlags

  VkSubpassDescription2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSubpassDescriptionFlags
    pipelineBindPoint*: VkPipelineBindPoint
    viewMask*: uint32
    inputAttachmentCount*: uint32
    pInputAttachments*: ptr VkAttachmentReference2
    colorAttachmentCount*: uint32
    pColorAttachments*: ptr VkAttachmentReference2
    pResolveAttachments*: ptr VkAttachmentReference2
    pDepthStencilAttachment*: ptr VkAttachmentReference2
    preserveAttachmentCount*: uint32
    pPreserveAttachments*: ptr uint32

  VkSubpassDependency2* {.bycopy.} = object
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

  VkRenderPassCreateInfo2* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkRenderPassCreateFlags
    attachmentCount*: uint32
    pAttachments*: ptr VkAttachmentDescription2
    subpassCount*: uint32
    pSubpasses*: ptr VkSubpassDescription2
    dependencyCount*: uint32
    pDependencies*: ptr VkSubpassDependency2
    correlatedViewMaskCount*: uint32
    pCorrelatedViewMasks*: ptr uint32

  VkSubpassBeginInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    contents*: VkSubpassContents

  VkSubpassEndInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer

  VkPhysicalDevice8BitStorageFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    storageBuffer8BitAccess*: VkBool32
    uniformAndStorageBuffer8BitAccess*: VkBool32
    storagePushConstant8*: VkBool32

  VkPhysicalDeviceDriverProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    driverID*: VkDriverId
    driverName*: array[vkMaxDriverNameSize, char]
    driverInfo*: array[vkMaxDriverInfoSize, char]
    conformanceVersion*: VkConformanceVersion

  VkPhysicalDeviceShaderAtomicInt64Features* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderBufferInt64Atomics*: VkBool32
    shaderSharedInt64Atomics*: VkBool32

  VkPhysicalDeviceShaderFloat16Int8Features* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderFloat16*: VkBool32
    shaderInt8*: VkBool32

  VkPhysicalDeviceFloatControlsProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    denormBehaviorIndependence*: VkShaderFloatControlsIndependence
    roundingModeIndependence*: VkShaderFloatControlsIndependence
    shaderSignedZeroInfNanPreserveFloat16*: VkBool32
    shaderSignedZeroInfNanPreserveFloat32*: VkBool32
    shaderSignedZeroInfNanPreserveFloat64*: VkBool32
    shaderDenormPreserveFloat16*: VkBool32
    shaderDenormPreserveFloat32*: VkBool32
    shaderDenormPreserveFloat64*: VkBool32
    shaderDenormFlushToZeroFloat16*: VkBool32
    shaderDenormFlushToZeroFloat32*: VkBool32
    shaderDenormFlushToZeroFloat64*: VkBool32
    shaderRoundingModeRTEFloat16*: VkBool32
    shaderRoundingModeRTEFloat32*: VkBool32
    shaderRoundingModeRTEFloat64*: VkBool32
    shaderRoundingModeRTZFloat16*: VkBool32
    shaderRoundingModeRTZFloat32*: VkBool32
    shaderRoundingModeRTZFloat64*: VkBool32

  VkDescriptorSetLayoutBindingFlagsCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    bindingCount*: uint32
    pBindingFlags*: ptr VkDescriptorBindingFlags

  VkPhysicalDeviceDescriptorIndexingFeatures* {.bycopy.} = object
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

  VkPhysicalDeviceDescriptorIndexingProperties* {.bycopy.} = object
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

  VkDescriptorSetVariableDescriptorCountAllocateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    descriptorSetCount*: uint32
    pDescriptorCounts*: ptr uint32

  VkDescriptorSetVariableDescriptorCountLayoutSupport* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxVariableDescriptorCount*: uint32

  VkSubpassDescriptionDepthStencilResolve* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    depthResolveMode*: VkResolveModeFlagBits
    stencilResolveMode*: VkResolveModeFlagBits
    pDepthStencilResolveAttachment*: ptr VkAttachmentReference2

  VkPhysicalDeviceDepthStencilResolveProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    supportedDepthResolveModes*: VkResolveModeFlags
    supportedStencilResolveModes*: VkResolveModeFlags
    independentResolveNone*: VkBool32
    independentResolve*: VkBool32

  VkPhysicalDeviceScalarBlockLayoutFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    scalarBlockLayout*: VkBool32

  VkImageStencilUsageCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    stencilUsage*: VkImageUsageFlags

  VkSamplerReductionModeCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    reductionMode*: VkSamplerReductionMode

  VkPhysicalDeviceSamplerFilterMinmaxProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    filterMinmaxSingleComponentFormats*: VkBool32
    filterMinmaxImageComponentMapping*: VkBool32

  VkPhysicalDeviceVulkanMemoryModelFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    vulkanMemoryModel*: VkBool32
    vulkanMemoryModelDeviceScope*: VkBool32
    vulkanMemoryModelAvailabilityVisibilityChains*: VkBool32

  VkPhysicalDeviceImagelessFramebufferFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    imagelessFramebuffer*: VkBool32

  VkFramebufferAttachmentImageInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkImageCreateFlags
    usage*: VkImageUsageFlags
    width*: uint32
    height*: uint32
    layerCount*: uint32
    viewFormatCount*: uint32
    pViewFormats*: ptr VkFormat

  VkFramebufferAttachmentsCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    attachmentImageInfoCount*: uint32
    pAttachmentImageInfos*: ptr VkFramebufferAttachmentImageInfo

  VkRenderPassAttachmentBeginInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    attachmentCount*: uint32
    pAttachments*: ptr VkImageView

  VkPhysicalDeviceUniformBufferStandardLayoutFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    uniformBufferStandardLayout*: VkBool32

  VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderSubgroupExtendedTypes*: VkBool32

  VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    separateDepthStencilLayouts*: VkBool32

  VkAttachmentReferenceStencilLayout* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    stencilLayout*: VkImageLayout

  VkAttachmentDescriptionStencilLayout* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    stencilInitialLayout*: VkImageLayout
    stencilFinalLayout*: VkImageLayout

  VkPhysicalDeviceHostQueryResetFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    hostQueryReset*: VkBool32

  VkPhysicalDeviceTimelineSemaphoreFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    timelineSemaphore*: VkBool32

  VkPhysicalDeviceTimelineSemaphoreProperties* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxTimelineSemaphoreValueDifference*: uint64

  VkSemaphoreTypeCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    semaphoreType*: VkSemaphoreType
    initialValue*: uint64

  VkTimelineSemaphoreSubmitInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreValueCount*: uint32
    pWaitSemaphoreValues*: ptr uint64
    signalSemaphoreValueCount*: uint32
    pSignalSemaphoreValues*: ptr uint64

  VkSemaphoreWaitInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSemaphoreWaitFlags
    semaphoreCount*: uint32
    pSemaphores*: ptr VkSemaphore
    pValues*: ptr uint64

  VkSemaphoreSignalInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    value*: uint64

  VkPhysicalDeviceBufferDeviceAddressFeatures* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    bufferDeviceAddress*: VkBool32
    bufferDeviceAddressCaptureReplay*: VkBool32
    bufferDeviceAddressMultiDevice*: VkBool32

  VkBufferDeviceAddressInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer

  VkBufferOpaqueCaptureAddressCreateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    opaqueCaptureAddress*: uint64

  VkMemoryOpaqueCaptureAddressAllocateInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    opaqueCaptureAddress*: uint64

  VkDeviceMemoryOpaqueCaptureAddressInfo* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory

  PFNVkcmddrawindirectcount* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcmddrawindexedindirectcount* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcreaterenderpass2* = proc (device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo2; pAllocator: ptr VkAllocationCallbacks = nil; pRenderPass: ptr VkRenderPass): VkResult {.cdecl.}
  PFNVkcmdbeginrenderpass2* = proc (commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; pSubpassBeginInfo: ptr VkSubpassBeginInfo) {.cdecl.}
  PFNVkcmdnextsubpass2* = proc (commandBuffer: VkCommandBuffer; pSubpassBeginInfo: ptr VkSubpassBeginInfo; pSubpassEndInfo: ptr VkSubpassEndInfo) {.cdecl.}
  PFNVkcmdendrenderpass2* = proc (commandBuffer: VkCommandBuffer; pSubpassEndInfo: ptr VkSubpassEndInfo) {.cdecl.}
  PFNVkresetquerypool* = proc (device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32) {.cdecl.}
  PFNVkgetsemaphorecountervalue* = proc (device: VkDevice; semaphore: VkSemaphore; pValue: ptr uint64): VkResult {.cdecl.}
  PFNVkwaitsemaphores* = proc (device: VkDevice; pWaitInfo: ptr VkSemaphoreWaitInfo; timeout: uint64): VkResult {.cdecl.}
  PFNVksignalsemaphore* = proc (device: VkDevice; pSignalInfo: ptr VkSemaphoreSignalInfo): VkResult {.cdecl.}
  PFNVkgetbufferdeviceaddress* = proc (device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): VkDeviceAddress {.cdecl.}
  PFNVkgetbufferopaquecaptureaddress* = proc (device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): uint64 {.cdecl.}
  PFNVkgetdevicememoryopaquecaptureaddress* = proc (device: VkDevice; pInfo: ptr VkDeviceMemoryOpaqueCaptureAddressInfo): uint64 {.cdecl.}

const
  vkDriverIdAmdProprietary* {.used.} = 1.VkDriverId
  vkDriverIdAmdOpenSource* {.used.} = 2.VkDriverId
  vkDriverIdMesaRadv* {.used.} = 3.VkDriverId
  vkDriverIdNvidiaProprietary* {.used.} = 4.VkDriverId
  vkDriverIdIntelProprietaryWindows* {.used.} = 5.VkDriverId
  vkDriverIdIntelOpenSourceMesa* {.used.} = 6.VkDriverId
  vkDriverIdImaginationProprietary* {.used.} = 7.VkDriverId
  vkDriverIdQualcommProprietary* {.used.} = 8.VkDriverId
  vkDriverIdArmProprietary* {.used.} = 9.VkDriverId
  vkDriverIdGoogleSwiftshader* {.used.} = 10.VkDriverId
  vkDriverIdGgpProprietary* {.used.} = 11.VkDriverId
  vkDriverIdBroadcomProprietary* {.used.} = 12.VkDriverId
  vkDriverIdMesaLlvmpipe* {.used.} = 13.VkDriverId
  vkDriverIdMoltenvk* {.used.} = 14.VkDriverId
  vkDriverIdAmdProprietaryKhr* {.used.}: VkDriverId = vkDriverIdAmdProprietary
  vkDriverIdAmdOpenSourceKhr* {.used.}: VkDriverId = vkDriverIdAmdOpenSource
  vkDriverIdMesaRadvKhr* {.used.}: VkDriverId = vkDriverIdMesaRadv
  vkDriverIdNvidiaProprietaryKhr* {.used.}: VkDriverId = vkDriverIdNvidiaProprietary
  vkDriverIdIntelProprietaryWindowsKhr* {.used.}: VkDriverId = vkDriverIdIntelProprietaryWindows
  vkDriverIdIntelOpenSourceMesaKhr* {.used.}: VkDriverId = vkDriverIdIntelOpenSourceMesa
  vkDriverIdImaginationProprietaryKhr* {.used.}: VkDriverId = vkDriverIdImaginationProprietary
  vkDriverIdQualcommProprietaryKhr* {.used.}: VkDriverId = vkDriverIdQualcommProprietary
  vkDriverIdArmProprietaryKhr* {.used.}: VkDriverId = vkDriverIdArmProprietary
  vkDriverIdGoogleSwiftshaderKhr* {.used.}: VkDriverId = vkDriverIdGoogleSwiftshader
  vkDriverIdGgpProprietaryKhr* {.used.}: VkDriverId = vkDriverIdGgpProprietary
  vkDriverIdBroadcomProprietaryKhr* {.used.}: VkDriverId = vkDriverIdBroadcomProprietary
  vkDriverIdMaxEnum* {.used.} = 0x7FFFFFFF.VkDriverId

const
  vkShaderFloatControlsIndependence32BitOnly* {.used.} = 0.VkShaderFloatControlsIndependence
  vkShaderFloatControlsIndependenceAll* {.used.} = 1.VkShaderFloatControlsIndependence
  vkShaderFloatControlsIndependenceNone* {.used.} = 2.VkShaderFloatControlsIndependence
  vkShaderFloatControlsIndependence32BitOnlyKhr* {.used.}: VkShaderFloatControlsIndependence = vkShaderFloatControlsIndependence32BitOnly
  vkShaderFloatControlsIndependenceAllKhr* {.used.}: VkShaderFloatControlsIndependence = vkShaderFloatControlsIndependenceAll
  vkShaderFloatControlsIndependenceNoneKhr* {.used.}: VkShaderFloatControlsIndependence = vkShaderFloatControlsIndependenceNone
  vkShaderFloatControlsIndependenceMaxEnum* {.used.} = 0x7FFFFFFF.VkShaderFloatControlsIndependence

const
  vkSamplerReductionModeWeightedAverage* {.used.} = 0.VkSamplerReductionMode
  vkSamplerReductionModeMin* {.used.} = 1.VkSamplerReductionMode
  vkSamplerReductionModeMax* {.used.} = 2.VkSamplerReductionMode
  vkSamplerReductionModeWeightedAverageExt* {.used.}: VkSamplerReductionMode = vkSamplerReductionModeWeightedAverage
  vkSamplerReductionModeMinExt* {.used.}: VkSamplerReductionMode = vkSamplerReductionModeMin
  vkSamplerReductionModeMaxExt* {.used.}: VkSamplerReductionMode = vkSamplerReductionModeMax
  vkSamplerReductionModeMaxEnum* {.used.} = 0x7FFFFFFF.VkSamplerReductionMode

const
  vkSemaphoreTypeBinary* {.used.} = 0.VkSemaphoreType
  vkSemaphoreTypeTimeline* {.used.} = 1.VkSemaphoreType
  vkSemaphoreTypeBinaryKhr* {.used.}: VkSemaphoreType = vkSemaphoreTypeBinary
  vkSemaphoreTypeTimelineKhr* {.used.}: VkSemaphoreType = vkSemaphoreTypeTimeline
  vkSemaphoreTypeMaxEnum* {.used.} = 0x7FFFFFFF.VkSemaphoreType

const
  vkResolveModeNone* {.used.} = 0.VkResolveModeFlagBits
  vkResolveModeSampleZeroBit* {.used.} = 0x00000001.VkResolveModeFlagBits
  vkResolveModeAverageBit* {.used.} = 0x00000002.VkResolveModeFlagBits
  vkResolveModeMinBit* {.used.} = 0x00000004.VkResolveModeFlagBits
  vkResolveModeMaxBit* {.used.} = 0x00000008.VkResolveModeFlagBits
  vkResolveModeNoneKhr* {.used.}: VkResolveModeFlagBits = vkResolveModeNone
  vkResolveModeSampleZeroBitKhr* {.used.}: VkResolveModeFlagBits = vkResolveModeSampleZeroBit
  vkResolveModeAverageBitKhr* {.used.}: VkResolveModeFlagBits = vkResolveModeAverageBit
  vkResolveModeMinBitKhr* {.used.}: VkResolveModeFlagBits = vkResolveModeMinBit
  vkResolveModeMaxBitKhr* {.used.}: VkResolveModeFlagBits = vkResolveModeMaxBit
  vkResolveModeFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkResolveModeFlagBits

const
  vkDescriptorBindingUpdateAfterBindBit* {.used.} = 0x00000001.VkDescriptorBindingFlagBits
  vkDescriptorBindingUpdateUnusedWhilePendingBit* {.used.} = 0x00000002.VkDescriptorBindingFlagBits
  vkDescriptorBindingPartiallyBoundBit* {.used.} = 0x00000004.VkDescriptorBindingFlagBits
  vkDescriptorBindingVariableDescriptorCountBit* {.used.} = 0x00000008.VkDescriptorBindingFlagBits
  vkDescriptorBindingUpdateAfterBindBitExt* {.used.}: VkDescriptorBindingFlagBits = vkDescriptorBindingUpdateAfterBindBit
  vkDescriptorBindingUpdateUnusedWhilePendingBitExt* {.used.}: VkDescriptorBindingFlagBits = vkDescriptorBindingUpdateUnusedWhilePendingBit
  vkDescriptorBindingPartiallyBoundBitExt* {.used.}: VkDescriptorBindingFlagBits = vkDescriptorBindingPartiallyBoundBit
  vkDescriptorBindingVariableDescriptorCountBitExt* {.used.}: VkDescriptorBindingFlagBits = vkDescriptorBindingVariableDescriptorCountBit
  vkDescriptorBindingFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkDescriptorBindingFlagBits

const
  vkSemaphoreWaitAnyBit* {.used.} = 0x00000001.VkSemaphoreWaitFlagBits
  vkSemaphoreWaitAnyBitKhr* {.used.}: VkSemaphoreWaitFlagBits = vkSemaphoreWaitAnyBit
  vkSemaphoreWaitFlagBitsMaxEnum* {.used.} = 0x7FFFFFFF.VkSemaphoreWaitFlagBits

when not defined(vkNoPrototypes):
  proc vkCmdDrawIndirectCount*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexedIndirectCount*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCreateRenderPass2*(device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo2; pAllocator: ptr VkAllocationCallbacks = nil; pRenderPass: ptr VkRenderPass): VkResult {.cdecl, importc.}
  proc vkCmdBeginRenderPass2*(commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; pSubpassBeginInfo: ptr VkSubpassBeginInfo) {.cdecl, importc.}
  proc vkCmdNextSubpass2*(commandBuffer: VkCommandBuffer; pSubpassBeginInfo: ptr VkSubpassBeginInfo; pSubpassEndInfo: ptr VkSubpassEndInfo) {.cdecl, importc.}
  proc vkCmdEndRenderPass2*(commandBuffer: VkCommandBuffer; pSubpassEndInfo: ptr VkSubpassEndInfo) {.cdecl, importc.}
  proc vkResetQueryPool*(device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32) {.cdecl, importc.}
  proc vkGetSemaphoreCounterValue*(device: VkDevice; semaphore: VkSemaphore; pValue: ptr uint64): VkResult {.cdecl, importc.}
  proc vkWaitSemaphores*(device: VkDevice; pWaitInfo: ptr VkSemaphoreWaitInfo; timeout: uint64): VkResult {.cdecl, importc.}
  proc vkSignalSemaphore*(device: VkDevice; pSignalInfo: ptr VkSemaphoreSignalInfo): VkResult {.cdecl, importc.}
  proc vkGetBufferDeviceAddress*(device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): VkDeviceAddress {.cdecl, importc.}
  proc vkGetBufferOpaqueCaptureAddress*(device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): uint64 {.cdecl, importc.}
  proc vkGetDeviceMemoryOpaqueCaptureAddress*(device: VkDevice; pInfo: ptr VkDeviceMemoryOpaqueCaptureAddressInfo): uint64 {.cdecl, importc.}
const
  vkKhrSurface* = 1

type
  VkSurfaceKHR* = VkNonDispatchableHandle

const
  vkKhrSurfaceSpecVersion* = 25
  vkKhrSurfaceExtensionName* = "VK_KHR_surface"

type
  VkPresentModeKHR* = distinct cint
  VkColorSpaceKHR* = distinct cint
  VkSurfaceTransformFlagBitsKHR* = distinct cint
  VkCompositeAlphaFlagBitsKHR* = distinct cint
  VkCompositeAlphaFlagsKHR* = VkFlags
  VkSurfaceTransformFlagsKHR* = VkFlags
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

  PFNVkdestroysurfacekhr* = proc (instance: VkInstance; surface: VkSurfaceKHR; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgetphysicaldevicesurfacesupportkhr* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; surface: VkSurfaceKHR; pSupported: ptr VkBool32): VkResult {.cdecl.}
  PFNVkgetphysicaldevicesurfacecapabilitieskhr* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicesurfaceformatskhr* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormatKHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicesurfacepresentmodeskhr* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pPresentModeCount: ptr uint32; pPresentModes: ptr VkPresentModeKHR): VkResult {.cdecl.}

const
  vkPresentModeImmediateKhr* {.used.} = 0.VkPresentModeKHR
  vkPresentModeMailboxKhr* {.used.} = 1.VkPresentModeKHR
  vkPresentModeFifoKhr* {.used.} = 2.VkPresentModeKHR
  vkPresentModeFifoRelaxedKhr* {.used.} = 3.VkPresentModeKHR
  vkPresentModeSharedDemandRefreshKhr* {.used.} = 1000111000.VkPresentModeKHR
  vkPresentModeSharedContinuousRefreshKhr* {.used.} = 1000111001.VkPresentModeKHR
  vkPresentModeMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkPresentModeKHR

const
  vkColorSpaceSrgbNonlinearKhr* {.used.} = 0.VkColorSpaceKHR
  vkColorSpaceDisplayP3NonlinearExt* {.used.} = 1000104001.VkColorSpaceKHR
  vkColorSpaceExtendedSrgbLinearExt* {.used.} = 1000104002.VkColorSpaceKHR
  vkColorSpaceDisplayP3LinearExt* {.used.} = 1000104003.VkColorSpaceKHR
  vkColorSpaceDciP3NonlinearExt* {.used.} = 1000104004.VkColorSpaceKHR
  vkColorSpaceBt709LinearExt* {.used.} = 1000104005.VkColorSpaceKHR
  vkColorSpaceBt709NonlinearExt* {.used.} = 1000104006.VkColorSpaceKHR
  vkColorSpaceBt2020LinearExt* {.used.} = 1000104007.VkColorSpaceKHR
  vkColorSpaceHdr10St2084Ext* {.used.} = 1000104008.VkColorSpaceKHR
  vkColorSpaceDolbyvisionExt* {.used.} = 1000104009.VkColorSpaceKHR
  vkColorSpaceHdr10HlgExt* {.used.} = 1000104010.VkColorSpaceKHR
  vkColorSpaceAdobergbLinearExt* {.used.} = 1000104011.VkColorSpaceKHR
  vkColorSpaceAdobergbNonlinearExt* {.used.} = 1000104012.VkColorSpaceKHR
  vkColorSpacePassThroughExt* {.used.} = 1000104013.VkColorSpaceKHR
  vkColorSpaceExtendedSrgbNonlinearExt* {.used.} = 1000104014.VkColorSpaceKHR
  vkColorSpaceDisplayNativeAmd* {.used.} = 1000213000.VkColorSpaceKHR
  vkColorSpaceDciP3LinearExt* {.used.}: VkColorSpaceKHR = vkColorSpaceDisplayP3LinearExt
  vkColorSpaceMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkColorSpaceKHR

const
  vkSurfaceTransformIdentityBitKhr* {.used.} = 0x00000001.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformRotate90BitKhr* {.used.} = 0x00000002.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformRotate180BitKhr* {.used.} = 0x00000004.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformRotate270BitKhr* {.used.} = 0x00000008.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformHorizontalMirrorBitKhr* {.used.} = 0x00000010.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformHorizontalMirrorRotate90BitKhr* {.used.} = 0x00000020.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformHorizontalMirrorRotate180BitKhr* {.used.} = 0x00000040.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformHorizontalMirrorRotate270BitKhr* {.used.} = 0x00000080.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformInheritBitKhr* {.used.} = 0x00000100.VkSurfaceTransformFlagBitsKHR
  vkSurfaceTransformFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkSurfaceTransformFlagBitsKHR

const
  vkCompositeAlphaOpaqueBitKhr* {.used.} = 0x00000001.VkCompositeAlphaFlagBitsKHR
  vkCompositeAlphaPreMultipliedBitKhr* {.used.} = 0x00000002.VkCompositeAlphaFlagBitsKHR
  vkCompositeAlphaPostMultipliedBitKhr* {.used.} = 0x00000004.VkCompositeAlphaFlagBitsKHR
  vkCompositeAlphaInheritBitKhr* {.used.} = 0x00000008.VkCompositeAlphaFlagBitsKHR
  vkCompositeAlphaFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkCompositeAlphaFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkDestroySurfaceKHR*(instance: VkInstance; surface: VkSurfaceKHR; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
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
  vkKhrSwapchainExtensionName* = "VK_KHR_swapchain"

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

  PFNVkcreateswapchainkhr* = proc (device: VkDevice; pCreateInfo: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pSwapchain: ptr VkSwapchainKHR): VkResult {.cdecl.}
  PFNVkdestroyswapchainkhr* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgetswapchainimageskhr* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pSwapchainImageCount: ptr uint32; pSwapchainImages: ptr VkImage): VkResult {.cdecl.}
  PFNVkacquirenextimagekhr* = proc (device: VkDevice; swapchain: VkSwapchainKHR; timeout: uint64; semaphore: VkSemaphore; fence: VkFence; pImageIndex: ptr uint32): VkResult {.cdecl.}
  PFNVkqueuepresentkhr* = proc (queue: VkQueue; pPresentInfo: ptr VkPresentInfoKHR): VkResult {.cdecl.}
  PFNVkgetdevicegrouppresentcapabilitieskhr* = proc (device: VkDevice; pDeviceGroupPresentCapabilities: ptr VkDeviceGroupPresentCapabilitiesKHR): VkResult {.cdecl.}
  PFNVkgetdevicegroupsurfacepresentmodeskhr* = proc (device: VkDevice; surface: VkSurfaceKHR; pModes: ptr VkDeviceGroupPresentModeFlagsKHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicepresentrectangleskhr* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pRectCount: ptr uint32; pRects: ptr VkRect2D): VkResult {.cdecl.}
  PFNVkacquirenextimage2khr* = proc (device: VkDevice; pAcquireInfo: ptr VkAcquireNextImageInfoKHR; pImageIndex: ptr uint32): VkResult {.cdecl.}

const
  vkSwapchainCreateSplitInstanceBindRegionsBitKhr* {.used.} = 0x00000001.VkSwapchainCreateFlagBitsKHR
  vkSwapchainCreateProtectedBitKhr* {.used.} = 0x00000002.VkSwapchainCreateFlagBitsKHR
  vkSwapchainCreateMutableFormatBitKhr* {.used.} = 0x00000004.VkSwapchainCreateFlagBitsKHR
  vkSwapchainCreateFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkSwapchainCreateFlagBitsKHR

const
  vkDeviceGroupPresentModeLocalBitKhr* {.used.} = 0x00000001.VkDeviceGroupPresentModeFlagBitsKHR
  vkDeviceGroupPresentModeRemoteBitKhr* {.used.} = 0x00000002.VkDeviceGroupPresentModeFlagBitsKHR
  vkDeviceGroupPresentModeSumBitKhr* {.used.} = 0x00000004.VkDeviceGroupPresentModeFlagBitsKHR
  vkDeviceGroupPresentModeLocalMultiDeviceBitKhr* {.used.} = 0x00000008.VkDeviceGroupPresentModeFlagBitsKHR
  vkDeviceGroupPresentModeFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkDeviceGroupPresentModeFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkCreateSwapchainKHR*(device: VkDevice; pCreateInfo: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pSwapchain: ptr VkSwapchainKHR): VkResult {.cdecl, importc.}
  proc vkDestroySwapchainKHR*(device: VkDevice; swapchain: VkSwapchainKHR; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
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
  vkKhrDisplaySpecVersion* = 23
  vkKhrDisplayExtensionName* = "VK_KHR_display"

type
  VkDisplayModeCreateFlagsKHR* = VkFlags
  VkDisplayPlaneAlphaFlagBitsKHR* = distinct cint
  VkDisplayPlaneAlphaFlagsKHR* = VkFlags
  VkDisplaySurfaceCreateFlagsKHR* = VkFlags
  VkDisplayModeParametersKHR* {.bycopy.} = object
    visibleRegion*: VkExtent2D
    refreshRate*: uint32

  VkDisplayModeCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDisplayModeCreateFlagsKHR
    parameters*: VkDisplayModeParametersKHR

  VkDisplayModePropertiesKHR* {.bycopy.} = object
    displayMode*: VkDisplayModeKHR
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

  VkDisplayPropertiesKHR* {.bycopy.} = object
    display*: VkDisplayKHR
    displayName*: cstring
    physicalDimensions*: VkExtent2D
    physicalResolution*: VkExtent2D
    supportedTransforms*: VkSurfaceTransformFlagsKHR
    planeReorderPossible*: VkBool32
    persistentContent*: VkBool32

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
  PFNVkcreatedisplaymodekhr* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pCreateInfo: ptr VkDisplayModeCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pMode: ptr VkDisplayModeKHR): VkResult {.cdecl.}
  PFNVkgetdisplayplanecapabilitieskhr* = proc (physicalDevice: VkPhysicalDevice; mode: VkDisplayModeKHR; planeIndex: uint32; pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR): VkResult {.cdecl.}
  PFNVkcreatedisplayplanesurfacekhr* = proc (instance: VkInstance; pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}

const
  vkDisplayPlaneAlphaOpaqueBitKhr* {.used.} = 0x00000001.VkDisplayPlaneAlphaFlagBitsKHR
  vkDisplayPlaneAlphaGlobalBitKhr* {.used.} = 0x00000002.VkDisplayPlaneAlphaFlagBitsKHR
  vkDisplayPlaneAlphaPerPixelBitKhr* {.used.} = 0x00000004.VkDisplayPlaneAlphaFlagBitsKHR
  vkDisplayPlaneAlphaPerPixelPremultipliedBitKhr* {.used.} = 0x00000008.VkDisplayPlaneAlphaFlagBitsKHR
  vkDisplayPlaneAlphaFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkDisplayPlaneAlphaFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceDisplayPropertiesKHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPropertiesKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceDisplayPlanePropertiesKHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlanePropertiesKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayPlaneSupportedDisplaysKHR*(physicalDevice: VkPhysicalDevice; planeIndex: uint32; pDisplayCount: ptr uint32; pDisplays: ptr VkDisplayKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayModePropertiesKHR*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModePropertiesKHR): VkResult {.cdecl, importc.}
  proc vkCreateDisplayModeKHR*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pCreateInfo: ptr VkDisplayModeCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pMode: ptr VkDisplayModeKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayPlaneCapabilitiesKHR*(physicalDevice: VkPhysicalDevice; mode: VkDisplayModeKHR; planeIndex: uint32; pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR): VkResult {.cdecl, importc.}
  proc vkCreateDisplayPlaneSurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}
const
  vkKhrDisplaySwapchain* = 1
  vkKhrDisplaySwapchainSpecVersion* = 10
  vkKhrDisplaySwapchainExtensionName* = "VK_KHR_display_swapchain"

type
  VkDisplayPresentInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcRect*: VkRect2D
    dstRect*: VkRect2D
    persistent*: VkBool32

  PFNVkcreatesharedswapchainskhr* = proc (device: VkDevice; swapchainCount: uint32; pCreateInfos: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pSwapchains: ptr VkSwapchainKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateSharedSwapchainsKHR*(device: VkDevice; swapchainCount: uint32; pCreateInfos: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pSwapchains: ptr VkSwapchainKHR): VkResult {.cdecl, importc.}
const
  vkKhrSamplerMirrorClampoEdge* = 1
  vkKhrSamplerMirrorClampToEdgeSpecVersion* = 3
  vkKhrSamplerMirrorClampToEdgeExtensionName* = "VK_KHR_sampler_mirror_clampo_edge"
  vkKhrMultiview* = 1
  vkKhrMultiviewSpecVersion* = 1
  vkKhrMultiviewExtensionName* = "VK_KHR_multiview"

type
  VkRenderPassMultiviewCreateInfoKHR* = VkRenderPassMultiviewCreateInfo
  VkPhysicalDeviceMultiviewFeaturesKHR* = VkPhysicalDeviceMultiviewFeatures
  VkPhysicalDeviceMultiviewPropertiesKHR* = VkPhysicalDeviceMultiviewProperties

const
  vkKhrGetPhysicalDeviceProperties2* = 1
  vkKhrGetPhysicalDeviceProperties2SpecVersion* = 2
  vkKhrGetPhysicalDeviceProperties2ExtensionName* = "VK_KHR_get_physical_device_properties2"

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
  PFNVkgetphysicaldevicefeatures2khr* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures2) {.cdecl.}
  PFNVkgetphysicaldeviceproperties2khr* = proc (physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties2) {.cdecl.}
  PFNVkgetphysicaldeviceformatproperties2khr* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties2) {.cdecl.}
  PFNVkgetphysicaldeviceimageformatproperties2khr* = proc (physicalDevice: VkPhysicalDevice; pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2; pImageFormatProperties: ptr VkImageFormatProperties2): VkResult {.cdecl.}
  PFNVkgetphysicaldevicequeuefamilyproperties2khr* = proc (physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties2) {.cdecl.}
  PFNVkgetphysicaldevicememoryproperties2khr* = proc (physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2) {.cdecl.}
  PFNVkgetphysicaldevicesparseimageformatproperties2khr* = proc (physicalDevice: VkPhysicalDevice; pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties2) {.cdecl.}

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
  vkKhrDeviceGroupSpecVersion* = 4
  vkKhrDeviceGroupExtensionName* = "VK_KHR_device_group"

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
  vkKhrShaderDrawParametersExtensionName* = "VK_KHR_shader_draw_parameters"
  vkKhrMaintenance1* = 1
  vkKhrMaintenance1SpecVersion* = 2
  vkKhrMaintenance1ExtensionName* = "VK_KHR_maintenance1"

type
  VkCommandPoolTrimFlagsKHR* = VkCommandPoolTrimFlags
  PFNVktrimcommandpoolkhr* = proc (device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolTrimFlags) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkTrimCommandPoolKHR*(device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolTrimFlags) {.cdecl, importc.}
const
  vkKhrDeviceGroupCreation* = 1
  vkKhrDeviceGroupCreationSpecVersion* = 1
  vkKhrDeviceGroupCreationExtensionName* = "VK_KHR_device_group_creation"
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
  vkKhrExternalMemoryCapabilitiesExtensionName* = "VK_KHR_external_memory_capabilities"
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
  vkKhrExternalMemoryExtensionName* = "VK_KHR_external_memory"
  vkQueueFamilyExternalKhr* = vkQueueFamilyExternal

type
  VkExternalMemoryImageCreateInfoKHR* = VkExternalMemoryImageCreateInfo
  VkExternalMemoryBufferCreateInfoKHR* = VkExternalMemoryBufferCreateInfo
  VkExportMemoryAllocateInfoKHR* = VkExportMemoryAllocateInfo

const
  vkKhrExternalMemoryFd* = 1
  vkKhrExternalMemoryFdSpecVersion* = 1
  vkKhrExternalMemoryFdExtensionName* = "VK_KHR_external_memory_fd"

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
  vkKhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"

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
  vkKhrExternalSemaphoreExtensionName* = "VK_KHR_external_semaphore"

type
  VkSemaphoreImportFlagsKHR* = VkSemaphoreImportFlags
  VkSemaphoreImportFlagBitsKHR* = VkSemaphoreImportFlagBits
  VkExportSemaphoreCreateInfoKHR* = VkExportSemaphoreCreateInfo

const
  vkKhrExternalSemaphoreFd* = 1
  vkKhrExternalSemaphoreFdSpecVersion* = 1
  vkKhrExternalSemaphoreFdExtensionName* = "VK_KHR_external_semaphore_fd"

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
  vkKhrPushDescriptorExtensionName* = "VK_KHR_push_descriptor"

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
  vkKhrShaderFloat16Int8* = 1
  vkKhrShaderFloat16Int8SpecVersion* = 1
  vkKhrShaderFloat16Int8ExtensionName* = "VK_KHR_shader_float16_int8"

type
  VkPhysicalDeviceShaderFloat16Int8FeaturesKHR* = VkPhysicalDeviceShaderFloat16Int8Features
  VkPhysicalDeviceFloat16Int8FeaturesKHR* = VkPhysicalDeviceShaderFloat16Int8Features

const
  vkKhr16bitStorage* = 1
  vkKhr16bitStorageSpecVersion* = 1
  vkKhr16bitStorageExtensionName* = "VK_KHR_16bit_storage"

type
  VkPhysicalDevice16BitStorageFeaturesKHR* = VkPhysicalDevice16BitStorageFeatures

const
  vkKhrIncrementalPresent* = 1
  vkKhrIncrementalPresentSpecVersion* = 1
  vkKhrIncrementalPresentExtensionName* = "VK_KHR_incremental_present"

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
  vkKhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

type
  VkDescriptorUpdateTemplateTypeKHR* = VkDescriptorUpdateTemplateType
  VkDescriptorUpdateTemplateCreateFlagsKHR* = VkDescriptorUpdateTemplateCreateFlags
  VkDescriptorUpdateTemplateEntryKHR* = VkDescriptorUpdateTemplateEntry
  VkDescriptorUpdateTemplateCreateInfoKHR* = VkDescriptorUpdateTemplateCreateInfo
  PFNVkcreatedescriptorupdatetemplatekhr* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate): VkResult {.cdecl.}
  PFNVkdestroydescriptorupdatetemplatekhr* = proc (device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkupdatedescriptorsetwithtemplatekhr* = proc (device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pData: pointer) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateDescriptorUpdateTemplateKHR*(device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorUpdateTemplateKHR*(device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkUpdateDescriptorSetWithTemplateKHR*(device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplate; pData: pointer) {.cdecl, importc.}
const
  vkKhrImagelessFramebuffer* = 1
  vkKhrImagelessFramebufferSpecVersion* = 1
  vkKhrImagelessFramebufferExtensionName* = "VK_KHR_imageless_framebuffer"

type
  VkPhysicalDeviceImagelessFramebufferFeaturesKHR* = VkPhysicalDeviceImagelessFramebufferFeatures
  VkFramebufferAttachmentsCreateInfoKHR* = VkFramebufferAttachmentsCreateInfo
  VkFramebufferAttachmentImageInfoKHR* = VkFramebufferAttachmentImageInfo
  VkRenderPassAttachmentBeginInfoKHR* = VkRenderPassAttachmentBeginInfo

const
  vkKhrCreateRenderpass2* = 1
  vkKhrCreateRenderpass2SpecVersion* = 1
  vkKhrCreateRenderpass2ExtensionName* = "VK_KHR_create_renderpass2"

type
  VkRenderPassCreateInfo2KHR* = VkRenderPassCreateInfo2
  VkAttachmentDescription2KHR* = VkAttachmentDescription2
  VkAttachmentReference2KHR* = VkAttachmentReference2
  VkSubpassDescription2KHR* = VkSubpassDescription2
  VkSubpassDependency2KHR* = VkSubpassDependency2
  VkSubpassBeginInfoKHR* = VkSubpassBeginInfo
  VkSubpassEndInfoKHR* = VkSubpassEndInfo
  PFNVkcreaterenderpass2khr* = proc (device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo2; pAllocator: ptr VkAllocationCallbacks = nil; pRenderPass: ptr VkRenderPass): VkResult {.cdecl.}
  PFNVkcmdbeginrenderpass2khr* = proc (commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; pSubpassBeginInfo: ptr VkSubpassBeginInfo) {.cdecl.}
  PFNVkcmdnextsubpass2khr* = proc (commandBuffer: VkCommandBuffer; pSubpassBeginInfo: ptr VkSubpassBeginInfo; pSubpassEndInfo: ptr VkSubpassEndInfo) {.cdecl.}
  PFNVkcmdendrenderpass2khr* = proc (commandBuffer: VkCommandBuffer; pSubpassEndInfo: ptr VkSubpassEndInfo) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateRenderPass2KHR*(device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo2; pAllocator: ptr VkAllocationCallbacks = nil; pRenderPass: ptr VkRenderPass): VkResult {.cdecl, importc.}
  proc vkCmdBeginRenderPass2KHR*(commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; pSubpassBeginInfo: ptr VkSubpassBeginInfo) {.cdecl, importc.}
  proc vkCmdNextSubpass2KHR*(commandBuffer: VkCommandBuffer; pSubpassBeginInfo: ptr VkSubpassBeginInfo; pSubpassEndInfo: ptr VkSubpassEndInfo) {.cdecl, importc.}
  proc vkCmdEndRenderPass2KHR*(commandBuffer: VkCommandBuffer; pSubpassEndInfo: ptr VkSubpassEndInfo) {.cdecl, importc.}
const
  vkKhrSharedPresentableImage* = 1
  vkKhrSharedPresentableImageSpecVersion* = 1
  vkKhrSharedPresentableImageExtensionName* = "VK_KHR_shared_presentable_image"

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
  vkKhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"

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
  vkKhrExternalFenceExtensionName* = "VK_KHR_external_fence"

type
  VkFenceImportFlagsKHR* = VkFenceImportFlags
  VkFenceImportFlagBitsKHR* = VkFenceImportFlagBits
  VkExportFenceCreateInfoKHR* = VkExportFenceCreateInfo

const
  vkKhrExternalFenceFd* = 1
  vkKhrExternalFenceFdSpecVersion* = 1
  vkKhrExternalFenceFdExtensionName* = "VK_KHR_external_fence_fd"

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
  vkKhrPerformanceQuery* = 1
  vkKhrPerformanceQuerySpecVersion* = 1
  vkKhrPerformanceQueryExtensionName* = "VK_KHR_performance_query"

type
  VkPerformanceCounterUnitKHR* = distinct cint
  VkPerformanceCounterScopeKHR* = distinct cint
  VkPerformanceCounterStorageKHR* = distinct cint
  VkPerformanceCounterDescriptionFlagBitsKHR* = distinct cint
  VkPerformanceCounterDescriptionFlagsKHR* = VkFlags
  VkAcquireProfilingLockFlagBitsKHR* = distinct cint
  VkAcquireProfilingLockFlagsKHR* = VkFlags
  VkPhysicalDevicePerformanceQueryFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    performanceCounterQueryPools*: VkBool32
    performanceCounterMultipleQueryPools*: VkBool32

  VkPhysicalDevicePerformanceQueryPropertiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    allowCommandBufferQueryCopies*: VkBool32

  VkPerformanceCounterKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    unit*: VkPerformanceCounterUnitKHR
    scope*: VkPerformanceCounterScopeKHR
    storage*: VkPerformanceCounterStorageKHR
    uuid*: array[vkUuidSize, uint8]

  VkPerformanceCounterDescriptionKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPerformanceCounterDescriptionFlagsKHR
    name*: array[vkMaxDescriptionSize, char]
    category*: array[vkMaxDescriptionSize, char]
    description*: array[vkMaxDescriptionSize, char]

  VkQueryPoolPerformanceCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    queueFamilyIndex*: uint32
    counterIndexCount*: uint32
    pCounterIndices*: ptr uint32

  VkPerformanceCounterResultKHR* {.bycopy, union.} = object
    int32*: int32
    int64*: int64
    uint32*: uint32
    uint64*: uint64
    float32*: cfloat
    float64*: cdouble

  VkAcquireProfilingLockInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkAcquireProfilingLockFlagsKHR
    timeout*: uint64

  VkPerformanceQuerySubmitInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    counterPassIndex*: uint32

  PFNVkenumeratephysicaldevicequeuefamilyperformancequerycounterskhr* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; pCounterCount: ptr uint32; pCounters: ptr VkPerformanceCounterKHR; pCounterDescriptions: ptr VkPerformanceCounterDescriptionKHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicequeuefamilyperformancequerypasseskhr* = proc (physicalDevice: VkPhysicalDevice; pPerformanceQueryCreateInfo: ptr VkQueryPoolPerformanceCreateInfoKHR; pNumPasses: ptr uint32) {.cdecl.}
  PFNVkacquireprofilinglockkhr* = proc (device: VkDevice; pInfo: ptr VkAcquireProfilingLockInfoKHR): VkResult {.cdecl.}
  PFNVkreleaseprofilinglockkhr* = proc (device: VkDevice) {.cdecl.}

const
  vkPerformanceCounterUnitGenericKhr* {.used.} = 0.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitPercentageKhr* {.used.} = 1.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitNanosecondsKhr* {.used.} = 2.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitBytesKhr* {.used.} = 3.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitBytesPerSecondKhr* {.used.} = 4.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitKelvinKhr* {.used.} = 5.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitWattsKhr* {.used.} = 6.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitVoltsKhr* {.used.} = 7.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitAmpsKhr* {.used.} = 8.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitHertzKhr* {.used.} = 9.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitCyclesKhr* {.used.} = 10.VkPerformanceCounterUnitKHR
  vkPerformanceCounterUnitMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkPerformanceCounterUnitKHR

const
  vkPerformanceCounterScopeCommandBufferKhr* {.used.} = 0.VkPerformanceCounterScopeKHR
  vkPerformanceCounterScopeRenderPassKhr* {.used.} = 1.VkPerformanceCounterScopeKHR
  vkPerformanceCounterScopeCommandKhr* {.used.} = 2.VkPerformanceCounterScopeKHR
  vkQueryScopeCommandBufferKhr* {.used.}: VkPerformanceCounterScopeKHR = vkPerformanceCounterScopeCommandBufferKhr
  vkQueryScopeRenderPassKhr* {.used.}: VkPerformanceCounterScopeKHR = vkPerformanceCounterScopeRenderPassKhr
  vkQueryScopeCommandKhr* {.used.}: VkPerformanceCounterScopeKHR = vkPerformanceCounterScopeCommandKhr
  vkPerformanceCounterScopeMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkPerformanceCounterScopeKHR

const
  vkPerformanceCounterStorageInt32Khr* {.used.} = 0.VkPerformanceCounterStorageKHR
  vkPerformanceCounterStorageInt64Khr* {.used.} = 1.VkPerformanceCounterStorageKHR
  vkPerformanceCounterStorageUint32Khr* {.used.} = 2.VkPerformanceCounterStorageKHR
  vkPerformanceCounterStorageUint64Khr* {.used.} = 3.VkPerformanceCounterStorageKHR
  vkPerformanceCounterStorageFloat32Khr* {.used.} = 4.VkPerformanceCounterStorageKHR
  vkPerformanceCounterStorageFloat64Khr* {.used.} = 5.VkPerformanceCounterStorageKHR
  vkPerformanceCounterStorageMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkPerformanceCounterStorageKHR

const
  vkPerformanceCounterDescriptionPerformanceImpactingBitKhr* {.used.} = 0x00000001.VkPerformanceCounterDescriptionFlagBitsKHR
  vkPerformanceCounterDescriptionConcurrentlyImpactedBitKhr* {.used.} = 0x00000002.VkPerformanceCounterDescriptionFlagBitsKHR
  vkPerformanceCounterDescriptionPerformanceImpactingKhr* {.used.}: VkPerformanceCounterDescriptionFlagBitsKHR = vkPerformanceCounterDescriptionPerformanceImpactingBitKhr
  vkPerformanceCounterDescriptionConcurrentlyImpactedKhr* {.used.}: VkPerformanceCounterDescriptionFlagBitsKHR = vkPerformanceCounterDescriptionConcurrentlyImpactedBitKhr
  vkPerformanceCounterDescriptionFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkPerformanceCounterDescriptionFlagBitsKHR

const
  vkAcquireProfilingLockFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkAcquireProfilingLockFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR*(physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; pCounterCount: ptr uint32; pCounters: ptr VkPerformanceCounterKHR; pCounterDescriptions: ptr VkPerformanceCounterDescriptionKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR*(physicalDevice: VkPhysicalDevice; pPerformanceQueryCreateInfo: ptr VkQueryPoolPerformanceCreateInfoKHR; pNumPasses: ptr uint32) {.cdecl, importc.}
  proc vkAcquireProfilingLockKHR*(device: VkDevice; pInfo: ptr VkAcquireProfilingLockInfoKHR): VkResult {.cdecl, importc.}
  proc vkReleaseProfilingLockKHR*(device: VkDevice) {.cdecl, importc.}
const
  vkKhrMaintenance2* = 1
  vkKhrMaintenance2SpecVersion* = 1
  vkKhrMaintenance2ExtensionName* = "VK_KHR_maintenance2"

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
  vkKhrGetSurfaceCapabilities2SpecVersion* = 1
  vkKhrGetSurfaceCapabilities2ExtensionName* = "VK_KHR_get_surface_capabilities2"

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

  PFNVkgetphysicaldevicesurfacecapabilities2khr* = proc (physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2KHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicesurfaceformats2khr* = proc (physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormat2KHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceSurfaceCapabilities2KHR*(physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2KHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceFormats2KHR*(physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormat2KHR): VkResult {.cdecl, importc.}
const
  vkKhrVariablePointers* = 1
  vkKhrVariablePointersSpecVersion* = 1
  vkKhrVariablePointersExtensionName* = "VK_KHR_variable_pointers"

type
  VkPhysicalDeviceVariablePointerFeaturesKHR* = VkPhysicalDeviceVariablePointersFeatures
  VkPhysicalDeviceVariablePointersFeaturesKHR* = VkPhysicalDeviceVariablePointersFeatures

const
  vkKhrGetDisplayProperties2* = 1
  vkKhrGetDisplayProperties2SpecVersion* = 1
  vkKhrGetDisplayProperties2ExtensionName* = "VK_KHR_get_display_properties2"

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

  PFNVkgetphysicaldevicedisplayproperties2khr* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayProperties2KHR): VkResult {.cdecl.}
  PFNVkgetphysicaldevicedisplayplaneproperties2khr* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlaneProperties2KHR): VkResult {.cdecl.}
  PFNVkgetdisplaymodeproperties2khr* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModeProperties2KHR): VkResult {.cdecl.}
  PFNVkgetdisplayplanecapabilities2khr* = proc (physicalDevice: VkPhysicalDevice; pDisplayPlaneInfo: ptr VkDisplayPlaneInfo2KHR; pCapabilities: ptr VkDisplayPlaneCapabilities2KHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceDisplayProperties2KHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayProperties2KHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceDisplayPlaneProperties2KHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlaneProperties2KHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayModeProperties2KHR*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModeProperties2KHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayPlaneCapabilities2KHR*(physicalDevice: VkPhysicalDevice; pDisplayPlaneInfo: ptr VkDisplayPlaneInfo2KHR; pCapabilities: ptr VkDisplayPlaneCapabilities2KHR): VkResult {.cdecl, importc.}
const
  vkKhrDedicatedAllocation* = 1
  vkKhrDedicatedAllocationSpecVersion* = 3
  vkKhrDedicatedAllocationExtensionName* = "VK_KHR_dedicated_allocation"

type
  VkMemoryDedicatedRequirementsKHR* = VkMemoryDedicatedRequirements
  VkMemoryDedicatedAllocateInfoKHR* = VkMemoryDedicatedAllocateInfo

const
  vkKhrStorageBufferStorageClass* = 1
  vkKhrStorageBufferStorageClassSpecVersion* = 1
  vkKhrStorageBufferStorageClassExtensionName* = "VK_KHR_storage_buffer_storage_class"
  vkKhrRelaxedBlockLayout* = 1
  vkKhrRelaxedBlockLayoutSpecVersion* = 1
  vkKhrRelaxedBlockLayoutExtensionName* = "VK_KHR_relaxed_block_layout"
  vkKhrGetMemoryRequirements2* = 1
  vkKhrGetMemoryRequirements2SpecVersion* = 1
  vkKhrGetMemoryRequirements2ExtensionName* = "VK_KHR_get_memory_requirements2"

type
  VkBufferMemoryRequirementsInfo2KHR* = VkBufferMemoryRequirementsInfo2
  VkImageMemoryRequirementsInfo2KHR* = VkImageMemoryRequirementsInfo2
  VkImageSparseMemoryRequirementsInfo2KHR* = VkImageSparseMemoryRequirementsInfo2
  VkMemoryRequirements2KHR* = VkMemoryRequirements2
  VkSparseImageMemoryRequirements2KHR* = VkSparseImageMemoryRequirements2
  PFNVkgetimagememoryrequirements2khr* = proc (device: VkDevice; pInfo: ptr VkImageMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl.}
  PFNVkgetbuffermemoryrequirements2khr* = proc (device: VkDevice; pInfo: ptr VkBufferMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl.}
  PFNVkgetimagesparsememoryrequirements2khr* = proc (device: VkDevice; pInfo: ptr VkImageSparseMemoryRequirementsInfo2; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetImageMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkImageMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl, importc.}
  proc vkGetBufferMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkBufferMemoryRequirementsInfo2; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl, importc.}
  proc vkGetImageSparseMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkImageSparseMemoryRequirementsInfo2; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2) {.cdecl, importc.}
const
  vkKhrImageFormatList* = 1
  vkKhrImageFormatListSpecVersion* = 1
  vkKhrImageFormatListExtensionName* = "VK_KHR_image_format_list"

type
  VkImageFormatListCreateInfoKHR* = VkImageFormatListCreateInfo

const
  vkKhrSamplerYcbcrConversion* = 1

type
  VkSamplerYcbcrConversionKHR* = VkSamplerYcbcrConversion

const
  vkKhrSamplerYcbcrConversionSpecVersion* = 14
  vkKhrSamplerYcbcrConversionExtensionName* = "VK_KHR_sampler_ycbcr_conversion"

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
  PFNVkcreatesamplerycbcrconversionkhr* = proc (device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pYcbcrConversion: ptr VkSamplerYcbcrConversion): VkResult {.cdecl.}
  PFNVkdestroysamplerycbcrconversionkhr* = proc (device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversion; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateSamplerYcbcrConversionKHR*(device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo; pAllocator: ptr VkAllocationCallbacks = nil; pYcbcrConversion: ptr VkSamplerYcbcrConversion): VkResult {.cdecl, importc.}
  proc vkDestroySamplerYcbcrConversionKHR*(device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversion; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
const
  vkKhrBindMemory2* = 1
  vkKhrBindMemory2SpecVersion* = 1
  vkKhrBindMemory2ExtensionName* = "VK_KHR_bind_memory2"

type
  VkBindBufferMemoryInfoKHR* = VkBindBufferMemoryInfo
  VkBindImageMemoryInfoKHR* = VkBindImageMemoryInfo
  PFNVkbindbuffermemory2khr* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindBufferMemoryInfo): VkResult {.cdecl.}
  PFNVkbindimagememory2khr* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindImageMemoryInfo): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkBindBufferMemory2KHR*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindBufferMemoryInfo): VkResult {.cdecl, importc.}
  proc vkBindImageMemory2KHR*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindImageMemoryInfo): VkResult {.cdecl, importc.}
const
  vkKhrMaintenance3* = 1
  vkKhrMaintenance3SpecVersion* = 1
  vkKhrMaintenance3ExtensionName* = "VK_KHR_maintenance3"

type
  VkPhysicalDeviceMaintenance3PropertiesKHR* = VkPhysicalDeviceMaintenance3Properties
  VkDescriptorSetLayoutSupportKHR* = VkDescriptorSetLayoutSupport
  PFNVkgetdescriptorsetlayoutsupportkhr* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pSupport: ptr VkDescriptorSetLayoutSupport) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetDescriptorSetLayoutSupportKHR*(device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pSupport: ptr VkDescriptorSetLayoutSupport) {.cdecl, importc.}
const
  vkKhrDrawIndirectCount* = 1
  vkKhrDrawIndirectCountSpecVersion* = 1
  vkKhrDrawIndirectCountExtensionName* = "VK_KHR_draw_indirect_count"

type
  PFNVkcmddrawindirectcountkhr* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcmddrawindexedindirectcountkhr* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdDrawIndirectCountKHR*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexedIndirectCountKHR*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
const
  vkKhrShaderSubgroupExtendedypes* = 1
  vkKhrShaderSubgroupExtendedTypesSpecVersion* = 1
  vkKhrShaderSubgroupExtendedTypesExtensionName* = "VK_KHR_shader_subgroup_extendedypes"

type
  VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR* = VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures

const
  vkKhr8bitStorage* = 1
  vkKhr8bitStorageSpecVersion* = 1
  vkKhr8bitStorageExtensionName* = "VK_KHR_8bit_storage"

type
  VkPhysicalDevice8BitStorageFeaturesKHR* = VkPhysicalDevice8BitStorageFeatures

const
  vkKhrShaderAtomicInt64* = 1
  vkKhrShaderAtomicInt64SpecVersion* = 1
  vkKhrShaderAtomicInt64ExtensionName* = "VK_KHR_shader_atomic_int64"

type
  VkPhysicalDeviceShaderAtomicInt64FeaturesKHR* = VkPhysicalDeviceShaderAtomicInt64Features

const
  vkKhrShaderClock* = 1
  vkKhrShaderClockSpecVersion* = 1
  vkKhrShaderClockExtensionName* = "VK_KHR_shader_clock"

type
  VkPhysicalDeviceShaderClockFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderSubgroupClock*: VkBool32
    shaderDeviceClock*: VkBool32


const
  vkKhrDriverProperties* = 1
  vkKhrDriverPropertiesSpecVersion* = 1
  vkKhrDriverPropertiesExtensionName* = "VK_KHR_driver_properties"
  vkMaxDriverNameSizeKhr* = vkMaxDriverNameSize
  vkMaxDriverInfoSizeKhr* = vkMaxDriverInfoSize

type
  VkDriverIdKHR* = VkDriverId
  VkConformanceVersionKHR* = VkConformanceVersion
  VkPhysicalDeviceDriverPropertiesKHR* = VkPhysicalDeviceDriverProperties

const
  vkKhrShaderFloatControls* = 1
  vkKhrShaderFloatControlsSpecVersion* = 4
  vkKhrShaderFloatControlsExtensionName* = "VK_KHR_shader_float_controls"

type
  VkShaderFloatControlsIndependenceKHR* = VkShaderFloatControlsIndependence
  VkPhysicalDeviceFloatControlsPropertiesKHR* = VkPhysicalDeviceFloatControlsProperties

const
  vkKhrDepthStencilResolve* = 1
  vkKhrDepthStencilResolveSpecVersion* = 1
  vkKhrDepthStencilResolveExtensionName* = "VK_KHR_depth_stencil_resolve"

type
  VkResolveModeFlagBitsKHR* = VkResolveModeFlagBits
  VkResolveModeFlagsKHR* = VkResolveModeFlags
  VkSubpassDescriptionDepthStencilResolveKHR* = VkSubpassDescriptionDepthStencilResolve
  VkPhysicalDeviceDepthStencilResolvePropertiesKHR* = VkPhysicalDeviceDepthStencilResolveProperties

const
  vkKhrSwapchainMutableFormat* = 1
  vkKhrSwapchainMutableFormatSpecVersion* = 1
  vkKhrSwapchainMutableFormatExtensionName* = "VK_KHR_swapchain_mutable_format"
  vkKhrimelineSemaphore* = 1
  vkKhrTimelineSemaphoreSpecVersion* = 2
  vkKhrTimelineSemaphoreExtensionName* = "VK_KHRimeline_semaphore"

type
  VkSemaphoreTypeKHR* = VkSemaphoreType
  VkSemaphoreWaitFlagBitsKHR* = VkSemaphoreWaitFlagBits
  VkSemaphoreWaitFlagsKHR* = VkSemaphoreWaitFlags
  VkPhysicalDeviceTimelineSemaphoreFeaturesKHR* = VkPhysicalDeviceTimelineSemaphoreFeatures
  VkPhysicalDeviceTimelineSemaphorePropertiesKHR* = VkPhysicalDeviceTimelineSemaphoreProperties
  VkSemaphoreTypeCreateInfoKHR* = VkSemaphoreTypeCreateInfo
  VkTimelineSemaphoreSubmitInfoKHR* = VkTimelineSemaphoreSubmitInfo
  VkSemaphoreWaitInfoKHR* = VkSemaphoreWaitInfo
  VkSemaphoreSignalInfoKHR* = VkSemaphoreSignalInfo
  PFNVkgetsemaphorecountervaluekhr* = proc (device: VkDevice; semaphore: VkSemaphore; pValue: ptr uint64): VkResult {.cdecl.}
  PFNVkwaitsemaphoreskhr* = proc (device: VkDevice; pWaitInfo: ptr VkSemaphoreWaitInfo; timeout: uint64): VkResult {.cdecl.}
  PFNVksignalsemaphorekhr* = proc (device: VkDevice; pSignalInfo: ptr VkSemaphoreSignalInfo): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetSemaphoreCounterValueKHR*(device: VkDevice; semaphore: VkSemaphore; pValue: ptr uint64): VkResult {.cdecl, importc.}
  proc vkWaitSemaphoresKHR*(device: VkDevice; pWaitInfo: ptr VkSemaphoreWaitInfo; timeout: uint64): VkResult {.cdecl, importc.}
  proc vkSignalSemaphoreKHR*(device: VkDevice; pSignalInfo: ptr VkSemaphoreSignalInfo): VkResult {.cdecl, importc.}
const
  vkKhrVulkanMemoryModel* = 1
  vkKhrVulkanMemoryModelSpecVersion* = 3
  vkKhrVulkanMemoryModelExtensionName* = "VK_KHR_vulkan_memory_model"

type
  VkPhysicalDeviceVulkanMemoryModelFeaturesKHR* = VkPhysicalDeviceVulkanMemoryModelFeatures

const
  vkKhrShadererminateInvocation* = 1
  vkKhrShaderTerminateInvocationSpecVersion* = 1
  vkKhrShaderTerminateInvocationExtensionName* = "VK_KHR_shadererminate_invocation"

type
  VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderTerminateInvocation*: VkBool32


const
  vkKhrFragmentShadingRate* = 1
  vkKhrFragmentShadingRateSpecVersion* = 1
  vkKhrFragmentShadingRateExtensionName* = "VK_KHR_fragment_shading_rate"

type
  VkFragmentShadingRateCombinerOpKHR* = distinct cint
  VkFragmentShadingRateAttachmentInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pFragmentShadingRateAttachment*: ptr VkAttachmentReference2
    shadingRateAttachmentTexelSize*: VkExtent2D

  VkPipelineFragmentShadingRateStateCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentSize*: VkExtent2D
    combinerOps*: array[2, VkFragmentShadingRateCombinerOpKHR]

  VkPhysicalDeviceFragmentShadingRateFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineFragmentShadingRate*: VkBool32
    primitiveFragmentShadingRate*: VkBool32
    attachmentFragmentShadingRate*: VkBool32

  VkPhysicalDeviceFragmentShadingRatePropertiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    minFragmentShadingRateAttachmentTexelSize*: VkExtent2D
    maxFragmentShadingRateAttachmentTexelSize*: VkExtent2D
    maxFragmentShadingRateAttachmentTexelSizeAspectRatio*: uint32
    primitiveFragmentShadingRateWithMultipleViewports*: VkBool32
    layeredShadingRateAttachments*: VkBool32
    fragmentShadingRateNonTrivialCombinerOps*: VkBool32
    maxFragmentSize*: VkExtent2D
    maxFragmentSizeAspectRatio*: uint32
    maxFragmentShadingRateCoverageSamples*: uint32
    maxFragmentShadingRateRasterizationSamples*: VkSampleCountFlagBits
    fragmentShadingRateWithShaderDepthStencilWrites*: VkBool32
    fragmentShadingRateWithSampleMask*: VkBool32
    fragmentShadingRateWithShaderSampleMask*: VkBool32
    fragmentShadingRateWithConservativeRasterization*: VkBool32
    fragmentShadingRateWithFragmentShaderInterlock*: VkBool32
    fragmentShadingRateWithCustomSampleLocations*: VkBool32
    fragmentShadingRateStrictMultiplyCombiner*: VkBool32

  VkPhysicalDeviceFragmentShadingRateKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    sampleCounts*: VkSampleCountFlags
    fragmentSize*: VkExtent2D

  PFNVkgetphysicaldevicefragmentshadingrateskhr* = proc (physicalDevice: VkPhysicalDevice; pFragmentShadingRateCount: ptr uint32; pFragmentShadingRates: ptr VkPhysicalDeviceFragmentShadingRateKHR): VkResult {.cdecl.}
  PFNVkcmdsetfragmentshadingratekhr* = proc (commandBuffer: VkCommandBuffer; pFragmentSize: ptr VkExtent2D; combinerOps: array[2, VkFragmentShadingRateCombinerOpKHR]) {.cdecl.}

const
  vkFragmentShadingRateCombinerOpKeepKhr* {.used.} = 0.VkFragmentShadingRateCombinerOpKHR
  vkFragmentShadingRateCombinerOpReplaceKhr* {.used.} = 1.VkFragmentShadingRateCombinerOpKHR
  vkFragmentShadingRateCombinerOpMinKhr* {.used.} = 2.VkFragmentShadingRateCombinerOpKHR
  vkFragmentShadingRateCombinerOpMaxKhr* {.used.} = 3.VkFragmentShadingRateCombinerOpKHR
  vkFragmentShadingRateCombinerOpMulKhr* {.used.} = 4.VkFragmentShadingRateCombinerOpKHR
  vkFragmentShadingRateCombinerOpMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkFragmentShadingRateCombinerOpKHR

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceFragmentShadingRatesKHR*(physicalDevice: VkPhysicalDevice; pFragmentShadingRateCount: ptr uint32; pFragmentShadingRates: ptr VkPhysicalDeviceFragmentShadingRateKHR): VkResult {.cdecl, importc.}
  proc vkCmdSetFragmentShadingRateKHR*(commandBuffer: VkCommandBuffer; pFragmentSize: ptr VkExtent2D; combinerOps: array[2, VkFragmentShadingRateCombinerOpKHR]) {.cdecl, importc.}
const
  vkKhrSpirv14* = 1
  vkKhrSpirv14SpecVersion* = 1
  vkKhrSpirv14ExtensionName* = "VK_KHR_spirv_1_4"
  vkKhrSurfaceProtectedCapabilities* = 1
  vkKhrSurfaceProtectedCapabilitiesSpecVersion* = 1
  vkKhrSurfaceProtectedCapabilitiesExtensionName* = "VK_KHR_surface_protected_capabilities"

type
  VkSurfaceProtectedCapabilitiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    supportsProtected*: VkBool32


const
  vkKhrSeparateDepthStencilLayouts* = 1
  vkKhrSeparateDepthStencilLayoutsSpecVersion* = 1
  vkKhrSeparateDepthStencilLayoutsExtensionName* = "VK_KHR_separate_depth_stencil_layouts"

type
  VkPhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR* = VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures
  VkAttachmentReferenceStencilLayoutKHR* = VkAttachmentReferenceStencilLayout
  VkAttachmentDescriptionStencilLayoutKHR* = VkAttachmentDescriptionStencilLayout

const
  vkKhrUniformBufferStandardLayout* = 1
  vkKhrUniformBufferStandardLayoutSpecVersion* = 1
  vkKhrUniformBufferStandardLayoutExtensionName* = "VK_KHR_uniform_buffer_standard_layout"

type
  VkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR* = VkPhysicalDeviceUniformBufferStandardLayoutFeatures

const
  vkKhrBufferDeviceAddress* = 1
  vkKhrBufferDeviceAddressSpecVersion* = 1
  vkKhrBufferDeviceAddressExtensionName* = "VK_KHR_buffer_device_address"

type
  VkPhysicalDeviceBufferDeviceAddressFeaturesKHR* = VkPhysicalDeviceBufferDeviceAddressFeatures
  VkBufferDeviceAddressInfoKHR* = VkBufferDeviceAddressInfo
  VkBufferOpaqueCaptureAddressCreateInfoKHR* = VkBufferOpaqueCaptureAddressCreateInfo
  VkMemoryOpaqueCaptureAddressAllocateInfoKHR* = VkMemoryOpaqueCaptureAddressAllocateInfo
  VkDeviceMemoryOpaqueCaptureAddressInfoKHR* = VkDeviceMemoryOpaqueCaptureAddressInfo
  PFNVkgetbufferdeviceaddresskhr* = proc (device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): VkDeviceAddress {.cdecl.}
  PFNVkgetbufferopaquecaptureaddresskhr* = proc (device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): uint64 {.cdecl.}
  PFNVkgetdevicememoryopaquecaptureaddresskhr* = proc (device: VkDevice; pInfo: ptr VkDeviceMemoryOpaqueCaptureAddressInfo): uint64 {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetBufferDeviceAddressKHR*(device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): VkDeviceAddress {.cdecl, importc.}
  proc vkGetBufferOpaqueCaptureAddressKHR*(device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): uint64 {.cdecl, importc.}
  proc vkGetDeviceMemoryOpaqueCaptureAddressKHR*(device: VkDevice; pInfo: ptr VkDeviceMemoryOpaqueCaptureAddressInfo): uint64 {.cdecl, importc.}
const
  vkKhrDeferredHostOperations* = 1

type
  VkDeferredOperationKHR* = VkNonDispatchableHandle

const
  vkKhrDeferredHostOperationsSpecVersion* = 4
  vkKhrDeferredHostOperationsExtensionName* = "VK_KHR_deferred_host_operations"

type
  PFNVkcreatedeferredoperationkhr* = proc (device: VkDevice; pAllocator: ptr VkAllocationCallbacks = nil; pDeferredOperation: ptr VkDeferredOperationKHR): VkResult {.cdecl.}
  PFNVkdestroydeferredoperationkhr* = proc (device: VkDevice; operation: VkDeferredOperationKHR; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgetdeferredoperationmaxconcurrencykhr* = proc (device: VkDevice; operation: VkDeferredOperationKHR): uint32 {.cdecl.}
  PFNVkgetdeferredoperationresultkhr* = proc (device: VkDevice; operation: VkDeferredOperationKHR): VkResult {.cdecl.}
  PFNVkdeferredoperationjoinkhr* = proc (device: VkDevice; operation: VkDeferredOperationKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateDeferredOperationKHR*(device: VkDevice; pAllocator: ptr VkAllocationCallbacks = nil; pDeferredOperation: ptr VkDeferredOperationKHR): VkResult {.cdecl, importc.}
  proc vkDestroyDeferredOperationKHR*(device: VkDevice; operation: VkDeferredOperationKHR; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkGetDeferredOperationMaxConcurrencyKHR*(device: VkDevice; operation: VkDeferredOperationKHR): uint32 {.cdecl, importc.}
  proc vkGetDeferredOperationResultKHR*(device: VkDevice; operation: VkDeferredOperationKHR): VkResult {.cdecl, importc.}
  proc vkDeferredOperationJoinKHR*(device: VkDevice; operation: VkDeferredOperationKHR): VkResult {.cdecl, importc.}
const
  vkKhrPipelineExecutableProperties* = 1
  vkKhrPipelineExecutablePropertiesSpecVersion* = 1
  vkKhrPipelineExecutablePropertiesExtensionName* = "VK_KHR_pipeline_executable_properties"

type
  VkPipelineExecutableStatisticFormatKHR* = distinct cint
  VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineExecutableInfo*: VkBool32

  VkPipelineInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pipeline*: VkPipeline

  VkPipelineExecutablePropertiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    stages*: VkShaderStageFlags
    name*: array[vkMaxDescriptionSize, char]
    description*: array[vkMaxDescriptionSize, char]
    subgroupSize*: uint32

  VkPipelineExecutableInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pipeline*: VkPipeline
    executableIndex*: uint32

  VkPipelineExecutableStatisticValueKHR* {.bycopy, union.} = object
    b32*: VkBool32
    i64*: int64
    u64*: uint64
    f64*: cdouble

  VkPipelineExecutableStatisticKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    name*: array[vkMaxDescriptionSize, char]
    description*: array[vkMaxDescriptionSize, char]
    format*: VkPipelineExecutableStatisticFormatKHR
    value*: VkPipelineExecutableStatisticValueKHR

  VkPipelineExecutableInternalRepresentationKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    name*: array[vkMaxDescriptionSize, char]
    description*: array[vkMaxDescriptionSize, char]
    isText*: VkBool32
    dataSize*: csize_t
    pData*: pointer

  PFNVkgetpipelineexecutablepropertieskhr* = proc (device: VkDevice; pPipelineInfo: ptr VkPipelineInfoKHR; pExecutableCount: ptr uint32; pProperties: ptr VkPipelineExecutablePropertiesKHR): VkResult {.cdecl.}
  PFNVkgetpipelineexecutablestatisticskhr* = proc (device: VkDevice; pExecutableInfo: ptr VkPipelineExecutableInfoKHR; pStatisticCount: ptr uint32; pStatistics: ptr VkPipelineExecutableStatisticKHR): VkResult {.cdecl.}
  PFNVkgetpipelineexecutableinternalrepresentationskhr* = proc (device: VkDevice; pExecutableInfo: ptr VkPipelineExecutableInfoKHR; pInternalRepresentationCount: ptr uint32; pInternalRepresentations: ptr VkPipelineExecutableInternalRepresentationKHR): VkResult {.cdecl.}

const
  vkPipelineExecutableStatisticFormatBool32Khr* {.used.} = 0.VkPipelineExecutableStatisticFormatKHR
  vkPipelineExecutableStatisticFormatInt64Khr* {.used.} = 1.VkPipelineExecutableStatisticFormatKHR
  vkPipelineExecutableStatisticFormatUint64Khr* {.used.} = 2.VkPipelineExecutableStatisticFormatKHR
  vkPipelineExecutableStatisticFormatFloat64Khr* {.used.} = 3.VkPipelineExecutableStatisticFormatKHR
  vkPipelineExecutableStatisticFormatMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkPipelineExecutableStatisticFormatKHR

when not defined(vkNoPrototypes):
  proc vkGetPipelineExecutablePropertiesKHR*(device: VkDevice; pPipelineInfo: ptr VkPipelineInfoKHR; pExecutableCount: ptr uint32; pProperties: ptr VkPipelineExecutablePropertiesKHR): VkResult {.cdecl, importc.}
  proc vkGetPipelineExecutableStatisticsKHR*(device: VkDevice; pExecutableInfo: ptr VkPipelineExecutableInfoKHR; pStatisticCount: ptr uint32; pStatistics: ptr VkPipelineExecutableStatisticKHR): VkResult {.cdecl, importc.}
  proc vkGetPipelineExecutableInternalRepresentationsKHR*(device: VkDevice; pExecutableInfo: ptr VkPipelineExecutableInfoKHR; pInternalRepresentationCount: ptr uint32; pInternalRepresentations: ptr VkPipelineExecutableInternalRepresentationKHR): VkResult {.cdecl, importc.}
const
  vkKhrPipelineLibrary* = 1
  vkKhrPipelineLibrarySpecVersion* = 1
  vkKhrPipelineLibraryExtensionName* = "VK_KHR_pipeline_library"

type
  VkPipelineLibraryCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    libraryCount*: uint32
    pLibraries*: ptr VkPipeline


const
  vkKhrShaderNonSemanticInfo* = 1
  vkKhrShaderNonSemanticInfoSpecVersion* = 1
  vkKhrShaderNonSemanticInfoExtensionName* = "VK_KHR_shader_non_semantic_info"
  vkKhrSynchronization2* = 1

type
  VkFlags64* = uint64

const
  vkKhrSynchronization2SpecVersion* = 1
  vkKhrSynchronization2ExtensionName* = "VK_KHR_synchronization2"

type
  VkPipelineStageFlags2KHR* = VkFlags64

##  Flag bits for VkPipelineStageFlags2KHR

const vkPipelineStage2NoneKhr* = 0.VkPipelineStageFlags2KHR

const vkPipelineStage2TopOfPipeBitKhr* = 0x00000001.VkPipelineStageFlags2KHR

const vkPipelineStage2DrawIndirectBitKhr* = 0x00000002.VkPipelineStageFlags2KHR

const vkPipelineStage2VertexInputBitKhr* = 0x00000004.VkPipelineStageFlags2KHR

const vkPipelineStage2VertexShaderBitKhr* = 0x00000008.VkPipelineStageFlags2KHR

const vkPipelineStage2TessellationControlShaderBitKhr* = 0x00000010.VkPipelineStageFlags2KHR

const vkPipelineStage2TessellationEvaluationShaderBitKhr* = 0x00000020.VkPipelineStageFlags2KHR

const vkPipelineStage2GeometryShaderBitKhr* = 0x00000040.VkPipelineStageFlags2KHR

const vkPipelineStage2FragmentShaderBitKhr* = 0x00000080.VkPipelineStageFlags2KHR

const vkPipelineStage2EarlyFragmentTestsBitKhr* = 0x00000100.VkPipelineStageFlags2KHR

const vkPipelineStage2LateFragmentTestsBitKhr* = 0x00000200.VkPipelineStageFlags2KHR

const vkPipelineStage2ColorAttachmentOutputBitKhr* = 0x00000400.VkPipelineStageFlags2KHR

const vkPipelineStage2ComputeShaderBitKhr* = 0x00000800.VkPipelineStageFlags2KHR

const vkPipelineStage2AllTransferBitKhr* = 0x00001000.VkPipelineStageFlags2KHR

const vkPipelineStage2TransferBitKhr* = 0x00001000.VkPipelineStageFlags2KHR

const vkPipelineStage2BottomOfPipeBitKhr* = 0x00002000.VkPipelineStageFlags2KHR

const vkPipelineStage2HostBitKhr* = 0x00004000.VkPipelineStageFlags2KHR

const vkPipelineStage2AllGraphicsBitKhr* = 0x00008000.VkPipelineStageFlags2KHR

const vkPipelineStage2AllCommandsBitKhr* = 0x00010000.VkPipelineStageFlags2KHR

const vkPipelineStage2CopyBitKhr* = 0x0000000000000000.VkPipelineStageFlags2KHR'i64

const vkPipelineStage2ResolveBitKhr* = 0x0000000000000000.VkPipelineStageFlags2KHR'i64

const vkPipelineStage2BlitBitKhr* = 0x0000000000000000.VkPipelineStageFlags2KHR'i64

const vkPipelineStage2ClearBitKhr* = 0x0000000000000000.VkPipelineStageFlags2KHR'i64

const vkPipelineStage2IndexInputBitKhr* = 0x0000000000000000.VkPipelineStageFlags2KHR'i64

const vkPipelineStage2VertexAttributeInputBitKhr* = 0x0000000000000000.VkPipelineStageFlags2KHR'i64

const vkPipelineStage2PreRasterizationShadersBitKhr* = 0x0000000000000000.VkPipelineStageFlags2KHR'i64

const vkPipelineStage2TransformFeedbackBitExt* = 0x01000000.VkPipelineStageFlags2KHR

const vkPipelineStage2ConditionalRenderingBitExt* = 0x00040000.VkPipelineStageFlags2KHR

const vkPipelineStage2CommandPreprocessBitNv* = 0x00020000.VkPipelineStageFlags2KHR

const vkPipelineStage2FragmentShadingRateAttachmentBitKhr* = 0x00400000.VkPipelineStageFlags2KHR

const vkPipelineStage2ShadingRateImageBitNv* = 0x00400000.VkPipelineStageFlags2KHR

const vkPipelineStage2AccelerationStructureBuildBitKhr* = 0x02000000.VkPipelineStageFlags2KHR

const vkPipelineStage2RayTracingShaderBitKhr* = 0x00200000.VkPipelineStageFlags2KHR

const vkPipelineStage2RayTracingShaderBitNv* = 0x00200000.VkPipelineStageFlags2KHR

const vkPipelineStage2AccelerationStructureBuildBitNv* = 0x02000000.VkPipelineStageFlags2KHR

const vkPipelineStage2FragmentDensityProcessBitExt* = 0x00800000.VkPipelineStageFlags2KHR

const vkPipelineStage2TaskShaderBitNv* = 0x00080000.VkPipelineStageFlags2KHR

const vkPipelineStage2MeshShaderBitNv* = 0x00100000.VkPipelineStageFlags2KHR

type
  VkAccessFlags2KHR* = VkFlags64

##  Flag bits for VkAccessFlags2KHR

const vkAccess2NoneKhr* = 0.VkAccessFlags2KHR

const vkAccess2IndirectCommandReadBitKhr* = 0x00000001.VkAccessFlags2KHR

const vkAccess2IndexReadBitKhr* = 0x00000002.VkAccessFlags2KHR

const vkAccess2VertexAttributeReadBitKhr* = 0x00000004.VkAccessFlags2KHR

const vkAccess2UniformReadBitKhr* = 0x00000008.VkAccessFlags2KHR

const vkAccess2InputAttachmentReadBitKhr* = 0x00000010.VkAccessFlags2KHR

const vkAccess2ShaderReadBitKhr* = 0x00000020.VkAccessFlags2KHR

const vkAccess2ShaderWriteBitKhr* = 0x00000040.VkAccessFlags2KHR

const vkAccess2ColorAttachmentReadBitKhr* = 0x00000080.VkAccessFlags2KHR

const vkAccess2ColorAttachmentWriteBitKhr* = 0x00000100.VkAccessFlags2KHR

const vkAccess2DepthStencilAttachmentReadBitKhr* = 0x00000200.VkAccessFlags2KHR

const vkAccess2DepthStencilAttachmentWriteBitKhr* = 0x00000400.VkAccessFlags2KHR

const vkAccess2TransferReadBitKhr* = 0x00000800.VkAccessFlags2KHR

const vkAccess2TransferWriteBitKhr* = 0x00001000.VkAccessFlags2KHR

const vkAccess2HostReadBitKhr* = 0x00002000.VkAccessFlags2KHR

const vkAccess2HostWriteBitKhr* = 0x00004000.VkAccessFlags2KHR

const vkAccess2MemoryReadBitKhr* = 0x00008000.VkAccessFlags2KHR

const vkAccess2MemoryWriteBitKhr* = 0x00010000.VkAccessFlags2KHR

const vkAccess2ShaderSampledReadBitKhr* = 0x0000000000000000.VkAccessFlags2KHR'i64

const vkAccess2ShaderStorageReadBitKhr* = 0x0000000000000000.VkAccessFlags2KHR'i64

const vkAccess2ShaderStorageWriteBitKhr* = 0x0000000000000000.VkAccessFlags2KHR'i64

const vkAccess2TransformFeedbackWriteBitExt* = 0x02000000.VkAccessFlags2KHR

const vkAccess2TransformFeedbackCounterReadBitExt* = 0x04000000.VkAccessFlags2KHR

const vkAccess2TransformFeedbackCounterWriteBitExt* = 0x08000000.VkAccessFlags2KHR

const vkAccess2ConditionalRenderingReadBitExt* = 0x00100000.VkAccessFlags2KHR

const vkAccess2CommandPreprocessReadBitNv* = 0x00020000.VkAccessFlags2KHR

const vkAccess2CommandPreprocessWriteBitNv* = 0x00040000.VkAccessFlags2KHR

const vkAccess2FragmentShadingRateAttachmentReadBitKhr* = 0x00800000.VkAccessFlags2KHR

const vkAccess2ShadingRateImageReadBitNv* = 0x00800000.VkAccessFlags2KHR

const vkAccess2AccelerationStructureReadBitKhr* = 0x00200000.VkAccessFlags2KHR

const vkAccess2AccelerationStructureWriteBitKhr* = 0x00400000.VkAccessFlags2KHR

const vkAccess2AccelerationStructureReadBitNv* = 0x00200000.VkAccessFlags2KHR

const vkAccess2AccelerationStructureWriteBitNv* = 0x00400000.VkAccessFlags2KHR

const vkAccess2FragmentDensityMapReadBitExt* = 0x01000000.VkAccessFlags2KHR

const vkAccess2ColorAttachmentReadNoncoherentBitExt* = 0x00080000.VkAccessFlags2KHR

type
  VkSubmitFlagBitsKHR* = distinct cint
  VkSubmitFlagsKHR* = VkFlags
  VkMemoryBarrier2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcStageMask*: VkPipelineStageFlags2KHR
    srcAccessMask*: VkAccessFlags2KHR
    dstStageMask*: VkPipelineStageFlags2KHR
    dstAccessMask*: VkAccessFlags2KHR

  VkBufferMemoryBarrier2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcStageMask*: VkPipelineStageFlags2KHR
    srcAccessMask*: VkAccessFlags2KHR
    dstStageMask*: VkPipelineStageFlags2KHR
    dstAccessMask*: VkAccessFlags2KHR
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    buffer*: VkBuffer
    offset*: VkDeviceSize
    size*: VkDeviceSize

  VkImageMemoryBarrier2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcStageMask*: VkPipelineStageFlags2KHR
    srcAccessMask*: VkAccessFlags2KHR
    dstStageMask*: VkPipelineStageFlags2KHR
    dstAccessMask*: VkAccessFlags2KHR
    oldLayout*: VkImageLayout
    newLayout*: VkImageLayout
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    image*: VkImage
    subresourceRange*: VkImageSubresourceRange

  VkDependencyInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    dependencyFlags*: VkDependencyFlags
    memoryBarrierCount*: uint32
    pMemoryBarriers*: ptr VkMemoryBarrier2KHR
    bufferMemoryBarrierCount*: uint32
    pBufferMemoryBarriers*: ptr VkBufferMemoryBarrier2KHR
    imageMemoryBarrierCount*: uint32
    pImageMemoryBarriers*: ptr VkImageMemoryBarrier2KHR

  VkSemaphoreSubmitInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    value*: uint64
    stageMask*: VkPipelineStageFlags2KHR
    deviceIndex*: uint32

  VkCommandBufferSubmitInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    commandBuffer*: VkCommandBuffer
    deviceMask*: uint32

  VkSubmitInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSubmitFlagsKHR
    waitSemaphoreInfoCount*: uint32
    pWaitSemaphoreInfos*: ptr VkSemaphoreSubmitInfoKHR
    commandBufferInfoCount*: uint32
    pCommandBufferInfos*: ptr VkCommandBufferSubmitInfoKHR
    signalSemaphoreInfoCount*: uint32
    pSignalSemaphoreInfos*: ptr VkSemaphoreSubmitInfoKHR

  VkPhysicalDeviceSynchronization2FeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    synchronization2*: VkBool32

  VkQueueFamilyCheckpointProperties2NV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    checkpointExecutionStageMask*: VkPipelineStageFlags2KHR

  VkCheckpointData2NV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    stage*: VkPipelineStageFlags2KHR
    pCheckpointMarker*: pointer

  PFNVkcmdsetevent2khr* = proc (commandBuffer: VkCommandBuffer; event: VkEvent; pDependencyInfo: ptr VkDependencyInfoKHR) {.cdecl.}
  PFNVkcmdresetevent2khr* = proc (commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags2KHR) {.cdecl.}
  PFNVkcmdwaitevents2khr* = proc (commandBuffer: VkCommandBuffer; eventCount: uint32; pEvents: ptr VkEvent; pDependencyInfos: ptr VkDependencyInfoKHR) {.cdecl.}
  PFNVkcmdpipelinebarrier2khr* = proc (commandBuffer: VkCommandBuffer; pDependencyInfo: ptr VkDependencyInfoKHR) {.cdecl.}
  PFNVkcmdwritetimestamp2khr* = proc (commandBuffer: VkCommandBuffer; stage: VkPipelineStageFlags2KHR; queryPool: VkQueryPool; query: uint32) {.cdecl.}
  PFNVkqueuesubmit2khr* = proc (queue: VkQueue; submitCount: uint32; pSubmits: ptr VkSubmitInfo2KHR; fence: VkFence): VkResult {.cdecl.}
  PFNVkcmdwritebuffermarker2amd* = proc (commandBuffer: VkCommandBuffer; stage: VkPipelineStageFlags2KHR; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; marker: uint32) {.cdecl.}
  PFNVkgetqueuecheckpointdata2nv* = proc (queue: VkQueue; pCheckpointDataCount: ptr uint32; pCheckpointData: ptr VkCheckpointData2NV) {.cdecl.}

const
  vkSubmitProtectedBitKhr* {.used.} = 0x00000001.VkSubmitFlagBitsKHR
  vkSubmitFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkSubmitFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkCmdSetEvent2KHR*(commandBuffer: VkCommandBuffer; event: VkEvent; pDependencyInfo: ptr VkDependencyInfoKHR) {.cdecl, importc.}
  proc vkCmdResetEvent2KHR*(commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags2KHR) {.cdecl, importc.}
  proc vkCmdWaitEvents2KHR*(commandBuffer: VkCommandBuffer; eventCount: uint32; pEvents: ptr VkEvent; pDependencyInfos: ptr VkDependencyInfoKHR) {.cdecl, importc.}
  proc vkCmdPipelineBarrier2KHR*(commandBuffer: VkCommandBuffer; pDependencyInfo: ptr VkDependencyInfoKHR) {.cdecl, importc.}
  proc vkCmdWriteTimestamp2KHR*(commandBuffer: VkCommandBuffer; stage: VkPipelineStageFlags2KHR; queryPool: VkQueryPool; query: uint32) {.cdecl, importc.}
  proc vkQueueSubmit2KHR*(queue: VkQueue; submitCount: uint32; pSubmits: ptr VkSubmitInfo2KHR; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkCmdWriteBufferMarker2AMD*(commandBuffer: VkCommandBuffer; stage: VkPipelineStageFlags2KHR; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; marker: uint32) {.cdecl, importc.}
  proc vkGetQueueCheckpointData2NV*(queue: VkQueue; pCheckpointDataCount: ptr uint32; pCheckpointData: ptr VkCheckpointData2NV) {.cdecl, importc.}
const
  vkKhrZeroInitializeWorkgroupMemory* = 1
  vkKhrZeroInitializeWorkgroupMemorySpecVersion* = 1
  vkKhrZeroInitializeWorkgroupMemoryExtensionName* = "VK_KHR_zero_initialize_workgroup_memory"

type
  VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderZeroInitializeWorkgroupMemory*: VkBool32


const
  vkKhrWorkgroupMemoryExplicitLayout* = 1
  vkKhrWorkgroupMemoryExplicitLayoutSpecVersion* = 1
  vkKhrWorkgroupMemoryExplicitLayoutExtensionName* = "VK_KHR_workgroup_memory_explicit_layout"

type
  VkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    workgroupMemoryExplicitLayout*: VkBool32
    workgroupMemoryExplicitLayoutScalarBlockLayout*: VkBool32
    workgroupMemoryExplicitLayout8BitAccess*: VkBool32
    workgroupMemoryExplicitLayout16BitAccess*: VkBool32


const
  vkKhrCopyCommands2* = 1
  vkKhrCopyCommands2SpecVersion* = 1
  vkKhrCopyCommands2ExtensionName* = "VK_KHR_copy_commands2"

type
  VkBufferCopy2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcOffset*: VkDeviceSize
    dstOffset*: VkDeviceSize
    size*: VkDeviceSize

  VkCopyBufferInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcBuffer*: VkBuffer
    dstBuffer*: VkBuffer
    regionCount*: uint32
    pRegions*: ptr VkBufferCopy2KHR

  VkImageCopy2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkCopyImageInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcImage*: VkImage
    srcImageLayout*: VkImageLayout
    dstImage*: VkImage
    dstImageLayout*: VkImageLayout
    regionCount*: uint32
    pRegions*: ptr VkImageCopy2KHR

  VkBufferImageCopy2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    bufferOffset*: VkDeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: VkImageSubresourceLayers
    imageOffset*: VkOffset3D
    imageExtent*: VkExtent3D

  VkCopyBufferToImageInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcBuffer*: VkBuffer
    dstImage*: VkImage
    dstImageLayout*: VkImageLayout
    regionCount*: uint32
    pRegions*: ptr VkBufferImageCopy2KHR

  VkCopyImageToBufferInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcImage*: VkImage
    srcImageLayout*: VkImageLayout
    dstBuffer*: VkBuffer
    regionCount*: uint32
    pRegions*: ptr VkBufferImageCopy2KHR

  VkImageBlit2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcSubresource*: VkImageSubresourceLayers
    srcOffsets*: array[2, VkOffset3D]
    dstSubresource*: VkImageSubresourceLayers
    dstOffsets*: array[2, VkOffset3D]

  VkBlitImageInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcImage*: VkImage
    srcImageLayout*: VkImageLayout
    dstImage*: VkImage
    dstImageLayout*: VkImageLayout
    regionCount*: uint32
    pRegions*: ptr VkImageBlit2KHR
    filter*: VkFilter

  VkImageResolve2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkResolveImageInfo2KHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    srcImage*: VkImage
    srcImageLayout*: VkImageLayout
    dstImage*: VkImage
    dstImageLayout*: VkImageLayout
    regionCount*: uint32
    pRegions*: ptr VkImageResolve2KHR

  PFNVkcmdcopybuffer2khr* = proc (commandBuffer: VkCommandBuffer; pCopyBufferInfo: ptr VkCopyBufferInfo2KHR) {.cdecl.}
  PFNVkcmdcopyimage2khr* = proc (commandBuffer: VkCommandBuffer; pCopyImageInfo: ptr VkCopyImageInfo2KHR) {.cdecl.}
  PFNVkcmdcopybuffertoimage2khr* = proc (commandBuffer: VkCommandBuffer; pCopyBufferToImageInfo: ptr VkCopyBufferToImageInfo2KHR) {.cdecl.}
  PFNVkcmdcopyimagetobuffer2khr* = proc (commandBuffer: VkCommandBuffer; pCopyImageToBufferInfo: ptr VkCopyImageToBufferInfo2KHR) {.cdecl.}
  PFNVkcmdblitimage2khr* = proc (commandBuffer: VkCommandBuffer; pBlitImageInfo: ptr VkBlitImageInfo2KHR) {.cdecl.}
  PFNVkcmdresolveimage2khr* = proc (commandBuffer: VkCommandBuffer; pResolveImageInfo: ptr VkResolveImageInfo2KHR) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdCopyBuffer2KHR*(commandBuffer: VkCommandBuffer; pCopyBufferInfo: ptr VkCopyBufferInfo2KHR) {.cdecl, importc.}
  proc vkCmdCopyImage2KHR*(commandBuffer: VkCommandBuffer; pCopyImageInfo: ptr VkCopyImageInfo2KHR) {.cdecl, importc.}
  proc vkCmdCopyBufferToImage2KHR*(commandBuffer: VkCommandBuffer; pCopyBufferToImageInfo: ptr VkCopyBufferToImageInfo2KHR) {.cdecl, importc.}
  proc vkCmdCopyImageToBuffer2KHR*(commandBuffer: VkCommandBuffer; pCopyImageToBufferInfo: ptr VkCopyImageToBufferInfo2KHR) {.cdecl, importc.}
  proc vkCmdBlitImage2KHR*(commandBuffer: VkCommandBuffer; pBlitImageInfo: ptr VkBlitImageInfo2KHR) {.cdecl, importc.}
  proc vkCmdResolveImage2KHR*(commandBuffer: VkCommandBuffer; pResolveImageInfo: ptr VkResolveImageInfo2KHR) {.cdecl, importc.}
const
  vkExtDebugReport* = 1

type
  VkDebugReportCallbackEXT* = VkNonDispatchableHandle

const
  vkExtDebugReportSpecVersion* = 9
  vkExtDebugReportExtensionName* = "VK_EXT_debug_report"

type
  VkDebugReportObjectTypeEXT* = distinct cint
  VkDebugReportFlagBitsEXT* = distinct cint
  VkDebugReportFlagsEXT* = VkFlags
  PFNVkdebugreportcallbackext* = proc (flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; `object`: uint64; location: csize_t; messageCode: int32; pLayerPrefix: cstring; pMessage: cstring; pUserData: pointer): VkBool32 {.cdecl.}
  VkDebugReportCallbackCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDebugReportFlagsEXT
    pfnCallback*: PFNVkdebugreportcallbackext
    pUserData*: pointer

  PFNVkcreatedebugreportcallbackext* = proc (instance: VkInstance; pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pCallback: ptr VkDebugReportCallbackEXT): VkResult {.cdecl.}
  PFNVkdestroydebugreportcallbackext* = proc (instance: VkInstance; callback: VkDebugReportCallbackEXT; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkdebugreportmessageext* = proc (instance: VkInstance; flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; `object`: uint64; location: csize_t; messageCode: int32; pLayerPrefix: cstring; pMessage: cstring) {.cdecl.}

const
  vkDebugReportObjectTypeUnknownExt* {.used.} = 0.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeInstanceExt* {.used.} = 1.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypePhysicalDeviceExt* {.used.} = 2.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDeviceExt* {.used.} = 3.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeQueueExt* {.used.} = 4.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSemaphoreExt* {.used.} = 5.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeCommandBufferExt* {.used.} = 6.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeFenceExt* {.used.} = 7.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDeviceMemoryExt* {.used.} = 8.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeBufferExt* {.used.} = 9.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeImageExt* {.used.} = 10.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeEventExt* {.used.} = 11.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeQueryPoolExt* {.used.} = 12.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeBufferViewExt* {.used.} = 13.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeImageViewExt* {.used.} = 14.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeShaderModuleExt* {.used.} = 15.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypePipelineCacheExt* {.used.} = 16.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypePipelineLayoutExt* {.used.} = 17.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeRenderPassExt* {.used.} = 18.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypePipelineExt* {.used.} = 19.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDescriptorSetLayoutExt* {.used.} = 20.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSamplerExt* {.used.} = 21.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDescriptorPoolExt* {.used.} = 22.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDescriptorSetExt* {.used.} = 23.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeFramebufferExt* {.used.} = 24.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeCommandPoolExt* {.used.} = 25.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSurfaceKhrExt* {.used.} = 26.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSwapchainKhrExt* {.used.} = 27.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDebugReportCallbackExtExt* {.used.} = 28.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDisplayKhrExt* {.used.} = 29.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDisplayModeKhrExt* {.used.} = 30.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeValidationCacheExtExt* {.used.} = 33.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDescriptorUpdateTemplateExt* {.used.} = 1000085000.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeAccelerationStructureKhrExt* {.used.} = 1000150000.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeSamplerYcbcrConversionExt* {.used.} = 1000156000.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeAccelerationStructureNvExt* {.used.} = 1000165000.VkDebugReportObjectTypeEXT
  vkDebugReportObjectTypeDebugReportExt* {.used.}: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeDebugReportCallbackExtExt
  vkDebugReportObjectTypeValidationCacheExt* {.used.}: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeValidationCacheExtExt
  vkDebugReportObjectTypeDescriptorUpdateTemplateKhrExt* {.used.}: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeDescriptorUpdateTemplateExt
  vkDebugReportObjectTypeSamplerYcbcrConversionKhrExt* {.used.}: VkDebugReportObjectTypeEXT = vkDebugReportObjectTypeSamplerYcbcrConversionExt
  vkDebugReportObjectTypeMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDebugReportObjectTypeEXT

const
  vkDebugReportInformationBitExt* {.used.} = 0x00000001.VkDebugReportFlagBitsEXT
  vkDebugReportWarningBitExt* {.used.} = 0x00000002.VkDebugReportFlagBitsEXT
  vkDebugReportPerformanceWarningBitExt* {.used.} = 0x00000004.VkDebugReportFlagBitsEXT
  vkDebugReportErrorBitExt* {.used.} = 0x00000008.VkDebugReportFlagBitsEXT
  vkDebugReportDebugBitExt* {.used.} = 0x00000010.VkDebugReportFlagBitsEXT
  vkDebugReportFlagBitsMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDebugReportFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkCreateDebugReportCallbackEXT*(instance: VkInstance; pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pCallback: ptr VkDebugReportCallbackEXT): VkResult {.cdecl, importc.}
  proc vkDestroyDebugReportCallbackEXT*(instance: VkInstance; callback: VkDebugReportCallbackEXT; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkDebugReportMessageEXT*(instance: VkInstance; flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; `object`: uint64; location: csize_t; messageCode: int32; pLayerPrefix: cstring; pMessage: cstring) {.cdecl, importc.}
const
  vkNvGlslShader* = 1
  vkNvGlslShaderSpecVersion* = 1
  vkNvGlslShaderExtensionName* = "VK_NV_glsl_shader"
  vkExtDepthRangeUnrestricted* = 1
  vkExtDepthRangeUnrestrictedSpecVersion* = 1
  vkExtDepthRangeUnrestrictedExtensionName* = "VK_EXT_depth_range_unrestricted"
  vkImgFilterCubic* = 1
  vkImgFilterCubicSpecVersion* = 1
  vkImgFilterCubicExtensionName* = "VK_IMG_filter_cubic"
  vkAmdRasterizationOrder* = 1
  vkAmdRasterizationOrderSpecVersion* = 1
  vkAmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"

type
  VkRasterizationOrderAMD* = distinct cint
  VkPipelineRasterizationStateRasterizationOrderAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    rasterizationOrder*: VkRasterizationOrderAMD


const
  vkRasterizationOrderStrictAmd* {.used.} = 0.VkRasterizationOrderAMD
  vkRasterizationOrderRelaxedAmd* {.used.} = 1.VkRasterizationOrderAMD
  vkRasterizationOrderMaxEnumAmd* {.used.} = 0x7FFFFFFF.VkRasterizationOrderAMD

const
  vkAmdShaderrinaryMinmax* = 1
  vkAmdShaderTrinaryMinmaxSpecVersion* = 1
  vkAmdShaderTrinaryMinmaxExtensionName* = "VK_AMD_shaderrinary_minmax"
  vkAmdShaderExplicitVertexParameter* = 1
  vkAmdShaderExplicitVertexParameterSpecVersion* = 1
  vkAmdShaderExplicitVertexParameterExtensionName* = "VK_AMD_shader_explicit_vertex_parameter"
  vkExtDebugMarker* = 1
  vkExtDebugMarkerSpecVersion* = 4
  vkExtDebugMarkerExtensionName* = "VK_EXT_debug_marker"

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
    tagSize*: csize_t
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
  vkAmdGcnShaderExtensionName* = "VK_AMD_gcn_shader"
  vkNvDedicatedAllocation* = 1
  vkNvDedicatedAllocationSpecVersion* = 1
  vkNvDedicatedAllocationExtensionName* = "VK_NV_dedicated_allocation"

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
  vkExtTransformFeedbackExtensionName* = "VK_EXTransform_feedback"

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
  vkNvxImageViewHandle* = 1
  vkNvxImageViewHandleSpecVersion* = 2
  vkNvxImageViewHandleExtensionName* = "VK_NVX_image_view_handle"

type
  VkImageViewHandleInfoNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    imageView*: VkImageView
    descriptorType*: VkDescriptorType
    sampler*: VkSampler

  VkImageViewAddressPropertiesNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceAddress*: VkDeviceAddress
    size*: VkDeviceSize

  PFNVkgetimageviewhandlenvx* = proc (device: VkDevice; pInfo: ptr VkImageViewHandleInfoNVX): uint32 {.cdecl.}
  PFNVkgetimageviewaddressnvx* = proc (device: VkDevice; imageView: VkImageView; pProperties: ptr VkImageViewAddressPropertiesNVX): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetImageViewHandleNVX*(device: VkDevice; pInfo: ptr VkImageViewHandleInfoNVX): uint32 {.cdecl, importc.}
  proc vkGetImageViewAddressNVX*(device: VkDevice; imageView: VkImageView; pProperties: ptr VkImageViewAddressPropertiesNVX): VkResult {.cdecl, importc.}
const
  vkAmdDrawIndirectCount* = 1
  vkAmdDrawIndirectCountSpecVersion* = 2
  vkAmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"

type
  PFNVkcmddrawindirectcountamd* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}
  PFNVkcmddrawindexedindirectcountamd* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdDrawIndirectCountAMD*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexedIndirectCountAMD*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
const
  vkAmdNegativeViewportHeight* = 1
  vkAmdNegativeViewportHeightSpecVersion* = 1
  vkAmdNegativeViewportHeightExtensionName* = "VK_AMD_negative_viewport_height"
  vkAmdGpuShaderHalfFloat* = 1
  vkAmdGpuShaderHalfFloatSpecVersion* = 2
  vkAmdGpuShaderHalfFloatExtensionName* = "VK_AMD_gpu_shader_half_float"
  vkAmdShaderBallot* = 1
  vkAmdShaderBallotSpecVersion* = 1
  vkAmdShaderBallotExtensionName* = "VK_AMD_shader_ballot"
  vkAmdextureGatherBiasLod* = 1
  vkAmdTextureGatherBiasLodSpecVersion* = 1
  vkAmdTextureGatherBiasLodExtensionName* = "VK_AMDexture_gather_bias_lod"

type
  VkTextureLODGatherFormatPropertiesAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    supportsTextureGatherLODBiasAMD*: VkBool32


const
  vkAmdShaderInfo* = 1
  vkAmdShaderInfoSpecVersion* = 1
  vkAmdShaderInfoExtensionName* = "VK_AMD_shader_info"

type
  VkShaderInfoTypeAMD* = distinct cint
  VkShaderResourceUsageAMD* {.bycopy.} = object
    numUsedVgprs*: uint32
    numUsedSgprs*: uint32
    ldsSizePerLocalWorkGroup*: uint32
    ldsUsageSizeInBytes*: csize_t
    scratchMemUsageInBytes*: csize_t

  VkShaderStatisticsInfoAMD* {.bycopy.} = object
    shaderStageMask*: VkShaderStageFlags
    resourceUsage*: VkShaderResourceUsageAMD
    numPhysicalVgprs*: uint32
    numPhysicalSgprs*: uint32
    numAvailableVgprs*: uint32
    numAvailableSgprs*: uint32
    computeWorkGroupSize*: array[3, uint32]

  PFNVkgetshaderinfoamd* = proc (device: VkDevice; pipeline: VkPipeline; shaderStage: VkShaderStageFlagBits; infoType: VkShaderInfoTypeAMD; pInfoSize: ptr csize_t; pInfo: pointer): VkResult {.cdecl.}

const
  vkShaderInfoTypeStatisticsAmd* {.used.} = 0.VkShaderInfoTypeAMD
  vkShaderInfoTypeBinaryAmd* {.used.} = 1.VkShaderInfoTypeAMD
  vkShaderInfoTypeDisassemblyAmd* {.used.} = 2.VkShaderInfoTypeAMD
  vkShaderInfoTypeMaxEnumAmd* {.used.} = 0x7FFFFFFF.VkShaderInfoTypeAMD

when not defined(vkNoPrototypes):
  proc vkGetShaderInfoAMD*(device: VkDevice; pipeline: VkPipeline; shaderStage: VkShaderStageFlagBits; infoType: VkShaderInfoTypeAMD; pInfoSize: ptr csize_t; pInfo: pointer): VkResult {.cdecl, importc.}
const
  vkAmdShaderImageLoadStoreLod* = 1
  vkAmdShaderImageLoadStoreLodSpecVersion* = 1
  vkAmdShaderImageLoadStoreLodExtensionName* = "VK_AMD_shader_image_load_store_lod"
  vkNvCornerSampledImage* = 1
  vkNvCornerSampledImageSpecVersion* = 2
  vkNvCornerSampledImageExtensionName* = "VK_NV_corner_sampled_image"

type
  VkPhysicalDeviceCornerSampledImageFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    cornerSampledImage*: VkBool32


const
  vkImgFormatPvrtc* = 1
  vkImgFormatPvrtcSpecVersion* = 1
  vkImgFormatPvrtcExtensionName* = "VK_IMG_format_pvrtc"
  vkNvExternalMemoryCapabilities* = 1
  vkNvExternalMemoryCapabilitiesSpecVersion* = 1
  vkNvExternalMemoryCapabilitiesExtensionName* = "VK_NV_external_memory_capabilities"

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
  vkExternalMemoryHandleTypeOpaqueWin32BitNv* {.used.} = 0x00000001.VkExternalMemoryHandleTypeFlagBitsNV
  vkExternalMemoryHandleTypeOpaqueWin32KmtBitNv* {.used.} = 0x00000002.VkExternalMemoryHandleTypeFlagBitsNV
  vkExternalMemoryHandleTypeD3d11ImageBitNv* {.used.} = 0x00000004.VkExternalMemoryHandleTypeFlagBitsNV
  vkExternalMemoryHandleTypeD3d11ImageKmtBitNv* {.used.} = 0x00000008.VkExternalMemoryHandleTypeFlagBitsNV
  vkExternalMemoryHandleTypeFlagBitsMaxEnumNv* {.used.} = 0x7FFFFFFF.VkExternalMemoryHandleTypeFlagBitsNV

const
  vkExternalMemoryFeatureDedicatedOnlyBitNv* {.used.} = 0x00000001.VkExternalMemoryFeatureFlagBitsNV
  vkExternalMemoryFeatureExportableBitNv* {.used.} = 0x00000002.VkExternalMemoryFeatureFlagBitsNV
  vkExternalMemoryFeatureImportableBitNv* {.used.} = 0x00000004.VkExternalMemoryFeatureFlagBitsNV
  vkExternalMemoryFeatureFlagBitsMaxEnumNv* {.used.} = 0x7FFFFFFF.VkExternalMemoryFeatureFlagBitsNV

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceExternalImageFormatPropertiesNV*(physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; externalHandleType: VkExternalMemoryHandleTypeFlagsNV; pExternalImageFormatProperties: ptr VkExternalImageFormatPropertiesNV): VkResult {.cdecl, importc.}
const
  vkNvExternalMemory* = 1
  vkNvExternalMemorySpecVersion* = 1
  vkNvExternalMemoryExtensionName* = "VK_NV_external_memory"

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
  vkExtValidationFlagsSpecVersion* = 2
  vkExtValidationFlagsExtensionName* = "VK_EXT_validation_flags"

type
  VkValidationCheckEXT* = distinct cint
  VkValidationFlagsEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks*: ptr VkValidationCheckEXT


const
  vkValidationCheckAllExt* {.used.} = 0.VkValidationCheckEXT
  vkValidationCheckShadersExt* {.used.} = 1.VkValidationCheckEXT
  vkValidationCheckMaxEnumExt* {.used.} = 0x7FFFFFFF.VkValidationCheckEXT

const
  vkExtShaderSubgroupBallot* = 1
  vkExtShaderSubgroupBallotSpecVersion* = 1
  vkExtShaderSubgroupBallotExtensionName* = "VK_EXT_shader_subgroup_ballot"
  vkExtShaderSubgroupVote* = 1
  vkExtShaderSubgroupVoteSpecVersion* = 1
  vkExtShaderSubgroupVoteExtensionName* = "VK_EXT_shader_subgroup_vote"
  vkExtextureCompressionAstcHdr* = 1
  vkExtTextureCompressionAstcHdrSpecVersion* = 1
  vkExtTextureCompressionAstcHdrExtensionName* = "VK_EXTexture_compression_astc_hdr"

type
  VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    textureCompressionASTC_HDR*: VkBool32


const
  vkExtAstcDecodeMode* = 1
  vkExtAstcDecodeModeSpecVersion* = 1
  vkExtAstcDecodeModeExtensionName* = "VK_EXT_astc_decode_mode"

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
  vkExtConditionalRenderingSpecVersion* = 2
  vkExtConditionalRenderingExtensionName* = "VK_EXT_conditional_rendering"

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
  vkConditionalRenderingInvertedBitExt* {.used.} = 0x00000001.VkConditionalRenderingFlagBitsEXT
  vkConditionalRenderingFlagBitsMaxEnumExt* {.used.} = 0x7FFFFFFF.VkConditionalRenderingFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkCmdBeginConditionalRenderingEXT*(commandBuffer: VkCommandBuffer; pConditionalRenderingBegin: ptr VkConditionalRenderingBeginInfoEXT) {.cdecl, importc.}
  proc vkCmdEndConditionalRenderingEXT*(commandBuffer: VkCommandBuffer) {.cdecl, importc.}
const
  vkNvClipSpaceWScaling* = 1
  vkNvClipSpaceWScalingSpecVersion* = 1
  vkNvClipSpaceWScalingExtensionName* = "VK_NV_clip_space_w_scaling"

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
  vkExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"

type
  PFNVkreleasedisplayext* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkReleaseDisplayEXT*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR): VkResult {.cdecl, importc.}
const
  vkExtDisplaySurfaceCounter* = 1
  vkExtDisplaySurfaceCounterSpecVersion* = 1
  vkExtDisplaySurfaceCounterExtensionName* = "VK_EXT_display_surface_counter"

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

  PFNVkgetphysicaldevicesurfacecapabilities2ext* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2EXT): VkResult {.cdecl.}

const
  vkSurfaceCounterVblankBitExt* {.used.} = 0x00000001.VkSurfaceCounterFlagBitsEXT
  vkSurfaceCounterVblankExt* {.used.}: VkSurfaceCounterFlagBitsEXT = vkSurfaceCounterVblankBitExt
  vkSurfaceCounterFlagBitsMaxEnumExt* {.used.} = 0x7FFFFFFF.VkSurfaceCounterFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceSurfaceCapabilities2EXT*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2EXT): VkResult {.cdecl, importc.}
const
  vkExtDisplayControl* = 1
  vkExtDisplayControlSpecVersion* = 1
  vkExtDisplayControlExtensionName* = "VK_EXT_display_control"

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
  PFNVkregisterdeviceeventext* = proc (device: VkDevice; pDeviceEventInfo: ptr VkDeviceEventInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pFence: ptr VkFence): VkResult {.cdecl.}
  PFNVkregisterdisplayeventext* = proc (device: VkDevice; display: VkDisplayKHR; pDisplayEventInfo: ptr VkDisplayEventInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pFence: ptr VkFence): VkResult {.cdecl.}
  PFNVkgetswapchaincounterext* = proc (device: VkDevice; swapchain: VkSwapchainKHR; counter: VkSurfaceCounterFlagBitsEXT; pCounterValue: ptr uint64): VkResult {.cdecl.}

const
  vkDisplayPowerStateOffExt* {.used.} = 0.VkDisplayPowerStateEXT
  vkDisplayPowerStateSuspendExt* {.used.} = 1.VkDisplayPowerStateEXT
  vkDisplayPowerStateOnExt* {.used.} = 2.VkDisplayPowerStateEXT
  vkDisplayPowerStateMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDisplayPowerStateEXT

const
  vkDeviceEventTypeDisplayHotplugExt* {.used.} = 0.VkDeviceEventTypeEXT
  vkDeviceEventTypeMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDeviceEventTypeEXT

const
  vkDisplayEventTypeFirstPixelOutExt* {.used.} = 0.VkDisplayEventTypeEXT
  vkDisplayEventTypeMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDisplayEventTypeEXT

when not defined(vkNoPrototypes):
  proc vkDisplayPowerControlEXT*(device: VkDevice; display: VkDisplayKHR; pDisplayPowerInfo: ptr VkDisplayPowerInfoEXT): VkResult {.cdecl, importc.}
  proc vkRegisterDeviceEventEXT*(device: VkDevice; pDeviceEventInfo: ptr VkDeviceEventInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkRegisterDisplayEventEXT*(device: VkDevice; display: VkDisplayKHR; pDisplayEventInfo: ptr VkDisplayEventInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkGetSwapchainCounterEXT*(device: VkDevice; swapchain: VkSwapchainKHR; counter: VkSurfaceCounterFlagBitsEXT; pCounterValue: ptr uint64): VkResult {.cdecl, importc.}
const
  vkGoogleDisplayiming* = 1
  vkGoogleDisplayTimingSpecVersion* = 1
  vkGoogleDisplayTimingExtensionName* = "VK_GOOGLE_displayiming"

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
  vkNvSampleMaskOverrideCoverageExtensionName* = "VK_NV_sample_mask_override_coverage"
  vkNvGeometryShaderPassthrough* = 1
  vkNvGeometryShaderPassthroughSpecVersion* = 1
  vkNvGeometryShaderPassthroughExtensionName* = "VK_NV_geometry_shader_passthrough"
  vkNvViewportArray2* = 1
  vkNvViewportArray2SpecVersion* = 1
  vkNvViewportArray2ExtensionName* = "VK_NV_viewport_array2"
  vkNvxMultiviewPerViewAttributes* = 1
  vkNvxMultiviewPerViewAttributesSpecVersion* = 1
  vkNvxMultiviewPerViewAttributesExtensionName* = "VK_NVX_multiview_per_view_attributes"

type
  VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    perViewPositionAllComponents*: VkBool32


const
  vkNvViewportSwizzle* = 1
  vkNvViewportSwizzleSpecVersion* = 1
  vkNvViewportSwizzleExtensionName* = "VK_NV_viewport_swizzle"

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
  vkViewportCoordinateSwizzlePositiveXNv* {.used.} = 0.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleNegativeXNv* {.used.} = 1.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzlePositiveYNv* {.used.} = 2.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleNegativeYNv* {.used.} = 3.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzlePositiveZNv* {.used.} = 4.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleNegativeZNv* {.used.} = 5.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzlePositiveWNv* {.used.} = 6.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleNegativeWNv* {.used.} = 7.VkViewportCoordinateSwizzleNV
  vkViewportCoordinateSwizzleMaxEnumNv* {.used.} = 0x7FFFFFFF.VkViewportCoordinateSwizzleNV

const
  vkExtDiscardRectangles* = 1
  vkExtDiscardRectanglesSpecVersion* = 1
  vkExtDiscardRectanglesExtensionName* = "VK_EXT_discard_rectangles"

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
  vkDiscardRectangleModeInclusiveExt* {.used.} = 0.VkDiscardRectangleModeEXT
  vkDiscardRectangleModeExclusiveExt* {.used.} = 1.VkDiscardRectangleModeEXT
  vkDiscardRectangleModeMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDiscardRectangleModeEXT

when not defined(vkNoPrototypes):
  proc vkCmdSetDiscardRectangleEXT*(commandBuffer: VkCommandBuffer; firstDiscardRectangle: uint32; discardRectangleCount: uint32; pDiscardRectangles: ptr VkRect2D) {.cdecl, importc.}
const
  vkExtConservativeRasterization* = 1
  vkExtConservativeRasterizationSpecVersion* = 1
  vkExtConservativeRasterizationExtensionName* = "VK_EXT_conservative_rasterization"

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
  vkConservativeRasterizationModeDisabledExt* {.used.} = 0.VkConservativeRasterizationModeEXT
  vkConservativeRasterizationModeOverestimateExt* {.used.} = 1.VkConservativeRasterizationModeEXT
  vkConservativeRasterizationModeUnderestimateExt* {.used.} = 2.VkConservativeRasterizationModeEXT
  vkConservativeRasterizationModeMaxEnumExt* {.used.} = 0x7FFFFFFF.VkConservativeRasterizationModeEXT

const
  vkExtDepthClipEnable* = 1
  vkExtDepthClipEnableSpecVersion* = 1
  vkExtDepthClipEnableExtensionName* = "VK_EXT_depth_clip_enable"

type
  VkPipelineRasterizationDepthClipStateCreateFlagsEXT* = VkFlags
  VkPhysicalDeviceDepthClipEnableFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    depthClipEnable*: VkBool32

  VkPipelineRasterizationDepthClipStateCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationDepthClipStateCreateFlagsEXT
    depthClipEnable*: VkBool32


const
  vkExtSwapchainColorspace* = 1
  vkExtSwapchainColorSpaceSpecVersion* = 4
  vkExtSwapchainColorSpaceExtensionName* = "VK_EXT_swapchain_colorspace"
  vkExtHdrMetadata* = 1
  vkExtHdrMetadataSpecVersion* = 2
  vkExtHdrMetadataExtensionName* = "VK_EXT_hdr_metadata"

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
  vkExtExternalMemoryDmaBufExtensionName* = "VK_EXT_external_memory_dma_buf"
  vkExtQueueFamilyForeign* = 1
  vkExtQueueFamilyForeignSpecVersion* = 1
  vkExtQueueFamilyForeignExtensionName* = "VK_EXT_queue_family_foreign"
  vkQueueFamilyForeignExt* = (not 0 - 2)
  vkExtDebugUtils* = 1

type
  VkDebugUtilsMessengerEXT* = VkNonDispatchableHandle

const
  vkExtDebugUtilsSpecVersion* = 2
  vkExtDebugUtilsExtensionName* = "VK_EXT_debug_utils"

type
  VkDebugUtilsMessengerCallbackDataFlagsEXT* = VkFlags
  VkDebugUtilsMessageSeverityFlagBitsEXT* = distinct cint
  VkDebugUtilsMessageTypeFlagBitsEXT* = distinct cint
  VkDebugUtilsMessageTypeFlagsEXT* = VkFlags
  VkDebugUtilsMessageSeverityFlagsEXT* = VkFlags
  VkDebugUtilsMessengerCreateFlagsEXT* = VkFlags
  VkDebugUtilsLabelEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pLabelName*: cstring
    color*: array[4, cfloat]

  VkDebugUtilsObjectNameInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkObjectType
    objectHandle*: uint64
    pObjectName*: cstring

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

  VkDebugUtilsObjectTagInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkObjectType
    objectHandle*: uint64
    tagName*: uint64
    tagSize*: csize_t
    pTag*: pointer

  PFNVksetdebugutilsobjectnameext* = proc (device: VkDevice; pNameInfo: ptr VkDebugUtilsObjectNameInfoEXT): VkResult {.cdecl.}
  PFNVksetdebugutilsobjecttagext* = proc (device: VkDevice; pTagInfo: ptr VkDebugUtilsObjectTagInfoEXT): VkResult {.cdecl.}
  PFNVkqueuebegindebugutilslabelext* = proc (queue: VkQueue; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl.}
  PFNVkqueueenddebugutilslabelext* = proc (queue: VkQueue) {.cdecl.}
  PFNVkqueueinsertdebugutilslabelext* = proc (queue: VkQueue; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl.}
  PFNVkcmdbegindebugutilslabelext* = proc (commandBuffer: VkCommandBuffer; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl.}
  PFNVkcmdenddebugutilslabelext* = proc (commandBuffer: VkCommandBuffer) {.cdecl.}
  PFNVkcmdinsertdebugutilslabelext* = proc (commandBuffer: VkCommandBuffer; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl.}
  PFNVkcreatedebugutilsmessengerext* = proc (instance: VkInstance; pCreateInfo: ptr VkDebugUtilsMessengerCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pMessenger: ptr VkDebugUtilsMessengerEXT): VkResult {.cdecl.}
  PFNVkdestroydebugutilsmessengerext* = proc (instance: VkInstance; messenger: VkDebugUtilsMessengerEXT; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVksubmitdebugutilsmessageext* = proc (instance: VkInstance; messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT; messageTypes: VkDebugUtilsMessageTypeFlagsEXT; pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT) {.cdecl.}

const
  vkDebugUtilsMessageSeverityVerboseBitExt* {.used.} = 0x00000001.VkDebugUtilsMessageSeverityFlagBitsEXT
  vkDebugUtilsMessageSeverityInfoBitExt* {.used.} = 0x00000010.VkDebugUtilsMessageSeverityFlagBitsEXT
  vkDebugUtilsMessageSeverityWarningBitExt* {.used.} = 0x00000100.VkDebugUtilsMessageSeverityFlagBitsEXT
  vkDebugUtilsMessageSeverityErrorBitExt* {.used.} = 0x00001000.VkDebugUtilsMessageSeverityFlagBitsEXT
  vkDebugUtilsMessageSeverityFlagBitsMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDebugUtilsMessageSeverityFlagBitsEXT

const
  vkDebugUtilsMessageTypeGeneralBitExt* {.used.} = 0x00000001.VkDebugUtilsMessageTypeFlagBitsEXT
  vkDebugUtilsMessageTypeValidationBitExt* {.used.} = 0x00000002.VkDebugUtilsMessageTypeFlagBitsEXT
  vkDebugUtilsMessageTypePerformanceBitExt* {.used.} = 0x00000004.VkDebugUtilsMessageTypeFlagBitsEXT
  vkDebugUtilsMessageTypeFlagBitsMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDebugUtilsMessageTypeFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkSetDebugUtilsObjectNameEXT*(device: VkDevice; pNameInfo: ptr VkDebugUtilsObjectNameInfoEXT): VkResult {.cdecl, importc.}
  proc vkSetDebugUtilsObjectTagEXT*(device: VkDevice; pTagInfo: ptr VkDebugUtilsObjectTagInfoEXT): VkResult {.cdecl, importc.}
  proc vkQueueBeginDebugUtilsLabelEXT*(queue: VkQueue; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl, importc.}
  proc vkQueueEndDebugUtilsLabelEXT*(queue: VkQueue) {.cdecl, importc.}
  proc vkQueueInsertDebugUtilsLabelEXT*(queue: VkQueue; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl, importc.}
  proc vkCmdBeginDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl, importc.}
  proc vkCmdEndDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer) {.cdecl, importc.}
  proc vkCmdInsertDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer; pLabelInfo: ptr VkDebugUtilsLabelEXT) {.cdecl, importc.}
  proc vkCreateDebugUtilsMessengerEXT*(instance: VkInstance; pCreateInfo: ptr VkDebugUtilsMessengerCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pMessenger: ptr VkDebugUtilsMessengerEXT): VkResult {.cdecl, importc.}
  proc vkDestroyDebugUtilsMessengerEXT*(instance: VkInstance; messenger: VkDebugUtilsMessengerEXT; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkSubmitDebugUtilsMessageEXT*(instance: VkInstance; messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT; messageTypes: VkDebugUtilsMessageTypeFlagsEXT; pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT) {.cdecl, importc.}
const
  vkExtSamplerFilterMinmax* = 1
  vkExtSamplerFilterMinmaxSpecVersion* = 2
  vkExtSamplerFilterMinmaxExtensionName* = "VK_EXT_sampler_filter_minmax"

type
  VkSamplerReductionModeEXT* = VkSamplerReductionMode
  VkSamplerReductionModeCreateInfoEXT* = VkSamplerReductionModeCreateInfo
  VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT* = VkPhysicalDeviceSamplerFilterMinmaxProperties

const
  vkAmdGpuShaderInt16* = 1
  vkAmdGpuShaderInt16SpecVersion* = 2
  vkAmdGpuShaderInt16ExtensionName* = "VK_AMD_gpu_shader_int16"
  vkAmdMixedAttachmentSamples* = 1
  vkAmdMixedAttachmentSamplesSpecVersion* = 1
  vkAmdMixedAttachmentSamplesExtensionName* = "VK_AMD_mixed_attachment_samples"
  vkAmdShaderFragmentMask* = 1
  vkAmdShaderFragmentMaskSpecVersion* = 1
  vkAmdShaderFragmentMaskExtensionName* = "VK_AMD_shader_fragment_mask"
  vkExtInlineUniformBlock* = 1
  vkExtInlineUniformBlockSpecVersion* = 1
  vkExtInlineUniformBlockExtensionName* = "VK_EXT_inline_uniform_block"

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
  vkExtShaderStencilExportExtensionName* = "VK_EXT_shader_stencil_export"
  vkExtSampleLocations* = 1
  vkExtSampleLocationsSpecVersion* = 1
  vkExtSampleLocationsExtensionName* = "VK_EXT_sample_locations"

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
  vkExtBlendOperationAdvancedExtensionName* = "VK_EXT_blend_operation_advanced"

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
  vkBlendOverlapUncorrelatedExt* {.used.} = 0.VkBlendOverlapEXT
  vkBlendOverlapDisjointExt* {.used.} = 1.VkBlendOverlapEXT
  vkBlendOverlapConjointExt* {.used.} = 2.VkBlendOverlapEXT
  vkBlendOverlapMaxEnumExt* {.used.} = 0x7FFFFFFF.VkBlendOverlapEXT

const
  vkNvFragmentCoverageToColor* = 1
  vkNvFragmentCoverageToColorSpecVersion* = 1
  vkNvFragmentCoverageToColorExtensionName* = "VK_NV_fragment_coverage_to_color"

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
  vkNvFramebufferMixedSamplesExtensionName* = "VK_NV_framebuffer_mixed_samples"

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
  vkCoverageModulationModeNoneNv* {.used.} = 0.VkCoverageModulationModeNV
  vkCoverageModulationModeRgbNv* {.used.} = 1.VkCoverageModulationModeNV
  vkCoverageModulationModeAlphaNv* {.used.} = 2.VkCoverageModulationModeNV
  vkCoverageModulationModeRgbaNv* {.used.} = 3.VkCoverageModulationModeNV
  vkCoverageModulationModeMaxEnumNv* {.used.} = 0x7FFFFFFF.VkCoverageModulationModeNV

const
  vkNvFillRectangle* = 1
  vkNvFillRectangleSpecVersion* = 1
  vkNvFillRectangleExtensionName* = "VK_NV_fill_rectangle"
  vkNvShaderSmBuiltins* = 1
  vkNvShaderSmBuiltinsSpecVersion* = 1
  vkNvShaderSmBuiltinsExtensionName* = "VK_NV_shader_sm_builtins"

type
  VkPhysicalDeviceShaderSMBuiltinsPropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderSMCount*: uint32
    shaderWarpsPerSM*: uint32

  VkPhysicalDeviceShaderSMBuiltinsFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderSMBuiltins*: VkBool32


const
  vkExtPostDepthCoverage* = 1
  vkExtPostDepthCoverageSpecVersion* = 1
  vkExtPostDepthCoverageExtensionName* = "VK_EXT_post_depth_coverage"
  vkExtImageDrmFormatModifier* = 1
  vkExtImageDrmFormatModifierSpecVersion* = 1
  vkExtImageDrmFormatModifierExtensionName* = "VK_EXT_image_drm_format_modifier"

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
  vkExtValidationCacheExtensionName* = "VK_EXT_validation_cache"

type
  VkValidationCacheHeaderVersionEXT* = distinct cint
  VkValidationCacheCreateFlagsEXT* = VkFlags
  VkValidationCacheCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkValidationCacheCreateFlagsEXT
    initialDataSize*: csize_t
    pInitialData*: pointer

  VkShaderModuleValidationCacheCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    validationCache*: VkValidationCacheEXT

  PFNVkcreatevalidationcacheext* = proc (device: VkDevice; pCreateInfo: ptr VkValidationCacheCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pValidationCache: ptr VkValidationCacheEXT): VkResult {.cdecl.}
  PFNVkdestroyvalidationcacheext* = proc (device: VkDevice; validationCache: VkValidationCacheEXT; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkmergevalidationcachesext* = proc (device: VkDevice; dstCache: VkValidationCacheEXT; srcCacheCount: uint32; pSrcCaches: ptr VkValidationCacheEXT): VkResult {.cdecl.}
  PFNVkgetvalidationcachedataext* = proc (device: VkDevice; validationCache: VkValidationCacheEXT; pDataSize: ptr csize_t; pData: pointer): VkResult {.cdecl.}

const
  vkValidationCacheHeaderVersionOneExt* {.used.} = 1.VkValidationCacheHeaderVersionEXT
  vkValidationCacheHeaderVersionMaxEnumExt* {.used.} = 0x7FFFFFFF.VkValidationCacheHeaderVersionEXT

when not defined(vkNoPrototypes):
  proc vkCreateValidationCacheEXT*(device: VkDevice; pCreateInfo: ptr VkValidationCacheCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pValidationCache: ptr VkValidationCacheEXT): VkResult {.cdecl, importc.}
  proc vkDestroyValidationCacheEXT*(device: VkDevice; validationCache: VkValidationCacheEXT; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkMergeValidationCachesEXT*(device: VkDevice; dstCache: VkValidationCacheEXT; srcCacheCount: uint32; pSrcCaches: ptr VkValidationCacheEXT): VkResult {.cdecl, importc.}
  proc vkGetValidationCacheDataEXT*(device: VkDevice; validationCache: VkValidationCacheEXT; pDataSize: ptr csize_t; pData: pointer): VkResult {.cdecl, importc.}
const
  vkExtDescriptorIndexing* = 1
  vkExtDescriptorIndexingSpecVersion* = 2
  vkExtDescriptorIndexingExtensionName* = "VK_EXT_descriptor_indexing"

type
  VkDescriptorBindingFlagBitsEXT* = VkDescriptorBindingFlagBits
  VkDescriptorBindingFlagsEXT* = VkDescriptorBindingFlags
  VkDescriptorSetLayoutBindingFlagsCreateInfoEXT* = VkDescriptorSetLayoutBindingFlagsCreateInfo
  VkPhysicalDeviceDescriptorIndexingFeaturesEXT* = VkPhysicalDeviceDescriptorIndexingFeatures
  VkPhysicalDeviceDescriptorIndexingPropertiesEXT* = VkPhysicalDeviceDescriptorIndexingProperties
  VkDescriptorSetVariableDescriptorCountAllocateInfoEXT* = VkDescriptorSetVariableDescriptorCountAllocateInfo
  VkDescriptorSetVariableDescriptorCountLayoutSupportEXT* = VkDescriptorSetVariableDescriptorCountLayoutSupport

const
  vkExtShaderViewportIndexLayer* = 1
  vkExtShaderViewportIndexLayerSpecVersion* = 1
  vkExtShaderViewportIndexLayerExtensionName* = "VK_EXT_shader_viewport_index_layer"
  vkNvShadingRateImage* = 1
  vkNvShadingRateImageSpecVersion* = 3
  vkNvShadingRateImageExtensionName* = "VK_NV_shading_rate_image"

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
  vkShadingRatePaletteEntryNoInvocationsNv* {.used.} = 0.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry16InvocationsPerPixelNv* {.used.} = 1.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry8InvocationsPerPixelNv* {.used.} = 2.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry4InvocationsPerPixelNv* {.used.} = 3.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry2InvocationsPerPixelNv* {.used.} = 4.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry1InvocationPerPixelNv* {.used.} = 5.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry1InvocationPer2x1PixelsNv* {.used.} = 6.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry1InvocationPer1x2PixelsNv* {.used.} = 7.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry1InvocationPer2x2PixelsNv* {.used.} = 8.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry1InvocationPer4x2PixelsNv* {.used.} = 9.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry1InvocationPer2x4PixelsNv* {.used.} = 10.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntry1InvocationPer4x4PixelsNv* {.used.} = 11.VkShadingRatePaletteEntryNV
  vkShadingRatePaletteEntryMaxEnumNv* {.used.} = 0x7FFFFFFF.VkShadingRatePaletteEntryNV

const
  vkCoarseSampleOrderTypeDefaultNv* {.used.} = 0.VkCoarseSampleOrderTypeNV
  vkCoarseSampleOrderTypeCustomNv* {.used.} = 1.VkCoarseSampleOrderTypeNV
  vkCoarseSampleOrderTypePixelMajorNv* {.used.} = 2.VkCoarseSampleOrderTypeNV
  vkCoarseSampleOrderTypeSampleMajorNv* {.used.} = 3.VkCoarseSampleOrderTypeNV
  vkCoarseSampleOrderTypeMaxEnumNv* {.used.} = 0x7FFFFFFF.VkCoarseSampleOrderTypeNV

when not defined(vkNoPrototypes):
  proc vkCmdBindShadingRateImageNV*(commandBuffer: VkCommandBuffer; imageView: VkImageView; imageLayout: VkImageLayout) {.cdecl, importc.}
  proc vkCmdSetViewportShadingRatePaletteNV*(commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pShadingRatePalettes: ptr VkShadingRatePaletteNV) {.cdecl, importc.}
  proc vkCmdSetCoarseSampleOrderNV*(commandBuffer: VkCommandBuffer; sampleOrderType: VkCoarseSampleOrderTypeNV; customSampleOrderCount: uint32; pCustomSampleOrders: ptr VkCoarseSampleOrderCustomNV) {.cdecl, importc.}
const
  vkNvRayracing* = 1

type
  VkAccelerationStructureNV* = VkNonDispatchableHandle

const
  vkNvRayTracingSpecVersion* = 3
  vkNvRayTracingExtensionName* = "VK_NV_rayracing"
  vkShaderUnusedKhr* = (not 0'u32)
  vkShaderUnusedNv* = vkShaderUnusedKhr

type
  VkRayTracingShaderGroupTypeKHR* = distinct cint
  VkRayTracingShaderGroupTypeNV* = VkRayTracingShaderGroupTypeKHR
  VkGeometryTypeKHR* = distinct cint
  VkGeometryTypeNV* = VkGeometryTypeKHR
  VkAccelerationStructureTypeKHR* = distinct cint
  VkAccelerationStructureTypeNV* = VkAccelerationStructureTypeKHR
  VkCopyAccelerationStructureModeKHR* = distinct cint
  VkCopyAccelerationStructureModeNV* = VkCopyAccelerationStructureModeKHR
  VkAccelerationStructureMemoryRequirementsTypeNV* = distinct cint
  VkGeometryFlagBitsKHR* = distinct cint
  VkGeometryFlagsKHR* = VkFlags
  VkGeometryFlagsNV* = VkGeometryFlagsKHR
  VkGeometryFlagBitsNV* = VkGeometryFlagBitsKHR
  VkGeometryInstanceFlagBitsKHR* = distinct cint
  VkGeometryInstanceFlagsKHR* = VkFlags
  VkGeometryInstanceFlagsNV* = VkGeometryInstanceFlagsKHR
  VkGeometryInstanceFlagBitsNV* = VkGeometryInstanceFlagBitsKHR
  VkBuildAccelerationStructureFlagBitsKHR* = distinct cint
  VkBuildAccelerationStructureFlagsKHR* = VkFlags
  VkBuildAccelerationStructureFlagsNV* = VkBuildAccelerationStructureFlagsKHR
  VkBuildAccelerationStructureFlagBitsNV* = VkBuildAccelerationStructureFlagBitsKHR
  VkRayTracingShaderGroupCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkRayTracingShaderGroupTypeKHR
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
    geometryType*: VkGeometryTypeKHR
    geometry*: VkGeometryDataNV
    flags*: VkGeometryFlagsKHR

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

  VkTransformMatrixKHR* {.bycopy.} = object
    matrix*: array[3, array[4, cfloat]]

  VkTransformMatrixNV* = VkTransformMatrixKHR
  VkAabbPositionsKHR* {.bycopy.} = object
    minX*: cfloat
    minY*: cfloat
    minZ*: cfloat
    maxX*: cfloat
    maxY*: cfloat
    maxZ*: cfloat

  VkAabbPositionsNV* = VkAabbPositionsKHR
  VkAccelerationStructureInstanceKHR* {.bycopy.} = object
    transform*: VkTransformMatrixKHR
    instanceCustomIndex* {.bitsize: 24.}: uint32
    mask* {.bitsize: 8.}: uint32
    instanceShaderBindingTableRecordOffset* {.bitsize: 24.}: uint32
    flags* {.bitsize: 8.}: VkGeometryInstanceFlagsKHR
    accelerationStructureReference*: uint64

  VkAccelerationStructureInstanceNV* = VkAccelerationStructureInstanceKHR
  PFNVkcreateaccelerationstructurenv* = proc (device: VkDevice; pCreateInfo: ptr VkAccelerationStructureCreateInfoNV; pAllocator: ptr VkAllocationCallbacks = nil; pAccelerationStructure: ptr VkAccelerationStructureNV): VkResult {.cdecl.}
  PFNVkdestroyaccelerationstructurenv* = proc (device: VkDevice; accelerationStructure: VkAccelerationStructureNV; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkgetaccelerationstructurememoryrequirementsnv* = proc (device: VkDevice; pInfo: ptr VkAccelerationStructureMemoryRequirementsInfoNV; pMemoryRequirements: ptr VkMemoryRequirements2KHR) {.cdecl.}
  PFNVkbindaccelerationstructurememorynv* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindAccelerationStructureMemoryInfoNV): VkResult {.cdecl.}
  PFNVkcmdbuildaccelerationstructurenv* = proc (commandBuffer: VkCommandBuffer; pInfo: ptr VkAccelerationStructureInfoNV; instanceData: VkBuffer; instanceOffset: VkDeviceSize; update: VkBool32; dst: VkAccelerationStructureNV; src: VkAccelerationStructureNV; scratch: VkBuffer; scratchOffset: VkDeviceSize) {.cdecl.}
  PFNVkcmdcopyaccelerationstructurenv* = proc (commandBuffer: VkCommandBuffer; dst: VkAccelerationStructureNV; src: VkAccelerationStructureNV; mode: VkCopyAccelerationStructureModeKHR) {.cdecl.}
  PFNVkcmdtraceraysnv* = proc (commandBuffer: VkCommandBuffer; raygenShaderBindingTableBuffer: VkBuffer; raygenShaderBindingOffset: VkDeviceSize; missShaderBindingTableBuffer: VkBuffer; missShaderBindingOffset: VkDeviceSize; missShaderBindingStride: VkDeviceSize; hitShaderBindingTableBuffer: VkBuffer; hitShaderBindingOffset: VkDeviceSize; hitShaderBindingStride: VkDeviceSize; callableShaderBindingTableBuffer: VkBuffer; callableShaderBindingOffset: VkDeviceSize; callableShaderBindingStride: VkDeviceSize; width: uint32; height: uint32; depth: uint32) {.cdecl.}
  PFNVkcreateraytracingpipelinesnv* = proc (device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkRayTracingPipelineCreateInfoNV; pAllocator: ptr VkAllocationCallbacks = nil; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFNVkgetraytracingshadergrouphandleskhr* = proc (device: VkDevice; pipeline: VkPipeline; firstGroup: uint32; groupCount: uint32; dataSize: csize_t; pData: pointer): VkResult {.cdecl.}
  PFNVkgetraytracingshadergrouphandlesnv* = proc (device: VkDevice; pipeline: VkPipeline; firstGroup: uint32; groupCount: uint32; dataSize: csize_t; pData: pointer): VkResult {.cdecl.}
  PFNVkgetaccelerationstructurehandlenv* = proc (device: VkDevice; accelerationStructure: VkAccelerationStructureNV; dataSize: csize_t; pData: pointer): VkResult {.cdecl.}
  PFNVkcmdwriteaccelerationstructurespropertiesnv* = proc (commandBuffer: VkCommandBuffer; accelerationStructureCount: uint32; pAccelerationStructures: ptr VkAccelerationStructureNV; queryType: VkQueryType; queryPool: VkQueryPool; firstQuery: uint32) {.cdecl.}
  PFNVkcompiledeferrednv* = proc (device: VkDevice; pipeline: VkPipeline; shader: uint32): VkResult {.cdecl.}

const
  vkRayTracingShaderGroupTypeGeneralKhr* {.used.} = 0.VkRayTracingShaderGroupTypeKHR
  vkRayTracingShaderGroupTypeTrianglesHitGroupKhr* {.used.} = 1.VkRayTracingShaderGroupTypeKHR
  vkRayTracingShaderGroupTypeProceduralHitGroupKhr* {.used.} = 2.VkRayTracingShaderGroupTypeKHR
  vkRayTracingShaderGroupTypeGeneralNv* {.used.}: VkRayTracingShaderGroupTypeKHR = vkRayTracingShaderGroupTypeGeneralKhr
  vkRayTracingShaderGroupTypeTrianglesHitGroupNv* {.used.}: VkRayTracingShaderGroupTypeKHR = vkRayTracingShaderGroupTypeTrianglesHitGroupKhr
  vkRayTracingShaderGroupTypeProceduralHitGroupNv* {.used.}: VkRayTracingShaderGroupTypeKHR = vkRayTracingShaderGroupTypeProceduralHitGroupKhr
  vkRayTracingShaderGroupTypeMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkRayTracingShaderGroupTypeKHR

const
  vkGeometryTypeTrianglesKhr* {.used.} = 0.VkGeometryTypeKHR
  vkGeometryTypeAabbsKhr* {.used.} = 1.VkGeometryTypeKHR
  vkGeometryTypeInstancesKhr* {.used.} = 2.VkGeometryTypeKHR
  vkGeometryTypeTrianglesNv* {.used.}: VkGeometryTypeKHR = vkGeometryTypeTrianglesKhr
  vkGeometryTypeAabbsNv* {.used.}: VkGeometryTypeKHR = vkGeometryTypeAabbsKhr
  vkGeometryTypeMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkGeometryTypeKHR

const
  vkAccelerationStructureTypeTopLevelKhr* {.used.} = 0.VkAccelerationStructureTypeKHR
  vkAccelerationStructureTypeBottomLevelKhr* {.used.} = 1.VkAccelerationStructureTypeKHR
  vkAccelerationStructureTypeGenericKhr* {.used.} = 2.VkAccelerationStructureTypeKHR
  vkAccelerationStructureTypeTopLevelNv* {.used.}: VkAccelerationStructureTypeKHR = vkAccelerationStructureTypeTopLevelKhr
  vkAccelerationStructureTypeBottomLevelNv* {.used.}: VkAccelerationStructureTypeKHR = vkAccelerationStructureTypeBottomLevelKhr
  vkAccelerationStructureTypeMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkAccelerationStructureTypeKHR

const
  vkCopyAccelerationStructureModeCloneKhr* {.used.} = 0.VkCopyAccelerationStructureModeKHR
  vkCopyAccelerationStructureModeCompactKhr* {.used.} = 1.VkCopyAccelerationStructureModeKHR
  vkCopyAccelerationStructureModeSerializeKhr* {.used.} = 2.VkCopyAccelerationStructureModeKHR
  vkCopyAccelerationStructureModeDeserializeKhr* {.used.} = 3.VkCopyAccelerationStructureModeKHR
  vkCopyAccelerationStructureModeCloneNv* {.used.}: VkCopyAccelerationStructureModeKHR = vkCopyAccelerationStructureModeCloneKhr
  vkCopyAccelerationStructureModeCompactNv* {.used.}: VkCopyAccelerationStructureModeKHR = vkCopyAccelerationStructureModeCompactKhr
  vkCopyAccelerationStructureModeMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkCopyAccelerationStructureModeKHR

const
  vkAccelerationStructureMemoryRequirementsTypeObjectNv* {.used.} = 0.VkAccelerationStructureMemoryRequirementsTypeNV
  vkAccelerationStructureMemoryRequirementsTypeBuildScratchNv* {.used.} = 1.VkAccelerationStructureMemoryRequirementsTypeNV
  vkAccelerationStructureMemoryRequirementsTypeUpdateScratchNv* {.used.} = 2.VkAccelerationStructureMemoryRequirementsTypeNV
  vkAccelerationStructureMemoryRequirementsTypeMaxEnumNv* {.used.} = 0x7FFFFFFF.VkAccelerationStructureMemoryRequirementsTypeNV

const
  vkGeometryOpaqueBitKhr* {.used.} = 0x00000001.VkGeometryFlagBitsKHR
  vkGeometryNoDuplicateAnyHitInvocationBitKhr* {.used.} = 0x00000002.VkGeometryFlagBitsKHR
  vkGeometryOpaqueBitNv* {.used.}: VkGeometryFlagBitsKHR = vkGeometryOpaqueBitKhr
  vkGeometryNoDuplicateAnyHitInvocationBitNv* {.used.}: VkGeometryFlagBitsKHR = vkGeometryNoDuplicateAnyHitInvocationBitKhr
  vkGeometryFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkGeometryFlagBitsKHR

const
  vkGeometryInstanceTriangleFacingCullDisableBitKhr* {.used.} = 0x00000001.VkGeometryInstanceFlagBitsKHR
  vkGeometryInstanceTriangleFrontCounterclockwiseBitKhr* {.used.} = 0x00000002.VkGeometryInstanceFlagBitsKHR
  vkGeometryInstanceForceOpaqueBitKhr* {.used.} = 0x00000004.VkGeometryInstanceFlagBitsKHR
  vkGeometryInstanceForceNoOpaqueBitKhr* {.used.} = 0x00000008.VkGeometryInstanceFlagBitsKHR
  vkGeometryInstanceTriangleCullDisableBitNv* {.used.}: VkGeometryInstanceFlagBitsKHR = vkGeometryInstanceTriangleFacingCullDisableBitKhr
  vkGeometryInstanceTriangleFrontCounterclockwiseBitNv* {.used.}: VkGeometryInstanceFlagBitsKHR = vkGeometryInstanceTriangleFrontCounterclockwiseBitKhr
  vkGeometryInstanceForceOpaqueBitNv* {.used.}: VkGeometryInstanceFlagBitsKHR = vkGeometryInstanceForceOpaqueBitKhr
  vkGeometryInstanceForceNoOpaqueBitNv* {.used.}: VkGeometryInstanceFlagBitsKHR = vkGeometryInstanceForceNoOpaqueBitKhr
  vkGeometryInstanceFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkGeometryInstanceFlagBitsKHR

const
  vkBuildAccelerationStructureAllowUpdateBitKhr* {.used.} = 0x00000001.VkBuildAccelerationStructureFlagBitsKHR
  vkBuildAccelerationStructureAllowCompactionBitKhr* {.used.} = 0x00000002.VkBuildAccelerationStructureFlagBitsKHR
  vkBuildAccelerationStructurePreferFastTraceBitKhr* {.used.} = 0x00000004.VkBuildAccelerationStructureFlagBitsKHR
  vkBuildAccelerationStructurePreferFastBuildBitKhr* {.used.} = 0x00000008.VkBuildAccelerationStructureFlagBitsKHR
  vkBuildAccelerationStructureLowMemoryBitKhr* {.used.} = 0x00000010.VkBuildAccelerationStructureFlagBitsKHR
  vkBuildAccelerationStructureAllowUpdateBitNv* {.used.}: VkBuildAccelerationStructureFlagBitsKHR = vkBuildAccelerationStructureAllowUpdateBitKhr
  vkBuildAccelerationStructureAllowCompactionBitNv* {.used.}: VkBuildAccelerationStructureFlagBitsKHR = vkBuildAccelerationStructureAllowCompactionBitKhr
  vkBuildAccelerationStructurePreferFastTraceBitNv* {.used.}: VkBuildAccelerationStructureFlagBitsKHR = vkBuildAccelerationStructurePreferFastTraceBitKhr
  vkBuildAccelerationStructurePreferFastBuildBitNv* {.used.}: VkBuildAccelerationStructureFlagBitsKHR = vkBuildAccelerationStructurePreferFastBuildBitKhr
  vkBuildAccelerationStructureLowMemoryBitNv* {.used.}: VkBuildAccelerationStructureFlagBitsKHR = vkBuildAccelerationStructureLowMemoryBitKhr
  vkBuildAccelerationStructureFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkBuildAccelerationStructureFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkCreateAccelerationStructureNV*(device: VkDevice; pCreateInfo: ptr VkAccelerationStructureCreateInfoNV; pAllocator: ptr VkAllocationCallbacks = nil; pAccelerationStructure: ptr VkAccelerationStructureNV): VkResult {.cdecl, importc.}
  proc vkDestroyAccelerationStructureNV*(device: VkDevice; accelerationStructure: VkAccelerationStructureNV; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkGetAccelerationStructureMemoryRequirementsNV*(device: VkDevice; pInfo: ptr VkAccelerationStructureMemoryRequirementsInfoNV; pMemoryRequirements: ptr VkMemoryRequirements2KHR) {.cdecl, importc.}
  proc vkBindAccelerationStructureMemoryNV*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindAccelerationStructureMemoryInfoNV): VkResult {.cdecl, importc.}
  proc vkCmdBuildAccelerationStructureNV*(commandBuffer: VkCommandBuffer; pInfo: ptr VkAccelerationStructureInfoNV; instanceData: VkBuffer; instanceOffset: VkDeviceSize; update: VkBool32; dst: VkAccelerationStructureNV; src: VkAccelerationStructureNV; scratch: VkBuffer; scratchOffset: VkDeviceSize) {.cdecl, importc.}
  proc vkCmdCopyAccelerationStructureNV*(commandBuffer: VkCommandBuffer; dst: VkAccelerationStructureNV; src: VkAccelerationStructureNV; mode: VkCopyAccelerationStructureModeKHR) {.cdecl, importc.}
  proc vkCmdTraceRaysNV*(commandBuffer: VkCommandBuffer; raygenShaderBindingTableBuffer: VkBuffer; raygenShaderBindingOffset: VkDeviceSize; missShaderBindingTableBuffer: VkBuffer; missShaderBindingOffset: VkDeviceSize; missShaderBindingStride: VkDeviceSize; hitShaderBindingTableBuffer: VkBuffer; hitShaderBindingOffset: VkDeviceSize; hitShaderBindingStride: VkDeviceSize; callableShaderBindingTableBuffer: VkBuffer; callableShaderBindingOffset: VkDeviceSize; callableShaderBindingStride: VkDeviceSize; width: uint32; height: uint32; depth: uint32) {.cdecl, importc.}
  proc vkCreateRayTracingPipelinesNV*(device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkRayTracingPipelineCreateInfoNV; pAllocator: ptr VkAllocationCallbacks = nil; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkGetRayTracingShaderGroupHandlesKHR*(device: VkDevice; pipeline: VkPipeline; firstGroup: uint32; groupCount: uint32; dataSize: csize_t; pData: pointer): VkResult {.cdecl, importc.}
  proc vkGetRayTracingShaderGroupHandlesNV*(device: VkDevice; pipeline: VkPipeline; firstGroup: uint32; groupCount: uint32; dataSize: csize_t; pData: pointer): VkResult {.cdecl, importc.}
  proc vkGetAccelerationStructureHandleNV*(device: VkDevice; accelerationStructure: VkAccelerationStructureNV; dataSize: csize_t; pData: pointer): VkResult {.cdecl, importc.}
  proc vkCmdWriteAccelerationStructuresPropertiesNV*(commandBuffer: VkCommandBuffer; accelerationStructureCount: uint32; pAccelerationStructures: ptr VkAccelerationStructureNV; queryType: VkQueryType; queryPool: VkQueryPool; firstQuery: uint32) {.cdecl, importc.}
  proc vkCompileDeferredNV*(device: VkDevice; pipeline: VkPipeline; shader: uint32): VkResult {.cdecl, importc.}
const
  vkNvRepresentativeFragmentest* = 1
  vkNvRepresentativeFragmentTestSpecVersion* = 2
  vkNvRepresentativeFragmentTestExtensionName* = "VK_NV_representative_fragmentest"

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
  vkExtFilterCubic* = 1
  vkExtFilterCubicSpecVersion* = 3
  vkExtFilterCubicExtensionName* = "VK_EXT_filter_cubic"

type
  VkPhysicalDeviceImageViewImageFormatInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    imageViewType*: VkImageViewType

  VkFilterCubicImageViewImageFormatPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    filterCubic*: VkBool32
    filterCubicMinmax*: VkBool32


const
  vkQcomRenderPassShaderResolve* = 1
  vkQcomRenderPassShaderResolveSpecVersion* = 4
  vkQcomRenderPassShaderResolveExtensionName* = "VK_QCOM_render_pass_shader_resolve"
  vkExtGlobalPriority* = 1
  vkExtGlobalPrioritySpecVersion* = 2
  vkExtGlobalPriorityExtensionName* = "VK_EXT_global_priority"

type
  VkQueueGlobalPriorityEXT* = distinct cint
  VkDeviceQueueGlobalPriorityCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    globalPriority*: VkQueueGlobalPriorityEXT


const
  vkQueueGlobalPriorityLowExt* {.used.} = 128.VkQueueGlobalPriorityEXT
  vkQueueGlobalPriorityMediumExt* {.used.} = 256.VkQueueGlobalPriorityEXT
  vkQueueGlobalPriorityHighExt* {.used.} = 512.VkQueueGlobalPriorityEXT
  vkQueueGlobalPriorityRealtimeExt* {.used.} = 1024.VkQueueGlobalPriorityEXT
  vkQueueGlobalPriorityMaxEnumExt* {.used.} = 0x7FFFFFFF.VkQueueGlobalPriorityEXT

const
  vkExtExternalMemoryHost* = 1
  vkExtExternalMemoryHostSpecVersion* = 1
  vkExtExternalMemoryHostExtensionName* = "VK_EXT_external_memory_host"

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
  vkAmdBufferMarkerExtensionName* = "VK_AMD_buffer_marker"

type
  PFNVkcmdwritebuffermarkeramd* = proc (commandBuffer: VkCommandBuffer; pipelineStage: VkPipelineStageFlagBits; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; marker: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdWriteBufferMarkerAMD*(commandBuffer: VkCommandBuffer; pipelineStage: VkPipelineStageFlagBits; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; marker: uint32) {.cdecl, importc.}
const
  vkAmdPipelineCompilerControl* = 1
  vkAmdPipelineCompilerControlSpecVersion* = 1
  vkAmdPipelineCompilerControlExtensionName* = "VK_AMD_pipeline_compiler_control"

type
  VkPipelineCompilerControlFlagBitsAMD* = distinct cint
  VkPipelineCompilerControlFlagsAMD* = VkFlags
  VkPipelineCompilerControlCreateInfoAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    compilerControlFlags*: VkPipelineCompilerControlFlagsAMD


const
  vkPipelineCompilerControlFlagBitsMaxEnumAmd* {.used.} = 0x7FFFFFFF.VkPipelineCompilerControlFlagBitsAMD

const
  vkExtCalibratedimestamps* = 1
  vkExtCalibratedTimestampsSpecVersion* = 1
  vkExtCalibratedTimestampsExtensionName* = "VK_EXT_calibratedimestamps"

type
  VkTimeDomainEXT* = distinct cint
  VkCalibratedTimestampInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    timeDomain*: VkTimeDomainEXT

  PFNVkgetphysicaldevicecalibrateabletimedomainsext* = proc (physicalDevice: VkPhysicalDevice; pTimeDomainCount: ptr uint32; pTimeDomains: ptr VkTimeDomainEXT): VkResult {.cdecl.}
  PFNVkgetcalibratedtimestampsext* = proc (device: VkDevice; timestampCount: uint32; pTimestampInfos: ptr VkCalibratedTimestampInfoEXT; pTimestamps: ptr uint64; pMaxDeviation: ptr uint64): VkResult {.cdecl.}

const
  vkTimeDomainDeviceExt* {.used.} = 0.VkTimeDomainEXT
  vkTimeDomainClockMonotonicExt* {.used.} = 1.VkTimeDomainEXT
  vkTimeDomainClockMonotonicRawExt* {.used.} = 2.VkTimeDomainEXT
  vkTimeDomainQueryPerformanceCounterExt* {.used.} = 3.VkTimeDomainEXT
  vkTimeDomainMaxEnumExt* {.used.} = 0x7FFFFFFF.VkTimeDomainEXT

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceCalibrateableTimeDomainsEXT*(physicalDevice: VkPhysicalDevice; pTimeDomainCount: ptr uint32; pTimeDomains: ptr VkTimeDomainEXT): VkResult {.cdecl, importc.}
  proc vkGetCalibratedTimestampsEXT*(device: VkDevice; timestampCount: uint32; pTimestampInfos: ptr VkCalibratedTimestampInfoEXT; pTimestamps: ptr uint64; pMaxDeviation: ptr uint64): VkResult {.cdecl, importc.}
const
  vkAmdShaderCoreProperties* = 1
  vkAmdShaderCorePropertiesSpecVersion* = 2
  vkAmdShaderCorePropertiesExtensionName* = "VK_AMD_shader_core_properties"

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
  vkAmdMemoryOverallocationBehaviorExtensionName* = "VK_AMD_memory_overallocation_behavior"

type
  VkMemoryOverallocationBehaviorAMD* = distinct cint
  VkDeviceMemoryOverallocationCreateInfoAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    overallocationBehavior*: VkMemoryOverallocationBehaviorAMD


const
  vkMemoryOverallocationBehaviorDefaultAmd* {.used.} = 0.VkMemoryOverallocationBehaviorAMD
  vkMemoryOverallocationBehaviorAllowedAmd* {.used.} = 1.VkMemoryOverallocationBehaviorAMD
  vkMemoryOverallocationBehaviorDisallowedAmd* {.used.} = 2.VkMemoryOverallocationBehaviorAMD
  vkMemoryOverallocationBehaviorMaxEnumAmd* {.used.} = 0x7FFFFFFF.VkMemoryOverallocationBehaviorAMD

const
  vkExtVertexAttributeDivisor* = 1
  vkExtVertexAttributeDivisorSpecVersion* = 3
  vkExtVertexAttributeDivisorExtensionName* = "VK_EXT_vertex_attribute_divisor"

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
  vkExtPipelineCreationFeedback* = 1
  vkExtPipelineCreationFeedbackSpecVersion* = 1
  vkExtPipelineCreationFeedbackExtensionName* = "VK_EXT_pipeline_creation_feedback"

type
  VkPipelineCreationFeedbackFlagBitsEXT* = distinct cint
  VkPipelineCreationFeedbackFlagsEXT* = VkFlags
  VkPipelineCreationFeedbackEXT* {.bycopy.} = object
    flags*: VkPipelineCreationFeedbackFlagsEXT
    duration*: uint64

  VkPipelineCreationFeedbackCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pPipelineCreationFeedback*: ptr VkPipelineCreationFeedbackEXT
    pipelineStageCreationFeedbackCount*: uint32
    pPipelineStageCreationFeedbacks*: ptr VkPipelineCreationFeedbackEXT


const
  vkPipelineCreationFeedbackValidBitExt* {.used.} = 0x00000001.VkPipelineCreationFeedbackFlagBitsEXT
  vkPipelineCreationFeedbackApplicationPipelineCacheHitBitExt* {.used.} = 0x00000002.VkPipelineCreationFeedbackFlagBitsEXT
  vkPipelineCreationFeedbackBasePipelineAccelerationBitExt* {.used.} = 0x00000004.VkPipelineCreationFeedbackFlagBitsEXT
  vkPipelineCreationFeedbackFlagBitsMaxEnumExt* {.used.} = 0x7FFFFFFF.VkPipelineCreationFeedbackFlagBitsEXT

const
  vkNvShaderSubgroupPartitioned* = 1
  vkNvShaderSubgroupPartitionedSpecVersion* = 1
  vkNvShaderSubgroupPartitionedExtensionName* = "VK_NV_shader_subgroup_partitioned"
  vkNvComputeShaderDerivatives* = 1
  vkNvComputeShaderDerivativesSpecVersion* = 1
  vkNvComputeShaderDerivativesExtensionName* = "VK_NV_compute_shader_derivatives"

type
  VkPhysicalDeviceComputeShaderDerivativesFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    computeDerivativeGroupQuads*: VkBool32
    computeDerivativeGroupLinear*: VkBool32


const
  vkNvMeshShader* = 1
  vkNvMeshShaderSpecVersion* = 1
  vkNvMeshShaderExtensionName* = "VK_NV_mesh_shader"

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
  vkNvFragmentShaderBarycentricExtensionName* = "VK_NV_fragment_shader_barycentric"

type
  VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentShaderBarycentric*: VkBool32


const
  vkNvShaderImageFootprint* = 1
  vkNvShaderImageFootprintSpecVersion* = 2
  vkNvShaderImageFootprintExtensionName* = "VK_NV_shader_image_footprint"

type
  VkPhysicalDeviceShaderImageFootprintFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    imageFootprint*: VkBool32


const
  vkNvScissorExclusive* = 1
  vkNvScissorExclusiveSpecVersion* = 1
  vkNvScissorExclusiveExtensionName* = "VK_NV_scissor_exclusive"

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
  vkNvDeviceDiagnosticCheckpointsExtensionName* = "VK_NV_device_diagnostic_checkpoints"

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
  vkIntelShaderIntegerFunctions2* = 1
  vkIntelShaderIntegerFunctions2SpecVersion* = 1
  vkIntelShaderIntegerFunctions2ExtensionName* = "VK_INTEL_shader_integer_functions2"

type
  VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderIntegerFunctions2*: VkBool32


const
  vkIntelPerformanceQuery* = 1

type
  VkPerformanceConfigurationINTEL* = VkNonDispatchableHandle

const
  vkIntelPerformanceQuerySpecVersion* = 2
  vkIntelPerformanceQueryExtensionName* = "VK_INTEL_performance_query"

type
  VkPerformanceConfigurationTypeINTEL* = distinct cint
  VkQueryPoolSamplingModeINTEL* = distinct cint
  VkPerformanceOverrideTypeINTEL* = distinct cint
  VkPerformanceParameterTypeINTEL* = distinct cint
  VkPerformanceValueTypeINTEL* = distinct cint
  VkPerformanceValueDataINTEL* {.bycopy, union.} = object
    value32*: uint32
    value64*: uint64
    valueFloat*: cfloat
    valueBool*: VkBool32
    valueString*: cstring

  VkPerformanceValueINTEL* {.bycopy.} = object
    `type`*: VkPerformanceValueTypeINTEL
    data*: VkPerformanceValueDataINTEL

  VkInitializePerformanceApiInfoINTEL* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pUserData*: pointer

  VkQueryPoolPerformanceQueryCreateInfoINTEL* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    performanceCountersSampling*: VkQueryPoolSamplingModeINTEL

  VkQueryPoolCreateInfoINTEL* = VkQueryPoolPerformanceQueryCreateInfoINTEL
  VkPerformanceMarkerInfoINTEL* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    marker*: uint64

  VkPerformanceStreamMarkerInfoINTEL* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    marker*: uint32

  VkPerformanceOverrideInfoINTEL* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkPerformanceOverrideTypeINTEL
    enable*: VkBool32
    parameter*: uint64

  VkPerformanceConfigurationAcquireInfoINTEL* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkPerformanceConfigurationTypeINTEL

  PFNVkinitializeperformanceapiintel* = proc (device: VkDevice; pInitializeInfo: ptr VkInitializePerformanceApiInfoINTEL): VkResult {.cdecl.}
  PFNVkuninitializeperformanceapiintel* = proc (device: VkDevice) {.cdecl.}
  PFNVkcmdsetperformancemarkerintel* = proc (commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkPerformanceMarkerInfoINTEL): VkResult {.cdecl.}
  PFNVkcmdsetperformancestreammarkerintel* = proc (commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkPerformanceStreamMarkerInfoINTEL): VkResult {.cdecl.}
  PFNVkcmdsetperformanceoverrideintel* = proc (commandBuffer: VkCommandBuffer; pOverrideInfo: ptr VkPerformanceOverrideInfoINTEL): VkResult {.cdecl.}
  PFNVkacquireperformanceconfigurationintel* = proc (device: VkDevice; pAcquireInfo: ptr VkPerformanceConfigurationAcquireInfoINTEL; pConfiguration: ptr VkPerformanceConfigurationINTEL): VkResult {.cdecl.}
  PFNVkreleaseperformanceconfigurationintel* = proc (device: VkDevice; configuration: VkPerformanceConfigurationINTEL): VkResult {.cdecl.}
  PFNVkqueuesetperformanceconfigurationintel* = proc (queue: VkQueue; configuration: VkPerformanceConfigurationINTEL): VkResult {.cdecl.}
  PFNVkgetperformanceparameterintel* = proc (device: VkDevice; parameter: VkPerformanceParameterTypeINTEL; pValue: ptr VkPerformanceValueINTEL): VkResult {.cdecl.}

const
  vkPerformanceConfigurationTypeCommandQueueMetricsDiscoveryActivatedIntel* {.used.} = 0.VkPerformanceConfigurationTypeINTEL
  vkPerformanceConfigurationTypeMaxEnumIntel* {.used.} = 0x7FFFFFFF.VkPerformanceConfigurationTypeINTEL

const
  vkQueryPoolSamplingModeManualIntel* {.used.} = 0.VkQueryPoolSamplingModeINTEL
  vkQueryPoolSamplingModeMaxEnumIntel* {.used.} = 0x7FFFFFFF.VkQueryPoolSamplingModeINTEL

const
  vkPerformanceOverrideTypeNullHardwareIntel* {.used.} = 0.VkPerformanceOverrideTypeINTEL
  vkPerformanceOverrideTypeFlushGpuCachesIntel* {.used.} = 1.VkPerformanceOverrideTypeINTEL
  vkPerformanceOverrideTypeMaxEnumIntel* {.used.} = 0x7FFFFFFF.VkPerformanceOverrideTypeINTEL

const
  vkPerformanceParameterTypeHwCountersSupportedIntel* {.used.} = 0.VkPerformanceParameterTypeINTEL
  vkPerformanceParameterTypeStreamMarkerValidBitsIntel* {.used.} = 1.VkPerformanceParameterTypeINTEL
  vkPerformanceParameterTypeMaxEnumIntel* {.used.} = 0x7FFFFFFF.VkPerformanceParameterTypeINTEL

const
  vkPerformanceValueTypeUint32Intel* {.used.} = 0.VkPerformanceValueTypeINTEL
  vkPerformanceValueTypeUint64Intel* {.used.} = 1.VkPerformanceValueTypeINTEL
  vkPerformanceValueTypeFloatIntel* {.used.} = 2.VkPerformanceValueTypeINTEL
  vkPerformanceValueTypeBoolIntel* {.used.} = 3.VkPerformanceValueTypeINTEL
  vkPerformanceValueTypeStringIntel* {.used.} = 4.VkPerformanceValueTypeINTEL
  vkPerformanceValueTypeMaxEnumIntel* {.used.} = 0x7FFFFFFF.VkPerformanceValueTypeINTEL

when not defined(vkNoPrototypes):
  proc vkInitializePerformanceApiINTEL*(device: VkDevice; pInitializeInfo: ptr VkInitializePerformanceApiInfoINTEL): VkResult {.cdecl, importc.}
  proc vkUninitializePerformanceApiINTEL*(device: VkDevice) {.cdecl, importc.}
  proc vkCmdSetPerformanceMarkerINTEL*(commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkPerformanceMarkerInfoINTEL): VkResult {.cdecl, importc.}
  proc vkCmdSetPerformanceStreamMarkerINTEL*(commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkPerformanceStreamMarkerInfoINTEL): VkResult {.cdecl, importc.}
  proc vkCmdSetPerformanceOverrideINTEL*(commandBuffer: VkCommandBuffer; pOverrideInfo: ptr VkPerformanceOverrideInfoINTEL): VkResult {.cdecl, importc.}
  proc vkAcquirePerformanceConfigurationINTEL*(device: VkDevice; pAcquireInfo: ptr VkPerformanceConfigurationAcquireInfoINTEL; pConfiguration: ptr VkPerformanceConfigurationINTEL): VkResult {.cdecl, importc.}
  proc vkReleasePerformanceConfigurationINTEL*(device: VkDevice; configuration: VkPerformanceConfigurationINTEL): VkResult {.cdecl, importc.}
  proc vkQueueSetPerformanceConfigurationINTEL*(queue: VkQueue; configuration: VkPerformanceConfigurationINTEL): VkResult {.cdecl, importc.}
  proc vkGetPerformanceParameterINTEL*(device: VkDevice; parameter: VkPerformanceParameterTypeINTEL; pValue: ptr VkPerformanceValueINTEL): VkResult {.cdecl, importc.}
const
  vkExtPciBusInfo* = 1
  vkExtPciBusInfoSpecVersion* = 2
  vkExtPciBusInfoExtensionName* = "VK_EXT_pci_bus_info"

type
  VkPhysicalDevicePCIBusInfoPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pciDomain*: uint32
    pciBus*: uint32
    pciDevice*: uint32
    pciFunction*: uint32


const
  vkAmdDisplayNativeHdr* = 1
  vkAmdDisplayNativeHdrSpecVersion* = 1
  vkAmdDisplayNativeHdrExtensionName* = "VK_AMD_display_native_hdr"

type
  VkDisplayNativeHdrSurfaceCapabilitiesAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    localDimmingSupport*: VkBool32

  VkSwapchainDisplayNativeHdrCreateInfoAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    localDimmingEnable*: VkBool32

  PFNVksetlocaldimmingamd* = proc (device: VkDevice; swapChain: VkSwapchainKHR; localDimmingEnable: VkBool32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkSetLocalDimmingAMD*(device: VkDevice; swapChain: VkSwapchainKHR; localDimmingEnable: VkBool32) {.cdecl, importc.}
const
  vkExtFragmentDensityMap* = 1
  vkExtFragmentDensityMapSpecVersion* = 1
  vkExtFragmentDensityMapExtensionName* = "VK_EXT_fragment_density_map"

type
  VkPhysicalDeviceFragmentDensityMapFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentDensityMap*: VkBool32
    fragmentDensityMapDynamic*: VkBool32
    fragmentDensityMapNonSubsampledImages*: VkBool32

  VkPhysicalDeviceFragmentDensityMapPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    minFragmentDensityTexelSize*: VkExtent2D
    maxFragmentDensityTexelSize*: VkExtent2D
    fragmentDensityInvocations*: VkBool32

  VkRenderPassFragmentDensityMapCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentDensityMapAttachment*: VkAttachmentReference


const
  vkExtScalarBlockLayout* = 1
  vkExtScalarBlockLayoutSpecVersion* = 1
  vkExtScalarBlockLayoutExtensionName* = "VK_EXT_scalar_block_layout"

type
  VkPhysicalDeviceScalarBlockLayoutFeaturesEXT* = VkPhysicalDeviceScalarBlockLayoutFeatures

const
  vkGoogleHlslFunctionality1* = 1
  vkGoogleHlslFunctionality1SpecVersion* = 1
  vkGoogleHlslFunctionality1ExtensionName* = "VK_GOOGLE_hlsl_functionality1"
  vkGoogleDecorateString* = 1
  vkGoogleDecorateStringSpecVersion* = 1
  vkGoogleDecorateStringExtensionName* = "VK_GOOGLE_decorate_string"
  vkExtSubgroupSizeControl* = 1
  vkExtSubgroupSizeControlSpecVersion* = 2
  vkExtSubgroupSizeControlExtensionName* = "VK_EXT_subgroup_size_control"

type
  VkPhysicalDeviceSubgroupSizeControlFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    subgroupSizeControl*: VkBool32
    computeFullSubgroups*: VkBool32

  VkPhysicalDeviceSubgroupSizeControlPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    minSubgroupSize*: uint32
    maxSubgroupSize*: uint32
    maxComputeWorkgroupSubgroups*: uint32
    requiredSubgroupSizeStages*: VkShaderStageFlags

  VkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    requiredSubgroupSize*: uint32


const
  vkAmdShaderCoreProperties2* = 1
  vkAmdShaderCoreProperties2SpecVersion* = 1
  vkAmdShaderCoreProperties2ExtensionName* = "VK_AMD_shader_core_properties2"

type
  VkShaderCorePropertiesFlagBitsAMD* = distinct cint
  VkShaderCorePropertiesFlagsAMD* = VkFlags
  VkPhysicalDeviceShaderCoreProperties2AMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderCoreFeatures*: VkShaderCorePropertiesFlagsAMD
    activeComputeUnitCount*: uint32


const
  vkShaderCorePropertiesFlagBitsMaxEnumAmd* {.used.} = 0x7FFFFFFF.VkShaderCorePropertiesFlagBitsAMD

const
  vkAmdDeviceCoherentMemory* = 1
  vkAmdDeviceCoherentMemorySpecVersion* = 1
  vkAmdDeviceCoherentMemoryExtensionName* = "VK_AMD_device_coherent_memory"

type
  VkPhysicalDeviceCoherentMemoryFeaturesAMD* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceCoherentMemory*: VkBool32


const
  vkExtShaderImageAtomicInt64* = 1
  vkExtShaderImageAtomicInt64SpecVersion* = 1
  vkExtShaderImageAtomicInt64ExtensionName* = "VK_EXT_shader_image_atomic_int64"

type
  VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderImageInt64Atomics*: VkBool32
    sparseImageInt64Atomics*: VkBool32


const
  vkExtMemoryBudget* = 1
  vkExtMemoryBudgetSpecVersion* = 1
  vkExtMemoryBudgetExtensionName* = "VK_EXT_memory_budget"

type
  VkPhysicalDeviceMemoryBudgetPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    heapBudget*: array[vkMaxMemoryHeaps, VkDeviceSize]
    heapUsage*: array[vkMaxMemoryHeaps, VkDeviceSize]


const
  vkExtMemoryPriority* = 1
  vkExtMemoryPrioritySpecVersion* = 1
  vkExtMemoryPriorityExtensionName* = "VK_EXT_memory_priority"

type
  VkPhysicalDeviceMemoryPriorityFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    memoryPriority*: VkBool32

  VkMemoryPriorityAllocateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    priority*: cfloat


const
  vkNvDedicatedAllocationImageAliasing* = 1
  vkNvDedicatedAllocationImageAliasingSpecVersion* = 1
  vkNvDedicatedAllocationImageAliasingExtensionName* = "VK_NV_dedicated_allocation_image_aliasing"

type
  VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    dedicatedAllocationImageAliasing*: VkBool32


const
  vkExtBufferDeviceAddress* = 1
  vkExtBufferDeviceAddressSpecVersion* = 2
  vkExtBufferDeviceAddressExtensionName* = "VK_EXT_buffer_device_address"

type
  VkPhysicalDeviceBufferDeviceAddressFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    bufferDeviceAddress*: VkBool32
    bufferDeviceAddressCaptureReplay*: VkBool32
    bufferDeviceAddressMultiDevice*: VkBool32

  VkPhysicalDeviceBufferAddressFeaturesEXT* = VkPhysicalDeviceBufferDeviceAddressFeaturesEXT
  VkBufferDeviceAddressInfoEXT* = VkBufferDeviceAddressInfo
  VkBufferDeviceAddressCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceAddress*: VkDeviceAddress

  PFNVkgetbufferdeviceaddressext* = proc (device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): VkDeviceAddress {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkGetBufferDeviceAddressEXT*(device: VkDevice; pInfo: ptr VkBufferDeviceAddressInfo): VkDeviceAddress {.cdecl, importc.}
const
  vkExtoolingInfo* = 1
  vkExtToolingInfoSpecVersion* = 1
  vkExtToolingInfoExtensionName* = "VK_EXTooling_info"

type
  VkToolPurposeFlagBitsEXT* = distinct cint
  VkToolPurposeFlagsEXT* = VkFlags
  VkPhysicalDeviceToolPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    name*: array[vkMaxExtensionNameSize, char]
    version*: array[vkMaxExtensionNameSize, char]
    purposes*: VkToolPurposeFlagsEXT
    description*: array[vkMaxDescriptionSize, char]
    layer*: array[vkMaxExtensionNameSize, char]

  PFNVkgetphysicaldevicetoolpropertiesext* = proc (physicalDevice: VkPhysicalDevice; pToolCount: ptr uint32; pToolProperties: ptr VkPhysicalDeviceToolPropertiesEXT): VkResult {.cdecl.}

const
  vkToolPurposeValidationBitExt* {.used.} = 0x00000001.VkToolPurposeFlagBitsEXT
  vkToolPurposeProfilingBitExt* {.used.} = 0x00000002.VkToolPurposeFlagBitsEXT
  vkToolPurposeTracingBitExt* {.used.} = 0x00000004.VkToolPurposeFlagBitsEXT
  vkToolPurposeAdditionalFeaturesBitExt* {.used.} = 0x00000008.VkToolPurposeFlagBitsEXT
  vkToolPurposeModifyingFeaturesBitExt* {.used.} = 0x00000010.VkToolPurposeFlagBitsEXT
  vkToolPurposeDebugReportingBitExt* {.used.} = 0x00000020.VkToolPurposeFlagBitsEXT
  vkToolPurposeDebugMarkersBitExt* {.used.} = 0x00000040.VkToolPurposeFlagBitsEXT
  vkToolPurposeFlagBitsMaxEnumExt* {.used.} = 0x7FFFFFFF.VkToolPurposeFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceToolPropertiesEXT*(physicalDevice: VkPhysicalDevice; pToolCount: ptr uint32; pToolProperties: ptr VkPhysicalDeviceToolPropertiesEXT): VkResult {.cdecl, importc.}
const
  vkExtSeparateStencilUsage* = 1
  vkExtSeparateStencilUsageSpecVersion* = 1
  vkExtSeparateStencilUsageExtensionName* = "VK_EXT_separate_stencil_usage"

type
  VkImageStencilUsageCreateInfoEXT* = VkImageStencilUsageCreateInfo

const
  vkExtValidationFeatures* = 1
  vkExtValidationFeaturesSpecVersion* = 4
  vkExtValidationFeaturesExtensionName* = "VK_EXT_validation_features"

type
  VkValidationFeatureEnableEXT* = distinct cint
  VkValidationFeatureDisableEXT* = distinct cint
  VkValidationFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    enabledValidationFeatureCount*: uint32
    pEnabledValidationFeatures*: ptr VkValidationFeatureEnableEXT
    disabledValidationFeatureCount*: uint32
    pDisabledValidationFeatures*: ptr VkValidationFeatureDisableEXT


const
  vkValidationFeatureEnableGpuAssistedExt* {.used.} = 0.VkValidationFeatureEnableEXT
  vkValidationFeatureEnableGpuAssistedReserveBindingSlotExt* {.used.} = 1.VkValidationFeatureEnableEXT
  vkValidationFeatureEnableBestPracticesExt* {.used.} = 2.VkValidationFeatureEnableEXT
  vkValidationFeatureEnableDebugPrintfExt* {.used.} = 3.VkValidationFeatureEnableEXT
  vkValidationFeatureEnableSynchronizationValidationExt* {.used.} = 4.VkValidationFeatureEnableEXT
  vkValidationFeatureEnableMaxEnumExt* {.used.} = 0x7FFFFFFF.VkValidationFeatureEnableEXT

const
  vkValidationFeatureDisableAllExt* {.used.} = 0.VkValidationFeatureDisableEXT
  vkValidationFeatureDisableShadersExt* {.used.} = 1.VkValidationFeatureDisableEXT
  vkValidationFeatureDisableThreadSafetyExt* {.used.} = 2.VkValidationFeatureDisableEXT
  vkValidationFeatureDisableApiParametersExt* {.used.} = 3.VkValidationFeatureDisableEXT
  vkValidationFeatureDisableObjectLifetimesExt* {.used.} = 4.VkValidationFeatureDisableEXT
  vkValidationFeatureDisableCoreChecksExt* {.used.} = 5.VkValidationFeatureDisableEXT
  vkValidationFeatureDisableUniqueHandlesExt* {.used.} = 6.VkValidationFeatureDisableEXT
  vkValidationFeatureDisableMaxEnumExt* {.used.} = 0x7FFFFFFF.VkValidationFeatureDisableEXT

const
  vkNvCooperativeMatrix* = 1
  vkNvCooperativeMatrixSpecVersion* = 1
  vkNvCooperativeMatrixExtensionName* = "VK_NV_cooperative_matrix"

type
  VkComponentTypeNV* = distinct cint
  VkScopeNV* = distinct cint
  VkCooperativeMatrixPropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    MSize*: uint32
    NSize*: uint32
    KSize*: uint32
    AType*: VkComponentTypeNV
    BType*: VkComponentTypeNV
    CType*: VkComponentTypeNV
    DType*: VkComponentTypeNV
    scope*: VkScopeNV

  VkPhysicalDeviceCooperativeMatrixFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    cooperativeMatrix*: VkBool32
    cooperativeMatrixRobustBufferAccess*: VkBool32

  VkPhysicalDeviceCooperativeMatrixPropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    cooperativeMatrixSupportedStages*: VkShaderStageFlags

  PFNVkgetphysicaldevicecooperativematrixpropertiesnv* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkCooperativeMatrixPropertiesNV): VkResult {.cdecl.}

const
  vkComponentTypeFloat16Nv* {.used.} = 0.VkComponentTypeNV
  vkComponentTypeFloat32Nv* {.used.} = 1.VkComponentTypeNV
  vkComponentTypeFloat64Nv* {.used.} = 2.VkComponentTypeNV
  vkComponentTypeSint8Nv* {.used.} = 3.VkComponentTypeNV
  vkComponentTypeSint16Nv* {.used.} = 4.VkComponentTypeNV
  vkComponentTypeSint32Nv* {.used.} = 5.VkComponentTypeNV
  vkComponentTypeSint64Nv* {.used.} = 6.VkComponentTypeNV
  vkComponentTypeUint8Nv* {.used.} = 7.VkComponentTypeNV
  vkComponentTypeUint16Nv* {.used.} = 8.VkComponentTypeNV
  vkComponentTypeUint32Nv* {.used.} = 9.VkComponentTypeNV
  vkComponentTypeUint64Nv* {.used.} = 10.VkComponentTypeNV
  vkComponentTypeMaxEnumNv* {.used.} = 0x7FFFFFFF.VkComponentTypeNV

const
  vkScopeDeviceNv* {.used.} = 1.VkScopeNV
  vkScopeWorkgroupNv* {.used.} = 2.VkScopeNV
  vkScopeSubgroupNv* {.used.} = 3.VkScopeNV
  vkScopeQueueFamilyNv* {.used.} = 5.VkScopeNV
  vkScopeMaxEnumNv* {.used.} = 0x7FFFFFFF.VkScopeNV

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceCooperativeMatrixPropertiesNV*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkCooperativeMatrixPropertiesNV): VkResult {.cdecl, importc.}
const
  vkNvCoverageReductionMode* = 1
  vkNvCoverageReductionModeSpecVersion* = 1
  vkNvCoverageReductionModeExtensionName* = "VK_NV_coverage_reduction_mode"

type
  VkCoverageReductionModeNV* = distinct cint
  VkPipelineCoverageReductionStateCreateFlagsNV* = VkFlags
  VkPhysicalDeviceCoverageReductionModeFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    coverageReductionMode*: VkBool32

  VkPipelineCoverageReductionStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCoverageReductionStateCreateFlagsNV
    coverageReductionMode*: VkCoverageReductionModeNV

  VkFramebufferMixedSamplesCombinationNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    coverageReductionMode*: VkCoverageReductionModeNV
    rasterizationSamples*: VkSampleCountFlagBits
    depthStencilSamples*: VkSampleCountFlags
    colorSamples*: VkSampleCountFlags

  PFNVkgetphysicaldevicesupportedframebuffermixedsamplescombinationsnv* = proc (physicalDevice: VkPhysicalDevice; pCombinationCount: ptr uint32; pCombinations: ptr VkFramebufferMixedSamplesCombinationNV): VkResult {.cdecl.}

const
  vkCoverageReductionModeMergeNv* {.used.} = 0.VkCoverageReductionModeNV
  vkCoverageReductionModeTruncateNv* {.used.} = 1.VkCoverageReductionModeNV
  vkCoverageReductionModeMaxEnumNv* {.used.} = 0x7FFFFFFF.VkCoverageReductionModeNV

when not defined(vkNoPrototypes):
  proc vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV*(physicalDevice: VkPhysicalDevice; pCombinationCount: ptr uint32; pCombinations: ptr VkFramebufferMixedSamplesCombinationNV): VkResult {.cdecl, importc.}
const
  vkExtFragmentShaderInterlock* = 1
  vkExtFragmentShaderInterlockSpecVersion* = 1
  vkExtFragmentShaderInterlockExtensionName* = "VK_EXT_fragment_shader_interlock"

type
  VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentShaderSampleInterlock*: VkBool32
    fragmentShaderPixelInterlock*: VkBool32
    fragmentShaderShadingRateInterlock*: VkBool32


const
  vkExtYcbcrImageArrays* = 1
  vkExtYcbcrImageArraysSpecVersion* = 1
  vkExtYcbcrImageArraysExtensionName* = "VK_EXT_ycbcr_image_arrays"

type
  VkPhysicalDeviceYcbcrImageArraysFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    ycbcrImageArrays*: VkBool32


const
  vkExtHeadlessSurface* = 1
  vkExtHeadlessSurfaceSpecVersion* = 1
  vkExtHeadlessSurfaceExtensionName* = "VK_EXT_headless_surface"

type
  VkHeadlessSurfaceCreateFlagsEXT* = VkFlags
  VkHeadlessSurfaceCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkHeadlessSurfaceCreateFlagsEXT

  PFNVkcreateheadlesssurfaceext* = proc (instance: VkInstance; pCreateInfo: ptr VkHeadlessSurfaceCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCreateHeadlessSurfaceEXT*(instance: VkInstance; pCreateInfo: ptr VkHeadlessSurfaceCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}
const
  vkExtLineRasterization* = 1
  vkExtLineRasterizationSpecVersion* = 1
  vkExtLineRasterizationExtensionName* = "VK_EXT_line_rasterization"

type
  VkLineRasterizationModeEXT* = distinct cint
  VkPhysicalDeviceLineRasterizationFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    rectangularLines*: VkBool32
    bresenhamLines*: VkBool32
    smoothLines*: VkBool32
    stippledRectangularLines*: VkBool32
    stippledBresenhamLines*: VkBool32
    stippledSmoothLines*: VkBool32

  VkPhysicalDeviceLineRasterizationPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    lineSubPixelPrecisionBits*: uint32

  VkPipelineRasterizationLineStateCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    lineRasterizationMode*: VkLineRasterizationModeEXT
    stippledLineEnable*: VkBool32
    lineStippleFactor*: uint32
    lineStipplePattern*: uint16

  PFNVkcmdsetlinestippleext* = proc (commandBuffer: VkCommandBuffer; lineStippleFactor: uint32; lineStipplePattern: uint16) {.cdecl.}

const
  vkLineRasterizationModeDefaultExt* {.used.} = 0.VkLineRasterizationModeEXT
  vkLineRasterizationModeRectangularExt* {.used.} = 1.VkLineRasterizationModeEXT
  vkLineRasterizationModeBresenhamExt* {.used.} = 2.VkLineRasterizationModeEXT
  vkLineRasterizationModeRectangularSmoothExt* {.used.} = 3.VkLineRasterizationModeEXT
  vkLineRasterizationModeMaxEnumExt* {.used.} = 0x7FFFFFFF.VkLineRasterizationModeEXT

when not defined(vkNoPrototypes):
  proc vkCmdSetLineStippleEXT*(commandBuffer: VkCommandBuffer; lineStippleFactor: uint32; lineStipplePattern: uint16) {.cdecl, importc.}
const
  vkExtShaderAtomicFloat* = 1
  vkExtShaderAtomicFloatSpecVersion* = 1
  vkExtShaderAtomicFloatExtensionName* = "VK_EXT_shader_atomic_float"

type
  VkPhysicalDeviceShaderAtomicFloatFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderBufferFloat32Atomics*: VkBool32
    shaderBufferFloat32AtomicAdd*: VkBool32
    shaderBufferFloat64Atomics*: VkBool32
    shaderBufferFloat64AtomicAdd*: VkBool32
    shaderSharedFloat32Atomics*: VkBool32
    shaderSharedFloat32AtomicAdd*: VkBool32
    shaderSharedFloat64Atomics*: VkBool32
    shaderSharedFloat64AtomicAdd*: VkBool32
    shaderImageFloat32Atomics*: VkBool32
    shaderImageFloat32AtomicAdd*: VkBool32
    sparseImageFloat32Atomics*: VkBool32
    sparseImageFloat32AtomicAdd*: VkBool32


const
  vkExtHostQueryReset* = 1
  vkExtHostQueryResetSpecVersion* = 1
  vkExtHostQueryResetExtensionName* = "VK_EXT_host_query_reset"

type
  VkPhysicalDeviceHostQueryResetFeaturesEXT* = VkPhysicalDeviceHostQueryResetFeatures
  PFNVkresetquerypoolext* = proc (device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkResetQueryPoolEXT*(device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32) {.cdecl, importc.}
const
  vkExtIndexypeUint8* = 1
  vkExtIndexTypeUint8SpecVersion* = 1
  vkExtIndexTypeUint8ExtensionName* = "VK_EXT_indexype_uint8"

type
  VkPhysicalDeviceIndexTypeUint8FeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    indexTypeUint8*: VkBool32


const
  vkExtExtendedDynamicState* = 1
  vkExtExtendedDynamicStateSpecVersion* = 1
  vkExtExtendedDynamicStateExtensionName* = "VK_EXT_extended_dynamic_state"

type
  VkPhysicalDeviceExtendedDynamicStateFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    extendedDynamicState*: VkBool32

  PFNVkcmdsetcullmodeext* = proc (commandBuffer: VkCommandBuffer; cullMode: VkCullModeFlags) {.cdecl.}
  PFNVkcmdsetfrontfaceext* = proc (commandBuffer: VkCommandBuffer; frontFace: VkFrontFace) {.cdecl.}
  PFNVkcmdsetprimitivetopologyext* = proc (commandBuffer: VkCommandBuffer; primitiveTopology: VkPrimitiveTopology) {.cdecl.}
  PFNVkcmdsetviewportwithcountext* = proc (commandBuffer: VkCommandBuffer; viewportCount: uint32; pViewports: ptr VkViewport) {.cdecl.}
  PFNVkcmdsetscissorwithcountext* = proc (commandBuffer: VkCommandBuffer; scissorCount: uint32; pScissors: ptr VkRect2D) {.cdecl.}
  PFNVkcmdbindvertexbuffers2ext* = proc (commandBuffer: VkCommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer; pOffsets: ptr VkDeviceSize; pSizes: ptr VkDeviceSize; pStrides: ptr VkDeviceSize) {.cdecl.}
  PFNVkcmdsetdepthtestenableext* = proc (commandBuffer: VkCommandBuffer; depthTestEnable: VkBool32) {.cdecl.}
  PFNVkcmdsetdepthwriteenableext* = proc (commandBuffer: VkCommandBuffer; depthWriteEnable: VkBool32) {.cdecl.}
  PFNVkcmdsetdepthcompareopext* = proc (commandBuffer: VkCommandBuffer; depthCompareOp: VkCompareOp) {.cdecl.}
  PFNVkcmdsetdepthboundstestenableext* = proc (commandBuffer: VkCommandBuffer; depthBoundsTestEnable: VkBool32) {.cdecl.}
  PFNVkcmdsetstenciltestenableext* = proc (commandBuffer: VkCommandBuffer; stencilTestEnable: VkBool32) {.cdecl.}
  PFNVkcmdsetstencilopext* = proc (commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; failOp: VkStencilOp; passOp: VkStencilOp; depthFailOp: VkStencilOp; compareOp: VkCompareOp) {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkCmdSetCullModeEXT*(commandBuffer: VkCommandBuffer; cullMode: VkCullModeFlags) {.cdecl, importc.}
  proc vkCmdSetFrontFaceEXT*(commandBuffer: VkCommandBuffer; frontFace: VkFrontFace) {.cdecl, importc.}
  proc vkCmdSetPrimitiveTopologyEXT*(commandBuffer: VkCommandBuffer; primitiveTopology: VkPrimitiveTopology) {.cdecl, importc.}
  proc vkCmdSetViewportWithCountEXT*(commandBuffer: VkCommandBuffer; viewportCount: uint32; pViewports: ptr VkViewport) {.cdecl, importc.}
  proc vkCmdSetScissorWithCountEXT*(commandBuffer: VkCommandBuffer; scissorCount: uint32; pScissors: ptr VkRect2D) {.cdecl, importc.}
  proc vkCmdBindVertexBuffers2EXT*(commandBuffer: VkCommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer; pOffsets: ptr VkDeviceSize; pSizes: ptr VkDeviceSize; pStrides: ptr VkDeviceSize) {.cdecl, importc.}
  proc vkCmdSetDepthTestEnableEXT*(commandBuffer: VkCommandBuffer; depthTestEnable: VkBool32) {.cdecl, importc.}
  proc vkCmdSetDepthWriteEnableEXT*(commandBuffer: VkCommandBuffer; depthWriteEnable: VkBool32) {.cdecl, importc.}
  proc vkCmdSetDepthCompareOpEXT*(commandBuffer: VkCommandBuffer; depthCompareOp: VkCompareOp) {.cdecl, importc.}
  proc vkCmdSetDepthBoundsTestEnableEXT*(commandBuffer: VkCommandBuffer; depthBoundsTestEnable: VkBool32) {.cdecl, importc.}
  proc vkCmdSetStencilTestEnableEXT*(commandBuffer: VkCommandBuffer; stencilTestEnable: VkBool32) {.cdecl, importc.}
  proc vkCmdSetStencilOpEXT*(commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; failOp: VkStencilOp; passOp: VkStencilOp; depthFailOp: VkStencilOp; compareOp: VkCompareOp) {.cdecl, importc.}
const
  vkExtShaderDemoteToHelperInvocation* = 1
  vkExtShaderDemoteToHelperInvocationSpecVersion* = 1
  vkExtShaderDemoteToHelperInvocationExtensionName* = "VK_EXT_shader_demote_to_helper_invocation"

type
  VkPhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderDemoteToHelperInvocation*: VkBool32


const
  vkNvDeviceGeneratedCommands* = 1

type
  VkIndirectCommandsLayoutNV* = VkNonDispatchableHandle

const
  vkNvDeviceGeneratedCommandsSpecVersion* = 3
  vkNvDeviceGeneratedCommandsExtensionName* = "VK_NV_device_generated_commands"

type
  VkIndirectCommandsTokenTypeNV* = distinct cint
  VkIndirectStateFlagBitsNV* = distinct cint
  VkIndirectStateFlagsNV* = VkFlags
  VkIndirectCommandsLayoutUsageFlagBitsNV* = distinct cint
  VkIndirectCommandsLayoutUsageFlagsNV* = VkFlags
  VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxGraphicsShaderGroupCount*: uint32
    maxIndirectSequenceCount*: uint32
    maxIndirectCommandsTokenCount*: uint32
    maxIndirectCommandsStreamCount*: uint32
    maxIndirectCommandsTokenOffset*: uint32
    maxIndirectCommandsStreamStride*: uint32
    minSequencesCountBufferOffsetAlignment*: uint32
    minSequencesIndexBufferOffsetAlignment*: uint32
    minIndirectCommandsBufferOffsetAlignment*: uint32

  VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceGeneratedCommands*: VkBool32

  VkGraphicsShaderGroupCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    stageCount*: uint32
    pStages*: ptr VkPipelineShaderStageCreateInfo
    pVertexInputState*: ptr VkPipelineVertexInputStateCreateInfo
    pTessellationState*: ptr VkPipelineTessellationStateCreateInfo

  VkGraphicsPipelineShaderGroupsCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    groupCount*: uint32
    pGroups*: ptr VkGraphicsShaderGroupCreateInfoNV
    pipelineCount*: uint32
    pPipelines*: ptr VkPipeline

  VkBindShaderGroupIndirectCommandNV* {.bycopy.} = object
    groupIndex*: uint32

  VkBindIndexBufferIndirectCommandNV* {.bycopy.} = object
    bufferAddress*: VkDeviceAddress
    size*: uint32
    indexType*: VkIndexType

  VkBindVertexBufferIndirectCommandNV* {.bycopy.} = object
    bufferAddress*: VkDeviceAddress
    size*: uint32
    stride*: uint32

  VkSetStateFlagsIndirectCommandNV* {.bycopy.} = object
    data*: uint32

  VkIndirectCommandsStreamNV* {.bycopy.} = object
    buffer*: VkBuffer
    offset*: VkDeviceSize

  VkIndirectCommandsLayoutTokenNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    tokenType*: VkIndirectCommandsTokenTypeNV
    stream*: uint32
    offset*: uint32
    vertexBindingUnit*: uint32
    vertexDynamicStride*: VkBool32
    pushconstantPipelineLayout*: VkPipelineLayout
    pushconstantShaderStageFlags*: VkShaderStageFlags
    pushconstantOffset*: uint32
    pushconstantSize*: uint32
    indirectStateFlags*: VkIndirectStateFlagsNV
    indexTypeCount*: uint32
    pIndexTypes*: ptr VkIndexType
    pIndexTypeValues*: ptr uint32

  VkIndirectCommandsLayoutCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkIndirectCommandsLayoutUsageFlagsNV
    pipelineBindPoint*: VkPipelineBindPoint
    tokenCount*: uint32
    pTokens*: ptr VkIndirectCommandsLayoutTokenNV
    streamCount*: uint32
    pStreamStrides*: ptr uint32

  VkGeneratedCommandsInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineBindPoint*: VkPipelineBindPoint
    pipeline*: VkPipeline
    indirectCommandsLayout*: VkIndirectCommandsLayoutNV
    streamCount*: uint32
    pStreams*: ptr VkIndirectCommandsStreamNV
    sequencesCount*: uint32
    preprocessBuffer*: VkBuffer
    preprocessOffset*: VkDeviceSize
    preprocessSize*: VkDeviceSize
    sequencesCountBuffer*: VkBuffer
    sequencesCountOffset*: VkDeviceSize
    sequencesIndexBuffer*: VkBuffer
    sequencesIndexOffset*: VkDeviceSize

  VkGeneratedCommandsMemoryRequirementsInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineBindPoint*: VkPipelineBindPoint
    pipeline*: VkPipeline
    indirectCommandsLayout*: VkIndirectCommandsLayoutNV
    maxSequencesCount*: uint32

  PFNVkgetgeneratedcommandsmemoryrequirementsnv* = proc (device: VkDevice; pInfo: ptr VkGeneratedCommandsMemoryRequirementsInfoNV; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl.}
  PFNVkcmdpreprocessgeneratedcommandsnv* = proc (commandBuffer: VkCommandBuffer; pGeneratedCommandsInfo: ptr VkGeneratedCommandsInfoNV) {.cdecl.}
  PFNVkcmdexecutegeneratedcommandsnv* = proc (commandBuffer: VkCommandBuffer; isPreprocessed: VkBool32; pGeneratedCommandsInfo: ptr VkGeneratedCommandsInfoNV) {.cdecl.}
  PFNVkcmdbindpipelineshadergroupnv* = proc (commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; pipeline: VkPipeline; groupIndex: uint32) {.cdecl.}
  PFNVkcreateindirectcommandslayoutnv* = proc (device: VkDevice; pCreateInfo: ptr VkIndirectCommandsLayoutCreateInfoNV; pAllocator: ptr VkAllocationCallbacks = nil; pIndirectCommandsLayout: ptr VkIndirectCommandsLayoutNV): VkResult {.cdecl.}
  PFNVkdestroyindirectcommandslayoutnv* = proc (device: VkDevice; indirectCommandsLayout: VkIndirectCommandsLayoutNV; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}

const
  vkIndirectCommandsTokenTypeShaderGroupNv* {.used.} = 0.VkIndirectCommandsTokenTypeNV
  vkIndirectCommandsTokenTypeStateFlagsNv* {.used.} = 1.VkIndirectCommandsTokenTypeNV
  vkIndirectCommandsTokenTypeIndexBufferNv* {.used.} = 2.VkIndirectCommandsTokenTypeNV
  vkIndirectCommandsTokenTypeVertexBufferNv* {.used.} = 3.VkIndirectCommandsTokenTypeNV
  vkIndirectCommandsTokenTypePushConstantNv* {.used.} = 4.VkIndirectCommandsTokenTypeNV
  vkIndirectCommandsTokenTypeDrawIndexedNv* {.used.} = 5.VkIndirectCommandsTokenTypeNV
  vkIndirectCommandsTokenTypeDrawNv* {.used.} = 6.VkIndirectCommandsTokenTypeNV
  vkIndirectCommandsTokenTypeDrawTasksNv* {.used.} = 7.VkIndirectCommandsTokenTypeNV
  vkIndirectCommandsTokenTypeMaxEnumNv* {.used.} = 0x7FFFFFFF.VkIndirectCommandsTokenTypeNV

const
  vkIndirectStateFlagFrontfaceBitNv* {.used.} = 0x00000001.VkIndirectStateFlagBitsNV
  vkIndirectStateFlagBitsMaxEnumNv* {.used.} = 0x7FFFFFFF.VkIndirectStateFlagBitsNV

const
  vkIndirectCommandsLayoutUsageExplicitPreprocessBitNv* {.used.} = 0x00000001.VkIndirectCommandsLayoutUsageFlagBitsNV
  vkIndirectCommandsLayoutUsageIndexedSequencesBitNv* {.used.} = 0x00000002.VkIndirectCommandsLayoutUsageFlagBitsNV
  vkIndirectCommandsLayoutUsageUnorderedSequencesBitNv* {.used.} = 0x00000004.VkIndirectCommandsLayoutUsageFlagBitsNV
  vkIndirectCommandsLayoutUsageFlagBitsMaxEnumNv* {.used.} = 0x7FFFFFFF.VkIndirectCommandsLayoutUsageFlagBitsNV

when not defined(vkNoPrototypes):
  proc vkGetGeneratedCommandsMemoryRequirementsNV*(device: VkDevice; pInfo: ptr VkGeneratedCommandsMemoryRequirementsInfoNV; pMemoryRequirements: ptr VkMemoryRequirements2) {.cdecl, importc.}
  proc vkCmdPreprocessGeneratedCommandsNV*(commandBuffer: VkCommandBuffer; pGeneratedCommandsInfo: ptr VkGeneratedCommandsInfoNV) {.cdecl, importc.}
  proc vkCmdExecuteGeneratedCommandsNV*(commandBuffer: VkCommandBuffer; isPreprocessed: VkBool32; pGeneratedCommandsInfo: ptr VkGeneratedCommandsInfoNV) {.cdecl, importc.}
  proc vkCmdBindPipelineShaderGroupNV*(commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; pipeline: VkPipeline; groupIndex: uint32) {.cdecl, importc.}
  proc vkCreateIndirectCommandsLayoutNV*(device: VkDevice; pCreateInfo: ptr VkIndirectCommandsLayoutCreateInfoNV; pAllocator: ptr VkAllocationCallbacks = nil; pIndirectCommandsLayout: ptr VkIndirectCommandsLayoutNV): VkResult {.cdecl, importc.}
  proc vkDestroyIndirectCommandsLayoutNV*(device: VkDevice; indirectCommandsLayout: VkIndirectCommandsLayoutNV; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
const
  vkExtexelBufferAlignment* = 1
  vkExtTexelBufferAlignmentSpecVersion* = 1
  vkExtTexelBufferAlignmentExtensionName* = "VK_EXTexel_buffer_alignment"

type
  VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    texelBufferAlignment*: VkBool32

  VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    storageTexelBufferOffsetAlignmentBytes*: VkDeviceSize
    storageTexelBufferOffsetSingleTexelAlignment*: VkBool32
    uniformTexelBufferOffsetAlignmentBytes*: VkDeviceSize
    uniformTexelBufferOffsetSingleTexelAlignment*: VkBool32


const
  vkQcomRenderPassTransform* = 1
  vkQcomRenderPassTransformSpecVersion* = 1
  vkQcomRenderPassTransformExtensionName* = "VK_QCOM_render_pass_transform"

type
  VkRenderPassTransformBeginInfoQCOM* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    transform*: VkSurfaceTransformFlagBitsKHR

  VkCommandBufferInheritanceRenderPassTransformInfoQCOM* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    transform*: VkSurfaceTransformFlagBitsKHR
    renderArea*: VkRect2D


const
  vkExtDeviceMemoryReport* = 1
  vkExtDeviceMemoryReportSpecVersion* = 2
  vkExtDeviceMemoryReportExtensionName* = "VK_EXT_device_memory_report"

type
  VkDeviceMemoryReportEventTypeEXT* = distinct cint
  VkDeviceMemoryReportFlagsEXT* = VkFlags
  VkPhysicalDeviceDeviceMemoryReportFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    deviceMemoryReport*: VkBool32

  VkDeviceMemoryReportCallbackDataEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceMemoryReportFlagsEXT
    `type`*: VkDeviceMemoryReportEventTypeEXT
    memoryObjectId*: uint64
    size*: VkDeviceSize
    objectType*: VkObjectType
    objectHandle*: uint64
    heapIndex*: uint32

  PFNVkdevicememoryreportcallbackext* = proc (pCallbackData: ptr VkDeviceMemoryReportCallbackDataEXT; pUserData: pointer) {.cdecl.}
  VkDeviceDeviceMemoryReportCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceMemoryReportFlagsEXT
    pfnUserCallback*: PFNVkdevicememoryreportcallbackext
    pUserData*: pointer


const
  vkDeviceMemoryReportEventTypeAllocateExt* {.used.} = 0.VkDeviceMemoryReportEventTypeEXT
  vkDeviceMemoryReportEventTypeFreeExt* {.used.} = 1.VkDeviceMemoryReportEventTypeEXT
  vkDeviceMemoryReportEventTypeImportExt* {.used.} = 2.VkDeviceMemoryReportEventTypeEXT
  vkDeviceMemoryReportEventTypeUnimportExt* {.used.} = 3.VkDeviceMemoryReportEventTypeEXT
  vkDeviceMemoryReportEventTypeAllocationFailedExt* {.used.} = 4.VkDeviceMemoryReportEventTypeEXT
  vkDeviceMemoryReportEventTypeMaxEnumExt* {.used.} = 0x7FFFFFFF.VkDeviceMemoryReportEventTypeEXT

const
  vkExtRobustness2* = 1
  vkExtRobustness2SpecVersion* = 1
  vkExtRobustness2ExtensionName* = "VK_EXT_robustness2"

type
  VkPhysicalDeviceRobustness2FeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    robustBufferAccess2*: VkBool32
    robustImageAccess2*: VkBool32
    nullDescriptor*: VkBool32

  VkPhysicalDeviceRobustness2PropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    robustStorageBufferAccessSizeAlignment*: VkDeviceSize
    robustUniformBufferAccessSizeAlignment*: VkDeviceSize


const
  vkExtCustomBorderColor* = 1
  vkExtCustomBorderColorSpecVersion* = 12
  vkExtCustomBorderColorExtensionName* = "VK_EXT_custom_border_color"

type
  VkSamplerCustomBorderColorCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    customBorderColor*: VkClearColorValue
    format*: VkFormat

  VkPhysicalDeviceCustomBorderColorPropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxCustomBorderColorSamplers*: uint32

  VkPhysicalDeviceCustomBorderColorFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    customBorderColors*: VkBool32
    customBorderColorWithoutFormat*: VkBool32


const
  vkGoogleUserype* = 1
  vkGoogleUserTypeSpecVersion* = 1
  vkGoogleUserTypeExtensionName* = "VK_GOOGLE_userype"
  vkExtPrivateData* = 1

type
  VkPrivateDataSlotEXT* = VkNonDispatchableHandle

const
  vkExtPrivateDataSpecVersion* = 1
  vkExtPrivateDataExtensionName* = "VK_EXT_private_data"

type
  VkPrivateDataSlotCreateFlagBitsEXT* = distinct cint
  VkPrivateDataSlotCreateFlagsEXT* = VkFlags
  VkPhysicalDevicePrivateDataFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    privateData*: VkBool32

  VkDevicePrivateDataCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    privateDataSlotRequestCount*: uint32

  VkPrivateDataSlotCreateInfoEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPrivateDataSlotCreateFlagsEXT

  PFNVkcreateprivatedataslotext* = proc (device: VkDevice; pCreateInfo: ptr VkPrivateDataSlotCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pPrivateDataSlot: ptr VkPrivateDataSlotEXT): VkResult {.cdecl.}
  PFNVkdestroyprivatedataslotext* = proc (device: VkDevice; privateDataSlot: VkPrivateDataSlotEXT; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVksetprivatedataext* = proc (device: VkDevice; objectType: VkObjectType; objectHandle: uint64; privateDataSlot: VkPrivateDataSlotEXT; data: uint64): VkResult {.cdecl.}
  PFNVkgetprivatedataext* = proc (device: VkDevice; objectType: VkObjectType; objectHandle: uint64; privateDataSlot: VkPrivateDataSlotEXT; pData: ptr uint64) {.cdecl.}

const
  vkPrivateDataSlotCreateFlagBitsMaxEnumExt* {.used.} = 0x7FFFFFFF.VkPrivateDataSlotCreateFlagBitsEXT

when not defined(vkNoPrototypes):
  proc vkCreatePrivateDataSlotEXT*(device: VkDevice; pCreateInfo: ptr VkPrivateDataSlotCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks = nil; pPrivateDataSlot: ptr VkPrivateDataSlotEXT): VkResult {.cdecl, importc.}
  proc vkDestroyPrivateDataSlotEXT*(device: VkDevice; privateDataSlot: VkPrivateDataSlotEXT; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkSetPrivateDataEXT*(device: VkDevice; objectType: VkObjectType; objectHandle: uint64; privateDataSlot: VkPrivateDataSlotEXT; data: uint64): VkResult {.cdecl, importc.}
  proc vkGetPrivateDataEXT*(device: VkDevice; objectType: VkObjectType; objectHandle: uint64; privateDataSlot: VkPrivateDataSlotEXT; pData: ptr uint64) {.cdecl, importc.}
const
  vkExtPipelineCreationCacheControl* = 1
  vkExtPipelineCreationCacheControlSpecVersion* = 3
  vkExtPipelineCreationCacheControlExtensionName* = "VK_EXT_pipeline_creation_cache_control"

type
  VkPhysicalDevicePipelineCreationCacheControlFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineCreationCacheControl*: VkBool32


const
  vkNvDeviceDiagnosticsConfig* = 1
  vkNvDeviceDiagnosticsConfigSpecVersion* = 1
  vkNvDeviceDiagnosticsConfigExtensionName* = "VK_NV_device_diagnostics_config"

type
  VkDeviceDiagnosticsConfigFlagBitsNV* = distinct cint
  VkDeviceDiagnosticsConfigFlagsNV* = VkFlags
  VkPhysicalDeviceDiagnosticsConfigFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    diagnosticsConfig*: VkBool32

  VkDeviceDiagnosticsConfigCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceDiagnosticsConfigFlagsNV


const
  vkDeviceDiagnosticsConfigEnableShaderDebugInfoBitNv* {.used.} = 0x00000001.VkDeviceDiagnosticsConfigFlagBitsNV
  vkDeviceDiagnosticsConfigEnableResourceTrackingBitNv* {.used.} = 0x00000002.VkDeviceDiagnosticsConfigFlagBitsNV
  vkDeviceDiagnosticsConfigEnableAutomaticCheckpointsBitNv* {.used.} = 0x00000004.VkDeviceDiagnosticsConfigFlagBitsNV
  vkDeviceDiagnosticsConfigFlagBitsMaxEnumNv* {.used.} = 0x7FFFFFFF.VkDeviceDiagnosticsConfigFlagBitsNV

const
  vkQcomRenderPassStoreOps* = 1
  vkQcomRenderPassStoreOpsSpecVersion* = 2
  vkQcomRenderPassStoreOpsExtensionName* = "VK_QCOM_render_pass_store_ops"
  vkNvFragmentShadingRateEnums* = 1
  vkNvFragmentShadingRateEnumsSpecVersion* = 1
  vkNvFragmentShadingRateEnumsExtensionName* = "VK_NV_fragment_shading_rate_enums"

type
  VkFragmentShadingRateTypeNV* = distinct cint
  VkFragmentShadingRateNV* = distinct cint
  VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentShadingRateEnums*: VkBool32
    supersampleFragmentShadingRates*: VkBool32
    noInvocationFragmentShadingRates*: VkBool32

  VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxFragmentShadingRateInvocationCount*: VkSampleCountFlagBits

  VkPipelineFragmentShadingRateEnumStateCreateInfoNV* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shadingRateType*: VkFragmentShadingRateTypeNV
    shadingRate*: VkFragmentShadingRateNV
    combinerOps*: array[2, VkFragmentShadingRateCombinerOpKHR]

  PFNVkcmdsetfragmentshadingrateenumnv* = proc (commandBuffer: VkCommandBuffer; shadingRate: VkFragmentShadingRateNV; combinerOps: array[2, VkFragmentShadingRateCombinerOpKHR]) {.cdecl.}

const
  vkFragmentShadingRateTypeFragmentSizeNv* {.used.} = 0.VkFragmentShadingRateTypeNV
  vkFragmentShadingRateTypeEnumsNv* {.used.} = 1.VkFragmentShadingRateTypeNV
  vkFragmentShadingRateTypeMaxEnumNv* {.used.} = 0x7FFFFFFF.VkFragmentShadingRateTypeNV

const
  vkFragmentShadingRate1InvocationPerPixelNv* {.used.} = 0.VkFragmentShadingRateNV
  vkFragmentShadingRate1InvocationPer1x2PixelsNv* {.used.} = 1.VkFragmentShadingRateNV
  vkFragmentShadingRate1InvocationPer2x1PixelsNv* {.used.} = 4.VkFragmentShadingRateNV
  vkFragmentShadingRate1InvocationPer2x2PixelsNv* {.used.} = 5.VkFragmentShadingRateNV
  vkFragmentShadingRate1InvocationPer2x4PixelsNv* {.used.} = 6.VkFragmentShadingRateNV
  vkFragmentShadingRate1InvocationPer4x2PixelsNv* {.used.} = 9.VkFragmentShadingRateNV
  vkFragmentShadingRate1InvocationPer4x4PixelsNv* {.used.} = 10.VkFragmentShadingRateNV
  vkFragmentShadingRate2InvocationsPerPixelNv* {.used.} = 11.VkFragmentShadingRateNV
  vkFragmentShadingRate4InvocationsPerPixelNv* {.used.} = 12.VkFragmentShadingRateNV
  vkFragmentShadingRate8InvocationsPerPixelNv* {.used.} = 13.VkFragmentShadingRateNV
  vkFragmentShadingRate16InvocationsPerPixelNv* {.used.} = 14.VkFragmentShadingRateNV
  vkFragmentShadingRateNoInvocationsNv* {.used.} = 15.VkFragmentShadingRateNV
  vkFragmentShadingRateMaxEnumNv* {.used.} = 0x7FFFFFFF.VkFragmentShadingRateNV

when not defined(vkNoPrototypes):
  proc vkCmdSetFragmentShadingRateEnumNV*(commandBuffer: VkCommandBuffer; shadingRate: VkFragmentShadingRateNV; combinerOps: array[2, VkFragmentShadingRateCombinerOpKHR]) {.cdecl, importc.}
const
  vkExtFragmentDensityMap2* = 1
  vkExtFragmentDensityMap2SpecVersion* = 1
  vkExtFragmentDensityMap2ExtensionName* = "VK_EXT_fragment_density_map2"

type
  VkPhysicalDeviceFragmentDensityMap2FeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentDensityMapDeferred*: VkBool32

  VkPhysicalDeviceFragmentDensityMap2PropertiesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    subsampledLoads*: VkBool32
    subsampledCoarseReconstructionEarlyAccess*: VkBool32
    maxSubsampledArrayLayers*: uint32
    maxDescriptorSetSubsampledSamplers*: uint32


const
  vkQcomRotatedCopyCommands* = 1
  vkQcomRotatedCopyCommandsSpecVersion* = 0
  vkQcomRotatedCopyCommandsExtensionName* = "VK_QCOM_rotated_copy_commands"

type
  VkCopyCommandTransformInfoQCOM* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    transform*: VkSurfaceTransformFlagBitsKHR


const
  vkExtImageRobustness* = 1
  vkExtImageRobustnessSpecVersion* = 1
  vkExtImageRobustnessExtensionName* = "VK_EXT_image_robustness"

type
  VkPhysicalDeviceImageRobustnessFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    robustImageAccess*: VkBool32


const
  vkExt4444Formats* = 1
  vkExt4444FormatsSpecVersion* = 1
  vkExt4444FormatsExtensionName* = "VK_EXT_4444_formats"

type
  VkPhysicalDevice4444FormatsFeaturesEXT* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    formatA4R4G4B4*: VkBool32
    formatA4B4G4R4*: VkBool32


const
  vkNvAcquireWinrtDisplay* = 1
  vkNvAcquireWinrtDisplaySpecVersion* = 1
  vkNvAcquireWinrtDisplayExtensionName* = "VK_NV_acquire_winrt_display"

type
  PFNVkacquirewinrtdisplaynv* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR): VkResult {.cdecl.}
  PFNVkgetwinrtdisplaynv* = proc (physicalDevice: VkPhysicalDevice; deviceRelativeId: uint32; pDisplay: ptr VkDisplayKHR): VkResult {.cdecl.}

when not defined(vkNoPrototypes):
  proc vkAcquireWinrtDisplayNV*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR): VkResult {.cdecl, importc.}
  proc vkGetWinrtDisplayNV*(physicalDevice: VkPhysicalDevice; deviceRelativeId: uint32; pDisplay: ptr VkDisplayKHR): VkResult {.cdecl, importc.}
const
  vkValveMutableDescriptorype* = 1
  vkValveMutableDescriptorTypeSpecVersion* = 1
  vkValveMutableDescriptorTypeExtensionName* = "VK_VALVE_mutable_descriptorype"

type
  VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    mutableDescriptorType*: VkBool32

  VkMutableDescriptorTypeListVALVE* {.bycopy.} = object
    descriptorTypeCount*: uint32
    pDescriptorTypes*: ptr VkDescriptorType

  VkMutableDescriptorTypeCreateInfoVALVE* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    mutableDescriptorTypeListCount*: uint32
    pMutableDescriptorTypeLists*: ptr VkMutableDescriptorTypeListVALVE


const
  vkKhrAccelerationStructure* = 1

type
  VkAccelerationStructureKHR* = VkNonDispatchableHandle

const
  vkKhrAccelerationStructureSpecVersion* = 11
  vkKhrAccelerationStructureExtensionName* = "VK_KHR_acceleration_structure"

type
  VkBuildAccelerationStructureModeKHR* = distinct cint
  VkAccelerationStructureBuildTypeKHR* = distinct cint
  VkAccelerationStructureCompatibilityKHR* = distinct cint
  VkAccelerationStructureCreateFlagBitsKHR* = distinct cint
  VkAccelerationStructureCreateFlagsKHR* = VkFlags
  VkDeviceOrHostAddressKHR* {.bycopy, union.} = object
    deviceAddress*: VkDeviceAddress
    hostAddress*: pointer

  VkDeviceOrHostAddressConstKHR* {.bycopy, union.} = object
    deviceAddress*: VkDeviceAddress
    hostAddress*: pointer

  VkAccelerationStructureBuildRangeInfoKHR* {.bycopy.} = object
    primitiveCount*: uint32
    primitiveOffset*: uint32
    firstVertex*: uint32
    transformOffset*: uint32

  VkAccelerationStructureGeometryTrianglesDataKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    vertexFormat*: VkFormat
    vertexData*: VkDeviceOrHostAddressConstKHR
    vertexStride*: VkDeviceSize
    maxVertex*: uint32
    indexType*: VkIndexType
    indexData*: VkDeviceOrHostAddressConstKHR
    transformData*: VkDeviceOrHostAddressConstKHR

  VkAccelerationStructureGeometryAabbsDataKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    data*: VkDeviceOrHostAddressConstKHR
    stride*: VkDeviceSize

  VkAccelerationStructureGeometryInstancesDataKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    arrayOfPointers*: VkBool32
    data*: VkDeviceOrHostAddressConstKHR

  VkAccelerationStructureGeometryDataKHR* {.bycopy, union.} = object
    triangles*: VkAccelerationStructureGeometryTrianglesDataKHR
    aabbs*: VkAccelerationStructureGeometryAabbsDataKHR
    instances*: VkAccelerationStructureGeometryInstancesDataKHR

  VkAccelerationStructureGeometryKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    geometryType*: VkGeometryTypeKHR
    geometry*: VkAccelerationStructureGeometryDataKHR
    flags*: VkGeometryFlagsKHR

  VkAccelerationStructureBuildGeometryInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkAccelerationStructureTypeKHR
    flags*: VkBuildAccelerationStructureFlagsKHR
    mode*: VkBuildAccelerationStructureModeKHR
    srcAccelerationStructure*: VkAccelerationStructureKHR
    dstAccelerationStructure*: VkAccelerationStructureKHR
    geometryCount*: uint32
    pGeometries*: ptr VkAccelerationStructureGeometryKHR
    ppGeometries*: ptr ptr VkAccelerationStructureGeometryKHR
    scratchData*: VkDeviceOrHostAddressKHR

  VkAccelerationStructureCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    createFlags*: VkAccelerationStructureCreateFlagsKHR
    buffer*: VkBuffer
    offset*: VkDeviceSize
    size*: VkDeviceSize
    `type`*: VkAccelerationStructureTypeKHR
    deviceAddress*: VkDeviceAddress

  VkWriteDescriptorSetAccelerationStructureKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructureCount*: uint32
    pAccelerationStructures*: ptr VkAccelerationStructureKHR

  VkPhysicalDeviceAccelerationStructureFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructure*: VkBool32
    accelerationStructureCaptureReplay*: VkBool32
    accelerationStructureIndirectBuild*: VkBool32
    accelerationStructureHostCommands*: VkBool32
    descriptorBindingAccelerationStructureUpdateAfterBind*: VkBool32

  VkPhysicalDeviceAccelerationStructurePropertiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxGeometryCount*: uint64
    maxInstanceCount*: uint64
    maxPrimitiveCount*: uint64
    maxPerStageDescriptorAccelerationStructures*: uint32
    maxPerStageDescriptorUpdateAfterBindAccelerationStructures*: uint32
    maxDescriptorSetAccelerationStructures*: uint32
    maxDescriptorSetUpdateAfterBindAccelerationStructures*: uint32
    minAccelerationStructureScratchOffsetAlignment*: uint32

  VkAccelerationStructureDeviceAddressInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructure*: VkAccelerationStructureKHR

  VkAccelerationStructureVersionInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    pVersionData*: ptr uint8

  VkCopyAccelerationStructureToMemoryInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    src*: VkAccelerationStructureKHR
    dst*: VkDeviceOrHostAddressKHR
    mode*: VkCopyAccelerationStructureModeKHR

  VkCopyMemoryToAccelerationStructureInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    src*: VkDeviceOrHostAddressConstKHR
    dst*: VkAccelerationStructureKHR
    mode*: VkCopyAccelerationStructureModeKHR

  VkCopyAccelerationStructureInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    src*: VkAccelerationStructureKHR
    dst*: VkAccelerationStructureKHR
    mode*: VkCopyAccelerationStructureModeKHR

  VkAccelerationStructureBuildSizesInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructureSize*: VkDeviceSize
    updateScratchSize*: VkDeviceSize
    buildScratchSize*: VkDeviceSize

  PFNVkcreateaccelerationstructurekhr* = proc (device: VkDevice; pCreateInfo: ptr VkAccelerationStructureCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pAccelerationStructure: ptr VkAccelerationStructureKHR): VkResult {.cdecl.}
  PFNVkdestroyaccelerationstructurekhr* = proc (device: VkDevice; accelerationStructure: VkAccelerationStructureKHR; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl.}
  PFNVkcmdbuildaccelerationstructureskhr* = proc (commandBuffer: VkCommandBuffer; infoCount: uint32; pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR; ppBuildRangeInfos: ptr ptr VkAccelerationStructureBuildRangeInfoKHR) {.cdecl.}
  PFNVkcmdbuildaccelerationstructuresindirectkhr* = proc (commandBuffer: VkCommandBuffer; infoCount: uint32; pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR; pIndirectDeviceAddresses: ptr VkDeviceAddress; pIndirectStrides: ptr uint32; ppMaxPrimitiveCounts: ptr ptr uint32) {.cdecl.}
  PFNVkbuildaccelerationstructureskhr* = proc (device: VkDevice; deferredOperation: VkDeferredOperationKHR; infoCount: uint32; pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR; ppBuildRangeInfos: ptr ptr VkAccelerationStructureBuildRangeInfoKHR): VkResult {.cdecl.}
  PFNVkcopyaccelerationstructurekhr* = proc (device: VkDevice; deferredOperation: VkDeferredOperationKHR; pInfo: ptr VkCopyAccelerationStructureInfoKHR): VkResult {.cdecl.}
  PFNVkcopyaccelerationstructuretomemorykhr* = proc (device: VkDevice; deferredOperation: VkDeferredOperationKHR; pInfo: ptr VkCopyAccelerationStructureToMemoryInfoKHR): VkResult {.cdecl.}
  PFNVkcopymemorytoaccelerationstructurekhr* = proc (device: VkDevice; deferredOperation: VkDeferredOperationKHR; pInfo: ptr VkCopyMemoryToAccelerationStructureInfoKHR): VkResult {.cdecl.}
  PFNVkwriteaccelerationstructurespropertieskhr* = proc (device: VkDevice; accelerationStructureCount: uint32; pAccelerationStructures: ptr VkAccelerationStructureKHR; queryType: VkQueryType; dataSize: csize_t; pData: pointer; stride: csize_t): VkResult {.cdecl.}
  PFNVkcmdcopyaccelerationstructurekhr* = proc (commandBuffer: VkCommandBuffer; pInfo: ptr VkCopyAccelerationStructureInfoKHR) {.cdecl.}
  PFNVkcmdcopyaccelerationstructuretomemorykhr* = proc (commandBuffer: VkCommandBuffer; pInfo: ptr VkCopyAccelerationStructureToMemoryInfoKHR) {.cdecl.}
  PFNVkcmdcopymemorytoaccelerationstructurekhr* = proc (commandBuffer: VkCommandBuffer; pInfo: ptr VkCopyMemoryToAccelerationStructureInfoKHR) {.cdecl.}
  PFNVkgetaccelerationstructuredeviceaddresskhr* = proc (device: VkDevice; pInfo: ptr VkAccelerationStructureDeviceAddressInfoKHR): VkDeviceAddress {.cdecl.}
  PFNVkcmdwriteaccelerationstructurespropertieskhr* = proc (commandBuffer: VkCommandBuffer; accelerationStructureCount: uint32; pAccelerationStructures: ptr VkAccelerationStructureKHR; queryType: VkQueryType; queryPool: VkQueryPool; firstQuery: uint32) {.cdecl.}
  PFNVkgetdeviceaccelerationstructurecompatibilitykhr* = proc (device: VkDevice; pVersionInfo: ptr VkAccelerationStructureVersionInfoKHR; pCompatibility: ptr VkAccelerationStructureCompatibilityKHR) {.cdecl.}
  PFNVkgetaccelerationstructurebuildsizeskhr* = proc (device: VkDevice; buildType: VkAccelerationStructureBuildTypeKHR; pBuildInfo: ptr VkAccelerationStructureBuildGeometryInfoKHR; pMaxPrimitiveCounts: ptr uint32; pSizeInfo: ptr VkAccelerationStructureBuildSizesInfoKHR) {.cdecl.}

const
  vkBuildAccelerationStructureModeBuildKhr* {.used.} = 0.VkBuildAccelerationStructureModeKHR
  vkBuildAccelerationStructureModeUpdateKhr* {.used.} = 1.VkBuildAccelerationStructureModeKHR
  vkBuildAccelerationStructureModeMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkBuildAccelerationStructureModeKHR

const
  vkAccelerationStructureBuildTypeHostKhr* {.used.} = 0.VkAccelerationStructureBuildTypeKHR
  vkAccelerationStructureBuildTypeDeviceKhr* {.used.} = 1.VkAccelerationStructureBuildTypeKHR
  vkAccelerationStructureBuildTypeHostOrDeviceKhr* {.used.} = 2.VkAccelerationStructureBuildTypeKHR
  vkAccelerationStructureBuildTypeMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkAccelerationStructureBuildTypeKHR

const
  vkAccelerationStructureCompatibilityCompatibleKhr* {.used.} = 0.VkAccelerationStructureCompatibilityKHR
  vkAccelerationStructureCompatibilityIncompatibleKhr* {.used.} = 1.VkAccelerationStructureCompatibilityKHR
  vkAccelerationStructureCompatibilityMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkAccelerationStructureCompatibilityKHR

const
  vkAccelerationStructureCreateDeviceAddressCaptureReplayBitKhr* {.used.} = 0x00000001.VkAccelerationStructureCreateFlagBitsKHR
  vkAccelerationStructureCreateFlagBitsMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkAccelerationStructureCreateFlagBitsKHR

when not defined(vkNoPrototypes):
  proc vkCreateAccelerationStructureKHR*(device: VkDevice; pCreateInfo: ptr VkAccelerationStructureCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pAccelerationStructure: ptr VkAccelerationStructureKHR): VkResult {.cdecl, importc.}
  proc vkDestroyAccelerationStructureKHR*(device: VkDevice; accelerationStructure: VkAccelerationStructureKHR; pAllocator: ptr VkAllocationCallbacks = nil) {.cdecl, importc.}
  proc vkCmdBuildAccelerationStructuresKHR*(commandBuffer: VkCommandBuffer; infoCount: uint32; pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR; ppBuildRangeInfos: ptr ptr VkAccelerationStructureBuildRangeInfoKHR) {.cdecl, importc.}
  proc vkCmdBuildAccelerationStructuresIndirectKHR*(commandBuffer: VkCommandBuffer; infoCount: uint32; pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR; pIndirectDeviceAddresses: ptr VkDeviceAddress; pIndirectStrides: ptr uint32; ppMaxPrimitiveCounts: ptr ptr uint32) {.cdecl, importc.}
  proc vkBuildAccelerationStructuresKHR*(device: VkDevice; deferredOperation: VkDeferredOperationKHR; infoCount: uint32; pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR; ppBuildRangeInfos: ptr ptr VkAccelerationStructureBuildRangeInfoKHR): VkResult {.cdecl, importc.}
  proc vkCopyAccelerationStructureKHR*(device: VkDevice; deferredOperation: VkDeferredOperationKHR; pInfo: ptr VkCopyAccelerationStructureInfoKHR): VkResult {.cdecl, importc.}
  proc vkCopyAccelerationStructureToMemoryKHR*(device: VkDevice; deferredOperation: VkDeferredOperationKHR; pInfo: ptr VkCopyAccelerationStructureToMemoryInfoKHR): VkResult {.cdecl, importc.}
  proc vkCopyMemoryToAccelerationStructureKHR*(device: VkDevice; deferredOperation: VkDeferredOperationKHR; pInfo: ptr VkCopyMemoryToAccelerationStructureInfoKHR): VkResult {.cdecl, importc.}
  proc vkWriteAccelerationStructuresPropertiesKHR*(device: VkDevice; accelerationStructureCount: uint32; pAccelerationStructures: ptr VkAccelerationStructureKHR; queryType: VkQueryType; dataSize: csize_t; pData: pointer; stride: csize_t): VkResult {.cdecl, importc.}
  proc vkCmdCopyAccelerationStructureKHR*(commandBuffer: VkCommandBuffer; pInfo: ptr VkCopyAccelerationStructureInfoKHR) {.cdecl, importc.}
  proc vkCmdCopyAccelerationStructureToMemoryKHR*(commandBuffer: VkCommandBuffer; pInfo: ptr VkCopyAccelerationStructureToMemoryInfoKHR) {.cdecl, importc.}
  proc vkCmdCopyMemoryToAccelerationStructureKHR*(commandBuffer: VkCommandBuffer; pInfo: ptr VkCopyMemoryToAccelerationStructureInfoKHR) {.cdecl, importc.}
  proc vkGetAccelerationStructureDeviceAddressKHR*(device: VkDevice; pInfo: ptr VkAccelerationStructureDeviceAddressInfoKHR): VkDeviceAddress {.cdecl, importc.}
  proc vkCmdWriteAccelerationStructuresPropertiesKHR*(commandBuffer: VkCommandBuffer; accelerationStructureCount: uint32; pAccelerationStructures: ptr VkAccelerationStructureKHR; queryType: VkQueryType; queryPool: VkQueryPool; firstQuery: uint32) {.cdecl, importc.}
  proc vkGetDeviceAccelerationStructureCompatibilityKHR*(device: VkDevice; pVersionInfo: ptr VkAccelerationStructureVersionInfoKHR; pCompatibility: ptr VkAccelerationStructureCompatibilityKHR) {.cdecl, importc.}
  proc vkGetAccelerationStructureBuildSizesKHR*(device: VkDevice; buildType: VkAccelerationStructureBuildTypeKHR; pBuildInfo: ptr VkAccelerationStructureBuildGeometryInfoKHR; pMaxPrimitiveCounts: ptr uint32; pSizeInfo: ptr VkAccelerationStructureBuildSizesInfoKHR) {.cdecl, importc.}
const
  vkKhrRayracingPipeline* = 1
  vkKhrRayTracingPipelineSpecVersion* = 1
  vkKhrRayTracingPipelineExtensionName* = "VK_KHR_rayracing_pipeline"

type
  VkShaderGroupShaderKHR* = distinct cint
  VkRayTracingShaderGroupCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkRayTracingShaderGroupTypeKHR
    generalShader*: uint32
    closestHitShader*: uint32
    anyHitShader*: uint32
    intersectionShader*: uint32
    pShaderGroupCaptureReplayHandle*: pointer

  VkRayTracingPipelineInterfaceCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    maxPipelineRayPayloadSize*: uint32
    maxPipelineRayHitAttributeSize*: uint32

  VkRayTracingPipelineCreateInfoKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stageCount*: uint32
    pStages*: ptr VkPipelineShaderStageCreateInfo
    groupCount*: uint32
    pGroups*: ptr VkRayTracingShaderGroupCreateInfoKHR
    maxPipelineRayRecursionDepth*: uint32
    pLibraryInfo*: ptr VkPipelineLibraryCreateInfoKHR
    pLibraryInterface*: ptr VkRayTracingPipelineInterfaceCreateInfoKHR
    pDynamicState*: ptr VkPipelineDynamicStateCreateInfo
    layout*: VkPipelineLayout
    basePipelineHandle*: VkPipeline
    basePipelineIndex*: int32

  VkPhysicalDeviceRayTracingPipelineFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    rayTracingPipeline*: VkBool32
    rayTracingPipelineShaderGroupHandleCaptureReplay*: VkBool32
    rayTracingPipelineShaderGroupHandleCaptureReplayMixed*: VkBool32
    rayTracingPipelineTraceRaysIndirect*: VkBool32
    rayTraversalPrimitiveCulling*: VkBool32

  VkPhysicalDeviceRayTracingPipelinePropertiesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    shaderGroupHandleSize*: uint32
    maxRayRecursionDepth*: uint32
    maxShaderGroupStride*: uint32
    shaderGroupBaseAlignment*: uint32
    shaderGroupHandleCaptureReplaySize*: uint32
    maxRayDispatchInvocationCount*: uint32
    shaderGroupHandleAlignment*: uint32
    maxRayHitAttributeSize*: uint32

  VkStridedDeviceAddressRegionKHR* {.bycopy.} = object
    deviceAddress*: VkDeviceAddress
    stride*: VkDeviceSize
    size*: VkDeviceSize

  VkTraceRaysIndirectCommandKHR* {.bycopy.} = object
    width*: uint32
    height*: uint32
    depth*: uint32

  PFNVkcmdtracerayskhr* = proc (commandBuffer: VkCommandBuffer; pRaygenShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pMissShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pHitShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pCallableShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; width: uint32; height: uint32; depth: uint32) {.cdecl.}
  PFNVkcreateraytracingpipelineskhr* = proc (device: VkDevice; deferredOperation: VkDeferredOperationKHR; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkRayTracingPipelineCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFNVkgetraytracingcapturereplayshadergrouphandleskhr* = proc (device: VkDevice; pipeline: VkPipeline; firstGroup: uint32; groupCount: uint32; dataSize: csize_t; pData: pointer): VkResult {.cdecl.}
  PFNVkcmdtraceraysindirectkhr* = proc (commandBuffer: VkCommandBuffer; pRaygenShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pMissShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pHitShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pCallableShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; indirectDeviceAddress: VkDeviceAddress) {.cdecl.}
  PFNVkgetraytracingshadergroupstacksizekhr* = proc (device: VkDevice; pipeline: VkPipeline; group: uint32; groupShader: VkShaderGroupShaderKHR): VkDeviceSize {.cdecl.}
  PFNVkcmdsetraytracingpipelinestacksizekhr* = proc (commandBuffer: VkCommandBuffer; pipelineStackSize: uint32) {.cdecl.}

const
  vkShaderGroupShaderGeneralKhr* {.used.} = 0.VkShaderGroupShaderKHR
  vkShaderGroupShaderClosestHitKhr* {.used.} = 1.VkShaderGroupShaderKHR
  vkShaderGroupShaderAnyHitKhr* {.used.} = 2.VkShaderGroupShaderKHR
  vkShaderGroupShaderIntersectionKhr* {.used.} = 3.VkShaderGroupShaderKHR
  vkShaderGroupShaderMaxEnumKhr* {.used.} = 0x7FFFFFFF.VkShaderGroupShaderKHR

when not defined(vkNoPrototypes):
  proc vkCmdTraceRaysKHR*(commandBuffer: VkCommandBuffer; pRaygenShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pMissShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pHitShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pCallableShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; width: uint32; height: uint32; depth: uint32) {.cdecl, importc.}
  proc vkCreateRayTracingPipelinesKHR*(device: VkDevice; deferredOperation: VkDeferredOperationKHR; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkRayTracingPipelineCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks = nil; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkGetRayTracingCaptureReplayShaderGroupHandlesKHR*(device: VkDevice; pipeline: VkPipeline; firstGroup: uint32; groupCount: uint32; dataSize: csize_t; pData: pointer): VkResult {.cdecl, importc.}
  proc vkCmdTraceRaysIndirectKHR*(commandBuffer: VkCommandBuffer; pRaygenShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pMissShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pHitShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; pCallableShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR; indirectDeviceAddress: VkDeviceAddress) {.cdecl, importc.}
  proc vkGetRayTracingShaderGroupStackSizeKHR*(device: VkDevice; pipeline: VkPipeline; group: uint32; groupShader: VkShaderGroupShaderKHR): VkDeviceSize {.cdecl, importc.}
  proc vkCmdSetRayTracingPipelineStackSizeKHR*(commandBuffer: VkCommandBuffer; pipelineStackSize: uint32) {.cdecl, importc.}
const
  vkKhrRayQuery* = 1
  vkKhrRayQuerySpecVersion* = 1
  vkKhrRayQueryExtensionName* = "VK_KHR_ray_query"

type
  VkPhysicalDeviceRayQueryFeaturesKHR* {.bycopy.} = object
    sType*: VkStructureType
    pNext*: pointer
    rayQuery*: VkBool32

from strutils import replace

macro genFlagConverters(identifiers: untyped): untyped =
  result = nnkStmtList.newTree()
  for identifier in identifiers:
    let flagType = identifier.strVal.replace("Bit")
    result.add(
      nnkConverterDef.newTree(
        nnkPostfix.newTree(
          ident"*",
          ident "to" & flagType
        ),
        newEmptyNode(),
        newEmptyNode(),
        nnkFormalParams.newTree(
          ident flagType,
          nnkIdentDefs.newTree(
            ident"i",
            identifier,
            newEmptyNode()
        ) ),
        newEmptyNode(),
        newEmptyNode(),
        nnkStmtList.newTree(
          nnkDotExpr.newTree(
            ident"i",
            ident flagType
    ) ) ) )

genFlagConverters:
  VkAccessFlagBits
  VkImageAspectFlagBits
  VkFormatFeatureFlagBits
  VkImageCreateFlagBits
  VkSampleCountFlagBits
  VkImageUsageFlagBits
  VkMemoryHeapFlagBits
  VkMemoryPropertyFlagBits
  VkQueueFlagBits
  VkDeviceQueueCreateFlagBits
  VkPipelineStageFlagBits
  VkSparseMemoryBindFlagBits
  VkSparseImageFormatFlagBits
  VkFenceCreateFlagBits
  VkEventCreateFlagBits
  VkQueryPipelineStatisticFlagBits
  VkQueryResultFlagBits
  VkBufferCreateFlagBits
  VkBufferUsageFlagBits
  VkImageViewCreateFlagBits
  VkShaderModuleCreateFlagBits
  VkPipelineCacheCreateFlagBits
  VkColorComponentFlagBits
  VkPipelineCreateFlagBits
  VkPipelineShaderStageCreateFlagBits
  VkShaderStageFlagBits
  VkCullModeFlagBits
  VkSamplerCreateFlagBits
  VkDescriptorPoolCreateFlagBits
  VkDescriptorSetLayoutCreateFlagBits
  VkAttachmentDescriptionFlagBits
  VkDependencyFlagBits
  VkFramebufferCreateFlagBits
  VkRenderPassCreateFlagBits
  VkSubpassDescriptionFlagBits
  VkCommandPoolCreateFlagBits
  VkCommandPoolResetFlagBits
  VkCommandBufferUsageFlagBits
  VkQueryControlFlagBits
  VkCommandBufferResetFlagBits
  VkStencilFaceFlagBits
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
  VkResolveModeFlagBits
  VkDescriptorBindingFlagBits
  VkSemaphoreWaitFlagBits
  VkSurfaceTransformFlagBitsKHR
  VkCompositeAlphaFlagBitsKHR
  VkSwapchainCreateFlagBitsKHR
  VkDeviceGroupPresentModeFlagBitsKHR
  VkDisplayPlaneAlphaFlagBitsKHR
  VkPerformanceCounterDescriptionFlagBitsKHR
  VkAcquireProfilingLockFlagBitsKHR
  VkSubmitFlagBitsKHR
  VkDebugReportFlagBitsEXT
  VkExternalMemoryHandleTypeFlagBitsNV
  VkExternalMemoryFeatureFlagBitsNV
  VkConditionalRenderingFlagBitsEXT
  VkSurfaceCounterFlagBitsEXT
  VkDebugUtilsMessageSeverityFlagBitsEXT
  VkDebugUtilsMessageTypeFlagBitsEXT
  VkGeometryFlagBitsKHR
  VkGeometryInstanceFlagBitsKHR
  VkBuildAccelerationStructureFlagBitsKHR
  VkPipelineCompilerControlFlagBitsAMD
  VkPipelineCreationFeedbackFlagBitsEXT
  VkShaderCorePropertiesFlagBitsAMD
  VkToolPurposeFlagBitsEXT
  VkIndirectStateFlagBitsNV
  VkIndirectCommandsLayoutUsageFlagBitsNV
  VkPrivateDataSlotCreateFlagBitsEXT
  VkDeviceDiagnosticsConfigFlagBitsNV
  VkAccelerationStructureCreateFlagBitsKHR
