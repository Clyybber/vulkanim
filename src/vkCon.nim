import vulkan

proc mkVkApplicationInfo*(pApplicationName: cstring; applicationVersion: uint32;
                          pEngineName: cstring; engineVersion: uint32;
                          apiVersion: uint32): VkApplicationInfo =
  result.sType = vkStructureTypeApplicationInfo
  result.pApplicationName = pApplicationName
  result.applicationVersion = applicationVersion
  result.pEngineName = pEngineName
  result.engineVersion = engineVersion
  result.apiVersion = apiVersion


proc mkVkInstanceCreateInfo*(pApplicationInfo: ptr VkApplicationInfo;
                             enabledLayerCount: uint32;
                             ppEnabledLayerNames: cstringArray;
                             enabledExtensionCount: uint32;
                             ppEnabledExtensionNames: cstringArray): VkInstanceCreateInfo =
  result.sType = vkStructureTypeInstanceCreateInfo
  result.pApplicationInfo = pApplicationInfo
  result.enabledLayerCount = enabledLayerCount
  result.ppEnabledLayerNames = ppEnabledLayerNames
  result.enabledExtensionCount = enabledExtensionCount
  result.ppEnabledExtensionNames = ppEnabledExtensionNames


proc mkVkDeviceQueueCreateInfo*(queueFamilyIndex: uint32; queueCount: uint32;
                                pQueuePriorities: ptr cfloat): VkDeviceQueueCreateInfo =
  result.sType = vkStructureTypeDeviceQueueCreateInfo
  result.queueFamilyIndex = queueFamilyIndex
  result.queueCount = queueCount
  result.pQueuePriorities = pQueuePriorities


proc mkVkDeviceCreateInfo*(queueCreateInfoCount: uint32;
                           pQueueCreateInfos: ptr VkDeviceQueueCreateInfo;
                           enabledLayerCount: uint32;
                           ppEnabledLayerNames: cstringArray;
                           enabledExtensionCount: uint32;
                           ppEnabledExtensionNames: cstringArray;
                           pEnabledFeatures: ptr VkPhysicalDeviceFeatures): VkDeviceCreateInfo =
  result.sType = vkStructureTypeDeviceCreateInfo
  result.queueCreateInfoCount = queueCreateInfoCount
  result.pQueueCreateInfos = pQueueCreateInfos
  result.enabledLayerCount = enabledLayerCount
  result.ppEnabledLayerNames = ppEnabledLayerNames
  result.enabledExtensionCount = enabledExtensionCount
  result.ppEnabledExtensionNames = ppEnabledExtensionNames
  result.pEnabledFeatures = pEnabledFeatures


proc mkVkSubmitInfo*(waitSemaphoreCount: uint32;
                     pWaitSemaphores: ptr VkSemaphore;
                     pWaitDstStageMask: ptr VkPipelineStageFlags;
                     commandBufferCount: uint32;
                     pCommandBuffers: ptr VkCommandBuffer;
                     signalSemaphoreCount: uint32;
                     pSignalSemaphores: ptr VkSemaphore): VkSubmitInfo =
  result.sType = vkStructureTypeSubmitInfo
  result.waitSemaphoreCount = waitSemaphoreCount
  result.pWaitSemaphores = pWaitSemaphores
  result.pWaitDstStageMask = pWaitDstStageMask
  result.commandBufferCount = commandBufferCount
  result.pCommandBuffers = pCommandBuffers
  result.signalSemaphoreCount = signalSemaphoreCount
  result.pSignalSemaphores = pSignalSemaphores


proc mkVkMemoryAllocateInfo*(allocationSize: VkDeviceSize;
                             memoryTypeIndex: uint32): VkMemoryAllocateInfo =
  result.sType = vkStructureTypeMemoryAllocateInfo
  result.allocationSize = allocationSize
  result.memoryTypeIndex = memoryTypeIndex


proc mkVkMappedMemoryRange*(memory: VkDeviceMemory; offset: VkDeviceSize;
                            size: VkDeviceSize): VkMappedMemoryRange =
  result.sType = vkStructureTypeMappedMemoryRange
  result.memory = memory
  result.offset = offset
  result.size = size


proc mkVkBindSparseInfo*(waitSemaphoreCount: uint32;
                         pWaitSemaphores: ptr VkSemaphore;
                         bufferBindCount: uint32;
                         pBufferBinds: ptr VkSparseBufferMemoryBindInfo;
                         imageOpaqueBindCount: uint32; pImageOpaqueBinds: ptr VkSparseImageOpaqueMemoryBindInfo;
                         imageBindCount: uint32;
                         pImageBinds: ptr VkSparseImageMemoryBindInfo;
                         signalSemaphoreCount: uint32;
                         pSignalSemaphores: ptr VkSemaphore): VkBindSparseInfo =
  result.sType = vkStructureTypeBindSparseInfo
  result.waitSemaphoreCount = waitSemaphoreCount
  result.pWaitSemaphores = pWaitSemaphores
  result.bufferBindCount = bufferBindCount
  result.pBufferBinds = pBufferBinds
  result.imageOpaqueBindCount = imageOpaqueBindCount
  result.pImageOpaqueBinds = pImageOpaqueBinds
  result.imageBindCount = imageBindCount
  result.pImageBinds = pImageBinds
  result.signalSemaphoreCount = signalSemaphoreCount
  result.pSignalSemaphores = pSignalSemaphores


proc mkVkFenceCreateInfo*(): VkFenceCreateInfo =
  result.sType = vkStructureTypeFenceCreateInfo


proc mkVkSemaphoreCreateInfo*(): VkSemaphoreCreateInfo =
  result.sType = vkStructureTypeSemaphoreCreateInfo


proc mkVkEventCreateInfo*(): VkEventCreateInfo =
  result.sType = vkStructureTypeEventCreateInfo


proc mkVkQueryPoolCreateInfo*(queryType: VkQueryType; queryCount: uint32;
                              pipelineStatistics: VkQueryPipelineStatisticFlags): VkQueryPoolCreateInfo =
  result.sType = vkStructureTypeQueryPoolCreateInfo
  result.queryType = queryType
  result.queryCount = queryCount
  result.pipelineStatistics = pipelineStatistics


proc mkVkBufferCreateInfo*(size: VkDeviceSize; usage: VkBufferUsageFlags;
                           sharingMode: VkSharingMode;
                           queueFamilyIndexCount: uint32;
                           pQueueFamilyIndices: ptr uint32): VkBufferCreateInfo =
  result.sType = vkStructureTypeBufferCreateInfo
  result.size = size
  result.usage = usage
  result.sharingMode = sharingMode
  result.queueFamilyIndexCount = queueFamilyIndexCount
  result.pQueueFamilyIndices = pQueueFamilyIndices


proc mkVkBufferViewCreateInfo*(buffer: VkBuffer; format: VkFormat;
                               offset: VkDeviceSize; range: VkDeviceSize): VkBufferViewCreateInfo =
  result.sType = vkStructureTypeBufferViewCreateInfo
  result.buffer = buffer
  result.format = format
  result.offset = offset
  result.range = range


proc mkVkImageCreateInfo*(imageType: VkImageType; format: VkFormat;
                          extent: VkExtent3D; mipLevels: uint32;
                          arrayLayers: uint32; samples: VkSampleCountFlagBits;
                          tiling: VkImageTiling; usage: VkImageUsageFlags;
                          sharingMode: VkSharingMode;
                          queueFamilyIndexCount: uint32;
                          pQueueFamilyIndices: ptr uint32;
                          initialLayout: VkImageLayout): VkImageCreateInfo =
  result.sType = vkStructureTypeImageCreateInfo
  result.imageType = imageType
  result.format = format
  result.extent = extent
  result.mipLevels = mipLevels
  result.arrayLayers = arrayLayers
  result.samples = samples
  result.tiling = tiling
  result.usage = usage
  result.sharingMode = sharingMode
  result.queueFamilyIndexCount = queueFamilyIndexCount
  result.pQueueFamilyIndices = pQueueFamilyIndices
  result.initialLayout = initialLayout


proc mkVkImageViewCreateInfo*(image: VkImage; viewType: VkImageViewType;
                              format: VkFormat; components: VkComponentMapping;
                              subresourceRange: VkImageSubresourceRange): VkImageViewCreateInfo =
  result.sType = vkStructureTypeImageViewCreateInfo
  result.image = image
  result.viewType = viewType
  result.format = format
  result.components = components
  result.subresourceRange = subresourceRange


proc mkVkShaderModuleCreateInfo*(codeSize: csize_t; pCode: ptr uint32): VkShaderModuleCreateInfo =
  result.sType = vkStructureTypeShaderModuleCreateInfo
  result.codeSize = codeSize
  result.pCode = pCode


proc mkVkPipelineCacheCreateInfo*(initialDataSize: csize_t): VkPipelineCacheCreateInfo =
  result.sType = vkStructureTypePipelineCacheCreateInfo
  result.initialDataSize = initialDataSize


proc mkVkPipelineShaderStageCreateInfo*(stage: VkShaderStageFlagBits;
                                        module: VkShaderModule; pName: cstring;
    pSpecializationInfo: ptr VkSpecializationInfo): VkPipelineShaderStageCreateInfo =
  result.sType = vkStructureTypePipelineShaderStageCreateInfo
  result.stage = stage
  result.module = module
  result.pName = pName
  result.pSpecializationInfo = pSpecializationInfo


proc mkVkPipelineVertexInputStateCreateInfo*(
    vertexBindingDescriptionCount: uint32;
    pVertexBindingDescriptions: ptr VkVertexInputBindingDescription;
    vertexAttributeDescriptionCount: uint32;
    pVertexAttributeDescriptions: ptr VkVertexInputAttributeDescription): VkPipelineVertexInputStateCreateInfo =
  result.sType = vkStructureTypePipelineVertexInputStateCreateInfo
  result.vertexBindingDescriptionCount = vertexBindingDescriptionCount
  result.pVertexBindingDescriptions = pVertexBindingDescriptions
  result.vertexAttributeDescriptionCount = vertexAttributeDescriptionCount
  result.pVertexAttributeDescriptions = pVertexAttributeDescriptions


proc mkVkPipelineInputAssemblyStateCreateInfo*(topology: VkPrimitiveTopology;
    primitiveRestartEnable: VkBool32): VkPipelineInputAssemblyStateCreateInfo =
  result.sType = vkStructureTypePipelineInputAssemblyStateCreateInfo
  result.topology = topology
  result.primitiveRestartEnable = primitiveRestartEnable


proc mkVkPipelineTessellationStateCreateInfo*(patchControlPoints: uint32): VkPipelineTessellationStateCreateInfo =
  result.sType = vkStructureTypePipelineTessellationStateCreateInfo
  result.patchControlPoints = patchControlPoints


proc mkVkPipelineViewportStateCreateInfo*(viewportCount: uint32;
    pViewports: ptr VkViewport; scissorCount: uint32; pScissors: ptr VkRect2D): VkPipelineViewportStateCreateInfo =
  result.sType = vkStructureTypePipelineViewportStateCreateInfo
  result.viewportCount = viewportCount
  result.pViewports = pViewports
  result.scissorCount = scissorCount
  result.pScissors = pScissors


proc mkVkPipelineRasterizationStateCreateInfo*(depthClampEnable: VkBool32;
    rasterizerDiscardEnable: VkBool32; polygonMode: VkPolygonMode;
    cullMode: VkCullModeFlags; frontFace: VkFrontFace;
    depthBiasEnable: VkBool32; depthBiasConstantFactor: cfloat;
    depthBiasClamp: cfloat; depthBiasSlopeFactor: cfloat; lineWidth: cfloat): VkPipelineRasterizationStateCreateInfo =
  result.sType = vkStructureTypePipelineRasterizationStateCreateInfo
  result.depthClampEnable = depthClampEnable
  result.rasterizerDiscardEnable = rasterizerDiscardEnable
  result.polygonMode = polygonMode
  result.cullMode = cullMode
  result.frontFace = frontFace
  result.depthBiasEnable = depthBiasEnable
  result.depthBiasConstantFactor = depthBiasConstantFactor
  result.depthBiasClamp = depthBiasClamp
  result.depthBiasSlopeFactor = depthBiasSlopeFactor
  result.lineWidth = lineWidth


proc mkVkPipelineMultisampleStateCreateInfo*(
    rasterizationSamples: VkSampleCountFlagBits; sampleShadingEnable: VkBool32;
    minSampleShading: cfloat; pSampleMask: ptr VkSampleMask;
    alphaToCoverageEnable: VkBool32; alphaToOneEnable: VkBool32): VkPipelineMultisampleStateCreateInfo =
  result.sType = vkStructureTypePipelineMultisampleStateCreateInfo
  result.rasterizationSamples = rasterizationSamples
  result.sampleShadingEnable = sampleShadingEnable
  result.minSampleShading = minSampleShading
  result.pSampleMask = pSampleMask
  result.alphaToCoverageEnable = alphaToCoverageEnable
  result.alphaToOneEnable = alphaToOneEnable


proc mkVkPipelineDepthStencilStateCreateInfo*(depthTestEnable: VkBool32;
    depthWriteEnable: VkBool32; depthCompareOp: VkCompareOp;
    depthBoundsTestEnable: VkBool32; stencilTestEnable: VkBool32;
    front: VkStencilOpState; back: VkStencilOpState; minDepthBounds: cfloat;
    maxDepthBounds: cfloat): VkPipelineDepthStencilStateCreateInfo =
  result.sType = vkStructureTypePipelineDepthStencilStateCreateInfo
  result.depthTestEnable = depthTestEnable
  result.depthWriteEnable = depthWriteEnable
  result.depthCompareOp = depthCompareOp
  result.depthBoundsTestEnable = depthBoundsTestEnable
  result.stencilTestEnable = stencilTestEnable
  result.front = front
  result.back = back
  result.minDepthBounds = minDepthBounds
  result.maxDepthBounds = maxDepthBounds


proc mkVkPipelineColorBlendStateCreateInfo*(logicOpEnable: VkBool32;
    logicOp: VkLogicOp; attachmentCount: uint32;
    pAttachments: ptr VkPipelineColorBlendAttachmentState;
    blendConstants: array[0 .. 3, cfloat]): VkPipelineColorBlendStateCreateInfo =
  result.sType = vkStructureTypePipelineColorBlendStateCreateInfo
  result.logicOpEnable = logicOpEnable
  result.logicOp = logicOp
  result.attachmentCount = attachmentCount
  result.pAttachments = pAttachments
  result.blendConstants = blendConstants


proc mkVkPipelineDynamicStateCreateInfo*(dynamicStateCount: uint32;
    pDynamicStates: ptr VkDynamicState): VkPipelineDynamicStateCreateInfo =
  result.sType = vkStructureTypePipelineDynamicStateCreateInfo
  result.dynamicStateCount = dynamicStateCount
  result.pDynamicStates = pDynamicStates


proc mkVkGraphicsPipelineCreateInfo*(stageCount: uint32; pStages: ptr VkPipelineShaderStageCreateInfo;
    pVertexInputState: ptr VkPipelineVertexInputStateCreateInfo;
    pInputAssemblyState: ptr VkPipelineInputAssemblyStateCreateInfo;
    pTessellationState: ptr VkPipelineTessellationStateCreateInfo;
    pViewportState: ptr VkPipelineViewportStateCreateInfo; pRasterizationState: ptr VkPipelineRasterizationStateCreateInfo;
    pMultisampleState: ptr VkPipelineMultisampleStateCreateInfo;
    pDepthStencilState: ptr VkPipelineDepthStencilStateCreateInfo;
    pColorBlendState: ptr VkPipelineColorBlendStateCreateInfo; pDynamicState: ptr VkPipelineDynamicStateCreateInfo;
                                     layout: VkPipelineLayout;
                                     renderPass: VkRenderPass; subpass: uint32;
                                     basePipelineHandle: VkPipeline;
                                     basePipelineIndex: int32): VkGraphicsPipelineCreateInfo =
  result.sType = vkStructureTypeGraphicsPipelineCreateInfo
  result.stageCount = stageCount
  result.pStages = pStages
  result.pVertexInputState = pVertexInputState
  result.pInputAssemblyState = pInputAssemblyState
  result.pTessellationState = pTessellationState
  result.pViewportState = pViewportState
  result.pRasterizationState = pRasterizationState
  result.pMultisampleState = pMultisampleState
  result.pDepthStencilState = pDepthStencilState
  result.pColorBlendState = pColorBlendState
  result.pDynamicState = pDynamicState
  result.layout = layout
  result.renderPass = renderPass
  result.subpass = subpass
  result.basePipelineHandle = basePipelineHandle
  result.basePipelineIndex = basePipelineIndex


proc mkVkComputePipelineCreateInfo*(stage: VkPipelineShaderStageCreateInfo;
                                    layout: VkPipelineLayout;
                                    basePipelineHandle: VkPipeline;
                                    basePipelineIndex: int32): VkComputePipelineCreateInfo =
  result.sType = vkStructureTypeComputePipelineCreateInfo
  result.stage = stage
  result.layout = layout
  result.basePipelineHandle = basePipelineHandle
  result.basePipelineIndex = basePipelineIndex


proc mkVkPipelineLayoutCreateInfo*(setLayoutCount: uint32;
                                   pSetLayouts: ptr VkDescriptorSetLayout;
                                   pushConstantRangeCount: uint32;
                                   pPushConstantRanges: ptr VkPushConstantRange): VkPipelineLayoutCreateInfo =
  result.sType = vkStructureTypePipelineLayoutCreateInfo
  result.setLayoutCount = setLayoutCount
  result.pSetLayouts = pSetLayouts
  result.pushConstantRangeCount = pushConstantRangeCount
  result.pPushConstantRanges = pPushConstantRanges


proc mkVkSamplerCreateInfo*(magFilter: VkFilter; minFilter: VkFilter;
                            mipmapMode: VkSamplerMipmapMode;
                            addressModeU: VkSamplerAddressMode;
                            addressModeV: VkSamplerAddressMode;
                            addressModeW: VkSamplerAddressMode;
                            mipLodBias: cfloat; anisotropyEnable: VkBool32;
                            maxAnisotropy: cfloat; compareEnable: VkBool32;
                            compareOp: VkCompareOp; minLod: cfloat;
                            maxLod: cfloat; borderColor: VkBorderColor;
                            unnormalizedCoordinates: VkBool32): VkSamplerCreateInfo =
  result.sType = vkStructureTypeSamplerCreateInfo
  result.magFilter = magFilter
  result.minFilter = minFilter
  result.mipmapMode = mipmapMode
  result.addressModeU = addressModeU
  result.addressModeV = addressModeV
  result.addressModeW = addressModeW
  result.mipLodBias = mipLodBias
  result.anisotropyEnable = anisotropyEnable
  result.maxAnisotropy = maxAnisotropy
  result.compareEnable = compareEnable
  result.compareOp = compareOp
  result.minLod = minLod
  result.maxLod = maxLod
  result.borderColor = borderColor
  result.unnormalizedCoordinates = unnormalizedCoordinates


proc mkVkDescriptorSetLayoutCreateInfo*(bindingCount: uint32; pBindings: ptr VkDescriptorSetLayoutBinding): VkDescriptorSetLayoutCreateInfo =
  result.sType = vkStructureTypeDescriptorSetLayoutCreateInfo
  result.bindingCount = bindingCount
  result.pBindings = pBindings


proc mkVkDescriptorPoolCreateInfo*(maxSets: uint32; poolSizeCount: uint32;
                                   pPoolSizes: ptr VkDescriptorPoolSize): VkDescriptorPoolCreateInfo =
  result.sType = vkStructureTypeDescriptorPoolCreateInfo
  result.maxSets = maxSets
  result.poolSizeCount = poolSizeCount
  result.pPoolSizes = pPoolSizes


proc mkVkDescriptorSetAllocateInfo*(descriptorPool: VkDescriptorPool;
                                    descriptorSetCount: uint32;
                                    pSetLayouts: ptr VkDescriptorSetLayout): VkDescriptorSetAllocateInfo =
  result.sType = vkStructureTypeDescriptorSetAllocateInfo
  result.descriptorPool = descriptorPool
  result.descriptorSetCount = descriptorSetCount
  result.pSetLayouts = pSetLayouts


proc mkVkWriteDescriptorSet*(dstSet: VkDescriptorSet; dstBinding: uint32;
                             dstArrayElement: uint32; descriptorCount: uint32;
                             descriptorType: VkDescriptorType;
                             pImageInfo: ptr VkDescriptorImageInfo;
                             pBufferInfo: ptr VkDescriptorBufferInfo;
                             pTexelBufferView: ptr VkBufferView): VkWriteDescriptorSet =
  result.sType = vkStructureTypeWriteDescriptorSet
  result.dstSet = dstSet
  result.dstBinding = dstBinding
  result.dstArrayElement = dstArrayElement
  result.descriptorCount = descriptorCount
  result.descriptorType = descriptorType
  result.pImageInfo = pImageInfo
  result.pBufferInfo = pBufferInfo
  result.pTexelBufferView = pTexelBufferView


proc mkVkCopyDescriptorSet*(srcSet: VkDescriptorSet; srcBinding: uint32;
                            srcArrayElement: uint32; dstSet: VkDescriptorSet;
                            dstBinding: uint32; dstArrayElement: uint32;
                            descriptorCount: uint32): VkCopyDescriptorSet =
  result.sType = vkStructureTypeCopyDescriptorSet
  result.srcSet = srcSet
  result.srcBinding = srcBinding
  result.srcArrayElement = srcArrayElement
  result.dstSet = dstSet
  result.dstBinding = dstBinding
  result.dstArrayElement = dstArrayElement
  result.descriptorCount = descriptorCount


proc mkVkFramebufferCreateInfo*(renderPass: VkRenderPass;
                                attachmentCount: uint32;
                                pAttachments: ptr VkImageView; width: uint32;
                                height: uint32; layers: uint32): VkFramebufferCreateInfo =
  result.sType = vkStructureTypeFramebufferCreateInfo
  result.renderPass = renderPass
  result.attachmentCount = attachmentCount
  result.pAttachments = pAttachments
  result.width = width
  result.height = height
  result.layers = layers


proc mkVkRenderPassCreateInfo*(attachmentCount: uint32;
                               pAttachments: ptr VkAttachmentDescription;
                               subpassCount: uint32;
                               pSubpasses: ptr VkSubpassDescription;
                               dependencyCount: uint32;
                               pDependencies: ptr VkSubpassDependency): VkRenderPassCreateInfo =
  result.sType = vkStructureTypeRenderPassCreateInfo
  result.attachmentCount = attachmentCount
  result.pAttachments = pAttachments
  result.subpassCount = subpassCount
  result.pSubpasses = pSubpasses
  result.dependencyCount = dependencyCount
  result.pDependencies = pDependencies


proc mkVkCommandPoolCreateInfo*(queueFamilyIndex: uint32): VkCommandPoolCreateInfo =
  result.sType = vkStructureTypeCommandPoolCreateInfo
  result.queueFamilyIndex = queueFamilyIndex


proc mkVkCommandBufferAllocateInfo*(commandPool: VkCommandPool;
                                    level: VkCommandBufferLevel;
                                    commandBufferCount: uint32): VkCommandBufferAllocateInfo =
  result.sType = vkStructureTypeCommandBufferAllocateInfo
  result.commandPool = commandPool
  result.level = level
  result.commandBufferCount = commandBufferCount


proc mkVkCommandBufferInheritanceInfo*(renderPass: VkRenderPass;
                                       subpass: uint32;
                                       framebuffer: VkFramebuffer;
                                       occlusionQueryEnable: VkBool32;
                                       queryFlags: VkQueryControlFlags;
    pipelineStatistics: VkQueryPipelineStatisticFlags): VkCommandBufferInheritanceInfo =
  result.sType = vkStructureTypeCommandBufferInheritanceInfo
  result.renderPass = renderPass
  result.subpass = subpass
  result.framebuffer = framebuffer
  result.occlusionQueryEnable = occlusionQueryEnable
  result.queryFlags = queryFlags
  result.pipelineStatistics = pipelineStatistics


proc mkVkCommandBufferBeginInfo*(pInheritanceInfo: ptr VkCommandBufferInheritanceInfo): VkCommandBufferBeginInfo =
  result.sType = vkStructureTypeCommandBufferBeginInfo
  result.pInheritanceInfo = pInheritanceInfo


proc mkVkRenderPassBeginInfo*(renderPass: VkRenderPass;
                              framebuffer: VkFramebuffer; renderArea: VkRect2D;
                              clearValueCount: uint32;
                              pClearValues: ptr VkClearValue): VkRenderPassBeginInfo =
  result.sType = vkStructureTypeRenderPassBeginInfo
  result.renderPass = renderPass
  result.framebuffer = framebuffer
  result.renderArea = renderArea
  result.clearValueCount = clearValueCount
  result.pClearValues = pClearValues


proc mkVkBufferMemoryBarrier*(srcAccessMask: VkAccessFlags;
                              dstAccessMask: VkAccessFlags;
                              srcQueueFamilyIndex: uint32;
                              dstQueueFamilyIndex: uint32; buffer: VkBuffer;
                              offset: VkDeviceSize; size: VkDeviceSize): VkBufferMemoryBarrier =
  result.sType = vkStructureTypeBufferMemoryBarrier
  result.srcAccessMask = srcAccessMask
  result.dstAccessMask = dstAccessMask
  result.srcQueueFamilyIndex = srcQueueFamilyIndex
  result.dstQueueFamilyIndex = dstQueueFamilyIndex
  result.buffer = buffer
  result.offset = offset
  result.size = size


proc mkVkImageMemoryBarrier*(srcAccessMask: VkAccessFlags;
                             dstAccessMask: VkAccessFlags;
                             oldLayout: VkImageLayout; newLayout: VkImageLayout;
                             srcQueueFamilyIndex: uint32;
                             dstQueueFamilyIndex: uint32; image: VkImage;
                             subresourceRange: VkImageSubresourceRange): VkImageMemoryBarrier =
  result.sType = vkStructureTypeImageMemoryBarrier
  result.srcAccessMask = srcAccessMask
  result.dstAccessMask = dstAccessMask
  result.oldLayout = oldLayout
  result.newLayout = newLayout
  result.srcQueueFamilyIndex = srcQueueFamilyIndex
  result.dstQueueFamilyIndex = dstQueueFamilyIndex
  result.image = image
  result.subresourceRange = subresourceRange


proc mkVkMemoryBarrier*(srcAccessMask: VkAccessFlags;
                        dstAccessMask: VkAccessFlags): VkMemoryBarrier =
  result.sType = vkStructureTypeMemoryBarrier
  result.srcAccessMask = srcAccessMask
  result.dstAccessMask = dstAccessMask


proc mkVkPhysicalDeviceVulkan11Features*(storageBuffer16BitAccess: VkBool32;
    uniformAndStorageBuffer16BitAccess: VkBool32;
    storagePushConstant16: VkBool32; storageInputOutput16: VkBool32;
    multiview: VkBool32; multiviewGeometryShader: VkBool32;
    multiviewTessellationShader: VkBool32;
    variablePointersStorageBuffer: VkBool32; variablePointers: VkBool32;
    protectedMemory: VkBool32; samplerYcbcrConversion: VkBool32;
    shaderDrawParameters: VkBool32): VkPhysicalDeviceVulkan11Features =
  result.sType = vkStructureTypePhysicalDeviceVulkan11Features
  result.storageBuffer16BitAccess = storageBuffer16BitAccess
  result.uniformAndStorageBuffer16BitAccess = uniformAndStorageBuffer16BitAccess
  result.storagePushConstant16 = storagePushConstant16
  result.storageInputOutput16 = storageInputOutput16
  result.multiview = multiview
  result.multiviewGeometryShader = multiviewGeometryShader
  result.multiviewTessellationShader = multiviewTessellationShader
  result.variablePointersStorageBuffer = variablePointersStorageBuffer
  result.variablePointers = variablePointers
  result.protectedMemory = protectedMemory
  result.samplerYcbcrConversion = samplerYcbcrConversion
  result.shaderDrawParameters = shaderDrawParameters


proc mkVkPhysicalDeviceVulkan11Properties*(deviceUUID: array[0 .. 15, uint8];
    driverUUID: array[0 .. 15, uint8]; deviceLUID: array[0 .. 7, uint8];
    deviceNodeMask: uint32; deviceLUIDValid: VkBool32; subgroupSize: uint32;
    subgroupSupportedStages: VkShaderStageFlags;
    subgroupSupportedOperations: VkSubgroupFeatureFlags;
    subgroupQuadOperationsInAllStages: VkBool32;
    pointClippingBehavior: VkPointClippingBehavior;
    maxMultiviewViewCount: uint32; maxMultiviewInstanceIndex: uint32;
    protectedNoFault: VkBool32; maxPerSetDescriptors: uint32;
    maxMemoryAllocationSize: VkDeviceSize): VkPhysicalDeviceVulkan11Properties =
  result.sType = vkStructureTypePhysicalDeviceVulkan11Properties
  result.deviceUUID = deviceUUID
  result.driverUUID = driverUUID
  result.deviceLUID = deviceLUID
  result.deviceNodeMask = deviceNodeMask
  result.deviceLUIDValid = deviceLUIDValid
  result.subgroupSize = subgroupSize
  result.subgroupSupportedStages = subgroupSupportedStages
  result.subgroupSupportedOperations = subgroupSupportedOperations
  result.subgroupQuadOperationsInAllStages = subgroupQuadOperationsInAllStages
  result.pointClippingBehavior = pointClippingBehavior
  result.maxMultiviewViewCount = maxMultiviewViewCount
  result.maxMultiviewInstanceIndex = maxMultiviewInstanceIndex
  result.protectedNoFault = protectedNoFault
  result.maxPerSetDescriptors = maxPerSetDescriptors
  result.maxMemoryAllocationSize = maxMemoryAllocationSize


proc mkVkPhysicalDeviceVulkan12Features*(samplerMirrorClampToEdge: VkBool32;
    drawIndirectCount: VkBool32; storageBuffer8BitAccess: VkBool32;
    uniformAndStorageBuffer8BitAccess: VkBool32; storagePushConstant8: VkBool32;
    shaderBufferInt64Atomics: VkBool32; shaderSharedInt64Atomics: VkBool32;
    shaderFloat16: VkBool32; shaderInt8: VkBool32; descriptorIndexing: VkBool32;
    shaderInputAttachmentArrayDynamicIndexing: VkBool32;
    shaderUniformTexelBufferArrayDynamicIndexing: VkBool32;
    shaderStorageTexelBufferArrayDynamicIndexing: VkBool32;
    shaderUniformBufferArrayNonUniformIndexing: VkBool32;
    shaderSampledImageArrayNonUniformIndexing: VkBool32;
    shaderStorageBufferArrayNonUniformIndexing: VkBool32;
    shaderStorageImageArrayNonUniformIndexing: VkBool32;
    shaderInputAttachmentArrayNonUniformIndexing: VkBool32;
    shaderUniformTexelBufferArrayNonUniformIndexing: VkBool32;
    shaderStorageTexelBufferArrayNonUniformIndexing: VkBool32;
    descriptorBindingUniformBufferUpdateAfterBind: VkBool32;
    descriptorBindingSampledImageUpdateAfterBind: VkBool32;
    descriptorBindingStorageImageUpdateAfterBind: VkBool32;
    descriptorBindingStorageBufferUpdateAfterBind: VkBool32;
    descriptorBindingUniformTexelBufferUpdateAfterBind: VkBool32;
    descriptorBindingStorageTexelBufferUpdateAfterBind: VkBool32;
    descriptorBindingUpdateUnusedWhilePending: VkBool32;
    descriptorBindingPartiallyBound: VkBool32;
    descriptorBindingVariableDescriptorCount: VkBool32;
    runtimeDescriptorArray: VkBool32; samplerFilterMinmax: VkBool32;
    scalarBlockLayout: VkBool32; imagelessFramebuffer: VkBool32;
    uniformBufferStandardLayout: VkBool32;
    shaderSubgroupExtendedTypes: VkBool32;
    separateDepthStencilLayouts: VkBool32; hostQueryReset: VkBool32;
    timelineSemaphore: VkBool32; bufferDeviceAddress: VkBool32;
    bufferDeviceAddressCaptureReplay: VkBool32;
    bufferDeviceAddressMultiDevice: VkBool32; vulkanMemoryModel: VkBool32;
    vulkanMemoryModelDeviceScope: VkBool32;
    vulkanMemoryModelAvailabilityVisibilityChains: VkBool32;
    shaderOutputViewportIndex: VkBool32; shaderOutputLayer: VkBool32;
    subgroupBroadcastDynamicId: VkBool32): VkPhysicalDeviceVulkan12Features =
  result.sType = vkStructureTypePhysicalDeviceVulkan12Features
  result.samplerMirrorClampToEdge = samplerMirrorClampToEdge
  result.drawIndirectCount = drawIndirectCount
  result.storageBuffer8BitAccess = storageBuffer8BitAccess
  result.uniformAndStorageBuffer8BitAccess = uniformAndStorageBuffer8BitAccess
  result.storagePushConstant8 = storagePushConstant8
  result.shaderBufferInt64Atomics = shaderBufferInt64Atomics
  result.shaderSharedInt64Atomics = shaderSharedInt64Atomics
  result.shaderFloat16 = shaderFloat16
  result.shaderInt8 = shaderInt8
  result.descriptorIndexing = descriptorIndexing
  result.shaderInputAttachmentArrayDynamicIndexing = shaderInputAttachmentArrayDynamicIndexing
  result.shaderUniformTexelBufferArrayDynamicIndexing = shaderUniformTexelBufferArrayDynamicIndexing
  result.shaderStorageTexelBufferArrayDynamicIndexing = shaderStorageTexelBufferArrayDynamicIndexing
  result.shaderUniformBufferArrayNonUniformIndexing = shaderUniformBufferArrayNonUniformIndexing
  result.shaderSampledImageArrayNonUniformIndexing = shaderSampledImageArrayNonUniformIndexing
  result.shaderStorageBufferArrayNonUniformIndexing = shaderStorageBufferArrayNonUniformIndexing
  result.shaderStorageImageArrayNonUniformIndexing = shaderStorageImageArrayNonUniformIndexing
  result.shaderInputAttachmentArrayNonUniformIndexing = shaderInputAttachmentArrayNonUniformIndexing
  result.shaderUniformTexelBufferArrayNonUniformIndexing = shaderUniformTexelBufferArrayNonUniformIndexing
  result.shaderStorageTexelBufferArrayNonUniformIndexing = shaderStorageTexelBufferArrayNonUniformIndexing
  result.descriptorBindingUniformBufferUpdateAfterBind = descriptorBindingUniformBufferUpdateAfterBind
  result.descriptorBindingSampledImageUpdateAfterBind = descriptorBindingSampledImageUpdateAfterBind
  result.descriptorBindingStorageImageUpdateAfterBind = descriptorBindingStorageImageUpdateAfterBind
  result.descriptorBindingStorageBufferUpdateAfterBind = descriptorBindingStorageBufferUpdateAfterBind
  result.descriptorBindingUniformTexelBufferUpdateAfterBind = descriptorBindingUniformTexelBufferUpdateAfterBind
  result.descriptorBindingStorageTexelBufferUpdateAfterBind = descriptorBindingStorageTexelBufferUpdateAfterBind
  result.descriptorBindingUpdateUnusedWhilePending = descriptorBindingUpdateUnusedWhilePending
  result.descriptorBindingPartiallyBound = descriptorBindingPartiallyBound
  result.descriptorBindingVariableDescriptorCount = descriptorBindingVariableDescriptorCount
  result.runtimeDescriptorArray = runtimeDescriptorArray
  result.samplerFilterMinmax = samplerFilterMinmax
  result.scalarBlockLayout = scalarBlockLayout
  result.imagelessFramebuffer = imagelessFramebuffer
  result.uniformBufferStandardLayout = uniformBufferStandardLayout
  result.shaderSubgroupExtendedTypes = shaderSubgroupExtendedTypes
  result.separateDepthStencilLayouts = separateDepthStencilLayouts
  result.hostQueryReset = hostQueryReset
  result.timelineSemaphore = timelineSemaphore
  result.bufferDeviceAddress = bufferDeviceAddress
  result.bufferDeviceAddressCaptureReplay = bufferDeviceAddressCaptureReplay
  result.bufferDeviceAddressMultiDevice = bufferDeviceAddressMultiDevice
  result.vulkanMemoryModel = vulkanMemoryModel
  result.vulkanMemoryModelDeviceScope = vulkanMemoryModelDeviceScope
  result.vulkanMemoryModelAvailabilityVisibilityChains = vulkanMemoryModelAvailabilityVisibilityChains
  result.shaderOutputViewportIndex = shaderOutputViewportIndex
  result.shaderOutputLayer = shaderOutputLayer
  result.subgroupBroadcastDynamicId = subgroupBroadcastDynamicId


proc mkVkPhysicalDeviceVulkan12Properties*(driverID: VkDriverId;
    driverName: array[0 .. 255, char]; driverInfo: array[0 .. 255, char];
    conformanceVersion: VkConformanceVersion;
    denormBehaviorIndependence: VkShaderFloatControlsIndependence;
    roundingModeIndependence: VkShaderFloatControlsIndependence;
    shaderSignedZeroInfNanPreserveFloat16: VkBool32;
    shaderSignedZeroInfNanPreserveFloat32: VkBool32;
    shaderSignedZeroInfNanPreserveFloat64: VkBool32;
    shaderDenormPreserveFloat16: VkBool32;
    shaderDenormPreserveFloat32: VkBool32;
    shaderDenormPreserveFloat64: VkBool32;
    shaderDenormFlushToZeroFloat16: VkBool32;
    shaderDenormFlushToZeroFloat32: VkBool32;
    shaderDenormFlushToZeroFloat64: VkBool32;
    shaderRoundingModeRTEFloat16: VkBool32;
    shaderRoundingModeRTEFloat32: VkBool32;
    shaderRoundingModeRTEFloat64: VkBool32;
    shaderRoundingModeRTZFloat16: VkBool32;
    shaderRoundingModeRTZFloat32: VkBool32;
    shaderRoundingModeRTZFloat64: VkBool32;
    maxUpdateAfterBindDescriptorsInAllPools: uint32;
    shaderUniformBufferArrayNonUniformIndexingNative: VkBool32;
    shaderSampledImageArrayNonUniformIndexingNative: VkBool32;
    shaderStorageBufferArrayNonUniformIndexingNative: VkBool32;
    shaderStorageImageArrayNonUniformIndexingNative: VkBool32;
    shaderInputAttachmentArrayNonUniformIndexingNative: VkBool32;
    robustBufferAccessUpdateAfterBind: VkBool32;
    quadDivergentImplicitLod: VkBool32;
    maxPerStageDescriptorUpdateAfterBindSamplers: uint32;
    maxPerStageDescriptorUpdateAfterBindUniformBuffers: uint32;
    maxPerStageDescriptorUpdateAfterBindStorageBuffers: uint32;
    maxPerStageDescriptorUpdateAfterBindSampledImages: uint32;
    maxPerStageDescriptorUpdateAfterBindStorageImages: uint32;
    maxPerStageDescriptorUpdateAfterBindInputAttachments: uint32;
    maxPerStageUpdateAfterBindResources: uint32;
    maxDescriptorSetUpdateAfterBindSamplers: uint32;
    maxDescriptorSetUpdateAfterBindUniformBuffers: uint32;
    maxDescriptorSetUpdateAfterBindUniformBuffersDynamic: uint32;
    maxDescriptorSetUpdateAfterBindStorageBuffers: uint32;
    maxDescriptorSetUpdateAfterBindStorageBuffersDynamic: uint32;
    maxDescriptorSetUpdateAfterBindSampledImages: uint32;
    maxDescriptorSetUpdateAfterBindStorageImages: uint32;
    maxDescriptorSetUpdateAfterBindInputAttachments: uint32;
    supportedDepthResolveModes: VkResolveModeFlags;
    supportedStencilResolveModes: VkResolveModeFlags;
    independentResolveNone: VkBool32; independentResolve: VkBool32;
    filterMinmaxSingleComponentFormats: VkBool32;
    filterMinmaxImageComponentMapping: VkBool32;
    maxTimelineSemaphoreValueDifference: uint64;
    framebufferIntegerColorSampleCounts: VkSampleCountFlags): VkPhysicalDeviceVulkan12Properties =
  result.sType = vkStructureTypePhysicalDeviceVulkan12Properties
  result.driverID = driverID
  result.driverName = driverName
  result.driverInfo = driverInfo
  result.conformanceVersion = conformanceVersion
  result.denormBehaviorIndependence = denormBehaviorIndependence
  result.roundingModeIndependence = roundingModeIndependence
  result.shaderSignedZeroInfNanPreserveFloat16 = shaderSignedZeroInfNanPreserveFloat16
  result.shaderSignedZeroInfNanPreserveFloat32 = shaderSignedZeroInfNanPreserveFloat32
  result.shaderSignedZeroInfNanPreserveFloat64 = shaderSignedZeroInfNanPreserveFloat64
  result.shaderDenormPreserveFloat16 = shaderDenormPreserveFloat16
  result.shaderDenormPreserveFloat32 = shaderDenormPreserveFloat32
  result.shaderDenormPreserveFloat64 = shaderDenormPreserveFloat64
  result.shaderDenormFlushToZeroFloat16 = shaderDenormFlushToZeroFloat16
  result.shaderDenormFlushToZeroFloat32 = shaderDenormFlushToZeroFloat32
  result.shaderDenormFlushToZeroFloat64 = shaderDenormFlushToZeroFloat64
  result.shaderRoundingModeRTEFloat16 = shaderRoundingModeRTEFloat16
  result.shaderRoundingModeRTEFloat32 = shaderRoundingModeRTEFloat32
  result.shaderRoundingModeRTEFloat64 = shaderRoundingModeRTEFloat64
  result.shaderRoundingModeRTZFloat16 = shaderRoundingModeRTZFloat16
  result.shaderRoundingModeRTZFloat32 = shaderRoundingModeRTZFloat32
  result.shaderRoundingModeRTZFloat64 = shaderRoundingModeRTZFloat64
  result.maxUpdateAfterBindDescriptorsInAllPools = maxUpdateAfterBindDescriptorsInAllPools
  result.shaderUniformBufferArrayNonUniformIndexingNative = shaderUniformBufferArrayNonUniformIndexingNative
  result.shaderSampledImageArrayNonUniformIndexingNative = shaderSampledImageArrayNonUniformIndexingNative
  result.shaderStorageBufferArrayNonUniformIndexingNative = shaderStorageBufferArrayNonUniformIndexingNative
  result.shaderStorageImageArrayNonUniformIndexingNative = shaderStorageImageArrayNonUniformIndexingNative
  result.shaderInputAttachmentArrayNonUniformIndexingNative = shaderInputAttachmentArrayNonUniformIndexingNative
  result.robustBufferAccessUpdateAfterBind = robustBufferAccessUpdateAfterBind
  result.quadDivergentImplicitLod = quadDivergentImplicitLod
  result.maxPerStageDescriptorUpdateAfterBindSamplers = maxPerStageDescriptorUpdateAfterBindSamplers
  result.maxPerStageDescriptorUpdateAfterBindUniformBuffers = maxPerStageDescriptorUpdateAfterBindUniformBuffers
  result.maxPerStageDescriptorUpdateAfterBindStorageBuffers = maxPerStageDescriptorUpdateAfterBindStorageBuffers
  result.maxPerStageDescriptorUpdateAfterBindSampledImages = maxPerStageDescriptorUpdateAfterBindSampledImages
  result.maxPerStageDescriptorUpdateAfterBindStorageImages = maxPerStageDescriptorUpdateAfterBindStorageImages
  result.maxPerStageDescriptorUpdateAfterBindInputAttachments = maxPerStageDescriptorUpdateAfterBindInputAttachments
  result.maxPerStageUpdateAfterBindResources = maxPerStageUpdateAfterBindResources
  result.maxDescriptorSetUpdateAfterBindSamplers = maxDescriptorSetUpdateAfterBindSamplers
  result.maxDescriptorSetUpdateAfterBindUniformBuffers = maxDescriptorSetUpdateAfterBindUniformBuffers
  result.maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = maxDescriptorSetUpdateAfterBindUniformBuffersDynamic
  result.maxDescriptorSetUpdateAfterBindStorageBuffers = maxDescriptorSetUpdateAfterBindStorageBuffers
  result.maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = maxDescriptorSetUpdateAfterBindStorageBuffersDynamic
  result.maxDescriptorSetUpdateAfterBindSampledImages = maxDescriptorSetUpdateAfterBindSampledImages
  result.maxDescriptorSetUpdateAfterBindStorageImages = maxDescriptorSetUpdateAfterBindStorageImages
  result.maxDescriptorSetUpdateAfterBindInputAttachments = maxDescriptorSetUpdateAfterBindInputAttachments
  result.supportedDepthResolveModes = supportedDepthResolveModes
  result.supportedStencilResolveModes = supportedStencilResolveModes
  result.independentResolveNone = independentResolveNone
  result.independentResolve = independentResolve
  result.filterMinmaxSingleComponentFormats = filterMinmaxSingleComponentFormats
  result.filterMinmaxImageComponentMapping = filterMinmaxImageComponentMapping
  result.maxTimelineSemaphoreValueDifference = maxTimelineSemaphoreValueDifference
  result.framebufferIntegerColorSampleCounts = framebufferIntegerColorSampleCounts


proc mkVkSwapchainCreateInfoKHR*(surface: VkSurfaceKHR; minImageCount: uint32;
                                 imageFormat: VkFormat;
                                 imageColorSpace: VkColorSpaceKHR;
                                 imageExtent: VkExtent2D;
                                 imageArrayLayers: uint32;
                                 imageUsage: VkImageUsageFlags;
                                 imageSharingMode: VkSharingMode;
                                 queueFamilyIndexCount: uint32;
                                 pQueueFamilyIndices: ptr uint32;
                                 preTransform: VkSurfaceTransformFlagBitsKHR;
                                 compositeAlpha: VkCompositeAlphaFlagBitsKHR;
                                 presentMode: VkPresentModeKHR;
                                 clipped: VkBool32; oldSwapchain: VkSwapchainKHR): VkSwapchainCreateInfoKHR =
  result.sType = vkStructureTypeSwapchainCreateInfoKHR
  result.surface = surface
  result.minImageCount = minImageCount
  result.imageFormat = imageFormat
  result.imageColorSpace = imageColorSpace
  result.imageExtent = imageExtent
  result.imageArrayLayers = imageArrayLayers
  result.imageUsage = imageUsage
  result.imageSharingMode = imageSharingMode
  result.queueFamilyIndexCount = queueFamilyIndexCount
  result.pQueueFamilyIndices = pQueueFamilyIndices
  result.preTransform = preTransform
  result.compositeAlpha = compositeAlpha
  result.presentMode = presentMode
  result.clipped = clipped
  result.oldSwapchain = oldSwapchain


proc mkVkPresentInfoKHR*(waitSemaphoreCount: uint32;
                         pWaitSemaphores: ptr VkSemaphore;
                         swapchainCount: uint32;
                         pSwapchains: ptr VkSwapchainKHR;
                         pImageIndices: ptr uint32; pResults: ptr VkResult): VkPresentInfoKHR =
  result.sType = vkStructureTypePresentInfoKHR
  result.waitSemaphoreCount = waitSemaphoreCount
  result.pWaitSemaphores = pWaitSemaphores
  result.swapchainCount = swapchainCount
  result.pSwapchains = pSwapchains
  result.pImageIndices = pImageIndices
  result.pResults = pResults


proc mkVkDisplayModeCreateInfoKHR*(parameters: VkDisplayModeParametersKHR): VkDisplayModeCreateInfoKHR =
  result.sType = vkStructureTypeDisplayModeCreateInfoKHR
  result.parameters = parameters


proc mkVkDisplaySurfaceCreateInfoKHR*(displayMode: VkDisplayModeKHR;
                                      planeIndex: uint32;
                                      planeStackIndex: uint32;
                                      transform: VkSurfaceTransformFlagBitsKHR;
                                      globalAlpha: cfloat; alphaMode: VkDisplayPlaneAlphaFlagBitsKHR;
                                      imageExtent: VkExtent2D): VkDisplaySurfaceCreateInfoKHR =
  result.sType = vkStructureTypeDisplaySurfaceCreateInfoKHR
  result.displayMode = displayMode
  result.planeIndex = planeIndex
  result.planeStackIndex = planeStackIndex
  result.transform = transform
  result.globalAlpha = globalAlpha
  result.alphaMode = alphaMode
  result.imageExtent = imageExtent


proc mkVkDisplayPresentInfoKHR*(srcRect: VkRect2D; dstRect: VkRect2D;
                                persistent: VkBool32): VkDisplayPresentInfoKHR =
  result.sType = vkStructureTypeDisplayPresentInfoKHR
  result.srcRect = srcRect
  result.dstRect = dstRect
  result.persistent = persistent


proc mkVkDebugReportCallbackCreateInfoEXT*(
    pfnCallback: PFNVkdebugreportcallbackext): VkDebugReportCallbackCreateInfoEXT =
  result.sType = vkStructureTypeDebugReportCallbackCreateInfoEXT
  result.pfnCallback = pfnCallback


proc mkVkPipelineRasterizationStateRasterizationOrderAMD*(
    rasterizationOrder: VkRasterizationOrderAMD): VkPipelineRasterizationStateRasterizationOrderAMD =
  result.sType = vkStructureTypePipelineRasterizationStateRasterizationOrderAMD
  result.rasterizationOrder = rasterizationOrder


proc mkVkDebugMarkerObjectNameInfoEXT*(pObjectName: cstring): VkDebugMarkerObjectNameInfoEXT =
  result.sType = vkStructureTypeDebugMarkerObjectNameInfoEXT
  result.pObjectName = pObjectName


proc mkVkDebugMarkerObjectTagInfoEXT*(tagName: uint64; tagSize: csize_t): VkDebugMarkerObjectTagInfoEXT =
  result.sType = vkStructureTypeDebugMarkerObjectTagInfoEXT
  result.tagName = tagName
  result.tagSize = tagSize


proc mkVkDebugMarkerMarkerInfoEXT*(pMarkerName: cstring;
                                   color: array[0 .. 3, cfloat]): VkDebugMarkerMarkerInfoEXT =
  result.sType = vkStructureTypeDebugMarkerMarkerInfoEXT
  result.pMarkerName = pMarkerName
  result.color = color


proc mkVkDedicatedAllocationImageCreateInfoNV*(dedicatedAllocation: VkBool32): VkDedicatedAllocationImageCreateInfoNV =
  result.sType = vkStructureTypeDedicatedAllocationImageCreateInfoNV
  result.dedicatedAllocation = dedicatedAllocation


proc mkVkDedicatedAllocationBufferCreateInfoNV*(dedicatedAllocation: VkBool32): VkDedicatedAllocationBufferCreateInfoNV =
  result.sType = vkStructureTypeDedicatedAllocationBufferCreateInfoNV
  result.dedicatedAllocation = dedicatedAllocation


proc mkVkDedicatedAllocationMemoryAllocateInfoNV*(image: VkImage;
    buffer: VkBuffer): VkDedicatedAllocationMemoryAllocateInfoNV =
  result.sType = vkStructureTypeDedicatedAllocationMemoryAllocateInfoNV
  result.image = image
  result.buffer = buffer


proc mkVkPhysicalDeviceTransformFeedbackFeaturesEXT*(
    transformFeedback: VkBool32; geometryStreams: VkBool32): VkPhysicalDeviceTransformFeedbackFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceTransformFeedbackFeaturesEXT
  result.transformFeedback = transformFeedback
  result.geometryStreams = geometryStreams


proc mkVkPhysicalDeviceTransformFeedbackPropertiesEXT*(
    maxTransformFeedbackStreams: uint32; maxTransformFeedbackBuffers: uint32;
    maxTransformFeedbackBufferSize: VkDeviceSize;
    maxTransformFeedbackStreamDataSize: uint32;
    maxTransformFeedbackBufferDataSize: uint32;
    maxTransformFeedbackBufferDataStride: uint32;
    transformFeedbackQueries: VkBool32;
    transformFeedbackStreamsLinesTriangles: VkBool32;
    transformFeedbackRasterizationStreamSelect: VkBool32;
    transformFeedbackDraw: VkBool32): VkPhysicalDeviceTransformFeedbackPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceTransformFeedbackPropertiesEXT
  result.maxTransformFeedbackStreams = maxTransformFeedbackStreams
  result.maxTransformFeedbackBuffers = maxTransformFeedbackBuffers
  result.maxTransformFeedbackBufferSize = maxTransformFeedbackBufferSize
  result.maxTransformFeedbackStreamDataSize = maxTransformFeedbackStreamDataSize
  result.maxTransformFeedbackBufferDataSize = maxTransformFeedbackBufferDataSize
  result.maxTransformFeedbackBufferDataStride = maxTransformFeedbackBufferDataStride
  result.transformFeedbackQueries = transformFeedbackQueries
  result.transformFeedbackStreamsLinesTriangles = transformFeedbackStreamsLinesTriangles
  result.transformFeedbackRasterizationStreamSelect = transformFeedbackRasterizationStreamSelect
  result.transformFeedbackDraw = transformFeedbackDraw


proc mkVkPipelineRasterizationStateStreamCreateInfoEXT*(
    rasterizationStream: uint32): VkPipelineRasterizationStateStreamCreateInfoEXT =
  result.sType = vkStructureTypePipelineRasterizationStateStreamCreateInfoEXT
  result.rasterizationStream = rasterizationStream


proc mkVkImageViewHandleInfoNVX*(imageView: VkImageView;
                                 descriptorType: VkDescriptorType;
                                 sampler: VkSampler): VkImageViewHandleInfoNVX =
  result.sType = vkStructureTypeImageViewHandleInfoNVX
  result.imageView = imageView
  result.descriptorType = descriptorType
  result.sampler = sampler


proc mkVkImageViewAddressPropertiesNVX*(deviceAddress: VkDeviceAddress;
                                        size: VkDeviceSize): VkImageViewAddressPropertiesNVX =
  result.sType = vkStructureTypeImageViewAddressPropertiesNVX
  result.deviceAddress = deviceAddress
  result.size = size


proc mkVkTextureLODGatherFormatPropertiesAMD*(
    supportsTextureGatherLODBiasAMD: VkBool32): VkTextureLODGatherFormatPropertiesAMD =
  result.sType = vkStructureTypeTextureLODGatherFormatPropertiesAMD
  result.supportsTextureGatherLODBiasAMD = supportsTextureGatherLODBiasAMD


proc mkVkPhysicalDeviceCornerSampledImageFeaturesNV*(
    cornerSampledImage: VkBool32): VkPhysicalDeviceCornerSampledImageFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceCornerSampledImageFeaturesNV
  result.cornerSampledImage = cornerSampledImage


proc mkVkRenderPassMultiviewCreateInfo*(subpassCount: uint32;
                                        pViewMasks: ptr uint32;
                                        dependencyCount: uint32;
                                        pViewOffsets: ptr int32;
                                        correlationMaskCount: uint32;
                                        pCorrelationMasks: ptr uint32): VkRenderPassMultiviewCreateInfo =
  result.sType = vkStructureTypeRenderPassMultiviewCreateInfo
  result.subpassCount = subpassCount
  result.pViewMasks = pViewMasks
  result.dependencyCount = dependencyCount
  result.pViewOffsets = pViewOffsets
  result.correlationMaskCount = correlationMaskCount
  result.pCorrelationMasks = pCorrelationMasks


proc mkVkPhysicalDeviceMultiviewFeatures*(multiview: VkBool32;
    multiviewGeometryShader: VkBool32; multiviewTessellationShader: VkBool32): VkPhysicalDeviceMultiviewFeatures =
  result.sType = vkStructureTypePhysicalDeviceMultiviewFeatures
  result.multiview = multiview
  result.multiviewGeometryShader = multiviewGeometryShader
  result.multiviewTessellationShader = multiviewTessellationShader


proc mkVkPhysicalDeviceMultiviewProperties*(maxMultiviewViewCount: uint32;
    maxMultiviewInstanceIndex: uint32): VkPhysicalDeviceMultiviewProperties =
  result.sType = vkStructureTypePhysicalDeviceMultiviewProperties
  result.maxMultiviewViewCount = maxMultiviewViewCount
  result.maxMultiviewInstanceIndex = maxMultiviewInstanceIndex


proc mkVkExternalMemoryImageCreateInfoNV*(
    handleTypes: VkExternalMemoryHandleTypeFlagsNV): VkExternalMemoryImageCreateInfoNV =
  result.sType = vkStructureTypeExternalMemoryImageCreateInfoNV
  result.handleTypes = handleTypes


proc mkVkExportMemoryAllocateInfoNV*(handleTypes: VkExternalMemoryHandleTypeFlagsNV): VkExportMemoryAllocateInfoNV =
  result.sType = vkStructureTypeExportMemoryAllocateInfoNV
  result.handleTypes = handleTypes


proc mkVkPhysicalDeviceFeatures2*(features: VkPhysicalDeviceFeatures): VkPhysicalDeviceFeatures2 =
  result.sType = vkStructureTypePhysicalDeviceFeatures2
  result.features = features


proc mkVkPhysicalDeviceProperties2*(properties: VkPhysicalDeviceProperties): VkPhysicalDeviceProperties2 =
  result.sType = vkStructureTypePhysicalDeviceProperties2
  result.properties = properties


proc mkVkFormatProperties2*(formatProperties: VkFormatProperties): VkFormatProperties2 =
  result.sType = vkStructureTypeFormatProperties2
  result.formatProperties = formatProperties


proc mkVkImageFormatProperties2*(imageFormatProperties: VkImageFormatProperties): VkImageFormatProperties2 =
  result.sType = vkStructureTypeImageFormatProperties2
  result.imageFormatProperties = imageFormatProperties


proc mkVkPhysicalDeviceImageFormatInfo2*(format: VkFormat; `type`: VkImageType;
    tiling: VkImageTiling; usage: VkImageUsageFlags): VkPhysicalDeviceImageFormatInfo2 =
  result.sType = vkStructureTypePhysicalDeviceImageFormatInfo2
  result.format = format
  result.`type` = `type`
  result.tiling = tiling
  result.usage = usage


proc mkVkQueueFamilyProperties2*(queueFamilyProperties: VkQueueFamilyProperties): VkQueueFamilyProperties2 =
  result.sType = vkStructureTypeQueueFamilyProperties2
  result.queueFamilyProperties = queueFamilyProperties


proc mkVkPhysicalDeviceMemoryProperties2*(
    memoryProperties: VkPhysicalDeviceMemoryProperties): VkPhysicalDeviceMemoryProperties2 =
  result.sType = vkStructureTypePhysicalDeviceMemoryProperties2
  result.memoryProperties = memoryProperties


proc mkVkSparseImageFormatProperties2*(properties: VkSparseImageFormatProperties): VkSparseImageFormatProperties2 =
  result.sType = vkStructureTypeSparseImageFormatProperties2
  result.properties = properties


proc mkVkPhysicalDeviceSparseImageFormatInfo2*(format: VkFormat;
    `type`: VkImageType; samples: VkSampleCountFlagBits; usage: VkImageUsageFlags;
    tiling: VkImageTiling): VkPhysicalDeviceSparseImageFormatInfo2 =
  result.sType = vkStructureTypePhysicalDeviceSparseImageFormatInfo2
  result.format = format
  result.`type` = `type`
  result.samples = samples
  result.usage = usage
  result.tiling = tiling


proc mkVkMemoryAllocateFlagsInfo*(deviceMask: uint32): VkMemoryAllocateFlagsInfo =
  result.sType = vkStructureTypeMemoryAllocateFlagsInfo
  result.deviceMask = deviceMask


proc mkVkDeviceGroupRenderPassBeginInfo*(deviceMask: uint32;
    deviceRenderAreaCount: uint32; pDeviceRenderAreas: ptr VkRect2D): VkDeviceGroupRenderPassBeginInfo =
  result.sType = vkStructureTypeDeviceGroupRenderPassBeginInfo
  result.deviceMask = deviceMask
  result.deviceRenderAreaCount = deviceRenderAreaCount
  result.pDeviceRenderAreas = pDeviceRenderAreas


proc mkVkDeviceGroupCommandBufferBeginInfo*(deviceMask: uint32): VkDeviceGroupCommandBufferBeginInfo =
  result.sType = vkStructureTypeDeviceGroupCommandBufferBeginInfo
  result.deviceMask = deviceMask


proc mkVkDeviceGroupSubmitInfo*(waitSemaphoreCount: uint32;
                                pWaitSemaphoreDeviceIndices: ptr uint32;
                                commandBufferCount: uint32;
                                pCommandBufferDeviceMasks: ptr uint32;
                                signalSemaphoreCount: uint32;
                                pSignalSemaphoreDeviceIndices: ptr uint32): VkDeviceGroupSubmitInfo =
  result.sType = vkStructureTypeDeviceGroupSubmitInfo
  result.waitSemaphoreCount = waitSemaphoreCount
  result.pWaitSemaphoreDeviceIndices = pWaitSemaphoreDeviceIndices
  result.commandBufferCount = commandBufferCount
  result.pCommandBufferDeviceMasks = pCommandBufferDeviceMasks
  result.signalSemaphoreCount = signalSemaphoreCount
  result.pSignalSemaphoreDeviceIndices = pSignalSemaphoreDeviceIndices


proc mkVkDeviceGroupBindSparseInfo*(resourceDeviceIndex: uint32;
                                    memoryDeviceIndex: uint32): VkDeviceGroupBindSparseInfo =
  result.sType = vkStructureTypeDeviceGroupBindSparseInfo
  result.resourceDeviceIndex = resourceDeviceIndex
  result.memoryDeviceIndex = memoryDeviceIndex


proc mkVkDeviceGroupPresentCapabilitiesKHR*(presentMask: array[0 .. 31, uint32];
    modes: VkDeviceGroupPresentModeFlagsKHR): VkDeviceGroupPresentCapabilitiesKHR =
  result.sType = vkStructureTypeDeviceGroupPresentCapabilitiesKHR
  result.presentMask = presentMask
  result.modes = modes


proc mkVkImageSwapchainCreateInfoKHR*(swapchain: VkSwapchainKHR): VkImageSwapchainCreateInfoKHR =
  result.sType = vkStructureTypeImageSwapchainCreateInfoKHR
  result.swapchain = swapchain


proc mkVkBindImageMemorySwapchainInfoKHR*(swapchain: VkSwapchainKHR;
    imageIndex: uint32): VkBindImageMemorySwapchainInfoKHR =
  result.sType = vkStructureTypeBindImageMemorySwapchainInfoKHR
  result.swapchain = swapchain
  result.imageIndex = imageIndex


proc mkVkAcquireNextImageInfoKHR*(swapchain: VkSwapchainKHR; timeout: uint64;
                                  semaphore: VkSemaphore; fence: VkFence;
                                  deviceMask: uint32): VkAcquireNextImageInfoKHR =
  result.sType = vkStructureTypeAcquireNextImageInfoKHR
  result.swapchain = swapchain
  result.timeout = timeout
  result.semaphore = semaphore
  result.fence = fence
  result.deviceMask = deviceMask


proc mkVkDeviceGroupPresentInfoKHR*(swapchainCount: uint32;
                                    pDeviceMasks: ptr uint32;
                                    mode: VkDeviceGroupPresentModeFlagBitsKHR): VkDeviceGroupPresentInfoKHR =
  result.sType = vkStructureTypeDeviceGroupPresentInfoKHR
  result.swapchainCount = swapchainCount
  result.pDeviceMasks = pDeviceMasks
  result.mode = mode


proc mkVkDeviceGroupSwapchainCreateInfoKHR*(
    modes: VkDeviceGroupPresentModeFlagsKHR): VkDeviceGroupSwapchainCreateInfoKHR =
  result.sType = vkStructureTypeDeviceGroupSwapchainCreateInfoKHR
  result.modes = modes


proc mkVkBindBufferMemoryDeviceGroupInfo*(deviceIndexCount: uint32;
    pDeviceIndices: ptr uint32): VkBindBufferMemoryDeviceGroupInfo =
  result.sType = vkStructureTypeBindBufferMemoryDeviceGroupInfo
  result.deviceIndexCount = deviceIndexCount
  result.pDeviceIndices = pDeviceIndices


proc mkVkBindImageMemoryDeviceGroupInfo*(deviceIndexCount: uint32;
    pDeviceIndices: ptr uint32; splitInstanceBindRegionCount: uint32;
    pSplitInstanceBindRegions: ptr VkRect2D): VkBindImageMemoryDeviceGroupInfo =
  result.sType = vkStructureTypeBindImageMemoryDeviceGroupInfo
  result.deviceIndexCount = deviceIndexCount
  result.pDeviceIndices = pDeviceIndices
  result.splitInstanceBindRegionCount = splitInstanceBindRegionCount
  result.pSplitInstanceBindRegions = pSplitInstanceBindRegions


proc mkVkValidationFlagsEXT*(disabledValidationCheckCount: uint32;
    pDisabledValidationChecks: ptr VkValidationCheckEXT): VkValidationFlagsEXT =
  result.sType = vkStructureTypeValidationFlagsEXT
  result.disabledValidationCheckCount = disabledValidationCheckCount
  result.pDisabledValidationChecks = pDisabledValidationChecks


proc mkVkPhysicalDeviceShaderDrawParametersFeatures*(
    shaderDrawParameters: VkBool32): VkPhysicalDeviceShaderDrawParametersFeatures =
  result.sType = vkStructureTypePhysicalDeviceShaderDrawParametersFeatures
  result.shaderDrawParameters = shaderDrawParameters


proc mkVkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT*(
    textureCompressionASTC_HDR: VkBool32): VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceTextureCompressionASTCHDRFeaturesEXT
  result.textureCompressionASTC_HDR = textureCompressionASTC_HDR


proc mkVkImageViewASTCDecodeModeEXT*(decodeMode: VkFormat): VkImageViewASTCDecodeModeEXT =
  result.sType = vkStructureTypeImageViewASTCDecodeModeEXT
  result.decodeMode = decodeMode


proc mkVkPhysicalDeviceASTCDecodeFeaturesEXT*(decodeModeSharedExponent: VkBool32): VkPhysicalDeviceASTCDecodeFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceASTCDecodeFeaturesEXT
  result.decodeModeSharedExponent = decodeModeSharedExponent


proc mkVkPhysicalDeviceGroupProperties*(physicalDeviceCount: uint32;
    physicalDevices: array[0 .. 31, VkPhysicalDevice];
                                        subsetAllocation: VkBool32): VkPhysicalDeviceGroupProperties =
  result.sType = vkStructureTypePhysicalDeviceGroupProperties
  result.physicalDeviceCount = physicalDeviceCount
  result.physicalDevices = physicalDevices
  result.subsetAllocation = subsetAllocation


proc mkVkDeviceGroupDeviceCreateInfo*(physicalDeviceCount: uint32;
                                      pPhysicalDevices: ptr VkPhysicalDevice): VkDeviceGroupDeviceCreateInfo =
  result.sType = vkStructureTypeDeviceGroupDeviceCreateInfo
  result.physicalDeviceCount = physicalDeviceCount
  result.pPhysicalDevices = pPhysicalDevices


proc mkVkPhysicalDeviceExternalImageFormatInfo*(
    handleType: VkExternalMemoryHandleTypeFlagBits): VkPhysicalDeviceExternalImageFormatInfo =
  result.sType = vkStructureTypePhysicalDeviceExternalImageFormatInfo
  result.handleType = handleType


proc mkVkExternalImageFormatProperties*(externalMemoryProperties: VkExternalMemoryProperties): VkExternalImageFormatProperties =
  result.sType = vkStructureTypeExternalImageFormatProperties
  result.externalMemoryProperties = externalMemoryProperties


proc mkVkPhysicalDeviceExternalBufferInfo*(usage: VkBufferUsageFlags;
    handleType: VkExternalMemoryHandleTypeFlagBits): VkPhysicalDeviceExternalBufferInfo =
  result.sType = vkStructureTypePhysicalDeviceExternalBufferInfo
  result.usage = usage
  result.handleType = handleType


proc mkVkExternalBufferProperties*(externalMemoryProperties: VkExternalMemoryProperties): VkExternalBufferProperties =
  result.sType = vkStructureTypeExternalBufferProperties
  result.externalMemoryProperties = externalMemoryProperties


proc mkVkPhysicalDeviceIDProperties*(deviceUUID: array[0 .. 15, uint8];
                                     driverUUID: array[0 .. 15, uint8];
                                     deviceLUID: array[0 .. 7, uint8];
                                     deviceNodeMask: uint32;
                                     deviceLUIDValid: VkBool32): VkPhysicalDeviceIDProperties =
  result.sType = vkStructureTypePhysicalDeviceIDProperties
  result.deviceUUID = deviceUUID
  result.driverUUID = driverUUID
  result.deviceLUID = deviceLUID
  result.deviceNodeMask = deviceNodeMask
  result.deviceLUIDValid = deviceLUIDValid


proc mkVkExternalMemoryBufferCreateInfo*(
    handleTypes: VkExternalMemoryHandleTypeFlags): VkExternalMemoryBufferCreateInfo =
  result.sType = vkStructureTypeExternalMemoryBufferCreateInfo
  result.handleTypes = handleTypes


proc mkVkExternalMemoryImageCreateInfo*(handleTypes: VkExternalMemoryHandleTypeFlags): VkExternalMemoryImageCreateInfo =
  result.sType = vkStructureTypeExternalMemoryImageCreateInfo
  result.handleTypes = handleTypes


proc mkVkExportMemoryAllocateInfo*(handleTypes: VkExternalMemoryHandleTypeFlags): VkExportMemoryAllocateInfo =
  result.sType = vkStructureTypeExportMemoryAllocateInfo
  result.handleTypes = handleTypes


proc mkVkImportMemoryFdInfoKHR*(handleType: VkExternalMemoryHandleTypeFlagBits;
                                fd: cint): VkImportMemoryFdInfoKHR =
  result.sType = vkStructureTypeImportMemoryFdInfoKHR
  result.handleType = handleType
  result.fd = fd


proc mkVkMemoryFdPropertiesKHR*(memoryTypeBits: uint32): VkMemoryFdPropertiesKHR =
  result.sType = vkStructureTypeMemoryFdPropertiesKHR
  result.memoryTypeBits = memoryTypeBits


proc mkVkMemoryGetFdInfoKHR*(memory: VkDeviceMemory;
                             handleType: VkExternalMemoryHandleTypeFlagBits): VkMemoryGetFdInfoKHR =
  result.sType = vkStructureTypeMemoryGetFdInfoKHR
  result.memory = memory
  result.handleType = handleType


proc mkVkPhysicalDeviceExternalSemaphoreInfo*(
    handleType: VkExternalSemaphoreHandleTypeFlagBits): VkPhysicalDeviceExternalSemaphoreInfo =
  result.sType = vkStructureTypePhysicalDeviceExternalSemaphoreInfo
  result.handleType = handleType


proc mkVkExternalSemaphoreProperties*(exportFromImportedHandleTypes: VkExternalSemaphoreHandleTypeFlags;
    compatibleHandleTypes: VkExternalSemaphoreHandleTypeFlags;
    externalSemaphoreFeatures: VkExternalSemaphoreFeatureFlags): VkExternalSemaphoreProperties =
  result.sType = vkStructureTypeExternalSemaphoreProperties
  result.exportFromImportedHandleTypes = exportFromImportedHandleTypes
  result.compatibleHandleTypes = compatibleHandleTypes
  result.externalSemaphoreFeatures = externalSemaphoreFeatures


proc mkVkExportSemaphoreCreateInfo*(handleTypes: VkExternalSemaphoreHandleTypeFlags): VkExportSemaphoreCreateInfo =
  result.sType = vkStructureTypeExportSemaphoreCreateInfo
  result.handleTypes = handleTypes


proc mkVkImportSemaphoreFdInfoKHR*(semaphore: VkSemaphore; handleType: VkExternalSemaphoreHandleTypeFlagBits;
                                   fd: cint): VkImportSemaphoreFdInfoKHR =
  result.sType = vkStructureTypeImportSemaphoreFdInfoKHR
  result.semaphore = semaphore
  result.handleType = handleType
  result.fd = fd


proc mkVkSemaphoreGetFdInfoKHR*(semaphore: VkSemaphore; handleType: VkExternalSemaphoreHandleTypeFlagBits): VkSemaphoreGetFdInfoKHR =
  result.sType = vkStructureTypeSemaphoreGetFdInfoKHR
  result.semaphore = semaphore
  result.handleType = handleType


proc mkVkPhysicalDevicePushDescriptorPropertiesKHR*(maxPushDescriptors: uint32): VkPhysicalDevicePushDescriptorPropertiesKHR =
  result.sType = vkStructureTypePhysicalDevicePushDescriptorPropertiesKHR
  result.maxPushDescriptors = maxPushDescriptors


proc mkVkCommandBufferInheritanceConditionalRenderingInfoEXT*(
    conditionalRenderingEnable: VkBool32): VkCommandBufferInheritanceConditionalRenderingInfoEXT =
  result.sType = vkStructureTypeCommandBufferInheritanceConditionalRenderingInfoEXT
  result.conditionalRenderingEnable = conditionalRenderingEnable


proc mkVkPhysicalDeviceConditionalRenderingFeaturesEXT*(
    conditionalRendering: VkBool32; inheritedConditionalRendering: VkBool32): VkPhysicalDeviceConditionalRenderingFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceConditionalRenderingFeaturesEXT
  result.conditionalRendering = conditionalRendering
  result.inheritedConditionalRendering = inheritedConditionalRendering


proc mkVkConditionalRenderingBeginInfoEXT*(buffer: VkBuffer;
    offset: VkDeviceSize): VkConditionalRenderingBeginInfoEXT =
  result.sType = vkStructureTypeConditionalRenderingBeginInfoEXT
  result.buffer = buffer
  result.offset = offset


proc mkVkPhysicalDeviceShaderFloat16Int8Features*(shaderFloat16: VkBool32;
    shaderInt8: VkBool32): VkPhysicalDeviceShaderFloat16Int8Features =
  result.sType = vkStructureTypePhysicalDeviceShaderFloat16Int8Features
  result.shaderFloat16 = shaderFloat16
  result.shaderInt8 = shaderInt8


proc mkVkPhysicalDevice16BitStorageFeatures*(storageBuffer16BitAccess: VkBool32;
    uniformAndStorageBuffer16BitAccess: VkBool32;
    storagePushConstant16: VkBool32; storageInputOutput16: VkBool32): VkPhysicalDevice16BitStorageFeatures =
  result.sType = vkStructureTypePhysicalDevice16BitStorageFeatures
  result.storageBuffer16BitAccess = storageBuffer16BitAccess
  result.uniformAndStorageBuffer16BitAccess = uniformAndStorageBuffer16BitAccess
  result.storagePushConstant16 = storagePushConstant16
  result.storageInputOutput16 = storageInputOutput16


proc mkVkPresentRegionsKHR*(swapchainCount: uint32;
                            pRegions: ptr VkPresentRegionKHR): VkPresentRegionsKHR =
  result.sType = vkStructureTypePresentRegionsKHR
  result.swapchainCount = swapchainCount
  result.pRegions = pRegions


proc mkVkDescriptorUpdateTemplateCreateInfo*(descriptorUpdateEntryCount: uint32;
    pDescriptorUpdateEntries: ptr VkDescriptorUpdateTemplateEntry;
    templateType: VkDescriptorUpdateTemplateType;
    descriptorSetLayout: VkDescriptorSetLayout;
    pipelineBindPoint: VkPipelineBindPoint; pipelineLayout: VkPipelineLayout;
    set: uint32): VkDescriptorUpdateTemplateCreateInfo =
  result.sType = vkStructureTypeDescriptorUpdateTemplateCreateInfo
  result.descriptorUpdateEntryCount = descriptorUpdateEntryCount
  result.pDescriptorUpdateEntries = pDescriptorUpdateEntries
  result.templateType = templateType
  result.descriptorSetLayout = descriptorSetLayout
  result.pipelineBindPoint = pipelineBindPoint
  result.pipelineLayout = pipelineLayout
  result.set = set


proc mkVkPipelineViewportWScalingStateCreateInfoNV*(
    viewportWScalingEnable: VkBool32; viewportCount: uint32;
    pViewportWScalings: ptr VkViewportWScalingNV): VkPipelineViewportWScalingStateCreateInfoNV =
  result.sType = vkStructureTypePipelineViewportWScalingStateCreateInfoNV
  result.viewportWScalingEnable = viewportWScalingEnable
  result.viewportCount = viewportCount
  result.pViewportWScalings = pViewportWScalings


proc mkVkSurfaceCapabilities2EXT*(minImageCount: uint32; maxImageCount: uint32;
                                  currentExtent: VkExtent2D;
                                  minImageExtent: VkExtent2D;
                                  maxImageExtent: VkExtent2D;
                                  maxImageArrayLayers: uint32;
    supportedTransforms: VkSurfaceTransformFlagsKHR; currentTransform: VkSurfaceTransformFlagBitsKHR;
    supportedCompositeAlpha: VkCompositeAlphaFlagsKHR;
                                  supportedUsageFlags: VkImageUsageFlags;
    supportedSurfaceCounters: VkSurfaceCounterFlagsEXT): VkSurfaceCapabilities2EXT =
  result.sType = vkStructureTypeSurfaceCapabilities2EXT
  result.minImageCount = minImageCount
  result.maxImageCount = maxImageCount
  result.currentExtent = currentExtent
  result.minImageExtent = minImageExtent
  result.maxImageExtent = maxImageExtent
  result.maxImageArrayLayers = maxImageArrayLayers
  result.supportedTransforms = supportedTransforms
  result.currentTransform = currentTransform
  result.supportedCompositeAlpha = supportedCompositeAlpha
  result.supportedUsageFlags = supportedUsageFlags
  result.supportedSurfaceCounters = supportedSurfaceCounters


proc mkVkDisplayPowerInfoEXT*(powerState: VkDisplayPowerStateEXT): VkDisplayPowerInfoEXT =
  result.sType = vkStructureTypeDisplayPowerInfoEXT
  result.powerState = powerState


proc mkVkDeviceEventInfoEXT*(deviceEvent: VkDeviceEventTypeEXT): VkDeviceEventInfoEXT =
  result.sType = vkStructureTypeDeviceEventInfoEXT
  result.deviceEvent = deviceEvent


proc mkVkDisplayEventInfoEXT*(displayEvent: VkDisplayEventTypeEXT): VkDisplayEventInfoEXT =
  result.sType = vkStructureTypeDisplayEventInfoEXT
  result.displayEvent = displayEvent


proc mkVkSwapchainCounterCreateInfoEXT*(surfaceCounters: VkSurfaceCounterFlagsEXT): VkSwapchainCounterCreateInfoEXT =
  result.sType = vkStructureTypeSwapchainCounterCreateInfoEXT
  result.surfaceCounters = surfaceCounters


proc mkVkPresentTimesInfoGOOGLE*(swapchainCount: uint32;
                                 pTimes: ptr VkPresentTimeGOOGLE): VkPresentTimesInfoGOOGLE =
  result.sType = vkStructureTypePresentTimesInfoGOOGLE
  result.swapchainCount = swapchainCount
  result.pTimes = pTimes


proc mkVkPhysicalDeviceSubgroupProperties*(subgroupSize: uint32;
    supportedStages: VkShaderStageFlags;
    supportedOperations: VkSubgroupFeatureFlags;
    quadOperationsInAllStages: VkBool32): VkPhysicalDeviceSubgroupProperties =
  result.sType = vkStructureTypePhysicalDeviceSubgroupProperties
  result.subgroupSize = subgroupSize
  result.supportedStages = supportedStages
  result.supportedOperations = supportedOperations
  result.quadOperationsInAllStages = quadOperationsInAllStages


proc mkVkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX*(
    perViewPositionAllComponents: VkBool32): VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX =
  result.sType = vkStructureTypePhysicalDeviceMultiviewPerViewAttributesPropertiesNVX
  result.perViewPositionAllComponents = perViewPositionAllComponents


proc mkVkPipelineViewportSwizzleStateCreateInfoNV*(viewportCount: uint32;
    pViewportSwizzles: ptr VkViewportSwizzleNV): VkPipelineViewportSwizzleStateCreateInfoNV =
  result.sType = vkStructureTypePipelineViewportSwizzleStateCreateInfoNV
  result.viewportCount = viewportCount
  result.pViewportSwizzles = pViewportSwizzles


proc mkVkPhysicalDeviceDiscardRectanglePropertiesEXT*(
    maxDiscardRectangles: uint32): VkPhysicalDeviceDiscardRectanglePropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceDiscardRectanglePropertiesEXT
  result.maxDiscardRectangles = maxDiscardRectangles


proc mkVkPipelineDiscardRectangleStateCreateInfoEXT*(
    discardRectangleMode: VkDiscardRectangleModeEXT;
    discardRectangleCount: uint32; pDiscardRectangles: ptr VkRect2D): VkPipelineDiscardRectangleStateCreateInfoEXT =
  result.sType = vkStructureTypePipelineDiscardRectangleStateCreateInfoEXT
  result.discardRectangleMode = discardRectangleMode
  result.discardRectangleCount = discardRectangleCount
  result.pDiscardRectangles = pDiscardRectangles


proc mkVkPhysicalDeviceConservativeRasterizationPropertiesEXT*(
    primitiveOverestimationSize: cfloat;
    maxExtraPrimitiveOverestimationSize: cfloat;
    extraPrimitiveOverestimationSizeGranularity: cfloat;
    primitiveUnderestimation: VkBool32;
    conservativePointAndLineRasterization: VkBool32;
    degenerateTrianglesRasterized: VkBool32;
    degenerateLinesRasterized: VkBool32;
    fullyCoveredFragmentShaderInputVariable: VkBool32;
    conservativeRasterizationPostDepthCoverage: VkBool32): VkPhysicalDeviceConservativeRasterizationPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceConservativeRasterizationPropertiesEXT
  result.primitiveOverestimationSize = primitiveOverestimationSize
  result.maxExtraPrimitiveOverestimationSize = maxExtraPrimitiveOverestimationSize
  result.extraPrimitiveOverestimationSizeGranularity = extraPrimitiveOverestimationSizeGranularity
  result.primitiveUnderestimation = primitiveUnderestimation
  result.conservativePointAndLineRasterization = conservativePointAndLineRasterization
  result.degenerateTrianglesRasterized = degenerateTrianglesRasterized
  result.degenerateLinesRasterized = degenerateLinesRasterized
  result.fullyCoveredFragmentShaderInputVariable = fullyCoveredFragmentShaderInputVariable
  result.conservativeRasterizationPostDepthCoverage = conservativeRasterizationPostDepthCoverage


proc mkVkPipelineRasterizationConservativeStateCreateInfoEXT*(
    conservativeRasterizationMode: VkConservativeRasterizationModeEXT;
    extraPrimitiveOverestimationSize: cfloat): VkPipelineRasterizationConservativeStateCreateInfoEXT =
  result.sType = vkStructureTypePipelineRasterizationConservativeStateCreateInfoEXT
  result.conservativeRasterizationMode = conservativeRasterizationMode
  result.extraPrimitiveOverestimationSize = extraPrimitiveOverestimationSize


proc mkVkPhysicalDeviceDepthClipEnableFeaturesEXT*(depthClipEnable: VkBool32): VkPhysicalDeviceDepthClipEnableFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceDepthClipEnableFeaturesEXT
  result.depthClipEnable = depthClipEnable


proc mkVkPipelineRasterizationDepthClipStateCreateInfoEXT*(
    depthClipEnable: VkBool32): VkPipelineRasterizationDepthClipStateCreateInfoEXT =
  result.sType = vkStructureTypePipelineRasterizationDepthClipStateCreateInfoEXT
  result.depthClipEnable = depthClipEnable


proc mkVkHdrMetadataEXT*(displayPrimaryRed: VkXYColorEXT;
                         displayPrimaryGreen: VkXYColorEXT;
                         displayPrimaryBlue: VkXYColorEXT;
                         whitePoint: VkXYColorEXT; maxLuminance: cfloat;
                         minLuminance: cfloat; maxContentLightLevel: cfloat;
                         maxFrameAverageLightLevel: cfloat): VkHdrMetadataEXT =
  result.sType = vkStructureTypeHdrMetadataEXT
  result.displayPrimaryRed = displayPrimaryRed
  result.displayPrimaryGreen = displayPrimaryGreen
  result.displayPrimaryBlue = displayPrimaryBlue
  result.whitePoint = whitePoint
  result.maxLuminance = maxLuminance
  result.minLuminance = minLuminance
  result.maxContentLightLevel = maxContentLightLevel
  result.maxFrameAverageLightLevel = maxFrameAverageLightLevel


proc mkVkPhysicalDeviceImagelessFramebufferFeatures*(
    imagelessFramebuffer: VkBool32): VkPhysicalDeviceImagelessFramebufferFeatures =
  result.sType = vkStructureTypePhysicalDeviceImagelessFramebufferFeatures
  result.imagelessFramebuffer = imagelessFramebuffer


proc mkVkFramebufferAttachmentsCreateInfo*(attachmentImageInfoCount: uint32;
    pAttachmentImageInfos: ptr VkFramebufferAttachmentImageInfo): VkFramebufferAttachmentsCreateInfo =
  result.sType = vkStructureTypeFramebufferAttachmentsCreateInfo
  result.attachmentImageInfoCount = attachmentImageInfoCount
  result.pAttachmentImageInfos = pAttachmentImageInfos


proc mkVkFramebufferAttachmentImageInfo*(usage: VkImageUsageFlags;
    width: uint32; height: uint32; layerCount: uint32; viewFormatCount: uint32;
    pViewFormats: ptr VkFormat): VkFramebufferAttachmentImageInfo =
  result.sType = vkStructureTypeFramebufferAttachmentImageInfo
  result.usage = usage
  result.width = width
  result.height = height
  result.layerCount = layerCount
  result.viewFormatCount = viewFormatCount
  result.pViewFormats = pViewFormats


proc mkVkRenderPassAttachmentBeginInfo*(attachmentCount: uint32;
                                        pAttachments: ptr VkImageView): VkRenderPassAttachmentBeginInfo =
  result.sType = vkStructureTypeRenderPassAttachmentBeginInfo
  result.attachmentCount = attachmentCount
  result.pAttachments = pAttachments


proc mkVkAttachmentDescription2*(format: VkFormat;
                                 samples: VkSampleCountFlagBits;
                                 loadOp: VkAttachmentLoadOp;
                                 storeOp: VkAttachmentStoreOp;
                                 stencilLoadOp: VkAttachmentLoadOp;
                                 stencilStoreOp: VkAttachmentStoreOp;
                                 initialLayout: VkImageLayout;
                                 finalLayout: VkImageLayout): VkAttachmentDescription2 =
  result.sType = vkStructureTypeAttachmentDescription2
  result.format = format
  result.samples = samples
  result.loadOp = loadOp
  result.storeOp = storeOp
  result.stencilLoadOp = stencilLoadOp
  result.stencilStoreOp = stencilStoreOp
  result.initialLayout = initialLayout
  result.finalLayout = finalLayout


proc mkVkAttachmentReference2*(attachment: uint32; layout: VkImageLayout;
                               aspectMask: VkImageAspectFlags): VkAttachmentReference2 =
  result.sType = vkStructureTypeAttachmentReference2
  result.attachment = attachment
  result.layout = layout
  result.aspectMask = aspectMask


proc mkVkSubpassDescription2*(pipelineBindPoint: VkPipelineBindPoint;
                              viewMask: uint32; inputAttachmentCount: uint32;
                              pInputAttachments: ptr VkAttachmentReference2;
                              colorAttachmentCount: uint32;
                              pColorAttachments: ptr VkAttachmentReference2;
                              pResolveAttachments: ptr VkAttachmentReference2;
    pDepthStencilAttachment: ptr VkAttachmentReference2;
                              preserveAttachmentCount: uint32;
                              pPreserveAttachments: ptr uint32): VkSubpassDescription2 =
  result.sType = vkStructureTypeSubpassDescription2
  result.pipelineBindPoint = pipelineBindPoint
  result.viewMask = viewMask
  result.inputAttachmentCount = inputAttachmentCount
  result.pInputAttachments = pInputAttachments
  result.colorAttachmentCount = colorAttachmentCount
  result.pColorAttachments = pColorAttachments
  result.pResolveAttachments = pResolveAttachments
  result.pDepthStencilAttachment = pDepthStencilAttachment
  result.preserveAttachmentCount = preserveAttachmentCount
  result.pPreserveAttachments = pPreserveAttachments


proc mkVkSubpassDependency2*(srcSubpass: uint32; dstSubpass: uint32;
                             srcStageMask: VkPipelineStageFlags;
                             dstStageMask: VkPipelineStageFlags;
                             srcAccessMask: VkAccessFlags;
                             dstAccessMask: VkAccessFlags;
                             dependencyFlags: VkDependencyFlags;
                             viewOffset: int32): VkSubpassDependency2 =
  result.sType = vkStructureTypeSubpassDependency2
  result.srcSubpass = srcSubpass
  result.dstSubpass = dstSubpass
  result.srcStageMask = srcStageMask
  result.dstStageMask = dstStageMask
  result.srcAccessMask = srcAccessMask
  result.dstAccessMask = dstAccessMask
  result.dependencyFlags = dependencyFlags
  result.viewOffset = viewOffset


proc mkVkRenderPassCreateInfo2*(attachmentCount: uint32;
                                pAttachments: ptr VkAttachmentDescription2;
                                subpassCount: uint32;
                                pSubpasses: ptr VkSubpassDescription2;
                                dependencyCount: uint32;
                                pDependencies: ptr VkSubpassDependency2;
                                correlatedViewMaskCount: uint32;
                                pCorrelatedViewMasks: ptr uint32): VkRenderPassCreateInfo2 =
  result.sType = vkStructureTypeRenderPassCreateInfo2
  result.attachmentCount = attachmentCount
  result.pAttachments = pAttachments
  result.subpassCount = subpassCount
  result.pSubpasses = pSubpasses
  result.dependencyCount = dependencyCount
  result.pDependencies = pDependencies
  result.correlatedViewMaskCount = correlatedViewMaskCount
  result.pCorrelatedViewMasks = pCorrelatedViewMasks


proc mkVkSubpassBeginInfo*(contents: VkSubpassContents): VkSubpassBeginInfo =
  result.sType = vkStructureTypeSubpassBeginInfo
  result.contents = contents


proc mkVkSubpassEndInfo*(): VkSubpassEndInfo =
  result.sType = vkStructureTypeSubpassEndInfo


proc mkVkSharedPresentSurfaceCapabilitiesKHR*(
    sharedPresentSupportedUsageFlags: VkImageUsageFlags): VkSharedPresentSurfaceCapabilitiesKHR =
  result.sType = vkStructureTypeSharedPresentSurfaceCapabilitiesKHR
  result.sharedPresentSupportedUsageFlags = sharedPresentSupportedUsageFlags


proc mkVkPhysicalDeviceExternalFenceInfo*(
    handleType: VkExternalFenceHandleTypeFlagBits): VkPhysicalDeviceExternalFenceInfo =
  result.sType = vkStructureTypePhysicalDeviceExternalFenceInfo
  result.handleType = handleType


proc mkVkExternalFenceProperties*(exportFromImportedHandleTypes: VkExternalFenceHandleTypeFlags;
    compatibleHandleTypes: VkExternalFenceHandleTypeFlags; externalFenceFeatures: VkExternalFenceFeatureFlags): VkExternalFenceProperties =
  result.sType = vkStructureTypeExternalFenceProperties
  result.exportFromImportedHandleTypes = exportFromImportedHandleTypes
  result.compatibleHandleTypes = compatibleHandleTypes
  result.externalFenceFeatures = externalFenceFeatures


proc mkVkExportFenceCreateInfo*(handleTypes: VkExternalFenceHandleTypeFlags): VkExportFenceCreateInfo =
  result.sType = vkStructureTypeExportFenceCreateInfo
  result.handleTypes = handleTypes


proc mkVkImportFenceFdInfoKHR*(fence: VkFence;
                               handleType: VkExternalFenceHandleTypeFlagBits;
                               fd: cint): VkImportFenceFdInfoKHR =
  result.sType = vkStructureTypeImportFenceFdInfoKHR
  result.fence = fence
  result.handleType = handleType
  result.fd = fd


proc mkVkFenceGetFdInfoKHR*(fence: VkFence;
                            handleType: VkExternalFenceHandleTypeFlagBits): VkFenceGetFdInfoKHR =
  result.sType = vkStructureTypeFenceGetFdInfoKHR
  result.fence = fence
  result.handleType = handleType


proc mkVkPhysicalDevicePerformanceQueryFeaturesKHR*(
    performanceCounterQueryPools: VkBool32;
    performanceCounterMultipleQueryPools: VkBool32): VkPhysicalDevicePerformanceQueryFeaturesKHR =
  result.sType = vkStructureTypePhysicalDevicePerformanceQueryFeaturesKHR
  result.performanceCounterQueryPools = performanceCounterQueryPools
  result.performanceCounterMultipleQueryPools = performanceCounterMultipleQueryPools


proc mkVkPhysicalDevicePerformanceQueryPropertiesKHR*(
    allowCommandBufferQueryCopies: VkBool32): VkPhysicalDevicePerformanceQueryPropertiesKHR =
  result.sType = vkStructureTypePhysicalDevicePerformanceQueryPropertiesKHR
  result.allowCommandBufferQueryCopies = allowCommandBufferQueryCopies


proc mkVkQueryPoolPerformanceCreateInfoKHR*(queueFamilyIndex: uint32;
    counterIndexCount: uint32; pCounterIndices: ptr uint32): VkQueryPoolPerformanceCreateInfoKHR =
  result.sType = vkStructureTypeQueryPoolPerformanceCreateInfoKHR
  result.queueFamilyIndex = queueFamilyIndex
  result.counterIndexCount = counterIndexCount
  result.pCounterIndices = pCounterIndices


proc mkVkPerformanceQuerySubmitInfoKHR*(counterPassIndex: uint32): VkPerformanceQuerySubmitInfoKHR =
  result.sType = vkStructureTypePerformanceQuerySubmitInfoKHR
  result.counterPassIndex = counterPassIndex


proc mkVkAcquireProfilingLockInfoKHR*(timeout: uint64): VkAcquireProfilingLockInfoKHR =
  result.sType = vkStructureTypeAcquireProfilingLockInfoKHR
  result.timeout = timeout


proc mkVkPerformanceCounterKHR*(unit: VkPerformanceCounterUnitKHR;
                                scope: VkPerformanceCounterScopeKHR;
                                storage: VkPerformanceCounterStorageKHR;
                                uuid: array[0 .. 15, uint8]): VkPerformanceCounterKHR =
  result.sType = vkStructureTypePerformanceCounterKHR
  result.unit = unit
  result.scope = scope
  result.storage = storage
  result.uuid = uuid


proc mkVkPerformanceCounterDescriptionKHR*(name: array[0 .. 255, char];
    category: array[0 .. 255, char]; description: array[0 .. 255, char]): VkPerformanceCounterDescriptionKHR =
  result.sType = vkStructureTypePerformanceCounterDescriptionKHR
  result.name = name
  result.category = category
  result.description = description


proc mkVkPhysicalDevicePointClippingProperties*(
    pointClippingBehavior: VkPointClippingBehavior): VkPhysicalDevicePointClippingProperties =
  result.sType = vkStructureTypePhysicalDevicePointClippingProperties
  result.pointClippingBehavior = pointClippingBehavior


proc mkVkRenderPassInputAttachmentAspectCreateInfo*(
    aspectReferenceCount: uint32;
    pAspectReferences: ptr VkInputAttachmentAspectReference): VkRenderPassInputAttachmentAspectCreateInfo =
  result.sType = vkStructureTypeRenderPassInputAttachmentAspectCreateInfo
  result.aspectReferenceCount = aspectReferenceCount
  result.pAspectReferences = pAspectReferences


proc mkVkImageViewUsageCreateInfo*(usage: VkImageUsageFlags): VkImageViewUsageCreateInfo =
  result.sType = vkStructureTypeImageViewUsageCreateInfo
  result.usage = usage


proc mkVkPipelineTessellationDomainOriginStateCreateInfo*(
    domainOrigin: VkTessellationDomainOrigin): VkPipelineTessellationDomainOriginStateCreateInfo =
  result.sType = vkStructureTypePipelineTessellationDomainOriginStateCreateInfo
  result.domainOrigin = domainOrigin


proc mkVkPhysicalDeviceSurfaceInfo2KHR*(surface: VkSurfaceKHR): VkPhysicalDeviceSurfaceInfo2KHR =
  result.sType = vkStructureTypePhysicalDeviceSurfaceInfo2KHR
  result.surface = surface


proc mkVkSurfaceCapabilities2KHR*(surfaceCapabilities: VkSurfaceCapabilitiesKHR): VkSurfaceCapabilities2KHR =
  result.sType = vkStructureTypeSurfaceCapabilities2KHR
  result.surfaceCapabilities = surfaceCapabilities


proc mkVkSurfaceFormat2KHR*(surfaceFormat: VkSurfaceFormatKHR): VkSurfaceFormat2KHR =
  result.sType = vkStructureTypeSurfaceFormat2KHR
  result.surfaceFormat = surfaceFormat


proc mkVkPhysicalDeviceVariablePointersFeatures*(
    variablePointersStorageBuffer: VkBool32; variablePointers: VkBool32): VkPhysicalDeviceVariablePointersFeatures =
  result.sType = vkStructureTypePhysicalDeviceVariablePointersFeatures
  result.variablePointersStorageBuffer = variablePointersStorageBuffer
  result.variablePointers = variablePointers


proc mkVkDisplayProperties2KHR*(displayProperties: VkDisplayPropertiesKHR): VkDisplayProperties2KHR =
  result.sType = vkStructureTypeDisplayProperties2KHR
  result.displayProperties = displayProperties


proc mkVkDisplayPlaneProperties2KHR*(displayPlaneProperties: VkDisplayPlanePropertiesKHR): VkDisplayPlaneProperties2KHR =
  result.sType = vkStructureTypeDisplayPlaneProperties2KHR
  result.displayPlaneProperties = displayPlaneProperties


proc mkVkDisplayModeProperties2KHR*(displayModeProperties: VkDisplayModePropertiesKHR): VkDisplayModeProperties2KHR =
  result.sType = vkStructureTypeDisplayModeProperties2KHR
  result.displayModeProperties = displayModeProperties


proc mkVkDisplayPlaneInfo2KHR*(mode: VkDisplayModeKHR; planeIndex: uint32): VkDisplayPlaneInfo2KHR =
  result.sType = vkStructureTypeDisplayPlaneInfo2KHR
  result.mode = mode
  result.planeIndex = planeIndex


proc mkVkDisplayPlaneCapabilities2KHR*(capabilities: VkDisplayPlaneCapabilitiesKHR): VkDisplayPlaneCapabilities2KHR =
  result.sType = vkStructureTypeDisplayPlaneCapabilities2KHR
  result.capabilities = capabilities


proc mkVkMemoryDedicatedRequirements*(prefersDedicatedAllocation: VkBool32;
                                      requiresDedicatedAllocation: VkBool32): VkMemoryDedicatedRequirements =
  result.sType = vkStructureTypeMemoryDedicatedRequirements
  result.prefersDedicatedAllocation = prefersDedicatedAllocation
  result.requiresDedicatedAllocation = requiresDedicatedAllocation


proc mkVkMemoryDedicatedAllocateInfo*(image: VkImage; buffer: VkBuffer): VkMemoryDedicatedAllocateInfo =
  result.sType = vkStructureTypeMemoryDedicatedAllocateInfo
  result.image = image
  result.buffer = buffer


proc mkVkDebugUtilsObjectNameInfoEXT*(pObjectName: cstring): VkDebugUtilsObjectNameInfoEXT =
  result.sType = vkStructureTypeDebugUtilsObjectNameInfoEXT
  result.pObjectName = pObjectName


proc mkVkDebugUtilsObjectTagInfoEXT*(tagName: uint64; tagSize: csize_t): VkDebugUtilsObjectTagInfoEXT =
  result.sType = vkStructureTypeDebugUtilsObjectTagInfoEXT
  result.tagName = tagName
  result.tagSize = tagSize


proc mkVkDebugUtilsLabelEXT*(pLabelName: cstring; color: array[0 .. 3, cfloat]): VkDebugUtilsLabelEXT =
  result.sType = vkStructureTypeDebugUtilsLabelEXT
  result.pLabelName = pLabelName
  result.color = color


proc mkVkDebugUtilsMessengerCallbackDataEXT*(pMessageIdName: cstring;
    messageIdNumber: int32; pMessage: cstring; queueLabelCount: uint32;
    pQueueLabels: ptr VkDebugUtilsLabelEXT; cmdBufLabelCount: uint32;
    pCmdBufLabels: ptr VkDebugUtilsLabelEXT;
    pObjects: ptr VkDebugUtilsObjectNameInfoEXT): VkDebugUtilsMessengerCallbackDataEXT =
  result.sType = vkStructureTypeDebugUtilsMessengerCallbackDataEXT
  result.pMessageIdName = pMessageIdName
  result.messageIdNumber = messageIdNumber
  result.pMessage = pMessage
  result.queueLabelCount = queueLabelCount
  result.pQueueLabels = pQueueLabels
  result.cmdBufLabelCount = cmdBufLabelCount
  result.pCmdBufLabels = pCmdBufLabels
  result.pObjects = pObjects


proc mkVkDebugUtilsMessengerCreateInfoEXT*(
    messageSeverity: VkDebugUtilsMessageSeverityFlagsEXT;
    messageType: VkDebugUtilsMessageTypeFlagsEXT;
    pfnUserCallback: PFNVkdebugutilsmessengercallbackext): VkDebugUtilsMessengerCreateInfoEXT =
  result.sType = vkStructureTypeDebugUtilsMessengerCreateInfoEXT
  result.messageSeverity = messageSeverity
  result.messageType = messageType
  result.pfnUserCallback = pfnUserCallback


proc mkVkPhysicalDeviceSamplerFilterMinmaxProperties*(
    filterMinmaxSingleComponentFormats: VkBool32;
    filterMinmaxImageComponentMapping: VkBool32): VkPhysicalDeviceSamplerFilterMinmaxProperties =
  result.sType = vkStructureTypePhysicalDeviceSamplerFilterMinmaxProperties
  result.filterMinmaxSingleComponentFormats = filterMinmaxSingleComponentFormats
  result.filterMinmaxImageComponentMapping = filterMinmaxImageComponentMapping


proc mkVkSamplerReductionModeCreateInfo*(reductionMode: VkSamplerReductionMode): VkSamplerReductionModeCreateInfo =
  result.sType = vkStructureTypeSamplerReductionModeCreateInfo
  result.reductionMode = reductionMode


proc mkVkPhysicalDeviceInlineUniformBlockFeaturesEXT*(
    inlineUniformBlock: VkBool32;
    descriptorBindingInlineUniformBlockUpdateAfterBind: VkBool32): VkPhysicalDeviceInlineUniformBlockFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceInlineUniformBlockFeaturesEXT
  result.inlineUniformBlock = inlineUniformBlock
  result.descriptorBindingInlineUniformBlockUpdateAfterBind = descriptorBindingInlineUniformBlockUpdateAfterBind


proc mkVkPhysicalDeviceInlineUniformBlockPropertiesEXT*(
    maxInlineUniformBlockSize: uint32;
    maxPerStageDescriptorInlineUniformBlocks: uint32;
    maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks: uint32;
    maxDescriptorSetInlineUniformBlocks: uint32;
    maxDescriptorSetUpdateAfterBindInlineUniformBlocks: uint32): VkPhysicalDeviceInlineUniformBlockPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceInlineUniformBlockPropertiesEXT
  result.maxInlineUniformBlockSize = maxInlineUniformBlockSize
  result.maxPerStageDescriptorInlineUniformBlocks = maxPerStageDescriptorInlineUniformBlocks
  result.maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks = maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks
  result.maxDescriptorSetInlineUniformBlocks = maxDescriptorSetInlineUniformBlocks
  result.maxDescriptorSetUpdateAfterBindInlineUniformBlocks = maxDescriptorSetUpdateAfterBindInlineUniformBlocks


proc mkVkWriteDescriptorSetInlineUniformBlockEXT*(dataSize: uint32): VkWriteDescriptorSetInlineUniformBlockEXT =
  result.sType = vkStructureTypeWriteDescriptorSetInlineUniformBlockEXT
  result.dataSize = dataSize


proc mkVkDescriptorPoolInlineUniformBlockCreateInfoEXT*(
    maxInlineUniformBlockBindings: uint32): VkDescriptorPoolInlineUniformBlockCreateInfoEXT =
  result.sType = vkStructureTypeDescriptorPoolInlineUniformBlockCreateInfoEXT
  result.maxInlineUniformBlockBindings = maxInlineUniformBlockBindings


proc mkVkSampleLocationsInfoEXT*(sampleLocationsPerPixel: VkSampleCountFlagBits;
                                 sampleLocationGridSize: VkExtent2D;
                                 sampleLocationsCount: uint32;
                                 pSampleLocations: ptr VkSampleLocationEXT): VkSampleLocationsInfoEXT =
  result.sType = vkStructureTypeSampleLocationsInfoEXT
  result.sampleLocationsPerPixel = sampleLocationsPerPixel
  result.sampleLocationGridSize = sampleLocationGridSize
  result.sampleLocationsCount = sampleLocationsCount
  result.pSampleLocations = pSampleLocations


proc mkVkRenderPassSampleLocationsBeginInfoEXT*(
    attachmentInitialSampleLocationsCount: uint32;
    pAttachmentInitialSampleLocations: ptr VkAttachmentSampleLocationsEXT;
    postSubpassSampleLocationsCount: uint32;
    pPostSubpassSampleLocations: ptr VkSubpassSampleLocationsEXT): VkRenderPassSampleLocationsBeginInfoEXT =
  result.sType = vkStructureTypeRenderPassSampleLocationsBeginInfoEXT
  result.attachmentInitialSampleLocationsCount = attachmentInitialSampleLocationsCount
  result.pAttachmentInitialSampleLocations = pAttachmentInitialSampleLocations
  result.postSubpassSampleLocationsCount = postSubpassSampleLocationsCount
  result.pPostSubpassSampleLocations = pPostSubpassSampleLocations


proc mkVkPipelineSampleLocationsStateCreateInfoEXT*(
    sampleLocationsEnable: VkBool32;
    sampleLocationsInfo: VkSampleLocationsInfoEXT): VkPipelineSampleLocationsStateCreateInfoEXT =
  result.sType = vkStructureTypePipelineSampleLocationsStateCreateInfoEXT
  result.sampleLocationsEnable = sampleLocationsEnable
  result.sampleLocationsInfo = sampleLocationsInfo


proc mkVkPhysicalDeviceSampleLocationsPropertiesEXT*(
    sampleLocationSampleCounts: VkSampleCountFlags;
    maxSampleLocationGridSize: VkExtent2D;
    sampleLocationCoordinateRange: array[0 .. 1, cfloat];
    sampleLocationSubPixelBits: uint32; variableSampleLocations: VkBool32): VkPhysicalDeviceSampleLocationsPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceSampleLocationsPropertiesEXT
  result.sampleLocationSampleCounts = sampleLocationSampleCounts
  result.maxSampleLocationGridSize = maxSampleLocationGridSize
  result.sampleLocationCoordinateRange = sampleLocationCoordinateRange
  result.sampleLocationSubPixelBits = sampleLocationSubPixelBits
  result.variableSampleLocations = variableSampleLocations


proc mkVkMultisamplePropertiesEXT*(maxSampleLocationGridSize: VkExtent2D): VkMultisamplePropertiesEXT =
  result.sType = vkStructureTypeMultisamplePropertiesEXT
  result.maxSampleLocationGridSize = maxSampleLocationGridSize


proc mkVkProtectedSubmitInfo*(protectedSubmit: VkBool32): VkProtectedSubmitInfo =
  result.sType = vkStructureTypeProtectedSubmitInfo
  result.protectedSubmit = protectedSubmit


proc mkVkPhysicalDeviceProtectedMemoryFeatures*(protectedMemory: VkBool32): VkPhysicalDeviceProtectedMemoryFeatures =
  result.sType = vkStructureTypePhysicalDeviceProtectedMemoryFeatures
  result.protectedMemory = protectedMemory


proc mkVkPhysicalDeviceProtectedMemoryProperties*(protectedNoFault: VkBool32): VkPhysicalDeviceProtectedMemoryProperties =
  result.sType = vkStructureTypePhysicalDeviceProtectedMemoryProperties
  result.protectedNoFault = protectedNoFault


proc mkVkDeviceQueueInfo2*(queueFamilyIndex: uint32; queueIndex: uint32): VkDeviceQueueInfo2 =
  result.sType = vkStructureTypeDeviceQueueInfo2
  result.queueFamilyIndex = queueFamilyIndex
  result.queueIndex = queueIndex


proc mkVkBufferMemoryRequirementsInfo2*(buffer: VkBuffer): VkBufferMemoryRequirementsInfo2 =
  result.sType = vkStructureTypeBufferMemoryRequirementsInfo2
  result.buffer = buffer


proc mkVkImageMemoryRequirementsInfo2*(image: VkImage): VkImageMemoryRequirementsInfo2 =
  result.sType = vkStructureTypeImageMemoryRequirementsInfo2
  result.image = image


proc mkVkImageSparseMemoryRequirementsInfo2*(image: VkImage): VkImageSparseMemoryRequirementsInfo2 =
  result.sType = vkStructureTypeImageSparseMemoryRequirementsInfo2
  result.image = image


proc mkVkMemoryRequirements2*(memoryRequirements: VkMemoryRequirements): VkMemoryRequirements2 =
  result.sType = vkStructureTypeMemoryRequirements2
  result.memoryRequirements = memoryRequirements


proc mkVkSparseImageMemoryRequirements2*(
    memoryRequirements: VkSparseImageMemoryRequirements): VkSparseImageMemoryRequirements2 =
  result.sType = vkStructureTypeSparseImageMemoryRequirements2
  result.memoryRequirements = memoryRequirements


proc mkVkImageFormatListCreateInfo*(viewFormatCount: uint32;
                                    pViewFormats: ptr VkFormat): VkImageFormatListCreateInfo =
  result.sType = vkStructureTypeImageFormatListCreateInfo
  result.viewFormatCount = viewFormatCount
  result.pViewFormats = pViewFormats


proc mkVkPhysicalDeviceBlendOperationAdvancedFeaturesEXT*(
    advancedBlendCoherentOperations: VkBool32): VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceBlendOperationAdvancedFeaturesEXT
  result.advancedBlendCoherentOperations = advancedBlendCoherentOperations


proc mkVkPhysicalDeviceBlendOperationAdvancedPropertiesEXT*(
    advancedBlendMaxColorAttachments: uint32;
    advancedBlendIndependentBlend: VkBool32;
    advancedBlendNonPremultipliedSrcColor: VkBool32;
    advancedBlendNonPremultipliedDstColor: VkBool32;
    advancedBlendCorrelatedOverlap: VkBool32;
    advancedBlendAllOperations: VkBool32): VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceBlendOperationAdvancedPropertiesEXT
  result.advancedBlendMaxColorAttachments = advancedBlendMaxColorAttachments
  result.advancedBlendIndependentBlend = advancedBlendIndependentBlend
  result.advancedBlendNonPremultipliedSrcColor = advancedBlendNonPremultipliedSrcColor
  result.advancedBlendNonPremultipliedDstColor = advancedBlendNonPremultipliedDstColor
  result.advancedBlendCorrelatedOverlap = advancedBlendCorrelatedOverlap
  result.advancedBlendAllOperations = advancedBlendAllOperations


proc mkVkPipelineColorBlendAdvancedStateCreateInfoEXT*(
    srcPremultiplied: VkBool32; dstPremultiplied: VkBool32;
    blendOverlap: VkBlendOverlapEXT): VkPipelineColorBlendAdvancedStateCreateInfoEXT =
  result.sType = vkStructureTypePipelineColorBlendAdvancedStateCreateInfoEXT
  result.srcPremultiplied = srcPremultiplied
  result.dstPremultiplied = dstPremultiplied
  result.blendOverlap = blendOverlap


proc mkVkPipelineCoverageToColorStateCreateInfoNV*(
    coverageToColorEnable: VkBool32; coverageToColorLocation: uint32): VkPipelineCoverageToColorStateCreateInfoNV =
  result.sType = vkStructureTypePipelineCoverageToColorStateCreateInfoNV
  result.coverageToColorEnable = coverageToColorEnable
  result.coverageToColorLocation = coverageToColorLocation


proc mkVkAccelerationStructureBuildGeometryInfoKHR*(
    `type`: VkAccelerationStructureTypeKHR;
    mode: VkBuildAccelerationStructureModeKHR;
    srcAccelerationStructure: VkAccelerationStructureKHR;
    dstAccelerationStructure: VkAccelerationStructureKHR; geometryCount: uint32;
    pGeometries: ptr VkAccelerationStructureGeometryKHR;
    ppGeometries: ptr ptr VkAccelerationStructureGeometryKHR;
    scratchData: VkDeviceOrHostAddressKHR): VkAccelerationStructureBuildGeometryInfoKHR =
  result.sType = vkStructureTypeAccelerationStructureBuildGeometryInfoKHR
  result.`type` = `type`
  result.mode = mode
  result.srcAccelerationStructure = srcAccelerationStructure
  result.dstAccelerationStructure = dstAccelerationStructure
  result.geometryCount = geometryCount
  result.pGeometries = pGeometries
  result.ppGeometries = ppGeometries
  result.scratchData = scratchData


proc mkVkAccelerationStructureDeviceAddressInfoKHR*(
    accelerationStructure: VkAccelerationStructureKHR): VkAccelerationStructureDeviceAddressInfoKHR =
  result.sType = vkStructureTypeAccelerationStructureDeviceAddressInfoKHR
  result.accelerationStructure = accelerationStructure


proc mkVkAccelerationStructureGeometryAabbsDataKHR*(
    data: VkDeviceOrHostAddressConstKHR; stride: VkDeviceSize): VkAccelerationStructureGeometryAabbsDataKHR =
  result.sType = vkStructureTypeAccelerationStructureGeometryAabbsDataKHR
  result.data = data
  result.stride = stride


proc mkVkAccelerationStructureGeometryInstancesDataKHR*(
    arrayOfPointers: VkBool32; data: VkDeviceOrHostAddressConstKHR): VkAccelerationStructureGeometryInstancesDataKHR =
  result.sType = vkStructureTypeAccelerationStructureGeometryInstancesDataKHR
  result.arrayOfPointers = arrayOfPointers
  result.data = data


proc mkVkAccelerationStructureGeometryTrianglesDataKHR*(vertexFormat: VkFormat;
    vertexData: VkDeviceOrHostAddressConstKHR; vertexStride: VkDeviceSize;
    maxVertex: uint32; indexType: VkIndexType;
    indexData: VkDeviceOrHostAddressConstKHR;
    transformData: VkDeviceOrHostAddressConstKHR): VkAccelerationStructureGeometryTrianglesDataKHR =
  result.sType = vkStructureTypeAccelerationStructureGeometryTrianglesDataKHR
  result.vertexFormat = vertexFormat
  result.vertexData = vertexData
  result.vertexStride = vertexStride
  result.maxVertex = maxVertex
  result.indexType = indexType
  result.indexData = indexData
  result.transformData = transformData


proc mkVkAccelerationStructureGeometryKHR*(geometryType: VkGeometryTypeKHR;
    geometry: VkAccelerationStructureGeometryDataKHR): VkAccelerationStructureGeometryKHR =
  result.sType = vkStructureTypeAccelerationStructureGeometryKHR
  result.geometryType = geometryType
  result.geometry = geometry


proc mkVkWriteDescriptorSetAccelerationStructureKHR*(
    accelerationStructureCount: uint32;
    pAccelerationStructures: ptr VkAccelerationStructureKHR): VkWriteDescriptorSetAccelerationStructureKHR =
  result.sType = vkStructureTypeWriteDescriptorSetAccelerationStructureKHR
  result.accelerationStructureCount = accelerationStructureCount
  result.pAccelerationStructures = pAccelerationStructures


proc mkVkAccelerationStructureVersionInfoKHR*(pVersionData: ptr uint8): VkAccelerationStructureVersionInfoKHR =
  result.sType = vkStructureTypeAccelerationStructureVersionInfoKHR
  result.pVersionData = pVersionData


proc mkVkCopyAccelerationStructureInfoKHR*(src: VkAccelerationStructureKHR;
    dst: VkAccelerationStructureKHR; mode: VkCopyAccelerationStructureModeKHR): VkCopyAccelerationStructureInfoKHR =
  result.sType = vkStructureTypeCopyAccelerationStructureInfoKHR
  result.src = src
  result.dst = dst
  result.mode = mode


proc mkVkCopyAccelerationStructureToMemoryInfoKHR*(
    src: VkAccelerationStructureKHR; dst: VkDeviceOrHostAddressKHR;
    mode: VkCopyAccelerationStructureModeKHR): VkCopyAccelerationStructureToMemoryInfoKHR =
  result.sType = vkStructureTypeCopyAccelerationStructureToMemoryInfoKHR
  result.src = src
  result.dst = dst
  result.mode = mode


proc mkVkCopyMemoryToAccelerationStructureInfoKHR*(
    src: VkDeviceOrHostAddressConstKHR; dst: VkAccelerationStructureKHR;
    mode: VkCopyAccelerationStructureModeKHR): VkCopyMemoryToAccelerationStructureInfoKHR =
  result.sType = vkStructureTypeCopyMemoryToAccelerationStructureInfoKHR
  result.src = src
  result.dst = dst
  result.mode = mode


proc mkVkPhysicalDeviceAccelerationStructureFeaturesKHR*(
    accelerationStructure: VkBool32;
    accelerationStructureCaptureReplay: VkBool32;
    accelerationStructureIndirectBuild: VkBool32;
    accelerationStructureHostCommands: VkBool32;
    descriptorBindingAccelerationStructureUpdateAfterBind: VkBool32): VkPhysicalDeviceAccelerationStructureFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceAccelerationStructureFeaturesKHR
  result.accelerationStructure = accelerationStructure
  result.accelerationStructureCaptureReplay = accelerationStructureCaptureReplay
  result.accelerationStructureIndirectBuild = accelerationStructureIndirectBuild
  result.accelerationStructureHostCommands = accelerationStructureHostCommands
  result.descriptorBindingAccelerationStructureUpdateAfterBind = descriptorBindingAccelerationStructureUpdateAfterBind


proc mkVkPhysicalDeviceAccelerationStructurePropertiesKHR*(
    maxGeometryCount: uint64; maxInstanceCount: uint64;
    maxPrimitiveCount: uint64;
    maxPerStageDescriptorAccelerationStructures: uint32;
    maxPerStageDescriptorUpdateAfterBindAccelerationStructures: uint32;
    maxDescriptorSetAccelerationStructures: uint32;
    maxDescriptorSetUpdateAfterBindAccelerationStructures: uint32;
    minAccelerationStructureScratchOffsetAlignment: uint32): VkPhysicalDeviceAccelerationStructurePropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceAccelerationStructurePropertiesKHR
  result.maxGeometryCount = maxGeometryCount
  result.maxInstanceCount = maxInstanceCount
  result.maxPrimitiveCount = maxPrimitiveCount
  result.maxPerStageDescriptorAccelerationStructures = maxPerStageDescriptorAccelerationStructures
  result.maxPerStageDescriptorUpdateAfterBindAccelerationStructures = maxPerStageDescriptorUpdateAfterBindAccelerationStructures
  result.maxDescriptorSetAccelerationStructures = maxDescriptorSetAccelerationStructures
  result.maxDescriptorSetUpdateAfterBindAccelerationStructures = maxDescriptorSetUpdateAfterBindAccelerationStructures
  result.minAccelerationStructureScratchOffsetAlignment = minAccelerationStructureScratchOffsetAlignment


proc mkVkRayTracingPipelineCreateInfoKHR*(stageCount: uint32;
    pStages: ptr VkPipelineShaderStageCreateInfo; groupCount: uint32;
    pGroups: ptr VkRayTracingShaderGroupCreateInfoKHR;
    maxPipelineRayRecursionDepth: uint32;
    pLibraryInfo: ptr VkPipelineLibraryCreateInfoKHR;
    pLibraryInterface: ptr VkRayTracingPipelineInterfaceCreateInfoKHR;
    pDynamicState: ptr VkPipelineDynamicStateCreateInfo;
    layout: VkPipelineLayout; basePipelineHandle: VkPipeline;
    basePipelineIndex: int32): VkRayTracingPipelineCreateInfoKHR =
  result.sType = vkStructureTypeRayTracingPipelineCreateInfoKHR
  result.stageCount = stageCount
  result.pStages = pStages
  result.groupCount = groupCount
  result.pGroups = pGroups
  result.maxPipelineRayRecursionDepth = maxPipelineRayRecursionDepth
  result.pLibraryInfo = pLibraryInfo
  result.pLibraryInterface = pLibraryInterface
  result.pDynamicState = pDynamicState
  result.layout = layout
  result.basePipelineHandle = basePipelineHandle
  result.basePipelineIndex = basePipelineIndex


proc mkVkRayTracingShaderGroupCreateInfoKHR*(
    `type`: VkRayTracingShaderGroupTypeKHR; generalShader: uint32;
    closestHitShader: uint32; anyHitShader: uint32; intersectionShader: uint32): VkRayTracingShaderGroupCreateInfoKHR =
  result.sType = vkStructureTypeRayTracingShaderGroupCreateInfoKHR
  result.`type` = `type`
  result.generalShader = generalShader
  result.closestHitShader = closestHitShader
  result.anyHitShader = anyHitShader
  result.intersectionShader = intersectionShader


proc mkVkAccelerationStructureCreateInfoKHR*(
    createFlags: VkAccelerationStructureCreateFlagsKHR; buffer: VkBuffer;
    offset: VkDeviceSize; size: VkDeviceSize;
    `type`: VkAccelerationStructureTypeKHR; deviceAddress: VkDeviceAddress): VkAccelerationStructureCreateInfoKHR =
  result.sType = vkStructureTypeAccelerationStructureCreateInfoKHR
  result.createFlags = createFlags
  result.buffer = buffer
  result.offset = offset
  result.size = size
  result.`type` = `type`
  result.deviceAddress = deviceAddress


proc mkVkRayTracingPipelineInterfaceCreateInfoKHR*(
    maxPipelineRayPayloadSize: uint32; maxPipelineRayHitAttributeSize: uint32): VkRayTracingPipelineInterfaceCreateInfoKHR =
  result.sType = vkStructureTypeRayTracingPipelineInterfaceCreateInfoKHR
  result.maxPipelineRayPayloadSize = maxPipelineRayPayloadSize
  result.maxPipelineRayHitAttributeSize = maxPipelineRayHitAttributeSize


proc mkVkAccelerationStructureBuildSizesInfoKHR*(
    accelerationStructureSize: VkDeviceSize; updateScratchSize: VkDeviceSize;
    buildScratchSize: VkDeviceSize): VkAccelerationStructureBuildSizesInfoKHR =
  result.sType = vkStructureTypeAccelerationStructureBuildSizesInfoKHR
  result.accelerationStructureSize = accelerationStructureSize
  result.updateScratchSize = updateScratchSize
  result.buildScratchSize = buildScratchSize


proc mkVkPipelineCoverageModulationStateCreateInfoNV*(
    coverageModulationMode: VkCoverageModulationModeNV;
    coverageModulationTableEnable: VkBool32;
    coverageModulationTableCount: uint32; pCoverageModulationTable: ptr cfloat): VkPipelineCoverageModulationStateCreateInfoNV =
  result.sType = vkStructureTypePipelineCoverageModulationStateCreateInfoNV
  result.coverageModulationMode = coverageModulationMode
  result.coverageModulationTableEnable = coverageModulationTableEnable
  result.coverageModulationTableCount = coverageModulationTableCount
  result.pCoverageModulationTable = pCoverageModulationTable


proc mkVkPhysicalDeviceShaderSMBuiltinsFeaturesNV*(shaderSMBuiltins: VkBool32): VkPhysicalDeviceShaderSMBuiltinsFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceShaderSMBuiltinsFeaturesNV
  result.shaderSMBuiltins = shaderSMBuiltins


proc mkVkPhysicalDeviceShaderSMBuiltinsPropertiesNV*(shaderSMCount: uint32;
    shaderWarpsPerSM: uint32): VkPhysicalDeviceShaderSMBuiltinsPropertiesNV =
  result.sType = vkStructureTypePhysicalDeviceShaderSMBuiltinsPropertiesNV
  result.shaderSMCount = shaderSMCount
  result.shaderWarpsPerSM = shaderWarpsPerSM


proc mkVkSamplerYcbcrConversionCreateInfo*(format: VkFormat;
    ycbcrModel: VkSamplerYcbcrModelConversion; ycbcrRange: VkSamplerYcbcrRange;
    components: VkComponentMapping; xChromaOffset: VkChromaLocation;
    yChromaOffset: VkChromaLocation; chromaFilter: VkFilter;
    forceExplicitReconstruction: VkBool32): VkSamplerYcbcrConversionCreateInfo =
  result.sType = vkStructureTypeSamplerYcbcrConversionCreateInfo
  result.format = format
  result.ycbcrModel = ycbcrModel
  result.ycbcrRange = ycbcrRange
  result.components = components
  result.xChromaOffset = xChromaOffset
  result.yChromaOffset = yChromaOffset
  result.chromaFilter = chromaFilter
  result.forceExplicitReconstruction = forceExplicitReconstruction


proc mkVkSamplerYcbcrConversionInfo*(conversion: VkSamplerYcbcrConversion): VkSamplerYcbcrConversionInfo =
  result.sType = vkStructureTypeSamplerYcbcrConversionInfo
  result.conversion = conversion


proc mkVkBindImagePlaneMemoryInfo*(planeAspect: VkImageAspectFlagBits): VkBindImagePlaneMemoryInfo =
  result.sType = vkStructureTypeBindImagePlaneMemoryInfo
  result.planeAspect = planeAspect


proc mkVkImagePlaneMemoryRequirementsInfo*(planeAspect: VkImageAspectFlagBits): VkImagePlaneMemoryRequirementsInfo =
  result.sType = vkStructureTypeImagePlaneMemoryRequirementsInfo
  result.planeAspect = planeAspect


proc mkVkPhysicalDeviceSamplerYcbcrConversionFeatures*(
    samplerYcbcrConversion: VkBool32): VkPhysicalDeviceSamplerYcbcrConversionFeatures =
  result.sType = vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeatures
  result.samplerYcbcrConversion = samplerYcbcrConversion


proc mkVkSamplerYcbcrConversionImageFormatProperties*(
    combinedImageSamplerDescriptorCount: uint32): VkSamplerYcbcrConversionImageFormatProperties =
  result.sType = vkStructureTypeSamplerYcbcrConversionImageFormatProperties
  result.combinedImageSamplerDescriptorCount = combinedImageSamplerDescriptorCount


proc mkVkBindBufferMemoryInfo*(buffer: VkBuffer; memory: VkDeviceMemory;
                               memoryOffset: VkDeviceSize): VkBindBufferMemoryInfo =
  result.sType = vkStructureTypeBindBufferMemoryInfo
  result.buffer = buffer
  result.memory = memory
  result.memoryOffset = memoryOffset


proc mkVkBindImageMemoryInfo*(image: VkImage; memory: VkDeviceMemory;
                              memoryOffset: VkDeviceSize): VkBindImageMemoryInfo =
  result.sType = vkStructureTypeBindImageMemoryInfo
  result.image = image
  result.memory = memory
  result.memoryOffset = memoryOffset


proc mkVkDrmFormatModifierPropertiesListEXT*(drmFormatModifierCount: uint32;
    pDrmFormatModifierProperties: ptr VkDrmFormatModifierPropertiesEXT): VkDrmFormatModifierPropertiesListEXT =
  result.sType = vkStructureTypeDrmFormatModifierPropertiesListEXT
  result.drmFormatModifierCount = drmFormatModifierCount
  result.pDrmFormatModifierProperties = pDrmFormatModifierProperties


proc mkVkPhysicalDeviceImageDrmFormatModifierInfoEXT*(drmFormatModifier: uint64;
    sharingMode: VkSharingMode; queueFamilyIndexCount: uint32;
    pQueueFamilyIndices: ptr uint32): VkPhysicalDeviceImageDrmFormatModifierInfoEXT =
  result.sType = vkStructureTypePhysicalDeviceImageDrmFormatModifierInfoEXT
  result.drmFormatModifier = drmFormatModifier
  result.sharingMode = sharingMode
  result.queueFamilyIndexCount = queueFamilyIndexCount
  result.pQueueFamilyIndices = pQueueFamilyIndices


proc mkVkImageDrmFormatModifierListCreateInfoEXT*(
    drmFormatModifierCount: uint32; pDrmFormatModifiers: ptr uint64): VkImageDrmFormatModifierListCreateInfoEXT =
  result.sType = vkStructureTypeImageDrmFormatModifierListCreateInfoEXT
  result.drmFormatModifierCount = drmFormatModifierCount
  result.pDrmFormatModifiers = pDrmFormatModifiers


proc mkVkImageDrmFormatModifierExplicitCreateInfoEXT*(drmFormatModifier: uint64;
    drmFormatModifierPlaneCount: uint32; pPlaneLayouts: ptr VkSubresourceLayout): VkImageDrmFormatModifierExplicitCreateInfoEXT =
  result.sType = vkStructureTypeImageDrmFormatModifierExplicitCreateInfoEXT
  result.drmFormatModifier = drmFormatModifier
  result.drmFormatModifierPlaneCount = drmFormatModifierPlaneCount
  result.pPlaneLayouts = pPlaneLayouts


proc mkVkImageDrmFormatModifierPropertiesEXT*(drmFormatModifier: uint64): VkImageDrmFormatModifierPropertiesEXT =
  result.sType = vkStructureTypeImageDrmFormatModifierPropertiesEXT
  result.drmFormatModifier = drmFormatModifier


proc mkVkValidationCacheCreateInfoEXT*(initialDataSize: csize_t): VkValidationCacheCreateInfoEXT =
  result.sType = vkStructureTypeValidationCacheCreateInfoEXT
  result.initialDataSize = initialDataSize


proc mkVkShaderModuleValidationCacheCreateInfoEXT*(
    validationCache: VkValidationCacheEXT): VkShaderModuleValidationCacheCreateInfoEXT =
  result.sType = vkStructureTypeShaderModuleValidationCacheCreateInfoEXT
  result.validationCache = validationCache


proc mkVkDescriptorSetLayoutBindingFlagsCreateInfo*(bindingCount: uint32;
    pBindingFlags: ptr VkDescriptorBindingFlags): VkDescriptorSetLayoutBindingFlagsCreateInfo =
  result.sType = vkStructureTypeDescriptorSetLayoutBindingFlagsCreateInfo
  result.bindingCount = bindingCount
  result.pBindingFlags = pBindingFlags


proc mkVkPhysicalDeviceDescriptorIndexingFeatures*(
    shaderInputAttachmentArrayDynamicIndexing: VkBool32;
    shaderUniformTexelBufferArrayDynamicIndexing: VkBool32;
    shaderStorageTexelBufferArrayDynamicIndexing: VkBool32;
    shaderUniformBufferArrayNonUniformIndexing: VkBool32;
    shaderSampledImageArrayNonUniformIndexing: VkBool32;
    shaderStorageBufferArrayNonUniformIndexing: VkBool32;
    shaderStorageImageArrayNonUniformIndexing: VkBool32;
    shaderInputAttachmentArrayNonUniformIndexing: VkBool32;
    shaderUniformTexelBufferArrayNonUniformIndexing: VkBool32;
    shaderStorageTexelBufferArrayNonUniformIndexing: VkBool32;
    descriptorBindingUniformBufferUpdateAfterBind: VkBool32;
    descriptorBindingSampledImageUpdateAfterBind: VkBool32;
    descriptorBindingStorageImageUpdateAfterBind: VkBool32;
    descriptorBindingStorageBufferUpdateAfterBind: VkBool32;
    descriptorBindingUniformTexelBufferUpdateAfterBind: VkBool32;
    descriptorBindingStorageTexelBufferUpdateAfterBind: VkBool32;
    descriptorBindingUpdateUnusedWhilePending: VkBool32;
    descriptorBindingPartiallyBound: VkBool32;
    descriptorBindingVariableDescriptorCount: VkBool32;
    runtimeDescriptorArray: VkBool32): VkPhysicalDeviceDescriptorIndexingFeatures =
  result.sType = vkStructureTypePhysicalDeviceDescriptorIndexingFeatures
  result.shaderInputAttachmentArrayDynamicIndexing = shaderInputAttachmentArrayDynamicIndexing
  result.shaderUniformTexelBufferArrayDynamicIndexing = shaderUniformTexelBufferArrayDynamicIndexing
  result.shaderStorageTexelBufferArrayDynamicIndexing = shaderStorageTexelBufferArrayDynamicIndexing
  result.shaderUniformBufferArrayNonUniformIndexing = shaderUniformBufferArrayNonUniformIndexing
  result.shaderSampledImageArrayNonUniformIndexing = shaderSampledImageArrayNonUniformIndexing
  result.shaderStorageBufferArrayNonUniformIndexing = shaderStorageBufferArrayNonUniformIndexing
  result.shaderStorageImageArrayNonUniformIndexing = shaderStorageImageArrayNonUniformIndexing
  result.shaderInputAttachmentArrayNonUniformIndexing = shaderInputAttachmentArrayNonUniformIndexing
  result.shaderUniformTexelBufferArrayNonUniformIndexing = shaderUniformTexelBufferArrayNonUniformIndexing
  result.shaderStorageTexelBufferArrayNonUniformIndexing = shaderStorageTexelBufferArrayNonUniformIndexing
  result.descriptorBindingUniformBufferUpdateAfterBind = descriptorBindingUniformBufferUpdateAfterBind
  result.descriptorBindingSampledImageUpdateAfterBind = descriptorBindingSampledImageUpdateAfterBind
  result.descriptorBindingStorageImageUpdateAfterBind = descriptorBindingStorageImageUpdateAfterBind
  result.descriptorBindingStorageBufferUpdateAfterBind = descriptorBindingStorageBufferUpdateAfterBind
  result.descriptorBindingUniformTexelBufferUpdateAfterBind = descriptorBindingUniformTexelBufferUpdateAfterBind
  result.descriptorBindingStorageTexelBufferUpdateAfterBind = descriptorBindingStorageTexelBufferUpdateAfterBind
  result.descriptorBindingUpdateUnusedWhilePending = descriptorBindingUpdateUnusedWhilePending
  result.descriptorBindingPartiallyBound = descriptorBindingPartiallyBound
  result.descriptorBindingVariableDescriptorCount = descriptorBindingVariableDescriptorCount
  result.runtimeDescriptorArray = runtimeDescriptorArray


proc mkVkPhysicalDeviceDescriptorIndexingProperties*(
    maxUpdateAfterBindDescriptorsInAllPools: uint32;
    shaderUniformBufferArrayNonUniformIndexingNative: VkBool32;
    shaderSampledImageArrayNonUniformIndexingNative: VkBool32;
    shaderStorageBufferArrayNonUniformIndexingNative: VkBool32;
    shaderStorageImageArrayNonUniformIndexingNative: VkBool32;
    shaderInputAttachmentArrayNonUniformIndexingNative: VkBool32;
    robustBufferAccessUpdateAfterBind: VkBool32;
    quadDivergentImplicitLod: VkBool32;
    maxPerStageDescriptorUpdateAfterBindSamplers: uint32;
    maxPerStageDescriptorUpdateAfterBindUniformBuffers: uint32;
    maxPerStageDescriptorUpdateAfterBindStorageBuffers: uint32;
    maxPerStageDescriptorUpdateAfterBindSampledImages: uint32;
    maxPerStageDescriptorUpdateAfterBindStorageImages: uint32;
    maxPerStageDescriptorUpdateAfterBindInputAttachments: uint32;
    maxPerStageUpdateAfterBindResources: uint32;
    maxDescriptorSetUpdateAfterBindSamplers: uint32;
    maxDescriptorSetUpdateAfterBindUniformBuffers: uint32;
    maxDescriptorSetUpdateAfterBindUniformBuffersDynamic: uint32;
    maxDescriptorSetUpdateAfterBindStorageBuffers: uint32;
    maxDescriptorSetUpdateAfterBindStorageBuffersDynamic: uint32;
    maxDescriptorSetUpdateAfterBindSampledImages: uint32;
    maxDescriptorSetUpdateAfterBindStorageImages: uint32;
    maxDescriptorSetUpdateAfterBindInputAttachments: uint32): VkPhysicalDeviceDescriptorIndexingProperties =
  result.sType = vkStructureTypePhysicalDeviceDescriptorIndexingProperties
  result.maxUpdateAfterBindDescriptorsInAllPools = maxUpdateAfterBindDescriptorsInAllPools
  result.shaderUniformBufferArrayNonUniformIndexingNative = shaderUniformBufferArrayNonUniformIndexingNative
  result.shaderSampledImageArrayNonUniformIndexingNative = shaderSampledImageArrayNonUniformIndexingNative
  result.shaderStorageBufferArrayNonUniformIndexingNative = shaderStorageBufferArrayNonUniformIndexingNative
  result.shaderStorageImageArrayNonUniformIndexingNative = shaderStorageImageArrayNonUniformIndexingNative
  result.shaderInputAttachmentArrayNonUniformIndexingNative = shaderInputAttachmentArrayNonUniformIndexingNative
  result.robustBufferAccessUpdateAfterBind = robustBufferAccessUpdateAfterBind
  result.quadDivergentImplicitLod = quadDivergentImplicitLod
  result.maxPerStageDescriptorUpdateAfterBindSamplers = maxPerStageDescriptorUpdateAfterBindSamplers
  result.maxPerStageDescriptorUpdateAfterBindUniformBuffers = maxPerStageDescriptorUpdateAfterBindUniformBuffers
  result.maxPerStageDescriptorUpdateAfterBindStorageBuffers = maxPerStageDescriptorUpdateAfterBindStorageBuffers
  result.maxPerStageDescriptorUpdateAfterBindSampledImages = maxPerStageDescriptorUpdateAfterBindSampledImages
  result.maxPerStageDescriptorUpdateAfterBindStorageImages = maxPerStageDescriptorUpdateAfterBindStorageImages
  result.maxPerStageDescriptorUpdateAfterBindInputAttachments = maxPerStageDescriptorUpdateAfterBindInputAttachments
  result.maxPerStageUpdateAfterBindResources = maxPerStageUpdateAfterBindResources
  result.maxDescriptorSetUpdateAfterBindSamplers = maxDescriptorSetUpdateAfterBindSamplers
  result.maxDescriptorSetUpdateAfterBindUniformBuffers = maxDescriptorSetUpdateAfterBindUniformBuffers
  result.maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = maxDescriptorSetUpdateAfterBindUniformBuffersDynamic
  result.maxDescriptorSetUpdateAfterBindStorageBuffers = maxDescriptorSetUpdateAfterBindStorageBuffers
  result.maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = maxDescriptorSetUpdateAfterBindStorageBuffersDynamic
  result.maxDescriptorSetUpdateAfterBindSampledImages = maxDescriptorSetUpdateAfterBindSampledImages
  result.maxDescriptorSetUpdateAfterBindStorageImages = maxDescriptorSetUpdateAfterBindStorageImages
  result.maxDescriptorSetUpdateAfterBindInputAttachments = maxDescriptorSetUpdateAfterBindInputAttachments


proc mkVkDescriptorSetVariableDescriptorCountAllocateInfo*(
    descriptorSetCount: uint32; pDescriptorCounts: ptr uint32): VkDescriptorSetVariableDescriptorCountAllocateInfo =
  result.sType = vkStructureTypeDescriptorSetVariableDescriptorCountAllocateInfo
  result.descriptorSetCount = descriptorSetCount
  result.pDescriptorCounts = pDescriptorCounts


proc mkVkDescriptorSetVariableDescriptorCountLayoutSupport*(
    maxVariableDescriptorCount: uint32): VkDescriptorSetVariableDescriptorCountLayoutSupport =
  result.sType = vkStructureTypeDescriptorSetVariableDescriptorCountLayoutSupport
  result.maxVariableDescriptorCount = maxVariableDescriptorCount


proc mkVkPipelineViewportShadingRateImageStateCreateInfoNV*(
    shadingRateImageEnable: VkBool32; viewportCount: uint32;
    pShadingRatePalettes: ptr VkShadingRatePaletteNV): VkPipelineViewportShadingRateImageStateCreateInfoNV =
  result.sType = vkStructureTypePipelineViewportShadingRateImageStateCreateInfoNV
  result.shadingRateImageEnable = shadingRateImageEnable
  result.viewportCount = viewportCount
  result.pShadingRatePalettes = pShadingRatePalettes


proc mkVkPhysicalDeviceShadingRateImageFeaturesNV*(shadingRateImage: VkBool32;
    shadingRateCoarseSampleOrder: VkBool32): VkPhysicalDeviceShadingRateImageFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceShadingRateImageFeaturesNV
  result.shadingRateImage = shadingRateImage
  result.shadingRateCoarseSampleOrder = shadingRateCoarseSampleOrder


proc mkVkPhysicalDeviceShadingRateImagePropertiesNV*(
    shadingRateTexelSize: VkExtent2D; shadingRatePaletteSize: uint32;
    shadingRateMaxCoarseSamples: uint32): VkPhysicalDeviceShadingRateImagePropertiesNV =
  result.sType = vkStructureTypePhysicalDeviceShadingRateImagePropertiesNV
  result.shadingRateTexelSize = shadingRateTexelSize
  result.shadingRatePaletteSize = shadingRatePaletteSize
  result.shadingRateMaxCoarseSamples = shadingRateMaxCoarseSamples


proc mkVkPipelineViewportCoarseSampleOrderStateCreateInfoNV*(
    sampleOrderType: VkCoarseSampleOrderTypeNV; customSampleOrderCount: uint32;
    pCustomSampleOrders: ptr VkCoarseSampleOrderCustomNV): VkPipelineViewportCoarseSampleOrderStateCreateInfoNV =
  result.sType = vkStructureTypePipelineViewportCoarseSampleOrderStateCreateInfoNV
  result.sampleOrderType = sampleOrderType
  result.customSampleOrderCount = customSampleOrderCount
  result.pCustomSampleOrders = pCustomSampleOrders


proc mkVkRayTracingPipelineCreateInfoNV*(stageCount: uint32;
    pStages: ptr VkPipelineShaderStageCreateInfo; groupCount: uint32;
    pGroups: ptr VkRayTracingShaderGroupCreateInfoNV; maxRecursionDepth: uint32;
    layout: VkPipelineLayout; basePipelineHandle: VkPipeline;
    basePipelineIndex: int32): VkRayTracingPipelineCreateInfoNV =
  result.sType = vkStructureTypeRayTracingPipelineCreateInfoNV
  result.stageCount = stageCount
  result.pStages = pStages
  result.groupCount = groupCount
  result.pGroups = pGroups
  result.maxRecursionDepth = maxRecursionDepth
  result.layout = layout
  result.basePipelineHandle = basePipelineHandle
  result.basePipelineIndex = basePipelineIndex


proc mkVkAccelerationStructureCreateInfoNV*(compactedSize: VkDeviceSize;
    info: VkAccelerationStructureInfoNV): VkAccelerationStructureCreateInfoNV =
  result.sType = vkStructureTypeAccelerationStructureCreateInfoNV
  result.compactedSize = compactedSize
  result.info = info


proc mkVkGeometryNV*(geometryType: VkGeometryTypeKHR; geometry: VkGeometryDataNV): VkGeometryNV =
  result.sType = vkStructureTypeGeometryNV
  result.geometryType = geometryType
  result.geometry = geometry


proc mkVkGeometryTrianglesNV*(vertexData: VkBuffer; vertexOffset: VkDeviceSize;
                              vertexCount: uint32; vertexStride: VkDeviceSize;
                              vertexFormat: VkFormat; indexData: VkBuffer;
                              indexOffset: VkDeviceSize; indexCount: uint32;
                              indexType: VkIndexType; transformData: VkBuffer;
                              transformOffset: VkDeviceSize): VkGeometryTrianglesNV =
  result.sType = vkStructureTypeGeometryTrianglesNV
  result.vertexData = vertexData
  result.vertexOffset = vertexOffset
  result.vertexCount = vertexCount
  result.vertexStride = vertexStride
  result.vertexFormat = vertexFormat
  result.indexData = indexData
  result.indexOffset = indexOffset
  result.indexCount = indexCount
  result.indexType = indexType
  result.transformData = transformData
  result.transformOffset = transformOffset


proc mkVkGeometryAABBNV*(aabbData: VkBuffer; numAABBs: uint32; stride: uint32;
                         offset: VkDeviceSize): VkGeometryAABBNV =
  result.sType = vkStructureTypeGeometryAABBNV
  result.aabbData = aabbData
  result.numAABBs = numAABBs
  result.stride = stride
  result.offset = offset


proc mkVkBindAccelerationStructureMemoryInfoNV*(
    accelerationStructure: VkAccelerationStructureNV; memory: VkDeviceMemory;
    memoryOffset: VkDeviceSize; deviceIndexCount: uint32;
    pDeviceIndices: ptr uint32): VkBindAccelerationStructureMemoryInfoNV =
  result.sType = vkStructureTypeBindAccelerationStructureMemoryInfoNV
  result.accelerationStructure = accelerationStructure
  result.memory = memory
  result.memoryOffset = memoryOffset
  result.deviceIndexCount = deviceIndexCount
  result.pDeviceIndices = pDeviceIndices


proc mkVkWriteDescriptorSetAccelerationStructureNV*(
    accelerationStructureCount: uint32;
    pAccelerationStructures: ptr VkAccelerationStructureNV): VkWriteDescriptorSetAccelerationStructureNV =
  result.sType = vkStructureTypeWriteDescriptorSetAccelerationStructureNV
  result.accelerationStructureCount = accelerationStructureCount
  result.pAccelerationStructures = pAccelerationStructures


proc mkVkAccelerationStructureMemoryRequirementsInfoNV*(
    `type`: VkAccelerationStructureMemoryRequirementsTypeNV;
    accelerationStructure: VkAccelerationStructureNV): VkAccelerationStructureMemoryRequirementsInfoNV =
  result.sType = vkStructureTypeAccelerationStructureMemoryRequirementsInfoNV
  result.`type` = `type`
  result.accelerationStructure = accelerationStructure


proc mkVkPhysicalDeviceRayTracingPropertiesNV*(shaderGroupHandleSize: uint32;
    maxRecursionDepth: uint32; maxShaderGroupStride: uint32;
    shaderGroupBaseAlignment: uint32; maxGeometryCount: uint64;
    maxInstanceCount: uint64; maxTriangleCount: uint64;
    maxDescriptorSetAccelerationStructures: uint32): VkPhysicalDeviceRayTracingPropertiesNV =
  result.sType = vkStructureTypePhysicalDeviceRayTracingPropertiesNV
  result.shaderGroupHandleSize = shaderGroupHandleSize
  result.maxRecursionDepth = maxRecursionDepth
  result.maxShaderGroupStride = maxShaderGroupStride
  result.shaderGroupBaseAlignment = shaderGroupBaseAlignment
  result.maxGeometryCount = maxGeometryCount
  result.maxInstanceCount = maxInstanceCount
  result.maxTriangleCount = maxTriangleCount
  result.maxDescriptorSetAccelerationStructures = maxDescriptorSetAccelerationStructures


proc mkVkRayTracingShaderGroupCreateInfoNV*(
    `type`: VkRayTracingShaderGroupTypeKHR; generalShader: uint32;
    closestHitShader: uint32; anyHitShader: uint32; intersectionShader: uint32): VkRayTracingShaderGroupCreateInfoNV =
  result.sType = vkStructureTypeRayTracingShaderGroupCreateInfoNV
  result.`type` = `type`
  result.generalShader = generalShader
  result.closestHitShader = closestHitShader
  result.anyHitShader = anyHitShader
  result.intersectionShader = intersectionShader


proc mkVkAccelerationStructureInfoNV*(`type`: VkAccelerationStructureTypeNV;
                                      instanceCount: uint32;
                                      geometryCount: uint32;
                                      pGeometries: ptr VkGeometryNV): VkAccelerationStructureInfoNV =
  result.sType = vkStructureTypeAccelerationStructureInfoNV
  result.`type` = `type`
  result.instanceCount = instanceCount
  result.geometryCount = geometryCount
  result.pGeometries = pGeometries


proc mkVkPhysicalDeviceRepresentativeFragmentTestFeaturesNV*(
    representativeFragmentTest: VkBool32): VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceRepresentativeFragmentTestFeaturesNV
  result.representativeFragmentTest = representativeFragmentTest


proc mkVkPipelineRepresentativeFragmentTestStateCreateInfoNV*(
    representativeFragmentTestEnable: VkBool32): VkPipelineRepresentativeFragmentTestStateCreateInfoNV =
  result.sType = vkStructureTypePipelineRepresentativeFragmentTestStateCreateInfoNV
  result.representativeFragmentTestEnable = representativeFragmentTestEnable


proc mkVkPhysicalDeviceMaintenance3Properties*(maxPerSetDescriptors: uint32;
    maxMemoryAllocationSize: VkDeviceSize): VkPhysicalDeviceMaintenance3Properties =
  result.sType = vkStructureTypePhysicalDeviceMaintenance3Properties
  result.maxPerSetDescriptors = maxPerSetDescriptors
  result.maxMemoryAllocationSize = maxMemoryAllocationSize


proc mkVkDescriptorSetLayoutSupport*(supported: VkBool32): VkDescriptorSetLayoutSupport =
  result.sType = vkStructureTypeDescriptorSetLayoutSupport
  result.supported = supported


proc mkVkPhysicalDeviceImageViewImageFormatInfoEXT*(
    imageViewType: VkImageViewType): VkPhysicalDeviceImageViewImageFormatInfoEXT =
  result.sType = vkStructureTypePhysicalDeviceImageViewImageFormatInfoEXT
  result.imageViewType = imageViewType


proc mkVkFilterCubicImageViewImageFormatPropertiesEXT*(filterCubic: VkBool32;
    filterCubicMinmax: VkBool32): VkFilterCubicImageViewImageFormatPropertiesEXT =
  result.sType = vkStructureTypeFilterCubicImageViewImageFormatPropertiesEXT
  result.filterCubic = filterCubic
  result.filterCubicMinmax = filterCubicMinmax


proc mkVkDeviceQueueGlobalPriorityCreateInfoEXT*(
    globalPriority: VkQueueGlobalPriorityEXT): VkDeviceQueueGlobalPriorityCreateInfoEXT =
  result.sType = vkStructureTypeDeviceQueueGlobalPriorityCreateInfoEXT
  result.globalPriority = globalPriority


proc mkVkPhysicalDeviceShaderSubgroupExtendedTypesFeatures*(
    shaderSubgroupExtendedTypes: VkBool32): VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures =
  result.sType = vkStructureTypePhysicalDeviceShaderSubgroupExtendedTypesFeatures
  result.shaderSubgroupExtendedTypes = shaderSubgroupExtendedTypes


proc mkVkPhysicalDevice8BitStorageFeatures*(storageBuffer8BitAccess: VkBool32;
    uniformAndStorageBuffer8BitAccess: VkBool32; storagePushConstant8: VkBool32): VkPhysicalDevice8BitStorageFeatures =
  result.sType = vkStructureTypePhysicalDevice8BitStorageFeatures
  result.storageBuffer8BitAccess = storageBuffer8BitAccess
  result.uniformAndStorageBuffer8BitAccess = uniformAndStorageBuffer8BitAccess
  result.storagePushConstant8 = storagePushConstant8


proc mkVkImportMemoryHostPointerInfoEXT*(
    handleType: VkExternalMemoryHandleTypeFlagBits): VkImportMemoryHostPointerInfoEXT =
  result.sType = vkStructureTypeImportMemoryHostPointerInfoEXT
  result.handleType = handleType


proc mkVkMemoryHostPointerPropertiesEXT*(memoryTypeBits: uint32): VkMemoryHostPointerPropertiesEXT =
  result.sType = vkStructureTypeMemoryHostPointerPropertiesEXT
  result.memoryTypeBits = memoryTypeBits


proc mkVkPhysicalDeviceExternalMemoryHostPropertiesEXT*(
    minImportedHostPointerAlignment: VkDeviceSize): VkPhysicalDeviceExternalMemoryHostPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceExternalMemoryHostPropertiesEXT
  result.minImportedHostPointerAlignment = minImportedHostPointerAlignment


proc mkVkPhysicalDeviceShaderAtomicInt64Features*(
    shaderBufferInt64Atomics: VkBool32; shaderSharedInt64Atomics: VkBool32): VkPhysicalDeviceShaderAtomicInt64Features =
  result.sType = vkStructureTypePhysicalDeviceShaderAtomicInt64Features
  result.shaderBufferInt64Atomics = shaderBufferInt64Atomics
  result.shaderSharedInt64Atomics = shaderSharedInt64Atomics


proc mkVkPhysicalDeviceShaderClockFeaturesKHR*(shaderSubgroupClock: VkBool32;
    shaderDeviceClock: VkBool32): VkPhysicalDeviceShaderClockFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceShaderClockFeaturesKHR
  result.shaderSubgroupClock = shaderSubgroupClock
  result.shaderDeviceClock = shaderDeviceClock


proc mkVkPipelineCompilerControlCreateInfoAMD*(
    compilerControlFlags: VkPipelineCompilerControlFlagsAMD): VkPipelineCompilerControlCreateInfoAMD =
  result.sType = vkStructureTypePipelineCompilerControlCreateInfoAMD
  result.compilerControlFlags = compilerControlFlags


proc mkVkCalibratedTimestampInfoEXT*(timeDomain: VkTimeDomainEXT): VkCalibratedTimestampInfoEXT =
  result.sType = vkStructureTypeCalibratedTimestampInfoEXT
  result.timeDomain = timeDomain


proc mkVkPhysicalDeviceShaderCorePropertiesAMD*(shaderEngineCount: uint32;
    shaderArraysPerEngineCount: uint32; computeUnitsPerShaderArray: uint32;
    simdPerComputeUnit: uint32; wavefrontsPerSimd: uint32;
    wavefrontSize: uint32; sgprsPerSimd: uint32; minSgprAllocation: uint32;
    maxSgprAllocation: uint32; sgprAllocationGranularity: uint32;
    vgprsPerSimd: uint32; minVgprAllocation: uint32; maxVgprAllocation: uint32;
    vgprAllocationGranularity: uint32): VkPhysicalDeviceShaderCorePropertiesAMD =
  result.sType = vkStructureTypePhysicalDeviceShaderCorePropertiesAMD
  result.shaderEngineCount = shaderEngineCount
  result.shaderArraysPerEngineCount = shaderArraysPerEngineCount
  result.computeUnitsPerShaderArray = computeUnitsPerShaderArray
  result.simdPerComputeUnit = simdPerComputeUnit
  result.wavefrontsPerSimd = wavefrontsPerSimd
  result.wavefrontSize = wavefrontSize
  result.sgprsPerSimd = sgprsPerSimd
  result.minSgprAllocation = minSgprAllocation
  result.maxSgprAllocation = maxSgprAllocation
  result.sgprAllocationGranularity = sgprAllocationGranularity
  result.vgprsPerSimd = vgprsPerSimd
  result.minVgprAllocation = minVgprAllocation
  result.maxVgprAllocation = maxVgprAllocation
  result.vgprAllocationGranularity = vgprAllocationGranularity


proc mkVkDeviceMemoryOverallocationCreateInfoAMD*(
    overallocationBehavior: VkMemoryOverallocationBehaviorAMD): VkDeviceMemoryOverallocationCreateInfoAMD =
  result.sType = vkStructureTypeDeviceMemoryOverallocationCreateInfoAMD
  result.overallocationBehavior = overallocationBehavior


proc mkVkPhysicalDeviceVertexAttributeDivisorPropertiesEXT*(
    maxVertexAttribDivisor: uint32): VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceVertexAttributeDivisorPropertiesEXT
  result.maxVertexAttribDivisor = maxVertexAttribDivisor


proc mkVkPipelineVertexInputDivisorStateCreateInfoEXT*(
    vertexBindingDivisorCount: uint32;
    pVertexBindingDivisors: ptr VkVertexInputBindingDivisorDescriptionEXT): VkPipelineVertexInputDivisorStateCreateInfoEXT =
  result.sType = vkStructureTypePipelineVertexInputDivisorStateCreateInfoEXT
  result.vertexBindingDivisorCount = vertexBindingDivisorCount
  result.pVertexBindingDivisors = pVertexBindingDivisors


proc mkVkPhysicalDeviceVertexAttributeDivisorFeaturesEXT*(
    vertexAttributeInstanceRateDivisor: VkBool32;
    vertexAttributeInstanceRateZeroDivisor: VkBool32): VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceVertexAttributeDivisorFeaturesEXT
  result.vertexAttributeInstanceRateDivisor = vertexAttributeInstanceRateDivisor
  result.vertexAttributeInstanceRateZeroDivisor = vertexAttributeInstanceRateZeroDivisor


proc mkVkPipelineCreationFeedbackCreateInfoEXT*(
    pPipelineCreationFeedback: ptr VkPipelineCreationFeedbackEXT;
    pipelineStageCreationFeedbackCount: uint32;
    pPipelineStageCreationFeedbacks: ptr VkPipelineCreationFeedbackEXT): VkPipelineCreationFeedbackCreateInfoEXT =
  result.sType = vkStructureTypePipelineCreationFeedbackCreateInfoEXT
  result.pPipelineCreationFeedback = pPipelineCreationFeedback
  result.pipelineStageCreationFeedbackCount = pipelineStageCreationFeedbackCount
  result.pPipelineStageCreationFeedbacks = pPipelineStageCreationFeedbacks


proc mkVkPhysicalDeviceDriverProperties*(driverID: VkDriverId;
    driverName: array[0 .. 255, char]; driverInfo: array[0 .. 255, char];
    conformanceVersion: VkConformanceVersion): VkPhysicalDeviceDriverProperties =
  result.sType = vkStructureTypePhysicalDeviceDriverProperties
  result.driverID = driverID
  result.driverName = driverName
  result.driverInfo = driverInfo
  result.conformanceVersion = conformanceVersion


proc mkVkPhysicalDeviceFloatControlsProperties*(
    denormBehaviorIndependence: VkShaderFloatControlsIndependence;
    roundingModeIndependence: VkShaderFloatControlsIndependence;
    shaderSignedZeroInfNanPreserveFloat16: VkBool32;
    shaderSignedZeroInfNanPreserveFloat32: VkBool32;
    shaderSignedZeroInfNanPreserveFloat64: VkBool32;
    shaderDenormPreserveFloat16: VkBool32;
    shaderDenormPreserveFloat32: VkBool32;
    shaderDenormPreserveFloat64: VkBool32;
    shaderDenormFlushToZeroFloat16: VkBool32;
    shaderDenormFlushToZeroFloat32: VkBool32;
    shaderDenormFlushToZeroFloat64: VkBool32;
    shaderRoundingModeRTEFloat16: VkBool32;
    shaderRoundingModeRTEFloat32: VkBool32;
    shaderRoundingModeRTEFloat64: VkBool32;
    shaderRoundingModeRTZFloat16: VkBool32;
    shaderRoundingModeRTZFloat32: VkBool32;
    shaderRoundingModeRTZFloat64: VkBool32): VkPhysicalDeviceFloatControlsProperties =
  result.sType = vkStructureTypePhysicalDeviceFloatControlsProperties
  result.denormBehaviorIndependence = denormBehaviorIndependence
  result.roundingModeIndependence = roundingModeIndependence
  result.shaderSignedZeroInfNanPreserveFloat16 = shaderSignedZeroInfNanPreserveFloat16
  result.shaderSignedZeroInfNanPreserveFloat32 = shaderSignedZeroInfNanPreserveFloat32
  result.shaderSignedZeroInfNanPreserveFloat64 = shaderSignedZeroInfNanPreserveFloat64
  result.shaderDenormPreserveFloat16 = shaderDenormPreserveFloat16
  result.shaderDenormPreserveFloat32 = shaderDenormPreserveFloat32
  result.shaderDenormPreserveFloat64 = shaderDenormPreserveFloat64
  result.shaderDenormFlushToZeroFloat16 = shaderDenormFlushToZeroFloat16
  result.shaderDenormFlushToZeroFloat32 = shaderDenormFlushToZeroFloat32
  result.shaderDenormFlushToZeroFloat64 = shaderDenormFlushToZeroFloat64
  result.shaderRoundingModeRTEFloat16 = shaderRoundingModeRTEFloat16
  result.shaderRoundingModeRTEFloat32 = shaderRoundingModeRTEFloat32
  result.shaderRoundingModeRTEFloat64 = shaderRoundingModeRTEFloat64
  result.shaderRoundingModeRTZFloat16 = shaderRoundingModeRTZFloat16
  result.shaderRoundingModeRTZFloat32 = shaderRoundingModeRTZFloat32
  result.shaderRoundingModeRTZFloat64 = shaderRoundingModeRTZFloat64


proc mkVkPhysicalDeviceDepthStencilResolveProperties*(
    supportedDepthResolveModes: VkResolveModeFlags;
    supportedStencilResolveModes: VkResolveModeFlags;
    independentResolveNone: VkBool32; independentResolve: VkBool32): VkPhysicalDeviceDepthStencilResolveProperties =
  result.sType = vkStructureTypePhysicalDeviceDepthStencilResolveProperties
  result.supportedDepthResolveModes = supportedDepthResolveModes
  result.supportedStencilResolveModes = supportedStencilResolveModes
  result.independentResolveNone = independentResolveNone
  result.independentResolve = independentResolve


proc mkVkSubpassDescriptionDepthStencilResolve*(
    depthResolveMode: VkResolveModeFlagBits;
    stencilResolveMode: VkResolveModeFlagBits;
    pDepthStencilResolveAttachment: ptr VkAttachmentReference2): VkSubpassDescriptionDepthStencilResolve =
  result.sType = vkStructureTypeSubpassDescriptionDepthStencilResolve
  result.depthResolveMode = depthResolveMode
  result.stencilResolveMode = stencilResolveMode
  result.pDepthStencilResolveAttachment = pDepthStencilResolveAttachment


proc mkVkPhysicalDeviceComputeShaderDerivativesFeaturesNV*(
    computeDerivativeGroupQuads: VkBool32;
    computeDerivativeGroupLinear: VkBool32): VkPhysicalDeviceComputeShaderDerivativesFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceComputeShaderDerivativesFeaturesNV
  result.computeDerivativeGroupQuads = computeDerivativeGroupQuads
  result.computeDerivativeGroupLinear = computeDerivativeGroupLinear


proc mkVkPhysicalDeviceMeshShaderFeaturesNV*(taskShader: VkBool32;
    meshShader: VkBool32): VkPhysicalDeviceMeshShaderFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceMeshShaderFeaturesNV
  result.taskShader = taskShader
  result.meshShader = meshShader


proc mkVkPhysicalDeviceMeshShaderPropertiesNV*(maxDrawMeshTasksCount: uint32;
    maxTaskWorkGroupInvocations: uint32;
    maxTaskWorkGroupSize: array[0 .. 2, uint32]; maxTaskTotalMemorySize: uint32;
    maxTaskOutputCount: uint32; maxMeshWorkGroupInvocations: uint32;
    maxMeshWorkGroupSize: array[0 .. 2, uint32]; maxMeshTotalMemorySize: uint32;
    maxMeshOutputVertices: uint32; maxMeshOutputPrimitives: uint32;
    maxMeshMultiviewViewCount: uint32; meshOutputPerVertexGranularity: uint32;
    meshOutputPerPrimitiveGranularity: uint32): VkPhysicalDeviceMeshShaderPropertiesNV =
  result.sType = vkStructureTypePhysicalDeviceMeshShaderPropertiesNV
  result.maxDrawMeshTasksCount = maxDrawMeshTasksCount
  result.maxTaskWorkGroupInvocations = maxTaskWorkGroupInvocations
  result.maxTaskWorkGroupSize = maxTaskWorkGroupSize
  result.maxTaskTotalMemorySize = maxTaskTotalMemorySize
  result.maxTaskOutputCount = maxTaskOutputCount
  result.maxMeshWorkGroupInvocations = maxMeshWorkGroupInvocations
  result.maxMeshWorkGroupSize = maxMeshWorkGroupSize
  result.maxMeshTotalMemorySize = maxMeshTotalMemorySize
  result.maxMeshOutputVertices = maxMeshOutputVertices
  result.maxMeshOutputPrimitives = maxMeshOutputPrimitives
  result.maxMeshMultiviewViewCount = maxMeshMultiviewViewCount
  result.meshOutputPerVertexGranularity = meshOutputPerVertexGranularity
  result.meshOutputPerPrimitiveGranularity = meshOutputPerPrimitiveGranularity


proc mkVkPhysicalDeviceFragmentShaderBarycentricFeaturesNV*(
    fragmentShaderBarycentric: VkBool32): VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceFragmentShaderBarycentricFeaturesNV
  result.fragmentShaderBarycentric = fragmentShaderBarycentric


proc mkVkPhysicalDeviceShaderImageFootprintFeaturesNV*(imageFootprint: VkBool32): VkPhysicalDeviceShaderImageFootprintFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceShaderImageFootprintFeaturesNV
  result.imageFootprint = imageFootprint


proc mkVkPipelineViewportExclusiveScissorStateCreateInfoNV*(
    exclusiveScissorCount: uint32; pExclusiveScissors: ptr VkRect2D): VkPipelineViewportExclusiveScissorStateCreateInfoNV =
  result.sType = vkStructureTypePipelineViewportExclusiveScissorStateCreateInfoNV
  result.exclusiveScissorCount = exclusiveScissorCount
  result.pExclusiveScissors = pExclusiveScissors


proc mkVkPhysicalDeviceExclusiveScissorFeaturesNV*(exclusiveScissor: VkBool32): VkPhysicalDeviceExclusiveScissorFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceExclusiveScissorFeaturesNV
  result.exclusiveScissor = exclusiveScissor


proc mkVkCheckpointDataNV*(stage: VkPipelineStageFlagBits): VkCheckpointDataNV =
  result.sType = vkStructureTypeCheckpointDataNV
  result.stage = stage


proc mkVkQueueFamilyCheckpointPropertiesNV*(
    checkpointExecutionStageMask: VkPipelineStageFlags): VkQueueFamilyCheckpointPropertiesNV =
  result.sType = vkStructureTypeQueueFamilyCheckpointPropertiesNV
  result.checkpointExecutionStageMask = checkpointExecutionStageMask


proc mkVkPhysicalDeviceTimelineSemaphoreFeatures*(timelineSemaphore: VkBool32): VkPhysicalDeviceTimelineSemaphoreFeatures =
  result.sType = vkStructureTypePhysicalDeviceTimelineSemaphoreFeatures
  result.timelineSemaphore = timelineSemaphore


proc mkVkPhysicalDeviceTimelineSemaphoreProperties*(
    maxTimelineSemaphoreValueDifference: uint64): VkPhysicalDeviceTimelineSemaphoreProperties =
  result.sType = vkStructureTypePhysicalDeviceTimelineSemaphoreProperties
  result.maxTimelineSemaphoreValueDifference = maxTimelineSemaphoreValueDifference


proc mkVkSemaphoreTypeCreateInfo*(semaphoreType: VkSemaphoreType;
                                  initialValue: uint64): VkSemaphoreTypeCreateInfo =
  result.sType = vkStructureTypeSemaphoreTypeCreateInfo
  result.semaphoreType = semaphoreType
  result.initialValue = initialValue


proc mkVkTimelineSemaphoreSubmitInfo*(waitSemaphoreValueCount: uint32;
                                      pWaitSemaphoreValues: ptr uint64;
                                      signalSemaphoreValueCount: uint32;
                                      pSignalSemaphoreValues: ptr uint64): VkTimelineSemaphoreSubmitInfo =
  result.sType = vkStructureTypeTimelineSemaphoreSubmitInfo
  result.waitSemaphoreValueCount = waitSemaphoreValueCount
  result.pWaitSemaphoreValues = pWaitSemaphoreValues
  result.signalSemaphoreValueCount = signalSemaphoreValueCount
  result.pSignalSemaphoreValues = pSignalSemaphoreValues


proc mkVkSemaphoreWaitInfo*(semaphoreCount: uint32;
                            pSemaphores: ptr VkSemaphore; pValues: ptr uint64): VkSemaphoreWaitInfo =
  result.sType = vkStructureTypeSemaphoreWaitInfo
  result.semaphoreCount = semaphoreCount
  result.pSemaphores = pSemaphores
  result.pValues = pValues


proc mkVkSemaphoreSignalInfo*(semaphore: VkSemaphore; value: uint64): VkSemaphoreSignalInfo =
  result.sType = vkStructureTypeSemaphoreSignalInfo
  result.semaphore = semaphore
  result.value = value


proc mkVkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL*(
    shaderIntegerFunctions2: VkBool32): VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL =
  result.sType = vkStructureTypePhysicalDeviceShaderIntegerFunctions2FeaturesINTEL
  result.shaderIntegerFunctions2 = shaderIntegerFunctions2


proc mkVkQueryPoolPerformanceQueryCreateInfoINTEL*(
    performanceCountersSampling: VkQueryPoolSamplingModeINTEL): VkQueryPoolPerformanceQueryCreateInfoINTEL =
  result.sType = vkStructureTypeQueryPoolPerformanceQueryCreateInfoINTEL
  result.performanceCountersSampling = performanceCountersSampling


proc mkVkInitializePerformanceApiInfoINTEL*(): VkInitializePerformanceApiInfoINTEL =
  result.sType = vkStructureTypeInitializePerformanceApiInfoINTEL


proc mkVkPerformanceMarkerInfoINTEL*(marker: uint64): VkPerformanceMarkerInfoINTEL =
  result.sType = vkStructureTypePerformanceMarkerInfoINTEL
  result.marker = marker


proc mkVkPerformanceStreamMarkerInfoINTEL*(marker: uint32): VkPerformanceStreamMarkerInfoINTEL =
  result.sType = vkStructureTypePerformanceStreamMarkerInfoINTEL
  result.marker = marker


proc mkVkPerformanceOverrideInfoINTEL*(`type`: VkPerformanceOverrideTypeINTEL;
                                       enable: VkBool32; parameter: uint64): VkPerformanceOverrideInfoINTEL =
  result.sType = vkStructureTypePerformanceOverrideInfoINTEL
  result.`type` = `type`
  result.enable = enable
  result.parameter = parameter


proc mkVkPerformanceConfigurationAcquireInfoINTEL*(
    `type`: VkPerformanceConfigurationTypeINTEL): VkPerformanceConfigurationAcquireInfoINTEL =
  result.sType = vkStructureTypePerformanceConfigurationAcquireInfoINTEL
  result.`type` = `type`


proc mkVkPhysicalDeviceVulkanMemoryModelFeatures*(vulkanMemoryModel: VkBool32;
    vulkanMemoryModelDeviceScope: VkBool32;
    vulkanMemoryModelAvailabilityVisibilityChains: VkBool32): VkPhysicalDeviceVulkanMemoryModelFeatures =
  result.sType = vkStructureTypePhysicalDeviceVulkanMemoryModelFeatures
  result.vulkanMemoryModel = vulkanMemoryModel
  result.vulkanMemoryModelDeviceScope = vulkanMemoryModelDeviceScope
  result.vulkanMemoryModelAvailabilityVisibilityChains = vulkanMemoryModelAvailabilityVisibilityChains


proc mkVkPhysicalDevicePCIBusInfoPropertiesEXT*(pciDomain: uint32;
    pciBus: uint32; pciDevice: uint32; pciFunction: uint32): VkPhysicalDevicePCIBusInfoPropertiesEXT =
  result.sType = vkStructureTypePhysicalDevicePCIBusInfoPropertiesEXT
  result.pciDomain = pciDomain
  result.pciBus = pciBus
  result.pciDevice = pciDevice
  result.pciFunction = pciFunction


proc mkVkDisplayNativeHdrSurfaceCapabilitiesAMD*(localDimmingSupport: VkBool32): VkDisplayNativeHdrSurfaceCapabilitiesAMD =
  result.sType = vkStructureTypeDisplayNativeHdrSurfaceCapabilitiesAMD
  result.localDimmingSupport = localDimmingSupport


proc mkVkSwapchainDisplayNativeHdrCreateInfoAMD*(localDimmingEnable: VkBool32): VkSwapchainDisplayNativeHdrCreateInfoAMD =
  result.sType = vkStructureTypeSwapchainDisplayNativeHdrCreateInfoAMD
  result.localDimmingEnable = localDimmingEnable


proc mkVkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*(
    shaderTerminateInvocation: VkBool32): VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceShaderTerminateInvocationFeaturesKHR
  result.shaderTerminateInvocation = shaderTerminateInvocation


proc mkVkPhysicalDeviceFragmentDensityMapFeaturesEXT*(
    fragmentDensityMap: VkBool32; fragmentDensityMapDynamic: VkBool32;
    fragmentDensityMapNonSubsampledImages: VkBool32): VkPhysicalDeviceFragmentDensityMapFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceFragmentDensityMapFeaturesEXT
  result.fragmentDensityMap = fragmentDensityMap
  result.fragmentDensityMapDynamic = fragmentDensityMapDynamic
  result.fragmentDensityMapNonSubsampledImages = fragmentDensityMapNonSubsampledImages


proc mkVkPhysicalDeviceFragmentDensityMapPropertiesEXT*(
    minFragmentDensityTexelSize: VkExtent2D;
    maxFragmentDensityTexelSize: VkExtent2D;
    fragmentDensityInvocations: VkBool32): VkPhysicalDeviceFragmentDensityMapPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceFragmentDensityMapPropertiesEXT
  result.minFragmentDensityTexelSize = minFragmentDensityTexelSize
  result.maxFragmentDensityTexelSize = maxFragmentDensityTexelSize
  result.fragmentDensityInvocations = fragmentDensityInvocations


proc mkVkRenderPassFragmentDensityMapCreateInfoEXT*(
    fragmentDensityMapAttachment: VkAttachmentReference): VkRenderPassFragmentDensityMapCreateInfoEXT =
  result.sType = vkStructureTypeRenderPassFragmentDensityMapCreateInfoEXT
  result.fragmentDensityMapAttachment = fragmentDensityMapAttachment


proc mkVkPhysicalDeviceScalarBlockLayoutFeatures*(scalarBlockLayout: VkBool32): VkPhysicalDeviceScalarBlockLayoutFeatures =
  result.sType = vkStructureTypePhysicalDeviceScalarBlockLayoutFeatures
  result.scalarBlockLayout = scalarBlockLayout


proc mkVkPhysicalDeviceSubgroupSizeControlPropertiesEXT*(
    minSubgroupSize: uint32; maxSubgroupSize: uint32;
    maxComputeWorkgroupSubgroups: uint32;
    requiredSubgroupSizeStages: VkShaderStageFlags): VkPhysicalDeviceSubgroupSizeControlPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceSubgroupSizeControlPropertiesEXT
  result.minSubgroupSize = minSubgroupSize
  result.maxSubgroupSize = maxSubgroupSize
  result.maxComputeWorkgroupSubgroups = maxComputeWorkgroupSubgroups
  result.requiredSubgroupSizeStages = requiredSubgroupSizeStages


proc mkVkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT*(
    requiredSubgroupSize: uint32): VkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT =
  result.sType = vkStructureTypePipelineShaderStageRequiredSubgroupSizeCreateInfoEXT
  result.requiredSubgroupSize = requiredSubgroupSize


proc mkVkPhysicalDeviceSubgroupSizeControlFeaturesEXT*(
    subgroupSizeControl: VkBool32; computeFullSubgroups: VkBool32): VkPhysicalDeviceSubgroupSizeControlFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceSubgroupSizeControlFeaturesEXT
  result.subgroupSizeControl = subgroupSizeControl
  result.computeFullSubgroups = computeFullSubgroups


proc mkVkFragmentShadingRateAttachmentInfoKHR*(
    pFragmentShadingRateAttachment: ptr VkAttachmentReference2;
    shadingRateAttachmentTexelSize: VkExtent2D): VkFragmentShadingRateAttachmentInfoKHR =
  result.sType = vkStructureTypeFragmentShadingRateAttachmentInfoKHR
  result.pFragmentShadingRateAttachment = pFragmentShadingRateAttachment
  result.shadingRateAttachmentTexelSize = shadingRateAttachmentTexelSize


proc mkVkPipelineFragmentShadingRateStateCreateInfoKHR*(
    fragmentSize: VkExtent2D;
    combinerOps: array[0 .. 1, VkFragmentShadingRateCombinerOpKHR]): VkPipelineFragmentShadingRateStateCreateInfoKHR =
  result.sType = vkStructureTypePipelineFragmentShadingRateStateCreateInfoKHR
  result.fragmentSize = fragmentSize
  result.combinerOps = combinerOps


proc mkVkPhysicalDeviceFragmentShadingRatePropertiesKHR*(
    minFragmentShadingRateAttachmentTexelSize: VkExtent2D;
    maxFragmentShadingRateAttachmentTexelSize: VkExtent2D;
    maxFragmentShadingRateAttachmentTexelSizeAspectRatio: uint32;
    primitiveFragmentShadingRateWithMultipleViewports: VkBool32;
    layeredShadingRateAttachments: VkBool32;
    fragmentShadingRateNonTrivialCombinerOps: VkBool32;
    maxFragmentSize: VkExtent2D; maxFragmentSizeAspectRatio: uint32;
    maxFragmentShadingRateCoverageSamples: uint32;
    maxFragmentShadingRateRasterizationSamples: VkSampleCountFlagBits;
    fragmentShadingRateWithShaderDepthStencilWrites: VkBool32;
    fragmentShadingRateWithSampleMask: VkBool32;
    fragmentShadingRateWithShaderSampleMask: VkBool32;
    fragmentShadingRateWithConservativeRasterization: VkBool32;
    fragmentShadingRateWithFragmentShaderInterlock: VkBool32;
    fragmentShadingRateWithCustomSampleLocations: VkBool32;
    fragmentShadingRateStrictMultiplyCombiner: VkBool32): VkPhysicalDeviceFragmentShadingRatePropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceFragmentShadingRatePropertiesKHR
  result.minFragmentShadingRateAttachmentTexelSize = minFragmentShadingRateAttachmentTexelSize
  result.maxFragmentShadingRateAttachmentTexelSize = maxFragmentShadingRateAttachmentTexelSize
  result.maxFragmentShadingRateAttachmentTexelSizeAspectRatio = maxFragmentShadingRateAttachmentTexelSizeAspectRatio
  result.primitiveFragmentShadingRateWithMultipleViewports = primitiveFragmentShadingRateWithMultipleViewports
  result.layeredShadingRateAttachments = layeredShadingRateAttachments
  result.fragmentShadingRateNonTrivialCombinerOps = fragmentShadingRateNonTrivialCombinerOps
  result.maxFragmentSize = maxFragmentSize
  result.maxFragmentSizeAspectRatio = maxFragmentSizeAspectRatio
  result.maxFragmentShadingRateCoverageSamples = maxFragmentShadingRateCoverageSamples
  result.maxFragmentShadingRateRasterizationSamples = maxFragmentShadingRateRasterizationSamples
  result.fragmentShadingRateWithShaderDepthStencilWrites = fragmentShadingRateWithShaderDepthStencilWrites
  result.fragmentShadingRateWithSampleMask = fragmentShadingRateWithSampleMask
  result.fragmentShadingRateWithShaderSampleMask = fragmentShadingRateWithShaderSampleMask
  result.fragmentShadingRateWithConservativeRasterization = fragmentShadingRateWithConservativeRasterization
  result.fragmentShadingRateWithFragmentShaderInterlock = fragmentShadingRateWithFragmentShaderInterlock
  result.fragmentShadingRateWithCustomSampleLocations = fragmentShadingRateWithCustomSampleLocations
  result.fragmentShadingRateStrictMultiplyCombiner = fragmentShadingRateStrictMultiplyCombiner


proc mkVkPhysicalDeviceFragmentShadingRateFeaturesKHR*(
    pipelineFragmentShadingRate: VkBool32;
    primitiveFragmentShadingRate: VkBool32;
    attachmentFragmentShadingRate: VkBool32): VkPhysicalDeviceFragmentShadingRateFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceFragmentShadingRateFeaturesKHR
  result.pipelineFragmentShadingRate = pipelineFragmentShadingRate
  result.primitiveFragmentShadingRate = primitiveFragmentShadingRate
  result.attachmentFragmentShadingRate = attachmentFragmentShadingRate


proc mkVkPhysicalDeviceFragmentShadingRateKHR*(sampleCounts: VkSampleCountFlags;
    fragmentSize: VkExtent2D): VkPhysicalDeviceFragmentShadingRateKHR =
  result.sType = vkStructureTypePhysicalDeviceFragmentShadingRateKHR
  result.sampleCounts = sampleCounts
  result.fragmentSize = fragmentSize


proc mkVkPhysicalDeviceShaderCoreProperties2AMD*(
    shaderCoreFeatures: VkShaderCorePropertiesFlagsAMD;
    activeComputeUnitCount: uint32): VkPhysicalDeviceShaderCoreProperties2AMD =
  result.sType = vkStructureTypePhysicalDeviceShaderCoreProperties2AMD
  result.shaderCoreFeatures = shaderCoreFeatures
  result.activeComputeUnitCount = activeComputeUnitCount


proc mkVkPhysicalDeviceCoherentMemoryFeaturesAMD*(deviceCoherentMemory: VkBool32): VkPhysicalDeviceCoherentMemoryFeaturesAMD =
  result.sType = vkStructureTypePhysicalDeviceCoherentMemoryFeaturesAMD
  result.deviceCoherentMemory = deviceCoherentMemory


proc mkVkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*(
    shaderImageInt64Atomics: VkBool32; sparseImageInt64Atomics: VkBool32): VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceShaderImageAtomicInt64FeaturesEXT
  result.shaderImageInt64Atomics = shaderImageInt64Atomics
  result.sparseImageInt64Atomics = sparseImageInt64Atomics


proc mkVkPhysicalDeviceMemoryBudgetPropertiesEXT*(
    heapBudget: array[0 .. 15, VkDeviceSize];
    heapUsage: array[0 .. 15, VkDeviceSize]): VkPhysicalDeviceMemoryBudgetPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceMemoryBudgetPropertiesEXT
  result.heapBudget = heapBudget
  result.heapUsage = heapUsage


proc mkVkPhysicalDeviceMemoryPriorityFeaturesEXT*(memoryPriority: VkBool32): VkPhysicalDeviceMemoryPriorityFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceMemoryPriorityFeaturesEXT
  result.memoryPriority = memoryPriority


proc mkVkMemoryPriorityAllocateInfoEXT*(priority: cfloat): VkMemoryPriorityAllocateInfoEXT =
  result.sType = vkStructureTypeMemoryPriorityAllocateInfoEXT
  result.priority = priority


proc mkVkSurfaceProtectedCapabilitiesKHR*(supportsProtected: VkBool32): VkSurfaceProtectedCapabilitiesKHR =
  result.sType = vkStructureTypeSurfaceProtectedCapabilitiesKHR
  result.supportsProtected = supportsProtected


proc mkVkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV*(
    dedicatedAllocationImageAliasing: VkBool32): VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV
  result.dedicatedAllocationImageAliasing = dedicatedAllocationImageAliasing


proc mkVkPhysicalDeviceSeparateDepthStencilLayoutsFeatures*(
    separateDepthStencilLayouts: VkBool32): VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures =
  result.sType = vkStructureTypePhysicalDeviceSeparateDepthStencilLayoutsFeatures
  result.separateDepthStencilLayouts = separateDepthStencilLayouts


proc mkVkAttachmentReferenceStencilLayout*(stencilLayout: VkImageLayout): VkAttachmentReferenceStencilLayout =
  result.sType = vkStructureTypeAttachmentReferenceStencilLayout
  result.stencilLayout = stencilLayout


proc mkVkAttachmentDescriptionStencilLayout*(
    stencilInitialLayout: VkImageLayout; stencilFinalLayout: VkImageLayout): VkAttachmentDescriptionStencilLayout =
  result.sType = vkStructureTypeAttachmentDescriptionStencilLayout
  result.stencilInitialLayout = stencilInitialLayout
  result.stencilFinalLayout = stencilFinalLayout


proc mkVkPhysicalDeviceBufferDeviceAddressFeaturesEXT*(
    bufferDeviceAddress: VkBool32; bufferDeviceAddressCaptureReplay: VkBool32;
    bufferDeviceAddressMultiDevice: VkBool32): VkPhysicalDeviceBufferDeviceAddressFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceBufferDeviceAddressFeaturesEXT
  result.bufferDeviceAddress = bufferDeviceAddress
  result.bufferDeviceAddressCaptureReplay = bufferDeviceAddressCaptureReplay
  result.bufferDeviceAddressMultiDevice = bufferDeviceAddressMultiDevice


proc mkVkBufferDeviceAddressInfo*(buffer: VkBuffer): VkBufferDeviceAddressInfo =
  result.sType = vkStructureTypeBufferDeviceAddressInfo
  result.buffer = buffer


proc mkVkBufferDeviceAddressCreateInfoEXT*(deviceAddress: VkDeviceAddress): VkBufferDeviceAddressCreateInfoEXT =
  result.sType = vkStructureTypeBufferDeviceAddressCreateInfoEXT
  result.deviceAddress = deviceAddress


proc mkVkPhysicalDeviceToolPropertiesEXT*(name: array[0 .. 255, char];
    version: array[0 .. 255, char]; purposes: VkToolPurposeFlagsEXT;
    description: array[0 .. 255, char]; layer: array[0 .. 255, char]): VkPhysicalDeviceToolPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceToolPropertiesEXT
  result.name = name
  result.version = version
  result.purposes = purposes
  result.description = description
  result.layer = layer


proc mkVkImageStencilUsageCreateInfo*(stencilUsage: VkImageUsageFlags): VkImageStencilUsageCreateInfo =
  result.sType = vkStructureTypeImageStencilUsageCreateInfo
  result.stencilUsage = stencilUsage


proc mkVkValidationFeaturesEXT*(enabledValidationFeatureCount: uint32;
    pEnabledValidationFeatures: ptr VkValidationFeatureEnableEXT;
                                disabledValidationFeatureCount: uint32;
    pDisabledValidationFeatures: ptr VkValidationFeatureDisableEXT): VkValidationFeaturesEXT =
  result.sType = vkStructureTypeValidationFeaturesEXT
  result.enabledValidationFeatureCount = enabledValidationFeatureCount
  result.pEnabledValidationFeatures = pEnabledValidationFeatures
  result.disabledValidationFeatureCount = disabledValidationFeatureCount
  result.pDisabledValidationFeatures = pDisabledValidationFeatures


proc mkVkPhysicalDeviceCooperativeMatrixFeaturesNV*(cooperativeMatrix: VkBool32;
    cooperativeMatrixRobustBufferAccess: VkBool32): VkPhysicalDeviceCooperativeMatrixFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceCooperativeMatrixFeaturesNV
  result.cooperativeMatrix = cooperativeMatrix
  result.cooperativeMatrixRobustBufferAccess = cooperativeMatrixRobustBufferAccess


proc mkVkCooperativeMatrixPropertiesNV*(MSize: uint32; NSize: uint32;
                                        KSize: uint32; AType: VkComponentTypeNV;
                                        BType: VkComponentTypeNV;
                                        CType: VkComponentTypeNV;
                                        DType: VkComponentTypeNV;
                                        scope: VkScopeNV): VkCooperativeMatrixPropertiesNV =
  result.sType = vkStructureTypeCooperativeMatrixPropertiesNV
  result.MSize = MSize
  result.NSize = NSize
  result.KSize = KSize
  result.AType = AType
  result.BType = BType
  result.CType = CType
  result.DType = DType
  result.scope = scope


proc mkVkPhysicalDeviceCooperativeMatrixPropertiesNV*(
    cooperativeMatrixSupportedStages: VkShaderStageFlags): VkPhysicalDeviceCooperativeMatrixPropertiesNV =
  result.sType = vkStructureTypePhysicalDeviceCooperativeMatrixPropertiesNV
  result.cooperativeMatrixSupportedStages = cooperativeMatrixSupportedStages


proc mkVkPhysicalDeviceCoverageReductionModeFeaturesNV*(
    coverageReductionMode: VkBool32): VkPhysicalDeviceCoverageReductionModeFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceCoverageReductionModeFeaturesNV
  result.coverageReductionMode = coverageReductionMode


proc mkVkPipelineCoverageReductionStateCreateInfoNV*(
    coverageReductionMode: VkCoverageReductionModeNV): VkPipelineCoverageReductionStateCreateInfoNV =
  result.sType = vkStructureTypePipelineCoverageReductionStateCreateInfoNV
  result.coverageReductionMode = coverageReductionMode


proc mkVkFramebufferMixedSamplesCombinationNV*(
    coverageReductionMode: VkCoverageReductionModeNV;
    rasterizationSamples: VkSampleCountFlagBits;
    depthStencilSamples: VkSampleCountFlags; colorSamples: VkSampleCountFlags): VkFramebufferMixedSamplesCombinationNV =
  result.sType = vkStructureTypeFramebufferMixedSamplesCombinationNV
  result.coverageReductionMode = coverageReductionMode
  result.rasterizationSamples = rasterizationSamples
  result.depthStencilSamples = depthStencilSamples
  result.colorSamples = colorSamples


proc mkVkPhysicalDeviceFragmentShaderInterlockFeaturesEXT*(
    fragmentShaderSampleInterlock: VkBool32;
    fragmentShaderPixelInterlock: VkBool32;
    fragmentShaderShadingRateInterlock: VkBool32): VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceFragmentShaderInterlockFeaturesEXT
  result.fragmentShaderSampleInterlock = fragmentShaderSampleInterlock
  result.fragmentShaderPixelInterlock = fragmentShaderPixelInterlock
  result.fragmentShaderShadingRateInterlock = fragmentShaderShadingRateInterlock


proc mkVkPhysicalDeviceYcbcrImageArraysFeaturesEXT*(ycbcrImageArrays: VkBool32): VkPhysicalDeviceYcbcrImageArraysFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceYcbcrImageArraysFeaturesEXT
  result.ycbcrImageArrays = ycbcrImageArrays


proc mkVkPhysicalDeviceUniformBufferStandardLayoutFeatures*(
    uniformBufferStandardLayout: VkBool32): VkPhysicalDeviceUniformBufferStandardLayoutFeatures =
  result.sType = vkStructureTypePhysicalDeviceUniformBufferStandardLayoutFeatures
  result.uniformBufferStandardLayout = uniformBufferStandardLayout


proc mkVkHeadlessSurfaceCreateInfoEXT*(): VkHeadlessSurfaceCreateInfoEXT =
  result.sType = vkStructureTypeHeadlessSurfaceCreateInfoEXT


proc mkVkPhysicalDeviceBufferDeviceAddressFeatures*(
    bufferDeviceAddress: VkBool32; bufferDeviceAddressCaptureReplay: VkBool32;
    bufferDeviceAddressMultiDevice: VkBool32): VkPhysicalDeviceBufferDeviceAddressFeatures =
  result.sType = vkStructureTypePhysicalDeviceBufferDeviceAddressFeatures
  result.bufferDeviceAddress = bufferDeviceAddress
  result.bufferDeviceAddressCaptureReplay = bufferDeviceAddressCaptureReplay
  result.bufferDeviceAddressMultiDevice = bufferDeviceAddressMultiDevice


proc mkVkBufferOpaqueCaptureAddressCreateInfo*(opaqueCaptureAddress: uint64): VkBufferOpaqueCaptureAddressCreateInfo =
  result.sType = vkStructureTypeBufferOpaqueCaptureAddressCreateInfo
  result.opaqueCaptureAddress = opaqueCaptureAddress


proc mkVkMemoryOpaqueCaptureAddressAllocateInfo*(opaqueCaptureAddress: uint64): VkMemoryOpaqueCaptureAddressAllocateInfo =
  result.sType = vkStructureTypeMemoryOpaqueCaptureAddressAllocateInfo
  result.opaqueCaptureAddress = opaqueCaptureAddress


proc mkVkDeviceMemoryOpaqueCaptureAddressInfo*(memory: VkDeviceMemory): VkDeviceMemoryOpaqueCaptureAddressInfo =
  result.sType = vkStructureTypeDeviceMemoryOpaqueCaptureAddressInfo
  result.memory = memory


proc mkVkPhysicalDeviceLineRasterizationFeaturesEXT*(rectangularLines: VkBool32;
    bresenhamLines: VkBool32; smoothLines: VkBool32;
    stippledRectangularLines: VkBool32; stippledBresenhamLines: VkBool32;
    stippledSmoothLines: VkBool32): VkPhysicalDeviceLineRasterizationFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceLineRasterizationFeaturesEXT
  result.rectangularLines = rectangularLines
  result.bresenhamLines = bresenhamLines
  result.smoothLines = smoothLines
  result.stippledRectangularLines = stippledRectangularLines
  result.stippledBresenhamLines = stippledBresenhamLines
  result.stippledSmoothLines = stippledSmoothLines


proc mkVkPipelineRasterizationLineStateCreateInfoEXT*(
    lineRasterizationMode: VkLineRasterizationModeEXT;
    stippledLineEnable: VkBool32; lineStippleFactor: uint32;
    lineStipplePattern: uint16): VkPipelineRasterizationLineStateCreateInfoEXT =
  result.sType = vkStructureTypePipelineRasterizationLineStateCreateInfoEXT
  result.lineRasterizationMode = lineRasterizationMode
  result.stippledLineEnable = stippledLineEnable
  result.lineStippleFactor = lineStippleFactor
  result.lineStipplePattern = lineStipplePattern


proc mkVkPhysicalDeviceLineRasterizationPropertiesEXT*(
    lineSubPixelPrecisionBits: uint32): VkPhysicalDeviceLineRasterizationPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceLineRasterizationPropertiesEXT
  result.lineSubPixelPrecisionBits = lineSubPixelPrecisionBits


proc mkVkPhysicalDeviceShaderAtomicFloatFeaturesEXT*(
    shaderBufferFloat32Atomics: VkBool32;
    shaderBufferFloat32AtomicAdd: VkBool32;
    shaderBufferFloat64Atomics: VkBool32;
    shaderBufferFloat64AtomicAdd: VkBool32;
    shaderSharedFloat32Atomics: VkBool32;
    shaderSharedFloat32AtomicAdd: VkBool32;
    shaderSharedFloat64Atomics: VkBool32;
    shaderSharedFloat64AtomicAdd: VkBool32; shaderImageFloat32Atomics: VkBool32;
    shaderImageFloat32AtomicAdd: VkBool32; sparseImageFloat32Atomics: VkBool32;
    sparseImageFloat32AtomicAdd: VkBool32): VkPhysicalDeviceShaderAtomicFloatFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceShaderAtomicFloatFeaturesEXT
  result.shaderBufferFloat32Atomics = shaderBufferFloat32Atomics
  result.shaderBufferFloat32AtomicAdd = shaderBufferFloat32AtomicAdd
  result.shaderBufferFloat64Atomics = shaderBufferFloat64Atomics
  result.shaderBufferFloat64AtomicAdd = shaderBufferFloat64AtomicAdd
  result.shaderSharedFloat32Atomics = shaderSharedFloat32Atomics
  result.shaderSharedFloat32AtomicAdd = shaderSharedFloat32AtomicAdd
  result.shaderSharedFloat64Atomics = shaderSharedFloat64Atomics
  result.shaderSharedFloat64AtomicAdd = shaderSharedFloat64AtomicAdd
  result.shaderImageFloat32Atomics = shaderImageFloat32Atomics
  result.shaderImageFloat32AtomicAdd = shaderImageFloat32AtomicAdd
  result.sparseImageFloat32Atomics = sparseImageFloat32Atomics
  result.sparseImageFloat32AtomicAdd = sparseImageFloat32AtomicAdd


proc mkVkPhysicalDeviceHostQueryResetFeatures*(hostQueryReset: VkBool32): VkPhysicalDeviceHostQueryResetFeatures =
  result.sType = vkStructureTypePhysicalDeviceHostQueryResetFeatures
  result.hostQueryReset = hostQueryReset


proc mkVkPhysicalDeviceIndexTypeUint8FeaturesEXT*(indexTypeUint8: VkBool32): VkPhysicalDeviceIndexTypeUint8FeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceIndexTypeUint8FeaturesEXT
  result.indexTypeUint8 = indexTypeUint8


proc mkVkPhysicalDeviceExtendedDynamicStateFeaturesEXT*(
    extendedDynamicState: VkBool32): VkPhysicalDeviceExtendedDynamicStateFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceExtendedDynamicStateFeaturesEXT
  result.extendedDynamicState = extendedDynamicState


proc mkVkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR*(
    pipelineExecutableInfo: VkBool32): VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR =
  result.sType = vkStructureTypePhysicalDevicePipelineExecutablePropertiesFeaturesKHR
  result.pipelineExecutableInfo = pipelineExecutableInfo


proc mkVkPipelineInfoKHR*(pipeline: VkPipeline): VkPipelineInfoKHR =
  result.sType = vkStructureTypePipelineInfoKHR
  result.pipeline = pipeline


proc mkVkPipelineExecutablePropertiesKHR*(stages: VkShaderStageFlags;
    name: array[0 .. 255, char]; description: array[0 .. 255, char];
    subgroupSize: uint32): VkPipelineExecutablePropertiesKHR =
  result.sType = vkStructureTypePipelineExecutablePropertiesKHR
  result.stages = stages
  result.name = name
  result.description = description
  result.subgroupSize = subgroupSize


proc mkVkPipelineExecutableInfoKHR*(pipeline: VkPipeline;
                                    executableIndex: uint32): VkPipelineExecutableInfoKHR =
  result.sType = vkStructureTypePipelineExecutableInfoKHR
  result.pipeline = pipeline
  result.executableIndex = executableIndex


proc mkVkPipelineExecutableStatisticKHR*(name: array[0 .. 255, char];
    description: array[0 .. 255, char];
    format: VkPipelineExecutableStatisticFormatKHR;
    value: VkPipelineExecutableStatisticValueKHR): VkPipelineExecutableStatisticKHR =
  result.sType = vkStructureTypePipelineExecutableStatisticKHR
  result.name = name
  result.description = description
  result.format = format
  result.value = value


proc mkVkPipelineExecutableInternalRepresentationKHR*(
    name: array[0 .. 255, char]; description: array[0 .. 255, char];
    isText: VkBool32; dataSize: csize_t): VkPipelineExecutableInternalRepresentationKHR =
  result.sType = vkStructureTypePipelineExecutableInternalRepresentationKHR
  result.name = name
  result.description = description
  result.isText = isText
  result.dataSize = dataSize


proc mkVkPhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT*(
    shaderDemoteToHelperInvocation: VkBool32): VkPhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT
  result.shaderDemoteToHelperInvocation = shaderDemoteToHelperInvocation


proc mkVkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV*(
    maxGraphicsShaderGroupCount: uint32; maxIndirectSequenceCount: uint32;
    maxIndirectCommandsTokenCount: uint32;
    maxIndirectCommandsStreamCount: uint32;
    maxIndirectCommandsTokenOffset: uint32;
    maxIndirectCommandsStreamStride: uint32;
    minSequencesCountBufferOffsetAlignment: uint32;
    minSequencesIndexBufferOffsetAlignment: uint32;
    minIndirectCommandsBufferOffsetAlignment: uint32): VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV =
  result.sType = vkStructureTypePhysicalDeviceDeviceGeneratedCommandsPropertiesNV
  result.maxGraphicsShaderGroupCount = maxGraphicsShaderGroupCount
  result.maxIndirectSequenceCount = maxIndirectSequenceCount
  result.maxIndirectCommandsTokenCount = maxIndirectCommandsTokenCount
  result.maxIndirectCommandsStreamCount = maxIndirectCommandsStreamCount
  result.maxIndirectCommandsTokenOffset = maxIndirectCommandsTokenOffset
  result.maxIndirectCommandsStreamStride = maxIndirectCommandsStreamStride
  result.minSequencesCountBufferOffsetAlignment = minSequencesCountBufferOffsetAlignment
  result.minSequencesIndexBufferOffsetAlignment = minSequencesIndexBufferOffsetAlignment
  result.minIndirectCommandsBufferOffsetAlignment = minIndirectCommandsBufferOffsetAlignment


proc mkVkGraphicsShaderGroupCreateInfoNV*(stageCount: uint32;
    pStages: ptr VkPipelineShaderStageCreateInfo;
    pVertexInputState: ptr VkPipelineVertexInputStateCreateInfo;
    pTessellationState: ptr VkPipelineTessellationStateCreateInfo): VkGraphicsShaderGroupCreateInfoNV =
  result.sType = vkStructureTypeGraphicsShaderGroupCreateInfoNV
  result.stageCount = stageCount
  result.pStages = pStages
  result.pVertexInputState = pVertexInputState
  result.pTessellationState = pTessellationState


proc mkVkGraphicsPipelineShaderGroupsCreateInfoNV*(groupCount: uint32;
    pGroups: ptr VkGraphicsShaderGroupCreateInfoNV; pipelineCount: uint32;
    pPipelines: ptr VkPipeline): VkGraphicsPipelineShaderGroupsCreateInfoNV =
  result.sType = vkStructureTypeGraphicsPipelineShaderGroupsCreateInfoNV
  result.groupCount = groupCount
  result.pGroups = pGroups
  result.pipelineCount = pipelineCount
  result.pPipelines = pPipelines


proc mkVkIndirectCommandsLayoutTokenNV*(tokenType: VkIndirectCommandsTokenTypeNV;
                                        stream: uint32; offset: uint32;
                                        vertexBindingUnit: uint32;
                                        vertexDynamicStride: VkBool32;
    pushconstantPipelineLayout: VkPipelineLayout; pushconstantShaderStageFlags: VkShaderStageFlags;
                                        pushconstantOffset: uint32;
                                        pushconstantSize: uint32;
    indirectStateFlags: VkIndirectStateFlagsNV; indexTypeCount: uint32;
                                        pIndexTypes: ptr VkIndexType;
                                        pIndexTypeValues: ptr uint32): VkIndirectCommandsLayoutTokenNV =
  result.sType = vkStructureTypeIndirectCommandsLayoutTokenNV
  result.tokenType = tokenType
  result.stream = stream
  result.offset = offset
  result.vertexBindingUnit = vertexBindingUnit
  result.vertexDynamicStride = vertexDynamicStride
  result.pushconstantPipelineLayout = pushconstantPipelineLayout
  result.pushconstantShaderStageFlags = pushconstantShaderStageFlags
  result.pushconstantOffset = pushconstantOffset
  result.pushconstantSize = pushconstantSize
  result.indirectStateFlags = indirectStateFlags
  result.indexTypeCount = indexTypeCount
  result.pIndexTypes = pIndexTypes
  result.pIndexTypeValues = pIndexTypeValues


proc mkVkIndirectCommandsLayoutCreateInfoNV*(
    pipelineBindPoint: VkPipelineBindPoint; tokenCount: uint32;
    pTokens: ptr VkIndirectCommandsLayoutTokenNV; streamCount: uint32;
    pStreamStrides: ptr uint32): VkIndirectCommandsLayoutCreateInfoNV =
  result.sType = vkStructureTypeIndirectCommandsLayoutCreateInfoNV
  result.pipelineBindPoint = pipelineBindPoint
  result.tokenCount = tokenCount
  result.pTokens = pTokens
  result.streamCount = streamCount
  result.pStreamStrides = pStreamStrides


proc mkVkGeneratedCommandsInfoNV*(pipelineBindPoint: VkPipelineBindPoint;
                                  pipeline: VkPipeline; indirectCommandsLayout: VkIndirectCommandsLayoutNV;
                                  streamCount: uint32;
                                  pStreams: ptr VkIndirectCommandsStreamNV;
                                  sequencesCount: uint32;
                                  preprocessBuffer: VkBuffer;
                                  preprocessOffset: VkDeviceSize;
                                  preprocessSize: VkDeviceSize;
                                  sequencesCountBuffer: VkBuffer;
                                  sequencesCountOffset: VkDeviceSize;
                                  sequencesIndexBuffer: VkBuffer;
                                  sequencesIndexOffset: VkDeviceSize): VkGeneratedCommandsInfoNV =
  result.sType = vkStructureTypeGeneratedCommandsInfoNV
  result.pipelineBindPoint = pipelineBindPoint
  result.pipeline = pipeline
  result.indirectCommandsLayout = indirectCommandsLayout
  result.streamCount = streamCount
  result.pStreams = pStreams
  result.sequencesCount = sequencesCount
  result.preprocessBuffer = preprocessBuffer
  result.preprocessOffset = preprocessOffset
  result.preprocessSize = preprocessSize
  result.sequencesCountBuffer = sequencesCountBuffer
  result.sequencesCountOffset = sequencesCountOffset
  result.sequencesIndexBuffer = sequencesIndexBuffer
  result.sequencesIndexOffset = sequencesIndexOffset


proc mkVkGeneratedCommandsMemoryRequirementsInfoNV*(
    pipelineBindPoint: VkPipelineBindPoint; pipeline: VkPipeline;
    indirectCommandsLayout: VkIndirectCommandsLayoutNV;
    maxSequencesCount: uint32): VkGeneratedCommandsMemoryRequirementsInfoNV =
  result.sType = vkStructureTypeGeneratedCommandsMemoryRequirementsInfoNV
  result.pipelineBindPoint = pipelineBindPoint
  result.pipeline = pipeline
  result.indirectCommandsLayout = indirectCommandsLayout
  result.maxSequencesCount = maxSequencesCount


proc mkVkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV*(
    deviceGeneratedCommands: VkBool32): VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceDeviceGeneratedCommandsFeaturesNV
  result.deviceGeneratedCommands = deviceGeneratedCommands


proc mkVkPhysicalDeviceTexelBufferAlignmentFeaturesEXT*(
    texelBufferAlignment: VkBool32): VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceTexelBufferAlignmentFeaturesEXT
  result.texelBufferAlignment = texelBufferAlignment


proc mkVkPhysicalDeviceTexelBufferAlignmentPropertiesEXT*(
    storageTexelBufferOffsetAlignmentBytes: VkDeviceSize;
    storageTexelBufferOffsetSingleTexelAlignment: VkBool32;
    uniformTexelBufferOffsetAlignmentBytes: VkDeviceSize;
    uniformTexelBufferOffsetSingleTexelAlignment: VkBool32): VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceTexelBufferAlignmentPropertiesEXT
  result.storageTexelBufferOffsetAlignmentBytes = storageTexelBufferOffsetAlignmentBytes
  result.storageTexelBufferOffsetSingleTexelAlignment = storageTexelBufferOffsetSingleTexelAlignment
  result.uniformTexelBufferOffsetAlignmentBytes = uniformTexelBufferOffsetAlignmentBytes
  result.uniformTexelBufferOffsetSingleTexelAlignment = uniformTexelBufferOffsetSingleTexelAlignment


proc mkVkCommandBufferInheritanceRenderPassTransformInfoQCOM*(
    transform: VkSurfaceTransformFlagBitsKHR; renderArea: VkRect2D): VkCommandBufferInheritanceRenderPassTransformInfoQCOM =
  result.sType = vkStructureTypeCommandBufferInheritanceRenderPassTransformInfoQCOM
  result.transform = transform
  result.renderArea = renderArea


proc mkVkRenderPassTransformBeginInfoQCOM*(
    transform: VkSurfaceTransformFlagBitsKHR): VkRenderPassTransformBeginInfoQCOM =
  result.sType = vkStructureTypeRenderPassTransformBeginInfoQCOM
  result.transform = transform


proc mkVkPhysicalDeviceDeviceMemoryReportFeaturesEXT*(
    deviceMemoryReport: VkBool32): VkPhysicalDeviceDeviceMemoryReportFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceDeviceMemoryReportFeaturesEXT
  result.deviceMemoryReport = deviceMemoryReport


proc mkVkDeviceDeviceMemoryReportCreateInfoEXT*(
    pfnUserCallback: PFNVkdevicememoryreportcallbackext): VkDeviceDeviceMemoryReportCreateInfoEXT =
  result.sType = vkStructureTypeDeviceDeviceMemoryReportCreateInfoEXT
  result.pfnUserCallback = pfnUserCallback


proc mkVkDeviceMemoryReportCallbackDataEXT*(
    `type`: VkDeviceMemoryReportEventTypeEXT; memoryObjectId: uint64;
    size: VkDeviceSize; heapIndex: uint32): VkDeviceMemoryReportCallbackDataEXT =
  result.sType = vkStructureTypeDeviceMemoryReportCallbackDataEXT
  result.`type` = `type`
  result.memoryObjectId = memoryObjectId
  result.size = size
  result.heapIndex = heapIndex


proc mkVkPhysicalDeviceRobustness2FeaturesEXT*(robustBufferAccess2: VkBool32;
    robustImageAccess2: VkBool32; nullDescriptor: VkBool32): VkPhysicalDeviceRobustness2FeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceRobustness2FeaturesEXT
  result.robustBufferAccess2 = robustBufferAccess2
  result.robustImageAccess2 = robustImageAccess2
  result.nullDescriptor = nullDescriptor


proc mkVkPhysicalDeviceRobustness2PropertiesEXT*(
    robustStorageBufferAccessSizeAlignment: VkDeviceSize;
    robustUniformBufferAccessSizeAlignment: VkDeviceSize): VkPhysicalDeviceRobustness2PropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceRobustness2PropertiesEXT
  result.robustStorageBufferAccessSizeAlignment = robustStorageBufferAccessSizeAlignment
  result.robustUniformBufferAccessSizeAlignment = robustUniformBufferAccessSizeAlignment


proc mkVkSamplerCustomBorderColorCreateInfoEXT*(
    customBorderColor: VkClearColorValue; format: VkFormat): VkSamplerCustomBorderColorCreateInfoEXT =
  result.sType = vkStructureTypeSamplerCustomBorderColorCreateInfoEXT
  result.customBorderColor = customBorderColor
  result.format = format


proc mkVkPhysicalDeviceCustomBorderColorPropertiesEXT*(
    maxCustomBorderColorSamplers: uint32): VkPhysicalDeviceCustomBorderColorPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceCustomBorderColorPropertiesEXT
  result.maxCustomBorderColorSamplers = maxCustomBorderColorSamplers


proc mkVkPhysicalDeviceCustomBorderColorFeaturesEXT*(
    customBorderColors: VkBool32; customBorderColorWithoutFormat: VkBool32): VkPhysicalDeviceCustomBorderColorFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceCustomBorderColorFeaturesEXT
  result.customBorderColors = customBorderColors
  result.customBorderColorWithoutFormat = customBorderColorWithoutFormat


proc mkVkPipelineLibraryCreateInfoKHR*(libraryCount: uint32;
                                       pLibraries: ptr VkPipeline): VkPipelineLibraryCreateInfoKHR =
  result.sType = vkStructureTypePipelineLibraryCreateInfoKHR
  result.libraryCount = libraryCount
  result.pLibraries = pLibraries


proc mkVkPhysicalDevicePrivateDataFeaturesEXT*(privateData: VkBool32): VkPhysicalDevicePrivateDataFeaturesEXT =
  result.sType = vkStructureTypePhysicalDevicePrivateDataFeaturesEXT
  result.privateData = privateData


proc mkVkDevicePrivateDataCreateInfoEXT*(privateDataSlotRequestCount: uint32): VkDevicePrivateDataCreateInfoEXT =
  result.sType = vkStructureTypeDevicePrivateDataCreateInfoEXT
  result.privateDataSlotRequestCount = privateDataSlotRequestCount


proc mkVkPrivateDataSlotCreateInfoEXT*(): VkPrivateDataSlotCreateInfoEXT =
  result.sType = vkStructureTypePrivateDataSlotCreateInfoEXT


proc mkVkPhysicalDevicePipelineCreationCacheControlFeaturesEXT*(
    pipelineCreationCacheControl: VkBool32): VkPhysicalDevicePipelineCreationCacheControlFeaturesEXT =
  result.sType = vkStructureTypePhysicalDevicePipelineCreationCacheControlFeaturesEXT
  result.pipelineCreationCacheControl = pipelineCreationCacheControl


proc mkVkPhysicalDeviceDiagnosticsConfigFeaturesNV*(diagnosticsConfig: VkBool32): VkPhysicalDeviceDiagnosticsConfigFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceDiagnosticsConfigFeaturesNV
  result.diagnosticsConfig = diagnosticsConfig


proc mkVkDeviceDiagnosticsConfigCreateInfoNV*(): VkDeviceDiagnosticsConfigCreateInfoNV =
  result.sType = vkStructureTypeDeviceDiagnosticsConfigCreateInfoNV


proc mkVkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR*(
    shaderZeroInitializeWorkgroupMemory: VkBool32): VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR
  result.shaderZeroInitializeWorkgroupMemory = shaderZeroInitializeWorkgroupMemory


proc mkVkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV*(
    maxFragmentShadingRateInvocationCount: VkSampleCountFlagBits): VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV =
  result.sType = vkStructureTypePhysicalDeviceFragmentShadingRateEnumsPropertiesNV
  result.maxFragmentShadingRateInvocationCount = maxFragmentShadingRateInvocationCount


proc mkVkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV*(
    fragmentShadingRateEnums: VkBool32;
    supersampleFragmentShadingRates: VkBool32;
    noInvocationFragmentShadingRates: VkBool32): VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV =
  result.sType = vkStructureTypePhysicalDeviceFragmentShadingRateEnumsFeaturesNV
  result.fragmentShadingRateEnums = fragmentShadingRateEnums
  result.supersampleFragmentShadingRates = supersampleFragmentShadingRates
  result.noInvocationFragmentShadingRates = noInvocationFragmentShadingRates


proc mkVkPipelineFragmentShadingRateEnumStateCreateInfoNV*(
    shadingRateType: VkFragmentShadingRateTypeNV;
    shadingRate: VkFragmentShadingRateNV;
    combinerOps: array[0 .. 1, VkFragmentShadingRateCombinerOpKHR]): VkPipelineFragmentShadingRateEnumStateCreateInfoNV =
  result.sType = vkStructureTypePipelineFragmentShadingRateEnumStateCreateInfoNV
  result.shadingRateType = shadingRateType
  result.shadingRate = shadingRate
  result.combinerOps = combinerOps


proc mkVkPhysicalDeviceFragmentDensityMap2FeaturesEXT*(
    fragmentDensityMapDeferred: VkBool32): VkPhysicalDeviceFragmentDensityMap2FeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceFragmentDensityMap2FeaturesEXT
  result.fragmentDensityMapDeferred = fragmentDensityMapDeferred


proc mkVkPhysicalDeviceFragmentDensityMap2PropertiesEXT*(
    subsampledLoads: VkBool32;
    subsampledCoarseReconstructionEarlyAccess: VkBool32;
    maxSubsampledArrayLayers: uint32; maxDescriptorSetSubsampledSamplers: uint32): VkPhysicalDeviceFragmentDensityMap2PropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceFragmentDensityMap2PropertiesEXT
  result.subsampledLoads = subsampledLoads
  result.subsampledCoarseReconstructionEarlyAccess = subsampledCoarseReconstructionEarlyAccess
  result.maxSubsampledArrayLayers = maxSubsampledArrayLayers
  result.maxDescriptorSetSubsampledSamplers = maxDescriptorSetSubsampledSamplers


proc mkVkCopyCommandTransformInfoQCOM*(transform: VkSurfaceTransformFlagBitsKHR): VkCopyCommandTransformInfoQCOM =
  result.sType = vkStructureTypeCopyCommandTransformInfoQCOM
  result.transform = transform


proc mkVkPhysicalDeviceImageRobustnessFeaturesEXT*(robustImageAccess: VkBool32): VkPhysicalDeviceImageRobustnessFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceImageRobustnessFeaturesEXT
  result.robustImageAccess = robustImageAccess


proc mkVkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR*(
    workgroupMemoryExplicitLayout: VkBool32;
    workgroupMemoryExplicitLayoutScalarBlockLayout: VkBool32;
    workgroupMemoryExplicitLayout8BitAccess: VkBool32;
    workgroupMemoryExplicitLayout16BitAccess: VkBool32): VkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR
  result.workgroupMemoryExplicitLayout = workgroupMemoryExplicitLayout
  result.workgroupMemoryExplicitLayoutScalarBlockLayout = workgroupMemoryExplicitLayoutScalarBlockLayout
  result.workgroupMemoryExplicitLayout8BitAccess = workgroupMemoryExplicitLayout8BitAccess
  result.workgroupMemoryExplicitLayout16BitAccess = workgroupMemoryExplicitLayout16BitAccess


proc mkVkCopyBufferInfo2KHR*(srcBuffer: VkBuffer; dstBuffer: VkBuffer;
                             regionCount: uint32; pRegions: ptr VkBufferCopy2KHR): VkCopyBufferInfo2KHR =
  result.sType = vkStructureTypeCopyBufferInfo2KHR
  result.srcBuffer = srcBuffer
  result.dstBuffer = dstBuffer
  result.regionCount = regionCount
  result.pRegions = pRegions


proc mkVkCopyImageInfo2KHR*(srcImage: VkImage; srcImageLayout: VkImageLayout;
                            dstImage: VkImage; dstImageLayout: VkImageLayout;
                            regionCount: uint32; pRegions: ptr VkImageCopy2KHR): VkCopyImageInfo2KHR =
  result.sType = vkStructureTypeCopyImageInfo2KHR
  result.srcImage = srcImage
  result.srcImageLayout = srcImageLayout
  result.dstImage = dstImage
  result.dstImageLayout = dstImageLayout
  result.regionCount = regionCount
  result.pRegions = pRegions


proc mkVkCopyBufferToImageInfo2KHR*(srcBuffer: VkBuffer; dstImage: VkImage;
                                    dstImageLayout: VkImageLayout;
                                    regionCount: uint32;
                                    pRegions: ptr VkBufferImageCopy2KHR): VkCopyBufferToImageInfo2KHR =
  result.sType = vkStructureTypeCopyBufferToImageInfo2KHR
  result.srcBuffer = srcBuffer
  result.dstImage = dstImage
  result.dstImageLayout = dstImageLayout
  result.regionCount = regionCount
  result.pRegions = pRegions


proc mkVkCopyImageToBufferInfo2KHR*(srcImage: VkImage;
                                    srcImageLayout: VkImageLayout;
                                    dstBuffer: VkBuffer; regionCount: uint32;
                                    pRegions: ptr VkBufferImageCopy2KHR): VkCopyImageToBufferInfo2KHR =
  result.sType = vkStructureTypeCopyImageToBufferInfo2KHR
  result.srcImage = srcImage
  result.srcImageLayout = srcImageLayout
  result.dstBuffer = dstBuffer
  result.regionCount = regionCount
  result.pRegions = pRegions


proc mkVkBlitImageInfo2KHR*(srcImage: VkImage; srcImageLayout: VkImageLayout;
                            dstImage: VkImage; dstImageLayout: VkImageLayout;
                            regionCount: uint32; pRegions: ptr VkImageBlit2KHR;
                            filter: VkFilter): VkBlitImageInfo2KHR =
  result.sType = vkStructureTypeBlitImageInfo2KHR
  result.srcImage = srcImage
  result.srcImageLayout = srcImageLayout
  result.dstImage = dstImage
  result.dstImageLayout = dstImageLayout
  result.regionCount = regionCount
  result.pRegions = pRegions
  result.filter = filter


proc mkVkResolveImageInfo2KHR*(srcImage: VkImage; srcImageLayout: VkImageLayout;
                               dstImage: VkImage; dstImageLayout: VkImageLayout;
                               regionCount: uint32;
                               pRegions: ptr VkImageResolve2KHR): VkResolveImageInfo2KHR =
  result.sType = vkStructureTypeResolveImageInfo2KHR
  result.srcImage = srcImage
  result.srcImageLayout = srcImageLayout
  result.dstImage = dstImage
  result.dstImageLayout = dstImageLayout
  result.regionCount = regionCount
  result.pRegions = pRegions


proc mkVkBufferCopy2KHR*(srcOffset: VkDeviceSize; dstOffset: VkDeviceSize;
                         size: VkDeviceSize): VkBufferCopy2KHR =
  result.sType = vkStructureTypeBufferCopy2KHR
  result.srcOffset = srcOffset
  result.dstOffset = dstOffset
  result.size = size


proc mkVkImageCopy2KHR*(srcSubresource: VkImageSubresourceLayers;
                        srcOffset: VkOffset3D;
                        dstSubresource: VkImageSubresourceLayers;
                        dstOffset: VkOffset3D; extent: VkExtent3D): VkImageCopy2KHR =
  result.sType = vkStructureTypeImageCopy2KHR
  result.srcSubresource = srcSubresource
  result.srcOffset = srcOffset
  result.dstSubresource = dstSubresource
  result.dstOffset = dstOffset
  result.extent = extent


proc mkVkImageBlit2KHR*(srcSubresource: VkImageSubresourceLayers;
                        srcOffsets: array[0 .. 1, VkOffset3D];
                        dstSubresource: VkImageSubresourceLayers;
                        dstOffsets: array[0 .. 1, VkOffset3D]): VkImageBlit2KHR =
  result.sType = vkStructureTypeImageBlit2KHR
  result.srcSubresource = srcSubresource
  result.srcOffsets = srcOffsets
  result.dstSubresource = dstSubresource
  result.dstOffsets = dstOffsets


proc mkVkBufferImageCopy2KHR*(bufferOffset: VkDeviceSize;
                              bufferRowLength: uint32;
                              bufferImageHeight: uint32;
                              imageSubresource: VkImageSubresourceLayers;
                              imageOffset: VkOffset3D; imageExtent: VkExtent3D): VkBufferImageCopy2KHR =
  result.sType = vkStructureTypeBufferImageCopy2KHR
  result.bufferOffset = bufferOffset
  result.bufferRowLength = bufferRowLength
  result.bufferImageHeight = bufferImageHeight
  result.imageSubresource = imageSubresource
  result.imageOffset = imageOffset
  result.imageExtent = imageExtent


proc mkVkImageResolve2KHR*(srcSubresource: VkImageSubresourceLayers;
                           srcOffset: VkOffset3D;
                           dstSubresource: VkImageSubresourceLayers;
                           dstOffset: VkOffset3D; extent: VkExtent3D): VkImageResolve2KHR =
  result.sType = vkStructureTypeImageResolve2KHR
  result.srcSubresource = srcSubresource
  result.srcOffset = srcOffset
  result.dstSubresource = dstSubresource
  result.dstOffset = dstOffset
  result.extent = extent


proc mkVkPhysicalDevice4444FormatsFeaturesEXT*(formatA4R4G4B4: VkBool32;
    formatA4B4G4R4: VkBool32): VkPhysicalDevice4444FormatsFeaturesEXT =
  result.sType = vkStructureTypePhysicalDevice4444FormatsFeaturesEXT
  result.formatA4R4G4B4 = formatA4R4G4B4
  result.formatA4B4G4R4 = formatA4B4G4R4


proc mkVkPhysicalDeviceRayTracingPipelineFeaturesKHR*(
    rayTracingPipeline: VkBool32;
    rayTracingPipelineShaderGroupHandleCaptureReplay: VkBool32;
    rayTracingPipelineShaderGroupHandleCaptureReplayMixed: VkBool32;
    rayTracingPipelineTraceRaysIndirect: VkBool32;
    rayTraversalPrimitiveCulling: VkBool32): VkPhysicalDeviceRayTracingPipelineFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceRayTracingPipelineFeaturesKHR
  result.rayTracingPipeline = rayTracingPipeline
  result.rayTracingPipelineShaderGroupHandleCaptureReplay = rayTracingPipelineShaderGroupHandleCaptureReplay
  result.rayTracingPipelineShaderGroupHandleCaptureReplayMixed = rayTracingPipelineShaderGroupHandleCaptureReplayMixed
  result.rayTracingPipelineTraceRaysIndirect = rayTracingPipelineTraceRaysIndirect
  result.rayTraversalPrimitiveCulling = rayTraversalPrimitiveCulling


proc mkVkPhysicalDeviceRayTracingPipelinePropertiesKHR*(
    shaderGroupHandleSize: uint32; maxRayRecursionDepth: uint32;
    maxShaderGroupStride: uint32; shaderGroupBaseAlignment: uint32;
    shaderGroupHandleCaptureReplaySize: uint32;
    maxRayDispatchInvocationCount: uint32; shaderGroupHandleAlignment: uint32;
    maxRayHitAttributeSize: uint32): VkPhysicalDeviceRayTracingPipelinePropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceRayTracingPipelinePropertiesKHR
  result.shaderGroupHandleSize = shaderGroupHandleSize
  result.maxRayRecursionDepth = maxRayRecursionDepth
  result.maxShaderGroupStride = maxShaderGroupStride
  result.shaderGroupBaseAlignment = shaderGroupBaseAlignment
  result.shaderGroupHandleCaptureReplaySize = shaderGroupHandleCaptureReplaySize
  result.maxRayDispatchInvocationCount = maxRayDispatchInvocationCount
  result.shaderGroupHandleAlignment = shaderGroupHandleAlignment
  result.maxRayHitAttributeSize = maxRayHitAttributeSize


proc mkVkPhysicalDeviceRayQueryFeaturesKHR*(rayQuery: VkBool32): VkPhysicalDeviceRayQueryFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceRayQueryFeaturesKHR
  result.rayQuery = rayQuery


proc mkVkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE*(
    mutableDescriptorType: VkBool32): VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE =
  result.sType = vkStructureTypePhysicalDeviceMutableDescriptorTypeFeaturesVALVE
  result.mutableDescriptorType = mutableDescriptorType


proc mkVkMutableDescriptorTypeCreateInfoVALVE*(
    mutableDescriptorTypeListCount: uint32;
    pMutableDescriptorTypeLists: ptr VkMutableDescriptorTypeListVALVE): VkMutableDescriptorTypeCreateInfoVALVE =
  result.sType = vkStructureTypeMutableDescriptorTypeCreateInfoVALVE
  result.mutableDescriptorTypeListCount = mutableDescriptorTypeListCount
  result.pMutableDescriptorTypeLists = pMutableDescriptorTypeLists


proc mkVkPhysicalDeviceVariablePointerFeatures*(
    variablePointersStorageBuffer: VkBool32; variablePointers: VkBool32): VkPhysicalDeviceVariablePointerFeatures =
  result.sType = vkStructureTypePhysicalDeviceVariablePointerFeatures
  result.variablePointersStorageBuffer = variablePointersStorageBuffer
  result.variablePointers = variablePointers


proc mkVkPhysicalDeviceShaderDrawParameterFeatures*(
    shaderDrawParameters: VkBool32): VkPhysicalDeviceShaderDrawParameterFeatures =
  result.sType = vkStructureTypePhysicalDeviceShaderDrawParameterFeatures
  result.shaderDrawParameters = shaderDrawParameters


proc mkVkRenderPassMultiviewCreateInfoKHR*(subpassCount: uint32;
    pViewMasks: ptr uint32; dependencyCount: uint32; pViewOffsets: ptr int32;
    correlationMaskCount: uint32; pCorrelationMasks: ptr uint32): VkRenderPassMultiviewCreateInfoKHR =
  result.sType = vkStructureTypeRenderPassMultiviewCreateInfoKHR
  result.subpassCount = subpassCount
  result.pViewMasks = pViewMasks
  result.dependencyCount = dependencyCount
  result.pViewOffsets = pViewOffsets
  result.correlationMaskCount = correlationMaskCount
  result.pCorrelationMasks = pCorrelationMasks


proc mkVkPhysicalDeviceMultiviewFeaturesKHR*(multiview: VkBool32;
    multiviewGeometryShader: VkBool32; multiviewTessellationShader: VkBool32): VkPhysicalDeviceMultiviewFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceMultiviewFeaturesKHR
  result.multiview = multiview
  result.multiviewGeometryShader = multiviewGeometryShader
  result.multiviewTessellationShader = multiviewTessellationShader


proc mkVkPhysicalDeviceMultiviewPropertiesKHR*(maxMultiviewViewCount: uint32;
    maxMultiviewInstanceIndex: uint32): VkPhysicalDeviceMultiviewPropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceMultiviewPropertiesKHR
  result.maxMultiviewViewCount = maxMultiviewViewCount
  result.maxMultiviewInstanceIndex = maxMultiviewInstanceIndex


proc mkVkPhysicalDeviceFeatures2KHR*(features: VkPhysicalDeviceFeatures): VkPhysicalDeviceFeatures2KHR =
  result.sType = vkStructureTypePhysicalDeviceFeatures2KHR
  result.features = features


proc mkVkPhysicalDeviceProperties2KHR*(properties: VkPhysicalDeviceProperties): VkPhysicalDeviceProperties2KHR =
  result.sType = vkStructureTypePhysicalDeviceProperties2KHR
  result.properties = properties


proc mkVkFormatProperties2KHR*(formatProperties: VkFormatProperties): VkFormatProperties2KHR =
  result.sType = vkStructureTypeFormatProperties2KHR
  result.formatProperties = formatProperties


proc mkVkImageFormatProperties2KHR*(imageFormatProperties: VkImageFormatProperties): VkImageFormatProperties2KHR =
  result.sType = vkStructureTypeImageFormatProperties2KHR
  result.imageFormatProperties = imageFormatProperties


proc mkVkPhysicalDeviceImageFormatInfo2KHR*(format: VkFormat; `type`: VkImageType;
    tiling: VkImageTiling; usage: VkImageUsageFlags): VkPhysicalDeviceImageFormatInfo2KHR =
  result.sType = vkStructureTypePhysicalDeviceImageFormatInfo2KHR
  result.format = format
  result.`type` = `type`
  result.tiling = tiling
  result.usage = usage


proc mkVkQueueFamilyProperties2KHR*(queueFamilyProperties: VkQueueFamilyProperties): VkQueueFamilyProperties2KHR =
  result.sType = vkStructureTypeQueueFamilyProperties2KHR
  result.queueFamilyProperties = queueFamilyProperties


proc mkVkPhysicalDeviceMemoryProperties2KHR*(
    memoryProperties: VkPhysicalDeviceMemoryProperties): VkPhysicalDeviceMemoryProperties2KHR =
  result.sType = vkStructureTypePhysicalDeviceMemoryProperties2KHR
  result.memoryProperties = memoryProperties


proc mkVkSparseImageFormatProperties2KHR*(
    properties: VkSparseImageFormatProperties): VkSparseImageFormatProperties2KHR =
  result.sType = vkStructureTypeSparseImageFormatProperties2KHR
  result.properties = properties


proc mkVkPhysicalDeviceSparseImageFormatInfo2KHR*(format: VkFormat;
    `type`: VkImageType; samples: VkSampleCountFlagBits; usage: VkImageUsageFlags;
    tiling: VkImageTiling): VkPhysicalDeviceSparseImageFormatInfo2KHR =
  result.sType = vkStructureTypePhysicalDeviceSparseImageFormatInfo2KHR
  result.format = format
  result.`type` = `type`
  result.samples = samples
  result.usage = usage
  result.tiling = tiling


proc mkVkMemoryAllocateFlagsInfoKHR*(deviceMask: uint32): VkMemoryAllocateFlagsInfoKHR =
  result.sType = vkStructureTypeMemoryAllocateFlagsInfoKHR
  result.deviceMask = deviceMask


proc mkVkDeviceGroupRenderPassBeginInfoKHR*(deviceMask: uint32;
    deviceRenderAreaCount: uint32; pDeviceRenderAreas: ptr VkRect2D): VkDeviceGroupRenderPassBeginInfoKHR =
  result.sType = vkStructureTypeDeviceGroupRenderPassBeginInfoKHR
  result.deviceMask = deviceMask
  result.deviceRenderAreaCount = deviceRenderAreaCount
  result.pDeviceRenderAreas = pDeviceRenderAreas


proc mkVkDeviceGroupCommandBufferBeginInfoKHR*(deviceMask: uint32): VkDeviceGroupCommandBufferBeginInfoKHR =
  result.sType = vkStructureTypeDeviceGroupCommandBufferBeginInfoKHR
  result.deviceMask = deviceMask


proc mkVkDeviceGroupSubmitInfoKHR*(waitSemaphoreCount: uint32;
                                   pWaitSemaphoreDeviceIndices: ptr uint32;
                                   commandBufferCount: uint32;
                                   pCommandBufferDeviceMasks: ptr uint32;
                                   signalSemaphoreCount: uint32;
                                   pSignalSemaphoreDeviceIndices: ptr uint32): VkDeviceGroupSubmitInfoKHR =
  result.sType = vkStructureTypeDeviceGroupSubmitInfoKHR
  result.waitSemaphoreCount = waitSemaphoreCount
  result.pWaitSemaphoreDeviceIndices = pWaitSemaphoreDeviceIndices
  result.commandBufferCount = commandBufferCount
  result.pCommandBufferDeviceMasks = pCommandBufferDeviceMasks
  result.signalSemaphoreCount = signalSemaphoreCount
  result.pSignalSemaphoreDeviceIndices = pSignalSemaphoreDeviceIndices


proc mkVkDeviceGroupBindSparseInfoKHR*(resourceDeviceIndex: uint32;
                                       memoryDeviceIndex: uint32): VkDeviceGroupBindSparseInfoKHR =
  result.sType = vkStructureTypeDeviceGroupBindSparseInfoKHR
  result.resourceDeviceIndex = resourceDeviceIndex
  result.memoryDeviceIndex = memoryDeviceIndex


proc mkVkBindBufferMemoryDeviceGroupInfoKHR*(deviceIndexCount: uint32;
    pDeviceIndices: ptr uint32): VkBindBufferMemoryDeviceGroupInfoKHR =
  result.sType = vkStructureTypeBindBufferMemoryDeviceGroupInfoKHR
  result.deviceIndexCount = deviceIndexCount
  result.pDeviceIndices = pDeviceIndices


proc mkVkBindImageMemoryDeviceGroupInfoKHR*(deviceIndexCount: uint32;
    pDeviceIndices: ptr uint32; splitInstanceBindRegionCount: uint32;
    pSplitInstanceBindRegions: ptr VkRect2D): VkBindImageMemoryDeviceGroupInfoKHR =
  result.sType = vkStructureTypeBindImageMemoryDeviceGroupInfoKHR
  result.deviceIndexCount = deviceIndexCount
  result.pDeviceIndices = pDeviceIndices
  result.splitInstanceBindRegionCount = splitInstanceBindRegionCount
  result.pSplitInstanceBindRegions = pSplitInstanceBindRegions


proc mkVkPhysicalDeviceGroupPropertiesKHR*(physicalDeviceCount: uint32;
    physicalDevices: array[0 .. 31, VkPhysicalDevice];
    subsetAllocation: VkBool32): VkPhysicalDeviceGroupPropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceGroupPropertiesKHR
  result.physicalDeviceCount = physicalDeviceCount
  result.physicalDevices = physicalDevices
  result.subsetAllocation = subsetAllocation


proc mkVkDeviceGroupDeviceCreateInfoKHR*(physicalDeviceCount: uint32;
    pPhysicalDevices: ptr VkPhysicalDevice): VkDeviceGroupDeviceCreateInfoKHR =
  result.sType = vkStructureTypeDeviceGroupDeviceCreateInfoKHR
  result.physicalDeviceCount = physicalDeviceCount
  result.pPhysicalDevices = pPhysicalDevices


proc mkVkPhysicalDeviceExternalImageFormatInfoKHR*(
    handleType: VkExternalMemoryHandleTypeFlagBits): VkPhysicalDeviceExternalImageFormatInfoKHR =
  result.sType = vkStructureTypePhysicalDeviceExternalImageFormatInfoKHR
  result.handleType = handleType


proc mkVkExternalImageFormatPropertiesKHR*(
    externalMemoryProperties: VkExternalMemoryProperties): VkExternalImageFormatPropertiesKHR =
  result.sType = vkStructureTypeExternalImageFormatPropertiesKHR
  result.externalMemoryProperties = externalMemoryProperties


proc mkVkPhysicalDeviceExternalBufferInfoKHR*(usage: VkBufferUsageFlags;
    handleType: VkExternalMemoryHandleTypeFlagBits): VkPhysicalDeviceExternalBufferInfoKHR =
  result.sType = vkStructureTypePhysicalDeviceExternalBufferInfoKHR
  result.usage = usage
  result.handleType = handleType


proc mkVkExternalBufferPropertiesKHR*(externalMemoryProperties: VkExternalMemoryProperties): VkExternalBufferPropertiesKHR =
  result.sType = vkStructureTypeExternalBufferPropertiesKHR
  result.externalMemoryProperties = externalMemoryProperties


proc mkVkPhysicalDeviceIDPropertiesKHR*(deviceUUID: array[0 .. 15, uint8];
                                        driverUUID: array[0 .. 15, uint8];
                                        deviceLUID: array[0 .. 7, uint8];
                                        deviceNodeMask: uint32;
                                        deviceLUIDValid: VkBool32): VkPhysicalDeviceIDPropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceIDPropertiesKHR
  result.deviceUUID = deviceUUID
  result.driverUUID = driverUUID
  result.deviceLUID = deviceLUID
  result.deviceNodeMask = deviceNodeMask
  result.deviceLUIDValid = deviceLUIDValid


proc mkVkExternalMemoryBufferCreateInfoKHR*(
    handleTypes: VkExternalMemoryHandleTypeFlags): VkExternalMemoryBufferCreateInfoKHR =
  result.sType = vkStructureTypeExternalMemoryBufferCreateInfoKHR
  result.handleTypes = handleTypes


proc mkVkExternalMemoryImageCreateInfoKHR*(
    handleTypes: VkExternalMemoryHandleTypeFlags): VkExternalMemoryImageCreateInfoKHR =
  result.sType = vkStructureTypeExternalMemoryImageCreateInfoKHR
  result.handleTypes = handleTypes


proc mkVkExportMemoryAllocateInfoKHR*(handleTypes: VkExternalMemoryHandleTypeFlags): VkExportMemoryAllocateInfoKHR =
  result.sType = vkStructureTypeExportMemoryAllocateInfoKHR
  result.handleTypes = handleTypes


proc mkVkPhysicalDeviceExternalSemaphoreInfoKHR*(
    handleType: VkExternalSemaphoreHandleTypeFlagBits): VkPhysicalDeviceExternalSemaphoreInfoKHR =
  result.sType = vkStructureTypePhysicalDeviceExternalSemaphoreInfoKHR
  result.handleType = handleType


proc mkVkExternalSemaphorePropertiesKHR*(
    exportFromImportedHandleTypes: VkExternalSemaphoreHandleTypeFlags;
    compatibleHandleTypes: VkExternalSemaphoreHandleTypeFlags;
    externalSemaphoreFeatures: VkExternalSemaphoreFeatureFlags): VkExternalSemaphorePropertiesKHR =
  result.sType = vkStructureTypeExternalSemaphorePropertiesKHR
  result.exportFromImportedHandleTypes = exportFromImportedHandleTypes
  result.compatibleHandleTypes = compatibleHandleTypes
  result.externalSemaphoreFeatures = externalSemaphoreFeatures


proc mkVkExportSemaphoreCreateInfoKHR*(handleTypes: VkExternalSemaphoreHandleTypeFlags): VkExportSemaphoreCreateInfoKHR =
  result.sType = vkStructureTypeExportSemaphoreCreateInfoKHR
  result.handleTypes = handleTypes


proc mkVkPhysicalDeviceShaderFloat16Int8FeaturesKHR*(shaderFloat16: VkBool32;
    shaderInt8: VkBool32): VkPhysicalDeviceShaderFloat16Int8FeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceShaderFloat16Int8FeaturesKHR
  result.shaderFloat16 = shaderFloat16
  result.shaderInt8 = shaderInt8


proc mkVkPhysicalDeviceFloat16Int8FeaturesKHR*(shaderFloat16: VkBool32;
    shaderInt8: VkBool32): VkPhysicalDeviceFloat16Int8FeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceFloat16Int8FeaturesKHR
  result.shaderFloat16 = shaderFloat16
  result.shaderInt8 = shaderInt8


proc mkVkPhysicalDevice16BitStorageFeaturesKHR*(
    storageBuffer16BitAccess: VkBool32;
    uniformAndStorageBuffer16BitAccess: VkBool32;
    storagePushConstant16: VkBool32; storageInputOutput16: VkBool32): VkPhysicalDevice16BitStorageFeaturesKHR =
  result.sType = vkStructureTypePhysicalDevice16BitStorageFeaturesKHR
  result.storageBuffer16BitAccess = storageBuffer16BitAccess
  result.uniformAndStorageBuffer16BitAccess = uniformAndStorageBuffer16BitAccess
  result.storagePushConstant16 = storagePushConstant16
  result.storageInputOutput16 = storageInputOutput16


proc mkVkDescriptorUpdateTemplateCreateInfoKHR*(
    descriptorUpdateEntryCount: uint32;
    pDescriptorUpdateEntries: ptr VkDescriptorUpdateTemplateEntry;
    templateType: VkDescriptorUpdateTemplateType;
    descriptorSetLayout: VkDescriptorSetLayout;
    pipelineBindPoint: VkPipelineBindPoint; pipelineLayout: VkPipelineLayout;
    set: uint32): VkDescriptorUpdateTemplateCreateInfoKHR =
  result.sType = vkStructureTypeDescriptorUpdateTemplateCreateInfoKHR
  result.descriptorUpdateEntryCount = descriptorUpdateEntryCount
  result.pDescriptorUpdateEntries = pDescriptorUpdateEntries
  result.templateType = templateType
  result.descriptorSetLayout = descriptorSetLayout
  result.pipelineBindPoint = pipelineBindPoint
  result.pipelineLayout = pipelineLayout
  result.set = set


proc mkVkPhysicalDeviceImagelessFramebufferFeaturesKHR*(
    imagelessFramebuffer: VkBool32): VkPhysicalDeviceImagelessFramebufferFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceImagelessFramebufferFeaturesKHR
  result.imagelessFramebuffer = imagelessFramebuffer


proc mkVkFramebufferAttachmentsCreateInfoKHR*(attachmentImageInfoCount: uint32;
    pAttachmentImageInfos: ptr VkFramebufferAttachmentImageInfo): VkFramebufferAttachmentsCreateInfoKHR =
  result.sType = vkStructureTypeFramebufferAttachmentsCreateInfoKHR
  result.attachmentImageInfoCount = attachmentImageInfoCount
  result.pAttachmentImageInfos = pAttachmentImageInfos


proc mkVkFramebufferAttachmentImageInfoKHR*(usage: VkImageUsageFlags;
    width: uint32; height: uint32; layerCount: uint32; viewFormatCount: uint32;
    pViewFormats: ptr VkFormat): VkFramebufferAttachmentImageInfoKHR =
  result.sType = vkStructureTypeFramebufferAttachmentImageInfoKHR
  result.usage = usage
  result.width = width
  result.height = height
  result.layerCount = layerCount
  result.viewFormatCount = viewFormatCount
  result.pViewFormats = pViewFormats


proc mkVkRenderPassAttachmentBeginInfoKHR*(attachmentCount: uint32;
    pAttachments: ptr VkImageView): VkRenderPassAttachmentBeginInfoKHR =
  result.sType = vkStructureTypeRenderPassAttachmentBeginInfoKHR
  result.attachmentCount = attachmentCount
  result.pAttachments = pAttachments


proc mkVkAttachmentDescription2KHR*(format: VkFormat;
                                    samples: VkSampleCountFlagBits;
                                    loadOp: VkAttachmentLoadOp;
                                    storeOp: VkAttachmentStoreOp;
                                    stencilLoadOp: VkAttachmentLoadOp;
                                    stencilStoreOp: VkAttachmentStoreOp;
                                    initialLayout: VkImageLayout;
                                    finalLayout: VkImageLayout): VkAttachmentDescription2KHR =
  result.sType = vkStructureTypeAttachmentDescription2KHR
  result.format = format
  result.samples = samples
  result.loadOp = loadOp
  result.storeOp = storeOp
  result.stencilLoadOp = stencilLoadOp
  result.stencilStoreOp = stencilStoreOp
  result.initialLayout = initialLayout
  result.finalLayout = finalLayout


proc mkVkAttachmentReference2KHR*(attachment: uint32; layout: VkImageLayout;
                                  aspectMask: VkImageAspectFlags): VkAttachmentReference2KHR =
  result.sType = vkStructureTypeAttachmentReference2KHR
  result.attachment = attachment
  result.layout = layout
  result.aspectMask = aspectMask


proc mkVkSubpassDescription2KHR*(pipelineBindPoint: VkPipelineBindPoint;
                                 viewMask: uint32; inputAttachmentCount: uint32;
                                 pInputAttachments: ptr VkAttachmentReference2;
                                 colorAttachmentCount: uint32;
                                 pColorAttachments: ptr VkAttachmentReference2;
    pResolveAttachments: ptr VkAttachmentReference2; pDepthStencilAttachment: ptr VkAttachmentReference2;
                                 preserveAttachmentCount: uint32;
                                 pPreserveAttachments: ptr uint32): VkSubpassDescription2KHR =
  result.sType = vkStructureTypeSubpassDescription2KHR
  result.pipelineBindPoint = pipelineBindPoint
  result.viewMask = viewMask
  result.inputAttachmentCount = inputAttachmentCount
  result.pInputAttachments = pInputAttachments
  result.colorAttachmentCount = colorAttachmentCount
  result.pColorAttachments = pColorAttachments
  result.pResolveAttachments = pResolveAttachments
  result.pDepthStencilAttachment = pDepthStencilAttachment
  result.preserveAttachmentCount = preserveAttachmentCount
  result.pPreserveAttachments = pPreserveAttachments


proc mkVkSubpassDependency2KHR*(srcSubpass: uint32; dstSubpass: uint32;
                                srcStageMask: VkPipelineStageFlags;
                                dstStageMask: VkPipelineStageFlags;
                                srcAccessMask: VkAccessFlags;
                                dstAccessMask: VkAccessFlags;
                                dependencyFlags: VkDependencyFlags;
                                viewOffset: int32): VkSubpassDependency2KHR =
  result.sType = vkStructureTypeSubpassDependency2KHR
  result.srcSubpass = srcSubpass
  result.dstSubpass = dstSubpass
  result.srcStageMask = srcStageMask
  result.dstStageMask = dstStageMask
  result.srcAccessMask = srcAccessMask
  result.dstAccessMask = dstAccessMask
  result.dependencyFlags = dependencyFlags
  result.viewOffset = viewOffset


proc mkVkRenderPassCreateInfo2KHR*(attachmentCount: uint32;
                                   pAttachments: ptr VkAttachmentDescription2;
                                   subpassCount: uint32;
                                   pSubpasses: ptr VkSubpassDescription2;
                                   dependencyCount: uint32;
                                   pDependencies: ptr VkSubpassDependency2;
                                   correlatedViewMaskCount: uint32;
                                   pCorrelatedViewMasks: ptr uint32): VkRenderPassCreateInfo2KHR =
  result.sType = vkStructureTypeRenderPassCreateInfo2KHR
  result.attachmentCount = attachmentCount
  result.pAttachments = pAttachments
  result.subpassCount = subpassCount
  result.pSubpasses = pSubpasses
  result.dependencyCount = dependencyCount
  result.pDependencies = pDependencies
  result.correlatedViewMaskCount = correlatedViewMaskCount
  result.pCorrelatedViewMasks = pCorrelatedViewMasks


proc mkVkSubpassBeginInfoKHR*(contents: VkSubpassContents): VkSubpassBeginInfoKHR =
  result.sType = vkStructureTypeSubpassBeginInfoKHR
  result.contents = contents


proc mkVkSubpassEndInfoKHR*(): VkSubpassEndInfoKHR =
  result.sType = vkStructureTypeSubpassEndInfoKHR


proc mkVkPhysicalDeviceExternalFenceInfoKHR*(
    handleType: VkExternalFenceHandleTypeFlagBits): VkPhysicalDeviceExternalFenceInfoKHR =
  result.sType = vkStructureTypePhysicalDeviceExternalFenceInfoKHR
  result.handleType = handleType


proc mkVkExternalFencePropertiesKHR*(exportFromImportedHandleTypes: VkExternalFenceHandleTypeFlags;
    compatibleHandleTypes: VkExternalFenceHandleTypeFlags; externalFenceFeatures: VkExternalFenceFeatureFlags): VkExternalFencePropertiesKHR =
  result.sType = vkStructureTypeExternalFencePropertiesKHR
  result.exportFromImportedHandleTypes = exportFromImportedHandleTypes
  result.compatibleHandleTypes = compatibleHandleTypes
  result.externalFenceFeatures = externalFenceFeatures


proc mkVkExportFenceCreateInfoKHR*(handleTypes: VkExternalFenceHandleTypeFlags): VkExportFenceCreateInfoKHR =
  result.sType = vkStructureTypeExportFenceCreateInfoKHR
  result.handleTypes = handleTypes


proc mkVkPhysicalDevicePointClippingPropertiesKHR*(
    pointClippingBehavior: VkPointClippingBehavior): VkPhysicalDevicePointClippingPropertiesKHR =
  result.sType = vkStructureTypePhysicalDevicePointClippingPropertiesKHR
  result.pointClippingBehavior = pointClippingBehavior


proc mkVkRenderPassInputAttachmentAspectCreateInfoKHR*(
    aspectReferenceCount: uint32;
    pAspectReferences: ptr VkInputAttachmentAspectReference): VkRenderPassInputAttachmentAspectCreateInfoKHR =
  result.sType = vkStructureTypeRenderPassInputAttachmentAspectCreateInfoKHR
  result.aspectReferenceCount = aspectReferenceCount
  result.pAspectReferences = pAspectReferences


proc mkVkImageViewUsageCreateInfoKHR*(usage: VkImageUsageFlags): VkImageViewUsageCreateInfoKHR =
  result.sType = vkStructureTypeImageViewUsageCreateInfoKHR
  result.usage = usage


proc mkVkPipelineTessellationDomainOriginStateCreateInfoKHR*(
    domainOrigin: VkTessellationDomainOrigin): VkPipelineTessellationDomainOriginStateCreateInfoKHR =
  result.sType = vkStructureTypePipelineTessellationDomainOriginStateCreateInfoKHR
  result.domainOrigin = domainOrigin


proc mkVkPhysicalDeviceVariablePointersFeaturesKHR*(
    variablePointersStorageBuffer: VkBool32; variablePointers: VkBool32): VkPhysicalDeviceVariablePointersFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceVariablePointersFeaturesKHR
  result.variablePointersStorageBuffer = variablePointersStorageBuffer
  result.variablePointers = variablePointers


proc mkVkPhysicalDeviceVariablePointerFeaturesKHR*(
    variablePointersStorageBuffer: VkBool32; variablePointers: VkBool32): VkPhysicalDeviceVariablePointerFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceVariablePointerFeaturesKHR
  result.variablePointersStorageBuffer = variablePointersStorageBuffer
  result.variablePointers = variablePointers


proc mkVkMemoryDedicatedRequirementsKHR*(prefersDedicatedAllocation: VkBool32;
    requiresDedicatedAllocation: VkBool32): VkMemoryDedicatedRequirementsKHR =
  result.sType = vkStructureTypeMemoryDedicatedRequirementsKHR
  result.prefersDedicatedAllocation = prefersDedicatedAllocation
  result.requiresDedicatedAllocation = requiresDedicatedAllocation


proc mkVkMemoryDedicatedAllocateInfoKHR*(image: VkImage; buffer: VkBuffer): VkMemoryDedicatedAllocateInfoKHR =
  result.sType = vkStructureTypeMemoryDedicatedAllocateInfoKHR
  result.image = image
  result.buffer = buffer


proc mkVkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT*(
    filterMinmaxSingleComponentFormats: VkBool32;
    filterMinmaxImageComponentMapping: VkBool32): VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceSamplerFilterMinmaxPropertiesEXT
  result.filterMinmaxSingleComponentFormats = filterMinmaxSingleComponentFormats
  result.filterMinmaxImageComponentMapping = filterMinmaxImageComponentMapping


proc mkVkSamplerReductionModeCreateInfoEXT*(
    reductionMode: VkSamplerReductionMode): VkSamplerReductionModeCreateInfoEXT =
  result.sType = vkStructureTypeSamplerReductionModeCreateInfoEXT
  result.reductionMode = reductionMode


proc mkVkBufferMemoryRequirementsInfo2KHR*(buffer: VkBuffer): VkBufferMemoryRequirementsInfo2KHR =
  result.sType = vkStructureTypeBufferMemoryRequirementsInfo2KHR
  result.buffer = buffer


proc mkVkImageMemoryRequirementsInfo2KHR*(image: VkImage): VkImageMemoryRequirementsInfo2KHR =
  result.sType = vkStructureTypeImageMemoryRequirementsInfo2KHR
  result.image = image


proc mkVkImageSparseMemoryRequirementsInfo2KHR*(image: VkImage): VkImageSparseMemoryRequirementsInfo2KHR =
  result.sType = vkStructureTypeImageSparseMemoryRequirementsInfo2KHR
  result.image = image


proc mkVkMemoryRequirements2KHR*(memoryRequirements: VkMemoryRequirements): VkMemoryRequirements2KHR =
  result.sType = vkStructureTypeMemoryRequirements2KHR
  result.memoryRequirements = memoryRequirements


proc mkVkSparseImageMemoryRequirements2KHR*(
    memoryRequirements: VkSparseImageMemoryRequirements): VkSparseImageMemoryRequirements2KHR =
  result.sType = vkStructureTypeSparseImageMemoryRequirements2KHR
  result.memoryRequirements = memoryRequirements


proc mkVkImageFormatListCreateInfoKHR*(viewFormatCount: uint32;
                                       pViewFormats: ptr VkFormat): VkImageFormatListCreateInfoKHR =
  result.sType = vkStructureTypeImageFormatListCreateInfoKHR
  result.viewFormatCount = viewFormatCount
  result.pViewFormats = pViewFormats


proc mkVkSamplerYcbcrConversionCreateInfoKHR*(format: VkFormat;
    ycbcrModel: VkSamplerYcbcrModelConversion; ycbcrRange: VkSamplerYcbcrRange;
    components: VkComponentMapping; xChromaOffset: VkChromaLocation;
    yChromaOffset: VkChromaLocation; chromaFilter: VkFilter;
    forceExplicitReconstruction: VkBool32): VkSamplerYcbcrConversionCreateInfoKHR =
  result.sType = vkStructureTypeSamplerYcbcrConversionCreateInfoKHR
  result.format = format
  result.ycbcrModel = ycbcrModel
  result.ycbcrRange = ycbcrRange
  result.components = components
  result.xChromaOffset = xChromaOffset
  result.yChromaOffset = yChromaOffset
  result.chromaFilter = chromaFilter
  result.forceExplicitReconstruction = forceExplicitReconstruction


proc mkVkSamplerYcbcrConversionInfoKHR*(conversion: VkSamplerYcbcrConversion): VkSamplerYcbcrConversionInfoKHR =
  result.sType = vkStructureTypeSamplerYcbcrConversionInfoKHR
  result.conversion = conversion


proc mkVkBindImagePlaneMemoryInfoKHR*(planeAspect: VkImageAspectFlagBits): VkBindImagePlaneMemoryInfoKHR =
  result.sType = vkStructureTypeBindImagePlaneMemoryInfoKHR
  result.planeAspect = planeAspect


proc mkVkImagePlaneMemoryRequirementsInfoKHR*(planeAspect: VkImageAspectFlagBits): VkImagePlaneMemoryRequirementsInfoKHR =
  result.sType = vkStructureTypeImagePlaneMemoryRequirementsInfoKHR
  result.planeAspect = planeAspect


proc mkVkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR*(
    samplerYcbcrConversion: VkBool32): VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeaturesKHR
  result.samplerYcbcrConversion = samplerYcbcrConversion


proc mkVkSamplerYcbcrConversionImageFormatPropertiesKHR*(
    combinedImageSamplerDescriptorCount: uint32): VkSamplerYcbcrConversionImageFormatPropertiesKHR =
  result.sType = vkStructureTypeSamplerYcbcrConversionImageFormatPropertiesKHR
  result.combinedImageSamplerDescriptorCount = combinedImageSamplerDescriptorCount


proc mkVkBindBufferMemoryInfoKHR*(buffer: VkBuffer; memory: VkDeviceMemory;
                                  memoryOffset: VkDeviceSize): VkBindBufferMemoryInfoKHR =
  result.sType = vkStructureTypeBindBufferMemoryInfoKHR
  result.buffer = buffer
  result.memory = memory
  result.memoryOffset = memoryOffset


proc mkVkBindImageMemoryInfoKHR*(image: VkImage; memory: VkDeviceMemory;
                                 memoryOffset: VkDeviceSize): VkBindImageMemoryInfoKHR =
  result.sType = vkStructureTypeBindImageMemoryInfoKHR
  result.image = image
  result.memory = memory
  result.memoryOffset = memoryOffset


proc mkVkDescriptorSetLayoutBindingFlagsCreateInfoEXT*(bindingCount: uint32;
    pBindingFlags: ptr VkDescriptorBindingFlags): VkDescriptorSetLayoutBindingFlagsCreateInfoEXT =
  result.sType = vkStructureTypeDescriptorSetLayoutBindingFlagsCreateInfoEXT
  result.bindingCount = bindingCount
  result.pBindingFlags = pBindingFlags


proc mkVkPhysicalDeviceDescriptorIndexingFeaturesEXT*(
    shaderInputAttachmentArrayDynamicIndexing: VkBool32;
    shaderUniformTexelBufferArrayDynamicIndexing: VkBool32;
    shaderStorageTexelBufferArrayDynamicIndexing: VkBool32;
    shaderUniformBufferArrayNonUniformIndexing: VkBool32;
    shaderSampledImageArrayNonUniformIndexing: VkBool32;
    shaderStorageBufferArrayNonUniformIndexing: VkBool32;
    shaderStorageImageArrayNonUniformIndexing: VkBool32;
    shaderInputAttachmentArrayNonUniformIndexing: VkBool32;
    shaderUniformTexelBufferArrayNonUniformIndexing: VkBool32;
    shaderStorageTexelBufferArrayNonUniformIndexing: VkBool32;
    descriptorBindingUniformBufferUpdateAfterBind: VkBool32;
    descriptorBindingSampledImageUpdateAfterBind: VkBool32;
    descriptorBindingStorageImageUpdateAfterBind: VkBool32;
    descriptorBindingStorageBufferUpdateAfterBind: VkBool32;
    descriptorBindingUniformTexelBufferUpdateAfterBind: VkBool32;
    descriptorBindingStorageTexelBufferUpdateAfterBind: VkBool32;
    descriptorBindingUpdateUnusedWhilePending: VkBool32;
    descriptorBindingPartiallyBound: VkBool32;
    descriptorBindingVariableDescriptorCount: VkBool32;
    runtimeDescriptorArray: VkBool32): VkPhysicalDeviceDescriptorIndexingFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceDescriptorIndexingFeaturesEXT
  result.shaderInputAttachmentArrayDynamicIndexing = shaderInputAttachmentArrayDynamicIndexing
  result.shaderUniformTexelBufferArrayDynamicIndexing = shaderUniformTexelBufferArrayDynamicIndexing
  result.shaderStorageTexelBufferArrayDynamicIndexing = shaderStorageTexelBufferArrayDynamicIndexing
  result.shaderUniformBufferArrayNonUniformIndexing = shaderUniformBufferArrayNonUniformIndexing
  result.shaderSampledImageArrayNonUniformIndexing = shaderSampledImageArrayNonUniformIndexing
  result.shaderStorageBufferArrayNonUniformIndexing = shaderStorageBufferArrayNonUniformIndexing
  result.shaderStorageImageArrayNonUniformIndexing = shaderStorageImageArrayNonUniformIndexing
  result.shaderInputAttachmentArrayNonUniformIndexing = shaderInputAttachmentArrayNonUniformIndexing
  result.shaderUniformTexelBufferArrayNonUniformIndexing = shaderUniformTexelBufferArrayNonUniformIndexing
  result.shaderStorageTexelBufferArrayNonUniformIndexing = shaderStorageTexelBufferArrayNonUniformIndexing
  result.descriptorBindingUniformBufferUpdateAfterBind = descriptorBindingUniformBufferUpdateAfterBind
  result.descriptorBindingSampledImageUpdateAfterBind = descriptorBindingSampledImageUpdateAfterBind
  result.descriptorBindingStorageImageUpdateAfterBind = descriptorBindingStorageImageUpdateAfterBind
  result.descriptorBindingStorageBufferUpdateAfterBind = descriptorBindingStorageBufferUpdateAfterBind
  result.descriptorBindingUniformTexelBufferUpdateAfterBind = descriptorBindingUniformTexelBufferUpdateAfterBind
  result.descriptorBindingStorageTexelBufferUpdateAfterBind = descriptorBindingStorageTexelBufferUpdateAfterBind
  result.descriptorBindingUpdateUnusedWhilePending = descriptorBindingUpdateUnusedWhilePending
  result.descriptorBindingPartiallyBound = descriptorBindingPartiallyBound
  result.descriptorBindingVariableDescriptorCount = descriptorBindingVariableDescriptorCount
  result.runtimeDescriptorArray = runtimeDescriptorArray


proc mkVkPhysicalDeviceDescriptorIndexingPropertiesEXT*(
    maxUpdateAfterBindDescriptorsInAllPools: uint32;
    shaderUniformBufferArrayNonUniformIndexingNative: VkBool32;
    shaderSampledImageArrayNonUniformIndexingNative: VkBool32;
    shaderStorageBufferArrayNonUniformIndexingNative: VkBool32;
    shaderStorageImageArrayNonUniformIndexingNative: VkBool32;
    shaderInputAttachmentArrayNonUniformIndexingNative: VkBool32;
    robustBufferAccessUpdateAfterBind: VkBool32;
    quadDivergentImplicitLod: VkBool32;
    maxPerStageDescriptorUpdateAfterBindSamplers: uint32;
    maxPerStageDescriptorUpdateAfterBindUniformBuffers: uint32;
    maxPerStageDescriptorUpdateAfterBindStorageBuffers: uint32;
    maxPerStageDescriptorUpdateAfterBindSampledImages: uint32;
    maxPerStageDescriptorUpdateAfterBindStorageImages: uint32;
    maxPerStageDescriptorUpdateAfterBindInputAttachments: uint32;
    maxPerStageUpdateAfterBindResources: uint32;
    maxDescriptorSetUpdateAfterBindSamplers: uint32;
    maxDescriptorSetUpdateAfterBindUniformBuffers: uint32;
    maxDescriptorSetUpdateAfterBindUniformBuffersDynamic: uint32;
    maxDescriptorSetUpdateAfterBindStorageBuffers: uint32;
    maxDescriptorSetUpdateAfterBindStorageBuffersDynamic: uint32;
    maxDescriptorSetUpdateAfterBindSampledImages: uint32;
    maxDescriptorSetUpdateAfterBindStorageImages: uint32;
    maxDescriptorSetUpdateAfterBindInputAttachments: uint32): VkPhysicalDeviceDescriptorIndexingPropertiesEXT =
  result.sType = vkStructureTypePhysicalDeviceDescriptorIndexingPropertiesEXT
  result.maxUpdateAfterBindDescriptorsInAllPools = maxUpdateAfterBindDescriptorsInAllPools
  result.shaderUniformBufferArrayNonUniformIndexingNative = shaderUniformBufferArrayNonUniformIndexingNative
  result.shaderSampledImageArrayNonUniformIndexingNative = shaderSampledImageArrayNonUniformIndexingNative
  result.shaderStorageBufferArrayNonUniformIndexingNative = shaderStorageBufferArrayNonUniformIndexingNative
  result.shaderStorageImageArrayNonUniformIndexingNative = shaderStorageImageArrayNonUniformIndexingNative
  result.shaderInputAttachmentArrayNonUniformIndexingNative = shaderInputAttachmentArrayNonUniformIndexingNative
  result.robustBufferAccessUpdateAfterBind = robustBufferAccessUpdateAfterBind
  result.quadDivergentImplicitLod = quadDivergentImplicitLod
  result.maxPerStageDescriptorUpdateAfterBindSamplers = maxPerStageDescriptorUpdateAfterBindSamplers
  result.maxPerStageDescriptorUpdateAfterBindUniformBuffers = maxPerStageDescriptorUpdateAfterBindUniformBuffers
  result.maxPerStageDescriptorUpdateAfterBindStorageBuffers = maxPerStageDescriptorUpdateAfterBindStorageBuffers
  result.maxPerStageDescriptorUpdateAfterBindSampledImages = maxPerStageDescriptorUpdateAfterBindSampledImages
  result.maxPerStageDescriptorUpdateAfterBindStorageImages = maxPerStageDescriptorUpdateAfterBindStorageImages
  result.maxPerStageDescriptorUpdateAfterBindInputAttachments = maxPerStageDescriptorUpdateAfterBindInputAttachments
  result.maxPerStageUpdateAfterBindResources = maxPerStageUpdateAfterBindResources
  result.maxDescriptorSetUpdateAfterBindSamplers = maxDescriptorSetUpdateAfterBindSamplers
  result.maxDescriptorSetUpdateAfterBindUniformBuffers = maxDescriptorSetUpdateAfterBindUniformBuffers
  result.maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = maxDescriptorSetUpdateAfterBindUniformBuffersDynamic
  result.maxDescriptorSetUpdateAfterBindStorageBuffers = maxDescriptorSetUpdateAfterBindStorageBuffers
  result.maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = maxDescriptorSetUpdateAfterBindStorageBuffersDynamic
  result.maxDescriptorSetUpdateAfterBindSampledImages = maxDescriptorSetUpdateAfterBindSampledImages
  result.maxDescriptorSetUpdateAfterBindStorageImages = maxDescriptorSetUpdateAfterBindStorageImages
  result.maxDescriptorSetUpdateAfterBindInputAttachments = maxDescriptorSetUpdateAfterBindInputAttachments


proc mkVkDescriptorSetVariableDescriptorCountAllocateInfoEXT*(
    descriptorSetCount: uint32; pDescriptorCounts: ptr uint32): VkDescriptorSetVariableDescriptorCountAllocateInfoEXT =
  result.sType = vkStructureTypeDescriptorSetVariableDescriptorCountAllocateInfoEXT
  result.descriptorSetCount = descriptorSetCount
  result.pDescriptorCounts = pDescriptorCounts


proc mkVkDescriptorSetVariableDescriptorCountLayoutSupportEXT*(
    maxVariableDescriptorCount: uint32): VkDescriptorSetVariableDescriptorCountLayoutSupportEXT =
  result.sType = vkStructureTypeDescriptorSetVariableDescriptorCountLayoutSupportEXT
  result.maxVariableDescriptorCount = maxVariableDescriptorCount


proc mkVkPhysicalDeviceMaintenance3PropertiesKHR*(maxPerSetDescriptors: uint32;
    maxMemoryAllocationSize: VkDeviceSize): VkPhysicalDeviceMaintenance3PropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceMaintenance3PropertiesKHR
  result.maxPerSetDescriptors = maxPerSetDescriptors
  result.maxMemoryAllocationSize = maxMemoryAllocationSize


proc mkVkDescriptorSetLayoutSupportKHR*(supported: VkBool32): VkDescriptorSetLayoutSupportKHR =
  result.sType = vkStructureTypeDescriptorSetLayoutSupportKHR
  result.supported = supported


proc mkVkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR*(
    shaderSubgroupExtendedTypes: VkBool32): VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR
  result.shaderSubgroupExtendedTypes = shaderSubgroupExtendedTypes


proc mkVkPhysicalDevice8BitStorageFeaturesKHR*(
    storageBuffer8BitAccess: VkBool32;
    uniformAndStorageBuffer8BitAccess: VkBool32; storagePushConstant8: VkBool32): VkPhysicalDevice8BitStorageFeaturesKHR =
  result.sType = vkStructureTypePhysicalDevice8BitStorageFeaturesKHR
  result.storageBuffer8BitAccess = storageBuffer8BitAccess
  result.uniformAndStorageBuffer8BitAccess = uniformAndStorageBuffer8BitAccess
  result.storagePushConstant8 = storagePushConstant8


proc mkVkPhysicalDeviceShaderAtomicInt64FeaturesKHR*(
    shaderBufferInt64Atomics: VkBool32; shaderSharedInt64Atomics: VkBool32): VkPhysicalDeviceShaderAtomicInt64FeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceShaderAtomicInt64FeaturesKHR
  result.shaderBufferInt64Atomics = shaderBufferInt64Atomics
  result.shaderSharedInt64Atomics = shaderSharedInt64Atomics


proc mkVkPhysicalDeviceDriverPropertiesKHR*(driverID: VkDriverId;
    driverName: array[0 .. 255, char]; driverInfo: array[0 .. 255, char];
    conformanceVersion: VkConformanceVersion): VkPhysicalDeviceDriverPropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceDriverPropertiesKHR
  result.driverID = driverID
  result.driverName = driverName
  result.driverInfo = driverInfo
  result.conformanceVersion = conformanceVersion


proc mkVkPhysicalDeviceFloatControlsPropertiesKHR*(
    denormBehaviorIndependence: VkShaderFloatControlsIndependence;
    roundingModeIndependence: VkShaderFloatControlsIndependence;
    shaderSignedZeroInfNanPreserveFloat16: VkBool32;
    shaderSignedZeroInfNanPreserveFloat32: VkBool32;
    shaderSignedZeroInfNanPreserveFloat64: VkBool32;
    shaderDenormPreserveFloat16: VkBool32;
    shaderDenormPreserveFloat32: VkBool32;
    shaderDenormPreserveFloat64: VkBool32;
    shaderDenormFlushToZeroFloat16: VkBool32;
    shaderDenormFlushToZeroFloat32: VkBool32;
    shaderDenormFlushToZeroFloat64: VkBool32;
    shaderRoundingModeRTEFloat16: VkBool32;
    shaderRoundingModeRTEFloat32: VkBool32;
    shaderRoundingModeRTEFloat64: VkBool32;
    shaderRoundingModeRTZFloat16: VkBool32;
    shaderRoundingModeRTZFloat32: VkBool32;
    shaderRoundingModeRTZFloat64: VkBool32): VkPhysicalDeviceFloatControlsPropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceFloatControlsPropertiesKHR
  result.denormBehaviorIndependence = denormBehaviorIndependence
  result.roundingModeIndependence = roundingModeIndependence
  result.shaderSignedZeroInfNanPreserveFloat16 = shaderSignedZeroInfNanPreserveFloat16
  result.shaderSignedZeroInfNanPreserveFloat32 = shaderSignedZeroInfNanPreserveFloat32
  result.shaderSignedZeroInfNanPreserveFloat64 = shaderSignedZeroInfNanPreserveFloat64
  result.shaderDenormPreserveFloat16 = shaderDenormPreserveFloat16
  result.shaderDenormPreserveFloat32 = shaderDenormPreserveFloat32
  result.shaderDenormPreserveFloat64 = shaderDenormPreserveFloat64
  result.shaderDenormFlushToZeroFloat16 = shaderDenormFlushToZeroFloat16
  result.shaderDenormFlushToZeroFloat32 = shaderDenormFlushToZeroFloat32
  result.shaderDenormFlushToZeroFloat64 = shaderDenormFlushToZeroFloat64
  result.shaderRoundingModeRTEFloat16 = shaderRoundingModeRTEFloat16
  result.shaderRoundingModeRTEFloat32 = shaderRoundingModeRTEFloat32
  result.shaderRoundingModeRTEFloat64 = shaderRoundingModeRTEFloat64
  result.shaderRoundingModeRTZFloat16 = shaderRoundingModeRTZFloat16
  result.shaderRoundingModeRTZFloat32 = shaderRoundingModeRTZFloat32
  result.shaderRoundingModeRTZFloat64 = shaderRoundingModeRTZFloat64


proc mkVkPhysicalDeviceDepthStencilResolvePropertiesKHR*(
    supportedDepthResolveModes: VkResolveModeFlags;
    supportedStencilResolveModes: VkResolveModeFlags;
    independentResolveNone: VkBool32; independentResolve: VkBool32): VkPhysicalDeviceDepthStencilResolvePropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceDepthStencilResolvePropertiesKHR
  result.supportedDepthResolveModes = supportedDepthResolveModes
  result.supportedStencilResolveModes = supportedStencilResolveModes
  result.independentResolveNone = independentResolveNone
  result.independentResolve = independentResolve


proc mkVkSubpassDescriptionDepthStencilResolveKHR*(
    depthResolveMode: VkResolveModeFlagBits;
    stencilResolveMode: VkResolveModeFlagBits;
    pDepthStencilResolveAttachment: ptr VkAttachmentReference2): VkSubpassDescriptionDepthStencilResolveKHR =
  result.sType = vkStructureTypeSubpassDescriptionDepthStencilResolveKHR
  result.depthResolveMode = depthResolveMode
  result.stencilResolveMode = stencilResolveMode
  result.pDepthStencilResolveAttachment = pDepthStencilResolveAttachment


proc mkVkPhysicalDeviceTimelineSemaphoreFeaturesKHR*(timelineSemaphore: VkBool32): VkPhysicalDeviceTimelineSemaphoreFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceTimelineSemaphoreFeaturesKHR
  result.timelineSemaphore = timelineSemaphore


proc mkVkPhysicalDeviceTimelineSemaphorePropertiesKHR*(
    maxTimelineSemaphoreValueDifference: uint64): VkPhysicalDeviceTimelineSemaphorePropertiesKHR =
  result.sType = vkStructureTypePhysicalDeviceTimelineSemaphorePropertiesKHR
  result.maxTimelineSemaphoreValueDifference = maxTimelineSemaphoreValueDifference


proc mkVkSemaphoreTypeCreateInfoKHR*(semaphoreType: VkSemaphoreType;
                                     initialValue: uint64): VkSemaphoreTypeCreateInfoKHR =
  result.sType = vkStructureTypeSemaphoreTypeCreateInfoKHR
  result.semaphoreType = semaphoreType
  result.initialValue = initialValue


proc mkVkTimelineSemaphoreSubmitInfoKHR*(waitSemaphoreValueCount: uint32;
    pWaitSemaphoreValues: ptr uint64; signalSemaphoreValueCount: uint32;
    pSignalSemaphoreValues: ptr uint64): VkTimelineSemaphoreSubmitInfoKHR =
  result.sType = vkStructureTypeTimelineSemaphoreSubmitInfoKHR
  result.waitSemaphoreValueCount = waitSemaphoreValueCount
  result.pWaitSemaphoreValues = pWaitSemaphoreValues
  result.signalSemaphoreValueCount = signalSemaphoreValueCount
  result.pSignalSemaphoreValues = pSignalSemaphoreValues


proc mkVkSemaphoreWaitInfoKHR*(semaphoreCount: uint32;
                               pSemaphores: ptr VkSemaphore; pValues: ptr uint64): VkSemaphoreWaitInfoKHR =
  result.sType = vkStructureTypeSemaphoreWaitInfoKHR
  result.semaphoreCount = semaphoreCount
  result.pSemaphores = pSemaphores
  result.pValues = pValues


proc mkVkSemaphoreSignalInfoKHR*(semaphore: VkSemaphore; value: uint64): VkSemaphoreSignalInfoKHR =
  result.sType = vkStructureTypeSemaphoreSignalInfoKHR
  result.semaphore = semaphore
  result.value = value


proc mkVkQueryPoolCreateInfoINTEL*(performanceCountersSampling: VkQueryPoolSamplingModeINTEL): VkQueryPoolCreateInfoINTEL =
  result.sType = vkStructureTypeQueryPoolCreateInfoINTEL
  result.performanceCountersSampling = performanceCountersSampling


proc mkVkPhysicalDeviceVulkanMemoryModelFeaturesKHR*(
    vulkanMemoryModel: VkBool32; vulkanMemoryModelDeviceScope: VkBool32;
    vulkanMemoryModelAvailabilityVisibilityChains: VkBool32): VkPhysicalDeviceVulkanMemoryModelFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceVulkanMemoryModelFeaturesKHR
  result.vulkanMemoryModel = vulkanMemoryModel
  result.vulkanMemoryModelDeviceScope = vulkanMemoryModelDeviceScope
  result.vulkanMemoryModelAvailabilityVisibilityChains = vulkanMemoryModelAvailabilityVisibilityChains


proc mkVkPhysicalDeviceScalarBlockLayoutFeaturesEXT*(scalarBlockLayout: VkBool32): VkPhysicalDeviceScalarBlockLayoutFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceScalarBlockLayoutFeaturesEXT
  result.scalarBlockLayout = scalarBlockLayout


proc mkVkPhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR*(
    separateDepthStencilLayouts: VkBool32): VkPhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR
  result.separateDepthStencilLayouts = separateDepthStencilLayouts


proc mkVkAttachmentReferenceStencilLayoutKHR*(stencilLayout: VkImageLayout): VkAttachmentReferenceStencilLayoutKHR =
  result.sType = vkStructureTypeAttachmentReferenceStencilLayoutKHR
  result.stencilLayout = stencilLayout


proc mkVkAttachmentDescriptionStencilLayoutKHR*(
    stencilInitialLayout: VkImageLayout; stencilFinalLayout: VkImageLayout): VkAttachmentDescriptionStencilLayoutKHR =
  result.sType = vkStructureTypeAttachmentDescriptionStencilLayoutKHR
  result.stencilInitialLayout = stencilInitialLayout
  result.stencilFinalLayout = stencilFinalLayout


proc mkVkPhysicalDeviceBufferAddressFeaturesEXT*(bufferDeviceAddress: VkBool32;
    bufferDeviceAddressCaptureReplay: VkBool32;
    bufferDeviceAddressMultiDevice: VkBool32): VkPhysicalDeviceBufferAddressFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceBufferAddressFeaturesEXT
  result.bufferDeviceAddress = bufferDeviceAddress
  result.bufferDeviceAddressCaptureReplay = bufferDeviceAddressCaptureReplay
  result.bufferDeviceAddressMultiDevice = bufferDeviceAddressMultiDevice


proc mkVkBufferDeviceAddressInfoEXT*(buffer: VkBuffer): VkBufferDeviceAddressInfoEXT =
  result.sType = vkStructureTypeBufferDeviceAddressInfoEXT
  result.buffer = buffer


proc mkVkImageStencilUsageCreateInfoEXT*(stencilUsage: VkImageUsageFlags): VkImageStencilUsageCreateInfoEXT =
  result.sType = vkStructureTypeImageStencilUsageCreateInfoEXT
  result.stencilUsage = stencilUsage


proc mkVkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR*(
    uniformBufferStandardLayout: VkBool32): VkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceUniformBufferStandardLayoutFeaturesKHR
  result.uniformBufferStandardLayout = uniformBufferStandardLayout


proc mkVkPhysicalDeviceBufferDeviceAddressFeaturesKHR*(
    bufferDeviceAddress: VkBool32; bufferDeviceAddressCaptureReplay: VkBool32;
    bufferDeviceAddressMultiDevice: VkBool32): VkPhysicalDeviceBufferDeviceAddressFeaturesKHR =
  result.sType = vkStructureTypePhysicalDeviceBufferDeviceAddressFeaturesKHR
  result.bufferDeviceAddress = bufferDeviceAddress
  result.bufferDeviceAddressCaptureReplay = bufferDeviceAddressCaptureReplay
  result.bufferDeviceAddressMultiDevice = bufferDeviceAddressMultiDevice


proc mkVkBufferDeviceAddressInfoKHR*(buffer: VkBuffer): VkBufferDeviceAddressInfoKHR =
  result.sType = vkStructureTypeBufferDeviceAddressInfoKHR
  result.buffer = buffer


proc mkVkBufferOpaqueCaptureAddressCreateInfoKHR*(opaqueCaptureAddress: uint64): VkBufferOpaqueCaptureAddressCreateInfoKHR =
  result.sType = vkStructureTypeBufferOpaqueCaptureAddressCreateInfoKHR
  result.opaqueCaptureAddress = opaqueCaptureAddress


proc mkVkMemoryOpaqueCaptureAddressAllocateInfoKHR*(opaqueCaptureAddress: uint64): VkMemoryOpaqueCaptureAddressAllocateInfoKHR =
  result.sType = vkStructureTypeMemoryOpaqueCaptureAddressAllocateInfoKHR
  result.opaqueCaptureAddress = opaqueCaptureAddress


proc mkVkDeviceMemoryOpaqueCaptureAddressInfoKHR*(memory: VkDeviceMemory): VkDeviceMemoryOpaqueCaptureAddressInfoKHR =
  result.sType = vkStructureTypeDeviceMemoryOpaqueCaptureAddressInfoKHR
  result.memory = memory


proc mkVkPhysicalDeviceHostQueryResetFeaturesEXT*(hostQueryReset: VkBool32): VkPhysicalDeviceHostQueryResetFeaturesEXT =
  result.sType = vkStructureTypePhysicalDeviceHostQueryResetFeaturesEXT
  result.hostQueryReset = hostQueryReset

