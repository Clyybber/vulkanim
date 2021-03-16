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

# Enums
const
  vkMaxPhysicalDeviceNameSize* = 256
  vkUuidSize* = 16
  vkLuidSize* = 8
  vkLuidSizeKhr* = vkLuidSize
  vkMaxExtensionNameSize* = 256
  vkMaxDescriptionSize* = 256
  vkMaxMemoryTypes* = 32
  vkMaxMemoryHeaps* = 16
  vkLodClampNone* = 1000.0f
  vkRemainingMipLevels* = (not 0'u32)
  vkRemainingArrayLayers* = (not 0'u32)
  vkWholeSize* = (not 0'u64)
  vkAttachmentUnused* = (not 0'u32)
  vkTrue* = 1
  vkFalse* = 0
  vkQueueFamilyIgnored* = (not 0'u32)
  vkQueueFamilyExternal* = (not 0'u32) - 1
  vkQueueFamilyExternalKhr* = vkQueueFamilyExternal
  vkQueueFamilyForeignExt* = (not 0'u32) - 2
  vkSubpassExternal* = (not 0'u32)
  vkMaxDeviceGroupSize* = 32
  vkMaxDeviceGroupSizeKhr* = vkMaxDeviceGroupSize
  vkMaxDriverNameSize* = 256
  vkMaxDriverNameSizeKhr* = vkMaxDriverNameSize
  vkMaxDriverInfoSize* = 256
  vkMaxDriverInfoSizeKhr* = vkMaxDriverInfoSize
  vkShaderUnusedKhr* = (not 0'u32)
  vkShaderUnusedNv* = vkShaderUnusedKhr
type VkImageLayout* = distinct cint
proc `==`*(x, y: VkImageLayout): bool {.borrow.}
proc `-`*(x: VkImageLayout): VkImageLayout {.borrow.}
proc `-`*(x, y: VkImageLayout): VkImageLayout {.borrow.}
proc `+`*(x, y: VkImageLayout): VkImageLayout {.borrow.}
proc `+`*(x: VkImageLayout, y: int): VkImageLayout {.used.} = x + VkImageLayout(y)

const
  vkImageLayoutUndefined* = VkImageLayout 0
  vkImageLayoutGeneral* = VkImageLayout 1
  vkImageLayoutColorAttachmentOptimal* = VkImageLayout 2
  vkImageLayoutDepthStencilAttachmentOptimal* = VkImageLayout 3
  vkImageLayoutDepthStencilReadOnlyOptimal* = VkImageLayout 4
  vkImageLayoutShaderReadOnlyOptimal* = VkImageLayout 5
  vkImageLayoutTransferSrcOptimal* = VkImageLayout 6
  vkImageLayoutTransferDstOptimal* = VkImageLayout 7
  vkImageLayoutPreinitialized* = VkImageLayout 8
  vkImageLayoutPresentSrcKhr* = VkImageLayout 1000001002
  vkImageLayoutSharedPresentKhr* = VkImageLayout 1000111000
  vkImageLayoutDepthReadOnlyStencilAttachmentOptimal* = VkImageLayout 1000117000
  vkImageLayoutDepthAttachmentStencilReadOnlyOptimal* = VkImageLayout 1000117001
  vkImageLayoutShadingRateOptimalNv* = VkImageLayout 1000164003
  vkImageLayoutFragmentDensityMapOptimalExt* = VkImageLayout 1000218000
  vkImageLayoutDepthAttachmentOptimal* = VkImageLayout 1000241000
  vkImageLayoutDepthReadOnlyOptimal* = VkImageLayout 1000241001
  vkImageLayoutStencilAttachmentOptimal* = VkImageLayout 1000241002
  vkImageLayoutStencilReadOnlyOptimal* = VkImageLayout 1000241003
  vkImageLayoutReadOnlyOptimalKhr* = VkImageLayout 1000314000
  vkImageLayoutAttachmentOptimalKhr* = VkImageLayout 1000314001
type VkAttachmentLoadOp* = distinct cint
proc `==`*(x, y: VkAttachmentLoadOp): bool {.borrow.}
proc `-`*(x: VkAttachmentLoadOp): VkAttachmentLoadOp {.borrow.}
proc `-`*(x, y: VkAttachmentLoadOp): VkAttachmentLoadOp {.borrow.}
proc `+`*(x, y: VkAttachmentLoadOp): VkAttachmentLoadOp {.borrow.}
proc `+`*(x: VkAttachmentLoadOp, y: int): VkAttachmentLoadOp {.used.} = x + VkAttachmentLoadOp(y)

const
  vkAttachmentLoadOpLoad* = VkAttachmentLoadOp 0
  vkAttachmentLoadOpClear* = VkAttachmentLoadOp 1
  vkAttachmentLoadOpDontCare* = VkAttachmentLoadOp 2
type VkAttachmentStoreOp* = distinct cint
proc `==`*(x, y: VkAttachmentStoreOp): bool {.borrow.}
proc `-`*(x: VkAttachmentStoreOp): VkAttachmentStoreOp {.borrow.}
proc `-`*(x, y: VkAttachmentStoreOp): VkAttachmentStoreOp {.borrow.}
proc `+`*(x, y: VkAttachmentStoreOp): VkAttachmentStoreOp {.borrow.}
proc `+`*(x: VkAttachmentStoreOp, y: int): VkAttachmentStoreOp {.used.} = x + VkAttachmentStoreOp(y)

const
  vkAttachmentStoreOpStore* = VkAttachmentStoreOp 0
  vkAttachmentStoreOpDontCare* = VkAttachmentStoreOp 1
  vkAttachmentStoreOpNoneQcom* = VkAttachmentStoreOp 1000301000
type VkImageType* = distinct cint
proc `==`*(x, y: VkImageType): bool {.borrow.}
proc `-`*(x: VkImageType): VkImageType {.borrow.}
proc `-`*(x, y: VkImageType): VkImageType {.borrow.}
proc `+`*(x, y: VkImageType): VkImageType {.borrow.}
proc `+`*(x: VkImageType, y: int): VkImageType {.used.} = x + VkImageType(y)

const
  vkImageType1d* = VkImageType 0
  vkImageType2d* = VkImageType 1
  vkImageType3d* = VkImageType 2
type VkImageTiling* = distinct cint
proc `==`*(x, y: VkImageTiling): bool {.borrow.}
proc `-`*(x: VkImageTiling): VkImageTiling {.borrow.}
proc `-`*(x, y: VkImageTiling): VkImageTiling {.borrow.}
proc `+`*(x, y: VkImageTiling): VkImageTiling {.borrow.}
proc `+`*(x: VkImageTiling, y: int): VkImageTiling {.used.} = x + VkImageTiling(y)

const
  vkImageTilingOptimal* = VkImageTiling 0
  vkImageTilingLinear* = VkImageTiling 1
  vkImageTilingDrmFormatModifierExt* = VkImageTiling 1000158000
type VkImageViewType* = distinct cint
proc `==`*(x, y: VkImageViewType): bool {.borrow.}
proc `-`*(x: VkImageViewType): VkImageViewType {.borrow.}
proc `-`*(x, y: VkImageViewType): VkImageViewType {.borrow.}
proc `+`*(x, y: VkImageViewType): VkImageViewType {.borrow.}
proc `+`*(x: VkImageViewType, y: int): VkImageViewType {.used.} = x + VkImageViewType(y)

const
  vkImageViewType1d* = VkImageViewType 0
  vkImageViewType2d* = VkImageViewType 1
  vkImageViewType3d* = VkImageViewType 2
  vkImageViewTypeCube* = VkImageViewType 3
  vkImageViewType1dArray* = VkImageViewType 4
  vkImageViewType2dArray* = VkImageViewType 5
  vkImageViewTypeCubeArray* = VkImageViewType 6
type VkCommandBufferLevel* = distinct cint
proc `==`*(x, y: VkCommandBufferLevel): bool {.borrow.}
proc `-`*(x: VkCommandBufferLevel): VkCommandBufferLevel {.borrow.}
proc `-`*(x, y: VkCommandBufferLevel): VkCommandBufferLevel {.borrow.}
proc `+`*(x, y: VkCommandBufferLevel): VkCommandBufferLevel {.borrow.}
proc `+`*(x: VkCommandBufferLevel, y: int): VkCommandBufferLevel {.used.} = x + VkCommandBufferLevel(y)

const
  vkCommandBufferLevelPrimary* = VkCommandBufferLevel 0
  vkCommandBufferLevelSecondary* = VkCommandBufferLevel 1
type VkComponentSwizzle* = distinct cint
proc `==`*(x, y: VkComponentSwizzle): bool {.borrow.}
proc `-`*(x: VkComponentSwizzle): VkComponentSwizzle {.borrow.}
proc `-`*(x, y: VkComponentSwizzle): VkComponentSwizzle {.borrow.}
proc `+`*(x, y: VkComponentSwizzle): VkComponentSwizzle {.borrow.}
proc `+`*(x: VkComponentSwizzle, y: int): VkComponentSwizzle {.used.} = x + VkComponentSwizzle(y)

const
  vkComponentSwizzleIdentity* = VkComponentSwizzle 0
  vkComponentSwizzleZero* = VkComponentSwizzle 1
  vkComponentSwizzleOne* = VkComponentSwizzle 2
  vkComponentSwizzleR* = VkComponentSwizzle 3
  vkComponentSwizzleG* = VkComponentSwizzle 4
  vkComponentSwizzleB* = VkComponentSwizzle 5
  vkComponentSwizzleA* = VkComponentSwizzle 6
type VkDescriptorType* = distinct cint
proc `==`*(x, y: VkDescriptorType): bool {.borrow.}
proc `-`*(x: VkDescriptorType): VkDescriptorType {.borrow.}
proc `-`*(x, y: VkDescriptorType): VkDescriptorType {.borrow.}
proc `+`*(x, y: VkDescriptorType): VkDescriptorType {.borrow.}
proc `+`*(x: VkDescriptorType, y: int): VkDescriptorType {.used.} = x + VkDescriptorType(y)

const
  vkDescriptorTypeSampler* = VkDescriptorType 0
  vkDescriptorTypeCombinedImageSampler* = VkDescriptorType 1
  vkDescriptorTypeSampledImage* = VkDescriptorType 2
  vkDescriptorTypeStorageImage* = VkDescriptorType 3
  vkDescriptorTypeUniformTexelBuffer* = VkDescriptorType 4
  vkDescriptorTypeStorageTexelBuffer* = VkDescriptorType 5
  vkDescriptorTypeUniformBuffer* = VkDescriptorType 6
  vkDescriptorTypeStorageBuffer* = VkDescriptorType 7
  vkDescriptorTypeUniformBufferDynamic* = VkDescriptorType 8
  vkDescriptorTypeStorageBufferDynamic* = VkDescriptorType 9
  vkDescriptorTypeInputAttachment* = VkDescriptorType 10
  vkDescriptorTypeInlineUniformBlockExt* = VkDescriptorType 1000138000
  vkDescriptorTypeAccelerationStructureKhr* = VkDescriptorType 1000150000
  vkDescriptorTypeAccelerationStructureNv* = VkDescriptorType 1000165000
  vkDescriptorTypeMutableValve* = VkDescriptorType 1000351000
type VkQueryType* = distinct cint
proc `==`*(x, y: VkQueryType): bool {.borrow.}
proc `-`*(x: VkQueryType): VkQueryType {.borrow.}
proc `-`*(x, y: VkQueryType): VkQueryType {.borrow.}
proc `+`*(x, y: VkQueryType): VkQueryType {.borrow.}
proc `+`*(x: VkQueryType, y: int): VkQueryType {.used.} = x + VkQueryType(y)

const
  vkQueryTypeOcclusion* = VkQueryType 0
  vkQueryTypePipelineStatistics* = VkQueryType 1
  vkQueryTypeTimestamp* = VkQueryType 2
  vkQueryTypeReserved8* = VkQueryType 1000023008
  vkQueryTypeReserved4* = VkQueryType 1000024004
  vkQueryTypeTransformFeedbackStreamExt* = VkQueryType 1000028004
  vkQueryTypePerformanceQueryKhr* = VkQueryType 1000116000
  vkQueryTypeAccelerationStructureCompactedSizeKhr* = VkQueryType 1000150000
  vkQueryTypeAccelerationStructureSerializationSizeKhr* = VkQueryType 1000150001
  vkQueryTypeAccelerationStructureCompactedSizeNv* = VkQueryType 1000165000
  vkQueryTypePerformanceQueryIntel* = VkQueryType 1000210000
type VkBorderColor* = distinct cint
proc `==`*(x, y: VkBorderColor): bool {.borrow.}
proc `-`*(x: VkBorderColor): VkBorderColor {.borrow.}
proc `-`*(x, y: VkBorderColor): VkBorderColor {.borrow.}
proc `+`*(x, y: VkBorderColor): VkBorderColor {.borrow.}
proc `+`*(x: VkBorderColor, y: int): VkBorderColor {.used.} = x + VkBorderColor(y)

const
  vkBorderColorFloatTransparentBlack* = VkBorderColor 0
  vkBorderColorIntTransparentBlack* = VkBorderColor 1
  vkBorderColorFloatOpaqueBlack* = VkBorderColor 2
  vkBorderColorIntOpaqueBlack* = VkBorderColor 3
  vkBorderColorFloatOpaqueWhite* = VkBorderColor 4
  vkBorderColorIntOpaqueWhite* = VkBorderColor 5
  vkBorderColorFloatCustomExt* = VkBorderColor 1000287003
  vkBorderColorIntCustomExt* = VkBorderColor 1000287004
type VkPipelineBindPoint* = distinct cint
proc `==`*(x, y: VkPipelineBindPoint): bool {.borrow.}
proc `-`*(x: VkPipelineBindPoint): VkPipelineBindPoint {.borrow.}
proc `-`*(x, y: VkPipelineBindPoint): VkPipelineBindPoint {.borrow.}
proc `+`*(x, y: VkPipelineBindPoint): VkPipelineBindPoint {.borrow.}
proc `+`*(x: VkPipelineBindPoint, y: int): VkPipelineBindPoint {.used.} = x + VkPipelineBindPoint(y)

const
  vkPipelineBindPointGraphics* = VkPipelineBindPoint 0
  vkPipelineBindPointCompute* = VkPipelineBindPoint 1
  vkPipelineBindPointRayTracingKhr* = VkPipelineBindPoint 1000347000
type VkPipelineCacheHeaderVersion* = distinct cint
proc `==`*(x, y: VkPipelineCacheHeaderVersion): bool {.borrow.}
proc `-`*(x: VkPipelineCacheHeaderVersion): VkPipelineCacheHeaderVersion {.borrow.}
proc `-`*(x, y: VkPipelineCacheHeaderVersion): VkPipelineCacheHeaderVersion {.borrow.}
proc `+`*(x, y: VkPipelineCacheHeaderVersion): VkPipelineCacheHeaderVersion {.borrow.}
proc `+`*(x: VkPipelineCacheHeaderVersion, y: int): VkPipelineCacheHeaderVersion {.used.} = x + VkPipelineCacheHeaderVersion(y)

const
  vkPipelineCacheHeaderVersionOne* = VkPipelineCacheHeaderVersion 1
type VkPipelineCacheCreateFlagBits* = distinct cint
proc `==`*(x, y: VkPipelineCacheCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkPipelineCacheCreateFlagBits): VkPipelineCacheCreateFlagBits {.borrow.}
proc `-`*(x, y: VkPipelineCacheCreateFlagBits): VkPipelineCacheCreateFlagBits {.borrow.}
proc `+`*(x, y: VkPipelineCacheCreateFlagBits): VkPipelineCacheCreateFlagBits {.borrow.}
proc `+`*(x: VkPipelineCacheCreateFlagBits, y: int): VkPipelineCacheCreateFlagBits {.used.} = x + VkPipelineCacheCreateFlagBits(y)

const
  vkPipelineCacheCreateExternallySynchronizedBitExt* = VkPipelineCacheCreateFlagBits 1
  vkPipelineCacheCreateReserved1BitExt* = VkPipelineCacheCreateFlagBits 2
  vkPipelineCacheCreateReserved2BitExt* = VkPipelineCacheCreateFlagBits 4
type VkPrimitiveTopology* = distinct cint
proc `==`*(x, y: VkPrimitiveTopology): bool {.borrow.}
proc `-`*(x: VkPrimitiveTopology): VkPrimitiveTopology {.borrow.}
proc `-`*(x, y: VkPrimitiveTopology): VkPrimitiveTopology {.borrow.}
proc `+`*(x, y: VkPrimitiveTopology): VkPrimitiveTopology {.borrow.}
proc `+`*(x: VkPrimitiveTopology, y: int): VkPrimitiveTopology {.used.} = x + VkPrimitiveTopology(y)

const
  vkPrimitiveTopologyPointList* = VkPrimitiveTopology 0
  vkPrimitiveTopologyLineList* = VkPrimitiveTopology 1
  vkPrimitiveTopologyLineStrip* = VkPrimitiveTopology 2
  vkPrimitiveTopologyTriangleList* = VkPrimitiveTopology 3
  vkPrimitiveTopologyTriangleStrip* = VkPrimitiveTopology 4
  vkPrimitiveTopologyTriangleFan* = VkPrimitiveTopology 5
  vkPrimitiveTopologyLineListWithAdjacency* = VkPrimitiveTopology 6
  vkPrimitiveTopologyLineStripWithAdjacency* = VkPrimitiveTopology 7
  vkPrimitiveTopologyTriangleListWithAdjacency* = VkPrimitiveTopology 8
  vkPrimitiveTopologyTriangleStripWithAdjacency* = VkPrimitiveTopology 9
  vkPrimitiveTopologyPatchList* = VkPrimitiveTopology 10
type VkSharingMode* = distinct cint
proc `==`*(x, y: VkSharingMode): bool {.borrow.}
proc `-`*(x: VkSharingMode): VkSharingMode {.borrow.}
proc `-`*(x, y: VkSharingMode): VkSharingMode {.borrow.}
proc `+`*(x, y: VkSharingMode): VkSharingMode {.borrow.}
proc `+`*(x: VkSharingMode, y: int): VkSharingMode {.used.} = x + VkSharingMode(y)

const
  vkSharingModeExclusive* = VkSharingMode 0
  vkSharingModeConcurrent* = VkSharingMode 1
type VkIndexType* = distinct cint
proc `==`*(x, y: VkIndexType): bool {.borrow.}
proc `-`*(x: VkIndexType): VkIndexType {.borrow.}
proc `-`*(x, y: VkIndexType): VkIndexType {.borrow.}
proc `+`*(x, y: VkIndexType): VkIndexType {.borrow.}
proc `+`*(x: VkIndexType, y: int): VkIndexType {.used.} = x + VkIndexType(y)

const
  vkIndexTypeUint16* = VkIndexType 0
  vkIndexTypeUint32* = VkIndexType 1
  vkIndexTypeNoneKhr* = VkIndexType 1000150000
  vkIndexTypeUint8Ext* = VkIndexType 1000265000
type VkFilter* = distinct cint
proc `==`*(x, y: VkFilter): bool {.borrow.}
proc `-`*(x: VkFilter): VkFilter {.borrow.}
proc `-`*(x, y: VkFilter): VkFilter {.borrow.}
proc `+`*(x, y: VkFilter): VkFilter {.borrow.}
proc `+`*(x: VkFilter, y: int): VkFilter {.used.} = x + VkFilter(y)

const
  vkFilterNearest* = VkFilter 0
  vkFilterLinear* = VkFilter 1
  vkFilterCubicImg* = VkFilter 1000015000
type VkSamplerMipmapMode* = distinct cint
proc `==`*(x, y: VkSamplerMipmapMode): bool {.borrow.}
proc `-`*(x: VkSamplerMipmapMode): VkSamplerMipmapMode {.borrow.}
proc `-`*(x, y: VkSamplerMipmapMode): VkSamplerMipmapMode {.borrow.}
proc `+`*(x, y: VkSamplerMipmapMode): VkSamplerMipmapMode {.borrow.}
proc `+`*(x: VkSamplerMipmapMode, y: int): VkSamplerMipmapMode {.used.} = x + VkSamplerMipmapMode(y)

const
  vkSamplerMipmapModeNearest* = VkSamplerMipmapMode 0
  vkSamplerMipmapModeLinear* = VkSamplerMipmapMode 1
type VkSamplerAddressMode* = distinct cint
proc `==`*(x, y: VkSamplerAddressMode): bool {.borrow.}
proc `-`*(x: VkSamplerAddressMode): VkSamplerAddressMode {.borrow.}
proc `-`*(x, y: VkSamplerAddressMode): VkSamplerAddressMode {.borrow.}
proc `+`*(x, y: VkSamplerAddressMode): VkSamplerAddressMode {.borrow.}
proc `+`*(x: VkSamplerAddressMode, y: int): VkSamplerAddressMode {.used.} = x + VkSamplerAddressMode(y)

const
  vkSamplerAddressModeRepeat* = VkSamplerAddressMode 0
  vkSamplerAddressModeMirroredRepeat* = VkSamplerAddressMode 1
  vkSamplerAddressModeClampToEdge* = VkSamplerAddressMode 2
  vkSamplerAddressModeClampToBorder* = VkSamplerAddressMode 3
  vkSamplerAddressModeMirrorClampToEdge* = VkSamplerAddressMode 4
type VkCompareOp* = distinct cint
proc `==`*(x, y: VkCompareOp): bool {.borrow.}
proc `-`*(x: VkCompareOp): VkCompareOp {.borrow.}
proc `-`*(x, y: VkCompareOp): VkCompareOp {.borrow.}
proc `+`*(x, y: VkCompareOp): VkCompareOp {.borrow.}
proc `+`*(x: VkCompareOp, y: int): VkCompareOp {.used.} = x + VkCompareOp(y)

const
  vkCompareOpNever* = VkCompareOp 0
  vkCompareOpLess* = VkCompareOp 1
  vkCompareOpEqual* = VkCompareOp 2
  vkCompareOpLessOrEqual* = VkCompareOp 3
  vkCompareOpGreater* = VkCompareOp 4
  vkCompareOpNotEqual* = VkCompareOp 5
  vkCompareOpGreaterOrEqual* = VkCompareOp 6
  vkCompareOpAlways* = VkCompareOp 7
type VkPolygonMode* = distinct cint
proc `==`*(x, y: VkPolygonMode): bool {.borrow.}
proc `-`*(x: VkPolygonMode): VkPolygonMode {.borrow.}
proc `-`*(x, y: VkPolygonMode): VkPolygonMode {.borrow.}
proc `+`*(x, y: VkPolygonMode): VkPolygonMode {.borrow.}
proc `+`*(x: VkPolygonMode, y: int): VkPolygonMode {.used.} = x + VkPolygonMode(y)

const
  vkPolygonModeFill* = VkPolygonMode 0
  vkPolygonModeLine* = VkPolygonMode 1
  vkPolygonModePoint* = VkPolygonMode 2
  vkPolygonModeFillRectangleNv* = VkPolygonMode 1000153000
type VkFrontFace* = distinct cint
proc `==`*(x, y: VkFrontFace): bool {.borrow.}
proc `-`*(x: VkFrontFace): VkFrontFace {.borrow.}
proc `-`*(x, y: VkFrontFace): VkFrontFace {.borrow.}
proc `+`*(x, y: VkFrontFace): VkFrontFace {.borrow.}
proc `+`*(x: VkFrontFace, y: int): VkFrontFace {.used.} = x + VkFrontFace(y)

const
  vkFrontFaceCounterClockwise* = VkFrontFace 0
  vkFrontFaceClockwise* = VkFrontFace 1
type VkBlendFactor* = distinct cint
proc `==`*(x, y: VkBlendFactor): bool {.borrow.}
proc `-`*(x: VkBlendFactor): VkBlendFactor {.borrow.}
proc `-`*(x, y: VkBlendFactor): VkBlendFactor {.borrow.}
proc `+`*(x, y: VkBlendFactor): VkBlendFactor {.borrow.}
proc `+`*(x: VkBlendFactor, y: int): VkBlendFactor {.used.} = x + VkBlendFactor(y)

const
  vkBlendFactorZero* = VkBlendFactor 0
  vkBlendFactorOne* = VkBlendFactor 1
  vkBlendFactorSrcColor* = VkBlendFactor 2
  vkBlendFactorOneMinusSrcColor* = VkBlendFactor 3
  vkBlendFactorDstColor* = VkBlendFactor 4
  vkBlendFactorOneMinusDstColor* = VkBlendFactor 5
  vkBlendFactorSrcAlpha* = VkBlendFactor 6
  vkBlendFactorOneMinusSrcAlpha* = VkBlendFactor 7
  vkBlendFactorDstAlpha* = VkBlendFactor 8
  vkBlendFactorOneMinusDstAlpha* = VkBlendFactor 9
  vkBlendFactorConstantColor* = VkBlendFactor 10
  vkBlendFactorOneMinusConstantColor* = VkBlendFactor 11
  vkBlendFactorConstantAlpha* = VkBlendFactor 12
  vkBlendFactorOneMinusConstantAlpha* = VkBlendFactor 13
  vkBlendFactorSrcAlphaSaturate* = VkBlendFactor 14
  vkBlendFactorSrc1Color* = VkBlendFactor 15
  vkBlendFactorOneMinusSrc1Color* = VkBlendFactor 16
  vkBlendFactorSrc1Alpha* = VkBlendFactor 17
  vkBlendFactorOneMinusSrc1Alpha* = VkBlendFactor 18
type VkBlendOp* = distinct cint
proc `==`*(x, y: VkBlendOp): bool {.borrow.}
proc `-`*(x: VkBlendOp): VkBlendOp {.borrow.}
proc `-`*(x, y: VkBlendOp): VkBlendOp {.borrow.}
proc `+`*(x, y: VkBlendOp): VkBlendOp {.borrow.}
proc `+`*(x: VkBlendOp, y: int): VkBlendOp {.used.} = x + VkBlendOp(y)

const
  vkBlendOpAdd* = VkBlendOp 0
  vkBlendOpSubtract* = VkBlendOp 1
  vkBlendOpReverseSubtract* = VkBlendOp 2
  vkBlendOpMin* = VkBlendOp 3
  vkBlendOpMax* = VkBlendOp 4
  vkBlendOpZeroExt* = VkBlendOp 1000148000
  vkBlendOpSrcExt* = VkBlendOp 1000148001
  vkBlendOpDstExt* = VkBlendOp 1000148002
  vkBlendOpSrcOverExt* = VkBlendOp 1000148003
  vkBlendOpDstOverExt* = VkBlendOp 1000148004
  vkBlendOpSrcInExt* = VkBlendOp 1000148005
  vkBlendOpDstInExt* = VkBlendOp 1000148006
  vkBlendOpSrcOutExt* = VkBlendOp 1000148007
  vkBlendOpDstOutExt* = VkBlendOp 1000148008
  vkBlendOpSrcAtopExt* = VkBlendOp 1000148009
  vkBlendOpDstAtopExt* = VkBlendOp 1000148010
  vkBlendOpXorExt* = VkBlendOp 1000148011
  vkBlendOpMultiplyExt* = VkBlendOp 1000148012
  vkBlendOpScreenExt* = VkBlendOp 1000148013
  vkBlendOpOverlayExt* = VkBlendOp 1000148014
  vkBlendOpDarkenExt* = VkBlendOp 1000148015
  vkBlendOpLightenExt* = VkBlendOp 1000148016
  vkBlendOpColordodgeExt* = VkBlendOp 1000148017
  vkBlendOpColorburnExt* = VkBlendOp 1000148018
  vkBlendOpHardlightExt* = VkBlendOp 1000148019
  vkBlendOpSoftlightExt* = VkBlendOp 1000148020
  vkBlendOpDifferenceExt* = VkBlendOp 1000148021
  vkBlendOpExclusionExt* = VkBlendOp 1000148022
  vkBlendOpInvertExt* = VkBlendOp 1000148023
  vkBlendOpInvertRgbExt* = VkBlendOp 1000148024
  vkBlendOpLineardodgeExt* = VkBlendOp 1000148025
  vkBlendOpLinearburnExt* = VkBlendOp 1000148026
  vkBlendOpVividlightExt* = VkBlendOp 1000148027
  vkBlendOpLinearlightExt* = VkBlendOp 1000148028
  vkBlendOpPinlightExt* = VkBlendOp 1000148029
  vkBlendOpHardmixExt* = VkBlendOp 1000148030
  vkBlendOpHslHueExt* = VkBlendOp 1000148031
  vkBlendOpHslSaturationExt* = VkBlendOp 1000148032
  vkBlendOpHslColorExt* = VkBlendOp 1000148033
  vkBlendOpHslLuminosityExt* = VkBlendOp 1000148034
  vkBlendOpPlusExt* = VkBlendOp 1000148035
  vkBlendOpPlusClampedExt* = VkBlendOp 1000148036
  vkBlendOpPlusClampedAlphaExt* = VkBlendOp 1000148037
  vkBlendOpPlusDarkerExt* = VkBlendOp 1000148038
  vkBlendOpMinusExt* = VkBlendOp 1000148039
  vkBlendOpMinusClampedExt* = VkBlendOp 1000148040
  vkBlendOpContrastExt* = VkBlendOp 1000148041
  vkBlendOpInvertOvgExt* = VkBlendOp 1000148042
  vkBlendOpRedExt* = VkBlendOp 1000148043
  vkBlendOpGreenExt* = VkBlendOp 1000148044
  vkBlendOpBlueExt* = VkBlendOp 1000148045
type VkStencilOp* = distinct cint
proc `==`*(x, y: VkStencilOp): bool {.borrow.}
proc `-`*(x: VkStencilOp): VkStencilOp {.borrow.}
proc `-`*(x, y: VkStencilOp): VkStencilOp {.borrow.}
proc `+`*(x, y: VkStencilOp): VkStencilOp {.borrow.}
proc `+`*(x: VkStencilOp, y: int): VkStencilOp {.used.} = x + VkStencilOp(y)

const
  vkStencilOpKeep* = VkStencilOp 0
  vkStencilOpZero* = VkStencilOp 1
  vkStencilOpReplace* = VkStencilOp 2
  vkStencilOpIncrementAndClamp* = VkStencilOp 3
  vkStencilOpDecrementAndClamp* = VkStencilOp 4
  vkStencilOpInvert* = VkStencilOp 5
  vkStencilOpIncrementAndWrap* = VkStencilOp 6
  vkStencilOpDecrementAndWrap* = VkStencilOp 7
type VkLogicOp* = distinct cint
proc `==`*(x, y: VkLogicOp): bool {.borrow.}
proc `-`*(x: VkLogicOp): VkLogicOp {.borrow.}
proc `-`*(x, y: VkLogicOp): VkLogicOp {.borrow.}
proc `+`*(x, y: VkLogicOp): VkLogicOp {.borrow.}
proc `+`*(x: VkLogicOp, y: int): VkLogicOp {.used.} = x + VkLogicOp(y)

const
  vkLogicOpClear* = VkLogicOp 0
  vkLogicOpAnd* = VkLogicOp 1
  vkLogicOpAndReverse* = VkLogicOp 2
  vkLogicOpCopy* = VkLogicOp 3
  vkLogicOpAndInverted* = VkLogicOp 4
  vkLogicOpNoOp* = VkLogicOp 5
  vkLogicOpXor* = VkLogicOp 6
  vkLogicOpOr* = VkLogicOp 7
  vkLogicOpNor* = VkLogicOp 8
  vkLogicOpEquivalent* = VkLogicOp 9
  vkLogicOpInvert* = VkLogicOp 10
  vkLogicOpOrReverse* = VkLogicOp 11
  vkLogicOpCopyInverted* = VkLogicOp 12
  vkLogicOpOrInverted* = VkLogicOp 13
  vkLogicOpNand* = VkLogicOp 14
  vkLogicOpSet* = VkLogicOp 15
type VkInternalAllocationType* = distinct cint
proc `==`*(x, y: VkInternalAllocationType): bool {.borrow.}
proc `-`*(x: VkInternalAllocationType): VkInternalAllocationType {.borrow.}
proc `-`*(x, y: VkInternalAllocationType): VkInternalAllocationType {.borrow.}
proc `+`*(x, y: VkInternalAllocationType): VkInternalAllocationType {.borrow.}
proc `+`*(x: VkInternalAllocationType, y: int): VkInternalAllocationType {.used.} = x + VkInternalAllocationType(y)

const
  vkInternalAllocationTypeExecutable* = VkInternalAllocationType 0
type VkSystemAllocationScope* = distinct cint
proc `==`*(x, y: VkSystemAllocationScope): bool {.borrow.}
proc `-`*(x: VkSystemAllocationScope): VkSystemAllocationScope {.borrow.}
proc `-`*(x, y: VkSystemAllocationScope): VkSystemAllocationScope {.borrow.}
proc `+`*(x, y: VkSystemAllocationScope): VkSystemAllocationScope {.borrow.}
proc `+`*(x: VkSystemAllocationScope, y: int): VkSystemAllocationScope {.used.} = x + VkSystemAllocationScope(y)

const
  vkSystemAllocationScopeCommand* = VkSystemAllocationScope 0
  vkSystemAllocationScopeObject* = VkSystemAllocationScope 1
  vkSystemAllocationScopeCache* = VkSystemAllocationScope 2
  vkSystemAllocationScopeDevice* = VkSystemAllocationScope 3
  vkSystemAllocationScopeInstance* = VkSystemAllocationScope 4
type VkPhysicalDeviceType* = distinct cint
proc `==`*(x, y: VkPhysicalDeviceType): bool {.borrow.}
proc `-`*(x: VkPhysicalDeviceType): VkPhysicalDeviceType {.borrow.}
proc `-`*(x, y: VkPhysicalDeviceType): VkPhysicalDeviceType {.borrow.}
proc `+`*(x, y: VkPhysicalDeviceType): VkPhysicalDeviceType {.borrow.}
proc `+`*(x: VkPhysicalDeviceType, y: int): VkPhysicalDeviceType {.used.} = x + VkPhysicalDeviceType(y)

const
  vkPhysicalDeviceTypeOther* = VkPhysicalDeviceType 0
  vkPhysicalDeviceTypeIntegratedGpu* = VkPhysicalDeviceType 1
  vkPhysicalDeviceTypeDiscreteGpu* = VkPhysicalDeviceType 2
  vkPhysicalDeviceTypeVirtualGpu* = VkPhysicalDeviceType 3
  vkPhysicalDeviceTypeCpu* = VkPhysicalDeviceType 4
type VkVertexInputRate* = distinct cint
proc `==`*(x, y: VkVertexInputRate): bool {.borrow.}
proc `-`*(x: VkVertexInputRate): VkVertexInputRate {.borrow.}
proc `-`*(x, y: VkVertexInputRate): VkVertexInputRate {.borrow.}
proc `+`*(x, y: VkVertexInputRate): VkVertexInputRate {.borrow.}
proc `+`*(x: VkVertexInputRate, y: int): VkVertexInputRate {.used.} = x + VkVertexInputRate(y)

const
  vkVertexInputRateVertex* = VkVertexInputRate 0
  vkVertexInputRateInstance* = VkVertexInputRate 1
type VkFormat* = distinct cint
proc `==`*(x, y: VkFormat): bool {.borrow.}
proc `-`*(x: VkFormat): VkFormat {.borrow.}
proc `-`*(x, y: VkFormat): VkFormat {.borrow.}
proc `+`*(x, y: VkFormat): VkFormat {.borrow.}
proc `+`*(x: VkFormat, y: int): VkFormat {.used.} = x + VkFormat(y)

const
  vkFormatUndefined* = VkFormat 0
  vkFormatR4g4UnormPack8* = VkFormat 1
  vkFormatR4g4b4a4UnormPack16* = VkFormat 2
  vkFormatB4g4r4a4UnormPack16* = VkFormat 3
  vkFormatR5g6b5UnormPack16* = VkFormat 4
  vkFormatB5g6r5UnormPack16* = VkFormat 5
  vkFormatR5g5b5a1UnormPack16* = VkFormat 6
  vkFormatB5g5r5a1UnormPack16* = VkFormat 7
  vkFormatA1r5g5b5UnormPack16* = VkFormat 8
  vkFormatR8Unorm* = VkFormat 9
  vkFormatR8Snorm* = VkFormat 10
  vkFormatR8Uscaled* = VkFormat 11
  vkFormatR8Sscaled* = VkFormat 12
  vkFormatR8Uint* = VkFormat 13
  vkFormatR8Sint* = VkFormat 14
  vkFormatR8Srgb* = VkFormat 15
  vkFormatR8g8Unorm* = VkFormat 16
  vkFormatR8g8Snorm* = VkFormat 17
  vkFormatR8g8Uscaled* = VkFormat 18
  vkFormatR8g8Sscaled* = VkFormat 19
  vkFormatR8g8Uint* = VkFormat 20
  vkFormatR8g8Sint* = VkFormat 21
  vkFormatR8g8Srgb* = VkFormat 22
  vkFormatR8g8b8Unorm* = VkFormat 23
  vkFormatR8g8b8Snorm* = VkFormat 24
  vkFormatR8g8b8Uscaled* = VkFormat 25
  vkFormatR8g8b8Sscaled* = VkFormat 26
  vkFormatR8g8b8Uint* = VkFormat 27
  vkFormatR8g8b8Sint* = VkFormat 28
  vkFormatR8g8b8Srgb* = VkFormat 29
  vkFormatB8g8r8Unorm* = VkFormat 30
  vkFormatB8g8r8Snorm* = VkFormat 31
  vkFormatB8g8r8Uscaled* = VkFormat 32
  vkFormatB8g8r8Sscaled* = VkFormat 33
  vkFormatB8g8r8Uint* = VkFormat 34
  vkFormatB8g8r8Sint* = VkFormat 35
  vkFormatB8g8r8Srgb* = VkFormat 36
  vkFormatR8g8b8a8Unorm* = VkFormat 37
  vkFormatR8g8b8a8Snorm* = VkFormat 38
  vkFormatR8g8b8a8Uscaled* = VkFormat 39
  vkFormatR8g8b8a8Sscaled* = VkFormat 40
  vkFormatR8g8b8a8Uint* = VkFormat 41
  vkFormatR8g8b8a8Sint* = VkFormat 42
  vkFormatR8g8b8a8Srgb* = VkFormat 43
  vkFormatB8g8r8a8Unorm* = VkFormat 44
  vkFormatB8g8r8a8Snorm* = VkFormat 45
  vkFormatB8g8r8a8Uscaled* = VkFormat 46
  vkFormatB8g8r8a8Sscaled* = VkFormat 47
  vkFormatB8g8r8a8Uint* = VkFormat 48
  vkFormatB8g8r8a8Sint* = VkFormat 49
  vkFormatB8g8r8a8Srgb* = VkFormat 50
  vkFormatA8b8g8r8UnormPack32* = VkFormat 51
  vkFormatA8b8g8r8SnormPack32* = VkFormat 52
  vkFormatA8b8g8r8UscaledPack32* = VkFormat 53
  vkFormatA8b8g8r8SscaledPack32* = VkFormat 54
  vkFormatA8b8g8r8UintPack32* = VkFormat 55
  vkFormatA8b8g8r8SintPack32* = VkFormat 56
  vkFormatA8b8g8r8SrgbPack32* = VkFormat 57
  vkFormatA2r10g10b10UnormPack32* = VkFormat 58
  vkFormatA2r10g10b10SnormPack32* = VkFormat 59
  vkFormatA2r10g10b10UscaledPack32* = VkFormat 60
  vkFormatA2r10g10b10SscaledPack32* = VkFormat 61
  vkFormatA2r10g10b10UintPack32* = VkFormat 62
  vkFormatA2r10g10b10SintPack32* = VkFormat 63
  vkFormatA2b10g10r10UnormPack32* = VkFormat 64
  vkFormatA2b10g10r10SnormPack32* = VkFormat 65
  vkFormatA2b10g10r10UscaledPack32* = VkFormat 66
  vkFormatA2b10g10r10SscaledPack32* = VkFormat 67
  vkFormatA2b10g10r10UintPack32* = VkFormat 68
  vkFormatA2b10g10r10SintPack32* = VkFormat 69
  vkFormatR16Unorm* = VkFormat 70
  vkFormatR16Snorm* = VkFormat 71
  vkFormatR16Uscaled* = VkFormat 72
  vkFormatR16Sscaled* = VkFormat 73
  vkFormatR16Uint* = VkFormat 74
  vkFormatR16Sint* = VkFormat 75
  vkFormatR16Sfloat* = VkFormat 76
  vkFormatR16g16Unorm* = VkFormat 77
  vkFormatR16g16Snorm* = VkFormat 78
  vkFormatR16g16Uscaled* = VkFormat 79
  vkFormatR16g16Sscaled* = VkFormat 80
  vkFormatR16g16Uint* = VkFormat 81
  vkFormatR16g16Sint* = VkFormat 82
  vkFormatR16g16Sfloat* = VkFormat 83
  vkFormatR16g16b16Unorm* = VkFormat 84
  vkFormatR16g16b16Snorm* = VkFormat 85
  vkFormatR16g16b16Uscaled* = VkFormat 86
  vkFormatR16g16b16Sscaled* = VkFormat 87
  vkFormatR16g16b16Uint* = VkFormat 88
  vkFormatR16g16b16Sint* = VkFormat 89
  vkFormatR16g16b16Sfloat* = VkFormat 90
  vkFormatR16g16b16a16Unorm* = VkFormat 91
  vkFormatR16g16b16a16Snorm* = VkFormat 92
  vkFormatR16g16b16a16Uscaled* = VkFormat 93
  vkFormatR16g16b16a16Sscaled* = VkFormat 94
  vkFormatR16g16b16a16Uint* = VkFormat 95
  vkFormatR16g16b16a16Sint* = VkFormat 96
  vkFormatR16g16b16a16Sfloat* = VkFormat 97
  vkFormatR32Uint* = VkFormat 98
  vkFormatR32Sint* = VkFormat 99
  vkFormatR32Sfloat* = VkFormat 100
  vkFormatR32g32Uint* = VkFormat 101
  vkFormatR32g32Sint* = VkFormat 102
  vkFormatR32g32Sfloat* = VkFormat 103
  vkFormatR32g32b32Uint* = VkFormat 104
  vkFormatR32g32b32Sint* = VkFormat 105
  vkFormatR32g32b32Sfloat* = VkFormat 106
  vkFormatR32g32b32a32Uint* = VkFormat 107
  vkFormatR32g32b32a32Sint* = VkFormat 108
  vkFormatR32g32b32a32Sfloat* = VkFormat 109
  vkFormatR64Uint* = VkFormat 110
  vkFormatR64Sint* = VkFormat 111
  vkFormatR64Sfloat* = VkFormat 112
  vkFormatR64g64Uint* = VkFormat 113
  vkFormatR64g64Sint* = VkFormat 114
  vkFormatR64g64Sfloat* = VkFormat 115
  vkFormatR64g64b64Uint* = VkFormat 116
  vkFormatR64g64b64Sint* = VkFormat 117
  vkFormatR64g64b64Sfloat* = VkFormat 118
  vkFormatR64g64b64a64Uint* = VkFormat 119
  vkFormatR64g64b64a64Sint* = VkFormat 120
  vkFormatR64g64b64a64Sfloat* = VkFormat 121
  vkFormatB10g11r11UfloatPack32* = VkFormat 122
  vkFormatE5b9g9r9UfloatPack32* = VkFormat 123
  vkFormatD16Unorm* = VkFormat 124
  vkFormatX8D24UnormPack32* = VkFormat 125
  vkFormatD32Sfloat* = VkFormat 126
  vkFormatS8Uint* = VkFormat 127
  vkFormatD16UnormS8Uint* = VkFormat 128
  vkFormatD24UnormS8Uint* = VkFormat 129
  vkFormatD32SfloatS8Uint* = VkFormat 130
  vkFormatBc1RgbUnormBlock* = VkFormat 131
  vkFormatBc1RgbSrgbBlock* = VkFormat 132
  vkFormatBc1RgbaUnormBlock* = VkFormat 133
  vkFormatBc1RgbaSrgbBlock* = VkFormat 134
  vkFormatBc2UnormBlock* = VkFormat 135
  vkFormatBc2SrgbBlock* = VkFormat 136
  vkFormatBc3UnormBlock* = VkFormat 137
  vkFormatBc3SrgbBlock* = VkFormat 138
  vkFormatBc4UnormBlock* = VkFormat 139
  vkFormatBc4SnormBlock* = VkFormat 140
  vkFormatBc5UnormBlock* = VkFormat 141
  vkFormatBc5SnormBlock* = VkFormat 142
  vkFormatBc6hUfloatBlock* = VkFormat 143
  vkFormatBc6hSfloatBlock* = VkFormat 144
  vkFormatBc7UnormBlock* = VkFormat 145
  vkFormatBc7SrgbBlock* = VkFormat 146
  vkFormatEtc2R8g8b8UnormBlock* = VkFormat 147
  vkFormatEtc2R8g8b8SrgbBlock* = VkFormat 148
  vkFormatEtc2R8g8b8a1UnormBlock* = VkFormat 149
  vkFormatEtc2R8g8b8a1SrgbBlock* = VkFormat 150
  vkFormatEtc2R8g8b8a8UnormBlock* = VkFormat 151
  vkFormatEtc2R8g8b8a8SrgbBlock* = VkFormat 152
  vkFormatEacR11UnormBlock* = VkFormat 153
  vkFormatEacR11SnormBlock* = VkFormat 154
  vkFormatEacR11g11UnormBlock* = VkFormat 155
  vkFormatEacR11g11SnormBlock* = VkFormat 156
  vkFormatAstc4x4UnormBlock* = VkFormat 157
  vkFormatAstc4x4SrgbBlock* = VkFormat 158
  vkFormatAstc5x4UnormBlock* = VkFormat 159
  vkFormatAstc5x4SrgbBlock* = VkFormat 160
  vkFormatAstc5x5UnormBlock* = VkFormat 161
  vkFormatAstc5x5SrgbBlock* = VkFormat 162
  vkFormatAstc6x5UnormBlock* = VkFormat 163
  vkFormatAstc6x5SrgbBlock* = VkFormat 164
  vkFormatAstc6x6UnormBlock* = VkFormat 165
  vkFormatAstc6x6SrgbBlock* = VkFormat 166
  vkFormatAstc8x5UnormBlock* = VkFormat 167
  vkFormatAstc8x5SrgbBlock* = VkFormat 168
  vkFormatAstc8x6UnormBlock* = VkFormat 169
  vkFormatAstc8x6SrgbBlock* = VkFormat 170
  vkFormatAstc8x8UnormBlock* = VkFormat 171
  vkFormatAstc8x8SrgbBlock* = VkFormat 172
  vkFormatAstc10x5UnormBlock* = VkFormat 173
  vkFormatAstc10x5SrgbBlock* = VkFormat 174
  vkFormatAstc10x6UnormBlock* = VkFormat 175
  vkFormatAstc10x6SrgbBlock* = VkFormat 176
  vkFormatAstc10x8UnormBlock* = VkFormat 177
  vkFormatAstc10x8SrgbBlock* = VkFormat 178
  vkFormatAstc10x10UnormBlock* = VkFormat 179
  vkFormatAstc10x10SrgbBlock* = VkFormat 180
  vkFormatAstc12x10UnormBlock* = VkFormat 181
  vkFormatAstc12x10SrgbBlock* = VkFormat 182
  vkFormatAstc12x12UnormBlock* = VkFormat 183
  vkFormatAstc12x12SrgbBlock* = VkFormat 184
  vkFormatPvrtc12bppUnormBlockImg* = VkFormat 1000054000
  vkFormatPvrtc14bppUnormBlockImg* = VkFormat 1000054001
  vkFormatPvrtc22bppUnormBlockImg* = VkFormat 1000054002
  vkFormatPvrtc24bppUnormBlockImg* = VkFormat 1000054003
  vkFormatPvrtc12bppSrgbBlockImg* = VkFormat 1000054004
  vkFormatPvrtc14bppSrgbBlockImg* = VkFormat 1000054005
  vkFormatPvrtc22bppSrgbBlockImg* = VkFormat 1000054006
  vkFormatPvrtc24bppSrgbBlockImg* = VkFormat 1000054007
  vkFormatAstc4x4SfloatBlockExt* = VkFormat 1000066000
  vkFormatAstc5x4SfloatBlockExt* = VkFormat 1000066001
  vkFormatAstc5x5SfloatBlockExt* = VkFormat 1000066002
  vkFormatAstc6x5SfloatBlockExt* = VkFormat 1000066003
  vkFormatAstc6x6SfloatBlockExt* = VkFormat 1000066004
  vkFormatAstc8x5SfloatBlockExt* = VkFormat 1000066005
  vkFormatAstc8x6SfloatBlockExt* = VkFormat 1000066006
  vkFormatAstc8x8SfloatBlockExt* = VkFormat 1000066007
  vkFormatAstc10x5SfloatBlockExt* = VkFormat 1000066008
  vkFormatAstc10x6SfloatBlockExt* = VkFormat 1000066009
  vkFormatAstc10x8SfloatBlockExt* = VkFormat 1000066010
  vkFormatAstc10x10SfloatBlockExt* = VkFormat 1000066011
  vkFormatAstc12x10SfloatBlockExt* = VkFormat 1000066012
  vkFormatAstc12x12SfloatBlockExt* = VkFormat 1000066013
  vkFormatG8b8g8r8422Unorm* = VkFormat 1000156000
  vkFormatB8g8r8g8422Unorm* = VkFormat 1000156001
  vkFormatG8B8R83plane420Unorm* = VkFormat 1000156002
  vkFormatG8B8r82plane420Unorm* = VkFormat 1000156003
  vkFormatG8B8R83plane422Unorm* = VkFormat 1000156004
  vkFormatG8B8r82plane422Unorm* = VkFormat 1000156005
  vkFormatG8B8R83plane444Unorm* = VkFormat 1000156006
  vkFormatR10x6UnormPack16* = VkFormat 1000156007
  vkFormatR10x6g10x6Unorm2pack16* = VkFormat 1000156008
  vkFormatR10x6g10x6b10x6a10x6Unorm4pack16* = VkFormat 1000156009
  vkFormatG10x6b10x6g10x6r10x6422Unorm4pack16* = VkFormat 1000156010
  vkFormatB10x6g10x6r10x6g10x6422Unorm4pack16* = VkFormat 1000156011
  vkFormatG10x6B10x6R10x63plane420Unorm3pack16* = VkFormat 1000156012
  vkFormatG10x6B10x6r10x62plane420Unorm3pack16* = VkFormat 1000156013
  vkFormatG10x6B10x6R10x63plane422Unorm3pack16* = VkFormat 1000156014
  vkFormatG10x6B10x6r10x62plane422Unorm3pack16* = VkFormat 1000156015
  vkFormatG10x6B10x6R10x63plane444Unorm3pack16* = VkFormat 1000156016
  vkFormatR12x4UnormPack16* = VkFormat 1000156017
  vkFormatR12x4g12x4Unorm2pack16* = VkFormat 1000156018
  vkFormatR12x4g12x4b12x4a12x4Unorm4pack16* = VkFormat 1000156019
  vkFormatG12x4b12x4g12x4r12x4422Unorm4pack16* = VkFormat 1000156020
  vkFormatB12x4g12x4r12x4g12x4422Unorm4pack16* = VkFormat 1000156021
  vkFormatG12x4B12x4R12x43plane420Unorm3pack16* = VkFormat 1000156022
  vkFormatG12x4B12x4r12x42plane420Unorm3pack16* = VkFormat 1000156023
  vkFormatG12x4B12x4R12x43plane422Unorm3pack16* = VkFormat 1000156024
  vkFormatG12x4B12x4r12x42plane422Unorm3pack16* = VkFormat 1000156025
  vkFormatG12x4B12x4R12x43plane444Unorm3pack16* = VkFormat 1000156026
  vkFormatG16b16g16r16422Unorm* = VkFormat 1000156027
  vkFormatB16g16r16g16422Unorm* = VkFormat 1000156028
  vkFormatG16B16R163plane420Unorm* = VkFormat 1000156029
  vkFormatG16B16r162plane420Unorm* = VkFormat 1000156030
  vkFormatG16B16R163plane422Unorm* = VkFormat 1000156031
  vkFormatG16B16r162plane422Unorm* = VkFormat 1000156032
  vkFormatG16B16R163plane444Unorm* = VkFormat 1000156033
  vkFormatAstc3x3x3UnormBlockExt* = VkFormat 1000288000
  vkFormatAstc3x3x3SrgbBlockExt* = VkFormat 1000288001
  vkFormatAstc3x3x3SfloatBlockExt* = VkFormat 1000288002
  vkFormatAstc4x3x3UnormBlockExt* = VkFormat 1000288003
  vkFormatAstc4x3x3SrgbBlockExt* = VkFormat 1000288004
  vkFormatAstc4x3x3SfloatBlockExt* = VkFormat 1000288005
  vkFormatAstc4x4x3UnormBlockExt* = VkFormat 1000288006
  vkFormatAstc4x4x3SrgbBlockExt* = VkFormat 1000288007
  vkFormatAstc4x4x3SfloatBlockExt* = VkFormat 1000288008
  vkFormatAstc4x4x4UnormBlockExt* = VkFormat 1000288009
  vkFormatAstc4x4x4SrgbBlockExt* = VkFormat 1000288010
  vkFormatAstc4x4x4SfloatBlockExt* = VkFormat 1000288011
  vkFormatAstc5x4x4UnormBlockExt* = VkFormat 1000288012
  vkFormatAstc5x4x4SrgbBlockExt* = VkFormat 1000288013
  vkFormatAstc5x4x4SfloatBlockExt* = VkFormat 1000288014
  vkFormatAstc5x5x4UnormBlockExt* = VkFormat 1000288015
  vkFormatAstc5x5x4SrgbBlockExt* = VkFormat 1000288016
  vkFormatAstc5x5x4SfloatBlockExt* = VkFormat 1000288017
  vkFormatAstc5x5x5UnormBlockExt* = VkFormat 1000288018
  vkFormatAstc5x5x5SrgbBlockExt* = VkFormat 1000288019
  vkFormatAstc5x5x5SfloatBlockExt* = VkFormat 1000288020
  vkFormatAstc6x5x5UnormBlockExt* = VkFormat 1000288021
  vkFormatAstc6x5x5SrgbBlockExt* = VkFormat 1000288022
  vkFormatAstc6x5x5SfloatBlockExt* = VkFormat 1000288023
  vkFormatAstc6x6x5UnormBlockExt* = VkFormat 1000288024
  vkFormatAstc6x6x5SrgbBlockExt* = VkFormat 1000288025
  vkFormatAstc6x6x5SfloatBlockExt* = VkFormat 1000288026
  vkFormatAstc6x6x6UnormBlockExt* = VkFormat 1000288027
  vkFormatAstc6x6x6SrgbBlockExt* = VkFormat 1000288028
  vkFormatAstc6x6x6SfloatBlockExt* = VkFormat 1000288029
  vkFormatA4r4g4b4UnormPack16Ext* = VkFormat 1000340000
  vkFormatA4b4g4r4UnormPack16Ext* = VkFormat 1000340001
type VkStructureType* = distinct cint
proc `==`*(x, y: VkStructureType): bool {.borrow.}
proc `-`*(x: VkStructureType): VkStructureType {.borrow.}
proc `-`*(x, y: VkStructureType): VkStructureType {.borrow.}
proc `+`*(x, y: VkStructureType): VkStructureType {.borrow.}
proc `+`*(x: VkStructureType, y: int): VkStructureType {.used.} = x + VkStructureType(y)

const
  vkStructureTypeApplicationInfo* = VkStructureType 0
  vkStructureTypeInstanceCreateInfo* = VkStructureType 1
  vkStructureTypeDeviceQueueCreateInfo* = VkStructureType 2
  vkStructureTypeDeviceCreateInfo* = VkStructureType 3
  vkStructureTypeSubmitInfo* = VkStructureType 4
  vkStructureTypeMemoryAllocateInfo* = VkStructureType 5
  vkStructureTypeMappedMemoryRange* = VkStructureType 6
  vkStructureTypeBindSparseInfo* = VkStructureType 7
  vkStructureTypeFenceCreateInfo* = VkStructureType 8
  vkStructureTypeSemaphoreCreateInfo* = VkStructureType 9
  vkStructureTypeEventCreateInfo* = VkStructureType 10
  vkStructureTypeQueryPoolCreateInfo* = VkStructureType 11
  vkStructureTypeBufferCreateInfo* = VkStructureType 12
  vkStructureTypeBufferViewCreateInfo* = VkStructureType 13
  vkStructureTypeImageCreateInfo* = VkStructureType 14
  vkStructureTypeImageViewCreateInfo* = VkStructureType 15
  vkStructureTypeShaderModuleCreateInfo* = VkStructureType 16
  vkStructureTypePipelineCacheCreateInfo* = VkStructureType 17
  vkStructureTypePipelineShaderStageCreateInfo* = VkStructureType 18
  vkStructureTypePipelineVertexInputStateCreateInfo* = VkStructureType 19
  vkStructureTypePipelineInputAssemblyStateCreateInfo* = VkStructureType 20
  vkStructureTypePipelineTessellationStateCreateInfo* = VkStructureType 21
  vkStructureTypePipelineViewportStateCreateInfo* = VkStructureType 22
  vkStructureTypePipelineRasterizationStateCreateInfo* = VkStructureType 23
  vkStructureTypePipelineMultisampleStateCreateInfo* = VkStructureType 24
  vkStructureTypePipelineDepthStencilStateCreateInfo* = VkStructureType 25
  vkStructureTypePipelineColorBlendStateCreateInfo* = VkStructureType 26
  vkStructureTypePipelineDynamicStateCreateInfo* = VkStructureType 27
  vkStructureTypeGraphicsPipelineCreateInfo* = VkStructureType 28
  vkStructureTypeComputePipelineCreateInfo* = VkStructureType 29
  vkStructureTypePipelineLayoutCreateInfo* = VkStructureType 30
  vkStructureTypeSamplerCreateInfo* = VkStructureType 31
  vkStructureTypeDescriptorSetLayoutCreateInfo* = VkStructureType 32
  vkStructureTypeDescriptorPoolCreateInfo* = VkStructureType 33
  vkStructureTypeDescriptorSetAllocateInfo* = VkStructureType 34
  vkStructureTypeWriteDescriptorSet* = VkStructureType 35
  vkStructureTypeCopyDescriptorSet* = VkStructureType 36
  vkStructureTypeFramebufferCreateInfo* = VkStructureType 37
  vkStructureTypeRenderPassCreateInfo* = VkStructureType 38
  vkStructureTypeCommandPoolCreateInfo* = VkStructureType 39
  vkStructureTypeCommandBufferAllocateInfo* = VkStructureType 40
  vkStructureTypeCommandBufferInheritanceInfo* = VkStructureType 41
  vkStructureTypeCommandBufferBeginInfo* = VkStructureType 42
  vkStructureTypeRenderPassBeginInfo* = VkStructureType 43
  vkStructureTypeBufferMemoryBarrier* = VkStructureType 44
  vkStructureTypeImageMemoryBarrier* = VkStructureType 45
  vkStructureTypeMemoryBarrier* = VkStructureType 46
  vkStructureTypeLoaderInstanceCreateInfo* = VkStructureType 47
  vkStructureTypeLoaderDeviceCreateInfo* = VkStructureType 48
  vkStructureTypePhysicalDeviceVulkan11Features* = VkStructureType 49
  vkStructureTypePhysicalDeviceVulkan11Properties* = VkStructureType 50
  vkStructureTypePhysicalDeviceVulkan12Features* = VkStructureType 51
  vkStructureTypePhysicalDeviceVulkan12Properties* = VkStructureType 52
  vkStructureTypeSwapchainCreateInfoKhr* = VkStructureType 1000001000
  vkStructureTypePresentInfoKhr* = VkStructureType 1000001001
  vkStructureTypeDeviceGroupPresentCapabilitiesKhr* = VkStructureType 1000001007
  vkStructureTypeImageSwapchainCreateInfoKhr* = VkStructureType 1000001008
  vkStructureTypeBindImageMemorySwapchainInfoKhr* = VkStructureType 1000001009
  vkStructureTypeAcquireNextImageInfoKhr* = VkStructureType 1000001010
  vkStructureTypeDeviceGroupPresentInfoKhr* = VkStructureType 1000001011
  vkStructureTypeDeviceGroupSwapchainCreateInfoKhr* = VkStructureType 1000001012
  vkStructureTypeDisplayModeCreateInfoKhr* = VkStructureType 1000002000
  vkStructureTypeDisplaySurfaceCreateInfoKhr* = VkStructureType 1000002001
  vkStructureTypeDisplayPresentInfoKhr* = VkStructureType 1000003000
  vkStructureTypeXlibSurfaceCreateInfoKhr* = VkStructureType 1000004000
  vkStructureTypeXcbSurfaceCreateInfoKhr* = VkStructureType 1000005000
  vkStructureTypeWaylandSurfaceCreateInfoKhr* = VkStructureType 1000006000
  vkStructureTypeAndroidSurfaceCreateInfoKhr* = VkStructureType 1000008000
  vkStructureTypeWin32SurfaceCreateInfoKhr* = VkStructureType 1000009000
  vkStructureTypeNativeBufferAndroid* = VkStructureType 1000010000
  vkStructureTypeSwapchainImageCreateInfoAndroid* = VkStructureType 1000010001
  vkStructureTypePhysicalDevicePresentationPropertiesAndroid* = VkStructureType 1000010002
  vkStructureTypeDebugReportCallbackCreateInfoExt* = VkStructureType 1000011000
  vkStructureTypePipelineRasterizationStateRasterizationOrderAmd* = VkStructureType 1000018000
  vkStructureTypeDebugMarkerObjectNameInfoExt* = VkStructureType 1000022000
  vkStructureTypeDebugMarkerObjectTagInfoExt* = VkStructureType 1000022001
  vkStructureTypeDebugMarkerMarkerInfoExt* = VkStructureType 1000022002
  vkStructureTypeDedicatedAllocationImageCreateInfoNv* = VkStructureType 1000026000
  vkStructureTypeDedicatedAllocationBufferCreateInfoNv* = VkStructureType 1000026001
  vkStructureTypeDedicatedAllocationMemoryAllocateInfoNv* = VkStructureType 1000026002
  vkStructureTypePhysicalDeviceTransformFeedbackFeaturesExt* = VkStructureType 1000028000
  vkStructureTypePhysicalDeviceTransformFeedbackPropertiesExt* = VkStructureType 1000028001
  vkStructureTypePipelineRasterizationStateStreamCreateInfoExt* = VkStructureType 1000028002
  vkStructureTypeImageViewHandleInfoNvx* = VkStructureType 1000030000
  vkStructureTypeImageViewAddressPropertiesNvx* = VkStructureType 1000030001
  vkStructureTypeTextureLodGatherFormatPropertiesAmd* = VkStructureType 1000041000
  vkStructureTypeStreamDescriptorSurfaceCreateInfoGgp* = VkStructureType 1000049000
  vkStructureTypePhysicalDeviceCornerSampledImageFeaturesNv* = VkStructureType 1000050000
  vkStructureTypeRenderPassMultiviewCreateInfo* = VkStructureType 1000053000
  vkStructureTypePhysicalDeviceMultiviewFeatures* = VkStructureType 1000053001
  vkStructureTypePhysicalDeviceMultiviewProperties* = VkStructureType 1000053002
  vkStructureTypeExternalMemoryImageCreateInfoNv* = VkStructureType 1000056000
  vkStructureTypeExportMemoryAllocateInfoNv* = VkStructureType 1000056001
  vkStructureTypeImportMemoryWin32HandleInfoNv* = VkStructureType 1000057000
  vkStructureTypeExportMemoryWin32HandleInfoNv* = VkStructureType 1000057001
  vkStructureTypeWin32KeyedMutexAcquireReleaseInfoNv* = VkStructureType 1000058000
  vkStructureTypePhysicalDeviceFeatures2* = VkStructureType 1000059000
  vkStructureTypePhysicalDeviceProperties2* = VkStructureType 1000059001
  vkStructureTypeFormatProperties2* = VkStructureType 1000059002
  vkStructureTypeImageFormatProperties2* = VkStructureType 1000059003
  vkStructureTypePhysicalDeviceImageFormatInfo2* = VkStructureType 1000059004
  vkStructureTypeQueueFamilyProperties2* = VkStructureType 1000059005
  vkStructureTypePhysicalDeviceMemoryProperties2* = VkStructureType 1000059006
  vkStructureTypeSparseImageFormatProperties2* = VkStructureType 1000059007
  vkStructureTypePhysicalDeviceSparseImageFormatInfo2* = VkStructureType 1000059008
  vkStructureTypeMemoryAllocateFlagsInfo* = VkStructureType 1000060000
  vkStructureTypeDeviceGroupRenderPassBeginInfo* = VkStructureType 1000060003
  vkStructureTypeDeviceGroupCommandBufferBeginInfo* = VkStructureType 1000060004
  vkStructureTypeDeviceGroupSubmitInfo* = VkStructureType 1000060005
  vkStructureTypeDeviceGroupBindSparseInfo* = VkStructureType 1000060006
  vkStructureTypeBindBufferMemoryDeviceGroupInfo* = VkStructureType 1000060013
  vkStructureTypeBindImageMemoryDeviceGroupInfo* = VkStructureType 1000060014
  vkStructureTypeValidationFlagsExt* = VkStructureType 1000061000
  vkStructureTypeViSurfaceCreateInfoNn* = VkStructureType 1000062000
  vkStructureTypePhysicalDeviceShaderDrawParametersFeatures* = VkStructureType 1000063000
  vkStructureTypePhysicalDeviceTextureCompressionAstcHdrFeaturesExt* = VkStructureType 1000066000
  vkStructureTypeImageViewAstcDecodeModeExt* = VkStructureType 1000067000
  vkStructureTypePhysicalDeviceAstcDecodeFeaturesExt* = VkStructureType 1000067001
  vkStructureTypePhysicalDeviceGroupProperties* = VkStructureType 1000070000
  vkStructureTypeDeviceGroupDeviceCreateInfo* = VkStructureType 1000070001
  vkStructureTypePhysicalDeviceExternalImageFormatInfo* = VkStructureType 1000071000
  vkStructureTypeExternalImageFormatProperties* = VkStructureType 1000071001
  vkStructureTypePhysicalDeviceExternalBufferInfo* = VkStructureType 1000071002
  vkStructureTypeExternalBufferProperties* = VkStructureType 1000071003
  vkStructureTypePhysicalDeviceIdProperties* = VkStructureType 1000071004
  vkStructureTypeExternalMemoryBufferCreateInfo* = VkStructureType 1000072000
  vkStructureTypeExternalMemoryImageCreateInfo* = VkStructureType 1000072001
  vkStructureTypeExportMemoryAllocateInfo* = VkStructureType 1000072002
  vkStructureTypeImportMemoryWin32HandleInfoKhr* = VkStructureType 1000073000
  vkStructureTypeExportMemoryWin32HandleInfoKhr* = VkStructureType 1000073001
  vkStructureTypeMemoryWin32HandlePropertiesKhr* = VkStructureType 1000073002
  vkStructureTypeMemoryGetWin32HandleInfoKhr* = VkStructureType 1000073003
  vkStructureTypeImportMemoryFdInfoKhr* = VkStructureType 1000074000
  vkStructureTypeMemoryFdPropertiesKhr* = VkStructureType 1000074001
  vkStructureTypeMemoryGetFdInfoKhr* = VkStructureType 1000074002
  vkStructureTypeWin32KeyedMutexAcquireReleaseInfoKhr* = VkStructureType 1000075000
  vkStructureTypePhysicalDeviceExternalSemaphoreInfo* = VkStructureType 1000076000
  vkStructureTypeExternalSemaphoreProperties* = VkStructureType 1000076001
  vkStructureTypeExportSemaphoreCreateInfo* = VkStructureType 1000077000
  vkStructureTypeImportSemaphoreWin32HandleInfoKhr* = VkStructureType 1000078000
  vkStructureTypeExportSemaphoreWin32HandleInfoKhr* = VkStructureType 1000078001
  vkStructureTypeD3d12FenceSubmitInfoKhr* = VkStructureType 1000078002
  vkStructureTypeSemaphoreGetWin32HandleInfoKhr* = VkStructureType 1000078003
  vkStructureTypeImportSemaphoreFdInfoKhr* = VkStructureType 1000079000
  vkStructureTypeSemaphoreGetFdInfoKhr* = VkStructureType 1000079001
  vkStructureTypePhysicalDevicePushDescriptorPropertiesKhr* = VkStructureType 1000080000
  vkStructureTypeCommandBufferInheritanceConditionalRenderingInfoExt* = VkStructureType 1000081000
  vkStructureTypePhysicalDeviceConditionalRenderingFeaturesExt* = VkStructureType 1000081001
  vkStructureTypeConditionalRenderingBeginInfoExt* = VkStructureType 1000081002
  vkStructureTypePhysicalDeviceShaderFloat16Int8Features* = VkStructureType 1000082000
  vkStructureTypePhysicalDevice16bitStorageFeatures* = VkStructureType 1000083000
  vkStructureTypePresentRegionsKhr* = VkStructureType 1000084000
  vkStructureTypeDescriptorUpdateTemplateCreateInfo* = VkStructureType 1000085000
  vkStructureTypePipelineViewportWScalingStateCreateInfoNv* = VkStructureType 1000087000
  vkStructureTypeSurfaceCapabilities2Ext* = VkStructureType 1000090000
  vkStructureTypeDisplayPowerInfoExt* = VkStructureType 1000091000
  vkStructureTypeDeviceEventInfoExt* = VkStructureType 1000091001
  vkStructureTypeDisplayEventInfoExt* = VkStructureType 1000091002
  vkStructureTypeSwapchainCounterCreateInfoExt* = VkStructureType 1000091003
  vkStructureTypePresentTimesInfoGoogle* = VkStructureType 1000092000
  vkStructureTypePhysicalDeviceSubgroupProperties* = VkStructureType 1000094000
  vkStructureTypePhysicalDeviceMultiviewPerViewAttributesPropertiesNvx* = VkStructureType 1000097000
  vkStructureTypePipelineViewportSwizzleStateCreateInfoNv* = VkStructureType 1000098000
  vkStructureTypePhysicalDeviceDiscardRectanglePropertiesExt* = VkStructureType 1000099000
  vkStructureTypePipelineDiscardRectangleStateCreateInfoExt* = VkStructureType 1000099001
  vkStructureTypePhysicalDeviceConservativeRasterizationPropertiesExt* = VkStructureType 1000101000
  vkStructureTypePipelineRasterizationConservativeStateCreateInfoExt* = VkStructureType 1000101001
  vkStructureTypePhysicalDeviceDepthClipEnableFeaturesExt* = VkStructureType 1000102000
  vkStructureTypePipelineRasterizationDepthClipStateCreateInfoExt* = VkStructureType 1000102001
  vkStructureTypeHdrMetadataExt* = VkStructureType 1000105000
  vkStructureTypePhysicalDeviceImagelessFramebufferFeatures* = VkStructureType 1000108000
  vkStructureTypeFramebufferAttachmentsCreateInfo* = VkStructureType 1000108001
  vkStructureTypeFramebufferAttachmentImageInfo* = VkStructureType 1000108002
  vkStructureTypeRenderPassAttachmentBeginInfo* = VkStructureType 1000108003
  vkStructureTypeAttachmentDescription2* = VkStructureType 1000109000
  vkStructureTypeAttachmentReference2* = VkStructureType 1000109001
  vkStructureTypeSubpassDescription2* = VkStructureType 1000109002
  vkStructureTypeSubpassDependency2* = VkStructureType 1000109003
  vkStructureTypeRenderPassCreateInfo2* = VkStructureType 1000109004
  vkStructureTypeSubpassBeginInfo* = VkStructureType 1000109005
  vkStructureTypeSubpassEndInfo* = VkStructureType 1000109006
  vkStructureTypeSharedPresentSurfaceCapabilitiesKhr* = VkStructureType 1000111000
  vkStructureTypePhysicalDeviceExternalFenceInfo* = VkStructureType 1000112000
  vkStructureTypeExternalFenceProperties* = VkStructureType 1000112001
  vkStructureTypeExportFenceCreateInfo* = VkStructureType 1000113000
  vkStructureTypeImportFenceWin32HandleInfoKhr* = VkStructureType 1000114000
  vkStructureTypeExportFenceWin32HandleInfoKhr* = VkStructureType 1000114001
  vkStructureTypeFenceGetWin32HandleInfoKhr* = VkStructureType 1000114002
  vkStructureTypeImportFenceFdInfoKhr* = VkStructureType 1000115000
  vkStructureTypeFenceGetFdInfoKhr* = VkStructureType 1000115001
  vkStructureTypePhysicalDevicePerformanceQueryFeaturesKhr* = VkStructureType 1000116000
  vkStructureTypePhysicalDevicePerformanceQueryPropertiesKhr* = VkStructureType 1000116001
  vkStructureTypeQueryPoolPerformanceCreateInfoKhr* = VkStructureType 1000116002
  vkStructureTypePerformanceQuerySubmitInfoKhr* = VkStructureType 1000116003
  vkStructureTypeAcquireProfilingLockInfoKhr* = VkStructureType 1000116004
  vkStructureTypePerformanceCounterKhr* = VkStructureType 1000116005
  vkStructureTypePerformanceCounterDescriptionKhr* = VkStructureType 1000116006
  vkStructureTypePhysicalDevicePointClippingProperties* = VkStructureType 1000117000
  vkStructureTypeRenderPassInputAttachmentAspectCreateInfo* = VkStructureType 1000117001
  vkStructureTypeImageViewUsageCreateInfo* = VkStructureType 1000117002
  vkStructureTypePipelineTessellationDomainOriginStateCreateInfo* = VkStructureType 1000117003
  vkStructureTypePhysicalDeviceSurfaceInfo2Khr* = VkStructureType 1000119000
  vkStructureTypeSurfaceCapabilities2Khr* = VkStructureType 1000119001
  vkStructureTypeSurfaceFormat2Khr* = VkStructureType 1000119002
  vkStructureTypePhysicalDeviceVariablePointersFeatures* = VkStructureType 1000120000
  vkStructureTypeDisplayProperties2Khr* = VkStructureType 1000121000
  vkStructureTypeDisplayPlaneProperties2Khr* = VkStructureType 1000121001
  vkStructureTypeDisplayModeProperties2Khr* = VkStructureType 1000121002
  vkStructureTypeDisplayPlaneInfo2Khr* = VkStructureType 1000121003
  vkStructureTypeDisplayPlaneCapabilities2Khr* = VkStructureType 1000121004
  vkStructureTypeIosSurfaceCreateInfoMvk* = VkStructureType 1000122000
  vkStructureTypeMacosSurfaceCreateInfoMvk* = VkStructureType 1000123000
  vkStructureTypeMemoryDedicatedRequirements* = VkStructureType 1000127000
  vkStructureTypeMemoryDedicatedAllocateInfo* = VkStructureType 1000127001
  vkStructureTypeDebugUtilsObjectNameInfoExt* = VkStructureType 1000128000
  vkStructureTypeDebugUtilsObjectTagInfoExt* = VkStructureType 1000128001
  vkStructureTypeDebugUtilsLabelExt* = VkStructureType 1000128002
  vkStructureTypeDebugUtilsMessengerCallbackDataExt* = VkStructureType 1000128003
  vkStructureTypeDebugUtilsMessengerCreateInfoExt* = VkStructureType 1000128004
  vkStructureTypeAndroidHardwareBufferUsageAndroid* = VkStructureType 1000129000
  vkStructureTypeAndroidHardwareBufferPropertiesAndroid* = VkStructureType 1000129001
  vkStructureTypeAndroidHardwareBufferFormatPropertiesAndroid* = VkStructureType 1000129002
  vkStructureTypeImportAndroidHardwareBufferInfoAndroid* = VkStructureType 1000129003
  vkStructureTypeMemoryGetAndroidHardwareBufferInfoAndroid* = VkStructureType 1000129004
  vkStructureTypeExternalFormatAndroid* = VkStructureType 1000129005
  vkStructureTypePhysicalDeviceSamplerFilterMinmaxProperties* = VkStructureType 1000130000
  vkStructureTypeSamplerReductionModeCreateInfo* = VkStructureType 1000130001
  vkStructureTypePhysicalDeviceInlineUniformBlockFeaturesExt* = VkStructureType 1000138000
  vkStructureTypePhysicalDeviceInlineUniformBlockPropertiesExt* = VkStructureType 1000138001
  vkStructureTypeWriteDescriptorSetInlineUniformBlockExt* = VkStructureType 1000138002
  vkStructureTypeDescriptorPoolInlineUniformBlockCreateInfoExt* = VkStructureType 1000138003
  vkStructureTypeSampleLocationsInfoExt* = VkStructureType 1000143000
  vkStructureTypeRenderPassSampleLocationsBeginInfoExt* = VkStructureType 1000143001
  vkStructureTypePipelineSampleLocationsStateCreateInfoExt* = VkStructureType 1000143002
  vkStructureTypePhysicalDeviceSampleLocationsPropertiesExt* = VkStructureType 1000143003
  vkStructureTypeMultisamplePropertiesExt* = VkStructureType 1000143004
  vkStructureTypeProtectedSubmitInfo* = VkStructureType 1000145000
  vkStructureTypePhysicalDeviceProtectedMemoryFeatures* = VkStructureType 1000145001
  vkStructureTypePhysicalDeviceProtectedMemoryProperties* = VkStructureType 1000145002
  vkStructureTypeDeviceQueueInfo2* = VkStructureType 1000145003
  vkStructureTypeBufferMemoryRequirementsInfo2* = VkStructureType 1000146000
  vkStructureTypeImageMemoryRequirementsInfo2* = VkStructureType 1000146001
  vkStructureTypeImageSparseMemoryRequirementsInfo2* = VkStructureType 1000146002
  vkStructureTypeMemoryRequirements2* = VkStructureType 1000146003
  vkStructureTypeSparseImageMemoryRequirements2* = VkStructureType 1000146004
  vkStructureTypeImageFormatListCreateInfo* = VkStructureType 1000147000
  vkStructureTypePhysicalDeviceBlendOperationAdvancedFeaturesExt* = VkStructureType 1000148000
  vkStructureTypePhysicalDeviceBlendOperationAdvancedPropertiesExt* = VkStructureType 1000148001
  vkStructureTypePipelineColorBlendAdvancedStateCreateInfoExt* = VkStructureType 1000148002
  vkStructureTypePipelineCoverageToColorStateCreateInfoNv* = VkStructureType 1000149000
  vkStructureTypeAccelerationStructureBuildGeometryInfoKhr* = VkStructureType 1000150000
  vkStructureTypeAccelerationStructureDeviceAddressInfoKhr* = VkStructureType 1000150002
  vkStructureTypeAccelerationStructureGeometryAabbsDataKhr* = VkStructureType 1000150003
  vkStructureTypeAccelerationStructureGeometryInstancesDataKhr* = VkStructureType 1000150004
  vkStructureTypeAccelerationStructureGeometryTrianglesDataKhr* = VkStructureType 1000150005
  vkStructureTypeAccelerationStructureGeometryKhr* = VkStructureType 1000150006
  vkStructureTypeWriteDescriptorSetAccelerationStructureKhr* = VkStructureType 1000150007
  vkStructureTypeAccelerationStructureVersionInfoKhr* = VkStructureType 1000150009
  vkStructureTypeCopyAccelerationStructureInfoKhr* = VkStructureType 1000150010
  vkStructureTypeCopyAccelerationStructureToMemoryInfoKhr* = VkStructureType 1000150011
  vkStructureTypeCopyMemoryToAccelerationStructureInfoKhr* = VkStructureType 1000150012
  vkStructureTypePhysicalDeviceAccelerationStructureFeaturesKhr* = VkStructureType 1000150013
  vkStructureTypePhysicalDeviceAccelerationStructurePropertiesKhr* = VkStructureType 1000150014
  vkStructureTypeAccelerationStructureCreateInfoKhr* = VkStructureType 1000150017
  vkStructureTypeAccelerationStructureBuildSizesInfoKhr* = VkStructureType 1000150020
  vkStructureTypePipelineCoverageModulationStateCreateInfoNv* = VkStructureType 1000152000
  vkStructureTypePhysicalDeviceShaderSmBuiltinsFeaturesNv* = VkStructureType 1000154000
  vkStructureTypePhysicalDeviceShaderSmBuiltinsPropertiesNv* = VkStructureType 1000154001
  vkStructureTypeSamplerYcbcrConversionCreateInfo* = VkStructureType 1000156000
  vkStructureTypeSamplerYcbcrConversionInfo* = VkStructureType 1000156001
  vkStructureTypeBindImagePlaneMemoryInfo* = VkStructureType 1000156002
  vkStructureTypeImagePlaneMemoryRequirementsInfo* = VkStructureType 1000156003
  vkStructureTypePhysicalDeviceSamplerYcbcrConversionFeatures* = VkStructureType 1000156004
  vkStructureTypeSamplerYcbcrConversionImageFormatProperties* = VkStructureType 1000156005
  vkStructureTypeBindBufferMemoryInfo* = VkStructureType 1000157000
  vkStructureTypeBindImageMemoryInfo* = VkStructureType 1000157001
  vkStructureTypeDrmFormatModifierPropertiesListExt* = VkStructureType 1000158000
  vkStructureTypePhysicalDeviceImageDrmFormatModifierInfoExt* = VkStructureType 1000158002
  vkStructureTypeImageDrmFormatModifierListCreateInfoExt* = VkStructureType 1000158003
  vkStructureTypeImageDrmFormatModifierExplicitCreateInfoExt* = VkStructureType 1000158004
  vkStructureTypeImageDrmFormatModifierPropertiesExt* = VkStructureType 1000158005
  vkStructureTypeValidationCacheCreateInfoExt* = VkStructureType 1000160000
  vkStructureTypeShaderModuleValidationCacheCreateInfoExt* = VkStructureType 1000160001
  vkStructureTypeDescriptorSetLayoutBindingFlagsCreateInfo* = VkStructureType 1000161000
  vkStructureTypePhysicalDeviceDescriptorIndexingFeatures* = VkStructureType 1000161001
  vkStructureTypePhysicalDeviceDescriptorIndexingProperties* = VkStructureType 1000161002
  vkStructureTypeDescriptorSetVariableDescriptorCountAllocateInfo* = VkStructureType 1000161003
  vkStructureTypeDescriptorSetVariableDescriptorCountLayoutSupport* = VkStructureType 1000161004
  vkStructureTypePhysicalDevicePortabilitySubsetFeaturesKhr* = VkStructureType 1000163000
  vkStructureTypePhysicalDevicePortabilitySubsetPropertiesKhr* = VkStructureType 1000163001
  vkStructureTypePipelineViewportShadingRateImageStateCreateInfoNv* = VkStructureType 1000164000
  vkStructureTypePhysicalDeviceShadingRateImageFeaturesNv* = VkStructureType 1000164001
  vkStructureTypePhysicalDeviceShadingRateImagePropertiesNv* = VkStructureType 1000164002
  vkStructureTypePipelineViewportCoarseSampleOrderStateCreateInfoNv* = VkStructureType 1000164005
  vkStructureTypeRayTracingPipelineCreateInfoNv* = VkStructureType 1000165000
  vkStructureTypeAccelerationStructureCreateInfoNv* = VkStructureType 1000165001
  vkStructureTypeGeometryNv* = VkStructureType 1000165003
  vkStructureTypeGeometryTrianglesNv* = VkStructureType 1000165004
  vkStructureTypeGeometryAabbNv* = VkStructureType 1000165005
  vkStructureTypeBindAccelerationStructureMemoryInfoNv* = VkStructureType 1000165006
  vkStructureTypeWriteDescriptorSetAccelerationStructureNv* = VkStructureType 1000165007
  vkStructureTypeAccelerationStructureMemoryRequirementsInfoNv* = VkStructureType 1000165008
  vkStructureTypePhysicalDeviceRayTracingPropertiesNv* = VkStructureType 1000165009
  vkStructureTypeRayTracingShaderGroupCreateInfoNv* = VkStructureType 1000165011
  vkStructureTypeAccelerationStructureInfoNv* = VkStructureType 1000165012
  vkStructureTypePhysicalDeviceRepresentativeFragmentTestFeaturesNv* = VkStructureType 1000166000
  vkStructureTypePipelineRepresentativeFragmentTestStateCreateInfoNv* = VkStructureType 1000166001
  vkStructureTypePhysicalDeviceMaintenance3Properties* = VkStructureType 1000168000
  vkStructureTypeDescriptorSetLayoutSupport* = VkStructureType 1000168001
  vkStructureTypePhysicalDeviceImageViewImageFormatInfoExt* = VkStructureType 1000170000
  vkStructureTypeFilterCubicImageViewImageFormatPropertiesExt* = VkStructureType 1000170001
  vkStructureTypeDeviceQueueGlobalPriorityCreateInfoExt* = VkStructureType 1000174000
  vkStructureTypePhysicalDeviceShaderSubgroupExtendedTypesFeatures* = VkStructureType 1000175000
  vkStructureTypePhysicalDevice8bitStorageFeatures* = VkStructureType 1000177000
  vkStructureTypeImportMemoryHostPointerInfoExt* = VkStructureType 1000178000
  vkStructureTypeMemoryHostPointerPropertiesExt* = VkStructureType 1000178001
  vkStructureTypePhysicalDeviceExternalMemoryHostPropertiesExt* = VkStructureType 1000178002
  vkStructureTypePhysicalDeviceShaderAtomicInt64Features* = VkStructureType 1000180000
  vkStructureTypePhysicalDeviceShaderClockFeaturesKhr* = VkStructureType 1000181000
  vkStructureTypePipelineCompilerControlCreateInfoAmd* = VkStructureType 1000183000
  vkStructureTypeCalibratedTimestampInfoExt* = VkStructureType 1000184000
  vkStructureTypePhysicalDeviceShaderCorePropertiesAmd* = VkStructureType 1000185000
  vkStructureTypeDeviceMemoryOverallocationCreateInfoAmd* = VkStructureType 1000189000
  vkStructureTypePhysicalDeviceVertexAttributeDivisorPropertiesExt* = VkStructureType 1000190000
  vkStructureTypePipelineVertexInputDivisorStateCreateInfoExt* = VkStructureType 1000190001
  vkStructureTypePhysicalDeviceVertexAttributeDivisorFeaturesExt* = VkStructureType 1000190002
  vkStructureTypePresentFrameTokenGgp* = VkStructureType 1000191000
  vkStructureTypePipelineCreationFeedbackCreateInfoExt* = VkStructureType 1000192000
  vkStructureTypePhysicalDeviceDriverProperties* = VkStructureType 1000196000
  vkStructureTypePhysicalDeviceFloatControlsProperties* = VkStructureType 1000197000
  vkStructureTypePhysicalDeviceDepthStencilResolveProperties* = VkStructureType 1000199000
  vkStructureTypeSubpassDescriptionDepthStencilResolve* = VkStructureType 1000199001
  vkStructureTypePhysicalDeviceComputeShaderDerivativesFeaturesNv* = VkStructureType 1000201000
  vkStructureTypePhysicalDeviceMeshShaderFeaturesNv* = VkStructureType 1000202000
  vkStructureTypePhysicalDeviceMeshShaderPropertiesNv* = VkStructureType 1000202001
  vkStructureTypePhysicalDeviceFragmentShaderBarycentricFeaturesNv* = VkStructureType 1000203000
  vkStructureTypePhysicalDeviceShaderImageFootprintFeaturesNv* = VkStructureType 1000204000
  vkStructureTypePipelineViewportExclusiveScissorStateCreateInfoNv* = VkStructureType 1000205000
  vkStructureTypePhysicalDeviceExclusiveScissorFeaturesNv* = VkStructureType 1000205002
  vkStructureTypeCheckpointDataNv* = VkStructureType 1000206000
  vkStructureTypeQueueFamilyCheckpointPropertiesNv* = VkStructureType 1000206001
  vkStructureTypePhysicalDeviceTimelineSemaphoreFeatures* = VkStructureType 1000207000
  vkStructureTypePhysicalDeviceTimelineSemaphoreProperties* = VkStructureType 1000207001
  vkStructureTypeSemaphoreTypeCreateInfo* = VkStructureType 1000207002
  vkStructureTypeTimelineSemaphoreSubmitInfo* = VkStructureType 1000207003
  vkStructureTypeSemaphoreWaitInfo* = VkStructureType 1000207004
  vkStructureTypeSemaphoreSignalInfo* = VkStructureType 1000207005
  vkStructureTypePhysicalDeviceShaderIntegerFunctions2FeaturesIntel* = VkStructureType 1000209000
  vkStructureTypeQueryPoolPerformanceQueryCreateInfoIntel* = VkStructureType 1000210000
  vkStructureTypeInitializePerformanceApiInfoIntel* = VkStructureType 1000210001
  vkStructureTypePerformanceMarkerInfoIntel* = VkStructureType 1000210002
  vkStructureTypePerformanceStreamMarkerInfoIntel* = VkStructureType 1000210003
  vkStructureTypePerformanceOverrideInfoIntel* = VkStructureType 1000210004
  vkStructureTypePerformanceConfigurationAcquireInfoIntel* = VkStructureType 1000210005
  vkStructureTypePhysicalDeviceVulkanMemoryModelFeatures* = VkStructureType 1000211000
  vkStructureTypePhysicalDevicePciBusInfoPropertiesExt* = VkStructureType 1000212000
  vkStructureTypeDisplayNativeHdrSurfaceCapabilitiesAmd* = VkStructureType 1000213000
  vkStructureTypeSwapchainDisplayNativeHdrCreateInfoAmd* = VkStructureType 1000213001
  vkStructureTypeImagepipeSurfaceCreateInfoFuchsia* = VkStructureType 1000214000
  vkStructureTypePhysicalDeviceShaderTerminateInvocationFeaturesKhr* = VkStructureType 1000215000
  vkStructureTypeMetalSurfaceCreateInfoExt* = VkStructureType 1000217000
  vkStructureTypePhysicalDeviceFragmentDensityMapFeaturesExt* = VkStructureType 1000218000
  vkStructureTypePhysicalDeviceFragmentDensityMapPropertiesExt* = VkStructureType 1000218001
  vkStructureTypeRenderPassFragmentDensityMapCreateInfoExt* = VkStructureType 1000218002
  vkStructureTypePhysicalDeviceScalarBlockLayoutFeatures* = VkStructureType 1000221000
  vkStructureTypePhysicalDeviceSubgroupSizeControlPropertiesExt* = VkStructureType 1000225000
  vkStructureTypePipelineShaderStageRequiredSubgroupSizeCreateInfoExt* = VkStructureType 1000225001
  vkStructureTypePhysicalDeviceSubgroupSizeControlFeaturesExt* = VkStructureType 1000225002
  vkStructureTypeFragmentShadingRateAttachmentInfoKhr* = VkStructureType 1000226000
  vkStructureTypePipelineFragmentShadingRateStateCreateInfoKhr* = VkStructureType 1000226001
  vkStructureTypePhysicalDeviceFragmentShadingRatePropertiesKhr* = VkStructureType 1000226002
  vkStructureTypePhysicalDeviceFragmentShadingRateFeaturesKhr* = VkStructureType 1000226003
  vkStructureTypePhysicalDeviceFragmentShadingRateKhr* = VkStructureType 1000226004
  vkStructureTypePhysicalDeviceShaderCoreProperties2Amd* = VkStructureType 1000227000
  vkStructureTypePhysicalDeviceCoherentMemoryFeaturesAmd* = VkStructureType 1000229000
  vkStructureTypePhysicalDeviceShaderImageAtomicInt64FeaturesExt* = VkStructureType 1000234000
  vkStructureTypePhysicalDeviceMemoryBudgetPropertiesExt* = VkStructureType 1000237000
  vkStructureTypePhysicalDeviceMemoryPriorityFeaturesExt* = VkStructureType 1000238000
  vkStructureTypeMemoryPriorityAllocateInfoExt* = VkStructureType 1000238001
  vkStructureTypeSurfaceProtectedCapabilitiesKhr* = VkStructureType 1000239000
  vkStructureTypePhysicalDeviceDedicatedAllocationImageAliasingFeaturesNv* = VkStructureType 1000240000
  vkStructureTypePhysicalDeviceSeparateDepthStencilLayoutsFeatures* = VkStructureType 1000241000
  vkStructureTypeAttachmentReferenceStencilLayout* = VkStructureType 1000241001
  vkStructureTypeAttachmentDescriptionStencilLayout* = VkStructureType 1000241002
  vkStructureTypePhysicalDeviceBufferDeviceAddressFeaturesExt* = VkStructureType 1000244000
  vkStructureTypeBufferDeviceAddressInfo* = VkStructureType 1000244001
  vkStructureTypeBufferDeviceAddressCreateInfoExt* = VkStructureType 1000244002
  vkStructureTypePhysicalDeviceToolPropertiesExt* = VkStructureType 1000245000
  vkStructureTypeImageStencilUsageCreateInfo* = VkStructureType 1000246000
  vkStructureTypeValidationFeaturesExt* = VkStructureType 1000247000
  vkStructureTypePhysicalDeviceCooperativeMatrixFeaturesNv* = VkStructureType 1000249000
  vkStructureTypeCooperativeMatrixPropertiesNv* = VkStructureType 1000249001
  vkStructureTypePhysicalDeviceCooperativeMatrixPropertiesNv* = VkStructureType 1000249002
  vkStructureTypePhysicalDeviceCoverageReductionModeFeaturesNv* = VkStructureType 1000250000
  vkStructureTypePipelineCoverageReductionStateCreateInfoNv* = VkStructureType 1000250001
  vkStructureTypeFramebufferMixedSamplesCombinationNv* = VkStructureType 1000250002
  vkStructureTypePhysicalDeviceFragmentShaderInterlockFeaturesExt* = VkStructureType 1000251000
  vkStructureTypePhysicalDeviceYcbcrImageArraysFeaturesExt* = VkStructureType 1000252000
  vkStructureTypePhysicalDeviceUniformBufferStandardLayoutFeatures* = VkStructureType 1000253000
  vkStructureTypeSurfaceFullScreenExclusiveInfoExt* = VkStructureType 1000255000
  vkStructureTypeSurfaceFullScreenExclusiveWin32InfoExt* = VkStructureType 1000255001
  vkStructureTypeSurfaceCapabilitiesFullScreenExclusiveExt* = VkStructureType 1000255002
  vkStructureTypeHeadlessSurfaceCreateInfoExt* = VkStructureType 1000256000
  vkStructureTypePhysicalDeviceBufferDeviceAddressFeatures* = VkStructureType 1000257000
  vkStructureTypeBufferOpaqueCaptureAddressCreateInfo* = VkStructureType 1000257002
  vkStructureTypeMemoryOpaqueCaptureAddressAllocateInfo* = VkStructureType 1000257003
  vkStructureTypeDeviceMemoryOpaqueCaptureAddressInfo* = VkStructureType 1000257004
  vkStructureTypePhysicalDeviceLineRasterizationFeaturesExt* = VkStructureType 1000259000
  vkStructureTypePipelineRasterizationLineStateCreateInfoExt* = VkStructureType 1000259001
  vkStructureTypePhysicalDeviceLineRasterizationPropertiesExt* = VkStructureType 1000259002
  vkStructureTypePhysicalDeviceShaderAtomicFloatFeaturesExt* = VkStructureType 1000260000
  vkStructureTypePhysicalDeviceHostQueryResetFeatures* = VkStructureType 1000261000
  vkStructureTypePhysicalDeviceIndexTypeUint8FeaturesExt* = VkStructureType 1000265000
  vkStructureTypePhysicalDeviceExtendedDynamicStateFeaturesExt* = VkStructureType 1000267000
  vkStructureTypePhysicalDevicePipelineExecutablePropertiesFeaturesKhr* = VkStructureType 1000269000
  vkStructureTypePipelineInfoKhr* = VkStructureType 1000269001
  vkStructureTypePipelineExecutablePropertiesKhr* = VkStructureType 1000269002
  vkStructureTypePipelineExecutableInfoKhr* = VkStructureType 1000269003
  vkStructureTypePipelineExecutableStatisticKhr* = VkStructureType 1000269004
  vkStructureTypePipelineExecutableInternalRepresentationKhr* = VkStructureType 1000269005
  vkStructureTypePhysicalDeviceShaderDemoteToHelperInvocationFeaturesExt* = VkStructureType 1000276000
  vkStructureTypePhysicalDeviceDeviceGeneratedCommandsPropertiesNv* = VkStructureType 1000277000
  vkStructureTypeGraphicsShaderGroupCreateInfoNv* = VkStructureType 1000277001
  vkStructureTypeGraphicsPipelineShaderGroupsCreateInfoNv* = VkStructureType 1000277002
  vkStructureTypeIndirectCommandsLayoutTokenNv* = VkStructureType 1000277003
  vkStructureTypeIndirectCommandsLayoutCreateInfoNv* = VkStructureType 1000277004
  vkStructureTypeGeneratedCommandsInfoNv* = VkStructureType 1000277005
  vkStructureTypeGeneratedCommandsMemoryRequirementsInfoNv* = VkStructureType 1000277006
  vkStructureTypePhysicalDeviceDeviceGeneratedCommandsFeaturesNv* = VkStructureType 1000277007
  vkStructureTypePhysicalDeviceTexelBufferAlignmentFeaturesExt* = VkStructureType 1000281000
  vkStructureTypePhysicalDeviceTexelBufferAlignmentPropertiesExt* = VkStructureType 1000281001
  vkStructureTypeCommandBufferInheritanceRenderPassTransformInfoQcom* = VkStructureType 1000282000
  vkStructureTypeRenderPassTransformBeginInfoQcom* = VkStructureType 1000282001
  vkStructureTypePhysicalDeviceDeviceMemoryReportFeaturesExt* = VkStructureType 1000284000
  vkStructureTypeDeviceDeviceMemoryReportCreateInfoExt* = VkStructureType 1000284001
  vkStructureTypeDeviceMemoryReportCallbackDataExt* = VkStructureType 1000284002
  vkStructureTypePhysicalDeviceRobustness2FeaturesExt* = VkStructureType 1000286000
  vkStructureTypePhysicalDeviceRobustness2PropertiesExt* = VkStructureType 1000286001
  vkStructureTypeSamplerCustomBorderColorCreateInfoExt* = VkStructureType 1000287000
  vkStructureTypePhysicalDeviceCustomBorderColorPropertiesExt* = VkStructureType 1000287001
  vkStructureTypePhysicalDeviceCustomBorderColorFeaturesExt* = VkStructureType 1000287002
  vkStructureTypePipelineLibraryCreateInfoKhr* = VkStructureType 1000290000
  vkStructureTypePhysicalDevicePrivateDataFeaturesExt* = VkStructureType 1000295000
  vkStructureTypeDevicePrivateDataCreateInfoExt* = VkStructureType 1000295001
  vkStructureTypePrivateDataSlotCreateInfoExt* = VkStructureType 1000295002
  vkStructureTypePhysicalDevicePipelineCreationCacheControlFeaturesExt* = VkStructureType 1000297000
  vkStructureTypePhysicalDeviceDiagnosticsConfigFeaturesNv* = VkStructureType 1000300000
  vkStructureTypeDeviceDiagnosticsConfigCreateInfoNv* = VkStructureType 1000300001
  vkStructureTypeReservedQcom* = VkStructureType 1000309000
  vkStructureTypeMemoryBarrier2Khr* = VkStructureType 1000314000
  vkStructureTypeBufferMemoryBarrier2Khr* = VkStructureType 1000314001
  vkStructureTypeImageMemoryBarrier2Khr* = VkStructureType 1000314002
  vkStructureTypeDependencyInfoKhr* = VkStructureType 1000314003
  vkStructureTypeSubmitInfo2Khr* = VkStructureType 1000314004
  vkStructureTypeSemaphoreSubmitInfoKhr* = VkStructureType 1000314005
  vkStructureTypeCommandBufferSubmitInfoKhr* = VkStructureType 1000314006
  vkStructureTypePhysicalDeviceSynchronization2FeaturesKhr* = VkStructureType 1000314007
  vkStructureTypeQueueFamilyCheckpointProperties2Nv* = VkStructureType 1000314008
  vkStructureTypeCheckpointData2Nv* = VkStructureType 1000314009
  vkStructureTypePhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKhr* = VkStructureType 1000325000
  vkStructureTypePhysicalDeviceFragmentShadingRateEnumsPropertiesNv* = VkStructureType 1000326000
  vkStructureTypePhysicalDeviceFragmentShadingRateEnumsFeaturesNv* = VkStructureType 1000326001
  vkStructureTypePipelineFragmentShadingRateEnumStateCreateInfoNv* = VkStructureType 1000326002
  vkStructureTypePhysicalDeviceFragmentDensityMap2FeaturesExt* = VkStructureType 1000332000
  vkStructureTypePhysicalDeviceFragmentDensityMap2PropertiesExt* = VkStructureType 1000332001
  vkStructureTypeCopyCommandTransformInfoQcom* = VkStructureType 1000333000
  vkStructureTypePhysicalDeviceImageRobustnessFeaturesExt* = VkStructureType 1000335000
  vkStructureTypePhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKhr* = VkStructureType 1000336000
  vkStructureTypeCopyBufferInfo2Khr* = VkStructureType 1000337000
  vkStructureTypeCopyImageInfo2Khr* = VkStructureType 1000337001
  vkStructureTypeCopyBufferToImageInfo2Khr* = VkStructureType 1000337002
  vkStructureTypeCopyImageToBufferInfo2Khr* = VkStructureType 1000337003
  vkStructureTypeBlitImageInfo2Khr* = VkStructureType 1000337004
  vkStructureTypeResolveImageInfo2Khr* = VkStructureType 1000337005
  vkStructureTypeBufferCopy2Khr* = VkStructureType 1000337006
  vkStructureTypeImageCopy2Khr* = VkStructureType 1000337007
  vkStructureTypeImageBlit2Khr* = VkStructureType 1000337008
  vkStructureTypeBufferImageCopy2Khr* = VkStructureType 1000337009
  vkStructureTypeImageResolve2Khr* = VkStructureType 1000337010
  vkStructureTypePhysicalDevice4444FormatsFeaturesExt* = VkStructureType 1000340000
  vkStructureTypeDirectfbSurfaceCreateInfoExt* = VkStructureType 1000346000
  vkStructureTypePhysicalDeviceRayTracingPipelineFeaturesKhr* = VkStructureType 1000347000
  vkStructureTypePhysicalDeviceRayTracingPipelinePropertiesKhr* = VkStructureType 1000347001
  vkStructureTypeRayTracingPipelineCreateInfoKhr* = VkStructureType 1000347015
  vkStructureTypeRayTracingShaderGroupCreateInfoKhr* = VkStructureType 1000347016
  vkStructureTypeRayTracingPipelineInterfaceCreateInfoKhr* = VkStructureType 1000347018
  vkStructureTypePhysicalDeviceRayQueryFeaturesKhr* = VkStructureType 1000348013
  vkStructureTypePhysicalDeviceMutableDescriptorTypeFeaturesValve* = VkStructureType 1000351000
  vkStructureTypeMutableDescriptorTypeCreateInfoValve* = VkStructureType 1000351002
  vkStructureTypeScreenSurfaceCreateInfoQnx* = VkStructureType 1000378000
type VkSubpassContents* = distinct cint
proc `==`*(x, y: VkSubpassContents): bool {.borrow.}
proc `-`*(x: VkSubpassContents): VkSubpassContents {.borrow.}
proc `-`*(x, y: VkSubpassContents): VkSubpassContents {.borrow.}
proc `+`*(x, y: VkSubpassContents): VkSubpassContents {.borrow.}
proc `+`*(x: VkSubpassContents, y: int): VkSubpassContents {.used.} = x + VkSubpassContents(y)

const
  vkSubpassContentsInline* = VkSubpassContents 0
  vkSubpassContentsSecondaryCommandBuffers* = VkSubpassContents 1
type VkResult* = distinct cint
proc `==`*(x, y: VkResult): bool {.borrow.}
proc `-`*(x: VkResult): VkResult {.borrow.}
proc `-`*(x, y: VkResult): VkResult {.borrow.}
proc `+`*(x, y: VkResult): VkResult {.borrow.}
proc `+`*(x: VkResult, y: int): VkResult {.used.} = x + VkResult(y)

const
  vkErrorInvalidOpaqueCaptureAddress* = VkResult -1000257000
  vkErrorFullScreenExclusiveModeLostExt* = VkResult -1000255000
  vkErrorNotPermittedExt* = VkResult -1000174001
  vkErrorFragmentation* = VkResult -1000161000
  vkErrorInvalidDrmFormatModifierPlaneLayoutExt* = VkResult -1000158000
  vkErrorInvalidExternalHandle* = VkResult -1000072003
  vkErrorOutOfPoolMemory* = VkResult -1000069000
  vkErrorInvalidShaderNv* = VkResult -1000012000
  vkErrorValidationFailedExt* = VkResult -1000011001
  vkErrorIncompatibleDisplayKhr* = VkResult -1000003001
  vkErrorOutOfDateKhr* = VkResult -1000001004
  vkErrorNativeWindowInUseKhr* = VkResult -1000000001
  vkErrorSurfaceLostKhr* = VkResult -1000000000
  vkErrorUnknown* = VkResult -13
  vkErrorFragmentedPool* = VkResult -12
  vkErrorFormatNotSupported* = VkResult -11
  vkErrorTooManyObjects* = VkResult -10
  vkErrorIncompatibleDriver* = VkResult -9
  vkErrorFeatureNotPresent* = VkResult -8
  vkErrorExtensionNotPresent* = VkResult -7
  vkErrorLayerNotPresent* = VkResult -6
  vkErrorMemoryMapFailed* = VkResult -5
  vkErrorDeviceLost* = VkResult -4
  vkErrorInitializationFailed* = VkResult -3
  vkErrorOutOfDeviceMemory* = VkResult -2
  vkErrorOutOfHostMemory* = VkResult -1
  vkSuccess* = VkResult 0
  vkNotReady* = VkResult 1
  vkTimeout* = VkResult 2
  vkEventSet* = VkResult 3
  vkEventReset* = VkResult 4
  vkIncomplete* = VkResult 5
  vkSuboptimalKhr* = VkResult 1000001003
  vkThreadIdleKhr* = VkResult 1000268000
  vkThreadDoneKhr* = VkResult 1000268001
  vkOperationDeferredKhr* = VkResult 1000268002
  vkOperationNotDeferredKhr* = VkResult 1000268003
  vkPipelineCompileRequiredExt* = VkResult 1000297000
type VkDynamicState* = distinct cint
proc `==`*(x, y: VkDynamicState): bool {.borrow.}
proc `-`*(x: VkDynamicState): VkDynamicState {.borrow.}
proc `-`*(x, y: VkDynamicState): VkDynamicState {.borrow.}
proc `+`*(x, y: VkDynamicState): VkDynamicState {.borrow.}
proc `+`*(x: VkDynamicState, y: int): VkDynamicState {.used.} = x + VkDynamicState(y)

const
  vkDynamicStateViewport* = VkDynamicState 0
  vkDynamicStateScissor* = VkDynamicState 1
  vkDynamicStateLineWidth* = VkDynamicState 2
  vkDynamicStateDepthBias* = VkDynamicState 3
  vkDynamicStateBlendConstants* = VkDynamicState 4
  vkDynamicStateDepthBounds* = VkDynamicState 5
  vkDynamicStateStencilCompareMask* = VkDynamicState 6
  vkDynamicStateStencilWriteMask* = VkDynamicState 7
  vkDynamicStateStencilReference* = VkDynamicState 8
  vkDynamicStateViewportWScalingNv* = VkDynamicState 1000087000
  vkDynamicStateDiscardRectangleExt* = VkDynamicState 1000099000
  vkDynamicStateSampleLocationsExt* = VkDynamicState 1000143000
  vkDynamicStateViewportShadingRatePaletteNv* = VkDynamicState 1000164004
  vkDynamicStateViewportCoarseSampleOrderNv* = VkDynamicState 1000164006
  vkDynamicStateExclusiveScissorNv* = VkDynamicState 1000205001
  vkDynamicStateFragmentShadingRateKhr* = VkDynamicState 1000226000
  vkDynamicStateLineStippleExt* = VkDynamicState 1000259000
  vkDynamicStateCullModeExt* = VkDynamicState 1000267000
  vkDynamicStateFrontFaceExt* = VkDynamicState 1000267001
  vkDynamicStatePrimitiveTopologyExt* = VkDynamicState 1000267002
  vkDynamicStateViewportWithCountExt* = VkDynamicState 1000267003
  vkDynamicStateScissorWithCountExt* = VkDynamicState 1000267004
  vkDynamicStateVertexInputBindingStrideExt* = VkDynamicState 1000267005
  vkDynamicStateDepthTestEnableExt* = VkDynamicState 1000267006
  vkDynamicStateDepthWriteEnableExt* = VkDynamicState 1000267007
  vkDynamicStateDepthCompareOpExt* = VkDynamicState 1000267008
  vkDynamicStateDepthBoundsTestEnableExt* = VkDynamicState 1000267009
  vkDynamicStateStencilTestEnableExt* = VkDynamicState 1000267010
  vkDynamicStateStencilOpExt* = VkDynamicState 1000267011
  vkDynamicStateRayTracingPipelineStackSizeKhr* = VkDynamicState 1000347000
type VkDescriptorUpdateTemplateType* = distinct cint
proc `==`*(x, y: VkDescriptorUpdateTemplateType): bool {.borrow.}
proc `-`*(x: VkDescriptorUpdateTemplateType): VkDescriptorUpdateTemplateType {.borrow.}
proc `-`*(x, y: VkDescriptorUpdateTemplateType): VkDescriptorUpdateTemplateType {.borrow.}
proc `+`*(x, y: VkDescriptorUpdateTemplateType): VkDescriptorUpdateTemplateType {.borrow.}
proc `+`*(x: VkDescriptorUpdateTemplateType, y: int): VkDescriptorUpdateTemplateType {.used.} = x + VkDescriptorUpdateTemplateType(y)

const
  vkDescriptorUpdateTemplateTypeDescriptorSet* = VkDescriptorUpdateTemplateType 0
  vkDescriptorUpdateTemplateTypePushDescriptorsKhr* = VkDescriptorUpdateTemplateType 1
type VkObjectType* = distinct cint
proc `==`*(x, y: VkObjectType): bool {.borrow.}
proc `-`*(x: VkObjectType): VkObjectType {.borrow.}
proc `-`*(x, y: VkObjectType): VkObjectType {.borrow.}
proc `+`*(x, y: VkObjectType): VkObjectType {.borrow.}
proc `+`*(x: VkObjectType, y: int): VkObjectType {.used.} = x + VkObjectType(y)

const
  vkObjectTypeUnknown* = VkObjectType 0
  vkObjectTypeInstance* = VkObjectType 1
  vkObjectTypePhysicalDevice* = VkObjectType 2
  vkObjectTypeDevice* = VkObjectType 3
  vkObjectTypeQueue* = VkObjectType 4
  vkObjectTypeSemaphore* = VkObjectType 5
  vkObjectTypeCommandBuffer* = VkObjectType 6
  vkObjectTypeFence* = VkObjectType 7
  vkObjectTypeDeviceMemory* = VkObjectType 8
  vkObjectTypeBuffer* = VkObjectType 9
  vkObjectTypeImage* = VkObjectType 10
  vkObjectTypeEvent* = VkObjectType 11
  vkObjectTypeQueryPool* = VkObjectType 12
  vkObjectTypeBufferView* = VkObjectType 13
  vkObjectTypeImageView* = VkObjectType 14
  vkObjectTypeShaderModule* = VkObjectType 15
  vkObjectTypePipelineCache* = VkObjectType 16
  vkObjectTypePipelineLayout* = VkObjectType 17
  vkObjectTypeRenderPass* = VkObjectType 18
  vkObjectTypePipeline* = VkObjectType 19
  vkObjectTypeDescriptorSetLayout* = VkObjectType 20
  vkObjectTypeSampler* = VkObjectType 21
  vkObjectTypeDescriptorPool* = VkObjectType 22
  vkObjectTypeDescriptorSet* = VkObjectType 23
  vkObjectTypeFramebuffer* = VkObjectType 24
  vkObjectTypeCommandPool* = VkObjectType 25
  vkObjectTypeSurfaceKhr* = VkObjectType 1000000000
  vkObjectTypeSwapchainKhr* = VkObjectType 1000001000
  vkObjectTypeDisplayKhr* = VkObjectType 1000002000
  vkObjectTypeDisplayModeKhr* = VkObjectType 1000002001
  vkObjectTypeDebugReportCallbackExt* = VkObjectType 1000011000
  vkObjectTypeDescriptorUpdateTemplate* = VkObjectType 1000085000
  vkObjectTypeDebugUtilsMessengerExt* = VkObjectType 1000128000
  vkObjectTypeAccelerationStructureKhr* = VkObjectType 1000150000
  vkObjectTypeSamplerYcbcrConversion* = VkObjectType 1000156000
  vkObjectTypeValidationCacheExt* = VkObjectType 1000160000
  vkObjectTypeAccelerationStructureNv* = VkObjectType 1000165000
  vkObjectTypePerformanceConfigurationIntel* = VkObjectType 1000210000
  vkObjectTypeDeferredOperationKhr* = VkObjectType 1000268000
  vkObjectTypeIndirectCommandsLayoutNv* = VkObjectType 1000277000
  vkObjectTypePrivateDataSlotExt* = VkObjectType 1000295000
type VkQueueFlagBits* = distinct cint
proc `==`*(x, y: VkQueueFlagBits): bool {.borrow.}
proc `-`*(x: VkQueueFlagBits): VkQueueFlagBits {.borrow.}
proc `-`*(x, y: VkQueueFlagBits): VkQueueFlagBits {.borrow.}
proc `+`*(x, y: VkQueueFlagBits): VkQueueFlagBits {.borrow.}
proc `+`*(x: VkQueueFlagBits, y: int): VkQueueFlagBits {.used.} = x + VkQueueFlagBits(y)

const
  vkQueueGraphicsBit* = VkQueueFlagBits 1
  vkQueueComputeBit* = VkQueueFlagBits 2
  vkQueueTransferBit* = VkQueueFlagBits 4
  vkQueueSparseBindingBit* = VkQueueFlagBits 8
  vkQueueProtectedBit* = VkQueueFlagBits 16
  vkQueueReserved5BitKhr* = VkQueueFlagBits 32
  vkQueueReserved6BitKhr* = VkQueueFlagBits 64
type VkCullModeFlagBits* = distinct cint
proc `==`*(x, y: VkCullModeFlagBits): bool {.borrow.}
proc `-`*(x: VkCullModeFlagBits): VkCullModeFlagBits {.borrow.}
proc `-`*(x, y: VkCullModeFlagBits): VkCullModeFlagBits {.borrow.}
proc `+`*(x, y: VkCullModeFlagBits): VkCullModeFlagBits {.borrow.}
proc `+`*(x: VkCullModeFlagBits, y: int): VkCullModeFlagBits {.used.} = x + VkCullModeFlagBits(y)

const
  vkCullModeNone* = VkCullModeFlagBits 0
  vkCullModeFrontBit* = VkCullModeFlagBits 1
  vkCullModeBackBit* = VkCullModeFlagBits 2
  vkCullModeFrontAndBack* = VkCullModeFlagBits 3
type VkRenderPassCreateFlagBits* = distinct cint
proc `==`*(x, y: VkRenderPassCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkRenderPassCreateFlagBits): VkRenderPassCreateFlagBits {.borrow.}
proc `-`*(x, y: VkRenderPassCreateFlagBits): VkRenderPassCreateFlagBits {.borrow.}
proc `+`*(x, y: VkRenderPassCreateFlagBits): VkRenderPassCreateFlagBits {.borrow.}
proc `+`*(x: VkRenderPassCreateFlagBits, y: int): VkRenderPassCreateFlagBits {.used.} = x + VkRenderPassCreateFlagBits(y)

const
  vkRenderPassCreateReserved0BitKhr* = VkRenderPassCreateFlagBits 1
  vkRenderPassCreateTransformBitQcom* = VkRenderPassCreateFlagBits 2
type VkDeviceQueueCreateFlagBits* = distinct cint
proc `==`*(x, y: VkDeviceQueueCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkDeviceQueueCreateFlagBits): VkDeviceQueueCreateFlagBits {.borrow.}
proc `-`*(x, y: VkDeviceQueueCreateFlagBits): VkDeviceQueueCreateFlagBits {.borrow.}
proc `+`*(x, y: VkDeviceQueueCreateFlagBits): VkDeviceQueueCreateFlagBits {.borrow.}
proc `+`*(x: VkDeviceQueueCreateFlagBits, y: int): VkDeviceQueueCreateFlagBits {.used.} = x + VkDeviceQueueCreateFlagBits(y)

const
  vkDeviceQueueCreateProtectedBit* = VkDeviceQueueCreateFlagBits 1
type VkMemoryPropertyFlagBits* = distinct cint
proc `==`*(x, y: VkMemoryPropertyFlagBits): bool {.borrow.}
proc `-`*(x: VkMemoryPropertyFlagBits): VkMemoryPropertyFlagBits {.borrow.}
proc `-`*(x, y: VkMemoryPropertyFlagBits): VkMemoryPropertyFlagBits {.borrow.}
proc `+`*(x, y: VkMemoryPropertyFlagBits): VkMemoryPropertyFlagBits {.borrow.}
proc `+`*(x: VkMemoryPropertyFlagBits, y: int): VkMemoryPropertyFlagBits {.used.} = x + VkMemoryPropertyFlagBits(y)

const
  vkMemoryPropertyDeviceLocalBit* = VkMemoryPropertyFlagBits 1
  vkMemoryPropertyHostVisibleBit* = VkMemoryPropertyFlagBits 2
  vkMemoryPropertyHostCoherentBit* = VkMemoryPropertyFlagBits 4
  vkMemoryPropertyHostCachedBit* = VkMemoryPropertyFlagBits 8
  vkMemoryPropertyLazilyAllocatedBit* = VkMemoryPropertyFlagBits 16
  vkMemoryPropertyProtectedBit* = VkMemoryPropertyFlagBits 32
  vkMemoryPropertyDeviceCoherentBitAmd* = VkMemoryPropertyFlagBits 64
  vkMemoryPropertyDeviceUncachedBitAmd* = VkMemoryPropertyFlagBits 128
type VkMemoryHeapFlagBits* = distinct cint
proc `==`*(x, y: VkMemoryHeapFlagBits): bool {.borrow.}
proc `-`*(x: VkMemoryHeapFlagBits): VkMemoryHeapFlagBits {.borrow.}
proc `-`*(x, y: VkMemoryHeapFlagBits): VkMemoryHeapFlagBits {.borrow.}
proc `+`*(x, y: VkMemoryHeapFlagBits): VkMemoryHeapFlagBits {.borrow.}
proc `+`*(x: VkMemoryHeapFlagBits, y: int): VkMemoryHeapFlagBits {.used.} = x + VkMemoryHeapFlagBits(y)

const
  vkMemoryHeapDeviceLocalBit* = VkMemoryHeapFlagBits 1
  vkMemoryHeapMultiInstanceBit* = VkMemoryHeapFlagBits 2
  vkMemoryHeapReserved2BitKhr* = VkMemoryHeapFlagBits 4
type VkAccessFlagBits* = distinct cint
proc `==`*(x, y: VkAccessFlagBits): bool {.borrow.}
proc `-`*(x: VkAccessFlagBits): VkAccessFlagBits {.borrow.}
proc `-`*(x, y: VkAccessFlagBits): VkAccessFlagBits {.borrow.}
proc `+`*(x, y: VkAccessFlagBits): VkAccessFlagBits {.borrow.}
proc `+`*(x: VkAccessFlagBits, y: int): VkAccessFlagBits {.used.} = x + VkAccessFlagBits(y)

const
  vkAccessNoneKhr* = VkAccessFlagBits 0
  vkAccessIndirectCommandReadBit* = VkAccessFlagBits 1
  vkAccessIndexReadBit* = VkAccessFlagBits 2
  vkAccessVertexAttributeReadBit* = VkAccessFlagBits 4
  vkAccessUniformReadBit* = VkAccessFlagBits 8
  vkAccessInputAttachmentReadBit* = VkAccessFlagBits 16
  vkAccessShaderReadBit* = VkAccessFlagBits 32
  vkAccessShaderWriteBit* = VkAccessFlagBits 64
  vkAccessColorAttachmentReadBit* = VkAccessFlagBits 128
  vkAccessColorAttachmentWriteBit* = VkAccessFlagBits 256
  vkAccessDepthStencilAttachmentReadBit* = VkAccessFlagBits 512
  vkAccessDepthStencilAttachmentWriteBit* = VkAccessFlagBits 1024
  vkAccessTransferReadBit* = VkAccessFlagBits 2048
  vkAccessTransferWriteBit* = VkAccessFlagBits 4096
  vkAccessHostReadBit* = VkAccessFlagBits 8192
  vkAccessHostWriteBit* = VkAccessFlagBits 16384
  vkAccessMemoryReadBit* = VkAccessFlagBits 32768
  vkAccessMemoryWriteBit* = VkAccessFlagBits 65536
  vkAccessCommandPreprocessReadBitNv* = VkAccessFlagBits 131072
  vkAccessCommandPreprocessWriteBitNv* = VkAccessFlagBits 262144
  vkAccessColorAttachmentReadNoncoherentBitExt* = VkAccessFlagBits 524288
  vkAccessConditionalRenderingReadBitExt* = VkAccessFlagBits 1048576
  vkAccessAccelerationStructureReadBitKhr* = VkAccessFlagBits 2097152
  vkAccessAccelerationStructureWriteBitKhr* = VkAccessFlagBits 4194304
  vkAccessShadingRateImageReadBitNv* = VkAccessFlagBits 8388608
  vkAccessFragmentDensityMapReadBitExt* = VkAccessFlagBits 16777216
  vkAccessTransformFeedbackWriteBitExt* = VkAccessFlagBits 33554432
  vkAccessTransformFeedbackCounterReadBitExt* = VkAccessFlagBits 67108864
  vkAccessTransformFeedbackCounterWriteBitExt* = VkAccessFlagBits 134217728
  vkAccessReserved28BitKhr* = VkAccessFlagBits 268435456
  vkAccessReserved29BitKhr* = VkAccessFlagBits 536870912
  vkAccessReserved30BitKhr* = VkAccessFlagBits 1073741824
type VkBufferUsageFlagBits* = distinct cint
proc `==`*(x, y: VkBufferUsageFlagBits): bool {.borrow.}
proc `-`*(x: VkBufferUsageFlagBits): VkBufferUsageFlagBits {.borrow.}
proc `-`*(x, y: VkBufferUsageFlagBits): VkBufferUsageFlagBits {.borrow.}
proc `+`*(x, y: VkBufferUsageFlagBits): VkBufferUsageFlagBits {.borrow.}
proc `+`*(x: VkBufferUsageFlagBits, y: int): VkBufferUsageFlagBits {.used.} = x + VkBufferUsageFlagBits(y)

const
  vkBufferUsageTransferSrcBit* = VkBufferUsageFlagBits 1
  vkBufferUsageTransferDstBit* = VkBufferUsageFlagBits 2
  vkBufferUsageUniformTexelBufferBit* = VkBufferUsageFlagBits 4
  vkBufferUsageStorageTexelBufferBit* = VkBufferUsageFlagBits 8
  vkBufferUsageUniformBufferBit* = VkBufferUsageFlagBits 16
  vkBufferUsageStorageBufferBit* = VkBufferUsageFlagBits 32
  vkBufferUsageIndexBufferBit* = VkBufferUsageFlagBits 64
  vkBufferUsageVertexBufferBit* = VkBufferUsageFlagBits 128
  vkBufferUsageIndirectBufferBit* = VkBufferUsageFlagBits 256
  vkBufferUsageConditionalRenderingBitExt* = VkBufferUsageFlagBits 512
  vkBufferUsageShaderBindingTableBitKhr* = VkBufferUsageFlagBits 1024
  vkBufferUsageTransformFeedbackBufferBitExt* = VkBufferUsageFlagBits 2048
  vkBufferUsageTransformFeedbackCounterBufferBitExt* = VkBufferUsageFlagBits 4096
  vkBufferUsageReserved13BitKhr* = VkBufferUsageFlagBits 8192
  vkBufferUsageReserved14BitKhr* = VkBufferUsageFlagBits 16384
  vkBufferUsageReserved15BitKhr* = VkBufferUsageFlagBits 32768
  vkBufferUsageReserved16BitKhr* = VkBufferUsageFlagBits 65536
  vkBufferUsageShaderDeviceAddressBit* = VkBufferUsageFlagBits 131072
  vkBufferUsageReserved18BitQcom* = VkBufferUsageFlagBits 262144
  vkBufferUsageAccelerationStructureBuildInputReadOnlyBitKhr* = VkBufferUsageFlagBits 524288
  vkBufferUsageAccelerationStructureStorageBitKhr* = VkBufferUsageFlagBits 1048576
type VkBufferCreateFlagBits* = distinct cint
proc `==`*(x, y: VkBufferCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkBufferCreateFlagBits): VkBufferCreateFlagBits {.borrow.}
proc `-`*(x, y: VkBufferCreateFlagBits): VkBufferCreateFlagBits {.borrow.}
proc `+`*(x, y: VkBufferCreateFlagBits): VkBufferCreateFlagBits {.borrow.}
proc `+`*(x: VkBufferCreateFlagBits, y: int): VkBufferCreateFlagBits {.used.} = x + VkBufferCreateFlagBits(y)

const
  vkBufferCreateSparseBindingBit* = VkBufferCreateFlagBits 1
  vkBufferCreateSparseResidencyBit* = VkBufferCreateFlagBits 2
  vkBufferCreateSparseAliasedBit* = VkBufferCreateFlagBits 4
  vkBufferCreateProtectedBit* = VkBufferCreateFlagBits 8
  vkBufferCreateDeviceAddressCaptureReplayBit* = VkBufferCreateFlagBits 16
  vkBufferCreateReserved5BitNv* = VkBufferCreateFlagBits 32
type VkShaderStageFlagBits* = distinct cint
proc `==`*(x, y: VkShaderStageFlagBits): bool {.borrow.}
proc `-`*(x: VkShaderStageFlagBits): VkShaderStageFlagBits {.borrow.}
proc `-`*(x, y: VkShaderStageFlagBits): VkShaderStageFlagBits {.borrow.}
proc `+`*(x, y: VkShaderStageFlagBits): VkShaderStageFlagBits {.borrow.}
proc `+`*(x: VkShaderStageFlagBits, y: int): VkShaderStageFlagBits {.used.} = x + VkShaderStageFlagBits(y)

const
  vkShaderStageVertexBit* = VkShaderStageFlagBits 1
  vkShaderStageTessellationControlBit* = VkShaderStageFlagBits 2
  vkShaderStageTessellationEvaluationBit* = VkShaderStageFlagBits 4
  vkShaderStageGeometryBit* = VkShaderStageFlagBits 8
  vkShaderStageFragmentBit* = VkShaderStageFlagBits 16
  vkShaderStageAllGraphics* = VkShaderStageFlagBits 31
  vkShaderStageComputeBit* = VkShaderStageFlagBits 32
  vkShaderStageTaskBitNv* = VkShaderStageFlagBits 64
  vkShaderStageMeshBitNv* = VkShaderStageFlagBits 128
  vkShaderStageRaygenBitKhr* = VkShaderStageFlagBits 256
  vkShaderStageAnyHitBitKhr* = VkShaderStageFlagBits 512
  vkShaderStageClosestHitBitKhr* = VkShaderStageFlagBits 1024
  vkShaderStageMissBitKhr* = VkShaderStageFlagBits 2048
  vkShaderStageIntersectionBitKhr* = VkShaderStageFlagBits 4096
  vkShaderStageCallableBitKhr* = VkShaderStageFlagBits 8192
  vkShaderStageAll* = VkShaderStageFlagBits 2147483647
type VkImageUsageFlagBits* = distinct cint
proc `==`*(x, y: VkImageUsageFlagBits): bool {.borrow.}
proc `-`*(x: VkImageUsageFlagBits): VkImageUsageFlagBits {.borrow.}
proc `-`*(x, y: VkImageUsageFlagBits): VkImageUsageFlagBits {.borrow.}
proc `+`*(x, y: VkImageUsageFlagBits): VkImageUsageFlagBits {.borrow.}
proc `+`*(x: VkImageUsageFlagBits, y: int): VkImageUsageFlagBits {.used.} = x + VkImageUsageFlagBits(y)

const
  vkImageUsageTransferSrcBit* = VkImageUsageFlagBits 1
  vkImageUsageTransferDstBit* = VkImageUsageFlagBits 2
  vkImageUsageSampledBit* = VkImageUsageFlagBits 4
  vkImageUsageStorageBit* = VkImageUsageFlagBits 8
  vkImageUsageColorAttachmentBit* = VkImageUsageFlagBits 16
  vkImageUsageDepthStencilAttachmentBit* = VkImageUsageFlagBits 32
  vkImageUsageTransientAttachmentBit* = VkImageUsageFlagBits 64
  vkImageUsageInputAttachmentBit* = VkImageUsageFlagBits 128
  vkImageUsageShadingRateImageBitNv* = VkImageUsageFlagBits 256
  vkImageUsageFragmentDensityMapBitExt* = VkImageUsageFlagBits 512
  vkImageUsageReserved10BitKhr* = VkImageUsageFlagBits 1024
  vkImageUsageReserved11BitKhr* = VkImageUsageFlagBits 2048
  vkImageUsageReserved12BitKhr* = VkImageUsageFlagBits 4096
  vkImageUsageReserved13BitKhr* = VkImageUsageFlagBits 8192
  vkImageUsageReserved14BitKhr* = VkImageUsageFlagBits 16384
  vkImageUsageReserved15BitKhr* = VkImageUsageFlagBits 32768
  vkImageUsageReserved16BitQcom* = VkImageUsageFlagBits 65536
  vkImageUsageReserved17BitQcom* = VkImageUsageFlagBits 131072
type VkImageCreateFlagBits* = distinct cint
proc `==`*(x, y: VkImageCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkImageCreateFlagBits): VkImageCreateFlagBits {.borrow.}
proc `-`*(x, y: VkImageCreateFlagBits): VkImageCreateFlagBits {.borrow.}
proc `+`*(x, y: VkImageCreateFlagBits): VkImageCreateFlagBits {.borrow.}
proc `+`*(x: VkImageCreateFlagBits, y: int): VkImageCreateFlagBits {.used.} = x + VkImageCreateFlagBits(y)

const
  vkImageCreateSparseBindingBit* = VkImageCreateFlagBits 1
  vkImageCreateSparseResidencyBit* = VkImageCreateFlagBits 2
  vkImageCreateSparseAliasedBit* = VkImageCreateFlagBits 4
  vkImageCreateMutableFormatBit* = VkImageCreateFlagBits 8
  vkImageCreateCubeCompatibleBit* = VkImageCreateFlagBits 16
  vkImageCreate2dArrayCompatibleBit* = VkImageCreateFlagBits 32
  vkImageCreateSplitInstanceBindRegionsBit* = VkImageCreateFlagBits 64
  vkImageCreateBlockTexelViewCompatibleBit* = VkImageCreateFlagBits 128
  vkImageCreateExtendedUsageBit* = VkImageCreateFlagBits 256
  vkImageCreateDisjointBit* = VkImageCreateFlagBits 512
  vkImageCreateAliasBit* = VkImageCreateFlagBits 1024
  vkImageCreateProtectedBit* = VkImageCreateFlagBits 2048
  vkImageCreateSampleLocationsCompatibleDepthBitExt* = VkImageCreateFlagBits 4096
  vkImageCreateCornerSampledBitNv* = VkImageCreateFlagBits 8192
  vkImageCreateSubsampledBitExt* = VkImageCreateFlagBits 16384
  vkImageCreateReserved15BitNv* = VkImageCreateFlagBits 32768
type VkImageViewCreateFlagBits* = distinct cint
proc `==`*(x, y: VkImageViewCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkImageViewCreateFlagBits): VkImageViewCreateFlagBits {.borrow.}
proc `-`*(x, y: VkImageViewCreateFlagBits): VkImageViewCreateFlagBits {.borrow.}
proc `+`*(x, y: VkImageViewCreateFlagBits): VkImageViewCreateFlagBits {.borrow.}
proc `+`*(x: VkImageViewCreateFlagBits, y: int): VkImageViewCreateFlagBits {.used.} = x + VkImageViewCreateFlagBits(y)

const
  vkImageViewCreateFragmentDensityMapDynamicBitExt* = VkImageViewCreateFlagBits 1
  vkImageViewCreateFragmentDensityMapDeferredBitExt* = VkImageViewCreateFlagBits 2
type VkSamplerCreateFlagBits* = distinct cint
proc `==`*(x, y: VkSamplerCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkSamplerCreateFlagBits): VkSamplerCreateFlagBits {.borrow.}
proc `-`*(x, y: VkSamplerCreateFlagBits): VkSamplerCreateFlagBits {.borrow.}
proc `+`*(x, y: VkSamplerCreateFlagBits): VkSamplerCreateFlagBits {.borrow.}
proc `+`*(x: VkSamplerCreateFlagBits, y: int): VkSamplerCreateFlagBits {.used.} = x + VkSamplerCreateFlagBits(y)

const
  vkSamplerCreateSubsampledBitExt* = VkSamplerCreateFlagBits 1
  vkSamplerCreateSubsampledCoarseReconstructionBitExt* = VkSamplerCreateFlagBits 2
type VkPipelineCreateFlagBits* = distinct cint
proc `==`*(x, y: VkPipelineCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkPipelineCreateFlagBits): VkPipelineCreateFlagBits {.borrow.}
proc `-`*(x, y: VkPipelineCreateFlagBits): VkPipelineCreateFlagBits {.borrow.}
proc `+`*(x, y: VkPipelineCreateFlagBits): VkPipelineCreateFlagBits {.borrow.}
proc `+`*(x: VkPipelineCreateFlagBits, y: int): VkPipelineCreateFlagBits {.used.} = x + VkPipelineCreateFlagBits(y)

const
  vkPipelineCreateDisableOptimizationBit* = VkPipelineCreateFlagBits 1
  vkPipelineCreateAllowDerivativesBit* = VkPipelineCreateFlagBits 2
  vkPipelineCreateDerivativeBit* = VkPipelineCreateFlagBits 4
  vkPipelineCreateViewIndexFromDeviceIndexBit* = VkPipelineCreateFlagBits 8
  vkPipelineCreateDispatchBaseBit* = VkPipelineCreateFlagBits 16
  vkPipelineCreateDeferCompileBitNv* = VkPipelineCreateFlagBits 32
  vkPipelineCreateCaptureStatisticsBitKhr* = VkPipelineCreateFlagBits 64
  vkPipelineCreateCaptureInternalRepresentationsBitKhr* = VkPipelineCreateFlagBits 128
  vkPipelineCreateFailOnPipelineCompileRequiredBitExt* = VkPipelineCreateFlagBits 256
  vkPipelineCreateEarlyReturnOnFailureBitExt* = VkPipelineCreateFlagBits 512
  vkPipelineCreateLibraryBitKhr* = VkPipelineCreateFlagBits 2048
  vkPipelineCreateRayTracingSkipTrianglesBitKhr* = VkPipelineCreateFlagBits 4096
  vkPipelineCreateRayTracingSkipAabbsBitKhr* = VkPipelineCreateFlagBits 8192
  vkPipelineCreateRayTracingNoNullAnyHitShadersBitKhr* = VkPipelineCreateFlagBits 16384
  vkPipelineCreateRayTracingNoNullClosestHitShadersBitKhr* = VkPipelineCreateFlagBits 32768
  vkPipelineCreateRayTracingNoNullMissShadersBitKhr* = VkPipelineCreateFlagBits 65536
  vkPipelineCreateRayTracingNoNullIntersectionShadersBitKhr* = VkPipelineCreateFlagBits 131072
  vkPipelineCreateIndirectBindableBitNv* = VkPipelineCreateFlagBits 262144
  vkPipelineCreateRayTracingShaderGroupHandleCaptureReplayBitKhr* = VkPipelineCreateFlagBits 524288
  vkPipelineCreateReservedBit20Nv* = VkPipelineCreateFlagBits 1048576
type VkPipelineShaderStageCreateFlagBits* = distinct cint
proc `==`*(x, y: VkPipelineShaderStageCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkPipelineShaderStageCreateFlagBits): VkPipelineShaderStageCreateFlagBits {.borrow.}
proc `-`*(x, y: VkPipelineShaderStageCreateFlagBits): VkPipelineShaderStageCreateFlagBits {.borrow.}
proc `+`*(x, y: VkPipelineShaderStageCreateFlagBits): VkPipelineShaderStageCreateFlagBits {.borrow.}
proc `+`*(x: VkPipelineShaderStageCreateFlagBits, y: int): VkPipelineShaderStageCreateFlagBits {.used.} = x + VkPipelineShaderStageCreateFlagBits(y)

const
  vkPipelineShaderStageCreateAllowVaryingSubgroupSizeBitExt* = VkPipelineShaderStageCreateFlagBits 1
  vkPipelineShaderStageCreateRequireFullSubgroupsBitExt* = VkPipelineShaderStageCreateFlagBits 2
  vkPipelineShaderStageCreateReserved2BitNv* = VkPipelineShaderStageCreateFlagBits 4
  vkPipelineShaderStageCreateReserved3BitKhr* = VkPipelineShaderStageCreateFlagBits 8
type VkColorComponentFlagBits* = distinct cint
proc `==`*(x, y: VkColorComponentFlagBits): bool {.borrow.}
proc `-`*(x: VkColorComponentFlagBits): VkColorComponentFlagBits {.borrow.}
proc `-`*(x, y: VkColorComponentFlagBits): VkColorComponentFlagBits {.borrow.}
proc `+`*(x, y: VkColorComponentFlagBits): VkColorComponentFlagBits {.borrow.}
proc `+`*(x: VkColorComponentFlagBits, y: int): VkColorComponentFlagBits {.used.} = x + VkColorComponentFlagBits(y)

const
  vkColorComponentRBit* = VkColorComponentFlagBits 1
  vkColorComponentGBit* = VkColorComponentFlagBits 2
  vkColorComponentBBit* = VkColorComponentFlagBits 4
  vkColorComponentABit* = VkColorComponentFlagBits 8
type VkFenceCreateFlagBits* = distinct cint
proc `==`*(x, y: VkFenceCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkFenceCreateFlagBits): VkFenceCreateFlagBits {.borrow.}
proc `-`*(x, y: VkFenceCreateFlagBits): VkFenceCreateFlagBits {.borrow.}
proc `+`*(x, y: VkFenceCreateFlagBits): VkFenceCreateFlagBits {.borrow.}
proc `+`*(x: VkFenceCreateFlagBits, y: int): VkFenceCreateFlagBits {.used.} = x + VkFenceCreateFlagBits(y)

const
  vkFenceCreateSignaledBit* = VkFenceCreateFlagBits 1
type VkFormatFeatureFlagBits* = distinct cint
proc `==`*(x, y: VkFormatFeatureFlagBits): bool {.borrow.}
proc `-`*(x: VkFormatFeatureFlagBits): VkFormatFeatureFlagBits {.borrow.}
proc `-`*(x, y: VkFormatFeatureFlagBits): VkFormatFeatureFlagBits {.borrow.}
proc `+`*(x, y: VkFormatFeatureFlagBits): VkFormatFeatureFlagBits {.borrow.}
proc `+`*(x: VkFormatFeatureFlagBits, y: int): VkFormatFeatureFlagBits {.used.} = x + VkFormatFeatureFlagBits(y)

const
  vkFormatFeatureSampledImageBit* = VkFormatFeatureFlagBits 1
  vkFormatFeatureStorageImageBit* = VkFormatFeatureFlagBits 2
  vkFormatFeatureStorageImageAtomicBit* = VkFormatFeatureFlagBits 4
  vkFormatFeatureUniformTexelBufferBit* = VkFormatFeatureFlagBits 8
  vkFormatFeatureStorageTexelBufferBit* = VkFormatFeatureFlagBits 16
  vkFormatFeatureStorageTexelBufferAtomicBit* = VkFormatFeatureFlagBits 32
  vkFormatFeatureVertexBufferBit* = VkFormatFeatureFlagBits 64
  vkFormatFeatureColorAttachmentBit* = VkFormatFeatureFlagBits 128
  vkFormatFeatureColorAttachmentBlendBit* = VkFormatFeatureFlagBits 256
  vkFormatFeatureDepthStencilAttachmentBit* = VkFormatFeatureFlagBits 512
  vkFormatFeatureBlitSrcBit* = VkFormatFeatureFlagBits 1024
  vkFormatFeatureBlitDstBit* = VkFormatFeatureFlagBits 2048
  vkFormatFeatureSampledImageFilterLinearBit* = VkFormatFeatureFlagBits 4096
  vkFormatFeatureSampledImageFilterCubicBitImg* = VkFormatFeatureFlagBits 8192
  vkFormatFeatureTransferSrcBit* = VkFormatFeatureFlagBits 16384
  vkFormatFeatureTransferDstBit* = VkFormatFeatureFlagBits 32768
  vkFormatFeatureSampledImageFilterMinmaxBit* = VkFormatFeatureFlagBits 65536
  vkFormatFeatureMidpointChromaSamplesBit* = VkFormatFeatureFlagBits 131072
  vkFormatFeatureSampledImageYcbcrConversionLinearFilterBit* = VkFormatFeatureFlagBits 262144
  vkFormatFeatureSampledImageYcbcrConversionSeparateReconstructionFilterBit* = VkFormatFeatureFlagBits 524288
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitBit* = VkFormatFeatureFlagBits 1048576
  vkFormatFeatureSampledImageYcbcrConversionChromaReconstructionExplicitForceableBit* = VkFormatFeatureFlagBits 2097152
  vkFormatFeatureDisjointBit* = VkFormatFeatureFlagBits 4194304
  vkFormatFeatureCositedChromaSamplesBit* = VkFormatFeatureFlagBits 8388608
  vkFormatFeatureFragmentDensityMapBitExt* = VkFormatFeatureFlagBits 16777216
  vkFormatFeatureReserved25BitKhr* = VkFormatFeatureFlagBits 33554432
  vkFormatFeatureReserved26BitKhr* = VkFormatFeatureFlagBits 67108864
  vkFormatFeatureReserved27BitKhr* = VkFormatFeatureFlagBits 134217728
  vkFormatFeatureReserved28BitKhr* = VkFormatFeatureFlagBits 268435456
  vkFormatFeatureAccelerationStructureVertexBufferBitKhr* = VkFormatFeatureFlagBits 536870912
  vkFormatFeatureFragmentShadingRateAttachmentBitKhr* = VkFormatFeatureFlagBits 1073741824
type VkQueryControlFlagBits* = distinct cint
proc `==`*(x, y: VkQueryControlFlagBits): bool {.borrow.}
proc `-`*(x: VkQueryControlFlagBits): VkQueryControlFlagBits {.borrow.}
proc `-`*(x, y: VkQueryControlFlagBits): VkQueryControlFlagBits {.borrow.}
proc `+`*(x, y: VkQueryControlFlagBits): VkQueryControlFlagBits {.borrow.}
proc `+`*(x: VkQueryControlFlagBits, y: int): VkQueryControlFlagBits {.used.} = x + VkQueryControlFlagBits(y)

const
  vkQueryControlPreciseBit* = VkQueryControlFlagBits 1
type VkQueryResultFlagBits* = distinct cint
proc `==`*(x, y: VkQueryResultFlagBits): bool {.borrow.}
proc `-`*(x: VkQueryResultFlagBits): VkQueryResultFlagBits {.borrow.}
proc `-`*(x, y: VkQueryResultFlagBits): VkQueryResultFlagBits {.borrow.}
proc `+`*(x, y: VkQueryResultFlagBits): VkQueryResultFlagBits {.borrow.}
proc `+`*(x: VkQueryResultFlagBits, y: int): VkQueryResultFlagBits {.used.} = x + VkQueryResultFlagBits(y)

const
  vkQueryResult64Bit* = VkQueryResultFlagBits 1
  vkQueryResultWaitBit* = VkQueryResultFlagBits 2
  vkQueryResultWithAvailabilityBit* = VkQueryResultFlagBits 4
  vkQueryResultPartialBit* = VkQueryResultFlagBits 8
type VkCommandBufferUsageFlagBits* = distinct cint
proc `==`*(x, y: VkCommandBufferUsageFlagBits): bool {.borrow.}
proc `-`*(x: VkCommandBufferUsageFlagBits): VkCommandBufferUsageFlagBits {.borrow.}
proc `-`*(x, y: VkCommandBufferUsageFlagBits): VkCommandBufferUsageFlagBits {.borrow.}
proc `+`*(x, y: VkCommandBufferUsageFlagBits): VkCommandBufferUsageFlagBits {.borrow.}
proc `+`*(x: VkCommandBufferUsageFlagBits, y: int): VkCommandBufferUsageFlagBits {.used.} = x + VkCommandBufferUsageFlagBits(y)

const
  vkCommandBufferUsageOneTimeSubmitBit* = VkCommandBufferUsageFlagBits 1
  vkCommandBufferUsageRenderPassContinueBit* = VkCommandBufferUsageFlagBits 2
  vkCommandBufferUsageSimultaneousUseBit* = VkCommandBufferUsageFlagBits 4
type VkQueryPipelineStatisticFlagBits* = distinct cint
proc `==`*(x, y: VkQueryPipelineStatisticFlagBits): bool {.borrow.}
proc `-`*(x: VkQueryPipelineStatisticFlagBits): VkQueryPipelineStatisticFlagBits {.borrow.}
proc `-`*(x, y: VkQueryPipelineStatisticFlagBits): VkQueryPipelineStatisticFlagBits {.borrow.}
proc `+`*(x, y: VkQueryPipelineStatisticFlagBits): VkQueryPipelineStatisticFlagBits {.borrow.}
proc `+`*(x: VkQueryPipelineStatisticFlagBits, y: int): VkQueryPipelineStatisticFlagBits {.used.} = x + VkQueryPipelineStatisticFlagBits(y)

const
  vkQueryPipelineStatisticInputAssemblyVerticesBit* = VkQueryPipelineStatisticFlagBits 1
  vkQueryPipelineStatisticInputAssemblyPrimitivesBit* = VkQueryPipelineStatisticFlagBits 2
  vkQueryPipelineStatisticVertexShaderInvocationsBit* = VkQueryPipelineStatisticFlagBits 4
  vkQueryPipelineStatisticGeometryShaderInvocationsBit* = VkQueryPipelineStatisticFlagBits 8
  vkQueryPipelineStatisticGeometryShaderPrimitivesBit* = VkQueryPipelineStatisticFlagBits 16
  vkQueryPipelineStatisticClippingInvocationsBit* = VkQueryPipelineStatisticFlagBits 32
  vkQueryPipelineStatisticClippingPrimitivesBit* = VkQueryPipelineStatisticFlagBits 64
  vkQueryPipelineStatisticFragmentShaderInvocationsBit* = VkQueryPipelineStatisticFlagBits 128
  vkQueryPipelineStatisticTessellationControlShaderPatchesBit* = VkQueryPipelineStatisticFlagBits 256
  vkQueryPipelineStatisticTessellationEvaluationShaderInvocationsBit* = VkQueryPipelineStatisticFlagBits 512
  vkQueryPipelineStatisticComputeShaderInvocationsBit* = VkQueryPipelineStatisticFlagBits 1024
type VkImageAspectFlagBits* = distinct cint
proc `==`*(x, y: VkImageAspectFlagBits): bool {.borrow.}
proc `-`*(x: VkImageAspectFlagBits): VkImageAspectFlagBits {.borrow.}
proc `-`*(x, y: VkImageAspectFlagBits): VkImageAspectFlagBits {.borrow.}
proc `+`*(x, y: VkImageAspectFlagBits): VkImageAspectFlagBits {.borrow.}
proc `+`*(x: VkImageAspectFlagBits, y: int): VkImageAspectFlagBits {.used.} = x + VkImageAspectFlagBits(y)

const
  vkImageAspectColorBit* = VkImageAspectFlagBits 1
  vkImageAspectDepthBit* = VkImageAspectFlagBits 2
  vkImageAspectStencilBit* = VkImageAspectFlagBits 4
  vkImageAspectMetadataBit* = VkImageAspectFlagBits 8
  vkImageAspectPlane0Bit* = VkImageAspectFlagBits 16
  vkImageAspectPlane1Bit* = VkImageAspectFlagBits 32
  vkImageAspectPlane2Bit* = VkImageAspectFlagBits 64
  vkImageAspectMemoryPlane0BitExt* = VkImageAspectFlagBits 128
  vkImageAspectMemoryPlane1BitExt* = VkImageAspectFlagBits 256
  vkImageAspectMemoryPlane2BitExt* = VkImageAspectFlagBits 512
  vkImageAspectMemoryPlane3BitExt* = VkImageAspectFlagBits 1024
type VkSparseImageFormatFlagBits* = distinct cint
proc `==`*(x, y: VkSparseImageFormatFlagBits): bool {.borrow.}
proc `-`*(x: VkSparseImageFormatFlagBits): VkSparseImageFormatFlagBits {.borrow.}
proc `-`*(x, y: VkSparseImageFormatFlagBits): VkSparseImageFormatFlagBits {.borrow.}
proc `+`*(x, y: VkSparseImageFormatFlagBits): VkSparseImageFormatFlagBits {.borrow.}
proc `+`*(x: VkSparseImageFormatFlagBits, y: int): VkSparseImageFormatFlagBits {.used.} = x + VkSparseImageFormatFlagBits(y)

const
  vkSparseImageFormatSingleMiptailBit* = VkSparseImageFormatFlagBits 1
  vkSparseImageFormatAlignedMipSizeBit* = VkSparseImageFormatFlagBits 2
  vkSparseImageFormatNonstandardBlockSizeBit* = VkSparseImageFormatFlagBits 4
type VkSparseMemoryBindFlagBits* = distinct cint
proc `==`*(x, y: VkSparseMemoryBindFlagBits): bool {.borrow.}
proc `-`*(x: VkSparseMemoryBindFlagBits): VkSparseMemoryBindFlagBits {.borrow.}
proc `-`*(x, y: VkSparseMemoryBindFlagBits): VkSparseMemoryBindFlagBits {.borrow.}
proc `+`*(x, y: VkSparseMemoryBindFlagBits): VkSparseMemoryBindFlagBits {.borrow.}
proc `+`*(x: VkSparseMemoryBindFlagBits, y: int): VkSparseMemoryBindFlagBits {.used.} = x + VkSparseMemoryBindFlagBits(y)

const
  vkSparseMemoryBindMetadataBit* = VkSparseMemoryBindFlagBits 1
type VkPipelineStageFlagBits* = distinct cint
proc `==`*(x, y: VkPipelineStageFlagBits): bool {.borrow.}
proc `-`*(x: VkPipelineStageFlagBits): VkPipelineStageFlagBits {.borrow.}
proc `-`*(x, y: VkPipelineStageFlagBits): VkPipelineStageFlagBits {.borrow.}
proc `+`*(x, y: VkPipelineStageFlagBits): VkPipelineStageFlagBits {.borrow.}
proc `+`*(x: VkPipelineStageFlagBits, y: int): VkPipelineStageFlagBits {.used.} = x + VkPipelineStageFlagBits(y)

const
  vkPipelineStageNoneKhr* = VkPipelineStageFlagBits 0
  vkPipelineStageTopOfPipeBit* = VkPipelineStageFlagBits 1
  vkPipelineStageDrawIndirectBit* = VkPipelineStageFlagBits 2
  vkPipelineStageVertexInputBit* = VkPipelineStageFlagBits 4
  vkPipelineStageVertexShaderBit* = VkPipelineStageFlagBits 8
  vkPipelineStageTessellationControlShaderBit* = VkPipelineStageFlagBits 16
  vkPipelineStageTessellationEvaluationShaderBit* = VkPipelineStageFlagBits 32
  vkPipelineStageGeometryShaderBit* = VkPipelineStageFlagBits 64
  vkPipelineStageFragmentShaderBit* = VkPipelineStageFlagBits 128
  vkPipelineStageEarlyFragmentTestsBit* = VkPipelineStageFlagBits 256
  vkPipelineStageLateFragmentTestsBit* = VkPipelineStageFlagBits 512
  vkPipelineStageColorAttachmentOutputBit* = VkPipelineStageFlagBits 1024
  vkPipelineStageComputeShaderBit* = VkPipelineStageFlagBits 2048
  vkPipelineStageTransferBit* = VkPipelineStageFlagBits 4096
  vkPipelineStageBottomOfPipeBit* = VkPipelineStageFlagBits 8192
  vkPipelineStageHostBit* = VkPipelineStageFlagBits 16384
  vkPipelineStageAllGraphicsBit* = VkPipelineStageFlagBits 32768
  vkPipelineStageAllCommandsBit* = VkPipelineStageFlagBits 65536
  vkPipelineStageCommandPreprocessBitNv* = VkPipelineStageFlagBits 131072
  vkPipelineStageConditionalRenderingBitExt* = VkPipelineStageFlagBits 262144
  vkPipelineStageTaskShaderBitNv* = VkPipelineStageFlagBits 524288
  vkPipelineStageMeshShaderBitNv* = VkPipelineStageFlagBits 1048576
  vkPipelineStageRayTracingShaderBitKhr* = VkPipelineStageFlagBits 2097152
  vkPipelineStageShadingRateImageBitNv* = VkPipelineStageFlagBits 4194304
  vkPipelineStageFragmentDensityProcessBitExt* = VkPipelineStageFlagBits 8388608
  vkPipelineStageTransformFeedbackBitExt* = VkPipelineStageFlagBits 16777216
  vkPipelineStageAccelerationStructureBuildBitKhr* = VkPipelineStageFlagBits 33554432
  vkPipelineStageReserved26BitKhr* = VkPipelineStageFlagBits 67108864
  vkPipelineStageReserved27BitKhr* = VkPipelineStageFlagBits 134217728
type VkCommandPoolCreateFlagBits* = distinct cint
proc `==`*(x, y: VkCommandPoolCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkCommandPoolCreateFlagBits): VkCommandPoolCreateFlagBits {.borrow.}
proc `-`*(x, y: VkCommandPoolCreateFlagBits): VkCommandPoolCreateFlagBits {.borrow.}
proc `+`*(x, y: VkCommandPoolCreateFlagBits): VkCommandPoolCreateFlagBits {.borrow.}
proc `+`*(x: VkCommandPoolCreateFlagBits, y: int): VkCommandPoolCreateFlagBits {.used.} = x + VkCommandPoolCreateFlagBits(y)

const
  vkCommandPoolCreateTransientBit* = VkCommandPoolCreateFlagBits 1
  vkCommandPoolCreateResetCommandBufferBit* = VkCommandPoolCreateFlagBits 2
  vkCommandPoolCreateProtectedBit* = VkCommandPoolCreateFlagBits 4
type VkCommandPoolResetFlagBits* = distinct cint
proc `==`*(x, y: VkCommandPoolResetFlagBits): bool {.borrow.}
proc `-`*(x: VkCommandPoolResetFlagBits): VkCommandPoolResetFlagBits {.borrow.}
proc `-`*(x, y: VkCommandPoolResetFlagBits): VkCommandPoolResetFlagBits {.borrow.}
proc `+`*(x, y: VkCommandPoolResetFlagBits): VkCommandPoolResetFlagBits {.borrow.}
proc `+`*(x: VkCommandPoolResetFlagBits, y: int): VkCommandPoolResetFlagBits {.used.} = x + VkCommandPoolResetFlagBits(y)

const
  vkCommandPoolResetReleaseResourcesBit* = VkCommandPoolResetFlagBits 1
type VkCommandBufferResetFlagBits* = distinct cint
proc `==`*(x, y: VkCommandBufferResetFlagBits): bool {.borrow.}
proc `-`*(x: VkCommandBufferResetFlagBits): VkCommandBufferResetFlagBits {.borrow.}
proc `-`*(x, y: VkCommandBufferResetFlagBits): VkCommandBufferResetFlagBits {.borrow.}
proc `+`*(x, y: VkCommandBufferResetFlagBits): VkCommandBufferResetFlagBits {.borrow.}
proc `+`*(x: VkCommandBufferResetFlagBits, y: int): VkCommandBufferResetFlagBits {.used.} = x + VkCommandBufferResetFlagBits(y)

const
  vkCommandBufferResetReleaseResourcesBit* = VkCommandBufferResetFlagBits 1
type VkSampleCountFlagBits* = distinct cint
proc `==`*(x, y: VkSampleCountFlagBits): bool {.borrow.}
proc `-`*(x: VkSampleCountFlagBits): VkSampleCountFlagBits {.borrow.}
proc `-`*(x, y: VkSampleCountFlagBits): VkSampleCountFlagBits {.borrow.}
proc `+`*(x, y: VkSampleCountFlagBits): VkSampleCountFlagBits {.borrow.}
proc `+`*(x: VkSampleCountFlagBits, y: int): VkSampleCountFlagBits {.used.} = x + VkSampleCountFlagBits(y)

const
  vkSampleCount1Bit* = VkSampleCountFlagBits 1
  vkSampleCount2Bit* = VkSampleCountFlagBits 2
  vkSampleCount4Bit* = VkSampleCountFlagBits 4
  vkSampleCount8Bit* = VkSampleCountFlagBits 8
  vkSampleCount16Bit* = VkSampleCountFlagBits 16
  vkSampleCount32Bit* = VkSampleCountFlagBits 32
  vkSampleCount64Bit* = VkSampleCountFlagBits 64
type VkAttachmentDescriptionFlagBits* = distinct cint
proc `==`*(x, y: VkAttachmentDescriptionFlagBits): bool {.borrow.}
proc `-`*(x: VkAttachmentDescriptionFlagBits): VkAttachmentDescriptionFlagBits {.borrow.}
proc `-`*(x, y: VkAttachmentDescriptionFlagBits): VkAttachmentDescriptionFlagBits {.borrow.}
proc `+`*(x, y: VkAttachmentDescriptionFlagBits): VkAttachmentDescriptionFlagBits {.borrow.}
proc `+`*(x: VkAttachmentDescriptionFlagBits, y: int): VkAttachmentDescriptionFlagBits {.used.} = x + VkAttachmentDescriptionFlagBits(y)

const
  vkAttachmentDescriptionMayAliasBit* = VkAttachmentDescriptionFlagBits 1
type VkStencilFaceFlagBits* = distinct cint
proc `==`*(x, y: VkStencilFaceFlagBits): bool {.borrow.}
proc `-`*(x: VkStencilFaceFlagBits): VkStencilFaceFlagBits {.borrow.}
proc `-`*(x, y: VkStencilFaceFlagBits): VkStencilFaceFlagBits {.borrow.}
proc `+`*(x, y: VkStencilFaceFlagBits): VkStencilFaceFlagBits {.borrow.}
proc `+`*(x: VkStencilFaceFlagBits, y: int): VkStencilFaceFlagBits {.used.} = x + VkStencilFaceFlagBits(y)

const
  vkStencilFaceFrontBit* = VkStencilFaceFlagBits 1
  vkStencilFaceBackBit* = VkStencilFaceFlagBits 2
  vkStencilFaceFrontAndBack* = VkStencilFaceFlagBits 3
type VkDescriptorPoolCreateFlagBits* = distinct cint
proc `==`*(x, y: VkDescriptorPoolCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkDescriptorPoolCreateFlagBits): VkDescriptorPoolCreateFlagBits {.borrow.}
proc `-`*(x, y: VkDescriptorPoolCreateFlagBits): VkDescriptorPoolCreateFlagBits {.borrow.}
proc `+`*(x, y: VkDescriptorPoolCreateFlagBits): VkDescriptorPoolCreateFlagBits {.borrow.}
proc `+`*(x: VkDescriptorPoolCreateFlagBits, y: int): VkDescriptorPoolCreateFlagBits {.used.} = x + VkDescriptorPoolCreateFlagBits(y)

const
  vkDescriptorPoolCreateFreeDescriptorSetBit* = VkDescriptorPoolCreateFlagBits 1
  vkDescriptorPoolCreateUpdateAfterBindBit* = VkDescriptorPoolCreateFlagBits 2
  vkDescriptorPoolCreateHostOnlyBitValve* = VkDescriptorPoolCreateFlagBits 4
type VkDependencyFlagBits* = distinct cint
proc `==`*(x, y: VkDependencyFlagBits): bool {.borrow.}
proc `-`*(x: VkDependencyFlagBits): VkDependencyFlagBits {.borrow.}
proc `-`*(x, y: VkDependencyFlagBits): VkDependencyFlagBits {.borrow.}
proc `+`*(x, y: VkDependencyFlagBits): VkDependencyFlagBits {.borrow.}
proc `+`*(x: VkDependencyFlagBits, y: int): VkDependencyFlagBits {.used.} = x + VkDependencyFlagBits(y)

const
  vkDependencyByRegionBit* = VkDependencyFlagBits 1
  vkDependencyViewLocalBit* = VkDependencyFlagBits 2
  vkDependencyDeviceGroupBit* = VkDependencyFlagBits 4
type VkSemaphoreType* = distinct cint
proc `==`*(x, y: VkSemaphoreType): bool {.borrow.}
proc `-`*(x: VkSemaphoreType): VkSemaphoreType {.borrow.}
proc `-`*(x, y: VkSemaphoreType): VkSemaphoreType {.borrow.}
proc `+`*(x, y: VkSemaphoreType): VkSemaphoreType {.borrow.}
proc `+`*(x: VkSemaphoreType, y: int): VkSemaphoreType {.used.} = x + VkSemaphoreType(y)

const
  vkSemaphoreTypeBinary* = VkSemaphoreType 0
  vkSemaphoreTypeTimeline* = VkSemaphoreType 1
type VkSemaphoreWaitFlagBits* = distinct cint
proc `==`*(x, y: VkSemaphoreWaitFlagBits): bool {.borrow.}
proc `-`*(x: VkSemaphoreWaitFlagBits): VkSemaphoreWaitFlagBits {.borrow.}
proc `-`*(x, y: VkSemaphoreWaitFlagBits): VkSemaphoreWaitFlagBits {.borrow.}
proc `+`*(x, y: VkSemaphoreWaitFlagBits): VkSemaphoreWaitFlagBits {.borrow.}
proc `+`*(x: VkSemaphoreWaitFlagBits, y: int): VkSemaphoreWaitFlagBits {.used.} = x + VkSemaphoreWaitFlagBits(y)

const
  vkSemaphoreWaitAnyBit* = VkSemaphoreWaitFlagBits 1
type VkPresentModeKHR* = distinct cint
proc `==`*(x, y: VkPresentModeKHR): bool {.borrow.}
proc `-`*(x: VkPresentModeKHR): VkPresentModeKHR {.borrow.}
proc `-`*(x, y: VkPresentModeKHR): VkPresentModeKHR {.borrow.}
proc `+`*(x, y: VkPresentModeKHR): VkPresentModeKHR {.borrow.}
proc `+`*(x: VkPresentModeKHR, y: int): VkPresentModeKHR {.used.} = x + VkPresentModeKHR(y)

const
  vkPresentModeImmediateKhr* = VkPresentModeKHR 0
  vkPresentModeMailboxKhr* = VkPresentModeKHR 1
  vkPresentModeFifoKhr* = VkPresentModeKHR 2
  vkPresentModeFifoRelaxedKhr* = VkPresentModeKHR 3
  vkPresentModeSharedDemandRefreshKhr* = VkPresentModeKHR 1000111000
  vkPresentModeSharedContinuousRefreshKhr* = VkPresentModeKHR 1000111001
type VkColorSpaceKHR* = distinct cint
proc `==`*(x, y: VkColorSpaceKHR): bool {.borrow.}
proc `-`*(x: VkColorSpaceKHR): VkColorSpaceKHR {.borrow.}
proc `-`*(x, y: VkColorSpaceKHR): VkColorSpaceKHR {.borrow.}
proc `+`*(x, y: VkColorSpaceKHR): VkColorSpaceKHR {.borrow.}
proc `+`*(x: VkColorSpaceKHR, y: int): VkColorSpaceKHR {.used.} = x + VkColorSpaceKHR(y)

const
  vkColorSpaceSrgbNonlinearKhr* = VkColorSpaceKHR 0
  vkColorSpaceDisplayP3NonlinearExt* = VkColorSpaceKHR 1000104001
  vkColorSpaceExtendedSrgbLinearExt* = VkColorSpaceKHR 1000104002
  vkColorSpaceDisplayP3LinearExt* = VkColorSpaceKHR 1000104003
  vkColorSpaceDciP3NonlinearExt* = VkColorSpaceKHR 1000104004
  vkColorSpaceBt709LinearExt* = VkColorSpaceKHR 1000104005
  vkColorSpaceBt709NonlinearExt* = VkColorSpaceKHR 1000104006
  vkColorSpaceBt2020LinearExt* = VkColorSpaceKHR 1000104007
  vkColorSpaceHdr10St2084Ext* = VkColorSpaceKHR 1000104008
  vkColorSpaceDolbyvisionExt* = VkColorSpaceKHR 1000104009
  vkColorSpaceHdr10HlgExt* = VkColorSpaceKHR 1000104010
  vkColorSpaceAdobergbLinearExt* = VkColorSpaceKHR 1000104011
  vkColorSpaceAdobergbNonlinearExt* = VkColorSpaceKHR 1000104012
  vkColorSpacePassThroughExt* = VkColorSpaceKHR 1000104013
  vkColorSpaceExtendedSrgbNonlinearExt* = VkColorSpaceKHR 1000104014
  vkColorSpaceDisplayNativeAmd* = VkColorSpaceKHR 1000213000
type VkDisplayPlaneAlphaFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkDisplayPlaneAlphaFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkDisplayPlaneAlphaFlagBitsKHR): VkDisplayPlaneAlphaFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkDisplayPlaneAlphaFlagBitsKHR): VkDisplayPlaneAlphaFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkDisplayPlaneAlphaFlagBitsKHR): VkDisplayPlaneAlphaFlagBitsKHR {.borrow.}
proc `+`*(x: VkDisplayPlaneAlphaFlagBitsKHR, y: int): VkDisplayPlaneAlphaFlagBitsKHR {.used.} = x + VkDisplayPlaneAlphaFlagBitsKHR(y)

const
  vkDisplayPlaneAlphaOpaqueBitKhr* = VkDisplayPlaneAlphaFlagBitsKHR 1
  vkDisplayPlaneAlphaGlobalBitKhr* = VkDisplayPlaneAlphaFlagBitsKHR 2
  vkDisplayPlaneAlphaPerPixelBitKhr* = VkDisplayPlaneAlphaFlagBitsKHR 4
  vkDisplayPlaneAlphaPerPixelPremultipliedBitKhr* = VkDisplayPlaneAlphaFlagBitsKHR 8
type VkCompositeAlphaFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkCompositeAlphaFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkCompositeAlphaFlagBitsKHR): VkCompositeAlphaFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkCompositeAlphaFlagBitsKHR): VkCompositeAlphaFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkCompositeAlphaFlagBitsKHR): VkCompositeAlphaFlagBitsKHR {.borrow.}
proc `+`*(x: VkCompositeAlphaFlagBitsKHR, y: int): VkCompositeAlphaFlagBitsKHR {.used.} = x + VkCompositeAlphaFlagBitsKHR(y)

const
  vkCompositeAlphaOpaqueBitKhr* = VkCompositeAlphaFlagBitsKHR 1
  vkCompositeAlphaPreMultipliedBitKhr* = VkCompositeAlphaFlagBitsKHR 2
  vkCompositeAlphaPostMultipliedBitKhr* = VkCompositeAlphaFlagBitsKHR 4
  vkCompositeAlphaInheritBitKhr* = VkCompositeAlphaFlagBitsKHR 8
type VkSurfaceTransformFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkSurfaceTransformFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkSurfaceTransformFlagBitsKHR): VkSurfaceTransformFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkSurfaceTransformFlagBitsKHR): VkSurfaceTransformFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkSurfaceTransformFlagBitsKHR): VkSurfaceTransformFlagBitsKHR {.borrow.}
proc `+`*(x: VkSurfaceTransformFlagBitsKHR, y: int): VkSurfaceTransformFlagBitsKHR {.used.} = x + VkSurfaceTransformFlagBitsKHR(y)

const
  vkSurfaceTransformIdentityBitKhr* = VkSurfaceTransformFlagBitsKHR 1
  vkSurfaceTransformRotate90BitKhr* = VkSurfaceTransformFlagBitsKHR 2
  vkSurfaceTransformRotate180BitKhr* = VkSurfaceTransformFlagBitsKHR 4
  vkSurfaceTransformRotate270BitKhr* = VkSurfaceTransformFlagBitsKHR 8
  vkSurfaceTransformHorizontalMirrorBitKhr* = VkSurfaceTransformFlagBitsKHR 16
  vkSurfaceTransformHorizontalMirrorRotate90BitKhr* = VkSurfaceTransformFlagBitsKHR 32
  vkSurfaceTransformHorizontalMirrorRotate180BitKhr* = VkSurfaceTransformFlagBitsKHR 64
  vkSurfaceTransformHorizontalMirrorRotate270BitKhr* = VkSurfaceTransformFlagBitsKHR 128
  vkSurfaceTransformInheritBitKhr* = VkSurfaceTransformFlagBitsKHR 256
type VkSwapchainImageUsageFlagBitsANDROID* = distinct cint
proc `==`*(x, y: VkSwapchainImageUsageFlagBitsANDROID): bool {.borrow.}
proc `-`*(x: VkSwapchainImageUsageFlagBitsANDROID): VkSwapchainImageUsageFlagBitsANDROID {.borrow.}
proc `-`*(x, y: VkSwapchainImageUsageFlagBitsANDROID): VkSwapchainImageUsageFlagBitsANDROID {.borrow.}
proc `+`*(x, y: VkSwapchainImageUsageFlagBitsANDROID): VkSwapchainImageUsageFlagBitsANDROID {.borrow.}
proc `+`*(x: VkSwapchainImageUsageFlagBitsANDROID, y: int): VkSwapchainImageUsageFlagBitsANDROID {.used.} = x + VkSwapchainImageUsageFlagBitsANDROID(y)

const
  vkSwapchainImageUsageSharedBitAndroid* = VkSwapchainImageUsageFlagBitsANDROID 1
type VkTimeDomainEXT* = distinct cint
proc `==`*(x, y: VkTimeDomainEXT): bool {.borrow.}
proc `-`*(x: VkTimeDomainEXT): VkTimeDomainEXT {.borrow.}
proc `-`*(x, y: VkTimeDomainEXT): VkTimeDomainEXT {.borrow.}
proc `+`*(x, y: VkTimeDomainEXT): VkTimeDomainEXT {.borrow.}
proc `+`*(x: VkTimeDomainEXT, y: int): VkTimeDomainEXT {.used.} = x + VkTimeDomainEXT(y)

const
  vkTimeDomainDeviceExt* = VkTimeDomainEXT 0
  vkTimeDomainClockMonotonicExt* = VkTimeDomainEXT 1
  vkTimeDomainClockMonotonicRawExt* = VkTimeDomainEXT 2
  vkTimeDomainQueryPerformanceCounterExt* = VkTimeDomainEXT 3
type VkDebugReportFlagBitsEXT* = distinct cint
proc `==`*(x, y: VkDebugReportFlagBitsEXT): bool {.borrow.}
proc `-`*(x: VkDebugReportFlagBitsEXT): VkDebugReportFlagBitsEXT {.borrow.}
proc `-`*(x, y: VkDebugReportFlagBitsEXT): VkDebugReportFlagBitsEXT {.borrow.}
proc `+`*(x, y: VkDebugReportFlagBitsEXT): VkDebugReportFlagBitsEXT {.borrow.}
proc `+`*(x: VkDebugReportFlagBitsEXT, y: int): VkDebugReportFlagBitsEXT {.used.} = x + VkDebugReportFlagBitsEXT(y)

const
  vkDebugReportInformationBitExt* = VkDebugReportFlagBitsEXT 1
  vkDebugReportWarningBitExt* = VkDebugReportFlagBitsEXT 2
  vkDebugReportPerformanceWarningBitExt* = VkDebugReportFlagBitsEXT 4
  vkDebugReportErrorBitExt* = VkDebugReportFlagBitsEXT 8
  vkDebugReportDebugBitExt* = VkDebugReportFlagBitsEXT 16
type VkDebugReportObjectTypeEXT* = distinct cint
proc `==`*(x, y: VkDebugReportObjectTypeEXT): bool {.borrow.}
proc `-`*(x: VkDebugReportObjectTypeEXT): VkDebugReportObjectTypeEXT {.borrow.}
proc `-`*(x, y: VkDebugReportObjectTypeEXT): VkDebugReportObjectTypeEXT {.borrow.}
proc `+`*(x, y: VkDebugReportObjectTypeEXT): VkDebugReportObjectTypeEXT {.borrow.}
proc `+`*(x: VkDebugReportObjectTypeEXT, y: int): VkDebugReportObjectTypeEXT {.used.} = x + VkDebugReportObjectTypeEXT(y)

const
  vkDebugReportObjectTypeUnknownExt* = VkDebugReportObjectTypeEXT 0
  vkDebugReportObjectTypeInstanceExt* = VkDebugReportObjectTypeEXT 1
  vkDebugReportObjectTypePhysicalDeviceExt* = VkDebugReportObjectTypeEXT 2
  vkDebugReportObjectTypeDeviceExt* = VkDebugReportObjectTypeEXT 3
  vkDebugReportObjectTypeQueueExt* = VkDebugReportObjectTypeEXT 4
  vkDebugReportObjectTypeSemaphoreExt* = VkDebugReportObjectTypeEXT 5
  vkDebugReportObjectTypeCommandBufferExt* = VkDebugReportObjectTypeEXT 6
  vkDebugReportObjectTypeFenceExt* = VkDebugReportObjectTypeEXT 7
  vkDebugReportObjectTypeDeviceMemoryExt* = VkDebugReportObjectTypeEXT 8
  vkDebugReportObjectTypeBufferExt* = VkDebugReportObjectTypeEXT 9
  vkDebugReportObjectTypeImageExt* = VkDebugReportObjectTypeEXT 10
  vkDebugReportObjectTypeEventExt* = VkDebugReportObjectTypeEXT 11
  vkDebugReportObjectTypeQueryPoolExt* = VkDebugReportObjectTypeEXT 12
  vkDebugReportObjectTypeBufferViewExt* = VkDebugReportObjectTypeEXT 13
  vkDebugReportObjectTypeImageViewExt* = VkDebugReportObjectTypeEXT 14
  vkDebugReportObjectTypeShaderModuleExt* = VkDebugReportObjectTypeEXT 15
  vkDebugReportObjectTypePipelineCacheExt* = VkDebugReportObjectTypeEXT 16
  vkDebugReportObjectTypePipelineLayoutExt* = VkDebugReportObjectTypeEXT 17
  vkDebugReportObjectTypeRenderPassExt* = VkDebugReportObjectTypeEXT 18
  vkDebugReportObjectTypePipelineExt* = VkDebugReportObjectTypeEXT 19
  vkDebugReportObjectTypeDescriptorSetLayoutExt* = VkDebugReportObjectTypeEXT 20
  vkDebugReportObjectTypeSamplerExt* = VkDebugReportObjectTypeEXT 21
  vkDebugReportObjectTypeDescriptorPoolExt* = VkDebugReportObjectTypeEXT 22
  vkDebugReportObjectTypeDescriptorSetExt* = VkDebugReportObjectTypeEXT 23
  vkDebugReportObjectTypeFramebufferExt* = VkDebugReportObjectTypeEXT 24
  vkDebugReportObjectTypeCommandPoolExt* = VkDebugReportObjectTypeEXT 25
  vkDebugReportObjectTypeSurfaceKhrExt* = VkDebugReportObjectTypeEXT 26
  vkDebugReportObjectTypeSwapchainKhrExt* = VkDebugReportObjectTypeEXT 27
  vkDebugReportObjectTypeDebugReportCallbackExtExt* = VkDebugReportObjectTypeEXT 28
  vkDebugReportObjectTypeDisplayKhrExt* = VkDebugReportObjectTypeEXT 29
  vkDebugReportObjectTypeDisplayModeKhrExt* = VkDebugReportObjectTypeEXT 30
  vkDebugReportObjectTypeValidationCacheExtExt* = VkDebugReportObjectTypeEXT 33
  vkDebugReportObjectTypeDescriptorUpdateTemplateExt* = VkDebugReportObjectTypeEXT 1000011000
  vkDebugReportObjectTypeAccelerationStructureKhrExt* = VkDebugReportObjectTypeEXT 1000150000
  vkDebugReportObjectTypeSamplerYcbcrConversionExt* = VkDebugReportObjectTypeEXT 1000156000
  vkDebugReportObjectTypeAccelerationStructureNvExt* = VkDebugReportObjectTypeEXT 1000165000
type VkDeviceMemoryReportEventTypeEXT* = distinct cint
proc `==`*(x, y: VkDeviceMemoryReportEventTypeEXT): bool {.borrow.}
proc `-`*(x: VkDeviceMemoryReportEventTypeEXT): VkDeviceMemoryReportEventTypeEXT {.borrow.}
proc `-`*(x, y: VkDeviceMemoryReportEventTypeEXT): VkDeviceMemoryReportEventTypeEXT {.borrow.}
proc `+`*(x, y: VkDeviceMemoryReportEventTypeEXT): VkDeviceMemoryReportEventTypeEXT {.borrow.}
proc `+`*(x: VkDeviceMemoryReportEventTypeEXT, y: int): VkDeviceMemoryReportEventTypeEXT {.used.} = x + VkDeviceMemoryReportEventTypeEXT(y)

const
  vkDeviceMemoryReportEventTypeAllocateExt* = VkDeviceMemoryReportEventTypeEXT 0
  vkDeviceMemoryReportEventTypeFreeExt* = VkDeviceMemoryReportEventTypeEXT 1
  vkDeviceMemoryReportEventTypeImportExt* = VkDeviceMemoryReportEventTypeEXT 2
  vkDeviceMemoryReportEventTypeUnimportExt* = VkDeviceMemoryReportEventTypeEXT 3
  vkDeviceMemoryReportEventTypeAllocationFailedExt* = VkDeviceMemoryReportEventTypeEXT 4
type VkRasterizationOrderAMD* = distinct cint
proc `==`*(x, y: VkRasterizationOrderAMD): bool {.borrow.}
proc `-`*(x: VkRasterizationOrderAMD): VkRasterizationOrderAMD {.borrow.}
proc `-`*(x, y: VkRasterizationOrderAMD): VkRasterizationOrderAMD {.borrow.}
proc `+`*(x, y: VkRasterizationOrderAMD): VkRasterizationOrderAMD {.borrow.}
proc `+`*(x: VkRasterizationOrderAMD, y: int): VkRasterizationOrderAMD {.used.} = x + VkRasterizationOrderAMD(y)

const
  vkRasterizationOrderStrictAmd* = VkRasterizationOrderAMD 0
  vkRasterizationOrderRelaxedAmd* = VkRasterizationOrderAMD 1
type VkExternalMemoryHandleTypeFlagBitsNV* = distinct cint
proc `==`*(x, y: VkExternalMemoryHandleTypeFlagBitsNV): bool {.borrow.}
proc `-`*(x: VkExternalMemoryHandleTypeFlagBitsNV): VkExternalMemoryHandleTypeFlagBitsNV {.borrow.}
proc `-`*(x, y: VkExternalMemoryHandleTypeFlagBitsNV): VkExternalMemoryHandleTypeFlagBitsNV {.borrow.}
proc `+`*(x, y: VkExternalMemoryHandleTypeFlagBitsNV): VkExternalMemoryHandleTypeFlagBitsNV {.borrow.}
proc `+`*(x: VkExternalMemoryHandleTypeFlagBitsNV, y: int): VkExternalMemoryHandleTypeFlagBitsNV {.used.} = x + VkExternalMemoryHandleTypeFlagBitsNV(y)

const
  vkExternalMemoryHandleTypeOpaqueWin32BitNv* = VkExternalMemoryHandleTypeFlagBitsNV 1
  vkExternalMemoryHandleTypeOpaqueWin32KmtBitNv* = VkExternalMemoryHandleTypeFlagBitsNV 2
  vkExternalMemoryHandleTypeD3d11ImageBitNv* = VkExternalMemoryHandleTypeFlagBitsNV 4
  vkExternalMemoryHandleTypeD3d11ImageKmtBitNv* = VkExternalMemoryHandleTypeFlagBitsNV 8
type VkExternalMemoryFeatureFlagBitsNV* = distinct cint
proc `==`*(x, y: VkExternalMemoryFeatureFlagBitsNV): bool {.borrow.}
proc `-`*(x: VkExternalMemoryFeatureFlagBitsNV): VkExternalMemoryFeatureFlagBitsNV {.borrow.}
proc `-`*(x, y: VkExternalMemoryFeatureFlagBitsNV): VkExternalMemoryFeatureFlagBitsNV {.borrow.}
proc `+`*(x, y: VkExternalMemoryFeatureFlagBitsNV): VkExternalMemoryFeatureFlagBitsNV {.borrow.}
proc `+`*(x: VkExternalMemoryFeatureFlagBitsNV, y: int): VkExternalMemoryFeatureFlagBitsNV {.used.} = x + VkExternalMemoryFeatureFlagBitsNV(y)

const
  vkExternalMemoryFeatureDedicatedOnlyBitNv* = VkExternalMemoryFeatureFlagBitsNV 1
  vkExternalMemoryFeatureExportableBitNv* = VkExternalMemoryFeatureFlagBitsNV 2
  vkExternalMemoryFeatureImportableBitNv* = VkExternalMemoryFeatureFlagBitsNV 4
type VkValidationCheckEXT* = distinct cint
proc `==`*(x, y: VkValidationCheckEXT): bool {.borrow.}
proc `-`*(x: VkValidationCheckEXT): VkValidationCheckEXT {.borrow.}
proc `-`*(x, y: VkValidationCheckEXT): VkValidationCheckEXT {.borrow.}
proc `+`*(x, y: VkValidationCheckEXT): VkValidationCheckEXT {.borrow.}
proc `+`*(x: VkValidationCheckEXT, y: int): VkValidationCheckEXT {.used.} = x + VkValidationCheckEXT(y)

const
  vkValidationCheckAllExt* = VkValidationCheckEXT 0
  vkValidationCheckShadersExt* = VkValidationCheckEXT 1
type VkValidationFeatureEnableEXT* = distinct cint
proc `==`*(x, y: VkValidationFeatureEnableEXT): bool {.borrow.}
proc `-`*(x: VkValidationFeatureEnableEXT): VkValidationFeatureEnableEXT {.borrow.}
proc `-`*(x, y: VkValidationFeatureEnableEXT): VkValidationFeatureEnableEXT {.borrow.}
proc `+`*(x, y: VkValidationFeatureEnableEXT): VkValidationFeatureEnableEXT {.borrow.}
proc `+`*(x: VkValidationFeatureEnableEXT, y: int): VkValidationFeatureEnableEXT {.used.} = x + VkValidationFeatureEnableEXT(y)

const
  vkValidationFeatureEnableGpuAssistedExt* = VkValidationFeatureEnableEXT 0
  vkValidationFeatureEnableGpuAssistedReserveBindingSlotExt* = VkValidationFeatureEnableEXT 1
  vkValidationFeatureEnableBestPracticesExt* = VkValidationFeatureEnableEXT 2
  vkValidationFeatureEnableDebugPrintfExt* = VkValidationFeatureEnableEXT 3
  vkValidationFeatureEnableSynchronizationValidationExt* = VkValidationFeatureEnableEXT 4
type VkValidationFeatureDisableEXT* = distinct cint
proc `==`*(x, y: VkValidationFeatureDisableEXT): bool {.borrow.}
proc `-`*(x: VkValidationFeatureDisableEXT): VkValidationFeatureDisableEXT {.borrow.}
proc `-`*(x, y: VkValidationFeatureDisableEXT): VkValidationFeatureDisableEXT {.borrow.}
proc `+`*(x, y: VkValidationFeatureDisableEXT): VkValidationFeatureDisableEXT {.borrow.}
proc `+`*(x: VkValidationFeatureDisableEXT, y: int): VkValidationFeatureDisableEXT {.used.} = x + VkValidationFeatureDisableEXT(y)

const
  vkValidationFeatureDisableAllExt* = VkValidationFeatureDisableEXT 0
  vkValidationFeatureDisableShadersExt* = VkValidationFeatureDisableEXT 1
  vkValidationFeatureDisableThreadSafetyExt* = VkValidationFeatureDisableEXT 2
  vkValidationFeatureDisableApiParametersExt* = VkValidationFeatureDisableEXT 3
  vkValidationFeatureDisableObjectLifetimesExt* = VkValidationFeatureDisableEXT 4
  vkValidationFeatureDisableCoreChecksExt* = VkValidationFeatureDisableEXT 5
  vkValidationFeatureDisableUniqueHandlesExt* = VkValidationFeatureDisableEXT 6
type VkSubgroupFeatureFlagBits* = distinct cint
proc `==`*(x, y: VkSubgroupFeatureFlagBits): bool {.borrow.}
proc `-`*(x: VkSubgroupFeatureFlagBits): VkSubgroupFeatureFlagBits {.borrow.}
proc `-`*(x, y: VkSubgroupFeatureFlagBits): VkSubgroupFeatureFlagBits {.borrow.}
proc `+`*(x, y: VkSubgroupFeatureFlagBits): VkSubgroupFeatureFlagBits {.borrow.}
proc `+`*(x: VkSubgroupFeatureFlagBits, y: int): VkSubgroupFeatureFlagBits {.used.} = x + VkSubgroupFeatureFlagBits(y)

const
  vkSubgroupFeatureBasicBit* = VkSubgroupFeatureFlagBits 1
  vkSubgroupFeatureVoteBit* = VkSubgroupFeatureFlagBits 2
  vkSubgroupFeatureArithmeticBit* = VkSubgroupFeatureFlagBits 4
  vkSubgroupFeatureBallotBit* = VkSubgroupFeatureFlagBits 8
  vkSubgroupFeatureShuffleBit* = VkSubgroupFeatureFlagBits 16
  vkSubgroupFeatureShuffleRelativeBit* = VkSubgroupFeatureFlagBits 32
  vkSubgroupFeatureClusteredBit* = VkSubgroupFeatureFlagBits 64
  vkSubgroupFeatureQuadBit* = VkSubgroupFeatureFlagBits 128
  vkSubgroupFeaturePartitionedBitNv* = VkSubgroupFeatureFlagBits 256
type VkIndirectCommandsLayoutUsageFlagBitsNV* = distinct cint
proc `==`*(x, y: VkIndirectCommandsLayoutUsageFlagBitsNV): bool {.borrow.}
proc `-`*(x: VkIndirectCommandsLayoutUsageFlagBitsNV): VkIndirectCommandsLayoutUsageFlagBitsNV {.borrow.}
proc `-`*(x, y: VkIndirectCommandsLayoutUsageFlagBitsNV): VkIndirectCommandsLayoutUsageFlagBitsNV {.borrow.}
proc `+`*(x, y: VkIndirectCommandsLayoutUsageFlagBitsNV): VkIndirectCommandsLayoutUsageFlagBitsNV {.borrow.}
proc `+`*(x: VkIndirectCommandsLayoutUsageFlagBitsNV, y: int): VkIndirectCommandsLayoutUsageFlagBitsNV {.used.} = x + VkIndirectCommandsLayoutUsageFlagBitsNV(y)

const
  vkIndirectCommandsLayoutUsageExplicitPreprocessBitNv* = VkIndirectCommandsLayoutUsageFlagBitsNV 1
  vkIndirectCommandsLayoutUsageIndexedSequencesBitNv* = VkIndirectCommandsLayoutUsageFlagBitsNV 2
  vkIndirectCommandsLayoutUsageUnorderedSequencesBitNv* = VkIndirectCommandsLayoutUsageFlagBitsNV 4
type VkIndirectStateFlagBitsNV* = distinct cint
proc `==`*(x, y: VkIndirectStateFlagBitsNV): bool {.borrow.}
proc `-`*(x: VkIndirectStateFlagBitsNV): VkIndirectStateFlagBitsNV {.borrow.}
proc `-`*(x, y: VkIndirectStateFlagBitsNV): VkIndirectStateFlagBitsNV {.borrow.}
proc `+`*(x, y: VkIndirectStateFlagBitsNV): VkIndirectStateFlagBitsNV {.borrow.}
proc `+`*(x: VkIndirectStateFlagBitsNV, y: int): VkIndirectStateFlagBitsNV {.used.} = x + VkIndirectStateFlagBitsNV(y)

const
  vkIndirectStateFlagFrontfaceBitNv* = VkIndirectStateFlagBitsNV 1
type VkIndirectCommandsTokenTypeNV* = distinct cint
proc `==`*(x, y: VkIndirectCommandsTokenTypeNV): bool {.borrow.}
proc `-`*(x: VkIndirectCommandsTokenTypeNV): VkIndirectCommandsTokenTypeNV {.borrow.}
proc `-`*(x, y: VkIndirectCommandsTokenTypeNV): VkIndirectCommandsTokenTypeNV {.borrow.}
proc `+`*(x, y: VkIndirectCommandsTokenTypeNV): VkIndirectCommandsTokenTypeNV {.borrow.}
proc `+`*(x: VkIndirectCommandsTokenTypeNV, y: int): VkIndirectCommandsTokenTypeNV {.used.} = x + VkIndirectCommandsTokenTypeNV(y)

const
  vkIndirectCommandsTokenTypeShaderGroupNv* = VkIndirectCommandsTokenTypeNV 0
  vkIndirectCommandsTokenTypeStateFlagsNv* = VkIndirectCommandsTokenTypeNV 1
  vkIndirectCommandsTokenTypeIndexBufferNv* = VkIndirectCommandsTokenTypeNV 2
  vkIndirectCommandsTokenTypeVertexBufferNv* = VkIndirectCommandsTokenTypeNV 3
  vkIndirectCommandsTokenTypePushConstantNv* = VkIndirectCommandsTokenTypeNV 4
  vkIndirectCommandsTokenTypeDrawIndexedNv* = VkIndirectCommandsTokenTypeNV 5
  vkIndirectCommandsTokenTypeDrawNv* = VkIndirectCommandsTokenTypeNV 6
  vkIndirectCommandsTokenTypeDrawTasksNv* = VkIndirectCommandsTokenTypeNV 7
type VkPrivateDataSlotCreateFlagBitsEXT* = distinct cint
proc `==`*(x, y: VkPrivateDataSlotCreateFlagBitsEXT): bool {.borrow.}
proc `-`*(x: VkPrivateDataSlotCreateFlagBitsEXT): VkPrivateDataSlotCreateFlagBitsEXT {.borrow.}
proc `-`*(x, y: VkPrivateDataSlotCreateFlagBitsEXT): VkPrivateDataSlotCreateFlagBitsEXT {.borrow.}
proc `+`*(x, y: VkPrivateDataSlotCreateFlagBitsEXT): VkPrivateDataSlotCreateFlagBitsEXT {.borrow.}
proc `+`*(x: VkPrivateDataSlotCreateFlagBitsEXT, y: int): VkPrivateDataSlotCreateFlagBitsEXT {.used.} = x + VkPrivateDataSlotCreateFlagBitsEXT(y)
type VkDescriptorSetLayoutCreateFlagBits* = distinct cint
proc `==`*(x, y: VkDescriptorSetLayoutCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkDescriptorSetLayoutCreateFlagBits): VkDescriptorSetLayoutCreateFlagBits {.borrow.}
proc `-`*(x, y: VkDescriptorSetLayoutCreateFlagBits): VkDescriptorSetLayoutCreateFlagBits {.borrow.}
proc `+`*(x, y: VkDescriptorSetLayoutCreateFlagBits): VkDescriptorSetLayoutCreateFlagBits {.borrow.}
proc `+`*(x: VkDescriptorSetLayoutCreateFlagBits, y: int): VkDescriptorSetLayoutCreateFlagBits {.used.} = x + VkDescriptorSetLayoutCreateFlagBits(y)

const
  vkDescriptorSetLayoutCreatePushDescriptorBitKhr* = VkDescriptorSetLayoutCreateFlagBits 1
  vkDescriptorSetLayoutCreateUpdateAfterBindPoolBit* = VkDescriptorSetLayoutCreateFlagBits 2
  vkDescriptorSetLayoutCreateHostOnlyPoolBitValve* = VkDescriptorSetLayoutCreateFlagBits 4
type VkExternalMemoryHandleTypeFlagBits* = distinct cint
proc `==`*(x, y: VkExternalMemoryHandleTypeFlagBits): bool {.borrow.}
proc `-`*(x: VkExternalMemoryHandleTypeFlagBits): VkExternalMemoryHandleTypeFlagBits {.borrow.}
proc `-`*(x, y: VkExternalMemoryHandleTypeFlagBits): VkExternalMemoryHandleTypeFlagBits {.borrow.}
proc `+`*(x, y: VkExternalMemoryHandleTypeFlagBits): VkExternalMemoryHandleTypeFlagBits {.borrow.}
proc `+`*(x: VkExternalMemoryHandleTypeFlagBits, y: int): VkExternalMemoryHandleTypeFlagBits {.used.} = x + VkExternalMemoryHandleTypeFlagBits(y)

const
  vkExternalMemoryHandleTypeOpaqueFdBit* = VkExternalMemoryHandleTypeFlagBits 1
  vkExternalMemoryHandleTypeOpaqueWin32Bit* = VkExternalMemoryHandleTypeFlagBits 2
  vkExternalMemoryHandleTypeOpaqueWin32KmtBit* = VkExternalMemoryHandleTypeFlagBits 4
  vkExternalMemoryHandleTypeD3d11TextureBit* = VkExternalMemoryHandleTypeFlagBits 8
  vkExternalMemoryHandleTypeD3d11TextureKmtBit* = VkExternalMemoryHandleTypeFlagBits 16
  vkExternalMemoryHandleTypeD3d12HeapBit* = VkExternalMemoryHandleTypeFlagBits 32
  vkExternalMemoryHandleTypeD3d12ResourceBit* = VkExternalMemoryHandleTypeFlagBits 64
  vkExternalMemoryHandleTypeHostAllocationBitExt* = VkExternalMemoryHandleTypeFlagBits 128
  vkExternalMemoryHandleTypeHostMappedForeignMemoryBitExt* = VkExternalMemoryHandleTypeFlagBits 256
  vkExternalMemoryHandleTypeDmaBufBitExt* = VkExternalMemoryHandleTypeFlagBits 512
  vkExternalMemoryHandleTypeAndroidHardwareBufferBitAndroid* = VkExternalMemoryHandleTypeFlagBits 1024
type VkExternalMemoryFeatureFlagBits* = distinct cint
proc `==`*(x, y: VkExternalMemoryFeatureFlagBits): bool {.borrow.}
proc `-`*(x: VkExternalMemoryFeatureFlagBits): VkExternalMemoryFeatureFlagBits {.borrow.}
proc `-`*(x, y: VkExternalMemoryFeatureFlagBits): VkExternalMemoryFeatureFlagBits {.borrow.}
proc `+`*(x, y: VkExternalMemoryFeatureFlagBits): VkExternalMemoryFeatureFlagBits {.borrow.}
proc `+`*(x: VkExternalMemoryFeatureFlagBits, y: int): VkExternalMemoryFeatureFlagBits {.used.} = x + VkExternalMemoryFeatureFlagBits(y)

const
  vkExternalMemoryFeatureDedicatedOnlyBit* = VkExternalMemoryFeatureFlagBits 1
  vkExternalMemoryFeatureExportableBit* = VkExternalMemoryFeatureFlagBits 2
  vkExternalMemoryFeatureImportableBit* = VkExternalMemoryFeatureFlagBits 4
type VkExternalSemaphoreHandleTypeFlagBits* = distinct cint
proc `==`*(x, y: VkExternalSemaphoreHandleTypeFlagBits): bool {.borrow.}
proc `-`*(x: VkExternalSemaphoreHandleTypeFlagBits): VkExternalSemaphoreHandleTypeFlagBits {.borrow.}
proc `-`*(x, y: VkExternalSemaphoreHandleTypeFlagBits): VkExternalSemaphoreHandleTypeFlagBits {.borrow.}
proc `+`*(x, y: VkExternalSemaphoreHandleTypeFlagBits): VkExternalSemaphoreHandleTypeFlagBits {.borrow.}
proc `+`*(x: VkExternalSemaphoreHandleTypeFlagBits, y: int): VkExternalSemaphoreHandleTypeFlagBits {.used.} = x + VkExternalSemaphoreHandleTypeFlagBits(y)

const
  vkExternalSemaphoreHandleTypeOpaqueFdBit* = VkExternalSemaphoreHandleTypeFlagBits 1
  vkExternalSemaphoreHandleTypeOpaqueWin32Bit* = VkExternalSemaphoreHandleTypeFlagBits 2
  vkExternalSemaphoreHandleTypeOpaqueWin32KmtBit* = VkExternalSemaphoreHandleTypeFlagBits 4
  vkExternalSemaphoreHandleTypeD3d12FenceBit* = VkExternalSemaphoreHandleTypeFlagBits 8
  vkExternalSemaphoreHandleTypeSyncFdBit* = VkExternalSemaphoreHandleTypeFlagBits 16
  vkExternalSemaphoreHandleTypeReserved5BitNv* = VkExternalSemaphoreHandleTypeFlagBits 32
  vkExternalSemaphoreHandleTypeReserved6BitNv* = VkExternalSemaphoreHandleTypeFlagBits 64
type VkExternalSemaphoreFeatureFlagBits* = distinct cint
proc `==`*(x, y: VkExternalSemaphoreFeatureFlagBits): bool {.borrow.}
proc `-`*(x: VkExternalSemaphoreFeatureFlagBits): VkExternalSemaphoreFeatureFlagBits {.borrow.}
proc `-`*(x, y: VkExternalSemaphoreFeatureFlagBits): VkExternalSemaphoreFeatureFlagBits {.borrow.}
proc `+`*(x, y: VkExternalSemaphoreFeatureFlagBits): VkExternalSemaphoreFeatureFlagBits {.borrow.}
proc `+`*(x: VkExternalSemaphoreFeatureFlagBits, y: int): VkExternalSemaphoreFeatureFlagBits {.used.} = x + VkExternalSemaphoreFeatureFlagBits(y)

const
  vkExternalSemaphoreFeatureExportableBit* = VkExternalSemaphoreFeatureFlagBits 1
  vkExternalSemaphoreFeatureImportableBit* = VkExternalSemaphoreFeatureFlagBits 2
type VkSemaphoreImportFlagBits* = distinct cint
proc `==`*(x, y: VkSemaphoreImportFlagBits): bool {.borrow.}
proc `-`*(x: VkSemaphoreImportFlagBits): VkSemaphoreImportFlagBits {.borrow.}
proc `-`*(x, y: VkSemaphoreImportFlagBits): VkSemaphoreImportFlagBits {.borrow.}
proc `+`*(x, y: VkSemaphoreImportFlagBits): VkSemaphoreImportFlagBits {.borrow.}
proc `+`*(x: VkSemaphoreImportFlagBits, y: int): VkSemaphoreImportFlagBits {.used.} = x + VkSemaphoreImportFlagBits(y)

const
  vkSemaphoreImportTemporaryBit* = VkSemaphoreImportFlagBits 1
type VkExternalFenceHandleTypeFlagBits* = distinct cint
proc `==`*(x, y: VkExternalFenceHandleTypeFlagBits): bool {.borrow.}
proc `-`*(x: VkExternalFenceHandleTypeFlagBits): VkExternalFenceHandleTypeFlagBits {.borrow.}
proc `-`*(x, y: VkExternalFenceHandleTypeFlagBits): VkExternalFenceHandleTypeFlagBits {.borrow.}
proc `+`*(x, y: VkExternalFenceHandleTypeFlagBits): VkExternalFenceHandleTypeFlagBits {.borrow.}
proc `+`*(x: VkExternalFenceHandleTypeFlagBits, y: int): VkExternalFenceHandleTypeFlagBits {.used.} = x + VkExternalFenceHandleTypeFlagBits(y)

const
  vkExternalFenceHandleTypeOpaqueFdBit* = VkExternalFenceHandleTypeFlagBits 1
  vkExternalFenceHandleTypeOpaqueWin32Bit* = VkExternalFenceHandleTypeFlagBits 2
  vkExternalFenceHandleTypeOpaqueWin32KmtBit* = VkExternalFenceHandleTypeFlagBits 4
  vkExternalFenceHandleTypeSyncFdBit* = VkExternalFenceHandleTypeFlagBits 8
  vkExternalFenceHandleTypeReserved4BitNv* = VkExternalFenceHandleTypeFlagBits 16
  vkExternalFenceHandleTypeReserved5BitNv* = VkExternalFenceHandleTypeFlagBits 32
type VkExternalFenceFeatureFlagBits* = distinct cint
proc `==`*(x, y: VkExternalFenceFeatureFlagBits): bool {.borrow.}
proc `-`*(x: VkExternalFenceFeatureFlagBits): VkExternalFenceFeatureFlagBits {.borrow.}
proc `-`*(x, y: VkExternalFenceFeatureFlagBits): VkExternalFenceFeatureFlagBits {.borrow.}
proc `+`*(x, y: VkExternalFenceFeatureFlagBits): VkExternalFenceFeatureFlagBits {.borrow.}
proc `+`*(x: VkExternalFenceFeatureFlagBits, y: int): VkExternalFenceFeatureFlagBits {.used.} = x + VkExternalFenceFeatureFlagBits(y)

const
  vkExternalFenceFeatureExportableBit* = VkExternalFenceFeatureFlagBits 1
  vkExternalFenceFeatureImportableBit* = VkExternalFenceFeatureFlagBits 2
type VkFenceImportFlagBits* = distinct cint
proc `==`*(x, y: VkFenceImportFlagBits): bool {.borrow.}
proc `-`*(x: VkFenceImportFlagBits): VkFenceImportFlagBits {.borrow.}
proc `-`*(x, y: VkFenceImportFlagBits): VkFenceImportFlagBits {.borrow.}
proc `+`*(x, y: VkFenceImportFlagBits): VkFenceImportFlagBits {.borrow.}
proc `+`*(x: VkFenceImportFlagBits, y: int): VkFenceImportFlagBits {.used.} = x + VkFenceImportFlagBits(y)

const
  vkFenceImportTemporaryBit* = VkFenceImportFlagBits 1
type VkSurfaceCounterFlagBitsEXT* = distinct cint
proc `==`*(x, y: VkSurfaceCounterFlagBitsEXT): bool {.borrow.}
proc `-`*(x: VkSurfaceCounterFlagBitsEXT): VkSurfaceCounterFlagBitsEXT {.borrow.}
proc `-`*(x, y: VkSurfaceCounterFlagBitsEXT): VkSurfaceCounterFlagBitsEXT {.borrow.}
proc `+`*(x, y: VkSurfaceCounterFlagBitsEXT): VkSurfaceCounterFlagBitsEXT {.borrow.}
proc `+`*(x: VkSurfaceCounterFlagBitsEXT, y: int): VkSurfaceCounterFlagBitsEXT {.used.} = x + VkSurfaceCounterFlagBitsEXT(y)

const
  vkSurfaceCounterVblankBitExt* = VkSurfaceCounterFlagBitsEXT 1
type VkDisplayPowerStateEXT* = distinct cint
proc `==`*(x, y: VkDisplayPowerStateEXT): bool {.borrow.}
proc `-`*(x: VkDisplayPowerStateEXT): VkDisplayPowerStateEXT {.borrow.}
proc `-`*(x, y: VkDisplayPowerStateEXT): VkDisplayPowerStateEXT {.borrow.}
proc `+`*(x, y: VkDisplayPowerStateEXT): VkDisplayPowerStateEXT {.borrow.}
proc `+`*(x: VkDisplayPowerStateEXT, y: int): VkDisplayPowerStateEXT {.used.} = x + VkDisplayPowerStateEXT(y)

const
  vkDisplayPowerStateOffExt* = VkDisplayPowerStateEXT 0
  vkDisplayPowerStateSuspendExt* = VkDisplayPowerStateEXT 1
  vkDisplayPowerStateOnExt* = VkDisplayPowerStateEXT 2
type VkDeviceEventTypeEXT* = distinct cint
proc `==`*(x, y: VkDeviceEventTypeEXT): bool {.borrow.}
proc `-`*(x: VkDeviceEventTypeEXT): VkDeviceEventTypeEXT {.borrow.}
proc `-`*(x, y: VkDeviceEventTypeEXT): VkDeviceEventTypeEXT {.borrow.}
proc `+`*(x, y: VkDeviceEventTypeEXT): VkDeviceEventTypeEXT {.borrow.}
proc `+`*(x: VkDeviceEventTypeEXT, y: int): VkDeviceEventTypeEXT {.used.} = x + VkDeviceEventTypeEXT(y)

const
  vkDeviceEventTypeDisplayHotplugExt* = VkDeviceEventTypeEXT 0
type VkDisplayEventTypeEXT* = distinct cint
proc `==`*(x, y: VkDisplayEventTypeEXT): bool {.borrow.}
proc `-`*(x: VkDisplayEventTypeEXT): VkDisplayEventTypeEXT {.borrow.}
proc `-`*(x, y: VkDisplayEventTypeEXT): VkDisplayEventTypeEXT {.borrow.}
proc `+`*(x, y: VkDisplayEventTypeEXT): VkDisplayEventTypeEXT {.borrow.}
proc `+`*(x: VkDisplayEventTypeEXT, y: int): VkDisplayEventTypeEXT {.used.} = x + VkDisplayEventTypeEXT(y)

const
  vkDisplayEventTypeFirstPixelOutExt* = VkDisplayEventTypeEXT 0
type VkPeerMemoryFeatureFlagBits* = distinct cint
proc `==`*(x, y: VkPeerMemoryFeatureFlagBits): bool {.borrow.}
proc `-`*(x: VkPeerMemoryFeatureFlagBits): VkPeerMemoryFeatureFlagBits {.borrow.}
proc `-`*(x, y: VkPeerMemoryFeatureFlagBits): VkPeerMemoryFeatureFlagBits {.borrow.}
proc `+`*(x, y: VkPeerMemoryFeatureFlagBits): VkPeerMemoryFeatureFlagBits {.borrow.}
proc `+`*(x: VkPeerMemoryFeatureFlagBits, y: int): VkPeerMemoryFeatureFlagBits {.used.} = x + VkPeerMemoryFeatureFlagBits(y)

const
  vkPeerMemoryFeatureCopySrcBit* = VkPeerMemoryFeatureFlagBits 1
  vkPeerMemoryFeatureCopyDstBit* = VkPeerMemoryFeatureFlagBits 2
  vkPeerMemoryFeatureGenericSrcBit* = VkPeerMemoryFeatureFlagBits 4
  vkPeerMemoryFeatureGenericDstBit* = VkPeerMemoryFeatureFlagBits 8
type VkMemoryAllocateFlagBits* = distinct cint
proc `==`*(x, y: VkMemoryAllocateFlagBits): bool {.borrow.}
proc `-`*(x: VkMemoryAllocateFlagBits): VkMemoryAllocateFlagBits {.borrow.}
proc `-`*(x, y: VkMemoryAllocateFlagBits): VkMemoryAllocateFlagBits {.borrow.}
proc `+`*(x, y: VkMemoryAllocateFlagBits): VkMemoryAllocateFlagBits {.borrow.}
proc `+`*(x: VkMemoryAllocateFlagBits, y: int): VkMemoryAllocateFlagBits {.used.} = x + VkMemoryAllocateFlagBits(y)

const
  vkMemoryAllocateDeviceMaskBit* = VkMemoryAllocateFlagBits 1
  vkMemoryAllocateDeviceAddressBit* = VkMemoryAllocateFlagBits 2
  vkMemoryAllocateDeviceAddressCaptureReplayBit* = VkMemoryAllocateFlagBits 4
type VkDeviceGroupPresentModeFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkDeviceGroupPresentModeFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkDeviceGroupPresentModeFlagBitsKHR): VkDeviceGroupPresentModeFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkDeviceGroupPresentModeFlagBitsKHR): VkDeviceGroupPresentModeFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkDeviceGroupPresentModeFlagBitsKHR): VkDeviceGroupPresentModeFlagBitsKHR {.borrow.}
proc `+`*(x: VkDeviceGroupPresentModeFlagBitsKHR, y: int): VkDeviceGroupPresentModeFlagBitsKHR {.used.} = x + VkDeviceGroupPresentModeFlagBitsKHR(y)

const
  vkDeviceGroupPresentModeLocalBitKhr* = VkDeviceGroupPresentModeFlagBitsKHR 1
  vkDeviceGroupPresentModeRemoteBitKhr* = VkDeviceGroupPresentModeFlagBitsKHR 2
  vkDeviceGroupPresentModeSumBitKhr* = VkDeviceGroupPresentModeFlagBitsKHR 4
  vkDeviceGroupPresentModeLocalMultiDeviceBitKhr* = VkDeviceGroupPresentModeFlagBitsKHR 8
type VkSwapchainCreateFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkSwapchainCreateFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkSwapchainCreateFlagBitsKHR): VkSwapchainCreateFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkSwapchainCreateFlagBitsKHR): VkSwapchainCreateFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkSwapchainCreateFlagBitsKHR): VkSwapchainCreateFlagBitsKHR {.borrow.}
proc `+`*(x: VkSwapchainCreateFlagBitsKHR, y: int): VkSwapchainCreateFlagBitsKHR {.used.} = x + VkSwapchainCreateFlagBitsKHR(y)

const
  vkSwapchainCreateSplitInstanceBindRegionsBitKhr* = VkSwapchainCreateFlagBitsKHR 1
  vkSwapchainCreateProtectedBitKhr* = VkSwapchainCreateFlagBitsKHR 2
  vkSwapchainCreateMutableFormatBitKhr* = VkSwapchainCreateFlagBitsKHR 4
type VkViewportCoordinateSwizzleNV* = distinct cint
proc `==`*(x, y: VkViewportCoordinateSwizzleNV): bool {.borrow.}
proc `-`*(x: VkViewportCoordinateSwizzleNV): VkViewportCoordinateSwizzleNV {.borrow.}
proc `-`*(x, y: VkViewportCoordinateSwizzleNV): VkViewportCoordinateSwizzleNV {.borrow.}
proc `+`*(x, y: VkViewportCoordinateSwizzleNV): VkViewportCoordinateSwizzleNV {.borrow.}
proc `+`*(x: VkViewportCoordinateSwizzleNV, y: int): VkViewportCoordinateSwizzleNV {.used.} = x + VkViewportCoordinateSwizzleNV(y)

const
  vkViewportCoordinateSwizzlePositiveXNv* = VkViewportCoordinateSwizzleNV 0
  vkViewportCoordinateSwizzleNegativeXNv* = VkViewportCoordinateSwizzleNV 1
  vkViewportCoordinateSwizzlePositiveYNv* = VkViewportCoordinateSwizzleNV 2
  vkViewportCoordinateSwizzleNegativeYNv* = VkViewportCoordinateSwizzleNV 3
  vkViewportCoordinateSwizzlePositiveZNv* = VkViewportCoordinateSwizzleNV 4
  vkViewportCoordinateSwizzleNegativeZNv* = VkViewportCoordinateSwizzleNV 5
  vkViewportCoordinateSwizzlePositiveWNv* = VkViewportCoordinateSwizzleNV 6
  vkViewportCoordinateSwizzleNegativeWNv* = VkViewportCoordinateSwizzleNV 7
type VkDiscardRectangleModeEXT* = distinct cint
proc `==`*(x, y: VkDiscardRectangleModeEXT): bool {.borrow.}
proc `-`*(x: VkDiscardRectangleModeEXT): VkDiscardRectangleModeEXT {.borrow.}
proc `-`*(x, y: VkDiscardRectangleModeEXT): VkDiscardRectangleModeEXT {.borrow.}
proc `+`*(x, y: VkDiscardRectangleModeEXT): VkDiscardRectangleModeEXT {.borrow.}
proc `+`*(x: VkDiscardRectangleModeEXT, y: int): VkDiscardRectangleModeEXT {.used.} = x + VkDiscardRectangleModeEXT(y)

const
  vkDiscardRectangleModeInclusiveExt* = VkDiscardRectangleModeEXT 0
  vkDiscardRectangleModeExclusiveExt* = VkDiscardRectangleModeEXT 1
type VkSubpassDescriptionFlagBits* = distinct cint
proc `==`*(x, y: VkSubpassDescriptionFlagBits): bool {.borrow.}
proc `-`*(x: VkSubpassDescriptionFlagBits): VkSubpassDescriptionFlagBits {.borrow.}
proc `-`*(x, y: VkSubpassDescriptionFlagBits): VkSubpassDescriptionFlagBits {.borrow.}
proc `+`*(x, y: VkSubpassDescriptionFlagBits): VkSubpassDescriptionFlagBits {.borrow.}
proc `+`*(x: VkSubpassDescriptionFlagBits, y: int): VkSubpassDescriptionFlagBits {.used.} = x + VkSubpassDescriptionFlagBits(y)

const
  vkSubpassDescriptionPerViewAttributesBitNvx* = VkSubpassDescriptionFlagBits 1
  vkSubpassDescriptionPerViewPositionXOnlyBitNvx* = VkSubpassDescriptionFlagBits 2
  vkSubpassDescriptionFragmentRegionBitQcom* = VkSubpassDescriptionFlagBits 4
  vkSubpassDescriptionShaderResolveBitQcom* = VkSubpassDescriptionFlagBits 8
type VkPointClippingBehavior* = distinct cint
proc `==`*(x, y: VkPointClippingBehavior): bool {.borrow.}
proc `-`*(x: VkPointClippingBehavior): VkPointClippingBehavior {.borrow.}
proc `-`*(x, y: VkPointClippingBehavior): VkPointClippingBehavior {.borrow.}
proc `+`*(x, y: VkPointClippingBehavior): VkPointClippingBehavior {.borrow.}
proc `+`*(x: VkPointClippingBehavior, y: int): VkPointClippingBehavior {.used.} = x + VkPointClippingBehavior(y)

const
  vkPointClippingBehaviorAllClipPlanes* = VkPointClippingBehavior 0
  vkPointClippingBehaviorUserClipPlanesOnly* = VkPointClippingBehavior 1
type VkSamplerReductionMode* = distinct cint
proc `==`*(x, y: VkSamplerReductionMode): bool {.borrow.}
proc `-`*(x: VkSamplerReductionMode): VkSamplerReductionMode {.borrow.}
proc `-`*(x, y: VkSamplerReductionMode): VkSamplerReductionMode {.borrow.}
proc `+`*(x, y: VkSamplerReductionMode): VkSamplerReductionMode {.borrow.}
proc `+`*(x: VkSamplerReductionMode, y: int): VkSamplerReductionMode {.used.} = x + VkSamplerReductionMode(y)

const
  vkSamplerReductionModeWeightedAverage* = VkSamplerReductionMode 0
  vkSamplerReductionModeMin* = VkSamplerReductionMode 1
  vkSamplerReductionModeMax* = VkSamplerReductionMode 2
type VkTessellationDomainOrigin* = distinct cint
proc `==`*(x, y: VkTessellationDomainOrigin): bool {.borrow.}
proc `-`*(x: VkTessellationDomainOrigin): VkTessellationDomainOrigin {.borrow.}
proc `-`*(x, y: VkTessellationDomainOrigin): VkTessellationDomainOrigin {.borrow.}
proc `+`*(x, y: VkTessellationDomainOrigin): VkTessellationDomainOrigin {.borrow.}
proc `+`*(x: VkTessellationDomainOrigin, y: int): VkTessellationDomainOrigin {.used.} = x + VkTessellationDomainOrigin(y)

const
  vkTessellationDomainOriginUpperLeft* = VkTessellationDomainOrigin 0
  vkTessellationDomainOriginLowerLeft* = VkTessellationDomainOrigin 1
type VkSamplerYcbcrModelConversion* = distinct cint
proc `==`*(x, y: VkSamplerYcbcrModelConversion): bool {.borrow.}
proc `-`*(x: VkSamplerYcbcrModelConversion): VkSamplerYcbcrModelConversion {.borrow.}
proc `-`*(x, y: VkSamplerYcbcrModelConversion): VkSamplerYcbcrModelConversion {.borrow.}
proc `+`*(x, y: VkSamplerYcbcrModelConversion): VkSamplerYcbcrModelConversion {.borrow.}
proc `+`*(x: VkSamplerYcbcrModelConversion, y: int): VkSamplerYcbcrModelConversion {.used.} = x + VkSamplerYcbcrModelConversion(y)

const
  vkSamplerYcbcrModelConversionRgbIdentity* = VkSamplerYcbcrModelConversion 0
  vkSamplerYcbcrModelConversionYcbcrIdentity* = VkSamplerYcbcrModelConversion 1
  vkSamplerYcbcrModelConversionYcbcr709* = VkSamplerYcbcrModelConversion 2
  vkSamplerYcbcrModelConversionYcbcr601* = VkSamplerYcbcrModelConversion 3
  vkSamplerYcbcrModelConversionYcbcr2020* = VkSamplerYcbcrModelConversion 4
type VkSamplerYcbcrRange* = distinct cint
proc `==`*(x, y: VkSamplerYcbcrRange): bool {.borrow.}
proc `-`*(x: VkSamplerYcbcrRange): VkSamplerYcbcrRange {.borrow.}
proc `-`*(x, y: VkSamplerYcbcrRange): VkSamplerYcbcrRange {.borrow.}
proc `+`*(x, y: VkSamplerYcbcrRange): VkSamplerYcbcrRange {.borrow.}
proc `+`*(x: VkSamplerYcbcrRange, y: int): VkSamplerYcbcrRange {.used.} = x + VkSamplerYcbcrRange(y)

const
  vkSamplerYcbcrRangeItuFull* = VkSamplerYcbcrRange 0
  vkSamplerYcbcrRangeItuNarrow* = VkSamplerYcbcrRange 1
type VkChromaLocation* = distinct cint
proc `==`*(x, y: VkChromaLocation): bool {.borrow.}
proc `-`*(x: VkChromaLocation): VkChromaLocation {.borrow.}
proc `-`*(x, y: VkChromaLocation): VkChromaLocation {.borrow.}
proc `+`*(x, y: VkChromaLocation): VkChromaLocation {.borrow.}
proc `+`*(x: VkChromaLocation, y: int): VkChromaLocation {.used.} = x + VkChromaLocation(y)

const
  vkChromaLocationCositedEven* = VkChromaLocation 0
  vkChromaLocationMidpoint* = VkChromaLocation 1
type VkBlendOverlapEXT* = distinct cint
proc `==`*(x, y: VkBlendOverlapEXT): bool {.borrow.}
proc `-`*(x: VkBlendOverlapEXT): VkBlendOverlapEXT {.borrow.}
proc `-`*(x, y: VkBlendOverlapEXT): VkBlendOverlapEXT {.borrow.}
proc `+`*(x, y: VkBlendOverlapEXT): VkBlendOverlapEXT {.borrow.}
proc `+`*(x: VkBlendOverlapEXT, y: int): VkBlendOverlapEXT {.used.} = x + VkBlendOverlapEXT(y)

const
  vkBlendOverlapUncorrelatedExt* = VkBlendOverlapEXT 0
  vkBlendOverlapDisjointExt* = VkBlendOverlapEXT 1
  vkBlendOverlapConjointExt* = VkBlendOverlapEXT 2
type VkCoverageModulationModeNV* = distinct cint
proc `==`*(x, y: VkCoverageModulationModeNV): bool {.borrow.}
proc `-`*(x: VkCoverageModulationModeNV): VkCoverageModulationModeNV {.borrow.}
proc `-`*(x, y: VkCoverageModulationModeNV): VkCoverageModulationModeNV {.borrow.}
proc `+`*(x, y: VkCoverageModulationModeNV): VkCoverageModulationModeNV {.borrow.}
proc `+`*(x: VkCoverageModulationModeNV, y: int): VkCoverageModulationModeNV {.used.} = x + VkCoverageModulationModeNV(y)

const
  vkCoverageModulationModeNoneNv* = VkCoverageModulationModeNV 0
  vkCoverageModulationModeRgbNv* = VkCoverageModulationModeNV 1
  vkCoverageModulationModeAlphaNv* = VkCoverageModulationModeNV 2
  vkCoverageModulationModeRgbaNv* = VkCoverageModulationModeNV 3
type VkCoverageReductionModeNV* = distinct cint
proc `==`*(x, y: VkCoverageReductionModeNV): bool {.borrow.}
proc `-`*(x: VkCoverageReductionModeNV): VkCoverageReductionModeNV {.borrow.}
proc `-`*(x, y: VkCoverageReductionModeNV): VkCoverageReductionModeNV {.borrow.}
proc `+`*(x, y: VkCoverageReductionModeNV): VkCoverageReductionModeNV {.borrow.}
proc `+`*(x: VkCoverageReductionModeNV, y: int): VkCoverageReductionModeNV {.used.} = x + VkCoverageReductionModeNV(y)

const
  vkCoverageReductionModeMergeNv* = VkCoverageReductionModeNV 0
  vkCoverageReductionModeTruncateNv* = VkCoverageReductionModeNV 1
type VkValidationCacheHeaderVersionEXT* = distinct cint
proc `==`*(x, y: VkValidationCacheHeaderVersionEXT): bool {.borrow.}
proc `-`*(x: VkValidationCacheHeaderVersionEXT): VkValidationCacheHeaderVersionEXT {.borrow.}
proc `-`*(x, y: VkValidationCacheHeaderVersionEXT): VkValidationCacheHeaderVersionEXT {.borrow.}
proc `+`*(x, y: VkValidationCacheHeaderVersionEXT): VkValidationCacheHeaderVersionEXT {.borrow.}
proc `+`*(x: VkValidationCacheHeaderVersionEXT, y: int): VkValidationCacheHeaderVersionEXT {.used.} = x + VkValidationCacheHeaderVersionEXT(y)

const
  vkValidationCacheHeaderVersionOneExt* = VkValidationCacheHeaderVersionEXT 1
type VkShaderInfoTypeAMD* = distinct cint
proc `==`*(x, y: VkShaderInfoTypeAMD): bool {.borrow.}
proc `-`*(x: VkShaderInfoTypeAMD): VkShaderInfoTypeAMD {.borrow.}
proc `-`*(x, y: VkShaderInfoTypeAMD): VkShaderInfoTypeAMD {.borrow.}
proc `+`*(x, y: VkShaderInfoTypeAMD): VkShaderInfoTypeAMD {.borrow.}
proc `+`*(x: VkShaderInfoTypeAMD, y: int): VkShaderInfoTypeAMD {.used.} = x + VkShaderInfoTypeAMD(y)

const
  vkShaderInfoTypeStatisticsAmd* = VkShaderInfoTypeAMD 0
  vkShaderInfoTypeBinaryAmd* = VkShaderInfoTypeAMD 1
  vkShaderInfoTypeDisassemblyAmd* = VkShaderInfoTypeAMD 2
type VkQueueGlobalPriorityEXT* = distinct cint
proc `==`*(x, y: VkQueueGlobalPriorityEXT): bool {.borrow.}
proc `-`*(x: VkQueueGlobalPriorityEXT): VkQueueGlobalPriorityEXT {.borrow.}
proc `-`*(x, y: VkQueueGlobalPriorityEXT): VkQueueGlobalPriorityEXT {.borrow.}
proc `+`*(x, y: VkQueueGlobalPriorityEXT): VkQueueGlobalPriorityEXT {.borrow.}
proc `+`*(x: VkQueueGlobalPriorityEXT, y: int): VkQueueGlobalPriorityEXT {.used.} = x + VkQueueGlobalPriorityEXT(y)

const
  vkQueueGlobalPriorityLowExt* = VkQueueGlobalPriorityEXT 128
  vkQueueGlobalPriorityMediumExt* = VkQueueGlobalPriorityEXT 256
  vkQueueGlobalPriorityHighExt* = VkQueueGlobalPriorityEXT 512
  vkQueueGlobalPriorityRealtimeExt* = VkQueueGlobalPriorityEXT 1024
type VkDebugUtilsMessageSeverityFlagBitsEXT* = distinct cint
proc `==`*(x, y: VkDebugUtilsMessageSeverityFlagBitsEXT): bool {.borrow.}
proc `-`*(x: VkDebugUtilsMessageSeverityFlagBitsEXT): VkDebugUtilsMessageSeverityFlagBitsEXT {.borrow.}
proc `-`*(x, y: VkDebugUtilsMessageSeverityFlagBitsEXT): VkDebugUtilsMessageSeverityFlagBitsEXT {.borrow.}
proc `+`*(x, y: VkDebugUtilsMessageSeverityFlagBitsEXT): VkDebugUtilsMessageSeverityFlagBitsEXT {.borrow.}
proc `+`*(x: VkDebugUtilsMessageSeverityFlagBitsEXT, y: int): VkDebugUtilsMessageSeverityFlagBitsEXT {.used.} = x + VkDebugUtilsMessageSeverityFlagBitsEXT(y)

const
  vkDebugUtilsMessageSeverityVerboseBitExt* = VkDebugUtilsMessageSeverityFlagBitsEXT 1
  vkDebugUtilsMessageSeverityInfoBitExt* = VkDebugUtilsMessageSeverityFlagBitsEXT 16
  vkDebugUtilsMessageSeverityWarningBitExt* = VkDebugUtilsMessageSeverityFlagBitsEXT 256
  vkDebugUtilsMessageSeverityErrorBitExt* = VkDebugUtilsMessageSeverityFlagBitsEXT 4096
type VkDebugUtilsMessageTypeFlagBitsEXT* = distinct cint
proc `==`*(x, y: VkDebugUtilsMessageTypeFlagBitsEXT): bool {.borrow.}
proc `-`*(x: VkDebugUtilsMessageTypeFlagBitsEXT): VkDebugUtilsMessageTypeFlagBitsEXT {.borrow.}
proc `-`*(x, y: VkDebugUtilsMessageTypeFlagBitsEXT): VkDebugUtilsMessageTypeFlagBitsEXT {.borrow.}
proc `+`*(x, y: VkDebugUtilsMessageTypeFlagBitsEXT): VkDebugUtilsMessageTypeFlagBitsEXT {.borrow.}
proc `+`*(x: VkDebugUtilsMessageTypeFlagBitsEXT, y: int): VkDebugUtilsMessageTypeFlagBitsEXT {.used.} = x + VkDebugUtilsMessageTypeFlagBitsEXT(y)

const
  vkDebugUtilsMessageTypeGeneralBitExt* = VkDebugUtilsMessageTypeFlagBitsEXT 1
  vkDebugUtilsMessageTypeValidationBitExt* = VkDebugUtilsMessageTypeFlagBitsEXT 2
  vkDebugUtilsMessageTypePerformanceBitExt* = VkDebugUtilsMessageTypeFlagBitsEXT 4
type VkConservativeRasterizationModeEXT* = distinct cint
proc `==`*(x, y: VkConservativeRasterizationModeEXT): bool {.borrow.}
proc `-`*(x: VkConservativeRasterizationModeEXT): VkConservativeRasterizationModeEXT {.borrow.}
proc `-`*(x, y: VkConservativeRasterizationModeEXT): VkConservativeRasterizationModeEXT {.borrow.}
proc `+`*(x, y: VkConservativeRasterizationModeEXT): VkConservativeRasterizationModeEXT {.borrow.}
proc `+`*(x: VkConservativeRasterizationModeEXT, y: int): VkConservativeRasterizationModeEXT {.used.} = x + VkConservativeRasterizationModeEXT(y)

const
  vkConservativeRasterizationModeDisabledExt* = VkConservativeRasterizationModeEXT 0
  vkConservativeRasterizationModeOverestimateExt* = VkConservativeRasterizationModeEXT 1
  vkConservativeRasterizationModeUnderestimateExt* = VkConservativeRasterizationModeEXT 2
type VkDescriptorBindingFlagBits* = distinct cint
proc `==`*(x, y: VkDescriptorBindingFlagBits): bool {.borrow.}
proc `-`*(x: VkDescriptorBindingFlagBits): VkDescriptorBindingFlagBits {.borrow.}
proc `-`*(x, y: VkDescriptorBindingFlagBits): VkDescriptorBindingFlagBits {.borrow.}
proc `+`*(x, y: VkDescriptorBindingFlagBits): VkDescriptorBindingFlagBits {.borrow.}
proc `+`*(x: VkDescriptorBindingFlagBits, y: int): VkDescriptorBindingFlagBits {.used.} = x + VkDescriptorBindingFlagBits(y)

const
  vkDescriptorBindingUpdateAfterBindBit* = VkDescriptorBindingFlagBits 1
  vkDescriptorBindingUpdateUnusedWhilePendingBit* = VkDescriptorBindingFlagBits 2
  vkDescriptorBindingPartiallyBoundBit* = VkDescriptorBindingFlagBits 4
  vkDescriptorBindingVariableDescriptorCountBit* = VkDescriptorBindingFlagBits 8
  vkDescriptorBindingReserved4BitQcom* = VkDescriptorBindingFlagBits 16
type VkVendorId* = distinct cint
proc `==`*(x, y: VkVendorId): bool {.borrow.}
proc `-`*(x: VkVendorId): VkVendorId {.borrow.}
proc `-`*(x, y: VkVendorId): VkVendorId {.borrow.}
proc `+`*(x, y: VkVendorId): VkVendorId {.borrow.}
proc `+`*(x: VkVendorId, y: int): VkVendorId {.used.} = x + VkVendorId(y)

const
  vkVendorIdViv* = VkVendorId 65537
  vkVendorIdVsi* = VkVendorId 65538
  vkVendorIdKazan* = VkVendorId 65539
  vkVendorIdCodeplay* = VkVendorId 65540
  vkVendorIdMesa* = VkVendorId 65541
  vkVendorIdPocl* = VkVendorId 65542
type VkDriverId* = distinct cint
proc `==`*(x, y: VkDriverId): bool {.borrow.}
proc `-`*(x: VkDriverId): VkDriverId {.borrow.}
proc `-`*(x, y: VkDriverId): VkDriverId {.borrow.}
proc `+`*(x, y: VkDriverId): VkDriverId {.borrow.}
proc `+`*(x: VkDriverId, y: int): VkDriverId {.used.} = x + VkDriverId(y)

const
  vkDriverIdAmdProprietary* = VkDriverId 1
  vkDriverIdAmdOpenSource* = VkDriverId 2
  vkDriverIdMesaRadv* = VkDriverId 3
  vkDriverIdNvidiaProprietary* = VkDriverId 4
  vkDriverIdIntelProprietaryWindows* = VkDriverId 5
  vkDriverIdIntelOpenSourceMesa* = VkDriverId 6
  vkDriverIdImaginationProprietary* = VkDriverId 7
  vkDriverIdQualcommProprietary* = VkDriverId 8
  vkDriverIdArmProprietary* = VkDriverId 9
  vkDriverIdGoogleSwiftshader* = VkDriverId 10
  vkDriverIdGgpProprietary* = VkDriverId 11
  vkDriverIdBroadcomProprietary* = VkDriverId 12
  vkDriverIdMesaLlvmpipe* = VkDriverId 13
  vkDriverIdMoltenvk* = VkDriverId 14
type VkConditionalRenderingFlagBitsEXT* = distinct cint
proc `==`*(x, y: VkConditionalRenderingFlagBitsEXT): bool {.borrow.}
proc `-`*(x: VkConditionalRenderingFlagBitsEXT): VkConditionalRenderingFlagBitsEXT {.borrow.}
proc `-`*(x, y: VkConditionalRenderingFlagBitsEXT): VkConditionalRenderingFlagBitsEXT {.borrow.}
proc `+`*(x, y: VkConditionalRenderingFlagBitsEXT): VkConditionalRenderingFlagBitsEXT {.borrow.}
proc `+`*(x: VkConditionalRenderingFlagBitsEXT, y: int): VkConditionalRenderingFlagBitsEXT {.used.} = x + VkConditionalRenderingFlagBitsEXT(y)

const
  vkConditionalRenderingInvertedBitExt* = VkConditionalRenderingFlagBitsEXT 1
type VkResolveModeFlagBits* = distinct cint
proc `==`*(x, y: VkResolveModeFlagBits): bool {.borrow.}
proc `-`*(x: VkResolveModeFlagBits): VkResolveModeFlagBits {.borrow.}
proc `-`*(x, y: VkResolveModeFlagBits): VkResolveModeFlagBits {.borrow.}
proc `+`*(x, y: VkResolveModeFlagBits): VkResolveModeFlagBits {.borrow.}
proc `+`*(x: VkResolveModeFlagBits, y: int): VkResolveModeFlagBits {.used.} = x + VkResolveModeFlagBits(y)

const
  vkResolveModeNone* = VkResolveModeFlagBits 0
  vkResolveModeSampleZeroBit* = VkResolveModeFlagBits 1
  vkResolveModeAverageBit* = VkResolveModeFlagBits 2
  vkResolveModeMinBit* = VkResolveModeFlagBits 4
  vkResolveModeMaxBit* = VkResolveModeFlagBits 8
type VkShadingRatePaletteEntryNV* = distinct cint
proc `==`*(x, y: VkShadingRatePaletteEntryNV): bool {.borrow.}
proc `-`*(x: VkShadingRatePaletteEntryNV): VkShadingRatePaletteEntryNV {.borrow.}
proc `-`*(x, y: VkShadingRatePaletteEntryNV): VkShadingRatePaletteEntryNV {.borrow.}
proc `+`*(x, y: VkShadingRatePaletteEntryNV): VkShadingRatePaletteEntryNV {.borrow.}
proc `+`*(x: VkShadingRatePaletteEntryNV, y: int): VkShadingRatePaletteEntryNV {.used.} = x + VkShadingRatePaletteEntryNV(y)

const
  vkShadingRatePaletteEntryNoInvocationsNv* = VkShadingRatePaletteEntryNV 0
  vkShadingRatePaletteEntry16InvocationsPerPixelNv* = VkShadingRatePaletteEntryNV 1
  vkShadingRatePaletteEntry8InvocationsPerPixelNv* = VkShadingRatePaletteEntryNV 2
  vkShadingRatePaletteEntry4InvocationsPerPixelNv* = VkShadingRatePaletteEntryNV 3
  vkShadingRatePaletteEntry2InvocationsPerPixelNv* = VkShadingRatePaletteEntryNV 4
  vkShadingRatePaletteEntry1InvocationPerPixelNv* = VkShadingRatePaletteEntryNV 5
  vkShadingRatePaletteEntry1InvocationPer2x1PixelsNv* = VkShadingRatePaletteEntryNV 6
  vkShadingRatePaletteEntry1InvocationPer1x2PixelsNv* = VkShadingRatePaletteEntryNV 7
  vkShadingRatePaletteEntry1InvocationPer2x2PixelsNv* = VkShadingRatePaletteEntryNV 8
  vkShadingRatePaletteEntry1InvocationPer4x2PixelsNv* = VkShadingRatePaletteEntryNV 9
  vkShadingRatePaletteEntry1InvocationPer2x4PixelsNv* = VkShadingRatePaletteEntryNV 10
  vkShadingRatePaletteEntry1InvocationPer4x4PixelsNv* = VkShadingRatePaletteEntryNV 11
type VkCoarseSampleOrderTypeNV* = distinct cint
proc `==`*(x, y: VkCoarseSampleOrderTypeNV): bool {.borrow.}
proc `-`*(x: VkCoarseSampleOrderTypeNV): VkCoarseSampleOrderTypeNV {.borrow.}
proc `-`*(x, y: VkCoarseSampleOrderTypeNV): VkCoarseSampleOrderTypeNV {.borrow.}
proc `+`*(x, y: VkCoarseSampleOrderTypeNV): VkCoarseSampleOrderTypeNV {.borrow.}
proc `+`*(x: VkCoarseSampleOrderTypeNV, y: int): VkCoarseSampleOrderTypeNV {.used.} = x + VkCoarseSampleOrderTypeNV(y)

const
  vkCoarseSampleOrderTypeDefaultNv* = VkCoarseSampleOrderTypeNV 0
  vkCoarseSampleOrderTypeCustomNv* = VkCoarseSampleOrderTypeNV 1
  vkCoarseSampleOrderTypePixelMajorNv* = VkCoarseSampleOrderTypeNV 2
  vkCoarseSampleOrderTypeSampleMajorNv* = VkCoarseSampleOrderTypeNV 3
type VkGeometryInstanceFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkGeometryInstanceFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkGeometryInstanceFlagBitsKHR): VkGeometryInstanceFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkGeometryInstanceFlagBitsKHR): VkGeometryInstanceFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkGeometryInstanceFlagBitsKHR): VkGeometryInstanceFlagBitsKHR {.borrow.}
proc `+`*(x: VkGeometryInstanceFlagBitsKHR, y: int): VkGeometryInstanceFlagBitsKHR {.used.} = x + VkGeometryInstanceFlagBitsKHR(y)

const
  vkGeometryInstanceTriangleFacingCullDisableBitKhr* = VkGeometryInstanceFlagBitsKHR 1
  vkGeometryInstanceTriangleFrontCounterclockwiseBitKhr* = VkGeometryInstanceFlagBitsKHR 2
  vkGeometryInstanceForceOpaqueBitKhr* = VkGeometryInstanceFlagBitsKHR 4
  vkGeometryInstanceForceNoOpaqueBitKhr* = VkGeometryInstanceFlagBitsKHR 8
type VkGeometryFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkGeometryFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkGeometryFlagBitsKHR): VkGeometryFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkGeometryFlagBitsKHR): VkGeometryFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkGeometryFlagBitsKHR): VkGeometryFlagBitsKHR {.borrow.}
proc `+`*(x: VkGeometryFlagBitsKHR, y: int): VkGeometryFlagBitsKHR {.used.} = x + VkGeometryFlagBitsKHR(y)

const
  vkGeometryOpaqueBitKhr* = VkGeometryFlagBitsKHR 1
  vkGeometryNoDuplicateAnyHitInvocationBitKhr* = VkGeometryFlagBitsKHR 2
type VkBuildAccelerationStructureFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkBuildAccelerationStructureFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkBuildAccelerationStructureFlagBitsKHR): VkBuildAccelerationStructureFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkBuildAccelerationStructureFlagBitsKHR): VkBuildAccelerationStructureFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkBuildAccelerationStructureFlagBitsKHR): VkBuildAccelerationStructureFlagBitsKHR {.borrow.}
proc `+`*(x: VkBuildAccelerationStructureFlagBitsKHR, y: int): VkBuildAccelerationStructureFlagBitsKHR {.used.} = x + VkBuildAccelerationStructureFlagBitsKHR(y)

const
  vkBuildAccelerationStructureAllowUpdateBitKhr* = VkBuildAccelerationStructureFlagBitsKHR 1
  vkBuildAccelerationStructureAllowCompactionBitKhr* = VkBuildAccelerationStructureFlagBitsKHR 2
  vkBuildAccelerationStructurePreferFastTraceBitKhr* = VkBuildAccelerationStructureFlagBitsKHR 4
  vkBuildAccelerationStructurePreferFastBuildBitKhr* = VkBuildAccelerationStructureFlagBitsKHR 8
  vkBuildAccelerationStructureLowMemoryBitKhr* = VkBuildAccelerationStructureFlagBitsKHR 16
  vkBuildAccelerationStructureReservedBit5Nv* = VkBuildAccelerationStructureFlagBitsKHR 32
type VkAccelerationStructureCreateFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkAccelerationStructureCreateFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkAccelerationStructureCreateFlagBitsKHR): VkAccelerationStructureCreateFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkAccelerationStructureCreateFlagBitsKHR): VkAccelerationStructureCreateFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkAccelerationStructureCreateFlagBitsKHR): VkAccelerationStructureCreateFlagBitsKHR {.borrow.}
proc `+`*(x: VkAccelerationStructureCreateFlagBitsKHR, y: int): VkAccelerationStructureCreateFlagBitsKHR {.used.} = x + VkAccelerationStructureCreateFlagBitsKHR(y)

const
  vkAccelerationStructureCreateDeviceAddressCaptureReplayBitKhr* = VkAccelerationStructureCreateFlagBitsKHR 1
  vkAccelerationStructureCreateReservedBit2Nv* = VkAccelerationStructureCreateFlagBitsKHR 4
type VkCopyAccelerationStructureModeKHR* = distinct cint
proc `==`*(x, y: VkCopyAccelerationStructureModeKHR): bool {.borrow.}
proc `-`*(x: VkCopyAccelerationStructureModeKHR): VkCopyAccelerationStructureModeKHR {.borrow.}
proc `-`*(x, y: VkCopyAccelerationStructureModeKHR): VkCopyAccelerationStructureModeKHR {.borrow.}
proc `+`*(x, y: VkCopyAccelerationStructureModeKHR): VkCopyAccelerationStructureModeKHR {.borrow.}
proc `+`*(x: VkCopyAccelerationStructureModeKHR, y: int): VkCopyAccelerationStructureModeKHR {.used.} = x + VkCopyAccelerationStructureModeKHR(y)

const
  vkCopyAccelerationStructureModeCloneKhr* = VkCopyAccelerationStructureModeKHR 0
  vkCopyAccelerationStructureModeCompactKhr* = VkCopyAccelerationStructureModeKHR 1
  vkCopyAccelerationStructureModeSerializeKhr* = VkCopyAccelerationStructureModeKHR 2
  vkCopyAccelerationStructureModeDeserializeKhr* = VkCopyAccelerationStructureModeKHR 3
type VkBuildAccelerationStructureModeKHR* = distinct cint
proc `==`*(x, y: VkBuildAccelerationStructureModeKHR): bool {.borrow.}
proc `-`*(x: VkBuildAccelerationStructureModeKHR): VkBuildAccelerationStructureModeKHR {.borrow.}
proc `-`*(x, y: VkBuildAccelerationStructureModeKHR): VkBuildAccelerationStructureModeKHR {.borrow.}
proc `+`*(x, y: VkBuildAccelerationStructureModeKHR): VkBuildAccelerationStructureModeKHR {.borrow.}
proc `+`*(x: VkBuildAccelerationStructureModeKHR, y: int): VkBuildAccelerationStructureModeKHR {.used.} = x + VkBuildAccelerationStructureModeKHR(y)

const
  vkBuildAccelerationStructureModeBuildKhr* = VkBuildAccelerationStructureModeKHR 0
  vkBuildAccelerationStructureModeUpdateKhr* = VkBuildAccelerationStructureModeKHR 1
type VkAccelerationStructureTypeKHR* = distinct cint
proc `==`*(x, y: VkAccelerationStructureTypeKHR): bool {.borrow.}
proc `-`*(x: VkAccelerationStructureTypeKHR): VkAccelerationStructureTypeKHR {.borrow.}
proc `-`*(x, y: VkAccelerationStructureTypeKHR): VkAccelerationStructureTypeKHR {.borrow.}
proc `+`*(x, y: VkAccelerationStructureTypeKHR): VkAccelerationStructureTypeKHR {.borrow.}
proc `+`*(x: VkAccelerationStructureTypeKHR, y: int): VkAccelerationStructureTypeKHR {.used.} = x + VkAccelerationStructureTypeKHR(y)

const
  vkAccelerationStructureTypeTopLevelKhr* = VkAccelerationStructureTypeKHR 0
  vkAccelerationStructureTypeBottomLevelKhr* = VkAccelerationStructureTypeKHR 1
  vkAccelerationStructureTypeGenericKhr* = VkAccelerationStructureTypeKHR 2
type VkGeometryTypeKHR* = distinct cint
proc `==`*(x, y: VkGeometryTypeKHR): bool {.borrow.}
proc `-`*(x: VkGeometryTypeKHR): VkGeometryTypeKHR {.borrow.}
proc `-`*(x, y: VkGeometryTypeKHR): VkGeometryTypeKHR {.borrow.}
proc `+`*(x, y: VkGeometryTypeKHR): VkGeometryTypeKHR {.borrow.}
proc `+`*(x: VkGeometryTypeKHR, y: int): VkGeometryTypeKHR {.used.} = x + VkGeometryTypeKHR(y)

const
  vkGeometryTypeTrianglesKhr* = VkGeometryTypeKHR 0
  vkGeometryTypeAabbsKhr* = VkGeometryTypeKHR 1
  vkGeometryTypeInstancesKhr* = VkGeometryTypeKHR 2
type VkAccelerationStructureMemoryRequirementsTypeNV* = distinct cint
proc `==`*(x, y: VkAccelerationStructureMemoryRequirementsTypeNV): bool {.borrow.}
proc `-`*(x: VkAccelerationStructureMemoryRequirementsTypeNV): VkAccelerationStructureMemoryRequirementsTypeNV {.borrow.}
proc `-`*(x, y: VkAccelerationStructureMemoryRequirementsTypeNV): VkAccelerationStructureMemoryRequirementsTypeNV {.borrow.}
proc `+`*(x, y: VkAccelerationStructureMemoryRequirementsTypeNV): VkAccelerationStructureMemoryRequirementsTypeNV {.borrow.}
proc `+`*(x: VkAccelerationStructureMemoryRequirementsTypeNV, y: int): VkAccelerationStructureMemoryRequirementsTypeNV {.used.} = x + VkAccelerationStructureMemoryRequirementsTypeNV(y)

const
  vkAccelerationStructureMemoryRequirementsTypeObjectNv* = VkAccelerationStructureMemoryRequirementsTypeNV 0
  vkAccelerationStructureMemoryRequirementsTypeBuildScratchNv* = VkAccelerationStructureMemoryRequirementsTypeNV 1
  vkAccelerationStructureMemoryRequirementsTypeUpdateScratchNv* = VkAccelerationStructureMemoryRequirementsTypeNV 2
type VkAccelerationStructureBuildTypeKHR* = distinct cint
proc `==`*(x, y: VkAccelerationStructureBuildTypeKHR): bool {.borrow.}
proc `-`*(x: VkAccelerationStructureBuildTypeKHR): VkAccelerationStructureBuildTypeKHR {.borrow.}
proc `-`*(x, y: VkAccelerationStructureBuildTypeKHR): VkAccelerationStructureBuildTypeKHR {.borrow.}
proc `+`*(x, y: VkAccelerationStructureBuildTypeKHR): VkAccelerationStructureBuildTypeKHR {.borrow.}
proc `+`*(x: VkAccelerationStructureBuildTypeKHR, y: int): VkAccelerationStructureBuildTypeKHR {.used.} = x + VkAccelerationStructureBuildTypeKHR(y)

const
  vkAccelerationStructureBuildTypeHostKhr* = VkAccelerationStructureBuildTypeKHR 0
  vkAccelerationStructureBuildTypeDeviceKhr* = VkAccelerationStructureBuildTypeKHR 1
  vkAccelerationStructureBuildTypeHostOrDeviceKhr* = VkAccelerationStructureBuildTypeKHR 2
type VkRayTracingShaderGroupTypeKHR* = distinct cint
proc `==`*(x, y: VkRayTracingShaderGroupTypeKHR): bool {.borrow.}
proc `-`*(x: VkRayTracingShaderGroupTypeKHR): VkRayTracingShaderGroupTypeKHR {.borrow.}
proc `-`*(x, y: VkRayTracingShaderGroupTypeKHR): VkRayTracingShaderGroupTypeKHR {.borrow.}
proc `+`*(x, y: VkRayTracingShaderGroupTypeKHR): VkRayTracingShaderGroupTypeKHR {.borrow.}
proc `+`*(x: VkRayTracingShaderGroupTypeKHR, y: int): VkRayTracingShaderGroupTypeKHR {.used.} = x + VkRayTracingShaderGroupTypeKHR(y)

const
  vkRayTracingShaderGroupTypeGeneralKhr* = VkRayTracingShaderGroupTypeKHR 0
  vkRayTracingShaderGroupTypeTrianglesHitGroupKhr* = VkRayTracingShaderGroupTypeKHR 1
  vkRayTracingShaderGroupTypeProceduralHitGroupKhr* = VkRayTracingShaderGroupTypeKHR 2
type VkAccelerationStructureCompatibilityKHR* = distinct cint
proc `==`*(x, y: VkAccelerationStructureCompatibilityKHR): bool {.borrow.}
proc `-`*(x: VkAccelerationStructureCompatibilityKHR): VkAccelerationStructureCompatibilityKHR {.borrow.}
proc `-`*(x, y: VkAccelerationStructureCompatibilityKHR): VkAccelerationStructureCompatibilityKHR {.borrow.}
proc `+`*(x, y: VkAccelerationStructureCompatibilityKHR): VkAccelerationStructureCompatibilityKHR {.borrow.}
proc `+`*(x: VkAccelerationStructureCompatibilityKHR, y: int): VkAccelerationStructureCompatibilityKHR {.used.} = x + VkAccelerationStructureCompatibilityKHR(y)

const
  vkAccelerationStructureCompatibilityCompatibleKhr* = VkAccelerationStructureCompatibilityKHR 0
  vkAccelerationStructureCompatibilityIncompatibleKhr* = VkAccelerationStructureCompatibilityKHR 1
type VkShaderGroupShaderKHR* = distinct cint
proc `==`*(x, y: VkShaderGroupShaderKHR): bool {.borrow.}
proc `-`*(x: VkShaderGroupShaderKHR): VkShaderGroupShaderKHR {.borrow.}
proc `-`*(x, y: VkShaderGroupShaderKHR): VkShaderGroupShaderKHR {.borrow.}
proc `+`*(x, y: VkShaderGroupShaderKHR): VkShaderGroupShaderKHR {.borrow.}
proc `+`*(x: VkShaderGroupShaderKHR, y: int): VkShaderGroupShaderKHR {.used.} = x + VkShaderGroupShaderKHR(y)

const
  vkShaderGroupShaderGeneralKhr* = VkShaderGroupShaderKHR 0
  vkShaderGroupShaderClosestHitKhr* = VkShaderGroupShaderKHR 1
  vkShaderGroupShaderAnyHitKhr* = VkShaderGroupShaderKHR 2
  vkShaderGroupShaderIntersectionKhr* = VkShaderGroupShaderKHR 3
type VkMemoryOverallocationBehaviorAMD* = distinct cint
proc `==`*(x, y: VkMemoryOverallocationBehaviorAMD): bool {.borrow.}
proc `-`*(x: VkMemoryOverallocationBehaviorAMD): VkMemoryOverallocationBehaviorAMD {.borrow.}
proc `-`*(x, y: VkMemoryOverallocationBehaviorAMD): VkMemoryOverallocationBehaviorAMD {.borrow.}
proc `+`*(x, y: VkMemoryOverallocationBehaviorAMD): VkMemoryOverallocationBehaviorAMD {.borrow.}
proc `+`*(x: VkMemoryOverallocationBehaviorAMD, y: int): VkMemoryOverallocationBehaviorAMD {.used.} = x + VkMemoryOverallocationBehaviorAMD(y)

const
  vkMemoryOverallocationBehaviorDefaultAmd* = VkMemoryOverallocationBehaviorAMD 0
  vkMemoryOverallocationBehaviorAllowedAmd* = VkMemoryOverallocationBehaviorAMD 1
  vkMemoryOverallocationBehaviorDisallowedAmd* = VkMemoryOverallocationBehaviorAMD 2
type VkFramebufferCreateFlagBits* = distinct cint
proc `==`*(x, y: VkFramebufferCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkFramebufferCreateFlagBits): VkFramebufferCreateFlagBits {.borrow.}
proc `-`*(x, y: VkFramebufferCreateFlagBits): VkFramebufferCreateFlagBits {.borrow.}
proc `+`*(x, y: VkFramebufferCreateFlagBits): VkFramebufferCreateFlagBits {.borrow.}
proc `+`*(x: VkFramebufferCreateFlagBits, y: int): VkFramebufferCreateFlagBits {.used.} = x + VkFramebufferCreateFlagBits(y)

const
  vkFramebufferCreateImagelessBit* = VkFramebufferCreateFlagBits 1
type VkScopeNV* = distinct cint
proc `==`*(x, y: VkScopeNV): bool {.borrow.}
proc `-`*(x: VkScopeNV): VkScopeNV {.borrow.}
proc `-`*(x, y: VkScopeNV): VkScopeNV {.borrow.}
proc `+`*(x, y: VkScopeNV): VkScopeNV {.borrow.}
proc `+`*(x: VkScopeNV, y: int): VkScopeNV {.used.} = x + VkScopeNV(y)

const
  vkScopeDeviceNv* = VkScopeNV 1
  vkScopeWorkgroupNv* = VkScopeNV 2
  vkScopeSubgroupNv* = VkScopeNV 3
  vkScopeQueueFamilyNv* = VkScopeNV 5
type VkComponentTypeNV* = distinct cint
proc `==`*(x, y: VkComponentTypeNV): bool {.borrow.}
proc `-`*(x: VkComponentTypeNV): VkComponentTypeNV {.borrow.}
proc `-`*(x, y: VkComponentTypeNV): VkComponentTypeNV {.borrow.}
proc `+`*(x, y: VkComponentTypeNV): VkComponentTypeNV {.borrow.}
proc `+`*(x: VkComponentTypeNV, y: int): VkComponentTypeNV {.used.} = x + VkComponentTypeNV(y)

const
  vkComponentTypeFloat16Nv* = VkComponentTypeNV 0
  vkComponentTypeFloat32Nv* = VkComponentTypeNV 1
  vkComponentTypeFloat64Nv* = VkComponentTypeNV 2
  vkComponentTypeSint8Nv* = VkComponentTypeNV 3
  vkComponentTypeSint16Nv* = VkComponentTypeNV 4
  vkComponentTypeSint32Nv* = VkComponentTypeNV 5
  vkComponentTypeSint64Nv* = VkComponentTypeNV 6
  vkComponentTypeUint8Nv* = VkComponentTypeNV 7
  vkComponentTypeUint16Nv* = VkComponentTypeNV 8
  vkComponentTypeUint32Nv* = VkComponentTypeNV 9
  vkComponentTypeUint64Nv* = VkComponentTypeNV 10
type VkDeviceDiagnosticsConfigFlagBitsNV* = distinct cint
proc `==`*(x, y: VkDeviceDiagnosticsConfigFlagBitsNV): bool {.borrow.}
proc `-`*(x: VkDeviceDiagnosticsConfigFlagBitsNV): VkDeviceDiagnosticsConfigFlagBitsNV {.borrow.}
proc `-`*(x, y: VkDeviceDiagnosticsConfigFlagBitsNV): VkDeviceDiagnosticsConfigFlagBitsNV {.borrow.}
proc `+`*(x, y: VkDeviceDiagnosticsConfigFlagBitsNV): VkDeviceDiagnosticsConfigFlagBitsNV {.borrow.}
proc `+`*(x: VkDeviceDiagnosticsConfigFlagBitsNV, y: int): VkDeviceDiagnosticsConfigFlagBitsNV {.used.} = x + VkDeviceDiagnosticsConfigFlagBitsNV(y)

const
  vkDeviceDiagnosticsConfigEnableShaderDebugInfoBitNv* = VkDeviceDiagnosticsConfigFlagBitsNV 1
  vkDeviceDiagnosticsConfigEnableResourceTrackingBitNv* = VkDeviceDiagnosticsConfigFlagBitsNV 2
  vkDeviceDiagnosticsConfigEnableAutomaticCheckpointsBitNv* = VkDeviceDiagnosticsConfigFlagBitsNV 4
type VkPipelineCreationFeedbackFlagBitsEXT* = distinct cint
proc `==`*(x, y: VkPipelineCreationFeedbackFlagBitsEXT): bool {.borrow.}
proc `-`*(x: VkPipelineCreationFeedbackFlagBitsEXT): VkPipelineCreationFeedbackFlagBitsEXT {.borrow.}
proc `-`*(x, y: VkPipelineCreationFeedbackFlagBitsEXT): VkPipelineCreationFeedbackFlagBitsEXT {.borrow.}
proc `+`*(x, y: VkPipelineCreationFeedbackFlagBitsEXT): VkPipelineCreationFeedbackFlagBitsEXT {.borrow.}
proc `+`*(x: VkPipelineCreationFeedbackFlagBitsEXT, y: int): VkPipelineCreationFeedbackFlagBitsEXT {.used.} = x + VkPipelineCreationFeedbackFlagBitsEXT(y)

const
  vkPipelineCreationFeedbackValidBitExt* = VkPipelineCreationFeedbackFlagBitsEXT 1
  vkPipelineCreationFeedbackApplicationPipelineCacheHitBitExt* = VkPipelineCreationFeedbackFlagBitsEXT 2
  vkPipelineCreationFeedbackBasePipelineAccelerationBitExt* = VkPipelineCreationFeedbackFlagBitsEXT 4
type VkFullScreenExclusiveEXT* = distinct cint
proc `==`*(x, y: VkFullScreenExclusiveEXT): bool {.borrow.}
proc `-`*(x: VkFullScreenExclusiveEXT): VkFullScreenExclusiveEXT {.borrow.}
proc `-`*(x, y: VkFullScreenExclusiveEXT): VkFullScreenExclusiveEXT {.borrow.}
proc `+`*(x, y: VkFullScreenExclusiveEXT): VkFullScreenExclusiveEXT {.borrow.}
proc `+`*(x: VkFullScreenExclusiveEXT, y: int): VkFullScreenExclusiveEXT {.used.} = x + VkFullScreenExclusiveEXT(y)

const
  vkFullScreenExclusiveDefaultExt* = VkFullScreenExclusiveEXT 0
  vkFullScreenExclusiveAllowedExt* = VkFullScreenExclusiveEXT 1
  vkFullScreenExclusiveDisallowedExt* = VkFullScreenExclusiveEXT 2
  vkFullScreenExclusiveApplicationControlledExt* = VkFullScreenExclusiveEXT 3
type VkPerformanceCounterScopeKHR* = distinct cint
proc `==`*(x, y: VkPerformanceCounterScopeKHR): bool {.borrow.}
proc `-`*(x: VkPerformanceCounterScopeKHR): VkPerformanceCounterScopeKHR {.borrow.}
proc `-`*(x, y: VkPerformanceCounterScopeKHR): VkPerformanceCounterScopeKHR {.borrow.}
proc `+`*(x, y: VkPerformanceCounterScopeKHR): VkPerformanceCounterScopeKHR {.borrow.}
proc `+`*(x: VkPerformanceCounterScopeKHR, y: int): VkPerformanceCounterScopeKHR {.used.} = x + VkPerformanceCounterScopeKHR(y)

const
  vkPerformanceCounterScopeCommandBufferKhr* = VkPerformanceCounterScopeKHR 0
  vkPerformanceCounterScopeRenderPassKhr* = VkPerformanceCounterScopeKHR 1
  vkPerformanceCounterScopeCommandKhr* = VkPerformanceCounterScopeKHR 2
type VkPerformanceCounterUnitKHR* = distinct cint
proc `==`*(x, y: VkPerformanceCounterUnitKHR): bool {.borrow.}
proc `-`*(x: VkPerformanceCounterUnitKHR): VkPerformanceCounterUnitKHR {.borrow.}
proc `-`*(x, y: VkPerformanceCounterUnitKHR): VkPerformanceCounterUnitKHR {.borrow.}
proc `+`*(x, y: VkPerformanceCounterUnitKHR): VkPerformanceCounterUnitKHR {.borrow.}
proc `+`*(x: VkPerformanceCounterUnitKHR, y: int): VkPerformanceCounterUnitKHR {.used.} = x + VkPerformanceCounterUnitKHR(y)

const
  vkPerformanceCounterUnitGenericKhr* = VkPerformanceCounterUnitKHR 0
  vkPerformanceCounterUnitPercentageKhr* = VkPerformanceCounterUnitKHR 1
  vkPerformanceCounterUnitNanosecondsKhr* = VkPerformanceCounterUnitKHR 2
  vkPerformanceCounterUnitBytesKhr* = VkPerformanceCounterUnitKHR 3
  vkPerformanceCounterUnitBytesPerSecondKhr* = VkPerformanceCounterUnitKHR 4
  vkPerformanceCounterUnitKelvinKhr* = VkPerformanceCounterUnitKHR 5
  vkPerformanceCounterUnitWattsKhr* = VkPerformanceCounterUnitKHR 6
  vkPerformanceCounterUnitVoltsKhr* = VkPerformanceCounterUnitKHR 7
  vkPerformanceCounterUnitAmpsKhr* = VkPerformanceCounterUnitKHR 8
  vkPerformanceCounterUnitHertzKhr* = VkPerformanceCounterUnitKHR 9
  vkPerformanceCounterUnitCyclesKhr* = VkPerformanceCounterUnitKHR 10
type VkPerformanceCounterStorageKHR* = distinct cint
proc `==`*(x, y: VkPerformanceCounterStorageKHR): bool {.borrow.}
proc `-`*(x: VkPerformanceCounterStorageKHR): VkPerformanceCounterStorageKHR {.borrow.}
proc `-`*(x, y: VkPerformanceCounterStorageKHR): VkPerformanceCounterStorageKHR {.borrow.}
proc `+`*(x, y: VkPerformanceCounterStorageKHR): VkPerformanceCounterStorageKHR {.borrow.}
proc `+`*(x: VkPerformanceCounterStorageKHR, y: int): VkPerformanceCounterStorageKHR {.used.} = x + VkPerformanceCounterStorageKHR(y)

const
  vkPerformanceCounterStorageInt32Khr* = VkPerformanceCounterStorageKHR 0
  vkPerformanceCounterStorageInt64Khr* = VkPerformanceCounterStorageKHR 1
  vkPerformanceCounterStorageUint32Khr* = VkPerformanceCounterStorageKHR 2
  vkPerformanceCounterStorageUint64Khr* = VkPerformanceCounterStorageKHR 3
  vkPerformanceCounterStorageFloat32Khr* = VkPerformanceCounterStorageKHR 4
  vkPerformanceCounterStorageFloat64Khr* = VkPerformanceCounterStorageKHR 5
type VkPerformanceCounterDescriptionFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkPerformanceCounterDescriptionFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkPerformanceCounterDescriptionFlagBitsKHR): VkPerformanceCounterDescriptionFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkPerformanceCounterDescriptionFlagBitsKHR): VkPerformanceCounterDescriptionFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkPerformanceCounterDescriptionFlagBitsKHR): VkPerformanceCounterDescriptionFlagBitsKHR {.borrow.}
proc `+`*(x: VkPerformanceCounterDescriptionFlagBitsKHR, y: int): VkPerformanceCounterDescriptionFlagBitsKHR {.used.} = x + VkPerformanceCounterDescriptionFlagBitsKHR(y)

const
  vkPerformanceCounterDescriptionPerformanceImpactingBitKhr* = VkPerformanceCounterDescriptionFlagBitsKHR 1
  vkPerformanceCounterDescriptionConcurrentlyImpactedBitKhr* = VkPerformanceCounterDescriptionFlagBitsKHR 2
type VkAcquireProfilingLockFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkAcquireProfilingLockFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkAcquireProfilingLockFlagBitsKHR): VkAcquireProfilingLockFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkAcquireProfilingLockFlagBitsKHR): VkAcquireProfilingLockFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkAcquireProfilingLockFlagBitsKHR): VkAcquireProfilingLockFlagBitsKHR {.borrow.}
proc `+`*(x: VkAcquireProfilingLockFlagBitsKHR, y: int): VkAcquireProfilingLockFlagBitsKHR {.used.} = x + VkAcquireProfilingLockFlagBitsKHR(y)
type VkShaderCorePropertiesFlagBitsAMD* = distinct cint
proc `==`*(x, y: VkShaderCorePropertiesFlagBitsAMD): bool {.borrow.}
proc `-`*(x: VkShaderCorePropertiesFlagBitsAMD): VkShaderCorePropertiesFlagBitsAMD {.borrow.}
proc `-`*(x, y: VkShaderCorePropertiesFlagBitsAMD): VkShaderCorePropertiesFlagBitsAMD {.borrow.}
proc `+`*(x, y: VkShaderCorePropertiesFlagBitsAMD): VkShaderCorePropertiesFlagBitsAMD {.borrow.}
proc `+`*(x: VkShaderCorePropertiesFlagBitsAMD, y: int): VkShaderCorePropertiesFlagBitsAMD {.used.} = x + VkShaderCorePropertiesFlagBitsAMD(y)
type VkPerformanceConfigurationTypeINTEL* = distinct cint
proc `==`*(x, y: VkPerformanceConfigurationTypeINTEL): bool {.borrow.}
proc `-`*(x: VkPerformanceConfigurationTypeINTEL): VkPerformanceConfigurationTypeINTEL {.borrow.}
proc `-`*(x, y: VkPerformanceConfigurationTypeINTEL): VkPerformanceConfigurationTypeINTEL {.borrow.}
proc `+`*(x, y: VkPerformanceConfigurationTypeINTEL): VkPerformanceConfigurationTypeINTEL {.borrow.}
proc `+`*(x: VkPerformanceConfigurationTypeINTEL, y: int): VkPerformanceConfigurationTypeINTEL {.used.} = x + VkPerformanceConfigurationTypeINTEL(y)

const
  vkPerformanceConfigurationTypeCommandQueueMetricsDiscoveryActivatedIntel* = VkPerformanceConfigurationTypeINTEL 0
type VkQueryPoolSamplingModeINTEL* = distinct cint
proc `==`*(x, y: VkQueryPoolSamplingModeINTEL): bool {.borrow.}
proc `-`*(x: VkQueryPoolSamplingModeINTEL): VkQueryPoolSamplingModeINTEL {.borrow.}
proc `-`*(x, y: VkQueryPoolSamplingModeINTEL): VkQueryPoolSamplingModeINTEL {.borrow.}
proc `+`*(x, y: VkQueryPoolSamplingModeINTEL): VkQueryPoolSamplingModeINTEL {.borrow.}
proc `+`*(x: VkQueryPoolSamplingModeINTEL, y: int): VkQueryPoolSamplingModeINTEL {.used.} = x + VkQueryPoolSamplingModeINTEL(y)

const
  vkQueryPoolSamplingModeManualIntel* = VkQueryPoolSamplingModeINTEL 0
type VkPerformanceOverrideTypeINTEL* = distinct cint
proc `==`*(x, y: VkPerformanceOverrideTypeINTEL): bool {.borrow.}
proc `-`*(x: VkPerformanceOverrideTypeINTEL): VkPerformanceOverrideTypeINTEL {.borrow.}
proc `-`*(x, y: VkPerformanceOverrideTypeINTEL): VkPerformanceOverrideTypeINTEL {.borrow.}
proc `+`*(x, y: VkPerformanceOverrideTypeINTEL): VkPerformanceOverrideTypeINTEL {.borrow.}
proc `+`*(x: VkPerformanceOverrideTypeINTEL, y: int): VkPerformanceOverrideTypeINTEL {.used.} = x + VkPerformanceOverrideTypeINTEL(y)

const
  vkPerformanceOverrideTypeNullHardwareIntel* = VkPerformanceOverrideTypeINTEL 0
  vkPerformanceOverrideTypeFlushGpuCachesIntel* = VkPerformanceOverrideTypeINTEL 1
type VkPerformanceParameterTypeINTEL* = distinct cint
proc `==`*(x, y: VkPerformanceParameterTypeINTEL): bool {.borrow.}
proc `-`*(x: VkPerformanceParameterTypeINTEL): VkPerformanceParameterTypeINTEL {.borrow.}
proc `-`*(x, y: VkPerformanceParameterTypeINTEL): VkPerformanceParameterTypeINTEL {.borrow.}
proc `+`*(x, y: VkPerformanceParameterTypeINTEL): VkPerformanceParameterTypeINTEL {.borrow.}
proc `+`*(x: VkPerformanceParameterTypeINTEL, y: int): VkPerformanceParameterTypeINTEL {.used.} = x + VkPerformanceParameterTypeINTEL(y)

const
  vkPerformanceParameterTypeHwCountersSupportedIntel* = VkPerformanceParameterTypeINTEL 0
  vkPerformanceParameterTypeStreamMarkerValidBitsIntel* = VkPerformanceParameterTypeINTEL 1
type VkPerformanceValueTypeINTEL* = distinct cint
proc `==`*(x, y: VkPerformanceValueTypeINTEL): bool {.borrow.}
proc `-`*(x: VkPerformanceValueTypeINTEL): VkPerformanceValueTypeINTEL {.borrow.}
proc `-`*(x, y: VkPerformanceValueTypeINTEL): VkPerformanceValueTypeINTEL {.borrow.}
proc `+`*(x, y: VkPerformanceValueTypeINTEL): VkPerformanceValueTypeINTEL {.borrow.}
proc `+`*(x: VkPerformanceValueTypeINTEL, y: int): VkPerformanceValueTypeINTEL {.used.} = x + VkPerformanceValueTypeINTEL(y)

const
  vkPerformanceValueTypeUint32Intel* = VkPerformanceValueTypeINTEL 0
  vkPerformanceValueTypeUint64Intel* = VkPerformanceValueTypeINTEL 1
  vkPerformanceValueTypeFloatIntel* = VkPerformanceValueTypeINTEL 2
  vkPerformanceValueTypeBoolIntel* = VkPerformanceValueTypeINTEL 3
  vkPerformanceValueTypeStringIntel* = VkPerformanceValueTypeINTEL 4
type VkShaderFloatControlsIndependence* = distinct cint
proc `==`*(x, y: VkShaderFloatControlsIndependence): bool {.borrow.}
proc `-`*(x: VkShaderFloatControlsIndependence): VkShaderFloatControlsIndependence {.borrow.}
proc `-`*(x, y: VkShaderFloatControlsIndependence): VkShaderFloatControlsIndependence {.borrow.}
proc `+`*(x, y: VkShaderFloatControlsIndependence): VkShaderFloatControlsIndependence {.borrow.}
proc `+`*(x: VkShaderFloatControlsIndependence, y: int): VkShaderFloatControlsIndependence {.used.} = x + VkShaderFloatControlsIndependence(y)

const
  vkShaderFloatControlsIndependence32BitOnly* = VkShaderFloatControlsIndependence 0
  vkShaderFloatControlsIndependenceAll* = VkShaderFloatControlsIndependence 1
  vkShaderFloatControlsIndependenceNone* = VkShaderFloatControlsIndependence 2
type VkPipelineExecutableStatisticFormatKHR* = distinct cint
proc `==`*(x, y: VkPipelineExecutableStatisticFormatKHR): bool {.borrow.}
proc `-`*(x: VkPipelineExecutableStatisticFormatKHR): VkPipelineExecutableStatisticFormatKHR {.borrow.}
proc `-`*(x, y: VkPipelineExecutableStatisticFormatKHR): VkPipelineExecutableStatisticFormatKHR {.borrow.}
proc `+`*(x, y: VkPipelineExecutableStatisticFormatKHR): VkPipelineExecutableStatisticFormatKHR {.borrow.}
proc `+`*(x: VkPipelineExecutableStatisticFormatKHR, y: int): VkPipelineExecutableStatisticFormatKHR {.used.} = x + VkPipelineExecutableStatisticFormatKHR(y)

const
  vkPipelineExecutableStatisticFormatBool32Khr* = VkPipelineExecutableStatisticFormatKHR 0
  vkPipelineExecutableStatisticFormatInt64Khr* = VkPipelineExecutableStatisticFormatKHR 1
  vkPipelineExecutableStatisticFormatUint64Khr* = VkPipelineExecutableStatisticFormatKHR 2
  vkPipelineExecutableStatisticFormatFloat64Khr* = VkPipelineExecutableStatisticFormatKHR 3
type VkLineRasterizationModeEXT* = distinct cint
proc `==`*(x, y: VkLineRasterizationModeEXT): bool {.borrow.}
proc `-`*(x: VkLineRasterizationModeEXT): VkLineRasterizationModeEXT {.borrow.}
proc `-`*(x, y: VkLineRasterizationModeEXT): VkLineRasterizationModeEXT {.borrow.}
proc `+`*(x, y: VkLineRasterizationModeEXT): VkLineRasterizationModeEXT {.borrow.}
proc `+`*(x: VkLineRasterizationModeEXT, y: int): VkLineRasterizationModeEXT {.used.} = x + VkLineRasterizationModeEXT(y)

const
  vkLineRasterizationModeDefaultExt* = VkLineRasterizationModeEXT 0
  vkLineRasterizationModeRectangularExt* = VkLineRasterizationModeEXT 1
  vkLineRasterizationModeBresenhamExt* = VkLineRasterizationModeEXT 2
  vkLineRasterizationModeRectangularSmoothExt* = VkLineRasterizationModeEXT 3
type VkShaderModuleCreateFlagBits* = distinct cint
proc `==`*(x, y: VkShaderModuleCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkShaderModuleCreateFlagBits): VkShaderModuleCreateFlagBits {.borrow.}
proc `-`*(x, y: VkShaderModuleCreateFlagBits): VkShaderModuleCreateFlagBits {.borrow.}
proc `+`*(x, y: VkShaderModuleCreateFlagBits): VkShaderModuleCreateFlagBits {.borrow.}
proc `+`*(x: VkShaderModuleCreateFlagBits, y: int): VkShaderModuleCreateFlagBits {.used.} = x + VkShaderModuleCreateFlagBits(y)

const
  vkShaderModuleCreateReserved0BitNv* = VkShaderModuleCreateFlagBits 1
type VkPipelineCompilerControlFlagBitsAMD* = distinct cint
proc `==`*(x, y: VkPipelineCompilerControlFlagBitsAMD): bool {.borrow.}
proc `-`*(x: VkPipelineCompilerControlFlagBitsAMD): VkPipelineCompilerControlFlagBitsAMD {.borrow.}
proc `-`*(x, y: VkPipelineCompilerControlFlagBitsAMD): VkPipelineCompilerControlFlagBitsAMD {.borrow.}
proc `+`*(x, y: VkPipelineCompilerControlFlagBitsAMD): VkPipelineCompilerControlFlagBitsAMD {.borrow.}
proc `+`*(x: VkPipelineCompilerControlFlagBitsAMD, y: int): VkPipelineCompilerControlFlagBitsAMD {.used.} = x + VkPipelineCompilerControlFlagBitsAMD(y)
type VkToolPurposeFlagBitsEXT* = distinct cint
proc `==`*(x, y: VkToolPurposeFlagBitsEXT): bool {.borrow.}
proc `-`*(x: VkToolPurposeFlagBitsEXT): VkToolPurposeFlagBitsEXT {.borrow.}
proc `-`*(x, y: VkToolPurposeFlagBitsEXT): VkToolPurposeFlagBitsEXT {.borrow.}
proc `+`*(x, y: VkToolPurposeFlagBitsEXT): VkToolPurposeFlagBitsEXT {.borrow.}
proc `+`*(x: VkToolPurposeFlagBitsEXT, y: int): VkToolPurposeFlagBitsEXT {.used.} = x + VkToolPurposeFlagBitsEXT(y)

const
  vkToolPurposeValidationBitExt* = VkToolPurposeFlagBitsEXT 1
  vkToolPurposeProfilingBitExt* = VkToolPurposeFlagBitsEXT 2
  vkToolPurposeTracingBitExt* = VkToolPurposeFlagBitsEXT 4
  vkToolPurposeAdditionalFeaturesBitExt* = VkToolPurposeFlagBitsEXT 8
  vkToolPurposeModifyingFeaturesBitExt* = VkToolPurposeFlagBitsEXT 16
  vkToolPurposeDebugReportingBitExt* = VkToolPurposeFlagBitsEXT 32
  vkToolPurposeDebugMarkersBitExt* = VkToolPurposeFlagBitsEXT 64
type VkFragmentShadingRateCombinerOpKHR* = distinct cint
proc `==`*(x, y: VkFragmentShadingRateCombinerOpKHR): bool {.borrow.}
proc `-`*(x: VkFragmentShadingRateCombinerOpKHR): VkFragmentShadingRateCombinerOpKHR {.borrow.}
proc `-`*(x, y: VkFragmentShadingRateCombinerOpKHR): VkFragmentShadingRateCombinerOpKHR {.borrow.}
proc `+`*(x, y: VkFragmentShadingRateCombinerOpKHR): VkFragmentShadingRateCombinerOpKHR {.borrow.}
proc `+`*(x: VkFragmentShadingRateCombinerOpKHR, y: int): VkFragmentShadingRateCombinerOpKHR {.used.} = x + VkFragmentShadingRateCombinerOpKHR(y)

const
  vkFragmentShadingRateCombinerOpKeepKhr* = VkFragmentShadingRateCombinerOpKHR 0
  vkFragmentShadingRateCombinerOpReplaceKhr* = VkFragmentShadingRateCombinerOpKHR 1
  vkFragmentShadingRateCombinerOpMinKhr* = VkFragmentShadingRateCombinerOpKHR 2
  vkFragmentShadingRateCombinerOpMaxKhr* = VkFragmentShadingRateCombinerOpKHR 3
  vkFragmentShadingRateCombinerOpMulKhr* = VkFragmentShadingRateCombinerOpKHR 4
type VkFragmentShadingRateNV* = distinct cint
proc `==`*(x, y: VkFragmentShadingRateNV): bool {.borrow.}
proc `-`*(x: VkFragmentShadingRateNV): VkFragmentShadingRateNV {.borrow.}
proc `-`*(x, y: VkFragmentShadingRateNV): VkFragmentShadingRateNV {.borrow.}
proc `+`*(x, y: VkFragmentShadingRateNV): VkFragmentShadingRateNV {.borrow.}
proc `+`*(x: VkFragmentShadingRateNV, y: int): VkFragmentShadingRateNV {.used.} = x + VkFragmentShadingRateNV(y)

const
  vkFragmentShadingRate1InvocationPerPixelNv* = VkFragmentShadingRateNV 0
  vkFragmentShadingRate1InvocationPer1x2PixelsNv* = VkFragmentShadingRateNV 1
  vkFragmentShadingRate1InvocationPer2x1PixelsNv* = VkFragmentShadingRateNV 4
  vkFragmentShadingRate1InvocationPer2x2PixelsNv* = VkFragmentShadingRateNV 5
  vkFragmentShadingRate1InvocationPer2x4PixelsNv* = VkFragmentShadingRateNV 6
  vkFragmentShadingRate1InvocationPer4x2PixelsNv* = VkFragmentShadingRateNV 9
  vkFragmentShadingRate1InvocationPer4x4PixelsNv* = VkFragmentShadingRateNV 10
  vkFragmentShadingRate2InvocationsPerPixelNv* = VkFragmentShadingRateNV 11
  vkFragmentShadingRate4InvocationsPerPixelNv* = VkFragmentShadingRateNV 12
  vkFragmentShadingRate8InvocationsPerPixelNv* = VkFragmentShadingRateNV 13
  vkFragmentShadingRate16InvocationsPerPixelNv* = VkFragmentShadingRateNV 14
  vkFragmentShadingRateNoInvocationsNv* = VkFragmentShadingRateNV 15
type VkFragmentShadingRateTypeNV* = distinct cint
proc `==`*(x, y: VkFragmentShadingRateTypeNV): bool {.borrow.}
proc `-`*(x: VkFragmentShadingRateTypeNV): VkFragmentShadingRateTypeNV {.borrow.}
proc `-`*(x, y: VkFragmentShadingRateTypeNV): VkFragmentShadingRateTypeNV {.borrow.}
proc `+`*(x, y: VkFragmentShadingRateTypeNV): VkFragmentShadingRateTypeNV {.borrow.}
proc `+`*(x: VkFragmentShadingRateTypeNV, y: int): VkFragmentShadingRateTypeNV {.used.} = x + VkFragmentShadingRateTypeNV(y)

const
  vkFragmentShadingRateTypeFragmentSizeNv* = VkFragmentShadingRateTypeNV 0
  vkFragmentShadingRateTypeEnumsNv* = VkFragmentShadingRateTypeNV 1
type VkAccessFlagBits2KHR* = distinct uint64
proc `==`*(x, y: VkAccessFlagBits2KHR): bool {.borrow.}
proc `-`*(x, y: VkAccessFlagBits2KHR): VkAccessFlagBits2KHR {.borrow.}
proc `+`*(x, y: VkAccessFlagBits2KHR): VkAccessFlagBits2KHR {.borrow.}
proc `+`*(x: VkAccessFlagBits2KHR, y: int): VkAccessFlagBits2KHR {.used.} = x + VkAccessFlagBits2KHR(y)

const
  vkAccess2NoneKhr* = VkAccessFlagBits2KHR 0
  vkAccess2IndirectCommandReadBitKhr* = VkAccessFlagBits2KHR 1
  vkAccess2IndexReadBitKhr* = VkAccessFlagBits2KHR 2
  vkAccess2VertexAttributeReadBitKhr* = VkAccessFlagBits2KHR 4
  vkAccess2UniformReadBitKhr* = VkAccessFlagBits2KHR 8
  vkAccess2InputAttachmentReadBitKhr* = VkAccessFlagBits2KHR 16
  vkAccess2ShaderReadBitKhr* = VkAccessFlagBits2KHR 32
  vkAccess2ShaderWriteBitKhr* = VkAccessFlagBits2KHR 64
  vkAccess2ColorAttachmentReadBitKhr* = VkAccessFlagBits2KHR 128
  vkAccess2ColorAttachmentWriteBitKhr* = VkAccessFlagBits2KHR 256
  vkAccess2DepthStencilAttachmentReadBitKhr* = VkAccessFlagBits2KHR 512
  vkAccess2DepthStencilAttachmentWriteBitKhr* = VkAccessFlagBits2KHR 1024
  vkAccess2TransferReadBitKhr* = VkAccessFlagBits2KHR 2048
  vkAccess2TransferWriteBitKhr* = VkAccessFlagBits2KHR 4096
  vkAccess2HostReadBitKhr* = VkAccessFlagBits2KHR 8192
  vkAccess2HostWriteBitKhr* = VkAccessFlagBits2KHR 16384
  vkAccess2MemoryReadBitKhr* = VkAccessFlagBits2KHR 32768
  vkAccess2MemoryWriteBitKhr* = VkAccessFlagBits2KHR 65536
  vkAccess2CommandPreprocessReadBitNv* = VkAccessFlagBits2KHR 131072
  vkAccess2CommandPreprocessWriteBitNv* = VkAccessFlagBits2KHR 262144
  vkAccess2ColorAttachmentReadNoncoherentBitExt* = VkAccessFlagBits2KHR 524288
  vkAccess2ConditionalRenderingReadBitExt* = VkAccessFlagBits2KHR 1048576
  vkAccess2AccelerationStructureReadBitKhr* = VkAccessFlagBits2KHR 2097152
  vkAccess2AccelerationStructureWriteBitKhr* = VkAccessFlagBits2KHR 4194304
  vkAccess2FragmentShadingRateAttachmentReadBitKhr* = VkAccessFlagBits2KHR 8388608
  vkAccess2FragmentDensityMapReadBitExt* = VkAccessFlagBits2KHR 16777216
  vkAccess2TransformFeedbackWriteBitExt* = VkAccessFlagBits2KHR 33554432
  vkAccess2TransformFeedbackCounterReadBitExt* = VkAccessFlagBits2KHR 67108864
  vkAccess2TransformFeedbackCounterWriteBitExt* = VkAccessFlagBits2KHR 134217728
  vkAccess2ShaderSampledReadBitKhr* = VkAccessFlagBits2KHR 4294967296
  vkAccess2ShaderStorageReadBitKhr* = VkAccessFlagBits2KHR 8589934592
  vkAccess2ShaderStorageWriteBitKhr* = VkAccessFlagBits2KHR 17179869184
type VkPipelineStageFlagBits2KHR* = distinct uint64
proc `==`*(x, y: VkPipelineStageFlagBits2KHR): bool {.borrow.}
proc `-`*(x, y: VkPipelineStageFlagBits2KHR): VkPipelineStageFlagBits2KHR {.borrow.}
proc `+`*(x, y: VkPipelineStageFlagBits2KHR): VkPipelineStageFlagBits2KHR {.borrow.}
proc `+`*(x: VkPipelineStageFlagBits2KHR, y: int): VkPipelineStageFlagBits2KHR {.used.} = x + VkPipelineStageFlagBits2KHR(y)

const
  vkPipelineStage2NoneKhr* = VkPipelineStageFlagBits2KHR 0
  vkPipelineStage2TopOfPipeBitKhr* = VkPipelineStageFlagBits2KHR 1
  vkPipelineStage2DrawIndirectBitKhr* = VkPipelineStageFlagBits2KHR 2
  vkPipelineStage2VertexInputBitKhr* = VkPipelineStageFlagBits2KHR 4
  vkPipelineStage2VertexShaderBitKhr* = VkPipelineStageFlagBits2KHR 8
  vkPipelineStage2TessellationControlShaderBitKhr* = VkPipelineStageFlagBits2KHR 16
  vkPipelineStage2TessellationEvaluationShaderBitKhr* = VkPipelineStageFlagBits2KHR 32
  vkPipelineStage2GeometryShaderBitKhr* = VkPipelineStageFlagBits2KHR 64
  vkPipelineStage2FragmentShaderBitKhr* = VkPipelineStageFlagBits2KHR 128
  vkPipelineStage2EarlyFragmentTestsBitKhr* = VkPipelineStageFlagBits2KHR 256
  vkPipelineStage2LateFragmentTestsBitKhr* = VkPipelineStageFlagBits2KHR 512
  vkPipelineStage2ColorAttachmentOutputBitKhr* = VkPipelineStageFlagBits2KHR 1024
  vkPipelineStage2ComputeShaderBitKhr* = VkPipelineStageFlagBits2KHR 2048
  vkPipelineStage2AllTransferBitKhr* = VkPipelineStageFlagBits2KHR 4096
  vkPipelineStage2BottomOfPipeBitKhr* = VkPipelineStageFlagBits2KHR 8192
  vkPipelineStage2HostBitKhr* = VkPipelineStageFlagBits2KHR 16384
  vkPipelineStage2AllGraphicsBitKhr* = VkPipelineStageFlagBits2KHR 32768
  vkPipelineStage2AllCommandsBitKhr* = VkPipelineStageFlagBits2KHR 65536
  vkPipelineStage2CommandPreprocessBitNv* = VkPipelineStageFlagBits2KHR 131072
  vkPipelineStage2ConditionalRenderingBitExt* = VkPipelineStageFlagBits2KHR 262144
  vkPipelineStage2TaskShaderBitNv* = VkPipelineStageFlagBits2KHR 524288
  vkPipelineStage2MeshShaderBitNv* = VkPipelineStageFlagBits2KHR 1048576
  vkPipelineStage2RayTracingShaderBitKhr* = VkPipelineStageFlagBits2KHR 2097152
  vkPipelineStage2FragmentShadingRateAttachmentBitKhr* = VkPipelineStageFlagBits2KHR 4194304
  vkPipelineStage2FragmentDensityProcessBitExt* = VkPipelineStageFlagBits2KHR 8388608
  vkPipelineStage2TransformFeedbackBitExt* = VkPipelineStageFlagBits2KHR 16777216
  vkPipelineStage2AccelerationStructureBuildBitKhr* = VkPipelineStageFlagBits2KHR 33554432
  vkPipelineStage2CopyBitKhr* = VkPipelineStageFlagBits2KHR 4294967296
  vkPipelineStage2ResolveBitKhr* = VkPipelineStageFlagBits2KHR 8589934592
  vkPipelineStage2BlitBitKhr* = VkPipelineStageFlagBits2KHR 17179869184
  vkPipelineStage2ClearBitKhr* = VkPipelineStageFlagBits2KHR 34359738368
  vkPipelineStage2IndexInputBitKhr* = VkPipelineStageFlagBits2KHR 68719476736
  vkPipelineStage2VertexAttributeInputBitKhr* = VkPipelineStageFlagBits2KHR 137438953472
  vkPipelineStage2PreRasterizationShadersBitKhr* = VkPipelineStageFlagBits2KHR 274877906944
type VkSubmitFlagBitsKHR* = distinct cint
proc `==`*(x, y: VkSubmitFlagBitsKHR): bool {.borrow.}
proc `-`*(x: VkSubmitFlagBitsKHR): VkSubmitFlagBitsKHR {.borrow.}
proc `-`*(x, y: VkSubmitFlagBitsKHR): VkSubmitFlagBitsKHR {.borrow.}
proc `+`*(x, y: VkSubmitFlagBitsKHR): VkSubmitFlagBitsKHR {.borrow.}
proc `+`*(x: VkSubmitFlagBitsKHR, y: int): VkSubmitFlagBitsKHR {.used.} = x + VkSubmitFlagBitsKHR(y)

const
  vkSubmitProtectedBitKhr* = VkSubmitFlagBitsKHR 1
type VkEventCreateFlagBits* = distinct cint
proc `==`*(x, y: VkEventCreateFlagBits): bool {.borrow.}
proc `-`*(x: VkEventCreateFlagBits): VkEventCreateFlagBits {.borrow.}
proc `-`*(x, y: VkEventCreateFlagBits): VkEventCreateFlagBits {.borrow.}
proc `+`*(x, y: VkEventCreateFlagBits): VkEventCreateFlagBits {.borrow.}
proc `+`*(x: VkEventCreateFlagBits, y: int): VkEventCreateFlagBits {.used.} = x + VkEventCreateFlagBits(y)

const
  vkEventCreateDeviceOnlyBitKhr* = VkEventCreateFlagBits 1

const vkKhrSurfaceSpecVersion* = 25

const vkKhrSurfaceExtensionName* = "VK_KHR_surface"

const vkKhrSwapchainSpecVersion* = 70

const vkKhrSwapchainExtensionName* = "VK_KHR_swapchain"

const vkKhrDisplaySpecVersion* = 23

const vkKhrDisplayExtensionName* = "VK_KHR_display"

const vkKhrDisplaySwapchainSpecVersion* = 10

const vkKhrDisplaySwapchainExtensionName* = "VK_KHR_display_swapchain"

const vkKhrXlibSurfaceSpecVersion* = 6

const vkKhrXlibSurfaceExtensionName* = "VK_KHR_xlib_surface"

const vkKhrXcbSurfaceSpecVersion* = 6

const vkKhrXcbSurfaceExtensionName* = "VK_KHR_xcb_surface"

const vkKhrWaylandSurfaceSpecVersion* = 6

const vkKhrWaylandSurfaceExtensionName* = "VK_KHR_wayland_surface"

const vkKhrMirSurfaceSpecVersion* = 4

const vkKhrMirSurfaceExtensionName* = "VK_KHR_mir_surface"

const vkKhrAndroidSurfaceSpecVersion* = 6

const vkKhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"

const vkKhrWin32SurfaceSpecVersion* = 6

const vkKhrWin32SurfaceExtensionName* = "VK_KHR_win32_surface"

const vkAndroidNativeBufferSpecVersion* = 8

const vkAndroidNativeBufferNumber* = 11

const vkAndroidNativeBufferName* = "VK_ANDROID_native_buffer"

const vkExtDebugReportSpecVersion* = 9

const vkExtDebugReportExtensionName* = "VK_EXT_debug_report"

const vkNvGlslShaderSpecVersion* = 1

const vkNvGlslShaderExtensionName* = "VK_NV_glsl_shader"

const vkExtDepthRangeUnrestrictedSpecVersion* = 1

const vkExtDepthRangeUnrestrictedExtensionName* = "VK_EXT_depth_range_unrestricted"

const vkKhrSamplerMirrorClampToEdgeSpecVersion* = 3

const vkKhrSamplerMirrorClampToEdgeExtensionName* = "VK_KHR_sampler_mirror_clamp_to_edge"

const vkImgFilterCubicSpecVersion* = 1

const vkImgFilterCubicExtensionName* = "VK_IMG_filter_cubic"

const vkAmdExtension17ExtensionName* = "VK_AMD_extension_17"

const vkAmdExtension18ExtensionName* = "VK_AMD_extension_18"

const vkAmdRasterizationOrderSpecVersion* = 1

const vkAmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"

const vkAmdExtension20ExtensionName* = "VK_AMD_extension_20"

const vkAmdShaderTrinaryMinmaxSpecVersion* = 1

const vkAmdShaderTrinaryMinmaxExtensionName* = "VK_AMD_shader_trinary_minmax"

const vkAmdShaderExplicitVertexParameterSpecVersion* = 1

const vkAmdShaderExplicitVertexParameterExtensionName* = "VK_AMD_shader_explicit_vertex_parameter"

const vkExtDebugMarkerSpecVersion* = 4

const vkExtDebugMarkerExtensionName* = "VK_EXT_debug_marker"

const vkAmdExtension24ExtensionName* = "VK_AMD_extension_24"

const vkAmdExtension25ExtensionName* = "VK_AMD_extension_25"

const vkAmdGcnShaderSpecVersion* = 1

const vkAmdGcnShaderExtensionName* = "VK_AMD_gcn_shader"

const vkNvDedicatedAllocationSpecVersion* = 1

const vkNvDedicatedAllocationExtensionName* = "VK_NV_dedicated_allocation"

const vkExtExtension28ExtensionName* = "VK_NV_extension_28"

const vkExtTransformFeedbackSpecVersion* = 1

const vkExtTransformFeedbackExtensionName* = "VK_EXT_transform_feedback"

const vkNvxExtension30ExtensionName* = "VK_NVX_extension_30"

const vkNvxImageViewHandleSpecVersion* = 2

const vkNvxImageViewHandleExtensionName* = "VK_NVX_image_view_handle"

const vkAmdExtension32ExtensionName* = "VK_AMD_extension_32"

const vkAmdExtension33ExtensionName* = "VK_AMD_extension_33"

const vkAmdDrawIndirectCountSpecVersion* = 2

const vkAmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"

const vkAmdExtension35ExtensionName* = "VK_AMD_extension_35"

const vkAmdNegativeViewportHeightSpecVersion* = 1

const vkAmdNegativeViewportHeightExtensionName* = "VK_AMD_negative_viewport_height"

const vkAmdGpuShaderHalfFloatSpecVersion* = 2

const vkAmdGpuShaderHalfFloatExtensionName* = "VK_AMD_gpu_shader_half_float"

const vkAmdShaderBallotSpecVersion* = 1

const vkAmdShaderBallotExtensionName* = "VK_AMD_shader_ballot"

const vkAmdExtension39ExtensionName* = "VK_AMD_extension_39"

const vkAmdExtension40ExtensionName* = "VK_AMD_extension_40"

const vkAmdExtension41ExtensionName* = "VK_AMD_extension_41"

const vkAmdTextureGatherBiasLodSpecVersion* = 1

const vkAmdTextureGatherBiasLodExtensionName* = "VK_AMD_texture_gather_bias_lod"

const vkAmdShaderInfoSpecVersion* = 1

const vkAmdShaderInfoExtensionName* = "VK_AMD_shader_info"

const vkAmdExtension44ExtensionName* = "VK_AMD_extension_44"

const vkAmdExtension45ExtensionName* = "VK_AMD_extension_45"

const vkAmdExtension46ExtensionName* = "VK_AMD_extension_46"

const vkAmdShaderImageLoadStoreLodSpecVersion* = 1

const vkAmdShaderImageLoadStoreLodExtensionName* = "VK_AMD_shader_image_load_store_lod"

const vkNvxExtension48ExtensionName* = "VK_NVX_extension_48"

const vkGoogleExtension49ExtensionName* = "VK_GOOGLE_extension_49"

const vkGgpStreamDescriptorSurfaceSpecVersion* = 1

const vkGgpStreamDescriptorSurfaceExtensionName* = "VK_GGP_stream_descriptor_surface"

const vkNvCornerSampledImageSpecVersion* = 2

const vkNvCornerSampledImageExtensionName* = "VK_NV_corner_sampled_image"

const vkNvExtension52ExtensionName* = "VK_NV_extension_52"

const vkNvExtension53ExtensionName* = "VK_NV_extension_53"

const vkKhrMultiviewSpecVersion* = 1

const vkKhrMultiviewExtensionName* = "VK_KHR_multiview"

const vkImgFormatPvrtcSpecVersion* = 1

const vkImgFormatPvrtcExtensionName* = "VK_IMG_format_pvrtc"

const vkNvExternalMemoryCapabilitiesSpecVersion* = 1

const vkNvExternalMemoryCapabilitiesExtensionName* = "VK_NV_external_memory_capabilities"

const vkNvExternalMemorySpecVersion* = 1

const vkNvExternalMemoryExtensionName* = "VK_NV_external_memory"

const vkNvExternalMemoryWin32SpecVersion* = 1

const vkNvExternalMemoryWin32ExtensionName* = "VK_NV_external_memory_win32"

const vkNvWin32KeyedMutexSpecVersion* = 2

const vkNvWin32KeyedMutexExtensionName* = "VK_NV_win32_keyed_mutex"

const vkKhrGetPhysicalDeviceProperties2SpecVersion* = 2

const vkKhrGetPhysicalDeviceProperties2ExtensionName* = "VK_KHR_get_physical_device_properties2"

const vkKhrDeviceGroupSpecVersion* = 4

const vkKhrDeviceGroupExtensionName* = "VK_KHR_device_group"

const vkExtValidationFlagsSpecVersion* = 2

const vkExtValidationFlagsExtensionName* = "VK_EXT_validation_flags"

const vkNnViSurfaceSpecVersion* = 1

const vkNnViSurfaceExtensionName* = "VK_NN_vi_surface"

const vkKhrShaderDrawParametersSpecVersion* = 1

const vkKhrShaderDrawParametersExtensionName* = "VK_KHR_shader_draw_parameters"

const vkExtShaderSubgroupBallotSpecVersion* = 1

const vkExtShaderSubgroupBallotExtensionName* = "VK_EXT_shader_subgroup_ballot"

const vkExtShaderSubgroupVoteSpecVersion* = 1

const vkExtShaderSubgroupVoteExtensionName* = "VK_EXT_shader_subgroup_vote"

const vkExtTextureCompressionAstcHdrSpecVersion* = 1

const vkExtTextureCompressionAstcHdrExtensionName* = "VK_EXT_texture_compression_astc_hdr"

const vkExtAstcDecodeModeSpecVersion* = 1

const vkExtAstcDecodeModeExtensionName* = "VK_EXT_astc_decode_mode"

const vkImgExtension69ExtensionName* = "VK_IMG_extension_69"

const vkKhrMaintenance1SpecVersion* = 2

const vkKhrMaintenance1ExtensionName* = "VK_KHR_maintenance1"

const vkKhrDeviceGroupCreationSpecVersion* = 1

const vkKhrDeviceGroupCreationExtensionName* = "VK_KHR_device_group_creation"

const vkKhrExternalMemoryCapabilitiesSpecVersion* = 1

const vkKhrExternalMemoryCapabilitiesExtensionName* = "VK_KHR_external_memory_capabilities"

const vkKhrExternalMemorySpecVersion* = 1

const vkKhrExternalMemoryExtensionName* = "VK_KHR_external_memory"

const vkKhrExternalMemoryWin32SpecVersion* = 1

const vkKhrExternalMemoryWin32ExtensionName* = "VK_KHR_external_memory_win32"

const vkKhrExternalMemoryFdSpecVersion* = 1

const vkKhrExternalMemoryFdExtensionName* = "VK_KHR_external_memory_fd"

const vkKhrWin32KeyedMutexSpecVersion* = 1

const vkKhrWin32KeyedMutexExtensionName* = "VK_KHR_win32_keyed_mutex"

const vkKhrExternalSemaphoreCapabilitiesSpecVersion* = 1

const vkKhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"

const vkKhrExternalSemaphoreSpecVersion* = 1

const vkKhrExternalSemaphoreExtensionName* = "VK_KHR_external_semaphore"

const vkKhrExternalSemaphoreWin32SpecVersion* = 1

const vkKhrExternalSemaphoreWin32ExtensionName* = "VK_KHR_external_semaphore_win32"

const vkKhrExternalSemaphoreFdSpecVersion* = 1

const vkKhrExternalSemaphoreFdExtensionName* = "VK_KHR_external_semaphore_fd"

const vkKhrPushDescriptorSpecVersion* = 2

const vkKhrPushDescriptorExtensionName* = "VK_KHR_push_descriptor"

const vkExtConditionalRenderingSpecVersion* = 2

const vkExtConditionalRenderingExtensionName* = "VK_EXT_conditional_rendering"

const vkKhrShaderFloat16Int8SpecVersion* = 1

const vkKhrShaderFloat16Int8ExtensionName* = "VK_KHR_shader_float16_int8"

const vkKhr16bitStorageSpecVersion* = 1

const vkKhr16bitStorageExtensionName* = "VK_KHR_16bit_storage"

const vkKhrIncrementalPresentSpecVersion* = 1

const vkKhrIncrementalPresentExtensionName* = "VK_KHR_incremental_present"

const vkKhrDescriptorUpdateTemplateSpecVersion* = 1

const vkKhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

const vkNvxDeviceGeneratedCommandsSpecVersion* = 3

const vkNvxDeviceGeneratedCommandsExtensionName* = "VK_NVX_device_generated_commands"

const vkNvClipSpaceWScalingSpecVersion* = 1

const vkNvClipSpaceWScalingExtensionName* = "VK_NV_clip_space_w_scaling"

const vkExtDirectModeDisplaySpecVersion* = 1

const vkExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"

const vkExtAcquireXlibDisplaySpecVersion* = 1

const vkExtAcquireXlibDisplayExtensionName* = "VK_EXT_acquire_xlib_display"

const vkExtDisplaySurfaceCounterSpecVersion* = 1

const vkExtDisplaySurfaceCounterExtensionName* = "VK_EXT_display_surface_counter"

const vkExtDisplayControlSpecVersion* = 1

const vkExtDisplayControlExtensionName* = "VK_EXT_display_control"

const vkGoogleDisplayTimingSpecVersion* = 1

const vkGoogleDisplayTimingExtensionName* = "VK_GOOGLE_display_timing"

const vkNvSampleMaskOverrideCoverageSpecVersion* = 1

const vkNvSampleMaskOverrideCoverageExtensionName* = "VK_NV_sample_mask_override_coverage"

const vkNvGeometryShaderPassthroughSpecVersion* = 1

const vkNvGeometryShaderPassthroughExtensionName* = "VK_NV_geometry_shader_passthrough"

const vkNvViewportArray2SpecVersion* = 1

const vkNvViewportArray2ExtensionName* = "VK_NV_viewport_array2"

const vkNvxMultiviewPerViewAttributesSpecVersion* = 1

const vkNvxMultiviewPerViewAttributesExtensionName* = "VK_NVX_multiview_per_view_attributes"

const vkNvViewportSwizzleSpecVersion* = 1

const vkNvViewportSwizzleExtensionName* = "VK_NV_viewport_swizzle"

const vkExtDiscardRectanglesSpecVersion* = 1

const vkExtDiscardRectanglesExtensionName* = "VK_EXT_discard_rectangles"

const vkNvExtension101ExtensionName* = "VK_NV_extension_101"

const vkExtConservativeRasterizationSpecVersion* = 1

const vkExtConservativeRasterizationExtensionName* = "VK_EXT_conservative_rasterization"

const vkExtDepthClipEnableSpecVersion* = 1

const vkExtDepthClipEnableExtensionName* = "VK_EXT_depth_clip_enable"

const vkNvExtension104ExtensionName* = "VK_NV_extension_104"

const vkExtSwapchainColorSpaceSpecVersion* = 4

const vkExtSwapchainColorSpaceExtensionName* = "VK_EXT_swapchain_colorspace"

const vkExtHdrMetadataSpecVersion* = 2

const vkExtHdrMetadataExtensionName* = "VK_EXT_hdr_metadata"

const vkImgExtension107ExtensionName* = "VK_IMG_extension_107"

const vkImgExtension108ExtensionName* = "VK_IMG_extension_108"

const vkKhrImagelessFramebufferSpecVersion* = 1

const vkKhrImagelessFramebufferExtensionName* = "VK_KHR_imageless_framebuffer"

const vkKhrCreateRenderpass2SpecVersion* = 1

const vkKhrCreateRenderpass2ExtensionName* = "VK_KHR_create_renderpass2"

const vkImgExtension111ExtensionName* = "VK_IMG_extension_111"

const vkKhrSharedPresentableImageSpecVersion* = 1

const vkKhrSharedPresentableImageExtensionName* = "VK_KHR_shared_presentable_image"

const vkKhrExternalFenceCapabilitiesSpecVersion* = 1

const vkKhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"

const vkKhrExternalFenceSpecVersion* = 1

const vkKhrExternalFenceExtensionName* = "VK_KHR_external_fence"

const vkKhrExternalFenceWin32SpecVersion* = 1

const vkKhrExternalFenceWin32ExtensionName* = "VK_KHR_external_fence_win32"

const vkKhrExternalFenceFdSpecVersion* = 1

const vkKhrExternalFenceFdExtensionName* = "VK_KHR_external_fence_fd"

const vkKhrPerformanceQuerySpecVersion* = 1

const vkKhrPerformanceQueryExtensionName* = "VK_KHR_performance_query"

const vkKhrMaintenance2SpecVersion* = 1

const vkKhrMaintenance2ExtensionName* = "VK_KHR_maintenance2"

const vkKhrExtension119ExtensionName* = "VK_KHR_extension_119"

const vkKhrGetSurfaceCapabilities2SpecVersion* = 1

const vkKhrGetSurfaceCapabilities2ExtensionName* = "VK_KHR_get_surface_capabilities2"

const vkKhrVariablePointersSpecVersion* = 1

const vkKhrVariablePointersExtensionName* = "VK_KHR_variable_pointers"

const vkKhrGetDisplayProperties2SpecVersion* = 1

const vkKhrGetDisplayProperties2ExtensionName* = "VK_KHR_get_display_properties2"

const vkMvkIosSurfaceSpecVersion* = 3

const vkMvkIosSurfaceExtensionName* = "VK_MVK_ios_surface"

const vkMvkMacosSurfaceSpecVersion* = 3

const vkMvkMacosSurfaceExtensionName* = "VK_MVK_macos_surface"

const vkMvkMoltenvkExtensionName* = "VK_MVK_moltenvk"

const vkExtExternalMemoryDmaBufSpecVersion* = 1

const vkExtExternalMemoryDmaBufExtensionName* = "VK_EXT_external_memory_dma_buf"

const vkExtQueueFamilyForeignSpecVersion* = 1

const vkExtQueueFamilyForeignExtensionName* = "VK_EXT_queue_family_foreign"

const vkKhrDedicatedAllocationSpecVersion* = 3

const vkKhrDedicatedAllocationExtensionName* = "VK_KHR_dedicated_allocation"

const vkExtDebugUtilsSpecVersion* = 2

const vkExtDebugUtilsExtensionName* = "VK_EXT_debug_utils"

const vkAndroidExternalMemoryAndroidHardwareBufferSpecVersion* = 3

const vkAndroidExternalMemoryAndroidHardwareBufferExtensionName* = "VK_ANDROID_external_memory_android_hardware_buffer"

const vkExtSamplerFilterMinmaxSpecVersion* = 2

const vkExtSamplerFilterMinmaxExtensionName* = "VK_EXT_sampler_filter_minmax"

const vkKhrStorageBufferStorageClassSpecVersion* = 1

const vkKhrStorageBufferStorageClassExtensionName* = "VK_KHR_storage_buffer_storage_class"

const vkAmdGpuShaderInt16SpecVersion* = 2

const vkAmdGpuShaderInt16ExtensionName* = "VK_AMD_gpu_shader_int16"

const vkAmdExtension134ExtensionName* = "VK_AMD_extension_134"

const vkAmdExtension135ExtensionName* = "VK_AMD_extension_135"

const vkAmdExtension136ExtensionName* = "VK_AMD_extension_136"

const vkAmdMixedAttachmentSamplesSpecVersion* = 1

const vkAmdMixedAttachmentSamplesExtensionName* = "VK_AMD_mixed_attachment_samples"

const vkAmdShaderFragmentMaskSpecVersion* = 1

const vkAmdShaderFragmentMaskExtensionName* = "VK_AMD_shader_fragment_mask"

const vkExtInlineUniformBlockSpecVersion* = 1

const vkExtInlineUniformBlockExtensionName* = "VK_EXT_inline_uniform_block"

const vkAmdExtension140ExtensionName* = "VK_AMD_extension_140"

const vkExtShaderStencilExportSpecVersion* = 1

const vkExtShaderStencilExportExtensionName* = "VK_EXT_shader_stencil_export"

const vkAmdExtension142ExtensionName* = "VK_AMD_extension_142"

const vkAmdExtension143ExtensionName* = "VK_AMD_extension_143"

const vkExtSampleLocationsSpecVersion* = 1

const vkExtSampleLocationsExtensionName* = "VK_EXT_sample_locations"

const vkKhrRelaxedBlockLayoutSpecVersion* = 1

const vkKhrRelaxedBlockLayoutExtensionName* = "VK_KHR_relaxed_block_layout"

const vkKhrGetMemoryRequirements2SpecVersion* = 1

const vkKhrGetMemoryRequirements2ExtensionName* = "VK_KHR_get_memory_requirements2"

const vkKhrImageFormatListSpecVersion* = 1

const vkKhrImageFormatListExtensionName* = "VK_KHR_image_format_list"

const vkExtBlendOperationAdvancedSpecVersion* = 2

const vkExtBlendOperationAdvancedExtensionName* = "VK_EXT_blend_operation_advanced"

const vkNvFragmentCoverageToColorSpecVersion* = 1

const vkNvFragmentCoverageToColorExtensionName* = "VK_NV_fragment_coverage_to_color"

const vkKhrAccelerationStructureSpecVersion* = 11

const vkKhrAccelerationStructureExtensionName* = "VK_KHR_acceleration_structure"

const vkKhrRayTracingPipelineSpecVersion* = 1

const vkKhrRayTracingPipelineExtensionName* = "VK_KHR_ray_tracing_pipeline"

const vkKhrRayQuerySpecVersion* = 1

const vkKhrRayQueryExtensionName* = "VK_KHR_ray_query"

const vkNvExtension152ExtensionName* = "VK_NV_extension_152"

const vkNvFramebufferMixedSamplesSpecVersion* = 1

const vkNvFramebufferMixedSamplesExtensionName* = "VK_NV_framebuffer_mixed_samples"

const vkNvFillRectangleSpecVersion* = 1

const vkNvFillRectangleExtensionName* = "VK_NV_fill_rectangle"

const vkNvShaderSmBuiltinsSpecVersion* = 1

const vkNvShaderSmBuiltinsExtensionName* = "VK_NV_shader_sm_builtins"

const vkExtPostDepthCoverageSpecVersion* = 1

const vkExtPostDepthCoverageExtensionName* = "VK_EXT_post_depth_coverage"

const vkKhrSamplerYcbcrConversionSpecVersion* = 14

const vkKhrSamplerYcbcrConversionExtensionName* = "VK_KHR_sampler_ycbcr_conversion"

const vkKhrBindMemory2SpecVersion* = 1

const vkKhrBindMemory2ExtensionName* = "VK_KHR_bind_memory2"

const vkExtImageDrmFormatModifierSpecVersion* = 1

const vkExtImageDrmFormatModifierExtensionName* = "VK_EXT_image_drm_format_modifier"

const vkExtExtension160ExtensionName* = "VK_EXT_extension_160"

const vkExtValidationCacheSpecVersion* = 1

const vkExtValidationCacheExtensionName* = "VK_EXT_validation_cache"

const vkExtDescriptorIndexingSpecVersion* = 2

const vkExtDescriptorIndexingExtensionName* = "VK_EXT_descriptor_indexing"

const vkExtShaderViewportIndexLayerSpecVersion* = 1

const vkExtShaderViewportIndexLayerExtensionName* = "VK_EXT_shader_viewport_index_layer"

const vkKhrPortabilitySubsetSpecVersion* = 1

const vkKhrPortabilitySubsetExtensionName* = "VK_KHR_portability_subset"

const vkNvShadingRateImageSpecVersion* = 3

const vkNvShadingRateImageExtensionName* = "VK_NV_shading_rate_image"

const vkNvRayTracingSpecVersion* = 3

const vkNvRayTracingExtensionName* = "VK_NV_ray_tracing"

const vkNvRepresentativeFragmentTestSpecVersion* = 2

const vkNvRepresentativeFragmentTestExtensionName* = "VK_NV_representative_fragment_test"

const vkExtExtension168ExtensionName* = "VK_NV_extension_168"

const vkKhrMaintenance3SpecVersion* = 1

const vkKhrMaintenance3ExtensionName* = "VK_KHR_maintenance3"

const vkKhrDrawIndirectCountSpecVersion* = 1

const vkKhrDrawIndirectCountExtensionName* = "VK_KHR_draw_indirect_count"

const vkExtFilterCubicSpecVersion* = 3

const vkExtFilterCubicExtensionName* = "VK_EXT_filter_cubic"

const vkQcomRenderPassShaderResolveSpecVersion* = 4

const vkQcomRenderPassShaderResolveExtensionName* = "VK_QCOM_render_pass_shader_resolve"

const vkQcomExtension173ExtensionName* = "VK_QCOM_extension_173"

const vkQcomExtension174ExtensionName* = "VK_QCOM_extension_174"

const vkExtGlobalPrioritySpecVersion* = 2

const vkExtGlobalPriorityExtensionName* = "VK_EXT_global_priority"

const vkKhrShaderSubgroupExtendedTypesSpecVersion* = 1

const vkKhrShaderSubgroupExtendedTypesExtensionName* = "VK_KHR_shader_subgroup_extended_types"

const vkKhrExtension177ExtensionName* = "VK_KHR_extension_177"

const vkKhr8bitStorageSpecVersion* = 1

const vkKhr8bitStorageExtensionName* = "VK_KHR_8bit_storage"

const vkExtExternalMemoryHostSpecVersion* = 1

const vkExtExternalMemoryHostExtensionName* = "VK_EXT_external_memory_host"

const vkAmdBufferMarkerSpecVersion* = 1

const vkAmdBufferMarkerExtensionName* = "VK_AMD_buffer_marker"

const vkKhrShaderAtomicInt64SpecVersion* = 1

const vkKhrShaderAtomicInt64ExtensionName* = "VK_KHR_shader_atomic_int64"

const vkKhrShaderClockSpecVersion* = 1

const vkKhrShaderClockExtensionName* = "VK_KHR_shader_clock"

const vkKhrExtension183ExtensionName* = "VK_AMD_extension_183"

const vkAmdPipelineCompilerControlSpecVersion* = 1

const vkAmdPipelineCompilerControlExtensionName* = "VK_AMD_pipeline_compiler_control"

const vkExtCalibratedTimestampsSpecVersion* = 1

const vkExtCalibratedTimestampsExtensionName* = "VK_EXT_calibrated_timestamps"

const vkAmdShaderCorePropertiesSpecVersion* = 2

const vkAmdShaderCorePropertiesExtensionName* = "VK_AMD_shader_core_properties"

const vkKhrExtension187ExtensionName* = "VK_AMD_extension_187"

const vkKhrExtension188ExtensionName* = "VK_AMD_extension_188"

const vkKhrExtension189ExtensionName* = "VK_AMD_extension_189"

const vkAmdMemoryOverallocationBehaviorSpecVersion* = 1

const vkAmdMemoryOverallocationBehaviorExtensionName* = "VK_AMD_memory_overallocation_behavior"

const vkExtVertexAttributeDivisorSpecVersion* = 3

const vkExtVertexAttributeDivisorExtensionName* = "VK_EXT_vertex_attribute_divisor"

const vkGgpFrameTokenSpecVersion* = 1

const vkGgpFrameTokenExtensionName* = "VK_GGP_frame_token"

const vkExtPipelineCreationFeedbackSpecVersion* = 1

const vkExtPipelineCreationFeedbackExtensionName* = "VK_EXT_pipeline_creation_feedback"

const vkGoogleExtension194ExtensionName* = "VK_GOOGLE_extension_194"

const vkGoogleExtension195ExtensionName* = "VK_GOOGLE_extension_195"

const vkGoogleExtension196ExtensionName* = "VK_GOOGLE_extension_196"

const vkKhrDriverPropertiesSpecVersion* = 1

const vkKhrDriverPropertiesExtensionName* = "VK_KHR_driver_properties"

const vkKhrShaderFloatControlsSpecVersion* = 4

const vkKhrShaderFloatControlsExtensionName* = "VK_KHR_shader_float_controls"

const vkNvShaderSubgroupPartitionedSpecVersion* = 1

const vkNvShaderSubgroupPartitionedExtensionName* = "VK_NV_shader_subgroup_partitioned"

const vkKhrDepthStencilResolveSpecVersion* = 1

const vkKhrDepthStencilResolveExtensionName* = "VK_KHR_depth_stencil_resolve"

const vkKhrSwapchainMutableFormatSpecVersion* = 1

const vkKhrSwapchainMutableFormatExtensionName* = "VK_KHR_swapchain_mutable_format"

const vkNvComputeShaderDerivativesSpecVersion* = 1

const vkNvComputeShaderDerivativesExtensionName* = "VK_NV_compute_shader_derivatives"

const vkNvMeshShaderSpecVersion* = 1

const vkNvMeshShaderExtensionName* = "VK_NV_mesh_shader"

const vkNvFragmentShaderBarycentricSpecVersion* = 1

const vkNvFragmentShaderBarycentricExtensionName* = "VK_NV_fragment_shader_barycentric"

const vkNvShaderImageFootprintSpecVersion* = 2

const vkNvShaderImageFootprintExtensionName* = "VK_NV_shader_image_footprint"

const vkNvScissorExclusiveSpecVersion* = 1

const vkNvScissorExclusiveExtensionName* = "VK_NV_scissor_exclusive"

const vkNvDeviceDiagnosticCheckpointsSpecVersion* = 2

const vkNvDeviceDiagnosticCheckpointsExtensionName* = "VK_NV_device_diagnostic_checkpoints"

const vkKhrTimelineSemaphoreSpecVersion* = 2

const vkKhrTimelineSemaphoreExtensionName* = "VK_KHR_timeline_semaphore"

const vkKhrExtension209ExtensionName* = "VK_KHR_extension_209"

const vkIntelShaderIntegerFunctions2SpecVersion* = 1

const vkIntelShaderIntegerFunctions2ExtensionName* = "VK_INTEL_shader_integer_functions2"

const vkIntelPerformanceQuerySpecVersion* = 2

const vkIntelPerformanceQueryExtensionName* = "VK_INTEL_performance_query"

const vkKhrVulkanMemoryModelSpecVersion* = 3

const vkKhrVulkanMemoryModelExtensionName* = "VK_KHR_vulkan_memory_model"

const vkExtPciBusInfoSpecVersion* = 2

const vkExtPciBusInfoExtensionName* = "VK_EXT_pci_bus_info"

const vkAmdDisplayNativeHdrSpecVersion* = 1

const vkAmdDisplayNativeHdrExtensionName* = "VK_AMD_display_native_hdr"

const vkFuchsiaImagepipeSurfaceSpecVersion* = 1

const vkFuchsiaImagepipeSurfaceExtensionName* = "VK_FUCHSIA_imagepipe_surface"

const vkKhrShaderTerminateInvocationSpecVersion* = 1

const vkKhrShaderTerminateInvocationExtensionName* = "VK_KHR_shader_terminate_invocation"

const vkKhrExtension217ExtensionName* = "VK_KHR_extension_217"

const vkExtMetalSurfaceSpecVersion* = 1

const vkExtMetalSurfaceExtensionName* = "VK_EXT_metal_surface"

const vkExtFragmentDensityMapSpecVersion* = 1

const vkExtFragmentDensityMapExtensionName* = "VK_EXT_fragment_density_map"

const vkExtExtension220ExtensionName* = "VK_EXT_extension_220"

const vkKhrExtension221ExtensionName* = "VK_KHR_extension_221"

const vkExtScalarBlockLayoutSpecVersion* = 1

const vkExtScalarBlockLayoutExtensionName* = "VK_EXT_scalar_block_layout"

const vkExtExtension223ExtensionName* = "VK_EXT_extension_223"

const vkGoogleHlslFunctionality1SpecVersion* = 1

const vkGoogleHlslFunctionality1ExtensionName* = "VK_GOOGLE_hlsl_functionality1"

const vkGoogleDecorateStringSpecVersion* = 1

const vkGoogleDecorateStringExtensionName* = "VK_GOOGLE_decorate_string"

const vkExtSubgroupSizeControlSpecVersion* = 2

const vkExtSubgroupSizeControlExtensionName* = "VK_EXT_subgroup_size_control"

const vkKhrFragmentShadingRateSpecVersion* = 1

const vkKhrFragmentShadingRateExtensionName* = "VK_KHR_fragment_shading_rate"

const vkAmdShaderCoreProperties2SpecVersion* = 1

const vkAmdShaderCoreProperties2ExtensionName* = "VK_AMD_shader_core_properties2"

const vkAmdExtension229ExtensionName* = "VK_AMD_extension_229"

const vkAmdDeviceCoherentMemorySpecVersion* = 1

const vkAmdDeviceCoherentMemoryExtensionName* = "VK_AMD_device_coherent_memory"

const vkAmdExtension231ExtensionName* = "VK_AMD_extension_231"

const vkAmdExtension232ExtensionName* = "VK_AMD_extension_232"

const vkAmdExtension233ExtensionName* = "VK_AMD_extension_233"

const vkAmdExtension234ExtensionName* = "VK_AMD_extension_234"

const vkExtShaderImageAtomicInt64SpecVersion* = 1

const vkExtShaderImageAtomicInt64ExtensionName* = "VK_EXT_shader_image_atomic_int64"

const vkAmdExtension236ExtensionName* = "VK_AMD_extension_236"

const vkKhrSpirv14SpecVersion* = 1

const vkKhrSpirv14ExtensionName* = "VK_KHR_spirv_1_4"

const vkExtMemoryBudgetSpecVersion* = 1

const vkExtMemoryBudgetExtensionName* = "VK_EXT_memory_budget"

const vkExtMemoryPrioritySpecVersion* = 1

const vkExtMemoryPriorityExtensionName* = "VK_EXT_memory_priority"

const vkKhrSurfaceProtectedCapabilitiesSpecVersion* = 1

const vkKhrSurfaceProtectedCapabilitiesExtensionName* = "VK_KHR_surface_protected_capabilities"

const vkNvDedicatedAllocationImageAliasingSpecVersion* = 1

const vkNvDedicatedAllocationImageAliasingExtensionName* = "VK_NV_dedicated_allocation_image_aliasing"

const vkKhrSeparateDepthStencilLayoutsSpecVersion* = 1

const vkKhrSeparateDepthStencilLayoutsExtensionName* = "VK_KHR_separate_depth_stencil_layouts"

const vkIntelExtension243ExtensionName* = "VK_INTEL_extension_243"

const vkMesaExtension244ExtensionName* = "VK_MESA_extension_244"

const vkExtBufferDeviceAddressSpecVersion* = 2

const vkExtBufferDeviceAddressExtensionName* = "VK_EXT_buffer_device_address"

const vkExtToolingInfoSpecVersion* = 1

const vkExtToolingInfoExtensionName* = "VK_EXT_tooling_info"

const vkExtSeparateStencilUsageSpecVersion* = 1

const vkExtSeparateStencilUsageExtensionName* = "VK_EXT_separate_stencil_usage"

const vkExtValidationFeaturesSpecVersion* = 4

const vkExtValidationFeaturesExtensionName* = "VK_EXT_validation_features"

const vkKhrExtension249ExtensionName* = "VK_KHR_extension_249"

const vkNvCooperativeMatrixSpecVersion* = 1

const vkNvCooperativeMatrixExtensionName* = "VK_NV_cooperative_matrix"

const vkNvCoverageReductionModeSpecVersion* = 1

const vkNvCoverageReductionModeExtensionName* = "VK_NV_coverage_reduction_mode"

const vkExtFragmentShaderInterlockSpecVersion* = 1

const vkExtFragmentShaderInterlockExtensionName* = "VK_EXT_fragment_shader_interlock"

const vkExtYcbcrImageArraysSpecVersion* = 1

const vkExtYcbcrImageArraysExtensionName* = "VK_EXT_ycbcr_image_arrays"

const vkKhrUniformBufferStandardLayoutSpecVersion* = 1

const vkKhrUniformBufferStandardLayoutExtensionName* = "VK_KHR_uniform_buffer_standard_layout"

const vkExtExtension255ExtensionName* = "VK_EXT_extension_255"

const vkExtFullScreenExclusiveSpecVersion* = 4

const vkExtFullScreenExclusiveExtensionName* = "VK_EXT_full_screen_exclusive"

const vkExtHeadlessSurfaceSpecVersion* = 1

const vkExtHeadlessSurfaceExtensionName* = "VK_EXT_headless_surface"

const vkKhrBufferDeviceAddressSpecVersion* = 1

const vkKhrBufferDeviceAddressExtensionName* = "VK_KHR_buffer_device_address"

const vkExtExtension259ExtensionName* = "VK_EXT_extension_259"

const vkExtLineRasterizationSpecVersion* = 1

const vkExtLineRasterizationExtensionName* = "VK_EXT_line_rasterization"

const vkExtShaderAtomicFloatSpecVersion* = 1

const vkExtShaderAtomicFloatExtensionName* = "VK_EXT_shader_atomic_float"

const vkExtHostQueryResetSpecVersion* = 1

const vkExtHostQueryResetExtensionName* = "VK_EXT_host_query_reset"

const vkGoogleExtension263ExtensionName* = "VK_GGP_extension_263"

const vkBrcmExtension264ExtensionName* = "VK_BRCM_extension_264"

const vkBrcmExtension265ExtensionName* = "VK_BRCM_extension_265"

const vkExtIndexTypeUint8SpecVersion* = 1

const vkExtIndexTypeUint8ExtensionName* = "VK_EXT_index_type_uint8"

const vkExtExtension267* = "VK_EXT_extension_267"

const vkExtExtendedDynamicStateSpecVersion* = 1

const vkExtExtendedDynamicStateExtensionName* = "VK_EXT_extended_dynamic_state"

const vkKhrDeferredHostOperationsSpecVersion* = 4

const vkKhrDeferredHostOperationsExtensionName* = "VK_KHR_deferred_host_operations"

const vkKhrPipelineExecutablePropertiesSpecVersion* = 1

const vkKhrPipelineExecutablePropertiesExtensionName* = "VK_KHR_pipeline_executable_properties"

const vkIntelExtension271* = "VK_KHR_extension_271"

const vkIntelExtension272* = "VK_KHR_extension_272"

const vkIntelExtension273* = "VK_KHR_extension_273"

const vkIntelExtension274* = "VK_KHR_extension_274"

const vkKhrExtension275* = "VK_KHR_extension_275"

const vkKhrExtension276* = "VK_KHR_extension_276"

const vkExtShaderDemoteToHelperInvocationSpecVersion* = 1

const vkExtShaderDemoteToHelperInvocationExtensionName* = "VK_EXT_shader_demote_to_helper_invocation"

const vkNvDeviceGeneratedCommandsSpecVersion* = 3

const vkNvDeviceGeneratedCommandsExtensionName* = "VK_NV_device_generated_commands"

const vkNvExtension279* = "VK_NV_extension_279"

const vkKhrExtension280* = "VK_KHR_extension_280"

const vkArmExtension281* = "VK_ARM_extension_281"

const vkExtTexelBufferAlignmentSpecVersion* = 1

const vkExtTexelBufferAlignmentExtensionName* = "VK_EXT_texel_buffer_alignment"

const vkQcomRenderPassTransformSpecVersion* = 1

const vkQcomRenderPassTransformExtensionName* = "VK_QCOM_render_pass_transform"

const vkExtExtension284* = "VK_EXT_extension_284"

const vkExtDeviceMemoryReportSpecVersion* = 2

const vkExtDeviceMemoryReportExtensionName* = "VK_EXT_device_memory_report"

const vkExtExtension286* = "VK_EXT_extension_286"

const vkExtRobustness2SpecVersion* = 1

const vkExtRobustness2ExtensionName* = "VK_EXT_robustness2"

const vkExtCustomBorderColorSpecVersion* = 12

const vkExtCustomBorderColorExtensionName* = "VK_EXT_custom_border_color"

const vkExtExtension289ExtensionName* = "VK_EXT_extension_289"

const vkGoogleUserTypeSpecVersion* = 1

const vkGoogleUserTypeExtensionName* = "VK_GOOGLE_user_type"

const vkKhrPipelineLibrarySpecVersion* = 1

const vkKhrPipelineLibraryExtensionName* = "VK_KHR_pipeline_library"

const vkNvExtension292ExtensionName* = "VK_NV_extension_292"

const vkNvExtension293ExtensionName* = "VK_NV_extension_293"

const vkKhrShaderNonSemanticInfoSpecVersion* = 1

const vkKhrShaderNonSemanticInfoExtensionName* = "VK_KHR_shader_non_semantic_info"

const vkKhrExtension295ExtensionName* = "VK_KHR_extension_295"

const vkExtPrivateDataSpecVersion* = 1

const vkExtPrivateDataExtensionName* = "VK_EXT_private_data"

const vkKhrExtension297ExtensionName* = "VK_KHR_extension_297"

const vkExtPipelineCreationCacheControlSpecVersion* = 3

const vkExtPipelineCreationCacheControlExtensionName* = "VK_EXT_pipeline_creation_cache_control"

const vkKhrExtension299ExtensionName* = "VK_KHR_extension_299"

const vkKhrExtension300ExtensionName* = "VK_KHR_extension_300"

const vkNvDeviceDiagnosticsConfigSpecVersion* = 1

const vkNvDeviceDiagnosticsConfigExtensionName* = "VK_NV_device_diagnostics_config"

const vkQcomRenderPassStoreOpsSpecVersion* = 2

const vkQcomRenderPassStoreOpsExtensionName* = "VK_QCOM_render_pass_store_ops"

const vkQcomExtension303ExtensionName* = "VK_QCOM_extension_303"

const vkQcomExtension304ExtensionName* = "VK_QCOM_extension_304"

const vkQcomExtension305ExtensionName* = "VK_QCOM_extension_305"

const vkQcomExtension306ExtensionName* = "VK_QCOM_extension_306"

const vkQcomExtension307ExtensionName* = "VK_QCOM_extension_307"

const vkNvExtension308ExtensionName* = "VK_NV_extension_308"

const vkKhrExtension309ExtensionName* = "VK_KHR_extension_309"

const vkQcomExtension310ExtensionName* = "VK_QCOM_extension_310"

const vkNvExtension311ExtensionName* = "VK_NV_extension_311"

const vkExtExtension312ExtensionName* = "VK_EXT_extension_312"

const vkExtExtension313ExtensionName* = "VK_EXT_extension_313"

const vkAmdExtension314ExtensionName* = "VK_AMD_extension_314"

const vkKhrSynchronization2SpecVersion* = 1

const vkKhrSynchronization2ExtensionName* = "VK_KHR_synchronization2"

const vkAmdExtension316ExtensionName* = "VK_AMD_extension_316"

const vkAmdExtension317ExtensionName* = "VK_AMD_extension_317"

const vkAmdExtension318ExtensionName* = "VK_AMD_extension_318"

const vkAmdExtension319ExtensionName* = "VK_AMD_extension_319"

const vkAmdExtension320ExtensionName* = "VK_AMD_extension_320"

const vkAmdExtension321ExtensionName* = "VK_AMD_extension_321"

const vkAmdExtension322ExtensionName* = "VK_AMD_extension_322"

const vkAmdExtension323ExtensionName* = "VK_AMD_extension_323"

const vkKhrExtension324ExtensionName* = "VK_KHR_extension_324"

const vkKhrExtension325ExtensionName* = "VK_KHR_extension_325"

const vkKhrZeroInitializeWorkgroupMemorySpecVersion* = 1

const vkKhrZeroInitializeWorkgroupMemoryExtensionName* = "VK_KHR_zero_initialize_workgroup_memory"

const vkNvFragmentShadingRateEnumsSpecVersion* = 1

const vkNvFragmentShadingRateEnumsExtensionName* = "VK_NV_fragment_shading_rate_enums"

const vkNvExtension328ExtensionName* = "VK_NV_extension_328"

const vkNvExtension329ExtensionName* = "VK_NV_extension_329"

const vkNvExtension330ExtensionName* = "VK_NV_extension_330"

const vkNvExtension331ExtensionName* = "VK_NV_extension_331"

const vkNvExtension332ExtensionName* = "VK_NV_extension_332"

const vkExtFragmentDensityMap2SpecVersion* = 1

const vkExtFragmentDensityMap2ExtensionName* = "VK_EXT_fragment_density_map2"

const vkQcomRotatedCopyCommandsExtensionName* = "VK_QCOM_rotated_copy_commands"

const vkKhrExtension335ExtensionName* = "VK_KHR_extension_335"

const vkExtImageRobustnessSpecVersion* = 1

const vkExtImageRobustnessExtensionName* = "VK_EXT_image_robustness"

const vkKhrWorkgroupMemoryExplicitLayoutSpecVersion* = 1

const vkKhrWorkgroupMemoryExplicitLayoutExtensionName* = "VK_KHR_workgroup_memory_explicit_layout"

const vkKhrCopyCommands2SpecVersion* = 1

const vkKhrCopyCommands2ExtensionName* = "VK_KHR_copy_commands2"

const vkArmExtension339ExtensionName* = "VK_ARM_extension_339"

const vkExtExtension340ExtensionName* = "VK_EXT_extension_340"

const vkExt4444FormatsSpecVersion* = 1

const vkExt4444FormatsExtensionName* = "VK_EXT_4444_formats"

const vkExtExtension342ExtensionName* = "VK_EXT_extension_342"

const vkArmExtension343ExtensionName* = "VK_ARM_extension_343"

const vkArmExtension344ExtensionName* = "VK_ARM_extension_344"

const vkArmExtension345ExtensionName* = "VK_ARM_extension_345"

const vkNvAcquireWinrtDisplaySpecVersion* = 1

const vkNvAcquireWinrtDisplayExtensionName* = "VK_NV_acquire_winrt_display"

const vkExtDirectfbSurfaceSpecVersion* = 1

const vkExtDirectfbSurfaceExtensionName* = "VK_EXT_directfb_surface"

const vkKhrExtension350ExtensionName* = "VK_KHR_extension_350"

const vkNvExtension351ExtensionName* = "VK_NV_extension_351"

const vkValveMutableDescriptorTypeSpecVersion* = 1

const vkValveMutableDescriptorTypeExtensionName* = "VK_VALVE_mutable_descriptor_type"

const vkExtExtension353ExtensionName* = "VK_EXT_extension_353"

const vkExtExtension354ExtensionName* = "VK_EXT_extension_354"

const vkExtExtension355ExtensionName* = "VK_EXT_extension_355"

const vkExtVertexAttributeAliasingExtensionName* = "VK_EXT_vertex_attribute_aliasing"

const vkExtExtension357* = "VK_EXT_extension_357"

const vkKhrExtension358ExtensionName* = "VK_KHR_extension_358"

const vkExtExtension359* = "VK_EXT_extension_359"

const vkExtExtension360* = "VK_EXT_extension_360"

const vkExtExtension361* = "VK_EXT_extension_361"

const vkExtExtension362ExtensionName* = "VK_EXT_extension_362"

const vkExtExtension363ExtensionName* = "VK_EXT_extension_363"

const vkExtExtension364ExtensionName* = "VK_EXT_extension_364"

const vkExtExtension365ExtensionName* = "VK_EXT_extension_365"

const vkExtExtension366ExtensionName* = "VK_EXT_extension_366"

const vkExtExtension367ExtensionName* = "VK_EXT_extension_367"

const vkExtExtension368ExtensionName* = "VK_EXT_extension_368"

const vkQcomExtension369ExtensionName* = "VK_QCOM_extension_369"

const vkHuaweiExtension370ExtensionName* = "VK_HUAWEI_extension_370"

const vkHuaweiExtension371ExtensionName* = "VK_HUAWEI_extension_371"

const vkNvExtension372ExtensionName* = "VK_NV_extension_372"

const vkNvExtension373ExtensionName* = "VK_NV_extension_373"

const vkNvExtension374ExtensionName* = "VK_NV_extension_374"

const vkNvExtension375ExtensionName* = "VK_NV_extension_375"

const vkExtExtension376ExtensionName* = "VK_EXT_extension_376"

const vkExtExtension377ExtensionName* = "VK_EXT_extension_377"

const vkNvExtension378ExtensionName* = "VK_NV_extension_378"

const vkQnxScreenSurfaceSpecVersion* = 1

const vkQnxScreenSurfaceExtensionName* = "VK_QNX_screen_surface"

const vkKhrExtension380ExtensionName* = "VK_KHR_extension_380"

const vkKhrExtension381ExtensionName* = "VK_KHR_extension_381"

const vkExtExtension382ExtensionName* = "VK_EXT_extension_382"

const vkExtExtension383ExtensionName* = "VK_EXT_extension_383"

const vkExtExtension384ExtensionName* = "VK_EXT_extension_384"

const vkMesaExtension385ExtensionName* = "VK_MESA_extension_385"

const vkGoogleExtension386ExtensionName* = "VK_GOOGLE_extension_386"

const vkKhrExtension387ExtensionName* = "VK_KHR_extension_387"

const vkExtExtension388ExtensionName* = "VK_EXT_extension_388"

const vkExtExtension389ExtensionName* = "VK_EXT_extension_389"

# Types

type
  Display* = ptr object
  VisualID* = ptr object
  Window* = ptr object
  RROutput* = ptr object
  wl_display* = ptr object
  wl_surface* = ptr object
  HINSTANCE* = ptr object
  HWND* = ptr object
  HMONITOR* = ptr object
  HANDLE* = ptr object
  SECURITY_ATTRIBUTES* = ptr object
  DWORD* = ptr object
  LPCWSTR* = ptr object
  xcb_connection_t* = ptr object
  xcb_visualid_t* = ptr object
  xcb_window_t* = ptr object
  IDirectFB* = ptr object
  IDirectFBSurface* = ptr object
  zx_handle_t* = ptr object
  GgpStreamDescriptor* = ptr object
  GgpFrameToken* = ptr object
  screen_context* = ptr object
  screen_window* = ptr object

template vkMakeVersion*(major, minor, patch: untyped): untyped =
  ((((uint32)(major)) shl 22) or (((uint32)(minor)) shl 12) or ((uint32)(patch)))

template vkVersionMajor*(version: untyped): untyped =
  ((uint32)(version) shr 22)

template vkVersionMinor*(version: untyped): untyped =
  (((uint32)(version) shr 12) and 0x000003FF)

template vkVersionPatch*(version: untyped): untyped =
  ((uint32)(version) and 0x00000FFF)



const vkApiVersion1_0* = vkMakeVersion(1, 0, 0)

const vkApiVersion1_1* = vkMakeVersion(1, 1, 0)

const vkApiVersion1_2* = vkMakeVersion(1, 2, 0)







const vkNullHandle* = 0

type
  ANativeWindow* = pointer
  AHardwareBuffer* = pointer
  CAMetalLayer* = pointer
  VkSampleMask* = uint32
  VkBool32* = uint32
  VkFlags* = uint32
  VkFlags64* = uint64
  VkDeviceSize* = uint64
  VkDeviceAddress* = uint64
  VkFramebufferCreateFlags* = VkFlags
  VkQueryPoolCreateFlags* = VkFlags
  VkRenderPassCreateFlags* = VkFlags
  VkSamplerCreateFlags* = VkFlags
  VkPipelineLayoutCreateFlags* = VkFlags
  VkPipelineCacheCreateFlags* = VkFlags
  VkPipelineDepthStencilStateCreateFlags* = VkFlags
  VkPipelineDynamicStateCreateFlags* = VkFlags
  VkPipelineColorBlendStateCreateFlags* = VkFlags
  VkPipelineMultisampleStateCreateFlags* = VkFlags
  VkPipelineRasterizationStateCreateFlags* = VkFlags
  VkPipelineViewportStateCreateFlags* = VkFlags
  VkPipelineTessellationStateCreateFlags* = VkFlags
  VkPipelineInputAssemblyStateCreateFlags* = VkFlags
  VkPipelineVertexInputStateCreateFlags* = VkFlags
  VkPipelineShaderStageCreateFlags* = VkFlags
  VkDescriptorSetLayoutCreateFlags* = VkFlags
  VkBufferViewCreateFlags* = VkFlags
  VkInstanceCreateFlags* = VkFlags
  VkDeviceCreateFlags* = VkFlags
  VkDeviceQueueCreateFlags* = VkFlags
  VkQueueFlags* = VkFlags
  VkMemoryPropertyFlags* = VkFlags
  VkMemoryHeapFlags* = VkFlags
  VkAccessFlags* = VkFlags
  VkBufferUsageFlags* = VkFlags
  VkBufferCreateFlags* = VkFlags
  VkShaderStageFlags* = VkFlags
  VkImageUsageFlags* = VkFlags
  VkImageCreateFlags* = VkFlags
  VkImageViewCreateFlags* = VkFlags
  VkPipelineCreateFlags* = VkFlags
  VkColorComponentFlags* = VkFlags
  VkFenceCreateFlags* = VkFlags
  VkSemaphoreCreateFlags* = VkFlags
  VkFormatFeatureFlags* = VkFlags
  VkQueryControlFlags* = VkFlags
  VkQueryResultFlags* = VkFlags
  VkShaderModuleCreateFlags* = VkFlags
  VkEventCreateFlags* = VkFlags
  VkCommandPoolCreateFlags* = VkFlags
  VkCommandPoolResetFlags* = VkFlags
  VkCommandBufferResetFlags* = VkFlags
  VkCommandBufferUsageFlags* = VkFlags
  VkQueryPipelineStatisticFlags* = VkFlags
  VkMemoryMapFlags* = VkFlags
  VkImageAspectFlags* = VkFlags
  VkSparseMemoryBindFlags* = VkFlags
  VkSparseImageFormatFlags* = VkFlags
  VkSubpassDescriptionFlags* = VkFlags
  VkPipelineStageFlags* = VkFlags
  VkSampleCountFlags* = VkFlags
  VkAttachmentDescriptionFlags* = VkFlags
  VkStencilFaceFlags* = VkFlags
  VkCullModeFlags* = VkFlags
  VkDescriptorPoolCreateFlags* = VkFlags
  VkDescriptorPoolResetFlags* = VkFlags
  VkDependencyFlags* = VkFlags
  VkSubgroupFeatureFlags* = VkFlags
  VkIndirectCommandsLayoutUsageFlagsNV* = VkFlags
  VkIndirectStateFlagsNV* = VkFlags
  VkGeometryFlagsKHR* = VkFlags
  VkGeometryFlagsNV* = VkGeometryFlagsKHR
  VkGeometryInstanceFlagsKHR* = VkFlags
  VkGeometryInstanceFlagsNV* = VkGeometryInstanceFlagsKHR
  VkBuildAccelerationStructureFlagsKHR* = VkFlags
  VkBuildAccelerationStructureFlagsNV* = VkBuildAccelerationStructureFlagsKHR
  VkPrivateDataSlotCreateFlagsEXT* = VkFlags
  VkAccelerationStructureCreateFlagsKHR* = VkFlags
  VkDescriptorUpdateTemplateCreateFlags* = VkFlags
  VkDescriptorUpdateTemplateCreateFlagsKHR* = VkDescriptorUpdateTemplateCreateFlags
  VkPipelineCreationFeedbackFlagsEXT* = VkFlags
  VkPerformanceCounterDescriptionFlagsKHR* = VkFlags
  VkAcquireProfilingLockFlagsKHR* = VkFlags
  VkSemaphoreWaitFlags* = VkFlags
  VkSemaphoreWaitFlagsKHR* = VkSemaphoreWaitFlags
  VkPipelineCompilerControlFlagsAMD* = VkFlags
  VkShaderCorePropertiesFlagsAMD* = VkFlags
  VkDeviceDiagnosticsConfigFlagsNV* = VkFlags
  VkAccessFlags2KHR* = VkFlags64
  VkPipelineStageFlags2KHR* = VkFlags64
  VkCompositeAlphaFlagsKHR* = VkFlags
  VkDisplayPlaneAlphaFlagsKHR* = VkFlags
  VkSurfaceTransformFlagsKHR* = VkFlags
  VkSwapchainCreateFlagsKHR* = VkFlags
  VkDisplayModeCreateFlagsKHR* = VkFlags
  VkDisplaySurfaceCreateFlagsKHR* = VkFlags
  VkAndroidSurfaceCreateFlagsKHR* = VkFlags
  VkViSurfaceCreateFlagsNN* = VkFlags
  VkWaylandSurfaceCreateFlagsKHR* = VkFlags
  VkWin32SurfaceCreateFlagsKHR* = VkFlags
  VkXlibSurfaceCreateFlagsKHR* = VkFlags
  VkXcbSurfaceCreateFlagsKHR* = VkFlags
  VkDirectFBSurfaceCreateFlagsEXT* = VkFlags
  VkIOSSurfaceCreateFlagsMVK* = VkFlags
  VkMacOSSurfaceCreateFlagsMVK* = VkFlags
  VkMetalSurfaceCreateFlagsEXT* = VkFlags
  VkImagePipeSurfaceCreateFlagsFUCHSIA* = VkFlags
  VkStreamDescriptorSurfaceCreateFlagsGGP* = VkFlags
  VkHeadlessSurfaceCreateFlagsEXT* = VkFlags
  VkScreenSurfaceCreateFlagsQNX* = VkFlags
  VkPeerMemoryFeatureFlags* = VkFlags
  VkPeerMemoryFeatureFlagsKHR* = VkPeerMemoryFeatureFlags
  VkMemoryAllocateFlags* = VkFlags
  VkMemoryAllocateFlagsKHR* = VkMemoryAllocateFlags
  VkDeviceGroupPresentModeFlagsKHR* = VkFlags
  VkDebugReportFlagsEXT* = VkFlags
  VkCommandPoolTrimFlags* = VkFlags
  VkCommandPoolTrimFlagsKHR* = VkCommandPoolTrimFlags
  VkExternalMemoryHandleTypeFlagsNV* = VkFlags
  VkExternalMemoryFeatureFlagsNV* = VkFlags
  VkExternalMemoryHandleTypeFlags* = VkFlags
  VkExternalMemoryHandleTypeFlagsKHR* = VkExternalMemoryHandleTypeFlags
  VkExternalMemoryFeatureFlags* = VkFlags
  VkExternalMemoryFeatureFlagsKHR* = VkExternalMemoryFeatureFlags
  VkExternalSemaphoreHandleTypeFlags* = VkFlags
  VkExternalSemaphoreHandleTypeFlagsKHR* = VkExternalSemaphoreHandleTypeFlags
  VkExternalSemaphoreFeatureFlags* = VkFlags
  VkExternalSemaphoreFeatureFlagsKHR* = VkExternalSemaphoreFeatureFlags
  VkSemaphoreImportFlags* = VkFlags
  VkSemaphoreImportFlagsKHR* = VkSemaphoreImportFlags
  VkExternalFenceHandleTypeFlags* = VkFlags
  VkExternalFenceHandleTypeFlagsKHR* = VkExternalFenceHandleTypeFlags
  VkExternalFenceFeatureFlags* = VkFlags
  VkExternalFenceFeatureFlagsKHR* = VkExternalFenceFeatureFlags
  VkFenceImportFlags* = VkFlags
  VkFenceImportFlagsKHR* = VkFenceImportFlags
  VkSurfaceCounterFlagsEXT* = VkFlags
  VkPipelineViewportSwizzleStateCreateFlagsNV* = VkFlags
  VkPipelineDiscardRectangleStateCreateFlagsEXT* = VkFlags
  VkPipelineCoverageToColorStateCreateFlagsNV* = VkFlags
  VkPipelineCoverageModulationStateCreateFlagsNV* = VkFlags
  VkPipelineCoverageReductionStateCreateFlagsNV* = VkFlags
  VkValidationCacheCreateFlagsEXT* = VkFlags
  VkDebugUtilsMessageSeverityFlagsEXT* = VkFlags
  VkDebugUtilsMessageTypeFlagsEXT* = VkFlags
  VkDebugUtilsMessengerCreateFlagsEXT* = VkFlags
  VkDebugUtilsMessengerCallbackDataFlagsEXT* = VkFlags
  VkDeviceMemoryReportFlagsEXT* = VkFlags
  VkPipelineRasterizationConservativeStateCreateFlagsEXT* = VkFlags
  VkDescriptorBindingFlags* = VkFlags
  VkDescriptorBindingFlagsEXT* = VkDescriptorBindingFlags
  VkConditionalRenderingFlagsEXT* = VkFlags
  VkResolveModeFlags* = VkFlags
  VkResolveModeFlagsKHR* = VkResolveModeFlags
  VkPipelineRasterizationStateStreamCreateFlagsEXT* = VkFlags
  VkPipelineRasterizationDepthClipStateCreateFlagsEXT* = VkFlags
  VkSwapchainImageUsageFlagsANDROID* = VkFlags
  VkToolPurposeFlagsEXT* = VkFlags
  VkSubmitFlagsKHR* = VkFlags
  VkInstance* = VkHandle
  VkPhysicalDevice* = VkHandle
  VkDevice* = VkHandle
  VkQueue* = VkHandle
  VkCommandBuffer* = VkHandle
  VkDeviceMemory* = VkNonDispatchableHandle
  VkCommandPool* = VkNonDispatchableHandle
  VkBuffer* = VkNonDispatchableHandle
  VkBufferView* = VkNonDispatchableHandle
  VkImage* = VkNonDispatchableHandle
  VkImageView* = VkNonDispatchableHandle
  VkShaderModule* = VkNonDispatchableHandle
  VkPipeline* = VkNonDispatchableHandle
  VkPipelineLayout* = VkNonDispatchableHandle
  VkSampler* = VkNonDispatchableHandle
  VkDescriptorSet* = VkNonDispatchableHandle
  VkDescriptorSetLayout* = VkNonDispatchableHandle
  VkDescriptorPool* = VkNonDispatchableHandle
  VkFence* = VkNonDispatchableHandle
  VkSemaphore* = VkNonDispatchableHandle
  VkEvent* = VkNonDispatchableHandle
  VkQueryPool* = VkNonDispatchableHandle
  VkFramebuffer* = VkNonDispatchableHandle
  VkRenderPass* = VkNonDispatchableHandle
  VkPipelineCache* = VkNonDispatchableHandle
  VkIndirectCommandsLayoutNV* = VkNonDispatchableHandle
  VkDescriptorUpdateTemplate* = VkNonDispatchableHandle
  VkDescriptorUpdateTemplateKHR* = VkDescriptorUpdateTemplate
  VkSamplerYcbcrConversion* = VkNonDispatchableHandle
  VkSamplerYcbcrConversionKHR* = VkSamplerYcbcrConversion
  VkValidationCacheEXT* = VkNonDispatchableHandle
  VkAccelerationStructureKHR* = VkNonDispatchableHandle
  VkAccelerationStructureNV* = VkNonDispatchableHandle
  VkPerformanceConfigurationINTEL* = VkNonDispatchableHandle
  VkDeferredOperationKHR* = VkNonDispatchableHandle
  VkPrivateDataSlotEXT* = VkNonDispatchableHandle
  VkDisplayKHR* = VkNonDispatchableHandle
  VkDisplayModeKHR* = VkNonDispatchableHandle
  VkSurfaceKHR* = VkNonDispatchableHandle
  VkSwapchainKHR* = VkNonDispatchableHandle
  VkDebugReportCallbackEXT* = VkNonDispatchableHandle
  VkDebugUtilsMessengerEXT* = VkNonDispatchableHandle
  VkDescriptorUpdateTemplateTypeKHR* = VkDescriptorUpdateTemplateType
  VkPointClippingBehaviorKHR* = VkPointClippingBehavior
  VkResolveModeFlagBitsKHR* = VkResolveModeFlagBits
  VkDescriptorBindingFlagBitsEXT* = VkDescriptorBindingFlagBits
  VkSemaphoreTypeKHR* = VkSemaphoreType
  VkGeometryFlagBitsNV* = VkGeometryFlagBitsKHR
  VkGeometryInstanceFlagBitsNV* = VkGeometryInstanceFlagBitsKHR
  VkBuildAccelerationStructureFlagBitsNV* = VkBuildAccelerationStructureFlagBitsKHR
  VkCopyAccelerationStructureModeNV* = VkCopyAccelerationStructureModeKHR
  VkAccelerationStructureTypeNV* = VkAccelerationStructureTypeKHR
  VkGeometryTypeNV* = VkGeometryTypeKHR
  VkRayTracingShaderGroupTypeNV* = VkRayTracingShaderGroupTypeKHR
  VkSemaphoreWaitFlagBitsKHR* = VkSemaphoreWaitFlagBits
  VkExternalMemoryHandleTypeFlagBitsKHR* = VkExternalMemoryHandleTypeFlagBits
  VkExternalMemoryFeatureFlagBitsKHR* = VkExternalMemoryFeatureFlagBits
  VkExternalSemaphoreHandleTypeFlagBitsKHR* = VkExternalSemaphoreHandleTypeFlagBits
  VkExternalSemaphoreFeatureFlagBitsKHR* = VkExternalSemaphoreFeatureFlagBits
  VkSemaphoreImportFlagBitsKHR* = VkSemaphoreImportFlagBits
  VkExternalFenceHandleTypeFlagBitsKHR* = VkExternalFenceHandleTypeFlagBits
  VkExternalFenceFeatureFlagBitsKHR* = VkExternalFenceFeatureFlagBits
  VkFenceImportFlagBitsKHR* = VkFenceImportFlagBits
  VkPeerMemoryFeatureFlagBitsKHR* = VkPeerMemoryFeatureFlagBits
  VkMemoryAllocateFlagBitsKHR* = VkMemoryAllocateFlagBits
  VkTessellationDomainOriginKHR* = VkTessellationDomainOrigin
  VkSamplerYcbcrModelConversionKHR* = VkSamplerYcbcrModelConversion
  VkSamplerYcbcrRangeKHR* = VkSamplerYcbcrRange
  VkChromaLocationKHR* = VkChromaLocation
  VkSamplerReductionModeEXT* = VkSamplerReductionMode
  VkShaderFloatControlsIndependenceKHR* = VkShaderFloatControlsIndependence
  VkDriverIdKHR* = VkDriverId
  PFN_vkInternalAllocationNotification* = proc(pUserData: pointer; size: csize_t; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}
  PFN_vkInternalFreeNotification* = proc(pUserData: pointer; size: csize_t; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}
  PFN_vkReallocationFunction* = proc(pUserData: pointer; pOriginal: pointer; size: csize_t; alignment: csize_t; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}
  PFN_vkAllocationFunction* = proc(pUserData: pointer; size: csize_t; alignment: csize_t; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}
  PFN_vkFreeFunction* = proc(pUserData: pointer; pMemory: pointer) {.cdecl.}
  PFN_vkVoidFunction* = proc() {.cdecl.}
  PFN_vkDebugReportCallbackEXT* = proc(flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; cbObject: uint64; location: csize_t; messageCode:  int32; pLayerPrefix: cstring; pMessage: cstring; pUserData: pointer): VkBool32 {.cdecl.}
  PFN_vkDebugUtilsMessengerCallbackEXT* = proc(messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT, userData: pointer): VkBool32 {.cdecl.}
  PFN_vkDeviceMemoryReportCallbackEXT* = proc(pCallbackData: ptr VkDeviceMemoryReportCallbackDataEXT; pUserData: pointer) {.cdecl.}

  VkBaseOutStructure*  = object
    sType*: VkStructureType
    pNext*: ptr VkBaseOutStructure

  VkBaseInStructure*  = object
    sType*: VkStructureType
    pNext*: ptr VkBaseInStructure

  VkOffset2D*  = object
    x*: int32
    y*: int32

  VkOffset3D*  = object
    x*: int32
    y*: int32
    z*: int32

  VkExtent2D*  = object
    width*: uint32
    height*: uint32

  VkExtent3D*  = object
    width*: uint32
    height*: uint32
    depth*: uint32

  VkViewport*  = object
    x*: float32
    y*: float32
    width*: float32
    height*: float32
    minDepth*: float32
    maxDepth*: float32

  VkRect2D*  = object
    offset*: VkOffset2D
    extent*: VkExtent2D

  VkClearRect*  = object
    rect*: VkRect2D
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkComponentMapping*  = object
    r*: VkComponentSwizzle
    g*: VkComponentSwizzle
    b*: VkComponentSwizzle
    a*: VkComponentSwizzle

  VkPhysicalDeviceProperties*  = object
    apiVersion*: uint32
    driverVersion*: uint32
    vendorID*: uint32
    deviceID*: uint32
    deviceType*: VkPhysicalDeviceType
    deviceName*: array[vkMaxPhysicalDeviceNameSize, char]
    pipelineCacheUUID*: array[vkUuidSize, uint8]
    limits*: VkPhysicalDeviceLimits
    sparseProperties*: VkPhysicalDeviceSparseProperties

  VkExtensionProperties*  = object
    extensionName*: array[vkMaxExtensionNameSize, char]
    specVersion*: uint32

  VkLayerProperties*  = object
    layerName*: array[vkMaxExtensionNameSize, char]
    specVersion*: uint32
    implementationVersion*: uint32
    description*: array[vkMaxDescriptionSize, char]

  VkApplicationInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    pApplicationName*: cstring
    applicationVersion*: uint32
    pEngineName*: cstring
    engineVersion*: uint32
    apiVersion*: uint32

  VkAllocationCallbacks*  = object
    pUserData*: pointer
    pfnAllocation*: PFN_vkAllocationFunction
    pfnReallocation*: PFN_vkReallocationFunction
    pfnFree*: PFN_vkFreeFunction
    pfnInternalAllocation*: PFN_vkInternalAllocationNotification
    pfnInternalFree*: PFN_vkInternalFreeNotification

  VkDeviceQueueCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueCount*: uint32
    pQueuePriorities*: ptr float32

  VkDeviceCreateInfo*  = object
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

  VkInstanceCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkInstanceCreateFlags
    pApplicationInfo*: ptr VkApplicationInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray

  VkQueueFamilyProperties*  = object
    queueFlags*: VkQueueFlags
    queueCount*: uint32
    timestampValidBits*: uint32
    minImageTransferGranularity*: VkExtent3D

  VkPhysicalDeviceMemoryProperties*  = object
    memoryTypeCount*: uint32
    memoryTypes*: array[vkMaxMemoryTypes, VkMemoryType]
    memoryHeapCount*: uint32
    memoryHeaps*: array[vkMaxMemoryHeaps, VkMemoryHeap]

  VkMemoryAllocateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    allocationSize*: VkDeviceSize
    memoryTypeIndex*: uint32

  VkMemoryRequirements*  = object
    size*: VkDeviceSize
    alignment*: VkDeviceSize
    memoryTypeBits*: uint32

  VkSparseImageFormatProperties*  = object
    aspectMask*: VkImageAspectFlags
    imageGranularity*: VkExtent3D
    flags*: VkSparseImageFormatFlags

  VkSparseImageMemoryRequirements*  = object
    formatProperties*: VkSparseImageFormatProperties
    imageMipTailFirstLod*: uint32
    imageMipTailSize*: VkDeviceSize
    imageMipTailOffset*: VkDeviceSize
    imageMipTailStride*: VkDeviceSize

  VkMemoryType*  = object
    propertyFlags*: VkMemoryPropertyFlags
    heapIndex*: uint32

  VkMemoryHeap*  = object
    size*: VkDeviceSize
    flags*: VkMemoryHeapFlags

  VkMappedMemoryRange*  = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory
    offset*: VkDeviceSize
    size*: VkDeviceSize

  VkFormatProperties*  = object
    linearTilingFeatures*: VkFormatFeatureFlags
    optimalTilingFeatures*: VkFormatFeatureFlags
    bufferFeatures*: VkFormatFeatureFlags

  VkImageFormatProperties*  = object
    maxExtent*: VkExtent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts*: VkSampleCountFlags
    maxResourceSize*: VkDeviceSize

  VkDescriptorBufferInfo*  = object
    buffer*: VkBuffer
    offset*: VkDeviceSize
    range*: VkDeviceSize

  VkDescriptorImageInfo*  = object
    sampler*: VkSampler
    imageView*: VkImageView
    imageLayout*: VkImageLayout

  VkWriteDescriptorSet*  = object
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

  VkCopyDescriptorSet*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcSet*: VkDescriptorSet
    srcBinding*: uint32
    srcArrayElement*: uint32
    dstSet*: VkDescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32

  VkBufferCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferCreateFlags
    size*: VkDeviceSize
    usage*: VkBufferUsageFlags
    sharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32

  VkBufferViewCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferViewCreateFlags
    buffer*: VkBuffer
    format*: VkFormat
    offset*: VkDeviceSize
    range*: VkDeviceSize

  VkImageSubresource*  = object
    aspectMask*: VkImageAspectFlags
    mipLevel*: uint32
    arrayLayer*: uint32

  VkImageSubresourceLayers*  = object
    aspectMask*: VkImageAspectFlags
    mipLevel*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkImageSubresourceRange*  = object
    aspectMask*: VkImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkMemoryBarrier*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags

  VkBufferMemoryBarrier*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    buffer*: VkBuffer
    offset*: VkDeviceSize
    size*: VkDeviceSize

  VkImageMemoryBarrier*  = object
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

  VkImageCreateInfo*  = object
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

  VkSubresourceLayout*  = object
    offset*: VkDeviceSize
    size*: VkDeviceSize
    rowPitch*: VkDeviceSize
    arrayPitch*: VkDeviceSize
    depthPitch*: VkDeviceSize

  VkImageViewCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkImageViewCreateFlags
    image*: VkImage
    viewType*: VkImageViewType
    format*: VkFormat
    components*: VkComponentMapping
    subresourceRange*: VkImageSubresourceRange

  VkBufferCopy*  = object
    srcOffset*: VkDeviceSize
    dstOffset*: VkDeviceSize
    size*: VkDeviceSize

  VkSparseMemoryBind*  = object
    resourceOffset*: VkDeviceSize
    size*: VkDeviceSize
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize
    flags*: VkSparseMemoryBindFlags

  VkSparseImageMemoryBind*  = object
    subresource*: VkImageSubresource
    offset*: VkOffset3D
    extent*: VkExtent3D
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize
    flags*: VkSparseMemoryBindFlags

  VkSparseBufferMemoryBindInfo*  = object
    buffer*: VkBuffer
    bindCount*: uint32
    pBinds*: ptr VkSparseMemoryBind

  VkSparseImageOpaqueMemoryBindInfo*  = object
    image*: VkImage
    bindCount*: uint32
    pBinds*: ptr VkSparseMemoryBind

  VkSparseImageMemoryBindInfo*  = object
    image*: VkImage
    bindCount*: uint32
    pBinds*: ptr VkSparseImageMemoryBind

  VkBindSparseInfo*  = object
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

  VkImageCopy*  = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkImageBlit*  = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffsets*: array[2, VkOffset3D]
    dstSubresource*: VkImageSubresourceLayers
    dstOffsets*: array[2, VkOffset3D]

  VkBufferImageCopy*  = object
    bufferOffset*: VkDeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: VkImageSubresourceLayers
    imageOffset*: VkOffset3D
    imageExtent*: VkExtent3D

  VkImageResolve*  = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkShaderModuleCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkShaderModuleCreateFlags
    codeSize*: uint
    pCode*: ptr uint32

  VkDescriptorSetLayoutBinding*  = object
    binding*: uint32
    descriptorType*: VkDescriptorType
    descriptorCount*: uint32
    stageFlags*: VkShaderStageFlags
    pImmutableSamplers*: ptr VkSampler

  VkDescriptorSetLayoutCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDescriptorSetLayoutCreateFlags
    bindingCount*: uint32
    pBindings*: ptr VkDescriptorSetLayoutBinding

  VkDescriptorPoolSize*  = object
    `type`*: VkDescriptorType
    descriptorCount*: uint32

  VkDescriptorPoolCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDescriptorPoolCreateFlags
    maxSets*: uint32
    poolSizeCount*: uint32
    pPoolSizes*: ptr VkDescriptorPoolSize

  VkDescriptorSetAllocateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    descriptorPool*: VkDescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts*: ptr VkDescriptorSetLayout

  VkSpecializationMapEntry*  = object
    constantID*: uint32
    offset*: uint32
    size*: uint

  VkSpecializationInfo*  = object
    mapEntryCount*: uint32
    pMapEntries*: ptr VkSpecializationMapEntry
    dataSize*: uint
    pData*: pointer

  VkPipelineShaderStageCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineShaderStageCreateFlags
    stage*: VkShaderStageFlagBits
    module*: VkShaderModule
    pName*: cstring
    pSpecializationInfo*: ptr VkSpecializationInfo

  VkComputePipelineCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stage*: VkPipelineShaderStageCreateInfo
    layout*: VkPipelineLayout
    basePipelineHandle*: VkPipeline
    basePipelineIndex*: int32

  VkVertexInputBindingDescription*  = object
    binding*: uint32
    stride*: uint32
    inputRate*: VkVertexInputRate

  VkVertexInputAttributeDescription*  = object
    location*: uint32
    binding*: uint32
    format*: VkFormat
    offset*: uint32

  VkPipelineVertexInputStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineVertexInputStateCreateFlags
    vertexBindingDescriptionCount*: uint32
    pVertexBindingDescriptions*: ptr VkVertexInputBindingDescription
    vertexAttributeDescriptionCount*: uint32
    pVertexAttributeDescriptions*: ptr VkVertexInputAttributeDescription

  VkPipelineInputAssemblyStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineInputAssemblyStateCreateFlags
    topology*: VkPrimitiveTopology
    primitiveRestartEnable*: VkBool32

  VkPipelineTessellationStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineTessellationStateCreateFlags
    patchControlPoints*: uint32

  VkPipelineViewportStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineViewportStateCreateFlags
    viewportCount*: uint32
    pViewports*: ptr VkViewport
    scissorCount*: uint32
    pScissors*: ptr VkRect2D

  VkPipelineRasterizationStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationStateCreateFlags
    depthClampEnable*: VkBool32
    rasterizerDiscardEnable*: VkBool32
    polygonMode*: VkPolygonMode
    cullMode*: VkCullModeFlags
    frontFace*: VkFrontFace
    depthBiasEnable*: VkBool32
    depthBiasConstantFactor*: float32
    depthBiasClamp*: float32
    depthBiasSlopeFactor*: float32
    lineWidth*: float32

  VkPipelineMultisampleStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineMultisampleStateCreateFlags
    rasterizationSamples*: VkSampleCountFlagBits
    sampleShadingEnable*: VkBool32
    minSampleShading*: float32
    pSampleMask*: ptr VkSampleMask
    alphaToCoverageEnable*: VkBool32
    alphaToOneEnable*: VkBool32

  VkPipelineColorBlendAttachmentState*  = object
    blendEnable*: VkBool32
    srcColorBlendFactor*: VkBlendFactor
    dstColorBlendFactor*: VkBlendFactor
    colorBlendOp*: VkBlendOp
    srcAlphaBlendFactor*: VkBlendFactor
    dstAlphaBlendFactor*: VkBlendFactor
    alphaBlendOp*: VkBlendOp
    colorWriteMask*: VkColorComponentFlags

  VkPipelineColorBlendStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineColorBlendStateCreateFlags
    logicOpEnable*: VkBool32
    logicOp*: VkLogicOp
    attachmentCount*: uint32
    pAttachments*: ptr VkPipelineColorBlendAttachmentState
    blendConstants*: array[4, float32]

  VkPipelineDynamicStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineDynamicStateCreateFlags
    dynamicStateCount*: uint32
    pDynamicStates*: ptr VkDynamicState

  VkStencilOpState*  = object
    failOp*: VkStencilOp
    passOp*: VkStencilOp
    depthFailOp*: VkStencilOp
    compareOp*: VkCompareOp
    compareMask*: uint32
    writeMask*: uint32
    reference*: uint32

  VkPipelineDepthStencilStateCreateInfo*  = object
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
    minDepthBounds*: float32
    maxDepthBounds*: float32

  VkGraphicsPipelineCreateInfo*  = object
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

  VkPipelineCacheCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCacheCreateFlags
    initialDataSize*: uint
    pInitialData*: pointer

  VkPushConstantRange*  = object
    stageFlags*: VkShaderStageFlags
    offset*: uint32
    size*: uint32

  VkPipelineLayoutCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineLayoutCreateFlags
    setLayoutCount*: uint32
    pSetLayouts*: ptr VkDescriptorSetLayout
    pushConstantRangeCount*: uint32
    pPushConstantRanges*: ptr VkPushConstantRange

  VkSamplerCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSamplerCreateFlags
    magFilter*: VkFilter
    minFilter*: VkFilter
    mipmapMode*: VkSamplerMipmapMode
    addressModeU*: VkSamplerAddressMode
    addressModeV*: VkSamplerAddressMode
    addressModeW*: VkSamplerAddressMode
    mipLodBias*: float32
    anisotropyEnable*: VkBool32
    maxAnisotropy*: float32
    compareEnable*: VkBool32
    compareOp*: VkCompareOp
    minLod*: float32
    maxLod*: float32
    borderColor*: VkBorderColor
    unnormalizedCoordinates*: VkBool32

  VkCommandPoolCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkCommandPoolCreateFlags
    queueFamilyIndex*: uint32

  VkCommandBufferAllocateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    commandPool*: VkCommandPool
    level*: VkCommandBufferLevel
    commandBufferCount*: uint32

  VkCommandBufferInheritanceInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    renderPass*: VkRenderPass
    subpass*: uint32
    framebuffer*: VkFramebuffer
    occlusionQueryEnable*: VkBool32
    queryFlags*: VkQueryControlFlags
    pipelineStatistics*: VkQueryPipelineStatisticFlags

  VkCommandBufferBeginInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkCommandBufferUsageFlags
    pInheritanceInfo*: ptr VkCommandBufferInheritanceInfo

  VkRenderPassBeginInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    renderPass*: VkRenderPass
    framebuffer*: VkFramebuffer
    renderArea*: VkRect2D
    clearValueCount*: uint32
    pClearValues*: ptr VkClearValue

  VkClearColorValue* {.union.} = object
    float32*: array[4, float32]
    int32*: array[4, int32]
    uint32*: array[4, uint32]

  VkClearDepthStencilValue*  = object
    depth*: float32
    stencil*: uint32

  VkClearValue* {.union.} = object
    color*: VkClearColorValue
    depthStencil*: VkClearDepthStencilValue

  VkClearAttachment*  = object
    aspectMask*: VkImageAspectFlags
    colorAttachment*: uint32
    clearValue*: VkClearValue

  VkAttachmentDescription*  = object
    flags*: VkAttachmentDescriptionFlags
    format*: VkFormat
    samples*: VkSampleCountFlagBits
    loadOp*: VkAttachmentLoadOp
    storeOp*: VkAttachmentStoreOp
    stencilLoadOp*: VkAttachmentLoadOp
    stencilStoreOp*: VkAttachmentStoreOp
    initialLayout*: VkImageLayout
    finalLayout*: VkImageLayout

  VkAttachmentReference*  = object
    attachment*: uint32
    layout*: VkImageLayout

  VkSubpassDescription*  = object
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

  VkSubpassDependency*  = object
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: VkPipelineStageFlags
    dstStageMask*: VkPipelineStageFlags
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    dependencyFlags*: VkDependencyFlags

  VkRenderPassCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkRenderPassCreateFlags
    attachmentCount*: uint32
    pAttachments*: ptr VkAttachmentDescription
    subpassCount*: uint32
    pSubpasses*: ptr VkSubpassDescription
    dependencyCount*: uint32
    pDependencies*: ptr VkSubpassDependency

  VkEventCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkEventCreateFlags

  VkFenceCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkFenceCreateFlags

  VkPhysicalDeviceFeatures*  = object
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

  VkPhysicalDeviceSparseProperties*  = object
    residencyStandard2DBlockShape*: VkBool32
    residencyStandard2DMultisampleBlockShape*: VkBool32
    residencyStandard3DBlockShape*: VkBool32
    residencyAlignedMipSize*: VkBool32
    residencyNonResidentStrict*: VkBool32

  VkPhysicalDeviceLimits*  = object
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
    maxSamplerLodBias*: float32
    maxSamplerAnisotropy*: float32
    maxViewports*: uint32
    maxViewportDimensions*: array[2, uint32]
    viewportBoundsRange*: array[2, float32]
    viewportSubPixelBits*: uint32
    minMemoryMapAlignment*: uint
    minTexelBufferOffsetAlignment*: VkDeviceSize
    minUniformBufferOffsetAlignment*: VkDeviceSize
    minStorageBufferOffsetAlignment*: VkDeviceSize
    minTexelOffset*: int32
    maxTexelOffset*: uint32
    minTexelGatherOffset*: int32
    maxTexelGatherOffset*: uint32
    minInterpolationOffset*: float32
    maxInterpolationOffset*: float32
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
    timestampPeriod*: float32
    maxClipDistances*: uint32
    maxCullDistances*: uint32
    maxCombinedClipAndCullDistances*: uint32
    discreteQueuePriorities*: uint32
    pointSizeRange*: array[2, float32]
    lineWidthRange*: array[2, float32]
    pointSizeGranularity*: float32
    lineWidthGranularity*: float32
    strictLines*: VkBool32
    standardSampleLocations*: VkBool32
    optimalBufferCopyOffsetAlignment*: VkDeviceSize
    optimalBufferCopyRowPitchAlignment*: VkDeviceSize
    nonCoherentAtomSize*: VkDeviceSize

  VkSemaphoreCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSemaphoreCreateFlags

  VkQueryPoolCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkQueryPoolCreateFlags
    queryType*: VkQueryType
    queryCount*: uint32
    pipelineStatistics*: VkQueryPipelineStatisticFlags

  VkFramebufferCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkFramebufferCreateFlags
    renderPass*: VkRenderPass
    attachmentCount*: uint32
    pAttachments*: ptr VkImageView
    width*: uint32
    height*: uint32
    layers*: uint32

  VkDrawIndirectCommand*  = object
    vertexCount*: uint32
    instanceCount*: uint32
    firstVertex*: uint32
    firstInstance*: uint32

  VkDrawIndexedIndirectCommand*  = object
    indexCount*: uint32
    instanceCount*: uint32
    firstIndex*: uint32
    vertexOffset*: int32
    firstInstance*: uint32

  VkDispatchIndirectCommand*  = object
    x*: uint32
    y*: uint32
    z*: uint32

  VkSubmitInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr VkSemaphore
    pWaitDstStageMask*: ptr VkPipelineStageFlags
    commandBufferCount*: uint32
    pCommandBuffers*: ptr VkCommandBuffer
    signalSemaphoreCount*: uint32
    pSignalSemaphores*: ptr VkSemaphore

  VkDisplayPropertiesKHR*  = object
    display*: VkDisplayKHR
    displayName*: cstring
    physicalDimensions*: VkExtent2D
    physicalResolution*: VkExtent2D
    supportedTransforms*: VkSurfaceTransformFlagsKHR
    planeReorderPossible*: VkBool32
    persistentContent*: VkBool32

  VkDisplayPlanePropertiesKHR*  = object
    currentDisplay*: VkDisplayKHR
    currentStackIndex*: uint32

  VkDisplayModeParametersKHR*  = object
    visibleRegion*: VkExtent2D
    refreshRate*: uint32

  VkDisplayModePropertiesKHR*  = object
    displayMode*: VkDisplayModeKHR
    parameters*: VkDisplayModeParametersKHR

  VkDisplayModeCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDisplayModeCreateFlagsKHR
    parameters*: VkDisplayModeParametersKHR

  VkDisplayPlaneCapabilitiesKHR*  = object
    supportedAlpha*: VkDisplayPlaneAlphaFlagsKHR
    minSrcPosition*: VkOffset2D
    maxSrcPosition*: VkOffset2D
    minSrcExtent*: VkExtent2D
    maxSrcExtent*: VkExtent2D
    minDstPosition*: VkOffset2D
    maxDstPosition*: VkOffset2D
    minDstExtent*: VkExtent2D
    maxDstExtent*: VkExtent2D

  VkDisplaySurfaceCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDisplaySurfaceCreateFlagsKHR
    displayMode*: VkDisplayModeKHR
    planeIndex*: uint32
    planeStackIndex*: uint32
    transform*: VkSurfaceTransformFlagBitsKHR
    globalAlpha*: float32
    alphaMode*: VkDisplayPlaneAlphaFlagBitsKHR
    imageExtent*: VkExtent2D

  VkDisplayPresentInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcRect*: VkRect2D
    dstRect*: VkRect2D
    persistent*: VkBool32

  VkSurfaceCapabilitiesKHR*  = object
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

  VkAndroidSurfaceCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkAndroidSurfaceCreateFlagsKHR
    window*: ptr ANativeWindow

  VkViSurfaceCreateInfoNN*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkViSurfaceCreateFlagsNN
    window*: pointer

  VkWaylandSurfaceCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkWaylandSurfaceCreateFlagsKHR
    display*: ptr wl_display
    surface*: ptr wl_surface

  VkWin32SurfaceCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkWin32SurfaceCreateFlagsKHR
    hinstance*: HINSTANCE
    hwnd*: HWND

  VkXlibSurfaceCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkXlibSurfaceCreateFlagsKHR
    dpy*: ptr Display
    window*: Window

  VkXcbSurfaceCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkXcbSurfaceCreateFlagsKHR
    connection*: ptr xcb_connection_t
    window*: xcb_window_t

  VkDirectFBSurfaceCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDirectFBSurfaceCreateFlagsEXT
    dfb*: ptr IDirectFB
    surface*: ptr IDirectFBSurface

  VkImagePipeSurfaceCreateInfoFUCHSIA*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkImagePipeSurfaceCreateFlagsFUCHSIA
    imagePipeHandle*: zx_handle_t

  VkStreamDescriptorSurfaceCreateInfoGGP*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkStreamDescriptorSurfaceCreateFlagsGGP
    streamDescriptor*: GgpStreamDescriptor

  VkScreenSurfaceCreateInfoQNX*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkScreenSurfaceCreateFlagsQNX
    context*: ptr screen_context
    window*: ptr screen_window

  VkSurfaceFormatKHR*  = object
    format*: VkFormat
    colorSpace*: VkColorSpaceKHR

  VkSwapchainCreateInfoKHR*  = object
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

  VkPresentInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr VkSemaphore
    swapchainCount*: uint32
    pSwapchains*: ptr VkSwapchainKHR
    pImageIndices*: ptr uint32
    pResults*: ptr VkResult

  VkDebugReportCallbackCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDebugReportFlagsEXT
    pfnCallback*: PFN_vkDebugReportCallbackEXT
    pUserData*: pointer

  VkValidationFlagsEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks*: ptr VkValidationCheckEXT

  VkValidationFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    enabledValidationFeatureCount*: uint32
    pEnabledValidationFeatures*: ptr VkValidationFeatureEnableEXT
    disabledValidationFeatureCount*: uint32
    pDisabledValidationFeatures*: ptr VkValidationFeatureDisableEXT

  VkPipelineRasterizationStateRasterizationOrderAMD*  = object
    sType*: VkStructureType
    pNext*: pointer
    rasterizationOrder*: VkRasterizationOrderAMD

  VkDebugMarkerObjectNameInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkDebugReportObjectTypeEXT
    `object`*: uint64
    pObjectName*: cstring

  VkDebugMarkerObjectTagInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkDebugReportObjectTypeEXT
    `object`*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer

  VkDebugMarkerMarkerInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    pMarkerName*: cstring
    color*: array[4, float32]

  VkDedicatedAllocationImageCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    dedicatedAllocation*: VkBool32

  VkDedicatedAllocationBufferCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    dedicatedAllocation*: VkBool32

  VkDedicatedAllocationMemoryAllocateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    buffer*: VkBuffer

  VkExternalImageFormatPropertiesNV*  = object
    imageFormatProperties*: VkImageFormatProperties
    externalMemoryFeatures*: VkExternalMemoryFeatureFlagsNV
    exportFromImportedHandleTypes*: VkExternalMemoryHandleTypeFlagsNV
    compatibleHandleTypes*: VkExternalMemoryHandleTypeFlagsNV

  VkExternalMemoryImageCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsNV

  VkExportMemoryAllocateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsNV

  VkImportMemoryWin32HandleInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagsNV
    handle*: HANDLE

  VkExportMemoryWin32HandleInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD

  VkWin32KeyedMutexAcquireReleaseInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    acquireCount*: uint32
    pAcquireSyncs*: ptr VkDeviceMemory
    pAcquireKeys*: ptr uint64
    pAcquireTimeoutMilliseconds*: ptr uint32
    releaseCount*: uint32
    pReleaseSyncs*: ptr VkDeviceMemory
    pReleaseKeys*: ptr uint64

  VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceGeneratedCommands*: VkBool32

  VkDevicePrivateDataCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    privateDataSlotRequestCount*: uint32

  VkPrivateDataSlotCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPrivateDataSlotCreateFlagsEXT

  VkPhysicalDevicePrivateDataFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    privateData*: VkBool32

  VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV*  = object
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

  VkGraphicsShaderGroupCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    stageCount*: uint32
    pStages*: ptr VkPipelineShaderStageCreateInfo
    pVertexInputState*: ptr VkPipelineVertexInputStateCreateInfo
    pTessellationState*: ptr VkPipelineTessellationStateCreateInfo

  VkGraphicsPipelineShaderGroupsCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    groupCount*: uint32
    pGroups*: ptr VkGraphicsShaderGroupCreateInfoNV
    pipelineCount*: uint32
    pPipelines*: ptr VkPipeline

  VkBindShaderGroupIndirectCommandNV*  = object
    groupIndex*: uint32

  VkBindIndexBufferIndirectCommandNV*  = object
    bufferAddress*: VkDeviceAddress
    size*: uint32
    indexType*: VkIndexType

  VkBindVertexBufferIndirectCommandNV*  = object
    bufferAddress*: VkDeviceAddress
    size*: uint32
    stride*: uint32

  VkSetStateFlagsIndirectCommandNV*  = object
    data*: uint32

  VkIndirectCommandsStreamNV*  = object
    buffer*: VkBuffer
    offset*: VkDeviceSize

  VkIndirectCommandsLayoutTokenNV*  = object
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

  VkIndirectCommandsLayoutCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkIndirectCommandsLayoutUsageFlagsNV
    pipelineBindPoint*: VkPipelineBindPoint
    tokenCount*: uint32
    pTokens*: ptr VkIndirectCommandsLayoutTokenNV
    streamCount*: uint32
    pStreamStrides*: ptr uint32

  VkGeneratedCommandsInfoNV*  = object
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

  VkGeneratedCommandsMemoryRequirementsInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineBindPoint*: VkPipelineBindPoint
    pipeline*: VkPipeline
    indirectCommandsLayout*: VkIndirectCommandsLayoutNV
    maxSequencesCount*: uint32

  VkPhysicalDeviceFeatures2*  = object
    sType*: VkStructureType
    pNext*: pointer
    features*: VkPhysicalDeviceFeatures

  VkPhysicalDeviceFeatures2KHR*  = object

  VkPhysicalDeviceProperties2*  = object
    sType*: VkStructureType
    pNext*: pointer
    properties*: VkPhysicalDeviceProperties

  VkPhysicalDeviceProperties2KHR*  = object

  VkFormatProperties2*  = object
    sType*: VkStructureType
    pNext*: pointer
    formatProperties*: VkFormatProperties

  VkFormatProperties2KHR*  = object

  VkImageFormatProperties2*  = object
    sType*: VkStructureType
    pNext*: pointer
    imageFormatProperties*: VkImageFormatProperties

  VkImageFormatProperties2KHR*  = object

  VkPhysicalDeviceImageFormatInfo2*  = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    `type`*: VkImageType
    tiling*: VkImageTiling
    usage*: VkImageUsageFlags
    flags*: VkImageCreateFlags

  VkPhysicalDeviceImageFormatInfo2KHR*  = object

  VkQueueFamilyProperties2*  = object
    sType*: VkStructureType
    pNext*: pointer
    queueFamilyProperties*: VkQueueFamilyProperties

  VkQueueFamilyProperties2KHR*  = object

  VkPhysicalDeviceMemoryProperties2*  = object
    sType*: VkStructureType
    pNext*: pointer
    memoryProperties*: VkPhysicalDeviceMemoryProperties

  VkPhysicalDeviceMemoryProperties2KHR*  = object

  VkSparseImageFormatProperties2*  = object
    sType*: VkStructureType
    pNext*: pointer
    properties*: VkSparseImageFormatProperties

  VkSparseImageFormatProperties2KHR*  = object

  VkPhysicalDeviceSparseImageFormatInfo2*  = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    `type`*: VkImageType
    samples*: VkSampleCountFlagBits
    usage*: VkImageUsageFlags
    tiling*: VkImageTiling

  VkPhysicalDeviceSparseImageFormatInfo2KHR*  = object

  VkPhysicalDevicePushDescriptorPropertiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxPushDescriptors*: uint32

  VkConformanceVersion*  = object
    major*: uint8
    minor*: uint8
    subminor*: uint8
    patch*: uint8

  VkConformanceVersionKHR*  = object

  VkPhysicalDeviceDriverProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    driverID*: VkDriverId
    driverName*: array[vkMaxDriverNameSize, char]
    driverInfo*: array[vkMaxDriverInfoSize, char]
    conformanceVersion*: VkConformanceVersion

  VkPhysicalDeviceDriverPropertiesKHR*  = object

  VkPresentRegionsKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pRegions*: ptr VkPresentRegionKHR

  VkPresentRegionKHR*  = object
    rectangleCount*: uint32
    pRectangles*: ptr VkRectLayerKHR

  VkRectLayerKHR*  = object
    offset*: VkOffset2D
    extent*: VkExtent2D
    layer*: uint32

  VkPhysicalDeviceVariablePointersFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    variablePointersStorageBuffer*: VkBool32
    variablePointers*: VkBool32

  VkPhysicalDeviceVariablePointersFeaturesKHR*  = object

  VkPhysicalDeviceVariablePointerFeaturesKHR*  = object

  VkPhysicalDeviceVariablePointerFeatures*  = object

  VkExternalMemoryProperties*  = object
    externalMemoryFeatures*: VkExternalMemoryFeatureFlags
    exportFromImportedHandleTypes*: VkExternalMemoryHandleTypeFlags
    compatibleHandleTypes*: VkExternalMemoryHandleTypeFlags

  VkExternalMemoryPropertiesKHR*  = object

  VkPhysicalDeviceExternalImageFormatInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBits

  VkPhysicalDeviceExternalImageFormatInfoKHR*  = object

  VkExternalImageFormatProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    externalMemoryProperties*: VkExternalMemoryProperties

  VkExternalImageFormatPropertiesKHR*  = object

  VkPhysicalDeviceExternalBufferInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferCreateFlags
    usage*: VkBufferUsageFlags
    handleType*: VkExternalMemoryHandleTypeFlagBits

  VkPhysicalDeviceExternalBufferInfoKHR*  = object

  VkExternalBufferProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    externalMemoryProperties*: VkExternalMemoryProperties

  VkExternalBufferPropertiesKHR*  = object

  VkPhysicalDeviceIDProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceUUID*: array[vkUuidSize, uint8]
    driverUUID*: array[vkUuidSize, uint8]
    deviceLUID*: array[vkLuidSize, uint8]
    deviceNodeMask*: uint32
    deviceLUIDValid*: VkBool32

  VkPhysicalDeviceIDPropertiesKHR*  = object

  VkExternalMemoryImageCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlags

  VkExternalMemoryImageCreateInfoKHR*  = object

  VkExternalMemoryBufferCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlags

  VkExternalMemoryBufferCreateInfoKHR*  = object

  VkExportMemoryAllocateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlags

  VkExportMemoryAllocateInfoKHR*  = object

  VkImportMemoryWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBits
    handle*: HANDLE
    name*: LPCWSTR

  VkExportMemoryWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR

  VkMemoryWin32HandlePropertiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    memoryTypeBits*: uint32

  VkMemoryGetWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory
    handleType*: VkExternalMemoryHandleTypeFlagBits

  VkImportMemoryFdInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBits
    fd*: int

  VkMemoryFdPropertiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    memoryTypeBits*: uint32

  VkMemoryGetFdInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory
    handleType*: VkExternalMemoryHandleTypeFlagBits

  VkWin32KeyedMutexAcquireReleaseInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    acquireCount*: uint32
    pAcquireSyncs*: ptr VkDeviceMemory
    pAcquireKeys*: ptr uint64
    pAcquireTimeouts*: ptr uint32
    releaseCount*: uint32
    pReleaseSyncs*: ptr VkDeviceMemory
    pReleaseKeys*: ptr uint64

  VkPhysicalDeviceExternalSemaphoreInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalSemaphoreHandleTypeFlagBits

  VkPhysicalDeviceExternalSemaphoreInfoKHR*  = object

  VkExternalSemaphoreProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: VkExternalSemaphoreHandleTypeFlags
    compatibleHandleTypes*: VkExternalSemaphoreHandleTypeFlags
    externalSemaphoreFeatures*: VkExternalSemaphoreFeatureFlags

  VkExternalSemaphorePropertiesKHR*  = object

  VkExportSemaphoreCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalSemaphoreHandleTypeFlags

  VkExportSemaphoreCreateInfoKHR*  = object

  VkImportSemaphoreWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    flags*: VkSemaphoreImportFlags
    handleType*: VkExternalSemaphoreHandleTypeFlagBits
    handle*: HANDLE
    name*: LPCWSTR

  VkExportSemaphoreWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR

  VkD3D12FenceSubmitInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreValuesCount*: uint32
    pWaitSemaphoreValues*: ptr uint64
    signalSemaphoreValuesCount*: uint32
    pSignalSemaphoreValues*: ptr uint64

  VkSemaphoreGetWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    handleType*: VkExternalSemaphoreHandleTypeFlagBits

  VkImportSemaphoreFdInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    flags*: VkSemaphoreImportFlags
    handleType*: VkExternalSemaphoreHandleTypeFlagBits
    fd*: int

  VkSemaphoreGetFdInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    handleType*: VkExternalSemaphoreHandleTypeFlagBits

  VkPhysicalDeviceExternalFenceInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalFenceHandleTypeFlagBits

  VkPhysicalDeviceExternalFenceInfoKHR*  = object

  VkExternalFenceProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: VkExternalFenceHandleTypeFlags
    compatibleHandleTypes*: VkExternalFenceHandleTypeFlags
    externalFenceFeatures*: VkExternalFenceFeatureFlags

  VkExternalFencePropertiesKHR*  = object

  VkExportFenceCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalFenceHandleTypeFlags

  VkExportFenceCreateInfoKHR*  = object

  VkImportFenceWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    fence*: VkFence
    flags*: VkFenceImportFlags
    handleType*: VkExternalFenceHandleTypeFlagBits
    handle*: HANDLE
    name*: LPCWSTR

  VkExportFenceWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR

  VkFenceGetWin32HandleInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    fence*: VkFence
    handleType*: VkExternalFenceHandleTypeFlagBits

  VkImportFenceFdInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    fence*: VkFence
    flags*: VkFenceImportFlags
    handleType*: VkExternalFenceHandleTypeFlagBits
    fd*: int

  VkFenceGetFdInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    fence*: VkFence
    handleType*: VkExternalFenceHandleTypeFlagBits

  VkPhysicalDeviceMultiviewFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    multiview*: VkBool32
    multiviewGeometryShader*: VkBool32
    multiviewTessellationShader*: VkBool32

  VkPhysicalDeviceMultiviewFeaturesKHR*  = object

  VkPhysicalDeviceMultiviewProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxMultiviewViewCount*: uint32
    maxMultiviewInstanceIndex*: uint32

  VkPhysicalDeviceMultiviewPropertiesKHR*  = object

  VkRenderPassMultiviewCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    subpassCount*: uint32
    pViewMasks*: ptr uint32
    dependencyCount*: uint32
    pViewOffsets*: ptr int32
    correlationMaskCount*: uint32
    pCorrelationMasks*: ptr uint32

  VkRenderPassMultiviewCreateInfoKHR*  = object

  VkSurfaceCapabilities2EXT*  = object
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

  VkDisplayPowerInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    powerState*: VkDisplayPowerStateEXT

  VkDeviceEventInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceEvent*: VkDeviceEventTypeEXT

  VkDisplayEventInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    displayEvent*: VkDisplayEventTypeEXT

  VkSwapchainCounterCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceCounters*: VkSurfaceCounterFlagsEXT

  VkPhysicalDeviceGroupProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    physicalDevices*: array[vkMaxDeviceGroupSize, VkPhysicalDevice]
    subsetAllocation*: VkBool32

  VkPhysicalDeviceGroupPropertiesKHR*  = object

  VkMemoryAllocateFlagsInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkMemoryAllocateFlags
    deviceMask*: uint32

  VkMemoryAllocateFlagsInfoKHR*  = object

  VkBindBufferMemoryInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize

  VkBindBufferMemoryInfoKHR*  = object

  VkBindBufferMemoryDeviceGroupInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32

  VkBindBufferMemoryDeviceGroupInfoKHR*  = object

  VkBindImageMemoryInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize

  VkBindImageMemoryInfoKHR*  = object

  VkBindImageMemoryDeviceGroupInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32
    splitInstanceBindRegionCount*: uint32
    pSplitInstanceBindRegions*: ptr VkRect2D

  VkBindImageMemoryDeviceGroupInfoKHR*  = object

  VkDeviceGroupRenderPassBeginInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceMask*: uint32
    deviceRenderAreaCount*: uint32
    pDeviceRenderAreas*: ptr VkRect2D

  VkDeviceGroupRenderPassBeginInfoKHR*  = object

  VkDeviceGroupCommandBufferBeginInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceMask*: uint32

  VkDeviceGroupCommandBufferBeginInfoKHR*  = object

  VkDeviceGroupSubmitInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphoreDeviceIndices*: ptr uint32
    commandBufferCount*: uint32
    pCommandBufferDeviceMasks*: ptr uint32
    signalSemaphoreCount*: uint32
    pSignalSemaphoreDeviceIndices*: ptr uint32

  VkDeviceGroupSubmitInfoKHR*  = object

  VkDeviceGroupBindSparseInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    resourceDeviceIndex*: uint32
    memoryDeviceIndex*: uint32

  VkDeviceGroupBindSparseInfoKHR*  = object

  VkDeviceGroupPresentCapabilitiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    presentMask*: array[vkMaxDeviceGroupSize, uint32]
    modes*: VkDeviceGroupPresentModeFlagsKHR

  VkImageSwapchainCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR

  VkBindImageMemorySwapchainInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR
    imageIndex*: uint32

  VkAcquireNextImageInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR
    timeout*: uint64
    semaphore*: VkSemaphore
    fence*: VkFence
    deviceMask*: uint32

  VkDeviceGroupPresentInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pDeviceMasks*: ptr uint32
    mode*: VkDeviceGroupPresentModeFlagBitsKHR

  VkDeviceGroupDeviceCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    pPhysicalDevices*: ptr VkPhysicalDevice

  VkDeviceGroupDeviceCreateInfoKHR*  = object

  VkDeviceGroupSwapchainCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    modes*: VkDeviceGroupPresentModeFlagsKHR

  VkDescriptorUpdateTemplateEntry*  = object
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: VkDescriptorType
    offset*: uint
    stride*: uint

  VkDescriptorUpdateTemplateEntryKHR*  = object

  VkDescriptorUpdateTemplateCreateInfo*  = object
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

  VkDescriptorUpdateTemplateCreateInfoKHR*  = object

  VkXYColorEXT*  = object
    x*: float32
    y*: float32

  VkHdrMetadataEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    displayPrimaryRed*: VkXYColorEXT
    displayPrimaryGreen*: VkXYColorEXT
    displayPrimaryBlue*: VkXYColorEXT
    whitePoint*: VkXYColorEXT
    maxLuminance*: float32
    minLuminance*: float32
    maxContentLightLevel*: float32
    maxFrameAverageLightLevel*: float32

  VkDisplayNativeHdrSurfaceCapabilitiesAMD*  = object
    sType*: VkStructureType
    pNext*: pointer
    localDimmingSupport*: VkBool32

  VkSwapchainDisplayNativeHdrCreateInfoAMD*  = object
    sType*: VkStructureType
    pNext*: pointer
    localDimmingEnable*: VkBool32

  VkRefreshCycleDurationGOOGLE*  = object
    refreshDuration*: uint64

  VkPastPresentationTimingGOOGLE*  = object
    presentID*: uint32
    desiredPresentTime*: uint64
    actualPresentTime*: uint64
    earliestPresentTime*: uint64
    presentMargin*: uint64

  VkPresentTimesInfoGOOGLE*  = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pTimes*: ptr VkPresentTimeGOOGLE

  VkPresentTimeGOOGLE*  = object
    presentID*: uint32
    desiredPresentTime*: uint64

  VkIOSSurfaceCreateInfoMVK*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkIOSSurfaceCreateFlagsMVK
    pView*: pointer

  VkMacOSSurfaceCreateInfoMVK*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkMacOSSurfaceCreateFlagsMVK
    pView*: pointer

  VkMetalSurfaceCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkMetalSurfaceCreateFlagsEXT
    pLayer*: ptr CAMetalLayer

  VkViewportWScalingNV*  = object
    xcoeff*: float32
    ycoeff*: float32

  VkPipelineViewportWScalingStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    viewportWScalingEnable*: VkBool32
    viewportCount*: uint32
    pViewportWScalings*: ptr VkViewportWScalingNV

  VkViewportSwizzleNV*  = object
    x*: VkViewportCoordinateSwizzleNV
    y*: VkViewportCoordinateSwizzleNV
    z*: VkViewportCoordinateSwizzleNV
    w*: VkViewportCoordinateSwizzleNV

  VkPipelineViewportSwizzleStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineViewportSwizzleStateCreateFlagsNV
    viewportCount*: uint32
    pViewportSwizzles*: ptr VkViewportSwizzleNV

  VkPhysicalDeviceDiscardRectanglePropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxDiscardRectangles*: uint32

  VkPipelineDiscardRectangleStateCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineDiscardRectangleStateCreateFlagsEXT
    discardRectangleMode*: VkDiscardRectangleModeEXT
    discardRectangleCount*: uint32
    pDiscardRectangles*: ptr VkRect2D

  VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX*  = object
    sType*: VkStructureType
    pNext*: pointer
    perViewPositionAllComponents*: VkBool32

  VkInputAttachmentAspectReference*  = object
    subpass*: uint32
    inputAttachmentIndex*: uint32
    aspectMask*: VkImageAspectFlags

  VkInputAttachmentAspectReferenceKHR*  = object

  VkRenderPassInputAttachmentAspectCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    aspectReferenceCount*: uint32
    pAspectReferences*: ptr VkInputAttachmentAspectReference

  VkRenderPassInputAttachmentAspectCreateInfoKHR*  = object

  VkPhysicalDeviceSurfaceInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    surface*: VkSurfaceKHR

  VkSurfaceCapabilities2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceCapabilities*: VkSurfaceCapabilitiesKHR

  VkSurfaceFormat2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceFormat*: VkSurfaceFormatKHR

  VkDisplayProperties2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    displayProperties*: VkDisplayPropertiesKHR

  VkDisplayPlaneProperties2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    displayPlaneProperties*: VkDisplayPlanePropertiesKHR

  VkDisplayModeProperties2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    displayModeProperties*: VkDisplayModePropertiesKHR

  VkDisplayPlaneInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    mode*: VkDisplayModeKHR
    planeIndex*: uint32

  VkDisplayPlaneCapabilities2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    capabilities*: VkDisplayPlaneCapabilitiesKHR

  VkSharedPresentSurfaceCapabilitiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    sharedPresentSupportedUsageFlags*: VkImageUsageFlags

  VkPhysicalDevice16BitStorageFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    storageBuffer16BitAccess*: VkBool32
    uniformAndStorageBuffer16BitAccess*: VkBool32
    storagePushConstant16*: VkBool32
    storageInputOutput16*: VkBool32

  VkPhysicalDevice16BitStorageFeaturesKHR*  = object

  VkPhysicalDeviceSubgroupProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    subgroupSize*: uint32
    supportedStages*: VkShaderStageFlags
    supportedOperations*: VkSubgroupFeatureFlags
    quadOperationsInAllStages*: VkBool32

  VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderSubgroupExtendedTypes*: VkBool32

  VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR*  = object

  VkBufferMemoryRequirementsInfo2*  = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer

  VkBufferMemoryRequirementsInfo2KHR*  = object

  VkImageMemoryRequirementsInfo2*  = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage

  VkImageMemoryRequirementsInfo2KHR*  = object

  VkImageSparseMemoryRequirementsInfo2*  = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage

  VkImageSparseMemoryRequirementsInfo2KHR*  = object

  VkMemoryRequirements2*  = object
    sType*: VkStructureType
    pNext*: pointer
    memoryRequirements*: VkMemoryRequirements

  VkMemoryRequirements2KHR*  = object

  VkSparseImageMemoryRequirements2*  = object
    sType*: VkStructureType
    pNext*: pointer
    memoryRequirements*: VkSparseImageMemoryRequirements

  VkSparseImageMemoryRequirements2KHR*  = object

  VkPhysicalDevicePointClippingProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    pointClippingBehavior*: VkPointClippingBehavior

  VkPhysicalDevicePointClippingPropertiesKHR*  = object

  VkMemoryDedicatedRequirements*  = object
    sType*: VkStructureType
    pNext*: pointer
    prefersDedicatedAllocation*: VkBool32
    requiresDedicatedAllocation*: VkBool32

  VkMemoryDedicatedRequirementsKHR*  = object

  VkMemoryDedicatedAllocateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    buffer*: VkBuffer

  VkMemoryDedicatedAllocateInfoKHR*  = object

  VkImageViewUsageCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    usage*: VkImageUsageFlags

  VkImageViewUsageCreateInfoKHR*  = object

  VkPipelineTessellationDomainOriginStateCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    domainOrigin*: VkTessellationDomainOrigin

  VkPipelineTessellationDomainOriginStateCreateInfoKHR*  = object

  VkSamplerYcbcrConversionInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    conversion*: VkSamplerYcbcrConversion

  VkSamplerYcbcrConversionInfoKHR*  = object

  VkSamplerYcbcrConversionCreateInfo*  = object
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

  VkSamplerYcbcrConversionCreateInfoKHR*  = object

  VkBindImagePlaneMemoryInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    planeAspect*: VkImageAspectFlagBits

  VkBindImagePlaneMemoryInfoKHR*  = object

  VkImagePlaneMemoryRequirementsInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    planeAspect*: VkImageAspectFlagBits

  VkImagePlaneMemoryRequirementsInfoKHR*  = object

  VkPhysicalDeviceSamplerYcbcrConversionFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    samplerYcbcrConversion*: VkBool32

  VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR*  = object

  VkSamplerYcbcrConversionImageFormatProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    combinedImageSamplerDescriptorCount*: uint32

  VkSamplerYcbcrConversionImageFormatPropertiesKHR*  = object

  VkTextureLODGatherFormatPropertiesAMD*  = object
    sType*: VkStructureType
    pNext*: pointer
    supportsTextureGatherLODBiasAMD*: VkBool32

  VkConditionalRenderingBeginInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer
    offset*: VkDeviceSize
    flags*: VkConditionalRenderingFlagsEXT

  VkProtectedSubmitInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    protectedSubmit*: VkBool32

  VkPhysicalDeviceProtectedMemoryFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    protectedMemory*: VkBool32

  VkPhysicalDeviceProtectedMemoryProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    protectedNoFault*: VkBool32

  VkDeviceQueueInfo2*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueIndex*: uint32

  VkPipelineCoverageToColorStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: VkBool32
    coverageToColorLocation*: uint32

  VkPhysicalDeviceSamplerFilterMinmaxProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    filterMinmaxSingleComponentFormats*: VkBool32
    filterMinmaxImageComponentMapping*: VkBool32

  VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT*  = object

  VkSampleLocationEXT*  = object
    x*: float32
    y*: float32

  VkSampleLocationsInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationsPerPixel*: VkSampleCountFlagBits
    sampleLocationGridSize*: VkExtent2D
    sampleLocationsCount*: uint32
    pSampleLocations*: ptr VkSampleLocationEXT

  VkAttachmentSampleLocationsEXT*  = object
    attachmentIndex*: uint32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkSubpassSampleLocationsEXT*  = object
    subpassIndex*: uint32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkRenderPassSampleLocationsBeginInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    attachmentInitialSampleLocationsCount*: uint32
    pAttachmentInitialSampleLocations*: ptr VkAttachmentSampleLocationsEXT
    postSubpassSampleLocationsCount*: uint32
    pPostSubpassSampleLocations*: ptr VkSubpassSampleLocationsEXT

  VkPipelineSampleLocationsStateCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationsEnable*: VkBool32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkPhysicalDeviceSampleLocationsPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationSampleCounts*: VkSampleCountFlags
    maxSampleLocationGridSize*: VkExtent2D
    sampleLocationCoordinateRange*: array[2, float32]
    sampleLocationSubPixelBits*: uint32
    variableSampleLocations*: VkBool32

  VkMultisamplePropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxSampleLocationGridSize*: VkExtent2D

  VkSamplerReductionModeCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    reductionMode*: VkSamplerReductionMode

  VkSamplerReductionModeCreateInfoEXT*  = object

  VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    advancedBlendCoherentOperations*: VkBool32

  VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    advancedBlendMaxColorAttachments*: uint32
    advancedBlendIndependentBlend*: VkBool32
    advancedBlendNonPremultipliedSrcColor*: VkBool32
    advancedBlendNonPremultipliedDstColor*: VkBool32
    advancedBlendCorrelatedOverlap*: VkBool32
    advancedBlendAllOperations*: VkBool32

  VkPipelineColorBlendAdvancedStateCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcPremultiplied*: VkBool32
    dstPremultiplied*: VkBool32
    blendOverlap*: VkBlendOverlapEXT

  VkPhysicalDeviceInlineUniformBlockFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    inlineUniformBlock*: VkBool32
    descriptorBindingInlineUniformBlockUpdateAfterBind*: VkBool32

  VkPhysicalDeviceInlineUniformBlockPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxInlineUniformBlockSize*: uint32
    maxPerStageDescriptorInlineUniformBlocks*: uint32
    maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks*: uint32
    maxDescriptorSetInlineUniformBlocks*: uint32
    maxDescriptorSetUpdateAfterBindInlineUniformBlocks*: uint32

  VkWriteDescriptorSetInlineUniformBlockEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    dataSize*: uint32
    pData*: pointer

  VkDescriptorPoolInlineUniformBlockCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxInlineUniformBlockBindings*: uint32

  VkPipelineCoverageModulationStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCoverageModulationStateCreateFlagsNV
    coverageModulationMode*: VkCoverageModulationModeNV
    coverageModulationTableEnable*: VkBool32
    coverageModulationTableCount*: uint32
    pCoverageModulationTable*: ptr float32

  VkImageFormatListCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    viewFormatCount*: uint32
    pViewFormats*: ptr VkFormat

  VkImageFormatListCreateInfoKHR*  = object

  VkValidationCacheCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkValidationCacheCreateFlagsEXT
    initialDataSize*: uint
    pInitialData*: pointer

  VkShaderModuleValidationCacheCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    validationCache*: VkValidationCacheEXT

  VkPhysicalDeviceMaintenance3Properties*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxPerSetDescriptors*: uint32
    maxMemoryAllocationSize*: VkDeviceSize

  VkPhysicalDeviceMaintenance3PropertiesKHR*  = object

  VkDescriptorSetLayoutSupport*  = object
    sType*: VkStructureType
    pNext*: pointer
    supported*: VkBool32

  VkDescriptorSetLayoutSupportKHR*  = object

  VkPhysicalDeviceShaderDrawParametersFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderDrawParameters*: VkBool32

  VkPhysicalDeviceShaderDrawParameterFeatures*  = object

  VkPhysicalDeviceShaderFloat16Int8Features*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderFloat16*: VkBool32
    shaderInt8*: VkBool32

  VkPhysicalDeviceShaderFloat16Int8FeaturesKHR*  = object

  VkPhysicalDeviceFloat16Int8FeaturesKHR*  = object

  VkPhysicalDeviceFloatControlsProperties*  = object
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

  VkPhysicalDeviceFloatControlsPropertiesKHR*  = object

  VkPhysicalDeviceHostQueryResetFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    hostQueryReset*: VkBool32

  VkPhysicalDeviceHostQueryResetFeaturesEXT*  = object

  VkNativeBufferUsage2ANDROID*  = object
    consumer*: uint64
    producer*: uint64

  VkNativeBufferANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    handle*: pointer
    stride*: int
    format*: int
    usage*: int
    usage2*: VkNativeBufferUsage2ANDROID

  VkSwapchainImageCreateInfoANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    usage*: VkSwapchainImageUsageFlagsANDROID

  VkPhysicalDevicePresentationPropertiesANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    sharedImage*: VkBool32

  VkShaderResourceUsageAMD*  = object
    numUsedVgprs*: uint32
    numUsedSgprs*: uint32
    ldsSizePerLocalWorkGroup*: uint32
    ldsUsageSizeInBytes*: uint
    scratchMemUsageInBytes*: uint

  VkShaderStatisticsInfoAMD*  = object
    shaderStageMask*: VkShaderStageFlags
    resourceUsage*: VkShaderResourceUsageAMD
    numPhysicalVgprs*: uint32
    numPhysicalSgprs*: uint32
    numAvailableVgprs*: uint32
    numAvailableSgprs*: uint32
    computeWorkGroupSize*: array[3, uint32]

  VkDeviceQueueGlobalPriorityCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    globalPriority*: VkQueueGlobalPriorityEXT

  VkDebugUtilsObjectNameInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkObjectType
    objectHandle*: uint64
    pObjectName*: cstring

  VkDebugUtilsObjectTagInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkObjectType
    objectHandle*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer

  VkDebugUtilsLabelEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    pLabelName*: cstring
    color*: array[4, float32]

  VkDebugUtilsMessengerCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDebugUtilsMessengerCreateFlagsEXT
    messageSeverity*: VkDebugUtilsMessageSeverityFlagsEXT
    messageType*: VkDebugUtilsMessageTypeFlagsEXT
    pfnUserCallback*: PFN_vkDebugUtilsMessengerCallbackEXT
    pUserData*: pointer

  VkDebugUtilsMessengerCallbackDataEXT*  = object
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

  VkPhysicalDeviceDeviceMemoryReportFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceMemoryReport*: VkBool32

  VkDeviceDeviceMemoryReportCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceMemoryReportFlagsEXT
    pfnUserCallback*: PFN_vkDeviceMemoryReportCallbackEXT
    pUserData*: pointer

  VkDeviceMemoryReportCallbackDataEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceMemoryReportFlagsEXT
    `type`*: VkDeviceMemoryReportEventTypeEXT
    memoryObjectId*: uint64
    size*: VkDeviceSize
    objectType*: VkObjectType
    objectHandle*: uint64
    heapIndex*: uint32

  VkImportMemoryHostPointerInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBits
    pHostPointer*: pointer

  VkMemoryHostPointerPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    memoryTypeBits*: uint32

  VkPhysicalDeviceExternalMemoryHostPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    minImportedHostPointerAlignment*: VkDeviceSize

  VkPhysicalDeviceConservativeRasterizationPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    primitiveOverestimationSize*: float32
    maxExtraPrimitiveOverestimationSize*: float32
    extraPrimitiveOverestimationSizeGranularity*: float32
    primitiveUnderestimation*: VkBool32
    conservativePointAndLineRasterization*: VkBool32
    degenerateTrianglesRasterized*: VkBool32
    degenerateLinesRasterized*: VkBool32
    fullyCoveredFragmentShaderInputVariable*: VkBool32
    conservativeRasterizationPostDepthCoverage*: VkBool32

  VkCalibratedTimestampInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    timeDomain*: VkTimeDomainEXT

  VkPhysicalDeviceShaderCorePropertiesAMD*  = object
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

  VkPhysicalDeviceShaderCoreProperties2AMD*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderCoreFeatures*: VkShaderCorePropertiesFlagsAMD
    activeComputeUnitCount*: uint32

  VkPipelineRasterizationConservativeStateCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationConservativeStateCreateFlagsEXT
    conservativeRasterizationMode*: VkConservativeRasterizationModeEXT
    extraPrimitiveOverestimationSize*: float32

  VkPhysicalDeviceDescriptorIndexingFeatures*  = object
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

  VkPhysicalDeviceDescriptorIndexingFeaturesEXT*  = object

  VkPhysicalDeviceDescriptorIndexingProperties*  = object
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

  VkPhysicalDeviceDescriptorIndexingPropertiesEXT*  = object

  VkDescriptorSetLayoutBindingFlagsCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    bindingCount*: uint32
    pBindingFlags*: ptr VkDescriptorBindingFlags

  VkDescriptorSetLayoutBindingFlagsCreateInfoEXT*  = object

  VkDescriptorSetVariableDescriptorCountAllocateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    descriptorSetCount*: uint32
    pDescriptorCounts*: ptr uint32

  VkDescriptorSetVariableDescriptorCountAllocateInfoEXT*  = object

  VkDescriptorSetVariableDescriptorCountLayoutSupport*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxVariableDescriptorCount*: uint32

  VkDescriptorSetVariableDescriptorCountLayoutSupportEXT*  = object

  VkAttachmentDescription2*  = object
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

  VkAttachmentDescription2KHR*  = object

  VkAttachmentReference2*  = object
    sType*: VkStructureType
    pNext*: pointer
    attachment*: uint32
    layout*: VkImageLayout
    aspectMask*: VkImageAspectFlags

  VkAttachmentReference2KHR*  = object

  VkSubpassDescription2*  = object
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

  VkSubpassDescription2KHR*  = object

  VkSubpassDependency2*  = object
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

  VkSubpassDependency2KHR*  = object

  VkRenderPassCreateInfo2*  = object
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

  VkRenderPassCreateInfo2KHR*  = object

  VkSubpassBeginInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    contents*: VkSubpassContents

  VkSubpassBeginInfoKHR*  = object

  VkSubpassEndInfo*  = object
    sType*: VkStructureType
    pNext*: pointer

  VkSubpassEndInfoKHR*  = object

  VkPhysicalDeviceTimelineSemaphoreFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    timelineSemaphore*: VkBool32

  VkPhysicalDeviceTimelineSemaphoreFeaturesKHR*  = object

  VkPhysicalDeviceTimelineSemaphoreProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxTimelineSemaphoreValueDifference*: uint64

  VkPhysicalDeviceTimelineSemaphorePropertiesKHR*  = object

  VkSemaphoreTypeCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    semaphoreType*: VkSemaphoreType
    initialValue*: uint64

  VkSemaphoreTypeCreateInfoKHR*  = object

  VkTimelineSemaphoreSubmitInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreValueCount*: uint32
    pWaitSemaphoreValues*: ptr uint64
    signalSemaphoreValueCount*: uint32
    pSignalSemaphoreValues*: ptr uint64

  VkTimelineSemaphoreSubmitInfoKHR*  = object

  VkSemaphoreWaitInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSemaphoreWaitFlags
    semaphoreCount*: uint32
    pSemaphores*: ptr VkSemaphore
    pValues*: ptr uint64

  VkSemaphoreWaitInfoKHR*  = object

  VkSemaphoreSignalInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    value*: uint64

  VkSemaphoreSignalInfoKHR*  = object

  VkVertexInputBindingDivisorDescriptionEXT*  = object
    binding*: uint32
    divisor*: uint32

  VkPipelineVertexInputDivisorStateCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    vertexBindingDivisorCount*: uint32
    pVertexBindingDivisors*: ptr VkVertexInputBindingDivisorDescriptionEXT

  VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxVertexAttribDivisor*: uint32

  VkPhysicalDevicePCIBusInfoPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    pciDomain*: uint32
    pciBus*: uint32
    pciDevice*: uint32
    pciFunction*: uint32

  VkImportAndroidHardwareBufferInfoANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: ptr AHardwareBuffer

  VkAndroidHardwareBufferUsageANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    androidHardwareBufferUsage*: uint64

  VkAndroidHardwareBufferPropertiesANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    allocationSize*: VkDeviceSize
    memoryTypeBits*: uint32

  VkMemoryGetAndroidHardwareBufferInfoANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory

  VkAndroidHardwareBufferFormatPropertiesANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    externalFormat*: uint64
    formatFeatures*: VkFormatFeatureFlags
    samplerYcbcrConversionComponents*: VkComponentMapping
    suggestedYcbcrModel*: VkSamplerYcbcrModelConversion
    suggestedYcbcrRange*: VkSamplerYcbcrRange
    suggestedXChromaOffset*: VkChromaLocation
    suggestedYChromaOffset*: VkChromaLocation

  VkCommandBufferInheritanceConditionalRenderingInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    conditionalRenderingEnable*: VkBool32

  VkExternalFormatANDROID*  = object
    sType*: VkStructureType
    pNext*: pointer
    externalFormat*: uint64

  VkPhysicalDevice8BitStorageFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    storageBuffer8BitAccess*: VkBool32
    uniformAndStorageBuffer8BitAccess*: VkBool32
    storagePushConstant8*: VkBool32

  VkPhysicalDevice8BitStorageFeaturesKHR*  = object

  VkPhysicalDeviceConditionalRenderingFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    conditionalRendering*: VkBool32
    inheritedConditionalRendering*: VkBool32

  VkPhysicalDeviceVulkanMemoryModelFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    vulkanMemoryModel*: VkBool32
    vulkanMemoryModelDeviceScope*: VkBool32
    vulkanMemoryModelAvailabilityVisibilityChains*: VkBool32

  VkPhysicalDeviceVulkanMemoryModelFeaturesKHR*  = object

  VkPhysicalDeviceShaderAtomicInt64Features*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderBufferInt64Atomics*: VkBool32
    shaderSharedInt64Atomics*: VkBool32

  VkPhysicalDeviceShaderAtomicInt64FeaturesKHR*  = object

  VkPhysicalDeviceShaderAtomicFloatFeaturesEXT*  = object
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

  VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    vertexAttributeInstanceRateDivisor*: VkBool32
    vertexAttributeInstanceRateZeroDivisor*: VkBool32

  VkQueueFamilyCheckpointPropertiesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    checkpointExecutionStageMask*: VkPipelineStageFlags

  VkCheckpointDataNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    stage*: VkPipelineStageFlagBits
    pCheckpointMarker*: pointer

  VkPhysicalDeviceDepthStencilResolveProperties*  = object
    sType*: VkStructureType
    pNext*: pointer
    supportedDepthResolveModes*: VkResolveModeFlags
    supportedStencilResolveModes*: VkResolveModeFlags
    independentResolveNone*: VkBool32
    independentResolve*: VkBool32

  VkPhysicalDeviceDepthStencilResolvePropertiesKHR*  = object

  VkSubpassDescriptionDepthStencilResolve*  = object
    sType*: VkStructureType
    pNext*: pointer
    depthResolveMode*: VkResolveModeFlagBits
    stencilResolveMode*: VkResolveModeFlagBits
    pDepthStencilResolveAttachment*: ptr VkAttachmentReference2

  VkSubpassDescriptionDepthStencilResolveKHR*  = object

  VkImageViewASTCDecodeModeEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    decodeMode*: VkFormat

  VkPhysicalDeviceASTCDecodeFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    decodeModeSharedExponent*: VkBool32

  VkPhysicalDeviceTransformFeedbackFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    transformFeedback*: VkBool32
    geometryStreams*: VkBool32

  VkPhysicalDeviceTransformFeedbackPropertiesEXT*  = object
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

  VkPipelineRasterizationStateStreamCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationStateStreamCreateFlagsEXT
    rasterizationStream*: uint32

  VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    representativeFragmentTest*: VkBool32

  VkPipelineRepresentativeFragmentTestStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    representativeFragmentTestEnable*: VkBool32

  VkPhysicalDeviceExclusiveScissorFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    exclusiveScissor*: VkBool32

  VkPipelineViewportExclusiveScissorStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    exclusiveScissorCount*: uint32
    pExclusiveScissors*: ptr VkRect2D

  VkPhysicalDeviceCornerSampledImageFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    cornerSampledImage*: VkBool32

  VkPhysicalDeviceComputeShaderDerivativesFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    computeDerivativeGroupQuads*: VkBool32
    computeDerivativeGroupLinear*: VkBool32

  VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentShaderBarycentric*: VkBool32

  VkPhysicalDeviceShaderImageFootprintFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    imageFootprint*: VkBool32

  VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    dedicatedAllocationImageAliasing*: VkBool32

  VkShadingRatePaletteNV*  = object
    shadingRatePaletteEntryCount*: uint32
    pShadingRatePaletteEntries*: ptr VkShadingRatePaletteEntryNV

  VkPipelineViewportShadingRateImageStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    shadingRateImageEnable*: VkBool32
    viewportCount*: uint32
    pShadingRatePalettes*: ptr VkShadingRatePaletteNV

  VkPhysicalDeviceShadingRateImageFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    shadingRateImage*: VkBool32
    shadingRateCoarseSampleOrder*: VkBool32

  VkPhysicalDeviceShadingRateImagePropertiesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    shadingRateTexelSize*: VkExtent2D
    shadingRatePaletteSize*: uint32
    shadingRateMaxCoarseSamples*: uint32

  VkCoarseSampleLocationNV*  = object
    pixelX*: uint32
    pixelY*: uint32
    sample*: uint32

  VkCoarseSampleOrderCustomNV*  = object
    shadingRate*: VkShadingRatePaletteEntryNV
    sampleCount*: uint32
    sampleLocationCount*: uint32
    pSampleLocations*: ptr VkCoarseSampleLocationNV

  VkPipelineViewportCoarseSampleOrderStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    sampleOrderType*: VkCoarseSampleOrderTypeNV
    customSampleOrderCount*: uint32
    pCustomSampleOrders*: ptr VkCoarseSampleOrderCustomNV

  VkPhysicalDeviceMeshShaderFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    taskShader*: VkBool32
    meshShader*: VkBool32

  VkPhysicalDeviceMeshShaderPropertiesNV*  = object
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

  VkDrawMeshTasksIndirectCommandNV*  = object
    taskCount*: uint32
    firstTask*: uint32

  VkRayTracingShaderGroupCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkRayTracingShaderGroupTypeKHR
    generalShader*: uint32
    closestHitShader*: uint32
    anyHitShader*: uint32
    intersectionShader*: uint32

  VkRayTracingShaderGroupCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkRayTracingShaderGroupTypeKHR
    generalShader*: uint32
    closestHitShader*: uint32
    anyHitShader*: uint32
    intersectionShader*: uint32
    pShaderGroupCaptureReplayHandle*: pointer

  VkRayTracingPipelineCreateInfoNV*  = object
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

  VkRayTracingPipelineCreateInfoKHR*  = object
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

  VkGeometryTrianglesNV*  = object
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

  VkGeometryAABBNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    aabbData*: VkBuffer
    numAABBs*: uint32
    stride*: uint32
    offset*: VkDeviceSize

  VkGeometryDataNV*  = object
    triangles*: VkGeometryTrianglesNV
    aabbs*: VkGeometryAABBNV

  VkGeometryNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    geometryType*: VkGeometryTypeKHR
    geometry*: VkGeometryDataNV
    flags*: VkGeometryFlagsKHR

  VkAccelerationStructureInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkAccelerationStructureTypeNV
    flags*: VkBuildAccelerationStructureFlagsNV
    instanceCount*: uint32
    geometryCount*: uint32
    pGeometries*: ptr VkGeometryNV

  VkAccelerationStructureCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    compactedSize*: VkDeviceSize
    info*: VkAccelerationStructureInfoNV

  VkBindAccelerationStructureMemoryInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructure*: VkAccelerationStructureNV
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32

  VkWriteDescriptorSetAccelerationStructureKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructureCount*: uint32
    pAccelerationStructures*: ptr VkAccelerationStructureKHR

  VkWriteDescriptorSetAccelerationStructureNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructureCount*: uint32
    pAccelerationStructures*: ptr VkAccelerationStructureNV

  VkAccelerationStructureMemoryRequirementsInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkAccelerationStructureMemoryRequirementsTypeNV
    accelerationStructure*: VkAccelerationStructureNV

  VkPhysicalDeviceAccelerationStructureFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructure*: VkBool32
    accelerationStructureCaptureReplay*: VkBool32
    accelerationStructureIndirectBuild*: VkBool32
    accelerationStructureHostCommands*: VkBool32
    descriptorBindingAccelerationStructureUpdateAfterBind*: VkBool32

  VkPhysicalDeviceRayTracingPipelineFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    rayTracingPipeline*: VkBool32
    rayTracingPipelineShaderGroupHandleCaptureReplay*: VkBool32
    rayTracingPipelineShaderGroupHandleCaptureReplayMixed*: VkBool32
    rayTracingPipelineTraceRaysIndirect*: VkBool32
    rayTraversalPrimitiveCulling*: VkBool32

  VkPhysicalDeviceRayQueryFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    rayQuery*: VkBool32

  VkPhysicalDeviceAccelerationStructurePropertiesKHR*  = object
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

  VkPhysicalDeviceRayTracingPipelinePropertiesKHR*  = object
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

  VkPhysicalDeviceRayTracingPropertiesNV*  = object
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

  VkStridedDeviceAddressRegionKHR*  = object
    deviceAddress*: VkDeviceAddress
    stride*: VkDeviceSize
    size*: VkDeviceSize

  VkTraceRaysIndirectCommandKHR*  = object
    width*: uint32
    height*: uint32
    depth*: uint32

  VkDrmFormatModifierPropertiesListEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifierCount*: uint32
    pDrmFormatModifierProperties*: ptr VkDrmFormatModifierPropertiesEXT

  VkDrmFormatModifierPropertiesEXT*  = object
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    drmFormatModifierTilingFeatures*: VkFormatFeatureFlags

  VkPhysicalDeviceImageDrmFormatModifierInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifier*: uint64
    sharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32

  VkImageDrmFormatModifierListCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifierCount*: uint32
    pDrmFormatModifiers*: ptr uint64

  VkImageDrmFormatModifierExplicitCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    pPlaneLayouts*: ptr VkSubresourceLayout

  VkImageDrmFormatModifierPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    drmFormatModifier*: uint64

  VkImageStencilUsageCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    stencilUsage*: VkImageUsageFlags

  VkImageStencilUsageCreateInfoEXT*  = object

  VkDeviceMemoryOverallocationCreateInfoAMD*  = object
    sType*: VkStructureType
    pNext*: pointer
    overallocationBehavior*: VkMemoryOverallocationBehaviorAMD

  VkPhysicalDeviceFragmentDensityMapFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentDensityMap*: VkBool32
    fragmentDensityMapDynamic*: VkBool32
    fragmentDensityMapNonSubsampledImages*: VkBool32

  VkPhysicalDeviceFragmentDensityMap2FeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentDensityMapDeferred*: VkBool32

  VkPhysicalDeviceFragmentDensityMapPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    minFragmentDensityTexelSize*: VkExtent2D
    maxFragmentDensityTexelSize*: VkExtent2D
    fragmentDensityInvocations*: VkBool32

  VkPhysicalDeviceFragmentDensityMap2PropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    subsampledLoads*: VkBool32
    subsampledCoarseReconstructionEarlyAccess*: VkBool32
    maxSubsampledArrayLayers*: uint32
    maxDescriptorSetSubsampledSamplers*: uint32

  VkRenderPassFragmentDensityMapCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentDensityMapAttachment*: VkAttachmentReference

  VkPhysicalDeviceScalarBlockLayoutFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    scalarBlockLayout*: VkBool32

  VkPhysicalDeviceScalarBlockLayoutFeaturesEXT*  = object

  VkSurfaceProtectedCapabilitiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    supportsProtected*: VkBool32

  VkPhysicalDeviceUniformBufferStandardLayoutFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    uniformBufferStandardLayout*: VkBool32

  VkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR*  = object

  VkPhysicalDeviceDepthClipEnableFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    depthClipEnable*: VkBool32

  VkPipelineRasterizationDepthClipStateCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationDepthClipStateCreateFlagsEXT
    depthClipEnable*: VkBool32

  VkPhysicalDeviceMemoryBudgetPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    heapBudget*: array[vkMaxMemoryHeaps, VkDeviceSize]
    heapUsage*: array[vkMaxMemoryHeaps, VkDeviceSize]

  VkPhysicalDeviceMemoryPriorityFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    memoryPriority*: VkBool32

  VkMemoryPriorityAllocateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    priority*: float32

  VkPhysicalDeviceBufferDeviceAddressFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    bufferDeviceAddress*: VkBool32
    bufferDeviceAddressCaptureReplay*: VkBool32
    bufferDeviceAddressMultiDevice*: VkBool32

  VkPhysicalDeviceBufferDeviceAddressFeaturesKHR*  = object

  VkPhysicalDeviceBufferDeviceAddressFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    bufferDeviceAddress*: VkBool32
    bufferDeviceAddressCaptureReplay*: VkBool32
    bufferDeviceAddressMultiDevice*: VkBool32

  VkPhysicalDeviceBufferAddressFeaturesEXT*  = object

  VkBufferDeviceAddressInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer

  VkBufferDeviceAddressInfoKHR*  = object

  VkBufferDeviceAddressInfoEXT*  = object

  VkBufferOpaqueCaptureAddressCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    opaqueCaptureAddress*: uint64

  VkBufferOpaqueCaptureAddressCreateInfoKHR*  = object

  VkBufferDeviceAddressCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceAddress*: VkDeviceAddress

  VkPhysicalDeviceImageViewImageFormatInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    imageViewType*: VkImageViewType

  VkFilterCubicImageViewImageFormatPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    filterCubic*: VkBool32
    filterCubicMinmax*: VkBool32

  VkPhysicalDeviceImagelessFramebufferFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    imagelessFramebuffer*: VkBool32

  VkPhysicalDeviceImagelessFramebufferFeaturesKHR*  = object

  VkFramebufferAttachmentsCreateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    attachmentImageInfoCount*: uint32
    pAttachmentImageInfos*: ptr VkFramebufferAttachmentImageInfo

  VkFramebufferAttachmentsCreateInfoKHR*  = object

  VkFramebufferAttachmentImageInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkImageCreateFlags
    usage*: VkImageUsageFlags
    width*: uint32
    height*: uint32
    layerCount*: uint32
    viewFormatCount*: uint32
    pViewFormats*: ptr VkFormat

  VkFramebufferAttachmentImageInfoKHR*  = object

  VkRenderPassAttachmentBeginInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    attachmentCount*: uint32
    pAttachments*: ptr VkImageView

  VkRenderPassAttachmentBeginInfoKHR*  = object

  VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    textureCompressionASTC_HDR*: VkBool32

  VkPhysicalDeviceCooperativeMatrixFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    cooperativeMatrix*: VkBool32
    cooperativeMatrixRobustBufferAccess*: VkBool32

  VkPhysicalDeviceCooperativeMatrixPropertiesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    cooperativeMatrixSupportedStages*: VkShaderStageFlags

  VkCooperativeMatrixPropertiesNV*  = object
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

  VkPhysicalDeviceYcbcrImageArraysFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    ycbcrImageArrays*: VkBool32

  VkImageViewHandleInfoNVX*  = object
    sType*: VkStructureType
    pNext*: pointer
    imageView*: VkImageView
    descriptorType*: VkDescriptorType
    sampler*: VkSampler

  VkImageViewAddressPropertiesNVX*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceAddress*: VkDeviceAddress
    size*: VkDeviceSize

  VkPresentFrameTokenGGP*  = object
    sType*: VkStructureType
    pNext*: pointer
    frameToken*: GgpFrameToken

  VkPipelineCreationFeedbackEXT*  = object
    flags*: VkPipelineCreationFeedbackFlagsEXT
    duration*: uint64

  VkPipelineCreationFeedbackCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    pPipelineCreationFeedback*: ptr VkPipelineCreationFeedbackEXT
    pipelineStageCreationFeedbackCount*: uint32
    pPipelineStageCreationFeedbacks*: ptr ptr VkPipelineCreationFeedbackEXT

  VkSurfaceFullScreenExclusiveInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    fullScreenExclusive*: VkFullScreenExclusiveEXT

  VkSurfaceFullScreenExclusiveWin32InfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    hmonitor*: HMONITOR

  VkSurfaceCapabilitiesFullScreenExclusiveEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    fullScreenExclusiveSupported*: VkBool32

  VkPhysicalDevicePerformanceQueryFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    performanceCounterQueryPools*: VkBool32
    performanceCounterMultipleQueryPools*: VkBool32

  VkPhysicalDevicePerformanceQueryPropertiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    allowCommandBufferQueryCopies*: VkBool32

  VkPerformanceCounterKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    unit*: VkPerformanceCounterUnitKHR
    scope*: VkPerformanceCounterScopeKHR
    storage*: VkPerformanceCounterStorageKHR
    uuid*: array[vkUuidSize, uint8]

  VkPerformanceCounterDescriptionKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPerformanceCounterDescriptionFlagsKHR
    name*: array[vkMaxDescriptionSize, char]
    category*: array[vkMaxDescriptionSize, char]
    description*: array[vkMaxDescriptionSize, char]

  VkQueryPoolPerformanceCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    queueFamilyIndex*: uint32
    counterIndexCount*: uint32
    pCounterIndices*: ptr uint32

  VkPerformanceCounterResultKHR* {.union.} = object
    int32*: int32
    int64*: int64
    uint32*: uint32
    uint64*: uint64
    float32*: float32
    float64*: float64

  VkAcquireProfilingLockInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkAcquireProfilingLockFlagsKHR
    timeout*: uint64

  VkPerformanceQuerySubmitInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    counterPassIndex*: uint32

  VkHeadlessSurfaceCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkHeadlessSurfaceCreateFlagsEXT

  VkPhysicalDeviceCoverageReductionModeFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    coverageReductionMode*: VkBool32

  VkPipelineCoverageReductionStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCoverageReductionStateCreateFlagsNV
    coverageReductionMode*: VkCoverageReductionModeNV

  VkFramebufferMixedSamplesCombinationNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    coverageReductionMode*: VkCoverageReductionModeNV
    rasterizationSamples*: VkSampleCountFlagBits
    depthStencilSamples*: VkSampleCountFlags
    colorSamples*: VkSampleCountFlags

  VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderIntegerFunctions2*: VkBool32

  VkPerformanceValueDataINTEL* {.union.} = object
    value32*: uint32
    value64*: uint64
    valueFloat*: float32
    valueBool*: VkBool32
    valueString*: cstring

  VkPerformanceValueINTEL*  = object
    `type`*: VkPerformanceValueTypeINTEL
    data*: VkPerformanceValueDataINTEL

  VkInitializePerformanceApiInfoINTEL*  = object
    sType*: VkStructureType
    pNext*: pointer
    pUserData*: pointer

  VkQueryPoolPerformanceQueryCreateInfoINTEL*  = object
    sType*: VkStructureType
    pNext*: pointer
    performanceCountersSampling*: VkQueryPoolSamplingModeINTEL

  VkQueryPoolCreateInfoINTEL*  = object

  VkPerformanceMarkerInfoINTEL*  = object
    sType*: VkStructureType
    pNext*: pointer
    marker*: uint64

  VkPerformanceStreamMarkerInfoINTEL*  = object
    sType*: VkStructureType
    pNext*: pointer
    marker*: uint32

  VkPerformanceOverrideInfoINTEL*  = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkPerformanceOverrideTypeINTEL
    enable*: VkBool32
    parameter*: uint64

  VkPerformanceConfigurationAcquireInfoINTEL*  = object
    sType*: VkStructureType
    pNext*: pointer
    `type`*: VkPerformanceConfigurationTypeINTEL

  VkPhysicalDeviceShaderClockFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderSubgroupClock*: VkBool32
    shaderDeviceClock*: VkBool32

  VkPhysicalDeviceIndexTypeUint8FeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    indexTypeUint8*: VkBool32

  VkPhysicalDeviceShaderSMBuiltinsPropertiesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderSMCount*: uint32
    shaderWarpsPerSM*: uint32

  VkPhysicalDeviceShaderSMBuiltinsFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderSMBuiltins*: VkBool32

  VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentShaderSampleInterlock*: VkBool32
    fragmentShaderPixelInterlock*: VkBool32
    fragmentShaderShadingRateInterlock*: VkBool32

  VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures*  = object
    sType*: VkStructureType
    pNext*: pointer
    separateDepthStencilLayouts*: VkBool32

  VkPhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR*  = object

  VkAttachmentReferenceStencilLayout*  = object
    sType*: VkStructureType
    pNext*: pointer
    stencilLayout*: VkImageLayout

  VkAttachmentReferenceStencilLayoutKHR*  = object

  VkAttachmentDescriptionStencilLayout*  = object
    sType*: VkStructureType
    pNext*: pointer
    stencilInitialLayout*: VkImageLayout
    stencilFinalLayout*: VkImageLayout

  VkAttachmentDescriptionStencilLayoutKHR*  = object

  VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineExecutableInfo*: VkBool32

  VkPipelineInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pipeline*: VkPipeline

  VkPipelineExecutablePropertiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    stages*: VkShaderStageFlags
    name*: array[vkMaxDescriptionSize, char]
    description*: array[vkMaxDescriptionSize, char]
    subgroupSize*: uint32

  VkPipelineExecutableInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pipeline*: VkPipeline
    executableIndex*: uint32

  VkPipelineExecutableStatisticValueKHR* {.union.} = object
    b32*: VkBool32
    i64*: int64
    u64*: uint64
    f64*: float64

  VkPipelineExecutableStatisticKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    name*: array[vkMaxDescriptionSize, char]
    description*: array[vkMaxDescriptionSize, char]
    format*: VkPipelineExecutableStatisticFormatKHR
    value*: VkPipelineExecutableStatisticValueKHR

  VkPipelineExecutableInternalRepresentationKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    name*: array[vkMaxDescriptionSize, char]
    description*: array[vkMaxDescriptionSize, char]
    isText*: VkBool32
    dataSize*: uint
    pData*: pointer

  VkPhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderDemoteToHelperInvocation*: VkBool32

  VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    texelBufferAlignment*: VkBool32

  VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    storageTexelBufferOffsetAlignmentBytes*: VkDeviceSize
    storageTexelBufferOffsetSingleTexelAlignment*: VkBool32
    uniformTexelBufferOffsetAlignmentBytes*: VkDeviceSize
    uniformTexelBufferOffsetSingleTexelAlignment*: VkBool32

  VkPhysicalDeviceSubgroupSizeControlFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    subgroupSizeControl*: VkBool32
    computeFullSubgroups*: VkBool32

  VkPhysicalDeviceSubgroupSizeControlPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    minSubgroupSize*: uint32
    maxSubgroupSize*: uint32
    maxComputeWorkgroupSubgroups*: uint32
    requiredSubgroupSizeStages*: VkShaderStageFlags

  VkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    requiredSubgroupSize*: uint32

  VkMemoryOpaqueCaptureAddressAllocateInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    opaqueCaptureAddress*: uint64

  VkMemoryOpaqueCaptureAddressAllocateInfoKHR*  = object

  VkDeviceMemoryOpaqueCaptureAddressInfo*  = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory

  VkDeviceMemoryOpaqueCaptureAddressInfoKHR*  = object

  VkPhysicalDeviceLineRasterizationFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    rectangularLines*: VkBool32
    bresenhamLines*: VkBool32
    smoothLines*: VkBool32
    stippledRectangularLines*: VkBool32
    stippledBresenhamLines*: VkBool32
    stippledSmoothLines*: VkBool32

  VkPhysicalDeviceLineRasterizationPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    lineSubPixelPrecisionBits*: uint32

  VkPipelineRasterizationLineStateCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    lineRasterizationMode*: VkLineRasterizationModeEXT
    stippledLineEnable*: VkBool32
    lineStippleFactor*: uint32
    lineStipplePattern*: uint16

  VkPhysicalDevicePipelineCreationCacheControlFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineCreationCacheControl*: VkBool32

  VkPhysicalDeviceVulkan11Features*  = object
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

  VkPhysicalDeviceVulkan11Properties*  = object
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

  VkPhysicalDeviceVulkan12Features*  = object
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

  VkPhysicalDeviceVulkan12Properties*  = object
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

  VkPipelineCompilerControlCreateInfoAMD*  = object
    sType*: VkStructureType
    pNext*: pointer
    compilerControlFlags*: VkPipelineCompilerControlFlagsAMD

  VkPhysicalDeviceCoherentMemoryFeaturesAMD*  = object
    sType*: VkStructureType
    pNext*: pointer
    deviceCoherentMemory*: VkBool32

  VkPhysicalDeviceToolPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    name*: array[vkMaxExtensionNameSize, char]
    version*: array[vkMaxExtensionNameSize, char]
    purposes*: VkToolPurposeFlagsEXT
    description*: array[vkMaxDescriptionSize, char]
    layer*: array[vkMaxExtensionNameSize, char]

  VkSamplerCustomBorderColorCreateInfoEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    customBorderColor*: VkClearColorValue
    format*: VkFormat

  VkPhysicalDeviceCustomBorderColorPropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxCustomBorderColorSamplers*: uint32

  VkPhysicalDeviceCustomBorderColorFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    customBorderColors*: VkBool32
    customBorderColorWithoutFormat*: VkBool32

  VkDeviceOrHostAddressKHR* {.union.} = object
    deviceAddress*: VkDeviceAddress
    hostAddress*: pointer

  VkDeviceOrHostAddressConstKHR* {.union.} = object
    deviceAddress*: VkDeviceAddress
    hostAddress*: pointer

  VkAccelerationStructureGeometryTrianglesDataKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    vertexFormat*: VkFormat
    vertexData*: VkDeviceOrHostAddressConstKHR
    vertexStride*: VkDeviceSize
    maxVertex*: uint32
    indexType*: VkIndexType
    indexData*: VkDeviceOrHostAddressConstKHR
    transformData*: VkDeviceOrHostAddressConstKHR

  VkAccelerationStructureGeometryAabbsDataKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    data*: VkDeviceOrHostAddressConstKHR
    stride*: VkDeviceSize

  VkAccelerationStructureGeometryInstancesDataKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    arrayOfPointers*: VkBool32
    data*: VkDeviceOrHostAddressConstKHR

  VkAccelerationStructureGeometryDataKHR* {.union.} = object
    triangles*: VkAccelerationStructureGeometryTrianglesDataKHR
    aabbs*: VkAccelerationStructureGeometryAabbsDataKHR
    instances*: VkAccelerationStructureGeometryInstancesDataKHR

  VkAccelerationStructureGeometryKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    geometryType*: VkGeometryTypeKHR
    geometry*: VkAccelerationStructureGeometryDataKHR
    flags*: VkGeometryFlagsKHR

  VkAccelerationStructureBuildGeometryInfoKHR*  = object
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

  VkAccelerationStructureBuildRangeInfoKHR*  = object
    primitiveCount*: uint32
    primitiveOffset*: uint32
    firstVertex*: uint32
    transformOffset*: uint32

  VkAccelerationStructureCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    createFlags*: VkAccelerationStructureCreateFlagsKHR
    buffer*: VkBuffer
    offset*: VkDeviceSize
    size*: VkDeviceSize
    `type`*: VkAccelerationStructureTypeKHR
    deviceAddress*: VkDeviceAddress

  VkAabbPositionsKHR*  = object
    minX*: float32
    minY*: float32
    minZ*: float32
    maxX*: float32
    maxY*: float32
    maxZ*: float32

  VkAabbPositionsNV*  = object

  VkTransformMatrixKHR*  = object
    matrix*: array[3, float32]

  VkTransformMatrixNV*  = object

  VkAccelerationStructureInstanceKHR*  = object
    transform*: VkTransformMatrixKHR
    instanceCustomIndex*: uint32
    mask*: uint32
    instanceShaderBindingTableRecordOffset*: uint32
    flags*: VkGeometryInstanceFlagsKHR
    accelerationStructureReference*: uint64

  VkAccelerationStructureInstanceNV*  = object

  VkAccelerationStructureDeviceAddressInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructure*: VkAccelerationStructureKHR

  VkAccelerationStructureVersionInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pVersionData*: ptr uint8

  VkCopyAccelerationStructureInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    src*: VkAccelerationStructureKHR
    dst*: VkAccelerationStructureKHR
    mode*: VkCopyAccelerationStructureModeKHR

  VkCopyAccelerationStructureToMemoryInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    src*: VkAccelerationStructureKHR
    dst*: VkDeviceOrHostAddressKHR
    mode*: VkCopyAccelerationStructureModeKHR

  VkCopyMemoryToAccelerationStructureInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    src*: VkDeviceOrHostAddressConstKHR
    dst*: VkAccelerationStructureKHR
    mode*: VkCopyAccelerationStructureModeKHR

  VkRayTracingPipelineInterfaceCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxPipelineRayPayloadSize*: uint32
    maxPipelineRayHitAttributeSize*: uint32

  VkPipelineLibraryCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    libraryCount*: uint32
    pLibraries*: ptr VkPipeline

  VkPhysicalDeviceExtendedDynamicStateFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    extendedDynamicState*: VkBool32

  VkRenderPassTransformBeginInfoQCOM*  = object
    sType*: VkStructureType
    pNext*: pointer
    transform*: VkSurfaceTransformFlagBitsKHR

  VkCopyCommandTransformInfoQCOM*  = object
    sType*: VkStructureType
    pNext*: pointer
    transform*: VkSurfaceTransformFlagBitsKHR

  VkCommandBufferInheritanceRenderPassTransformInfoQCOM*  = object
    sType*: VkStructureType
    pNext*: pointer
    transform*: VkSurfaceTransformFlagBitsKHR
    renderArea*: VkRect2D

  VkPhysicalDeviceDiagnosticsConfigFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    diagnosticsConfig*: VkBool32

  VkDeviceDiagnosticsConfigCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceDiagnosticsConfigFlagsNV

  VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderZeroInitializeWorkgroupMemory*: VkBool32

  VkPhysicalDeviceRobustness2FeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    robustBufferAccess2*: VkBool32
    robustImageAccess2*: VkBool32
    nullDescriptor*: VkBool32

  VkPhysicalDeviceRobustness2PropertiesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    robustStorageBufferAccessSizeAlignment*: VkDeviceSize
    robustUniformBufferAccessSizeAlignment*: VkDeviceSize

  VkPhysicalDeviceImageRobustnessFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    robustImageAccess*: VkBool32

  VkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    workgroupMemoryExplicitLayout*: VkBool32
    workgroupMemoryExplicitLayoutScalarBlockLayout*: VkBool32
    workgroupMemoryExplicitLayout8BitAccess*: VkBool32
    workgroupMemoryExplicitLayout16BitAccess*: VkBool32

  VkPhysicalDevicePortabilitySubsetFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    constantAlphaColorBlendFactors*: VkBool32
    events*: VkBool32
    imageViewFormatReinterpretation*: VkBool32
    imageViewFormatSwizzle*: VkBool32
    imageView2DOn3DImage*: VkBool32
    multisampleArrayImage*: VkBool32
    mutableComparisonSamplers*: VkBool32
    pointPolygons*: VkBool32
    samplerMipLodBias*: VkBool32
    separateStencilMaskRef*: VkBool32
    shaderSampleRateInterpolationFunctions*: VkBool32
    tessellationIsolines*: VkBool32
    tessellationPointMode*: VkBool32
    triangleFans*: VkBool32
    vertexAttributeAccessBeyondStride*: VkBool32

  VkPhysicalDevicePortabilitySubsetPropertiesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    minVertexInputBindingStrideAlignment*: uint32

  VkPhysicalDevice4444FormatsFeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    formatA4R4G4B4*: VkBool32
    formatA4B4G4R4*: VkBool32

  VkBufferCopy2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcOffset*: VkDeviceSize
    dstOffset*: VkDeviceSize
    size*: VkDeviceSize

  VkImageCopy2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkImageBlit2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcSubresource*: VkImageSubresourceLayers
    srcOffsets*: array[2, VkOffset3D]
    dstSubresource*: VkImageSubresourceLayers
    dstOffsets*: array[2, VkOffset3D]

  VkBufferImageCopy2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    bufferOffset*: VkDeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: VkImageSubresourceLayers
    imageOffset*: VkOffset3D
    imageExtent*: VkExtent3D

  VkImageResolve2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkCopyBufferInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcBuffer*: VkBuffer
    dstBuffer*: VkBuffer
    regionCount*: uint32
    pRegions*: ptr VkBufferCopy2KHR

  VkCopyImageInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcImage*: VkImage
    srcImageLayout*: VkImageLayout
    dstImage*: VkImage
    dstImageLayout*: VkImageLayout
    regionCount*: uint32
    pRegions*: ptr VkImageCopy2KHR

  VkBlitImageInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcImage*: VkImage
    srcImageLayout*: VkImageLayout
    dstImage*: VkImage
    dstImageLayout*: VkImageLayout
    regionCount*: uint32
    pRegions*: ptr VkImageBlit2KHR
    filter*: VkFilter

  VkCopyBufferToImageInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcBuffer*: VkBuffer
    dstImage*: VkImage
    dstImageLayout*: VkImageLayout
    regionCount*: uint32
    pRegions*: ptr VkBufferImageCopy2KHR

  VkCopyImageToBufferInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcImage*: VkImage
    srcImageLayout*: VkImageLayout
    dstBuffer*: VkBuffer
    regionCount*: uint32
    pRegions*: ptr VkBufferImageCopy2KHR

  VkResolveImageInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcImage*: VkImage
    srcImageLayout*: VkImageLayout
    dstImage*: VkImage
    dstImageLayout*: VkImageLayout
    regionCount*: uint32
    pRegions*: ptr VkImageResolve2KHR

  VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderImageInt64Atomics*: VkBool32
    sparseImageInt64Atomics*: VkBool32

  VkFragmentShadingRateAttachmentInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pFragmentShadingRateAttachment*: ptr VkAttachmentReference2
    shadingRateAttachmentTexelSize*: VkExtent2D

  VkPipelineFragmentShadingRateStateCreateInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentSize*: VkExtent2D
    combinerOps*: array[2, VkFragmentShadingRateCombinerOpKHR]

  VkPhysicalDeviceFragmentShadingRateFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineFragmentShadingRate*: VkBool32
    primitiveFragmentShadingRate*: VkBool32
    attachmentFragmentShadingRate*: VkBool32

  VkPhysicalDeviceFragmentShadingRatePropertiesKHR*  = object
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

  VkPhysicalDeviceFragmentShadingRateKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    sampleCounts*: VkSampleCountFlags
    fragmentSize*: VkExtent2D

  VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    shaderTerminateInvocation*: VkBool32

  VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    fragmentShadingRateEnums*: VkBool32
    supersampleFragmentShadingRates*: VkBool32
    noInvocationFragmentShadingRates*: VkBool32

  VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    maxFragmentShadingRateInvocationCount*: VkSampleCountFlagBits

  VkPipelineFragmentShadingRateEnumStateCreateInfoNV*  = object
    sType*: VkStructureType
    pNext*: pointer
    shadingRateType*: VkFragmentShadingRateTypeNV
    shadingRate*: VkFragmentShadingRateNV
    combinerOps*: array[2, VkFragmentShadingRateCombinerOpKHR]

  VkAccelerationStructureBuildSizesInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    accelerationStructureSize*: VkDeviceSize
    updateScratchSize*: VkDeviceSize
    buildScratchSize*: VkDeviceSize

  VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE*  = object
    sType*: VkStructureType
    pNext*: pointer
    mutableDescriptorType*: VkBool32

  VkMutableDescriptorTypeListVALVE*  = object
    descriptorTypeCount*: uint32
    pDescriptorTypes*: ptr VkDescriptorType

  VkMutableDescriptorTypeCreateInfoVALVE*  = object
    sType*: VkStructureType
    pNext*: pointer
    mutableDescriptorTypeListCount*: uint32
    pMutableDescriptorTypeLists*: ptr VkMutableDescriptorTypeListVALVE

  VkMemoryBarrier2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    srcStageMask*: VkPipelineStageFlags2KHR
    srcAccessMask*: VkAccessFlags2KHR
    dstStageMask*: VkPipelineStageFlags2KHR
    dstAccessMask*: VkAccessFlags2KHR

  VkImageMemoryBarrier2KHR*  = object
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

  VkBufferMemoryBarrier2KHR*  = object
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

  VkDependencyInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    dependencyFlags*: VkDependencyFlags
    memoryBarrierCount*: uint32
    pMemoryBarriers*: ptr VkMemoryBarrier2KHR
    bufferMemoryBarrierCount*: uint32
    pBufferMemoryBarriers*: ptr VkBufferMemoryBarrier2KHR
    imageMemoryBarrierCount*: uint32
    pImageMemoryBarriers*: ptr VkImageMemoryBarrier2KHR

  VkSemaphoreSubmitInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    value*: uint64
    stageMask*: VkPipelineStageFlags2KHR
    deviceIndex*: uint32

  VkCommandBufferSubmitInfoKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    commandBuffer*: VkCommandBuffer
    deviceMask*: uint32

  VkSubmitInfo2KHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSubmitFlagsKHR
    waitSemaphoreInfoCount*: uint32
    pWaitSemaphoreInfos*: ptr VkSemaphoreSubmitInfoKHR
    commandBufferInfoCount*: uint32
    pCommandBufferInfos*: ptr VkCommandBufferSubmitInfoKHR
    signalSemaphoreInfoCount*: uint32
    pSignalSemaphoreInfos*: ptr VkSemaphoreSubmitInfoKHR

  VkQueueFamilyCheckpointProperties2NV*  = object
    sType*: VkStructureType
    pNext*: pointer
    checkpointExecutionStageMask*: VkPipelineStageFlags2KHR

  VkCheckpointData2NV*  = object
    sType*: VkStructureType
    pNext*: pointer
    stage*: VkPipelineStageFlags2KHR
    pCheckpointMarker*: pointer

  VkPhysicalDeviceSynchronization2FeaturesKHR*  = object
    sType*: VkStructureType
    pNext*: pointer
    synchronization2*: VkBool32
converter toVkPipelineCacheCreateFlags*(x: VkPipelineCacheCreateFlagBits): VkPipelineCacheCreateFlags = VkPipelineCacheCreateFlags(x)
converter toVkQueueFlags*(x: VkQueueFlagBits): VkQueueFlags = VkQueueFlags(x)
converter toVkCullModeFlags*(x: VkCullModeFlagBits): VkCullModeFlags = VkCullModeFlags(x)
converter toVkRenderPassCreateFlags*(x: VkRenderPassCreateFlagBits): VkRenderPassCreateFlags = VkRenderPassCreateFlags(x)
converter toVkDeviceQueueCreateFlags*(x: VkDeviceQueueCreateFlagBits): VkDeviceQueueCreateFlags = VkDeviceQueueCreateFlags(x)
converter toVkMemoryPropertyFlags*(x: VkMemoryPropertyFlagBits): VkMemoryPropertyFlags = VkMemoryPropertyFlags(x)
converter toVkMemoryHeapFlags*(x: VkMemoryHeapFlagBits): VkMemoryHeapFlags = VkMemoryHeapFlags(x)
converter toVkAccessFlags*(x: VkAccessFlagBits): VkAccessFlags = VkAccessFlags(x)
converter toVkBufferUsageFlags*(x: VkBufferUsageFlagBits): VkBufferUsageFlags = VkBufferUsageFlags(x)
converter toVkBufferCreateFlags*(x: VkBufferCreateFlagBits): VkBufferCreateFlags = VkBufferCreateFlags(x)
converter toVkShaderStageFlags*(x: VkShaderStageFlagBits): VkShaderStageFlags = VkShaderStageFlags(x)
converter toVkImageUsageFlags*(x: VkImageUsageFlagBits): VkImageUsageFlags = VkImageUsageFlags(x)
converter toVkImageCreateFlags*(x: VkImageCreateFlagBits): VkImageCreateFlags = VkImageCreateFlags(x)
converter toVkImageViewCreateFlags*(x: VkImageViewCreateFlagBits): VkImageViewCreateFlags = VkImageViewCreateFlags(x)
converter toVkSamplerCreateFlags*(x: VkSamplerCreateFlagBits): VkSamplerCreateFlags = VkSamplerCreateFlags(x)
converter toVkPipelineCreateFlags*(x: VkPipelineCreateFlagBits): VkPipelineCreateFlags = VkPipelineCreateFlags(x)
converter toVkPipelineShaderStageCreateFlags*(x: VkPipelineShaderStageCreateFlagBits): VkPipelineShaderStageCreateFlags = VkPipelineShaderStageCreateFlags(x)
converter toVkColorComponentFlags*(x: VkColorComponentFlagBits): VkColorComponentFlags = VkColorComponentFlags(x)
converter toVkFenceCreateFlags*(x: VkFenceCreateFlagBits): VkFenceCreateFlags = VkFenceCreateFlags(x)
converter toVkFormatFeatureFlags*(x: VkFormatFeatureFlagBits): VkFormatFeatureFlags = VkFormatFeatureFlags(x)
converter toVkQueryControlFlags*(x: VkQueryControlFlagBits): VkQueryControlFlags = VkQueryControlFlags(x)
converter toVkQueryResultFlags*(x: VkQueryResultFlagBits): VkQueryResultFlags = VkQueryResultFlags(x)
converter toVkCommandBufferUsageFlags*(x: VkCommandBufferUsageFlagBits): VkCommandBufferUsageFlags = VkCommandBufferUsageFlags(x)
converter toVkQueryPipelineStatisticFlags*(x: VkQueryPipelineStatisticFlagBits): VkQueryPipelineStatisticFlags = VkQueryPipelineStatisticFlags(x)
converter toVkImageAspectFlags*(x: VkImageAspectFlagBits): VkImageAspectFlags = VkImageAspectFlags(x)
converter toVkSparseImageFormatFlags*(x: VkSparseImageFormatFlagBits): VkSparseImageFormatFlags = VkSparseImageFormatFlags(x)
converter toVkSparseMemoryBindFlags*(x: VkSparseMemoryBindFlagBits): VkSparseMemoryBindFlags = VkSparseMemoryBindFlags(x)
converter toVkPipelineStageFlags*(x: VkPipelineStageFlagBits): VkPipelineStageFlags = VkPipelineStageFlags(x)
converter toVkCommandPoolCreateFlags*(x: VkCommandPoolCreateFlagBits): VkCommandPoolCreateFlags = VkCommandPoolCreateFlags(x)
converter toVkCommandPoolResetFlags*(x: VkCommandPoolResetFlagBits): VkCommandPoolResetFlags = VkCommandPoolResetFlags(x)
converter toVkCommandBufferResetFlags*(x: VkCommandBufferResetFlagBits): VkCommandBufferResetFlags = VkCommandBufferResetFlags(x)
converter toVkSampleCountFlags*(x: VkSampleCountFlagBits): VkSampleCountFlags = VkSampleCountFlags(x)
converter toVkAttachmentDescriptionFlags*(x: VkAttachmentDescriptionFlagBits): VkAttachmentDescriptionFlags = VkAttachmentDescriptionFlags(x)
converter toVkStencilFaceFlags*(x: VkStencilFaceFlagBits): VkStencilFaceFlags = VkStencilFaceFlags(x)
converter toVkDescriptorPoolCreateFlags*(x: VkDescriptorPoolCreateFlagBits): VkDescriptorPoolCreateFlags = VkDescriptorPoolCreateFlags(x)
converter toVkDependencyFlags*(x: VkDependencyFlagBits): VkDependencyFlags = VkDependencyFlags(x)
converter toVkSemaphoreWaitFlags*(x: VkSemaphoreWaitFlagBits): VkSemaphoreWaitFlags = VkSemaphoreWaitFlags(x)
converter toVkDisplayPlaneAlphaFlagsKHR*(x: VkDisplayPlaneAlphaFlagBitsKHR): VkDisplayPlaneAlphaFlagsKHR = VkDisplayPlaneAlphaFlagsKHR(x)
converter toVkCompositeAlphaFlagsKHR*(x: VkCompositeAlphaFlagBitsKHR): VkCompositeAlphaFlagsKHR = VkCompositeAlphaFlagsKHR(x)
converter toVkSurfaceTransformFlagsKHR*(x: VkSurfaceTransformFlagBitsKHR): VkSurfaceTransformFlagsKHR = VkSurfaceTransformFlagsKHR(x)
converter toVkSwapchainImageUsageFlagsANDROID*(x: VkSwapchainImageUsageFlagBitsANDROID): VkSwapchainImageUsageFlagsANDROID = VkSwapchainImageUsageFlagsANDROID(x)
converter toVkDebugReportFlagsEXT*(x: VkDebugReportFlagBitsEXT): VkDebugReportFlagsEXT = VkDebugReportFlagsEXT(x)
converter toVkExternalMemoryHandleTypeFlagsNV*(x: VkExternalMemoryHandleTypeFlagBitsNV): VkExternalMemoryHandleTypeFlagsNV = VkExternalMemoryHandleTypeFlagsNV(x)
converter toVkExternalMemoryFeatureFlagsNV*(x: VkExternalMemoryFeatureFlagBitsNV): VkExternalMemoryFeatureFlagsNV = VkExternalMemoryFeatureFlagsNV(x)
converter toVkSubgroupFeatureFlags*(x: VkSubgroupFeatureFlagBits): VkSubgroupFeatureFlags = VkSubgroupFeatureFlags(x)
converter toVkIndirectCommandsLayoutUsageFlagsNV*(x: VkIndirectCommandsLayoutUsageFlagBitsNV): VkIndirectCommandsLayoutUsageFlagsNV = VkIndirectCommandsLayoutUsageFlagsNV(x)
converter toVkIndirectStateFlagsNV*(x: VkIndirectStateFlagBitsNV): VkIndirectStateFlagsNV = VkIndirectStateFlagsNV(x)
converter toVkPrivateDataSlotCreateFlagsEXT*(x: VkPrivateDataSlotCreateFlagBitsEXT): VkPrivateDataSlotCreateFlagsEXT = VkPrivateDataSlotCreateFlagsEXT(x)
converter toVkDescriptorSetLayoutCreateFlags*(x: VkDescriptorSetLayoutCreateFlagBits): VkDescriptorSetLayoutCreateFlags = VkDescriptorSetLayoutCreateFlags(x)
converter toVkExternalMemoryHandleTypeFlags*(x: VkExternalMemoryHandleTypeFlagBits): VkExternalMemoryHandleTypeFlags = VkExternalMemoryHandleTypeFlags(x)
converter toVkExternalMemoryFeatureFlags*(x: VkExternalMemoryFeatureFlagBits): VkExternalMemoryFeatureFlags = VkExternalMemoryFeatureFlags(x)
converter toVkExternalSemaphoreHandleTypeFlags*(x: VkExternalSemaphoreHandleTypeFlagBits): VkExternalSemaphoreHandleTypeFlags = VkExternalSemaphoreHandleTypeFlags(x)
converter toVkExternalSemaphoreFeatureFlags*(x: VkExternalSemaphoreFeatureFlagBits): VkExternalSemaphoreFeatureFlags = VkExternalSemaphoreFeatureFlags(x)
converter toVkSemaphoreImportFlags*(x: VkSemaphoreImportFlagBits): VkSemaphoreImportFlags = VkSemaphoreImportFlags(x)
converter toVkExternalFenceHandleTypeFlags*(x: VkExternalFenceHandleTypeFlagBits): VkExternalFenceHandleTypeFlags = VkExternalFenceHandleTypeFlags(x)
converter toVkExternalFenceFeatureFlags*(x: VkExternalFenceFeatureFlagBits): VkExternalFenceFeatureFlags = VkExternalFenceFeatureFlags(x)
converter toVkFenceImportFlags*(x: VkFenceImportFlagBits): VkFenceImportFlags = VkFenceImportFlags(x)
converter toVkSurfaceCounterFlagsEXT*(x: VkSurfaceCounterFlagBitsEXT): VkSurfaceCounterFlagsEXT = VkSurfaceCounterFlagsEXT(x)
converter toVkPeerMemoryFeatureFlags*(x: VkPeerMemoryFeatureFlagBits): VkPeerMemoryFeatureFlags = VkPeerMemoryFeatureFlags(x)
converter toVkMemoryAllocateFlags*(x: VkMemoryAllocateFlagBits): VkMemoryAllocateFlags = VkMemoryAllocateFlags(x)
converter toVkDeviceGroupPresentModeFlagsKHR*(x: VkDeviceGroupPresentModeFlagBitsKHR): VkDeviceGroupPresentModeFlagsKHR = VkDeviceGroupPresentModeFlagsKHR(x)
converter toVkSwapchainCreateFlagsKHR*(x: VkSwapchainCreateFlagBitsKHR): VkSwapchainCreateFlagsKHR = VkSwapchainCreateFlagsKHR(x)
converter toVkSubpassDescriptionFlags*(x: VkSubpassDescriptionFlagBits): VkSubpassDescriptionFlags = VkSubpassDescriptionFlags(x)
converter toVkDebugUtilsMessageSeverityFlagsEXT*(x: VkDebugUtilsMessageSeverityFlagBitsEXT): VkDebugUtilsMessageSeverityFlagsEXT = VkDebugUtilsMessageSeverityFlagsEXT(x)
converter toVkDebugUtilsMessageTypeFlagsEXT*(x: VkDebugUtilsMessageTypeFlagBitsEXT): VkDebugUtilsMessageTypeFlagsEXT = VkDebugUtilsMessageTypeFlagsEXT(x)
converter toVkDescriptorBindingFlags*(x: VkDescriptorBindingFlagBits): VkDescriptorBindingFlags = VkDescriptorBindingFlags(x)
converter toVkConditionalRenderingFlagsEXT*(x: VkConditionalRenderingFlagBitsEXT): VkConditionalRenderingFlagsEXT = VkConditionalRenderingFlagsEXT(x)
converter toVkResolveModeFlags*(x: VkResolveModeFlagBits): VkResolveModeFlags = VkResolveModeFlags(x)
converter toVkGeometryInstanceFlagsKHR*(x: VkGeometryInstanceFlagBitsKHR): VkGeometryInstanceFlagsKHR = VkGeometryInstanceFlagsKHR(x)
converter toVkGeometryFlagsKHR*(x: VkGeometryFlagBitsKHR): VkGeometryFlagsKHR = VkGeometryFlagsKHR(x)
converter toVkBuildAccelerationStructureFlagsKHR*(x: VkBuildAccelerationStructureFlagBitsKHR): VkBuildAccelerationStructureFlagsKHR = VkBuildAccelerationStructureFlagsKHR(x)
converter toVkAccelerationStructureCreateFlagsKHR*(x: VkAccelerationStructureCreateFlagBitsKHR): VkAccelerationStructureCreateFlagsKHR = VkAccelerationStructureCreateFlagsKHR(x)
converter toVkFramebufferCreateFlags*(x: VkFramebufferCreateFlagBits): VkFramebufferCreateFlags = VkFramebufferCreateFlags(x)
converter toVkDeviceDiagnosticsConfigFlagsNV*(x: VkDeviceDiagnosticsConfigFlagBitsNV): VkDeviceDiagnosticsConfigFlagsNV = VkDeviceDiagnosticsConfigFlagsNV(x)
converter toVkPipelineCreationFeedbackFlagsEXT*(x: VkPipelineCreationFeedbackFlagBitsEXT): VkPipelineCreationFeedbackFlagsEXT = VkPipelineCreationFeedbackFlagsEXT(x)
converter toVkPerformanceCounterDescriptionFlagsKHR*(x: VkPerformanceCounterDescriptionFlagBitsKHR): VkPerformanceCounterDescriptionFlagsKHR = VkPerformanceCounterDescriptionFlagsKHR(x)
converter toVkAcquireProfilingLockFlagsKHR*(x: VkAcquireProfilingLockFlagBitsKHR): VkAcquireProfilingLockFlagsKHR = VkAcquireProfilingLockFlagsKHR(x)
converter toVkShaderCorePropertiesFlagsAMD*(x: VkShaderCorePropertiesFlagBitsAMD): VkShaderCorePropertiesFlagsAMD = VkShaderCorePropertiesFlagsAMD(x)
converter toVkShaderModuleCreateFlags*(x: VkShaderModuleCreateFlagBits): VkShaderModuleCreateFlags = VkShaderModuleCreateFlags(x)
converter toVkPipelineCompilerControlFlagsAMD*(x: VkPipelineCompilerControlFlagBitsAMD): VkPipelineCompilerControlFlagsAMD = VkPipelineCompilerControlFlagsAMD(x)
converter toVkToolPurposeFlagsEXT*(x: VkToolPurposeFlagBitsEXT): VkToolPurposeFlagsEXT = VkToolPurposeFlagsEXT(x)
converter toVkAccessFlags2KHR*(x: VkAccessFlagBits2KHR): VkAccessFlags2KHR = VkAccessFlags2KHR(x)
converter toVkPipelineStageFlags2KHR*(x: VkPipelineStageFlagBits2KHR): VkPipelineStageFlags2KHR = VkPipelineStageFlags2KHR(x)
converter toVkSubmitFlagsKHR*(x: VkSubmitFlagBitsKHR): VkSubmitFlagsKHR = VkSubmitFlagsKHR(x)
converter toVkEventCreateFlags*(x: VkEventCreateFlagBits): VkEventCreateFlags = VkEventCreateFlags(x)

# Procs
type
  PFNvkCreateInstance* = proc(pCreateInfo: ptr VkInstanceCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pInstance: ptr VkInstance ): VkResult {.cdecl.}
  PFNvkDestroyInstance* = proc(instance: VkInstance, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkEnumeratePhysicalDevices* = proc(instance: VkInstance, pPhysicalDeviceCount: ptr uint32 , pPhysicalDevices: ptr VkPhysicalDevice ): VkResult {.cdecl.}
  PFNvkGetDeviceProcAddr* = proc(device: VkDevice, pName: cstring ): PFN_vkVoidFunction {.cdecl.}
  PFNvkGetInstanceProcAddr* = proc(instance: VkInstance, pName: cstring ): PFN_vkVoidFunction {.cdecl.}
  PFNvkGetPhysicalDeviceProperties* = proc(physicalDevice: VkPhysicalDevice, pProperties: ptr VkPhysicalDeviceProperties ): void {.cdecl.}
  PFNvkGetPhysicalDeviceQueueFamilyProperties* = proc(physicalDevice: VkPhysicalDevice, pQueueFamilyPropertyCount: ptr uint32 , pQueueFamilyProperties: ptr VkQueueFamilyProperties ): void {.cdecl.}
  PFNvkGetPhysicalDeviceMemoryProperties* = proc(physicalDevice: VkPhysicalDevice, pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties ): void {.cdecl.}
  PFNvkGetPhysicalDeviceFeatures* = proc(physicalDevice: VkPhysicalDevice, pFeatures: ptr VkPhysicalDeviceFeatures ): void {.cdecl.}
  PFNvkGetPhysicalDeviceFormatProperties* = proc(physicalDevice: VkPhysicalDevice, format: VkFormat, pFormatProperties: ptr VkFormatProperties ): void {.cdecl.}
  PFNvkGetPhysicalDeviceImageFormatProperties* = proc(physicalDevice: VkPhysicalDevice, format: VkFormat, `type`: VkImageType, tiling: VkImageTiling, usage: VkImageUsageFlags, flags: VkImageCreateFlags, pImageFormatProperties: ptr VkImageFormatProperties ): VkResult {.cdecl.}
  PFNvkCreateDevice* = proc(physicalDevice: VkPhysicalDevice, pCreateInfo: ptr VkDeviceCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pDevice: ptr VkDevice ): VkResult {.cdecl.}
  PFNvkDestroyDevice* = proc(device: VkDevice, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkEnumerateInstanceVersion* = proc(pApiVersion: ptr uint32 ): VkResult {.cdecl.}
  PFNvkEnumerateInstanceLayerProperties* = proc(pPropertyCount: ptr uint32 , pProperties: ptr VkLayerProperties ): VkResult {.cdecl.}
  PFNvkEnumerateInstanceExtensionProperties* = proc(pLayerName: cstring , pPropertyCount: ptr uint32 , pProperties: ptr VkExtensionProperties ): VkResult {.cdecl.}
  PFNvkEnumerateDeviceLayerProperties* = proc(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkLayerProperties ): VkResult {.cdecl.}
  PFNvkEnumerateDeviceExtensionProperties* = proc(physicalDevice: VkPhysicalDevice, pLayerName: cstring , pPropertyCount: ptr uint32 , pProperties: ptr VkExtensionProperties ): VkResult {.cdecl.}
  PFNvkGetDeviceQueue* = proc(device: VkDevice, queueFamilyIndex: uint32, queueIndex: uint32, pQueue: ptr VkQueue ): void {.cdecl.}
  PFNvkQueueSubmit* = proc(queue: VkQueue, submitCount: uint32, pSubmits: ptr VkSubmitInfo , fence: VkFence): VkResult {.cdecl.}
  PFNvkQueueWaitIdle* = proc(queue: VkQueue): VkResult {.cdecl.}
  PFNvkDeviceWaitIdle* = proc(device: VkDevice): VkResult {.cdecl.}
  PFNvkAllocateMemory* = proc(device: VkDevice, pAllocateInfo: ptr VkMemoryAllocateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pMemory: ptr VkDeviceMemory ): VkResult {.cdecl.}
  PFNvkFreeMemory* = proc(device: VkDevice, memory: VkDeviceMemory, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkMapMemory* = proc(device: VkDevice, memory: VkDeviceMemory, offset: VkDeviceSize, size: VkDeviceSize, flags: VkMemoryMapFlags, ppData: ptr pointer ): VkResult {.cdecl.}
  PFNvkUnmapMemory* = proc(device: VkDevice, memory: VkDeviceMemory): void {.cdecl.}
  PFNvkFlushMappedMemoryRanges* = proc(device: VkDevice, memoryRangeCount: uint32, pMemoryRanges: ptr VkMappedMemoryRange ): VkResult {.cdecl.}
  PFNvkInvalidateMappedMemoryRanges* = proc(device: VkDevice, memoryRangeCount: uint32, pMemoryRanges: ptr VkMappedMemoryRange ): VkResult {.cdecl.}
  PFNvkGetDeviceMemoryCommitment* = proc(device: VkDevice, memory: VkDeviceMemory, pCommittedMemoryInBytes: ptr VkDeviceSize ): void {.cdecl.}
  PFNvkGetBufferMemoryRequirements* = proc(device: VkDevice, buffer: VkBuffer, pMemoryRequirements: ptr VkMemoryRequirements ): void {.cdecl.}
  PFNvkBindBufferMemory* = proc(device: VkDevice, buffer: VkBuffer, memory: VkDeviceMemory, memoryOffset: VkDeviceSize): VkResult {.cdecl.}
  PFNvkGetImageMemoryRequirements* = proc(device: VkDevice, image: VkImage, pMemoryRequirements: ptr VkMemoryRequirements ): void {.cdecl.}
  PFNvkBindImageMemory* = proc(device: VkDevice, image: VkImage, memory: VkDeviceMemory, memoryOffset: VkDeviceSize): VkResult {.cdecl.}
  PFNvkGetImageSparseMemoryRequirements* = proc(device: VkDevice, image: VkImage, pSparseMemoryRequirementCount: ptr uint32 , pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements ): void {.cdecl.}
  PFNvkGetPhysicalDeviceSparseImageFormatProperties* = proc(physicalDevice: VkPhysicalDevice, format: VkFormat, `type`: VkImageType, samples: VkSampleCountFlagBits, usage: VkImageUsageFlags, tiling: VkImageTiling, pPropertyCount: ptr uint32 , pProperties: ptr VkSparseImageFormatProperties ): void {.cdecl.}
  PFNvkQueueBindSparse* = proc(queue: VkQueue, bindInfoCount: uint32, pBindInfo: ptr VkBindSparseInfo , fence: VkFence): VkResult {.cdecl.}
  PFNvkCreateFence* = proc(device: VkDevice, pCreateInfo: ptr VkFenceCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pFence: ptr VkFence ): VkResult {.cdecl.}
  PFNvkDestroyFence* = proc(device: VkDevice, fence: VkFence, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkResetFences* = proc(device: VkDevice, fenceCount: uint32, pFences: ptr VkFence ): VkResult {.cdecl.}
  PFNvkGetFenceStatus* = proc(device: VkDevice, fence: VkFence): VkResult {.cdecl.}
  PFNvkWaitForFences* = proc(device: VkDevice, fenceCount: uint32, pFences: ptr VkFence , waitAll: VkBool32, timeout: uint64): VkResult {.cdecl.}
  PFNvkCreateSemaphore* = proc(device: VkDevice, pCreateInfo: ptr VkSemaphoreCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pSemaphore: ptr VkSemaphore ): VkResult {.cdecl.}
  PFNvkDestroySemaphore* = proc(device: VkDevice, semaphore: VkSemaphore, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreateEvent* = proc(device: VkDevice, pCreateInfo: ptr VkEventCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pEvent: ptr VkEvent ): VkResult {.cdecl.}
  PFNvkDestroyEvent* = proc(device: VkDevice, event: VkEvent, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetEventStatus* = proc(device: VkDevice, event: VkEvent): VkResult {.cdecl.}
  PFNvkSetEvent* = proc(device: VkDevice, event: VkEvent): VkResult {.cdecl.}
  PFNvkResetEvent* = proc(device: VkDevice, event: VkEvent): VkResult {.cdecl.}
  PFNvkCreateQueryPool* = proc(device: VkDevice, pCreateInfo: ptr VkQueryPoolCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pQueryPool: ptr VkQueryPool ): VkResult {.cdecl.}
  PFNvkDestroyQueryPool* = proc(device: VkDevice, queryPool: VkQueryPool, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetQueryPoolResults* = proc(device: VkDevice, queryPool: VkQueryPool, firstQuery: uint32, queryCount: uint32, dataSize: uint, pData: pointer , stride: VkDeviceSize, flags: VkQueryResultFlags): VkResult {.cdecl.}
  PFNvkResetQueryPool* = proc(device: VkDevice, queryPool: VkQueryPool, firstQuery: uint32, queryCount: uint32): void {.cdecl.}
  PFNvkCreateBuffer* = proc(device: VkDevice, pCreateInfo: ptr VkBufferCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pBuffer: ptr VkBuffer ): VkResult {.cdecl.}
  PFNvkDestroyBuffer* = proc(device: VkDevice, buffer: VkBuffer, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreateBufferView* = proc(device: VkDevice, pCreateInfo: ptr VkBufferViewCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pView: ptr VkBufferView ): VkResult {.cdecl.}
  PFNvkDestroyBufferView* = proc(device: VkDevice, bufferView: VkBufferView, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreateImage* = proc(device: VkDevice, pCreateInfo: ptr VkImageCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pImage: ptr VkImage ): VkResult {.cdecl.}
  PFNvkDestroyImage* = proc(device: VkDevice, image: VkImage, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetImageSubresourceLayout* = proc(device: VkDevice, image: VkImage, pSubresource: ptr VkImageSubresource , pLayout: ptr VkSubresourceLayout ): void {.cdecl.}
  PFNvkCreateImageView* = proc(device: VkDevice, pCreateInfo: ptr VkImageViewCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pView: ptr VkImageView ): VkResult {.cdecl.}
  PFNvkDestroyImageView* = proc(device: VkDevice, imageView: VkImageView, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreateShaderModule* = proc(device: VkDevice, pCreateInfo: ptr VkShaderModuleCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pShaderModule: ptr VkShaderModule ): VkResult {.cdecl.}
  PFNvkDestroyShaderModule* = proc(device: VkDevice, shaderModule: VkShaderModule, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreatePipelineCache* = proc(device: VkDevice, pCreateInfo: ptr VkPipelineCacheCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pPipelineCache: ptr VkPipelineCache ): VkResult {.cdecl.}
  PFNvkDestroyPipelineCache* = proc(device: VkDevice, pipelineCache: VkPipelineCache, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetPipelineCacheData* = proc(device: VkDevice, pipelineCache: VkPipelineCache, pDataSize: ptr uint , pData: pointer ): VkResult {.cdecl.}
  PFNvkMergePipelineCaches* = proc(device: VkDevice, dstCache: VkPipelineCache, srcCacheCount: uint32, pSrcCaches: ptr VkPipelineCache ): VkResult {.cdecl.}
  PFNvkCreateGraphicsPipelines* = proc(device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: uint32, pCreateInfos: ptr VkGraphicsPipelineCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pPipelines: ptr VkPipeline ): VkResult {.cdecl.}
  PFNvkCreateComputePipelines* = proc(device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: uint32, pCreateInfos: ptr VkComputePipelineCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pPipelines: ptr VkPipeline ): VkResult {.cdecl.}
  PFNvkDestroyPipeline* = proc(device: VkDevice, pipeline: VkPipeline, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreatePipelineLayout* = proc(device: VkDevice, pCreateInfo: ptr VkPipelineLayoutCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pPipelineLayout: ptr VkPipelineLayout ): VkResult {.cdecl.}
  PFNvkDestroyPipelineLayout* = proc(device: VkDevice, pipelineLayout: VkPipelineLayout, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreateSampler* = proc(device: VkDevice, pCreateInfo: ptr VkSamplerCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pSampler: ptr VkSampler ): VkResult {.cdecl.}
  PFNvkDestroySampler* = proc(device: VkDevice, sampler: VkSampler, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreateDescriptorSetLayout* = proc(device: VkDevice, pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pSetLayout: ptr VkDescriptorSetLayout ): VkResult {.cdecl.}
  PFNvkDestroyDescriptorSetLayout* = proc(device: VkDevice, descriptorSetLayout: VkDescriptorSetLayout, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreateDescriptorPool* = proc(device: VkDevice, pCreateInfo: ptr VkDescriptorPoolCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pDescriptorPool: ptr VkDescriptorPool ): VkResult {.cdecl.}
  PFNvkDestroyDescriptorPool* = proc(device: VkDevice, descriptorPool: VkDescriptorPool, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkResetDescriptorPool* = proc(device: VkDevice, descriptorPool: VkDescriptorPool, flags: VkDescriptorPoolResetFlags): VkResult {.cdecl.}
  PFNvkAllocateDescriptorSets* = proc(device: VkDevice, pAllocateInfo: ptr VkDescriptorSetAllocateInfo , pDescriptorSets: ptr VkDescriptorSet ): VkResult {.cdecl.}
  PFNvkFreeDescriptorSets* = proc(device: VkDevice, descriptorPool: VkDescriptorPool, descriptorSetCount: uint32, pDescriptorSets: ptr VkDescriptorSet ): VkResult {.cdecl.}
  PFNvkUpdateDescriptorSets* = proc(device: VkDevice, descriptorWriteCount: uint32, pDescriptorWrites: ptr VkWriteDescriptorSet , descriptorCopyCount: uint32, pDescriptorCopies: ptr VkCopyDescriptorSet ): void {.cdecl.}
  PFNvkCreateFramebuffer* = proc(device: VkDevice, pCreateInfo: ptr VkFramebufferCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pFramebuffer: ptr VkFramebuffer ): VkResult {.cdecl.}
  PFNvkDestroyFramebuffer* = proc(device: VkDevice, framebuffer: VkFramebuffer, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkCreateRenderPass* = proc(device: VkDevice, pCreateInfo: ptr VkRenderPassCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pRenderPass: ptr VkRenderPass ): VkResult {.cdecl.}
  PFNvkDestroyRenderPass* = proc(device: VkDevice, renderPass: VkRenderPass, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetRenderAreaGranularity* = proc(device: VkDevice, renderPass: VkRenderPass, pGranularity: ptr VkExtent2D ): void {.cdecl.}
  PFNvkCreateCommandPool* = proc(device: VkDevice, pCreateInfo: ptr VkCommandPoolCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pCommandPool: ptr VkCommandPool ): VkResult {.cdecl.}
  PFNvkDestroyCommandPool* = proc(device: VkDevice, commandPool: VkCommandPool, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkResetCommandPool* = proc(device: VkDevice, commandPool: VkCommandPool, flags: VkCommandPoolResetFlags): VkResult {.cdecl.}
  PFNvkAllocateCommandBuffers* = proc(device: VkDevice, pAllocateInfo: ptr VkCommandBufferAllocateInfo , pCommandBuffers: ptr VkCommandBuffer ): VkResult {.cdecl.}
  PFNvkFreeCommandBuffers* = proc(device: VkDevice, commandPool: VkCommandPool, commandBufferCount: uint32, pCommandBuffers: ptr VkCommandBuffer ): void {.cdecl.}
  PFNvkBeginCommandBuffer* = proc(commandBuffer: VkCommandBuffer, pBeginInfo: ptr VkCommandBufferBeginInfo ): VkResult {.cdecl.}
  PFNvkEndCommandBuffer* = proc(commandBuffer: VkCommandBuffer): VkResult {.cdecl.}
  PFNvkResetCommandBuffer* = proc(commandBuffer: VkCommandBuffer, flags: VkCommandBufferResetFlags): VkResult {.cdecl.}
  PFNvkCmdBindPipeline* = proc(commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, pipeline: VkPipeline): void {.cdecl.}
  PFNvkCmdSetViewport* = proc(commandBuffer: VkCommandBuffer, firstViewport: uint32, viewportCount: uint32, pViewports: ptr VkViewport ): void {.cdecl.}
  PFNvkCmdSetScissor* = proc(commandBuffer: VkCommandBuffer, firstScissor: uint32, scissorCount: uint32, pScissors: ptr VkRect2D ): void {.cdecl.}
  PFNvkCmdSetLineWidth* = proc(commandBuffer: VkCommandBuffer, lineWidth: float32): void {.cdecl.}
  PFNvkCmdSetDepthBias* = proc(commandBuffer: VkCommandBuffer, depthBiasConstantFactor: float32, depthBiasClamp: float32, depthBiasSlopeFactor: float32): void {.cdecl.}
  PFNvkCmdSetBlendConstants* = proc(commandBuffer: VkCommandBuffer, blendConstants: array[4, float32]): void {.cdecl.}
  PFNvkCmdSetDepthBounds* = proc(commandBuffer: VkCommandBuffer, minDepthBounds: float32, maxDepthBounds: float32): void {.cdecl.}
  PFNvkCmdSetStencilCompareMask* = proc(commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, compareMask: uint32): void {.cdecl.}
  PFNvkCmdSetStencilWriteMask* = proc(commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, writeMask: uint32): void {.cdecl.}
  PFNvkCmdSetStencilReference* = proc(commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, reference: uint32): void {.cdecl.}
  PFNvkCmdBindDescriptorSets* = proc(commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, layout: VkPipelineLayout, firstSet: uint32, descriptorSetCount: uint32, pDescriptorSets: ptr VkDescriptorSet , dynamicOffsetCount: uint32, pDynamicOffsets: ptr uint32 ): void {.cdecl.}
  PFNvkCmdBindIndexBuffer* = proc(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, indexType: VkIndexType): void {.cdecl.}
  PFNvkCmdBindVertexBuffers* = proc(commandBuffer: VkCommandBuffer, firstBinding: uint32, bindingCount: uint32, pBuffers: ptr VkBuffer , pOffsets: ptr VkDeviceSize ): void {.cdecl.}
  PFNvkCmdDraw* = proc(commandBuffer: VkCommandBuffer, vertexCount: uint32, instanceCount: uint32, firstVertex: uint32, firstInstance: uint32): void {.cdecl.}
  PFNvkCmdDrawIndexed* = proc(commandBuffer: VkCommandBuffer, indexCount: uint32, instanceCount: uint32, firstIndex: uint32, vertexOffset: int32, firstInstance: uint32): void {.cdecl.}
  PFNvkCmdDrawIndirect* = proc(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, drawCount: uint32, stride: uint32): void {.cdecl.}
  PFNvkCmdDrawIndexedIndirect* = proc(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, drawCount: uint32, stride: uint32): void {.cdecl.}
  PFNvkCmdDispatch* = proc(commandBuffer: VkCommandBuffer, groupCountX: uint32, groupCountY: uint32, groupCountZ: uint32): void {.cdecl.}
  PFNvkCmdDispatchIndirect* = proc(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize): void {.cdecl.}
  PFNvkCmdCopyBuffer* = proc(commandBuffer: VkCommandBuffer, srcBuffer: VkBuffer, dstBuffer: VkBuffer, regionCount: uint32, pRegions: ptr VkBufferCopy ): void {.cdecl.}
  PFNvkCmdCopyImage* = proc(commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: uint32, pRegions: ptr VkImageCopy ): void {.cdecl.}
  PFNvkCmdBlitImage* = proc(commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: uint32, pRegions: ptr VkImageBlit , filter: VkFilter): void {.cdecl.}
  PFNvkCmdCopyBufferToImage* = proc(commandBuffer: VkCommandBuffer, srcBuffer: VkBuffer, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: uint32, pRegions: ptr VkBufferImageCopy ): void {.cdecl.}
  PFNvkCmdCopyImageToBuffer* = proc(commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstBuffer: VkBuffer, regionCount: uint32, pRegions: ptr VkBufferImageCopy ): void {.cdecl.}
  PFNvkCmdUpdateBuffer* = proc(commandBuffer: VkCommandBuffer, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, dataSize: VkDeviceSize, pData: pointer ): void {.cdecl.}
  PFNvkCmdFillBuffer* = proc(commandBuffer: VkCommandBuffer, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, size: VkDeviceSize, data: uint32): void {.cdecl.}
  PFNvkCmdClearColorImage* = proc(commandBuffer: VkCommandBuffer, image: VkImage, imageLayout: VkImageLayout, pColor: ptr VkClearColorValue , rangeCount: uint32, pRanges: ptr VkImageSubresourceRange ): void {.cdecl.}
  PFNvkCmdClearDepthStencilImage* = proc(commandBuffer: VkCommandBuffer, image: VkImage, imageLayout: VkImageLayout, pDepthStencil: ptr VkClearDepthStencilValue , rangeCount: uint32, pRanges: ptr VkImageSubresourceRange ): void {.cdecl.}
  PFNvkCmdClearAttachments* = proc(commandBuffer: VkCommandBuffer, attachmentCount: uint32, pAttachments: ptr VkClearAttachment , rectCount: uint32, pRects: ptr VkClearRect ): void {.cdecl.}
  PFNvkCmdResolveImage* = proc(commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: uint32, pRegions: ptr VkImageResolve ): void {.cdecl.}
  PFNvkCmdSetEvent* = proc(commandBuffer: VkCommandBuffer, event: VkEvent, stageMask: VkPipelineStageFlags): void {.cdecl.}
  PFNvkCmdResetEvent* = proc(commandBuffer: VkCommandBuffer, event: VkEvent, stageMask: VkPipelineStageFlags): void {.cdecl.}
  PFNvkCmdWaitEvents* = proc(commandBuffer: VkCommandBuffer, eventCount: uint32, pEvents: ptr VkEvent , srcStageMask: VkPipelineStageFlags, dstStageMask: VkPipelineStageFlags, memoryBarrierCount: uint32, pMemoryBarriers: ptr VkMemoryBarrier , bufferMemoryBarrierCount: uint32, pBufferMemoryBarriers: ptr VkBufferMemoryBarrier , imageMemoryBarrierCount: uint32, pImageMemoryBarriers: ptr VkImageMemoryBarrier ): void {.cdecl.}
  PFNvkCmdPipelineBarrier* = proc(commandBuffer: VkCommandBuffer, srcStageMask: VkPipelineStageFlags, dstStageMask: VkPipelineStageFlags, dependencyFlags: VkDependencyFlags, memoryBarrierCount: uint32, pMemoryBarriers: ptr VkMemoryBarrier , bufferMemoryBarrierCount: uint32, pBufferMemoryBarriers: ptr VkBufferMemoryBarrier , imageMemoryBarrierCount: uint32, pImageMemoryBarriers: ptr VkImageMemoryBarrier ): void {.cdecl.}
  PFNvkCmdBeginQuery* = proc(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, query: uint32, flags: VkQueryControlFlags): void {.cdecl.}
  PFNvkCmdEndQuery* = proc(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, query: uint32): void {.cdecl.}
  PFNvkCmdBeginConditionalRenderingEXT* = proc(commandBuffer: VkCommandBuffer, pConditionalRenderingBegin: ptr VkConditionalRenderingBeginInfoEXT ): void {.cdecl.}
  PFNvkCmdEndConditionalRenderingEXT* = proc(commandBuffer: VkCommandBuffer): void {.cdecl.}
  PFNvkCmdResetQueryPool* = proc(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, firstQuery: uint32, queryCount: uint32): void {.cdecl.}
  PFNvkCmdWriteTimestamp* = proc(commandBuffer: VkCommandBuffer, pipelineStage: VkPipelineStageFlagBits, queryPool: VkQueryPool, query: uint32): void {.cdecl.}
  PFNvkCmdCopyQueryPoolResults* = proc(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, firstQuery: uint32, queryCount: uint32, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, stride: VkDeviceSize, flags: VkQueryResultFlags): void {.cdecl.}
  PFNvkCmdPushConstants* = proc(commandBuffer: VkCommandBuffer, layout: VkPipelineLayout, stageFlags: VkShaderStageFlags, offset: uint32, size: uint32, pValues: pointer ): void {.cdecl.}
  PFNvkCmdBeginRenderPass* = proc(commandBuffer: VkCommandBuffer, pRenderPassBegin: ptr VkRenderPassBeginInfo , contents: VkSubpassContents): void {.cdecl.}
  PFNvkCmdNextSubpass* = proc(commandBuffer: VkCommandBuffer, contents: VkSubpassContents): void {.cdecl.}
  PFNvkCmdEndRenderPass* = proc(commandBuffer: VkCommandBuffer): void {.cdecl.}
  PFNvkCmdExecuteCommands* = proc(commandBuffer: VkCommandBuffer, commandBufferCount: uint32, pCommandBuffers: ptr VkCommandBuffer ): void {.cdecl.}
  PFNvkCreateAndroidSurfaceKHR* = proc(instance: VkInstance, pCreateInfo: ptr VkAndroidSurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceDisplayPropertiesKHR* = proc(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayPropertiesKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceDisplayPlanePropertiesKHR* = proc(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayPlanePropertiesKHR ): VkResult {.cdecl.}
  PFNvkGetDisplayPlaneSupportedDisplaysKHR* = proc(physicalDevice: VkPhysicalDevice, planeIndex: uint32, pDisplayCount: ptr uint32 , pDisplays: ptr VkDisplayKHR ): VkResult {.cdecl.}
  PFNvkGetDisplayModePropertiesKHR* = proc(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayModePropertiesKHR ): VkResult {.cdecl.}
  PFNvkCreateDisplayModeKHR* = proc(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pCreateInfo: ptr VkDisplayModeCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pMode: ptr VkDisplayModeKHR ): VkResult {.cdecl.}
  PFNvkGetDisplayPlaneCapabilitiesKHR* = proc(physicalDevice: VkPhysicalDevice, mode: VkDisplayModeKHR, planeIndex: uint32, pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR ): VkResult {.cdecl.}
  PFNvkCreateDisplayPlaneSurfaceKHR* = proc(instance: VkInstance, pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkCreateSharedSwapchainsKHR* = proc(device: VkDevice, swapchainCount: uint32, pCreateInfos: ptr VkSwapchainCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSwapchains: ptr VkSwapchainKHR ): VkResult {.cdecl.}
  PFNvkDestroySurfaceKHR* = proc(instance: VkInstance, surface: VkSurfaceKHR, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetPhysicalDeviceSurfaceSupportKHR* = proc(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, surface: VkSurfaceKHR, pSupported: ptr VkBool32 ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceSurfaceCapabilitiesKHR* = proc(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceSurfaceFormatsKHR* = proc(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceFormatCount: ptr uint32 , pSurfaceFormats: ptr VkSurfaceFormatKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceSurfacePresentModesKHR* = proc(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pPresentModeCount: ptr uint32 , pPresentModes: ptr VkPresentModeKHR ): VkResult {.cdecl.}
  PFNvkCreateSwapchainKHR* = proc(device: VkDevice, pCreateInfo: ptr VkSwapchainCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSwapchain: ptr VkSwapchainKHR ): VkResult {.cdecl.}
  PFNvkDestroySwapchainKHR* = proc(device: VkDevice, swapchain: VkSwapchainKHR, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetSwapchainImagesKHR* = proc(device: VkDevice, swapchain: VkSwapchainKHR, pSwapchainImageCount: ptr uint32 , pSwapchainImages: ptr VkImage ): VkResult {.cdecl.}
  PFNvkAcquireNextImageKHR* = proc(device: VkDevice, swapchain: VkSwapchainKHR, timeout: uint64, semaphore: VkSemaphore, fence: VkFence, pImageIndex: ptr uint32 ): VkResult {.cdecl.}
  PFNvkQueuePresentKHR* = proc(queue: VkQueue, pPresentInfo: ptr VkPresentInfoKHR ): VkResult {.cdecl.}
  PFNvkCreateViSurfaceNN* = proc(instance: VkInstance, pCreateInfo: ptr VkViSurfaceCreateInfoNN , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkCreateWaylandSurfaceKHR* = proc(instance: VkInstance, pCreateInfo: ptr VkWaylandSurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceWaylandPresentationSupportKHR* = proc(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, display: ptr wl_display ): VkBool32 {.cdecl.}
  PFNvkCreateWin32SurfaceKHR* = proc(instance: VkInstance, pCreateInfo: ptr VkWin32SurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceWin32PresentationSupportKHR* = proc(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32): VkBool32 {.cdecl.}
  PFNvkCreateXlibSurfaceKHR* = proc(instance: VkInstance, pCreateInfo: ptr VkXlibSurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceXlibPresentationSupportKHR* = proc(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, dpy: ptr Display , visualID: VisualID): VkBool32 {.cdecl.}
  PFNvkCreateXcbSurfaceKHR* = proc(instance: VkInstance, pCreateInfo: ptr VkXcbSurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceXcbPresentationSupportKHR* = proc(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, connection: ptr xcb_connection_t , visual_id: xcb_visualid_t): VkBool32 {.cdecl.}
  PFNvkCreateDirectFBSurfaceEXT* = proc(instance: VkInstance, pCreateInfo: ptr VkDirectFBSurfaceCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceDirectFBPresentationSupportEXT* = proc(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, dfb: ptr IDirectFB ): VkBool32 {.cdecl.}
  PFNvkCreateImagePipeSurfaceFUCHSIA* = proc(instance: VkInstance, pCreateInfo: ptr VkImagePipeSurfaceCreateInfoFUCHSIA , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkCreateStreamDescriptorSurfaceGGP* = proc(instance: VkInstance, pCreateInfo: ptr VkStreamDescriptorSurfaceCreateInfoGGP , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkCreateScreenSurfaceQNX* = proc(instance: VkInstance, pCreateInfo: ptr VkScreenSurfaceCreateInfoQNX , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceScreenPresentationSupportQNX* = proc(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, window: ptr screen_window ): VkBool32 {.cdecl.}
  PFNvkCreateDebugReportCallbackEXT* = proc(instance: VkInstance, pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pCallback: ptr VkDebugReportCallbackEXT ): VkResult {.cdecl.}
  PFNvkDestroyDebugReportCallbackEXT* = proc(instance: VkInstance, callback: VkDebugReportCallbackEXT, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkDebugReportMessageEXT* = proc(instance: VkInstance, flags: VkDebugReportFlagsEXT, objectType: VkDebugReportObjectTypeEXT, `object`: uint64, location: uint, messageCode: int32, pLayerPrefix: cstring , pMessage: cstring ): void {.cdecl.}
  PFNvkDebugMarkerSetObjectNameEXT* = proc(device: VkDevice, pNameInfo: ptr VkDebugMarkerObjectNameInfoEXT ): VkResult {.cdecl.}
  PFNvkDebugMarkerSetObjectTagEXT* = proc(device: VkDevice, pTagInfo: ptr VkDebugMarkerObjectTagInfoEXT ): VkResult {.cdecl.}
  PFNvkCmdDebugMarkerBeginEXT* = proc(commandBuffer: VkCommandBuffer, pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT ): void {.cdecl.}
  PFNvkCmdDebugMarkerEndEXT* = proc(commandBuffer: VkCommandBuffer): void {.cdecl.}
  PFNvkCmdDebugMarkerInsertEXT* = proc(commandBuffer: VkCommandBuffer, pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT ): void {.cdecl.}
  PFNvkGetPhysicalDeviceExternalImageFormatPropertiesNV* = proc(physicalDevice: VkPhysicalDevice, format: VkFormat, `type`: VkImageType, tiling: VkImageTiling, usage: VkImageUsageFlags, flags: VkImageCreateFlags, externalHandleType: VkExternalMemoryHandleTypeFlagsNV, pExternalImageFormatProperties: ptr VkExternalImageFormatPropertiesNV ): VkResult {.cdecl.}
  PFNvkGetMemoryWin32HandleNV* = proc(device: VkDevice, memory: VkDeviceMemory, handleType: VkExternalMemoryHandleTypeFlagsNV, pHandle: ptr HANDLE ): VkResult {.cdecl.}
  PFNvkCmdExecuteGeneratedCommandsNV* = proc(commandBuffer: VkCommandBuffer, isPreprocessed: VkBool32, pGeneratedCommandsInfo: ptr VkGeneratedCommandsInfoNV ): void {.cdecl.}
  PFNvkCmdPreprocessGeneratedCommandsNV* = proc(commandBuffer: VkCommandBuffer, pGeneratedCommandsInfo: ptr VkGeneratedCommandsInfoNV ): void {.cdecl.}
  PFNvkCmdBindPipelineShaderGroupNV* = proc(commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, pipeline: VkPipeline, groupIndex: uint32): void {.cdecl.}
  PFNvkGetGeneratedCommandsMemoryRequirementsNV* = proc(device: VkDevice, pInfo: ptr VkGeneratedCommandsMemoryRequirementsInfoNV , pMemoryRequirements: ptr VkMemoryRequirements2 ): void {.cdecl.}
  PFNvkCreateIndirectCommandsLayoutNV* = proc(device: VkDevice, pCreateInfo: ptr VkIndirectCommandsLayoutCreateInfoNV , pAllocator: ptr VkAllocationCallbacks = nil , pIndirectCommandsLayout: ptr VkIndirectCommandsLayoutNV ): VkResult {.cdecl.}
  PFNvkDestroyIndirectCommandsLayoutNV* = proc(device: VkDevice, indirectCommandsLayout: VkIndirectCommandsLayoutNV, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetPhysicalDeviceFeatures2* = proc(physicalDevice: VkPhysicalDevice, pFeatures: ptr VkPhysicalDeviceFeatures2 ): void {.cdecl.}
  PFNvkGetPhysicalDeviceProperties2* = proc(physicalDevice: VkPhysicalDevice, pProperties: ptr VkPhysicalDeviceProperties2 ): void {.cdecl.}
  PFNvkGetPhysicalDeviceFormatProperties2* = proc(physicalDevice: VkPhysicalDevice, format: VkFormat, pFormatProperties: ptr VkFormatProperties2 ): void {.cdecl.}
  PFNvkGetPhysicalDeviceImageFormatProperties2* = proc(physicalDevice: VkPhysicalDevice, pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2 , pImageFormatProperties: ptr VkImageFormatProperties2 ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceQueueFamilyProperties2* = proc(physicalDevice: VkPhysicalDevice, pQueueFamilyPropertyCount: ptr uint32 , pQueueFamilyProperties: ptr VkQueueFamilyProperties2 ): void {.cdecl.}
  PFNvkGetPhysicalDeviceMemoryProperties2* = proc(physicalDevice: VkPhysicalDevice, pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2 ): void {.cdecl.}
  PFNvkGetPhysicalDeviceSparseImageFormatProperties2* = proc(physicalDevice: VkPhysicalDevice, pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2 , pPropertyCount: ptr uint32 , pProperties: ptr VkSparseImageFormatProperties2 ): void {.cdecl.}
  PFNvkCmdPushDescriptorSetKHR* = proc(commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, layout: VkPipelineLayout, set: uint32, descriptorWriteCount: uint32, pDescriptorWrites: ptr VkWriteDescriptorSet ): void {.cdecl.}
  PFNvkTrimCommandPool* = proc(device: VkDevice, commandPool: VkCommandPool, flags: VkCommandPoolTrimFlags): void {.cdecl.}
  PFNvkGetPhysicalDeviceExternalBufferProperties* = proc(physicalDevice: VkPhysicalDevice, pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfo , pExternalBufferProperties: ptr VkExternalBufferProperties ): void {.cdecl.}
  PFNvkGetMemoryWin32HandleKHR* = proc(device: VkDevice, pGetWin32HandleInfo: ptr VkMemoryGetWin32HandleInfoKHR , pHandle: ptr HANDLE ): VkResult {.cdecl.}
  PFNvkGetMemoryWin32HandlePropertiesKHR* = proc(device: VkDevice, handleType: VkExternalMemoryHandleTypeFlagBits, handle: HANDLE, pMemoryWin32HandleProperties: ptr VkMemoryWin32HandlePropertiesKHR ): VkResult {.cdecl.}
  PFNvkGetMemoryFdKHR* = proc(device: VkDevice, pGetFdInfo: ptr VkMemoryGetFdInfoKHR , pFd: ptr int ): VkResult {.cdecl.}
  PFNvkGetMemoryFdPropertiesKHR* = proc(device: VkDevice, handleType: VkExternalMemoryHandleTypeFlagBits, fd: int, pMemoryFdProperties: ptr VkMemoryFdPropertiesKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceExternalSemaphoreProperties* = proc(physicalDevice: VkPhysicalDevice, pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfo , pExternalSemaphoreProperties: ptr VkExternalSemaphoreProperties ): void {.cdecl.}
  PFNvkGetSemaphoreWin32HandleKHR* = proc(device: VkDevice, pGetWin32HandleInfo: ptr VkSemaphoreGetWin32HandleInfoKHR , pHandle: ptr HANDLE ): VkResult {.cdecl.}
  PFNvkImportSemaphoreWin32HandleKHR* = proc(device: VkDevice, pImportSemaphoreWin32HandleInfo: ptr VkImportSemaphoreWin32HandleInfoKHR ): VkResult {.cdecl.}
  PFNvkGetSemaphoreFdKHR* = proc(device: VkDevice, pGetFdInfo: ptr VkSemaphoreGetFdInfoKHR , pFd: ptr int ): VkResult {.cdecl.}
  PFNvkImportSemaphoreFdKHR* = proc(device: VkDevice, pImportSemaphoreFdInfo: ptr VkImportSemaphoreFdInfoKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceExternalFenceProperties* = proc(physicalDevice: VkPhysicalDevice, pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfo , pExternalFenceProperties: ptr VkExternalFenceProperties ): void {.cdecl.}
  PFNvkGetFenceWin32HandleKHR* = proc(device: VkDevice, pGetWin32HandleInfo: ptr VkFenceGetWin32HandleInfoKHR , pHandle: ptr HANDLE ): VkResult {.cdecl.}
  PFNvkImportFenceWin32HandleKHR* = proc(device: VkDevice, pImportFenceWin32HandleInfo: ptr VkImportFenceWin32HandleInfoKHR ): VkResult {.cdecl.}
  PFNvkGetFenceFdKHR* = proc(device: VkDevice, pGetFdInfo: ptr VkFenceGetFdInfoKHR , pFd: ptr int ): VkResult {.cdecl.}
  PFNvkImportFenceFdKHR* = proc(device: VkDevice, pImportFenceFdInfo: ptr VkImportFenceFdInfoKHR ): VkResult {.cdecl.}
  PFNvkReleaseDisplayEXT* = proc(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR): VkResult {.cdecl.}
  PFNvkAcquireXlibDisplayEXT* = proc(physicalDevice: VkPhysicalDevice, dpy: ptr Display , display: VkDisplayKHR): VkResult {.cdecl.}
  PFNvkGetRandROutputDisplayEXT* = proc(physicalDevice: VkPhysicalDevice, dpy: ptr Display , rrOutput: RROutput, pDisplay: ptr VkDisplayKHR ): VkResult {.cdecl.}
  PFNvkAcquireWinrtDisplayNV* = proc(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR): VkResult {.cdecl.}
  PFNvkGetWinrtDisplayNV* = proc(physicalDevice: VkPhysicalDevice, deviceRelativeId: uint32, pDisplay: ptr VkDisplayKHR ): VkResult {.cdecl.}
  PFNvkDisplayPowerControlEXT* = proc(device: VkDevice, display: VkDisplayKHR, pDisplayPowerInfo: ptr VkDisplayPowerInfoEXT ): VkResult {.cdecl.}
  PFNvkRegisterDeviceEventEXT* = proc(device: VkDevice, pDeviceEventInfo: ptr VkDeviceEventInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pFence: ptr VkFence ): VkResult {.cdecl.}
  PFNvkRegisterDisplayEventEXT* = proc(device: VkDevice, display: VkDisplayKHR, pDisplayEventInfo: ptr VkDisplayEventInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pFence: ptr VkFence ): VkResult {.cdecl.}
  PFNvkGetSwapchainCounterEXT* = proc(device: VkDevice, swapchain: VkSwapchainKHR, counter: VkSurfaceCounterFlagBitsEXT, pCounterValue: ptr uint64 ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceSurfaceCapabilities2EXT* = proc(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceCapabilities: ptr VkSurfaceCapabilities2EXT ): VkResult {.cdecl.}
  PFNvkEnumeratePhysicalDeviceGroups* = proc(instance: VkInstance, pPhysicalDeviceGroupCount: ptr uint32 , pPhysicalDeviceGroupProperties: ptr VkPhysicalDeviceGroupProperties ): VkResult {.cdecl.}
  PFNvkGetDeviceGroupPeerMemoryFeatures* = proc(device: VkDevice, heapIndex: uint32, localDeviceIndex: uint32, remoteDeviceIndex: uint32, pPeerMemoryFeatures: ptr VkPeerMemoryFeatureFlags ): void {.cdecl.}
  PFNvkBindBufferMemory2* = proc(device: VkDevice, bindInfoCount: uint32, pBindInfos: ptr VkBindBufferMemoryInfo ): VkResult {.cdecl.}
  PFNvkBindImageMemory2* = proc(device: VkDevice, bindInfoCount: uint32, pBindInfos: ptr VkBindImageMemoryInfo ): VkResult {.cdecl.}
  PFNvkCmdSetDeviceMask* = proc(commandBuffer: VkCommandBuffer, deviceMask: uint32): void {.cdecl.}
  PFNvkGetDeviceGroupPresentCapabilitiesKHR* = proc(device: VkDevice, pDeviceGroupPresentCapabilities: ptr VkDeviceGroupPresentCapabilitiesKHR ): VkResult {.cdecl.}
  PFNvkGetDeviceGroupSurfacePresentModesKHR* = proc(device: VkDevice, surface: VkSurfaceKHR, pModes: ptr VkDeviceGroupPresentModeFlagsKHR ): VkResult {.cdecl.}
  PFNvkAcquireNextImage2KHR* = proc(device: VkDevice, pAcquireInfo: ptr VkAcquireNextImageInfoKHR , pImageIndex: ptr uint32 ): VkResult {.cdecl.}
  PFNvkCmdDispatchBase* = proc(commandBuffer: VkCommandBuffer, baseGroupX: uint32, baseGroupY: uint32, baseGroupZ: uint32, groupCountX: uint32, groupCountY: uint32, groupCountZ: uint32): void {.cdecl.}
  PFNvkGetPhysicalDevicePresentRectanglesKHR* = proc(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pRectCount: ptr uint32 , pRects: ptr VkRect2D ): VkResult {.cdecl.}
  PFNvkCreateDescriptorUpdateTemplate* = proc(device: VkDevice, pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate ): VkResult {.cdecl.}
  PFNvkDestroyDescriptorUpdateTemplate* = proc(device: VkDevice, descriptorUpdateTemplate: VkDescriptorUpdateTemplate, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkUpdateDescriptorSetWithTemplate* = proc(device: VkDevice, descriptorSet: VkDescriptorSet, descriptorUpdateTemplate: VkDescriptorUpdateTemplate, pData: pointer ): void {.cdecl.}
  PFNvkCmdPushDescriptorSetWithTemplateKHR* = proc(commandBuffer: VkCommandBuffer, descriptorUpdateTemplate: VkDescriptorUpdateTemplate, layout: VkPipelineLayout, set: uint32, pData: pointer ): void {.cdecl.}
  PFNvkSetHdrMetadataEXT* = proc(device: VkDevice, swapchainCount: uint32, pSwapchains: ptr VkSwapchainKHR , pMetadata: ptr VkHdrMetadataEXT ): void {.cdecl.}
  PFNvkGetSwapchainStatusKHR* = proc(device: VkDevice, swapchain: VkSwapchainKHR): VkResult {.cdecl.}
  PFNvkGetRefreshCycleDurationGOOGLE* = proc(device: VkDevice, swapchain: VkSwapchainKHR, pDisplayTimingProperties: ptr VkRefreshCycleDurationGOOGLE ): VkResult {.cdecl.}
  PFNvkGetPastPresentationTimingGOOGLE* = proc(device: VkDevice, swapchain: VkSwapchainKHR, pPresentationTimingCount: ptr uint32 , pPresentationTimings: ptr VkPastPresentationTimingGOOGLE ): VkResult {.cdecl.}
  PFNvkCreateIOSSurfaceMVK* = proc(instance: VkInstance, pCreateInfo: ptr VkIOSSurfaceCreateInfoMVK , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkCreateMacOSSurfaceMVK* = proc(instance: VkInstance, pCreateInfo: ptr VkMacOSSurfaceCreateInfoMVK , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkCreateMetalSurfaceEXT* = proc(instance: VkInstance, pCreateInfo: ptr VkMetalSurfaceCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkCmdSetViewportWScalingNV* = proc(commandBuffer: VkCommandBuffer, firstViewport: uint32, viewportCount: uint32, pViewportWScalings: ptr VkViewportWScalingNV ): void {.cdecl.}
  PFNvkCmdSetDiscardRectangleEXT* = proc(commandBuffer: VkCommandBuffer, firstDiscardRectangle: uint32, discardRectangleCount: uint32, pDiscardRectangles: ptr VkRect2D ): void {.cdecl.}
  PFNvkCmdSetSampleLocationsEXT* = proc(commandBuffer: VkCommandBuffer, pSampleLocationsInfo: ptr VkSampleLocationsInfoEXT ): void {.cdecl.}
  PFNvkGetPhysicalDeviceMultisamplePropertiesEXT* = proc(physicalDevice: VkPhysicalDevice, samples: VkSampleCountFlagBits, pMultisampleProperties: ptr VkMultisamplePropertiesEXT ): void {.cdecl.}
  PFNvkGetPhysicalDeviceSurfaceCapabilities2KHR* = proc(physicalDevice: VkPhysicalDevice, pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR , pSurfaceCapabilities: ptr VkSurfaceCapabilities2KHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceSurfaceFormats2KHR* = proc(physicalDevice: VkPhysicalDevice, pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR , pSurfaceFormatCount: ptr uint32 , pSurfaceFormats: ptr VkSurfaceFormat2KHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceDisplayProperties2KHR* = proc(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayProperties2KHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceDisplayPlaneProperties2KHR* = proc(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayPlaneProperties2KHR ): VkResult {.cdecl.}
  PFNvkGetDisplayModeProperties2KHR* = proc(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayModeProperties2KHR ): VkResult {.cdecl.}
  PFNvkGetDisplayPlaneCapabilities2KHR* = proc(physicalDevice: VkPhysicalDevice, pDisplayPlaneInfo: ptr VkDisplayPlaneInfo2KHR , pCapabilities: ptr VkDisplayPlaneCapabilities2KHR ): VkResult {.cdecl.}
  PFNvkGetBufferMemoryRequirements2* = proc(device: VkDevice, pInfo: ptr VkBufferMemoryRequirementsInfo2 , pMemoryRequirements: ptr VkMemoryRequirements2 ): void {.cdecl.}
  PFNvkGetImageMemoryRequirements2* = proc(device: VkDevice, pInfo: ptr VkImageMemoryRequirementsInfo2 , pMemoryRequirements: ptr VkMemoryRequirements2 ): void {.cdecl.}
  PFNvkGetImageSparseMemoryRequirements2* = proc(device: VkDevice, pInfo: ptr VkImageSparseMemoryRequirementsInfo2 , pSparseMemoryRequirementCount: ptr uint32 , pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2 ): void {.cdecl.}
  PFNvkCreateSamplerYcbcrConversion* = proc(device: VkDevice, pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pYcbcrConversion: ptr VkSamplerYcbcrConversion ): VkResult {.cdecl.}
  PFNvkDestroySamplerYcbcrConversion* = proc(device: VkDevice, ycbcrConversion: VkSamplerYcbcrConversion, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetDeviceQueue2* = proc(device: VkDevice, pQueueInfo: ptr VkDeviceQueueInfo2 , pQueue: ptr VkQueue ): void {.cdecl.}
  PFNvkCreateValidationCacheEXT* = proc(device: VkDevice, pCreateInfo: ptr VkValidationCacheCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pValidationCache: ptr VkValidationCacheEXT ): VkResult {.cdecl.}
  PFNvkDestroyValidationCacheEXT* = proc(device: VkDevice, validationCache: VkValidationCacheEXT, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetValidationCacheDataEXT* = proc(device: VkDevice, validationCache: VkValidationCacheEXT, pDataSize: ptr uint , pData: pointer ): VkResult {.cdecl.}
  PFNvkMergeValidationCachesEXT* = proc(device: VkDevice, dstCache: VkValidationCacheEXT, srcCacheCount: uint32, pSrcCaches: ptr VkValidationCacheEXT ): VkResult {.cdecl.}
  PFNvkGetDescriptorSetLayoutSupport* = proc(device: VkDevice, pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo , pSupport: ptr VkDescriptorSetLayoutSupport ): void {.cdecl.}
  PFNvkGetSwapchainGrallocUsageANDROID* = proc(device: VkDevice, format: VkFormat, imageUsage: VkImageUsageFlags, grallocUsage: ptr int ): VkResult {.cdecl.}
  PFNvkGetSwapchainGrallocUsage2ANDROID* = proc(device: VkDevice, format: VkFormat, imageUsage: VkImageUsageFlags, swapchainImageUsage: VkSwapchainImageUsageFlagsANDROID, grallocConsumerUsage: ptr uint64 , grallocProducerUsage: ptr uint64 ): VkResult {.cdecl.}
  PFNvkAcquireImageANDROID* = proc(device: VkDevice, image: VkImage, nativeFenceFd: int, semaphore: VkSemaphore, fence: VkFence): VkResult {.cdecl.}
  PFNvkQueueSignalReleaseImageANDROID* = proc(queue: VkQueue, waitSemaphoreCount: uint32, pWaitSemaphores: ptr VkSemaphore , image: VkImage, pNativeFenceFd: ptr int ): VkResult {.cdecl.}
  PFNvkGetShaderInfoAMD* = proc(device: VkDevice, pipeline: VkPipeline, shaderStage: VkShaderStageFlagBits, infoType: VkShaderInfoTypeAMD, pInfoSize: ptr uint , pInfo: pointer ): VkResult {.cdecl.}
  PFNvkSetLocalDimmingAMD* = proc(device: VkDevice, swapChain: VkSwapchainKHR, localDimmingEnable: VkBool32): void {.cdecl.}
  PFNvkGetPhysicalDeviceCalibrateableTimeDomainsEXT* = proc(physicalDevice: VkPhysicalDevice, pTimeDomainCount: ptr uint32 , pTimeDomains: ptr VkTimeDomainEXT ): VkResult {.cdecl.}
  PFNvkGetCalibratedTimestampsEXT* = proc(device: VkDevice, timestampCount: uint32, pTimestampInfos: ptr VkCalibratedTimestampInfoEXT , pTimestamps: ptr uint64 , pMaxDeviation: ptr uint64 ): VkResult {.cdecl.}
  PFNvkSetDebugUtilsObjectNameEXT* = proc(device: VkDevice, pNameInfo: ptr VkDebugUtilsObjectNameInfoEXT ): VkResult {.cdecl.}
  PFNvkSetDebugUtilsObjectTagEXT* = proc(device: VkDevice, pTagInfo: ptr VkDebugUtilsObjectTagInfoEXT ): VkResult {.cdecl.}
  PFNvkQueueBeginDebugUtilsLabelEXT* = proc(queue: VkQueue, pLabelInfo: ptr VkDebugUtilsLabelEXT ): void {.cdecl.}
  PFNvkQueueEndDebugUtilsLabelEXT* = proc(queue: VkQueue): void {.cdecl.}
  PFNvkQueueInsertDebugUtilsLabelEXT* = proc(queue: VkQueue, pLabelInfo: ptr VkDebugUtilsLabelEXT ): void {.cdecl.}
  PFNvkCmdBeginDebugUtilsLabelEXT* = proc(commandBuffer: VkCommandBuffer, pLabelInfo: ptr VkDebugUtilsLabelEXT ): void {.cdecl.}
  PFNvkCmdEndDebugUtilsLabelEXT* = proc(commandBuffer: VkCommandBuffer): void {.cdecl.}
  PFNvkCmdInsertDebugUtilsLabelEXT* = proc(commandBuffer: VkCommandBuffer, pLabelInfo: ptr VkDebugUtilsLabelEXT ): void {.cdecl.}
  PFNvkCreateDebugUtilsMessengerEXT* = proc(instance: VkInstance, pCreateInfo: ptr VkDebugUtilsMessengerCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pMessenger: ptr VkDebugUtilsMessengerEXT ): VkResult {.cdecl.}
  PFNvkDestroyDebugUtilsMessengerEXT* = proc(instance: VkInstance, messenger: VkDebugUtilsMessengerEXT, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkSubmitDebugUtilsMessageEXT* = proc(instance: VkInstance, messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT ): void {.cdecl.}
  PFNvkGetMemoryHostPointerPropertiesEXT* = proc(device: VkDevice, handleType: VkExternalMemoryHandleTypeFlagBits, pHostPointer: pointer , pMemoryHostPointerProperties: ptr VkMemoryHostPointerPropertiesEXT ): VkResult {.cdecl.}
  PFNvkCmdWriteBufferMarkerAMD* = proc(commandBuffer: VkCommandBuffer, pipelineStage: VkPipelineStageFlagBits, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, marker: uint32): void {.cdecl.}
  PFNvkCreateRenderPass2* = proc(device: VkDevice, pCreateInfo: ptr VkRenderPassCreateInfo2 , pAllocator: ptr VkAllocationCallbacks = nil , pRenderPass: ptr VkRenderPass ): VkResult {.cdecl.}
  PFNvkCmdBeginRenderPass2* = proc(commandBuffer: VkCommandBuffer, pRenderPassBegin: ptr VkRenderPassBeginInfo      , pSubpassBeginInfo: ptr VkSubpassBeginInfo      ): void {.cdecl.}
  PFNvkCmdNextSubpass2* = proc(commandBuffer: VkCommandBuffer, pSubpassBeginInfo: ptr VkSubpassBeginInfo      , pSubpassEndInfo: ptr VkSubpassEndInfo        ): void {.cdecl.}
  PFNvkCmdEndRenderPass2* = proc(commandBuffer: VkCommandBuffer, pSubpassEndInfo: ptr VkSubpassEndInfo        ): void {.cdecl.}
  PFNvkGetSemaphoreCounterValue* = proc(device: VkDevice, semaphore: VkSemaphore, pValue: ptr uint64 ): VkResult {.cdecl.}
  PFNvkWaitSemaphores* = proc(device: VkDevice, pWaitInfo: ptr VkSemaphoreWaitInfo , timeout: uint64): VkResult {.cdecl.}
  PFNvkSignalSemaphore* = proc(device: VkDevice, pSignalInfo: ptr VkSemaphoreSignalInfo ): VkResult {.cdecl.}
  PFNvkGetAndroidHardwareBufferPropertiesANDROID* = proc(device: VkDevice, buffer: ptr AHardwareBuffer , pProperties: ptr VkAndroidHardwareBufferPropertiesANDROID ): VkResult {.cdecl.}
  PFNvkGetMemoryAndroidHardwareBufferANDROID* = proc(device: VkDevice, pInfo: ptr VkMemoryGetAndroidHardwareBufferInfoANDROID , pBuffer: ptr ptr AHardwareBuffer ): VkResult {.cdecl.}
  PFNvkCmdDrawIndirectCount* = proc(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, countBuffer: VkBuffer, countBufferOffset: VkDeviceSize, maxDrawCount: uint32, stride: uint32): void {.cdecl.}
  PFNvkCmdDrawIndexedIndirectCount* = proc(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, countBuffer: VkBuffer, countBufferOffset: VkDeviceSize, maxDrawCount: uint32, stride: uint32): void {.cdecl.}
  PFNvkCmdSetCheckpointNV* = proc(commandBuffer: VkCommandBuffer, pCheckpointMarker: pointer ): void {.cdecl.}
  PFNvkGetQueueCheckpointDataNV* = proc(queue: VkQueue, pCheckpointDataCount: ptr uint32 , pCheckpointData: ptr VkCheckpointDataNV ): void {.cdecl.}
  PFNvkCmdBindTransformFeedbackBuffersEXT* = proc(commandBuffer: VkCommandBuffer, firstBinding: uint32, bindingCount: uint32, pBuffers: ptr VkBuffer , pOffsets: ptr VkDeviceSize , pSizes: ptr VkDeviceSize ): void {.cdecl.}
  PFNvkCmdBeginTransformFeedbackEXT* = proc(commandBuffer: VkCommandBuffer, firstCounterBuffer: uint32, counterBufferCount: uint32, pCounterBuffers: ptr VkBuffer , pCounterBufferOffsets: ptr VkDeviceSize ): void {.cdecl.}
  PFNvkCmdEndTransformFeedbackEXT* = proc(commandBuffer: VkCommandBuffer, firstCounterBuffer: uint32, counterBufferCount: uint32, pCounterBuffers: ptr VkBuffer , pCounterBufferOffsets: ptr VkDeviceSize ): void {.cdecl.}
  PFNvkCmdBeginQueryIndexedEXT* = proc(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, query: uint32, flags: VkQueryControlFlags, index: uint32): void {.cdecl.}
  PFNvkCmdEndQueryIndexedEXT* = proc(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, query: uint32, index: uint32): void {.cdecl.}
  PFNvkCmdDrawIndirectByteCountEXT* = proc(commandBuffer: VkCommandBuffer, instanceCount: uint32, firstInstance: uint32, counterBuffer: VkBuffer, counterBufferOffset: VkDeviceSize, counterOffset: uint32, vertexStride: uint32): void {.cdecl.}
  PFNvkCmdSetExclusiveScissorNV* = proc(commandBuffer: VkCommandBuffer, firstExclusiveScissor: uint32, exclusiveScissorCount: uint32, pExclusiveScissors: ptr VkRect2D ): void {.cdecl.}
  PFNvkCmdBindShadingRateImageNV* = proc(commandBuffer: VkCommandBuffer, imageView: VkImageView, imageLayout: VkImageLayout): void {.cdecl.}
  PFNvkCmdSetViewportShadingRatePaletteNV* = proc(commandBuffer: VkCommandBuffer, firstViewport: uint32, viewportCount: uint32, pShadingRatePalettes: ptr VkShadingRatePaletteNV ): void {.cdecl.}
  PFNvkCmdSetCoarseSampleOrderNV* = proc(commandBuffer: VkCommandBuffer, sampleOrderType: VkCoarseSampleOrderTypeNV, customSampleOrderCount: uint32, pCustomSampleOrders: ptr VkCoarseSampleOrderCustomNV ): void {.cdecl.}
  PFNvkCmdDrawMeshTasksNV* = proc(commandBuffer: VkCommandBuffer, taskCount: uint32, firstTask: uint32): void {.cdecl.}
  PFNvkCmdDrawMeshTasksIndirectNV* = proc(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, drawCount: uint32, stride: uint32): void {.cdecl.}
  PFNvkCmdDrawMeshTasksIndirectCountNV* = proc(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, countBuffer: VkBuffer, countBufferOffset: VkDeviceSize, maxDrawCount: uint32, stride: uint32): void {.cdecl.}
  PFNvkCompileDeferredNV* = proc(device: VkDevice, pipeline: VkPipeline, shader: uint32): VkResult {.cdecl.}
  PFNvkCreateAccelerationStructureNV* = proc(device: VkDevice, pCreateInfo: ptr VkAccelerationStructureCreateInfoNV , pAllocator: ptr VkAllocationCallbacks = nil , pAccelerationStructure: ptr VkAccelerationStructureNV ): VkResult {.cdecl.}
  PFNvkDestroyAccelerationStructureKHR* = proc(device: VkDevice, accelerationStructure: VkAccelerationStructureKHR, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkDestroyAccelerationStructureNV* = proc(device: VkDevice, accelerationStructure: VkAccelerationStructureNV, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetAccelerationStructureMemoryRequirementsNV* = proc(device: VkDevice, pInfo: ptr VkAccelerationStructureMemoryRequirementsInfoNV , pMemoryRequirements: ptr VkMemoryRequirements2KHR ): void {.cdecl.}
  PFNvkBindAccelerationStructureMemoryNV* = proc(device: VkDevice, bindInfoCount: uint32, pBindInfos: ptr VkBindAccelerationStructureMemoryInfoNV ): VkResult {.cdecl.}
  PFNvkCmdCopyAccelerationStructureNV* = proc(commandBuffer: VkCommandBuffer, dst: VkAccelerationStructureNV, src: VkAccelerationStructureNV, mode: VkCopyAccelerationStructureModeKHR): void {.cdecl.}
  PFNvkCmdCopyAccelerationStructureKHR* = proc(commandBuffer: VkCommandBuffer, pInfo: ptr VkCopyAccelerationStructureInfoKHR ): void {.cdecl.}
  PFNvkCopyAccelerationStructureKHR* = proc(device: VkDevice, deferredOperation: VkDeferredOperationKHR, pInfo: ptr VkCopyAccelerationStructureInfoKHR ): VkResult {.cdecl.}
  PFNvkCmdCopyAccelerationStructureToMemoryKHR* = proc(commandBuffer: VkCommandBuffer, pInfo: ptr VkCopyAccelerationStructureToMemoryInfoKHR ): void {.cdecl.}
  PFNvkCopyAccelerationStructureToMemoryKHR* = proc(device: VkDevice, deferredOperation: VkDeferredOperationKHR, pInfo: ptr VkCopyAccelerationStructureToMemoryInfoKHR ): VkResult {.cdecl.}
  PFNvkCmdCopyMemoryToAccelerationStructureKHR* = proc(commandBuffer: VkCommandBuffer, pInfo: ptr VkCopyMemoryToAccelerationStructureInfoKHR ): void {.cdecl.}
  PFNvkCopyMemoryToAccelerationStructureKHR* = proc(device: VkDevice, deferredOperation: VkDeferredOperationKHR, pInfo: ptr VkCopyMemoryToAccelerationStructureInfoKHR ): VkResult {.cdecl.}
  PFNvkCmdWriteAccelerationStructuresPropertiesKHR* = proc(commandBuffer: VkCommandBuffer, accelerationStructureCount: uint32, pAccelerationStructures: ptr VkAccelerationStructureKHR , queryType: VkQueryType, queryPool: VkQueryPool, firstQuery: uint32): void {.cdecl.}
  PFNvkCmdWriteAccelerationStructuresPropertiesNV* = proc(commandBuffer: VkCommandBuffer, accelerationStructureCount: uint32, pAccelerationStructures: ptr VkAccelerationStructureNV , queryType: VkQueryType, queryPool: VkQueryPool, firstQuery: uint32): void {.cdecl.}
  PFNvkCmdBuildAccelerationStructureNV* = proc(commandBuffer: VkCommandBuffer, pInfo: ptr VkAccelerationStructureInfoNV , instanceData: VkBuffer, instanceOffset: VkDeviceSize, update: VkBool32, dst: VkAccelerationStructureNV, src: VkAccelerationStructureNV, scratch: VkBuffer, scratchOffset: VkDeviceSize): void {.cdecl.}
  PFNvkWriteAccelerationStructuresPropertiesKHR* = proc(device: VkDevice, accelerationStructureCount: uint32, pAccelerationStructures: ptr VkAccelerationStructureKHR , queryType: VkQueryType, dataSize: uint, pData: pointer , stride: uint): VkResult {.cdecl.}
  PFNvkCmdTraceRaysKHR* = proc(commandBuffer: VkCommandBuffer, pRaygenShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pMissShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pHitShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pCallableShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , width: uint32, height: uint32, depth: uint32): void {.cdecl.}
  PFNvkCmdTraceRaysNV* = proc(commandBuffer: VkCommandBuffer, raygenShaderBindingTableBuffer: VkBuffer, raygenShaderBindingOffset: VkDeviceSize, missShaderBindingTableBuffer: VkBuffer, missShaderBindingOffset: VkDeviceSize, missShaderBindingStride: VkDeviceSize, hitShaderBindingTableBuffer: VkBuffer, hitShaderBindingOffset: VkDeviceSize, hitShaderBindingStride: VkDeviceSize, callableShaderBindingTableBuffer: VkBuffer, callableShaderBindingOffset: VkDeviceSize, callableShaderBindingStride: VkDeviceSize, width: uint32, height: uint32, depth: uint32): void {.cdecl.}
  PFNvkGetRayTracingShaderGroupHandlesKHR* = proc(device: VkDevice, pipeline: VkPipeline, firstGroup: uint32, groupCount: uint32, dataSize: uint, pData: pointer ): VkResult {.cdecl.}
  PFNvkGetRayTracingCaptureReplayShaderGroupHandlesKHR* = proc(device: VkDevice, pipeline: VkPipeline, firstGroup: uint32, groupCount: uint32, dataSize: uint, pData: pointer ): VkResult {.cdecl.}
  PFNvkGetAccelerationStructureHandleNV* = proc(device: VkDevice, accelerationStructure: VkAccelerationStructureNV, dataSize: uint, pData: pointer ): VkResult {.cdecl.}
  PFNvkCreateRayTracingPipelinesNV* = proc(device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: uint32, pCreateInfos: ptr VkRayTracingPipelineCreateInfoNV , pAllocator: ptr VkAllocationCallbacks = nil , pPipelines: ptr VkPipeline ): VkResult {.cdecl.}
  PFNvkCreateRayTracingPipelinesKHR* = proc(device: VkDevice, deferredOperation: VkDeferredOperationKHR, pipelineCache: VkPipelineCache, createInfoCount: uint32, pCreateInfos: ptr VkRayTracingPipelineCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pPipelines: ptr VkPipeline ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceCooperativeMatrixPropertiesNV* = proc(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkCooperativeMatrixPropertiesNV ): VkResult {.cdecl.}
  PFNvkCmdTraceRaysIndirectKHR* = proc(commandBuffer: VkCommandBuffer, pRaygenShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pMissShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pHitShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pCallableShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , indirectDeviceAddress: VkDeviceAddress): void {.cdecl.}
  PFNvkGetDeviceAccelerationStructureCompatibilityKHR* = proc(device: VkDevice, pVersionInfo: ptr VkAccelerationStructureVersionInfoKHR , pCompatibility: ptr VkAccelerationStructureCompatibilityKHR ): void {.cdecl.}
  PFNvkGetRayTracingShaderGroupStackSizeKHR* = proc(device: VkDevice, pipeline: VkPipeline, group: uint32, groupShader: VkShaderGroupShaderKHR): VkDeviceSize {.cdecl.}
  PFNvkCmdSetRayTracingPipelineStackSizeKHR* = proc(commandBuffer: VkCommandBuffer, pipelineStackSize: uint32): void {.cdecl.}
  PFNvkGetImageViewHandleNVX* = proc(device: VkDevice, pInfo: ptr VkImageViewHandleInfoNVX ): uint32 {.cdecl.}
  PFNvkGetImageViewAddressNVX* = proc(device: VkDevice, imageView: VkImageView, pProperties: ptr VkImageViewAddressPropertiesNVX ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceSurfacePresentModes2EXT* = proc(physicalDevice: VkPhysicalDevice, pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR , pPresentModeCount: ptr uint32 , pPresentModes: ptr VkPresentModeKHR ): VkResult {.cdecl.}
  PFNvkGetDeviceGroupSurfacePresentModes2EXT* = proc(device: VkDevice, pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR , pModes: ptr VkDeviceGroupPresentModeFlagsKHR ): VkResult {.cdecl.}
  PFNvkAcquireFullScreenExclusiveModeEXT* = proc(device: VkDevice, swapchain: VkSwapchainKHR): VkResult {.cdecl.}
  PFNvkReleaseFullScreenExclusiveModeEXT* = proc(device: VkDevice, swapchain: VkSwapchainKHR): VkResult {.cdecl.}
  PFNvkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR* = proc(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, pCounterCount: ptr uint32 , pCounters: ptr VkPerformanceCounterKHR , pCounterDescriptions: ptr VkPerformanceCounterDescriptionKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR* = proc(physicalDevice: VkPhysicalDevice, pPerformanceQueryCreateInfo: ptr VkQueryPoolPerformanceCreateInfoKHR , pNumPasses: ptr uint32 ): void {.cdecl.}
  PFNvkAcquireProfilingLockKHR* = proc(device: VkDevice, pInfo: ptr VkAcquireProfilingLockInfoKHR ): VkResult {.cdecl.}
  PFNvkReleaseProfilingLockKHR* = proc(device: VkDevice): void {.cdecl.}
  PFNvkGetImageDrmFormatModifierPropertiesEXT* = proc(device: VkDevice, image: VkImage, pProperties: ptr VkImageDrmFormatModifierPropertiesEXT ): VkResult {.cdecl.}
  PFNvkGetBufferOpaqueCaptureAddress* = proc(device: VkDevice, pInfo: ptr VkBufferDeviceAddressInfo ): uint64 {.cdecl.}
  PFNvkGetBufferDeviceAddress* = proc(device: VkDevice, pInfo: ptr VkBufferDeviceAddressInfo ): VkDeviceAddress {.cdecl.}
  PFNvkCreateHeadlessSurfaceEXT* = proc(instance: VkInstance, pCreateInfo: ptr VkHeadlessSurfaceCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.cdecl.}
  PFNvkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV* = proc(physicalDevice: VkPhysicalDevice, pCombinationCount: ptr uint32 , pCombinations: ptr VkFramebufferMixedSamplesCombinationNV ): VkResult {.cdecl.}
  PFNvkInitializePerformanceApiINTEL* = proc(device: VkDevice, pInitializeInfo: ptr VkInitializePerformanceApiInfoINTEL ): VkResult {.cdecl.}
  PFNvkUninitializePerformanceApiINTEL* = proc(device: VkDevice): void {.cdecl.}
  PFNvkCmdSetPerformanceMarkerINTEL* = proc(commandBuffer: VkCommandBuffer, pMarkerInfo: ptr VkPerformanceMarkerInfoINTEL ): VkResult {.cdecl.}
  PFNvkCmdSetPerformanceStreamMarkerINTEL* = proc(commandBuffer: VkCommandBuffer, pMarkerInfo: ptr VkPerformanceStreamMarkerInfoINTEL ): VkResult {.cdecl.}
  PFNvkCmdSetPerformanceOverrideINTEL* = proc(commandBuffer: VkCommandBuffer, pOverrideInfo: ptr VkPerformanceOverrideInfoINTEL ): VkResult {.cdecl.}
  PFNvkAcquirePerformanceConfigurationINTEL* = proc(device: VkDevice, pAcquireInfo: ptr VkPerformanceConfigurationAcquireInfoINTEL , pConfiguration: ptr VkPerformanceConfigurationINTEL ): VkResult {.cdecl.}
  PFNvkReleasePerformanceConfigurationINTEL* = proc(device: VkDevice, configuration: VkPerformanceConfigurationINTEL): VkResult {.cdecl.}
  PFNvkQueueSetPerformanceConfigurationINTEL* = proc(queue: VkQueue, configuration: VkPerformanceConfigurationINTEL): VkResult {.cdecl.}
  PFNvkGetPerformanceParameterINTEL* = proc(device: VkDevice, parameter: VkPerformanceParameterTypeINTEL, pValue: ptr VkPerformanceValueINTEL ): VkResult {.cdecl.}
  PFNvkGetDeviceMemoryOpaqueCaptureAddress* = proc(device: VkDevice, pInfo: ptr VkDeviceMemoryOpaqueCaptureAddressInfo ): uint64 {.cdecl.}
  PFNvkGetPipelineExecutablePropertiesKHR* = proc(device: VkDevice, pPipelineInfo: ptr VkPipelineInfoKHR        , pExecutableCount: ptr uint32 , pProperties: ptr VkPipelineExecutablePropertiesKHR ): VkResult {.cdecl.}
  PFNvkGetPipelineExecutableStatisticsKHR* = proc(device: VkDevice, pExecutableInfo: ptr VkPipelineExecutableInfoKHR  , pStatisticCount: ptr uint32 , pStatistics: ptr VkPipelineExecutableStatisticKHR ): VkResult {.cdecl.}
  PFNvkGetPipelineExecutableInternalRepresentationsKHR* = proc(device: VkDevice, pExecutableInfo: ptr VkPipelineExecutableInfoKHR  , pInternalRepresentationCount: ptr uint32 , pInternalRepresentations: ptr VkPipelineExecutableInternalRepresentationKHR ): VkResult {.cdecl.}
  PFNvkCmdSetLineStippleEXT* = proc(commandBuffer: VkCommandBuffer, lineStippleFactor: uint32, lineStipplePattern: uint16): void {.cdecl.}
  PFNvkGetPhysicalDeviceToolPropertiesEXT* = proc(physicalDevice: VkPhysicalDevice, pToolCount: ptr uint32 , pToolProperties: ptr VkPhysicalDeviceToolPropertiesEXT ): VkResult {.cdecl.}
  PFNvkCreateAccelerationStructureKHR* = proc(device: VkDevice, pCreateInfo: ptr VkAccelerationStructureCreateInfoKHR        , pAllocator: ptr VkAllocationCallbacks = nil       , pAccelerationStructure: ptr VkAccelerationStructureKHR                        ): VkResult {.cdecl.}
  PFNvkCmdBuildAccelerationStructuresKHR* = proc(commandBuffer: VkCommandBuffer, infoCount: uint32, pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR , ppBuildRangeInfos: ptr ptr VkAccelerationStructureBuildRangeInfoKHR ): void {.cdecl.}
  PFNvkCmdBuildAccelerationStructuresIndirectKHR* = proc(commandBuffer: VkCommandBuffer, infoCount: uint32, pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR , pIndirectDeviceAddresses: ptr VkDeviceAddress             , pIndirectStrides: ptr uint32                    , ppMaxPrimitiveCounts: ptr ptr uint32             ): void {.cdecl.}
  PFNvkBuildAccelerationStructuresKHR* = proc(device: VkDevice, deferredOperation: VkDeferredOperationKHR, infoCount: uint32, pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR , ppBuildRangeInfos: ptr ptr VkAccelerationStructureBuildRangeInfoKHR ): VkResult {.cdecl.}
  PFNvkGetAccelerationStructureDeviceAddressKHR* = proc(device: VkDevice, pInfo: ptr VkAccelerationStructureDeviceAddressInfoKHR ): VkDeviceAddress {.cdecl.}
  PFNvkCreateDeferredOperationKHR* = proc(device: VkDevice, pAllocator: ptr VkAllocationCallbacks = nil , pDeferredOperation: ptr VkDeferredOperationKHR ): VkResult {.cdecl.}
  PFNvkDestroyDeferredOperationKHR* = proc(device: VkDevice, operation: VkDeferredOperationKHR, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkGetDeferredOperationMaxConcurrencyKHR* = proc(device: VkDevice, operation: VkDeferredOperationKHR): uint32 {.cdecl.}
  PFNvkGetDeferredOperationResultKHR* = proc(device: VkDevice, operation: VkDeferredOperationKHR): VkResult {.cdecl.}
  PFNvkDeferredOperationJoinKHR* = proc(device: VkDevice, operation: VkDeferredOperationKHR): VkResult {.cdecl.}
  PFNvkCmdSetCullModeEXT* = proc(commandBuffer: VkCommandBuffer, cullMode: VkCullModeFlags): void {.cdecl.}
  PFNvkCmdSetFrontFaceEXT* = proc(commandBuffer: VkCommandBuffer, frontFace: VkFrontFace): void {.cdecl.}
  PFNvkCmdSetPrimitiveTopologyEXT* = proc(commandBuffer: VkCommandBuffer, primitiveTopology: VkPrimitiveTopology): void {.cdecl.}
  PFNvkCmdSetViewportWithCountEXT* = proc(commandBuffer: VkCommandBuffer, viewportCount: uint32, pViewports: ptr VkViewport ): void {.cdecl.}
  PFNvkCmdSetScissorWithCountEXT* = proc(commandBuffer: VkCommandBuffer, scissorCount: uint32, pScissors: ptr VkRect2D ): void {.cdecl.}
  PFNvkCmdBindVertexBuffers2EXT* = proc(commandBuffer: VkCommandBuffer, firstBinding: uint32, bindingCount: uint32, pBuffers: ptr VkBuffer , pOffsets: ptr VkDeviceSize , pSizes: ptr VkDeviceSize , pStrides: ptr VkDeviceSize ): void {.cdecl.}
  PFNvkCmdSetDepthTestEnableEXT* = proc(commandBuffer: VkCommandBuffer, depthTestEnable: VkBool32): void {.cdecl.}
  PFNvkCmdSetDepthWriteEnableEXT* = proc(commandBuffer: VkCommandBuffer, depthWriteEnable: VkBool32): void {.cdecl.}
  PFNvkCmdSetDepthCompareOpEXT* = proc(commandBuffer: VkCommandBuffer, depthCompareOp: VkCompareOp): void {.cdecl.}
  PFNvkCmdSetDepthBoundsTestEnableEXT* = proc(commandBuffer: VkCommandBuffer, depthBoundsTestEnable: VkBool32): void {.cdecl.}
  PFNvkCmdSetStencilTestEnableEXT* = proc(commandBuffer: VkCommandBuffer, stencilTestEnable: VkBool32): void {.cdecl.}
  PFNvkCmdSetStencilOpEXT* = proc(commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, failOp: VkStencilOp, passOp: VkStencilOp, depthFailOp: VkStencilOp, compareOp: VkCompareOp): void {.cdecl.}
  PFNvkCreatePrivateDataSlotEXT* = proc(device: VkDevice, pCreateInfo: ptr VkPrivateDataSlotCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pPrivateDataSlot: ptr VkPrivateDataSlotEXT ): VkResult {.cdecl.}
  PFNvkDestroyPrivateDataSlotEXT* = proc(device: VkDevice, privateDataSlot: VkPrivateDataSlotEXT, pAllocator: ptr VkAllocationCallbacks = nil ): void {.cdecl.}
  PFNvkSetPrivateDataEXT* = proc(device: VkDevice, objectType: VkObjectType, objectHandle: uint64, privateDataSlot: VkPrivateDataSlotEXT, data: uint64): VkResult {.cdecl.}
  PFNvkGetPrivateDataEXT* = proc(device: VkDevice, objectType: VkObjectType, objectHandle: uint64, privateDataSlot: VkPrivateDataSlotEXT, pData: ptr uint64 ): void {.cdecl.}
  PFNvkCmdCopyBuffer2KHR* = proc(commandBuffer: VkCommandBuffer, pCopyBufferInfo: ptr VkCopyBufferInfo2KHR ): void {.cdecl.}
  PFNvkCmdCopyImage2KHR* = proc(commandBuffer: VkCommandBuffer, pCopyImageInfo: ptr VkCopyImageInfo2KHR ): void {.cdecl.}
  PFNvkCmdBlitImage2KHR* = proc(commandBuffer: VkCommandBuffer, pBlitImageInfo: ptr VkBlitImageInfo2KHR ): void {.cdecl.}
  PFNvkCmdCopyBufferToImage2KHR* = proc(commandBuffer: VkCommandBuffer, pCopyBufferToImageInfo: ptr VkCopyBufferToImageInfo2KHR ): void {.cdecl.}
  PFNvkCmdCopyImageToBuffer2KHR* = proc(commandBuffer: VkCommandBuffer, pCopyImageToBufferInfo: ptr VkCopyImageToBufferInfo2KHR ): void {.cdecl.}
  PFNvkCmdResolveImage2KHR* = proc(commandBuffer: VkCommandBuffer, pResolveImageInfo: ptr VkResolveImageInfo2KHR ): void {.cdecl.}
  PFNvkCmdSetFragmentShadingRateKHR* = proc(commandBuffer: VkCommandBuffer, pFragmentSize: ptr VkExtent2D                           , combinerOps: array[2, VkFragmentShadingRateCombinerOpKHR]): void {.cdecl.}
  PFNvkGetPhysicalDeviceFragmentShadingRatesKHR* = proc(physicalDevice: VkPhysicalDevice, pFragmentShadingRateCount: ptr uint32 , pFragmentShadingRates: ptr VkPhysicalDeviceFragmentShadingRateKHR ): VkResult {.cdecl.}
  PFNvkCmdSetFragmentShadingRateEnumNV* = proc(commandBuffer: VkCommandBuffer, shadingRate: VkFragmentShadingRateNV, combinerOps: array[2, VkFragmentShadingRateCombinerOpKHR]): void {.cdecl.}
  PFNvkGetAccelerationStructureBuildSizesKHR* = proc(device: VkDevice, buildType: VkAccelerationStructureBuildTypeKHR, pBuildInfo: ptr VkAccelerationStructureBuildGeometryInfoKHR  , pMaxPrimitiveCounts: ptr uint32  , pSizeInfo: ptr VkAccelerationStructureBuildSizesInfoKHR           ): void {.cdecl.}
  PFNvkCmdSetEvent2KHR* = proc(commandBuffer: VkCommandBuffer, event: VkEvent, pDependencyInfo: ptr VkDependencyInfoKHR                          ): void {.cdecl.}
  PFNvkCmdResetEvent2KHR* = proc(commandBuffer: VkCommandBuffer, event: VkEvent, stageMask: VkPipelineStageFlags2KHR): void {.cdecl.}
  PFNvkCmdWaitEvents2KHR* = proc(commandBuffer: VkCommandBuffer, eventCount: uint32, pEvents: ptr VkEvent                     , pDependencyInfos: ptr VkDependencyInfoKHR         ): void {.cdecl.}
  PFNvkCmdPipelineBarrier2KHR* = proc(commandBuffer: VkCommandBuffer, pDependencyInfo: ptr VkDependencyInfoKHR                                ): void {.cdecl.}
  PFNvkQueueSubmit2KHR* = proc(queue: VkQueue, submitCount: uint32, pSubmits: ptr VkSubmitInfo2KHR           , fence: VkFence): VkResult {.cdecl.}
  PFNvkCmdWriteTimestamp2KHR* = proc(commandBuffer: VkCommandBuffer, stage: VkPipelineStageFlags2KHR, queryPool: VkQueryPool, query: uint32): void {.cdecl.}
  PFNvkCmdWriteBufferMarker2AMD* = proc(commandBuffer: VkCommandBuffer, stage: VkPipelineStageFlags2KHR, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, marker: uint32): void {.cdecl.}
  PFNvkGetQueueCheckpointData2NV* = proc(queue: VkQueue, pCheckpointDataCount: ptr uint32 , pCheckpointData: ptr VkCheckpointData2NV ): void {.cdecl.}

# Vulkan 1_0
proc vkCreateInstance*(pCreateInfo: ptr VkInstanceCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pInstance: ptr VkInstance ): VkResult {.importc, load.}
proc vkDestroyInstance*(instance: VkInstance, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkEnumeratePhysicalDevices*(instance: VkInstance, pPhysicalDeviceCount: ptr uint32 , pPhysicalDevices: ptr VkPhysicalDevice ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceFeatures*(physicalDevice: VkPhysicalDevice, pFeatures: ptr VkPhysicalDeviceFeatures ): void {.importc, load.}
proc vkGetPhysicalDeviceFormatProperties*(physicalDevice: VkPhysicalDevice, format: VkFormat, pFormatProperties: ptr VkFormatProperties ): void {.importc, load.}
proc vkGetPhysicalDeviceImageFormatProperties*(physicalDevice: VkPhysicalDevice, format: VkFormat, `type`: VkImageType, tiling: VkImageTiling, usage: VkImageUsageFlags, flags: VkImageCreateFlags, pImageFormatProperties: ptr VkImageFormatProperties ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceProperties*(physicalDevice: VkPhysicalDevice, pProperties: ptr VkPhysicalDeviceProperties ): void {.importc, load.}
proc vkGetPhysicalDeviceQueueFamilyProperties*(physicalDevice: VkPhysicalDevice, pQueueFamilyPropertyCount: ptr uint32 , pQueueFamilyProperties: ptr VkQueueFamilyProperties ): void {.importc, load.}
proc vkGetPhysicalDeviceMemoryProperties*(physicalDevice: VkPhysicalDevice, pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties ): void {.importc, load.}
proc vkGetInstanceProcAddr*(instance: VkInstance, pName: cstring ): PFN_vkVoidFunction {.importc, load.}
proc vkGetDeviceProcAddr*(device: VkDevice, pName: cstring ): PFN_vkVoidFunction {.importc, load.}
proc vkCreateDevice*(physicalDevice: VkPhysicalDevice, pCreateInfo: ptr VkDeviceCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pDevice: ptr VkDevice ): VkResult {.importc, load.}
proc vkDestroyDevice*(device: VkDevice, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkEnumerateInstanceExtensionProperties*(pLayerName: cstring , pPropertyCount: ptr uint32 , pProperties: ptr VkExtensionProperties ): VkResult {.importc, load.}
proc vkEnumerateDeviceExtensionProperties*(physicalDevice: VkPhysicalDevice, pLayerName: cstring , pPropertyCount: ptr uint32 , pProperties: ptr VkExtensionProperties ): VkResult {.importc, load.}
proc vkEnumerateInstanceLayerProperties*(pPropertyCount: ptr uint32 , pProperties: ptr VkLayerProperties ): VkResult {.importc, load.}
proc vkEnumerateDeviceLayerProperties*(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkLayerProperties ): VkResult {.importc, load.}
proc vkGetDeviceQueue*(device: VkDevice, queueFamilyIndex: uint32, queueIndex: uint32, pQueue: ptr VkQueue ): void {.importc, load.}
proc vkQueueSubmit*(queue: VkQueue, submitCount: uint32, pSubmits: ptr VkSubmitInfo , fence: VkFence): VkResult {.importc, load.}
proc vkQueueWaitIdle*(queue: VkQueue): VkResult {.importc, load.}
proc vkDeviceWaitIdle*(device: VkDevice): VkResult {.importc, load.}
proc vkAllocateMemory*(device: VkDevice, pAllocateInfo: ptr VkMemoryAllocateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pMemory: ptr VkDeviceMemory ): VkResult {.importc, load.}
proc vkFreeMemory*(device: VkDevice, memory: VkDeviceMemory, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkMapMemory*(device: VkDevice, memory: VkDeviceMemory, offset: VkDeviceSize, size: VkDeviceSize, flags: VkMemoryMapFlags, ppData: ptr pointer ): VkResult {.importc, load.}
proc vkUnmapMemory*(device: VkDevice, memory: VkDeviceMemory): void {.importc, load.}
proc vkFlushMappedMemoryRanges*(device: VkDevice, memoryRangeCount: uint32, pMemoryRanges: ptr VkMappedMemoryRange ): VkResult {.importc, load.}
proc vkInvalidateMappedMemoryRanges*(device: VkDevice, memoryRangeCount: uint32, pMemoryRanges: ptr VkMappedMemoryRange ): VkResult {.importc, load.}
proc vkGetDeviceMemoryCommitment*(device: VkDevice, memory: VkDeviceMemory, pCommittedMemoryInBytes: ptr VkDeviceSize ): void {.importc, load.}
proc vkBindBufferMemory*(device: VkDevice, buffer: VkBuffer, memory: VkDeviceMemory, memoryOffset: VkDeviceSize): VkResult {.importc, load.}
proc vkBindImageMemory*(device: VkDevice, image: VkImage, memory: VkDeviceMemory, memoryOffset: VkDeviceSize): VkResult {.importc, load.}
proc vkGetBufferMemoryRequirements*(device: VkDevice, buffer: VkBuffer, pMemoryRequirements: ptr VkMemoryRequirements ): void {.importc, load.}
proc vkGetImageMemoryRequirements*(device: VkDevice, image: VkImage, pMemoryRequirements: ptr VkMemoryRequirements ): void {.importc, load.}
proc vkGetImageSparseMemoryRequirements*(device: VkDevice, image: VkImage, pSparseMemoryRequirementCount: ptr uint32 , pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements ): void {.importc, load.}
proc vkGetPhysicalDeviceSparseImageFormatProperties*(physicalDevice: VkPhysicalDevice, format: VkFormat, `type`: VkImageType, samples: VkSampleCountFlagBits, usage: VkImageUsageFlags, tiling: VkImageTiling, pPropertyCount: ptr uint32 , pProperties: ptr VkSparseImageFormatProperties ): void {.importc, load.}
proc vkQueueBindSparse*(queue: VkQueue, bindInfoCount: uint32, pBindInfo: ptr VkBindSparseInfo , fence: VkFence): VkResult {.importc, load.}
proc vkCreateFence*(device: VkDevice, pCreateInfo: ptr VkFenceCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pFence: ptr VkFence ): VkResult {.importc, load.}
proc vkDestroyFence*(device: VkDevice, fence: VkFence, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkResetFences*(device: VkDevice, fenceCount: uint32, pFences: ptr VkFence ): VkResult {.importc, load.}
proc vkGetFenceStatus*(device: VkDevice, fence: VkFence): VkResult {.importc, load.}
proc vkWaitForFences*(device: VkDevice, fenceCount: uint32, pFences: ptr VkFence , waitAll: VkBool32, timeout: uint64): VkResult {.importc, load.}
proc vkCreateSemaphore*(device: VkDevice, pCreateInfo: ptr VkSemaphoreCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pSemaphore: ptr VkSemaphore ): VkResult {.importc, load.}
proc vkDestroySemaphore*(device: VkDevice, semaphore: VkSemaphore, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateEvent*(device: VkDevice, pCreateInfo: ptr VkEventCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pEvent: ptr VkEvent ): VkResult {.importc, load.}
proc vkDestroyEvent*(device: VkDevice, event: VkEvent, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetEventStatus*(device: VkDevice, event: VkEvent): VkResult {.importc, load.}
proc vkSetEvent*(device: VkDevice, event: VkEvent): VkResult {.importc, load.}
proc vkResetEvent*(device: VkDevice, event: VkEvent): VkResult {.importc, load.}
proc vkCreateQueryPool*(device: VkDevice, pCreateInfo: ptr VkQueryPoolCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pQueryPool: ptr VkQueryPool ): VkResult {.importc, load.}
proc vkDestroyQueryPool*(device: VkDevice, queryPool: VkQueryPool, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetQueryPoolResults*(device: VkDevice, queryPool: VkQueryPool, firstQuery: uint32, queryCount: uint32, dataSize: uint, pData: pointer , stride: VkDeviceSize, flags: VkQueryResultFlags): VkResult {.importc, load.}
proc vkCreateBuffer*(device: VkDevice, pCreateInfo: ptr VkBufferCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pBuffer: ptr VkBuffer ): VkResult {.importc, load.}
proc vkDestroyBuffer*(device: VkDevice, buffer: VkBuffer, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateBufferView*(device: VkDevice, pCreateInfo: ptr VkBufferViewCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pView: ptr VkBufferView ): VkResult {.importc, load.}
proc vkDestroyBufferView*(device: VkDevice, bufferView: VkBufferView, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateImage*(device: VkDevice, pCreateInfo: ptr VkImageCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pImage: ptr VkImage ): VkResult {.importc, load.}
proc vkDestroyImage*(device: VkDevice, image: VkImage, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetImageSubresourceLayout*(device: VkDevice, image: VkImage, pSubresource: ptr VkImageSubresource , pLayout: ptr VkSubresourceLayout ): void {.importc, load.}
proc vkCreateImageView*(device: VkDevice, pCreateInfo: ptr VkImageViewCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pView: ptr VkImageView ): VkResult {.importc, load.}
proc vkDestroyImageView*(device: VkDevice, imageView: VkImageView, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateShaderModule*(device: VkDevice, pCreateInfo: ptr VkShaderModuleCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pShaderModule: ptr VkShaderModule ): VkResult {.importc, load.}
proc vkDestroyShaderModule*(device: VkDevice, shaderModule: VkShaderModule, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreatePipelineCache*(device: VkDevice, pCreateInfo: ptr VkPipelineCacheCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pPipelineCache: ptr VkPipelineCache ): VkResult {.importc, load.}
proc vkDestroyPipelineCache*(device: VkDevice, pipelineCache: VkPipelineCache, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetPipelineCacheData*(device: VkDevice, pipelineCache: VkPipelineCache, pDataSize: ptr uint , pData: pointer ): VkResult {.importc, load.}
proc vkMergePipelineCaches*(device: VkDevice, dstCache: VkPipelineCache, srcCacheCount: uint32, pSrcCaches: ptr VkPipelineCache ): VkResult {.importc, load.}
proc vkCreateGraphicsPipelines*(device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: uint32, pCreateInfos: ptr VkGraphicsPipelineCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pPipelines: ptr VkPipeline ): VkResult {.importc, load.}
proc vkCreateComputePipelines*(device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: uint32, pCreateInfos: ptr VkComputePipelineCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pPipelines: ptr VkPipeline ): VkResult {.importc, load.}
proc vkDestroyPipeline*(device: VkDevice, pipeline: VkPipeline, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreatePipelineLayout*(device: VkDevice, pCreateInfo: ptr VkPipelineLayoutCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pPipelineLayout: ptr VkPipelineLayout ): VkResult {.importc, load.}
proc vkDestroyPipelineLayout*(device: VkDevice, pipelineLayout: VkPipelineLayout, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateSampler*(device: VkDevice, pCreateInfo: ptr VkSamplerCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pSampler: ptr VkSampler ): VkResult {.importc, load.}
proc vkDestroySampler*(device: VkDevice, sampler: VkSampler, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateDescriptorSetLayout*(device: VkDevice, pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pSetLayout: ptr VkDescriptorSetLayout ): VkResult {.importc, load.}
proc vkDestroyDescriptorSetLayout*(device: VkDevice, descriptorSetLayout: VkDescriptorSetLayout, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateDescriptorPool*(device: VkDevice, pCreateInfo: ptr VkDescriptorPoolCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pDescriptorPool: ptr VkDescriptorPool ): VkResult {.importc, load.}
proc vkDestroyDescriptorPool*(device: VkDevice, descriptorPool: VkDescriptorPool, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkResetDescriptorPool*(device: VkDevice, descriptorPool: VkDescriptorPool, flags: VkDescriptorPoolResetFlags): VkResult {.importc, load.}
proc vkAllocateDescriptorSets*(device: VkDevice, pAllocateInfo: ptr VkDescriptorSetAllocateInfo , pDescriptorSets: ptr VkDescriptorSet ): VkResult {.importc, load.}
proc vkFreeDescriptorSets*(device: VkDevice, descriptorPool: VkDescriptorPool, descriptorSetCount: uint32, pDescriptorSets: ptr VkDescriptorSet ): VkResult {.importc, load.}
proc vkUpdateDescriptorSets*(device: VkDevice, descriptorWriteCount: uint32, pDescriptorWrites: ptr VkWriteDescriptorSet , descriptorCopyCount: uint32, pDescriptorCopies: ptr VkCopyDescriptorSet ): void {.importc, load.}
proc vkCreateFramebuffer*(device: VkDevice, pCreateInfo: ptr VkFramebufferCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pFramebuffer: ptr VkFramebuffer ): VkResult {.importc, load.}
proc vkDestroyFramebuffer*(device: VkDevice, framebuffer: VkFramebuffer, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateRenderPass*(device: VkDevice, pCreateInfo: ptr VkRenderPassCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pRenderPass: ptr VkRenderPass ): VkResult {.importc, load.}
proc vkDestroyRenderPass*(device: VkDevice, renderPass: VkRenderPass, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetRenderAreaGranularity*(device: VkDevice, renderPass: VkRenderPass, pGranularity: ptr VkExtent2D ): void {.importc, load.}
proc vkCreateCommandPool*(device: VkDevice, pCreateInfo: ptr VkCommandPoolCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pCommandPool: ptr VkCommandPool ): VkResult {.importc, load.}
proc vkDestroyCommandPool*(device: VkDevice, commandPool: VkCommandPool, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkResetCommandPool*(device: VkDevice, commandPool: VkCommandPool, flags: VkCommandPoolResetFlags): VkResult {.importc, load.}
proc vkAllocateCommandBuffers*(device: VkDevice, pAllocateInfo: ptr VkCommandBufferAllocateInfo , pCommandBuffers: ptr VkCommandBuffer ): VkResult {.importc, load.}
proc vkFreeCommandBuffers*(device: VkDevice, commandPool: VkCommandPool, commandBufferCount: uint32, pCommandBuffers: ptr VkCommandBuffer ): void {.importc, load.}
proc vkBeginCommandBuffer*(commandBuffer: VkCommandBuffer, pBeginInfo: ptr VkCommandBufferBeginInfo ): VkResult {.importc, load.}
proc vkEndCommandBuffer*(commandBuffer: VkCommandBuffer): VkResult {.importc, load.}
proc vkResetCommandBuffer*(commandBuffer: VkCommandBuffer, flags: VkCommandBufferResetFlags): VkResult {.importc, load.}
proc vkCmdBindPipeline*(commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, pipeline: VkPipeline): void {.importc, load.}
proc vkCmdSetViewport*(commandBuffer: VkCommandBuffer, firstViewport: uint32, viewportCount: uint32, pViewports: ptr VkViewport ): void {.importc, load.}
proc vkCmdSetScissor*(commandBuffer: VkCommandBuffer, firstScissor: uint32, scissorCount: uint32, pScissors: ptr VkRect2D ): void {.importc, load.}
proc vkCmdSetLineWidth*(commandBuffer: VkCommandBuffer, lineWidth: float32): void {.importc, load.}
proc vkCmdSetDepthBias*(commandBuffer: VkCommandBuffer, depthBiasConstantFactor: float32, depthBiasClamp: float32, depthBiasSlopeFactor: float32): void {.importc, load.}
proc vkCmdSetBlendConstants*(commandBuffer: VkCommandBuffer, blendConstants: array[4, float32]): void {.importc, load.}
proc vkCmdSetDepthBounds*(commandBuffer: VkCommandBuffer, minDepthBounds: float32, maxDepthBounds: float32): void {.importc, load.}
proc vkCmdSetStencilCompareMask*(commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, compareMask: uint32): void {.importc, load.}
proc vkCmdSetStencilWriteMask*(commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, writeMask: uint32): void {.importc, load.}
proc vkCmdSetStencilReference*(commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, reference: uint32): void {.importc, load.}
proc vkCmdBindDescriptorSets*(commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, layout: VkPipelineLayout, firstSet: uint32, descriptorSetCount: uint32, pDescriptorSets: ptr VkDescriptorSet , dynamicOffsetCount: uint32, pDynamicOffsets: ptr uint32 ): void {.importc, load.}
proc vkCmdBindIndexBuffer*(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, indexType: VkIndexType): void {.importc, load.}
proc vkCmdBindVertexBuffers*(commandBuffer: VkCommandBuffer, firstBinding: uint32, bindingCount: uint32, pBuffers: ptr VkBuffer , pOffsets: ptr VkDeviceSize ): void {.importc, load.}
proc vkCmdDraw*(commandBuffer: VkCommandBuffer, vertexCount: uint32, instanceCount: uint32, firstVertex: uint32, firstInstance: uint32): void {.importc, load.}
proc vkCmdDrawIndexed*(commandBuffer: VkCommandBuffer, indexCount: uint32, instanceCount: uint32, firstIndex: uint32, vertexOffset: int32, firstInstance: uint32): void {.importc, load.}
proc vkCmdDrawIndirect*(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, drawCount: uint32, stride: uint32): void {.importc, load.}
proc vkCmdDrawIndexedIndirect*(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, drawCount: uint32, stride: uint32): void {.importc, load.}
proc vkCmdDispatch*(commandBuffer: VkCommandBuffer, groupCountX: uint32, groupCountY: uint32, groupCountZ: uint32): void {.importc, load.}
proc vkCmdDispatchIndirect*(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize): void {.importc, load.}
proc vkCmdCopyBuffer*(commandBuffer: VkCommandBuffer, srcBuffer: VkBuffer, dstBuffer: VkBuffer, regionCount: uint32, pRegions: ptr VkBufferCopy ): void {.importc, load.}
proc vkCmdCopyImage*(commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: uint32, pRegions: ptr VkImageCopy ): void {.importc, load.}
proc vkCmdBlitImage*(commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: uint32, pRegions: ptr VkImageBlit , filter: VkFilter): void {.importc, load.}
proc vkCmdCopyBufferToImage*(commandBuffer: VkCommandBuffer, srcBuffer: VkBuffer, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: uint32, pRegions: ptr VkBufferImageCopy ): void {.importc, load.}
proc vkCmdCopyImageToBuffer*(commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstBuffer: VkBuffer, regionCount: uint32, pRegions: ptr VkBufferImageCopy ): void {.importc, load.}
proc vkCmdUpdateBuffer*(commandBuffer: VkCommandBuffer, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, dataSize: VkDeviceSize, pData: pointer ): void {.importc, load.}
proc vkCmdFillBuffer*(commandBuffer: VkCommandBuffer, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, size: VkDeviceSize, data: uint32): void {.importc, load.}
proc vkCmdClearColorImage*(commandBuffer: VkCommandBuffer, image: VkImage, imageLayout: VkImageLayout, pColor: ptr VkClearColorValue , rangeCount: uint32, pRanges: ptr VkImageSubresourceRange ): void {.importc, load.}
proc vkCmdClearDepthStencilImage*(commandBuffer: VkCommandBuffer, image: VkImage, imageLayout: VkImageLayout, pDepthStencil: ptr VkClearDepthStencilValue , rangeCount: uint32, pRanges: ptr VkImageSubresourceRange ): void {.importc, load.}
proc vkCmdClearAttachments*(commandBuffer: VkCommandBuffer, attachmentCount: uint32, pAttachments: ptr VkClearAttachment , rectCount: uint32, pRects: ptr VkClearRect ): void {.importc, load.}
proc vkCmdResolveImage*(commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: uint32, pRegions: ptr VkImageResolve ): void {.importc, load.}
proc vkCmdSetEvent*(commandBuffer: VkCommandBuffer, event: VkEvent, stageMask: VkPipelineStageFlags): void {.importc, load.}
proc vkCmdResetEvent*(commandBuffer: VkCommandBuffer, event: VkEvent, stageMask: VkPipelineStageFlags): void {.importc, load.}
proc vkCmdWaitEvents*(commandBuffer: VkCommandBuffer, eventCount: uint32, pEvents: ptr VkEvent , srcStageMask: VkPipelineStageFlags, dstStageMask: VkPipelineStageFlags, memoryBarrierCount: uint32, pMemoryBarriers: ptr VkMemoryBarrier , bufferMemoryBarrierCount: uint32, pBufferMemoryBarriers: ptr VkBufferMemoryBarrier , imageMemoryBarrierCount: uint32, pImageMemoryBarriers: ptr VkImageMemoryBarrier ): void {.importc, load.}
proc vkCmdPipelineBarrier*(commandBuffer: VkCommandBuffer, srcStageMask: VkPipelineStageFlags, dstStageMask: VkPipelineStageFlags, dependencyFlags: VkDependencyFlags, memoryBarrierCount: uint32, pMemoryBarriers: ptr VkMemoryBarrier , bufferMemoryBarrierCount: uint32, pBufferMemoryBarriers: ptr VkBufferMemoryBarrier , imageMemoryBarrierCount: uint32, pImageMemoryBarriers: ptr VkImageMemoryBarrier ): void {.importc, load.}
proc vkCmdBeginQuery*(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, query: uint32, flags: VkQueryControlFlags): void {.importc, load.}
proc vkCmdEndQuery*(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, query: uint32): void {.importc, load.}
proc vkCmdResetQueryPool*(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, firstQuery: uint32, queryCount: uint32): void {.importc, load.}
proc vkCmdWriteTimestamp*(commandBuffer: VkCommandBuffer, pipelineStage: VkPipelineStageFlagBits, queryPool: VkQueryPool, query: uint32): void {.importc, load.}
proc vkCmdCopyQueryPoolResults*(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, firstQuery: uint32, queryCount: uint32, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, stride: VkDeviceSize, flags: VkQueryResultFlags): void {.importc, load.}
proc vkCmdPushConstants*(commandBuffer: VkCommandBuffer, layout: VkPipelineLayout, stageFlags: VkShaderStageFlags, offset: uint32, size: uint32, pValues: pointer ): void {.importc, load.}
proc vkCmdBeginRenderPass*(commandBuffer: VkCommandBuffer, pRenderPassBegin: ptr VkRenderPassBeginInfo , contents: VkSubpassContents): void {.importc, load.}
proc vkCmdNextSubpass*(commandBuffer: VkCommandBuffer, contents: VkSubpassContents): void {.importc, load.}
proc vkCmdEndRenderPass*(commandBuffer: VkCommandBuffer): void {.importc, load.}
proc vkCmdExecuteCommands*(commandBuffer: VkCommandBuffer, commandBufferCount: uint32, pCommandBuffers: ptr VkCommandBuffer ): void {.importc, load.}

# Vulkan 1_1
proc vkEnumerateInstanceVersion*(pApiVersion: ptr uint32 ): VkResult {.importc, load.}
proc vkBindBufferMemory2*(device: VkDevice, bindInfoCount: uint32, pBindInfos: ptr VkBindBufferMemoryInfo ): VkResult {.importc, load.}
proc vkBindImageMemory2*(device: VkDevice, bindInfoCount: uint32, pBindInfos: ptr VkBindImageMemoryInfo ): VkResult {.importc, load.}
proc vkGetDeviceGroupPeerMemoryFeatures*(device: VkDevice, heapIndex: uint32, localDeviceIndex: uint32, remoteDeviceIndex: uint32, pPeerMemoryFeatures: ptr VkPeerMemoryFeatureFlags ): void {.importc, load.}
proc vkCmdSetDeviceMask*(commandBuffer: VkCommandBuffer, deviceMask: uint32): void {.importc, load.}
proc vkCmdDispatchBase*(commandBuffer: VkCommandBuffer, baseGroupX: uint32, baseGroupY: uint32, baseGroupZ: uint32, groupCountX: uint32, groupCountY: uint32, groupCountZ: uint32): void {.importc, load.}
proc vkEnumeratePhysicalDeviceGroups*(instance: VkInstance, pPhysicalDeviceGroupCount: ptr uint32 , pPhysicalDeviceGroupProperties: ptr VkPhysicalDeviceGroupProperties ): VkResult {.importc, load.}
proc vkGetImageMemoryRequirements2*(device: VkDevice, pInfo: ptr VkImageMemoryRequirementsInfo2 , pMemoryRequirements: ptr VkMemoryRequirements2 ): void {.importc, load.}
proc vkGetBufferMemoryRequirements2*(device: VkDevice, pInfo: ptr VkBufferMemoryRequirementsInfo2 , pMemoryRequirements: ptr VkMemoryRequirements2 ): void {.importc, load.}
proc vkGetImageSparseMemoryRequirements2*(device: VkDevice, pInfo: ptr VkImageSparseMemoryRequirementsInfo2 , pSparseMemoryRequirementCount: ptr uint32 , pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2 ): void {.importc, load.}
proc vkGetPhysicalDeviceFeatures2*(physicalDevice: VkPhysicalDevice, pFeatures: ptr VkPhysicalDeviceFeatures2 ): void {.importc, load.}
proc vkGetPhysicalDeviceProperties2*(physicalDevice: VkPhysicalDevice, pProperties: ptr VkPhysicalDeviceProperties2 ): void {.importc, load.}
proc vkGetPhysicalDeviceFormatProperties2*(physicalDevice: VkPhysicalDevice, format: VkFormat, pFormatProperties: ptr VkFormatProperties2 ): void {.importc, load.}
proc vkGetPhysicalDeviceImageFormatProperties2*(physicalDevice: VkPhysicalDevice, pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2 , pImageFormatProperties: ptr VkImageFormatProperties2 ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceQueueFamilyProperties2*(physicalDevice: VkPhysicalDevice, pQueueFamilyPropertyCount: ptr uint32 , pQueueFamilyProperties: ptr VkQueueFamilyProperties2 ): void {.importc, load.}
proc vkGetPhysicalDeviceMemoryProperties2*(physicalDevice: VkPhysicalDevice, pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2 ): void {.importc, load.}
proc vkGetPhysicalDeviceSparseImageFormatProperties2*(physicalDevice: VkPhysicalDevice, pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2 , pPropertyCount: ptr uint32 , pProperties: ptr VkSparseImageFormatProperties2 ): void {.importc, load.}
proc vkTrimCommandPool*(device: VkDevice, commandPool: VkCommandPool, flags: VkCommandPoolTrimFlags): void {.importc, load.}
proc vkGetDeviceQueue2*(device: VkDevice, pQueueInfo: ptr VkDeviceQueueInfo2 , pQueue: ptr VkQueue ): void {.importc, load.}
proc vkCreateSamplerYcbcrConversion*(device: VkDevice, pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pYcbcrConversion: ptr VkSamplerYcbcrConversion ): VkResult {.importc, load.}
proc vkDestroySamplerYcbcrConversion*(device: VkDevice, ycbcrConversion: VkSamplerYcbcrConversion, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCreateDescriptorUpdateTemplate*(device: VkDevice, pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfo , pAllocator: ptr VkAllocationCallbacks = nil , pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplate ): VkResult {.importc, load.}
proc vkDestroyDescriptorUpdateTemplate*(device: VkDevice, descriptorUpdateTemplate: VkDescriptorUpdateTemplate, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkUpdateDescriptorSetWithTemplate*(device: VkDevice, descriptorSet: VkDescriptorSet, descriptorUpdateTemplate: VkDescriptorUpdateTemplate, pData: pointer ): void {.importc, load.}
proc vkGetPhysicalDeviceExternalBufferProperties*(physicalDevice: VkPhysicalDevice, pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfo , pExternalBufferProperties: ptr VkExternalBufferProperties ): void {.importc, load.}
proc vkGetPhysicalDeviceExternalFenceProperties*(physicalDevice: VkPhysicalDevice, pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfo , pExternalFenceProperties: ptr VkExternalFenceProperties ): void {.importc, load.}
proc vkGetPhysicalDeviceExternalSemaphoreProperties*(physicalDevice: VkPhysicalDevice, pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfo , pExternalSemaphoreProperties: ptr VkExternalSemaphoreProperties ): void {.importc, load.}
proc vkGetDescriptorSetLayoutSupport*(device: VkDevice, pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo , pSupport: ptr VkDescriptorSetLayoutSupport ): void {.importc, load.}

# Vulkan 1_2
proc vkCmdDrawIndirectCount*(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, countBuffer: VkBuffer, countBufferOffset: VkDeviceSize, maxDrawCount: uint32, stride: uint32): void {.importc, load.}
proc vkCmdDrawIndexedIndirectCount*(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, countBuffer: VkBuffer, countBufferOffset: VkDeviceSize, maxDrawCount: uint32, stride: uint32): void {.importc, load.}
proc vkCreateRenderPass2*(device: VkDevice, pCreateInfo: ptr VkRenderPassCreateInfo2 , pAllocator: ptr VkAllocationCallbacks = nil , pRenderPass: ptr VkRenderPass ): VkResult {.importc, load.}
proc vkCmdBeginRenderPass2*(commandBuffer: VkCommandBuffer, pRenderPassBegin: ptr VkRenderPassBeginInfo      , pSubpassBeginInfo: ptr VkSubpassBeginInfo      ): void {.importc, load.}
proc vkCmdNextSubpass2*(commandBuffer: VkCommandBuffer, pSubpassBeginInfo: ptr VkSubpassBeginInfo      , pSubpassEndInfo: ptr VkSubpassEndInfo        ): void {.importc, load.}
proc vkCmdEndRenderPass2*(commandBuffer: VkCommandBuffer, pSubpassEndInfo: ptr VkSubpassEndInfo        ): void {.importc, load.}
proc vkResetQueryPool*(device: VkDevice, queryPool: VkQueryPool, firstQuery: uint32, queryCount: uint32): void {.importc, load.}
proc vkGetSemaphoreCounterValue*(device: VkDevice, semaphore: VkSemaphore, pValue: ptr uint64 ): VkResult {.importc, load.}
proc vkWaitSemaphores*(device: VkDevice, pWaitInfo: ptr VkSemaphoreWaitInfo , timeout: uint64): VkResult {.importc, load.}
proc vkSignalSemaphore*(device: VkDevice, pSignalInfo: ptr VkSemaphoreSignalInfo ): VkResult {.importc, load.}
proc vkGetBufferDeviceAddress*(device: VkDevice, pInfo: ptr VkBufferDeviceAddressInfo ): VkDeviceAddress {.importc, load.}
proc vkGetBufferOpaqueCaptureAddress*(device: VkDevice, pInfo: ptr VkBufferDeviceAddressInfo ): uint64 {.importc, load.}
proc vkGetDeviceMemoryOpaqueCaptureAddress*(device: VkDevice, pInfo: ptr VkDeviceMemoryOpaqueCaptureAddressInfo ): uint64 {.importc, load.}

# Load VK_KHR_surface
proc vkDestroySurfaceKHR*(instance: VkInstance, surface: VkSurfaceKHR, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetPhysicalDeviceSurfaceSupportKHR*(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, surface: VkSurfaceKHR, pSupported: ptr VkBool32 ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceSurfaceCapabilitiesKHR*(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceSurfaceFormatsKHR*(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceFormatCount: ptr uint32 , pSurfaceFormats: ptr VkSurfaceFormatKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceSurfacePresentModesKHR*(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pPresentModeCount: ptr uint32 , pPresentModes: ptr VkPresentModeKHR ): VkResult {.importc, load.}

# Load VK_KHR_swapchain
proc vkCreateSwapchainKHR*(device: VkDevice, pCreateInfo: ptr VkSwapchainCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSwapchain: ptr VkSwapchainKHR ): VkResult {.importc, load.}
proc vkDestroySwapchainKHR*(device: VkDevice, swapchain: VkSwapchainKHR, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetSwapchainImagesKHR*(device: VkDevice, swapchain: VkSwapchainKHR, pSwapchainImageCount: ptr uint32 , pSwapchainImages: ptr VkImage ): VkResult {.importc, load.}
proc vkAcquireNextImageKHR*(device: VkDevice, swapchain: VkSwapchainKHR, timeout: uint64, semaphore: VkSemaphore, fence: VkFence, pImageIndex: ptr uint32 ): VkResult {.importc, load.}
proc vkQueuePresentKHR*(queue: VkQueue, pPresentInfo: ptr VkPresentInfoKHR ): VkResult {.importc, load.}
proc vkGetDeviceGroupPresentCapabilitiesKHR*(device: VkDevice, pDeviceGroupPresentCapabilities: ptr VkDeviceGroupPresentCapabilitiesKHR ): VkResult {.importc, load.}
proc vkGetDeviceGroupSurfacePresentModesKHR*(device: VkDevice, surface: VkSurfaceKHR, pModes: ptr VkDeviceGroupPresentModeFlagsKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDevicePresentRectanglesKHR*(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pRectCount: ptr uint32 , pRects: ptr VkRect2D ): VkResult {.importc, load.}
proc vkAcquireNextImage2KHR*(device: VkDevice, pAcquireInfo: ptr VkAcquireNextImageInfoKHR , pImageIndex: ptr uint32 ): VkResult {.importc, load.}

# Load VK_KHR_display
proc vkGetPhysicalDeviceDisplayPropertiesKHR*(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayPropertiesKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceDisplayPlanePropertiesKHR*(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayPlanePropertiesKHR ): VkResult {.importc, load.}
proc vkGetDisplayPlaneSupportedDisplaysKHR*(physicalDevice: VkPhysicalDevice, planeIndex: uint32, pDisplayCount: ptr uint32 , pDisplays: ptr VkDisplayKHR ): VkResult {.importc, load.}
proc vkGetDisplayModePropertiesKHR*(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayModePropertiesKHR ): VkResult {.importc, load.}
proc vkCreateDisplayModeKHR*(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pCreateInfo: ptr VkDisplayModeCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pMode: ptr VkDisplayModeKHR ): VkResult {.importc, load.}
proc vkGetDisplayPlaneCapabilitiesKHR*(physicalDevice: VkPhysicalDevice, mode: VkDisplayModeKHR, planeIndex: uint32, pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR ): VkResult {.importc, load.}
proc vkCreateDisplayPlaneSurfaceKHR*(instance: VkInstance, pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_KHR_display_swapchain
proc vkCreateSharedSwapchainsKHR*(device: VkDevice, swapchainCount: uint32, pCreateInfos: ptr VkSwapchainCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSwapchains: ptr VkSwapchainKHR ): VkResult {.importc, load.}

# Load VK_KHR_xlib_surface
proc vkCreateXlibSurfaceKHR*(instance: VkInstance, pCreateInfo: ptr VkXlibSurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceXlibPresentationSupportKHR*(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, dpy: ptr Display , visualID: VisualID): VkBool32 {.importc, load.}

# Load VK_KHR_xcb_surface
proc vkCreateXcbSurfaceKHR*(instance: VkInstance, pCreateInfo: ptr VkXcbSurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceXcbPresentationSupportKHR*(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, connection: ptr xcb_connection_t , visual_id: xcb_visualid_t): VkBool32 {.importc, load.}

# Load VK_KHR_wayland_surface
proc vkCreateWaylandSurfaceKHR*(instance: VkInstance, pCreateInfo: ptr VkWaylandSurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceWaylandPresentationSupportKHR*(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, display: ptr wl_display ): VkBool32 {.importc, load.}

# Load VK_KHR_android_surface
proc vkCreateAndroidSurfaceKHR*(instance: VkInstance, pCreateInfo: ptr VkAndroidSurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_KHR_win32_surface
proc vkCreateWin32SurfaceKHR*(instance: VkInstance, pCreateInfo: ptr VkWin32SurfaceCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceWin32PresentationSupportKHR*(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32): VkBool32 {.importc, load.}

# Load VK_ANDROID_native_buffer
proc vkGetSwapchainGrallocUsageANDROID*(device: VkDevice, format: VkFormat, imageUsage: VkImageUsageFlags, grallocUsage: ptr int ): VkResult {.importc, load.}
proc vkAcquireImageANDROID*(device: VkDevice, image: VkImage, nativeFenceFd: int, semaphore: VkSemaphore, fence: VkFence): VkResult {.importc, load.}
proc vkQueueSignalReleaseImageANDROID*(queue: VkQueue, waitSemaphoreCount: uint32, pWaitSemaphores: ptr VkSemaphore , image: VkImage, pNativeFenceFd: ptr int ): VkResult {.importc, load.}
proc vkGetSwapchainGrallocUsage2ANDROID*(device: VkDevice, format: VkFormat, imageUsage: VkImageUsageFlags, swapchainImageUsage: VkSwapchainImageUsageFlagsANDROID, grallocConsumerUsage: ptr uint64 , grallocProducerUsage: ptr uint64 ): VkResult {.importc, load.}

# Load VK_EXT_debug_report
proc vkCreateDebugReportCallbackEXT*(instance: VkInstance, pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pCallback: ptr VkDebugReportCallbackEXT ): VkResult {.importc, load.}
proc vkDestroyDebugReportCallbackEXT*(instance: VkInstance, callback: VkDebugReportCallbackEXT, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkDebugReportMessageEXT*(instance: VkInstance, flags: VkDebugReportFlagsEXT, objectType: VkDebugReportObjectTypeEXT, `object`: uint64, location: uint, messageCode: int32, pLayerPrefix: cstring , pMessage: cstring ): void {.importc, load.}

# Load VK_EXT_debug_marker
proc vkDebugMarkerSetObjectTagEXT*(device: VkDevice, pTagInfo: ptr VkDebugMarkerObjectTagInfoEXT ): VkResult {.importc, load.}
proc vkDebugMarkerSetObjectNameEXT*(device: VkDevice, pNameInfo: ptr VkDebugMarkerObjectNameInfoEXT ): VkResult {.importc, load.}
proc vkCmdDebugMarkerBeginEXT*(commandBuffer: VkCommandBuffer, pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT ): void {.importc, load.}
proc vkCmdDebugMarkerEndEXT*(commandBuffer: VkCommandBuffer): void {.importc, load.}
proc vkCmdDebugMarkerInsertEXT*(commandBuffer: VkCommandBuffer, pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT ): void {.importc, load.}

# Load VK_EXT_transform_feedback
proc vkCmdBindTransformFeedbackBuffersEXT*(commandBuffer: VkCommandBuffer, firstBinding: uint32, bindingCount: uint32, pBuffers: ptr VkBuffer , pOffsets: ptr VkDeviceSize , pSizes: ptr VkDeviceSize ): void {.importc, load.}
proc vkCmdBeginTransformFeedbackEXT*(commandBuffer: VkCommandBuffer, firstCounterBuffer: uint32, counterBufferCount: uint32, pCounterBuffers: ptr VkBuffer , pCounterBufferOffsets: ptr VkDeviceSize ): void {.importc, load.}
proc vkCmdEndTransformFeedbackEXT*(commandBuffer: VkCommandBuffer, firstCounterBuffer: uint32, counterBufferCount: uint32, pCounterBuffers: ptr VkBuffer , pCounterBufferOffsets: ptr VkDeviceSize ): void {.importc, load.}
proc vkCmdBeginQueryIndexedEXT*(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, query: uint32, flags: VkQueryControlFlags, index: uint32): void {.importc, load.}
proc vkCmdEndQueryIndexedEXT*(commandBuffer: VkCommandBuffer, queryPool: VkQueryPool, query: uint32, index: uint32): void {.importc, load.}
proc vkCmdDrawIndirectByteCountEXT*(commandBuffer: VkCommandBuffer, instanceCount: uint32, firstInstance: uint32, counterBuffer: VkBuffer, counterBufferOffset: VkDeviceSize, counterOffset: uint32, vertexStride: uint32): void {.importc, load.}

# Load VK_NVX_image_view_handle
proc vkGetImageViewHandleNVX*(device: VkDevice, pInfo: ptr VkImageViewHandleInfoNVX ): uint32 {.importc, load.}
proc vkGetImageViewAddressNVX*(device: VkDevice, imageView: VkImageView, pProperties: ptr VkImageViewAddressPropertiesNVX ): VkResult {.importc, load.}

# Load VK_AMD_shader_info
proc vkGetShaderInfoAMD*(device: VkDevice, pipeline: VkPipeline, shaderStage: VkShaderStageFlagBits, infoType: VkShaderInfoTypeAMD, pInfoSize: ptr uint , pInfo: pointer ): VkResult {.importc, load.}

# Load VK_GGP_stream_descriptor_surface
proc vkCreateStreamDescriptorSurfaceGGP*(instance: VkInstance, pCreateInfo: ptr VkStreamDescriptorSurfaceCreateInfoGGP , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_NV_external_memory_capabilities
proc vkGetPhysicalDeviceExternalImageFormatPropertiesNV*(physicalDevice: VkPhysicalDevice, format: VkFormat, `type`: VkImageType, tiling: VkImageTiling, usage: VkImageUsageFlags, flags: VkImageCreateFlags, externalHandleType: VkExternalMemoryHandleTypeFlagsNV, pExternalImageFormatProperties: ptr VkExternalImageFormatPropertiesNV ): VkResult {.importc, load.}

# Load VK_NV_external_memory_win32
proc vkGetMemoryWin32HandleNV*(device: VkDevice, memory: VkDeviceMemory, handleType: VkExternalMemoryHandleTypeFlagsNV, pHandle: ptr HANDLE ): VkResult {.importc, load.}

# Load VK_KHR_device_group

# Load VK_NN_vi_surface
proc vkCreateViSurfaceNN*(instance: VkInstance, pCreateInfo: ptr VkViSurfaceCreateInfoNN , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_KHR_external_memory_win32
proc vkGetMemoryWin32HandleKHR*(device: VkDevice, pGetWin32HandleInfo: ptr VkMemoryGetWin32HandleInfoKHR , pHandle: ptr HANDLE ): VkResult {.importc, load.}
proc vkGetMemoryWin32HandlePropertiesKHR*(device: VkDevice, handleType: VkExternalMemoryHandleTypeFlagBits, handle: HANDLE, pMemoryWin32HandleProperties: ptr VkMemoryWin32HandlePropertiesKHR ): VkResult {.importc, load.}

# Load VK_KHR_external_memory_fd
proc vkGetMemoryFdKHR*(device: VkDevice, pGetFdInfo: ptr VkMemoryGetFdInfoKHR , pFd: ptr int ): VkResult {.importc, load.}
proc vkGetMemoryFdPropertiesKHR*(device: VkDevice, handleType: VkExternalMemoryHandleTypeFlagBits, fd: int, pMemoryFdProperties: ptr VkMemoryFdPropertiesKHR ): VkResult {.importc, load.}

# Load VK_KHR_external_semaphore_win32
proc vkImportSemaphoreWin32HandleKHR*(device: VkDevice, pImportSemaphoreWin32HandleInfo: ptr VkImportSemaphoreWin32HandleInfoKHR ): VkResult {.importc, load.}
proc vkGetSemaphoreWin32HandleKHR*(device: VkDevice, pGetWin32HandleInfo: ptr VkSemaphoreGetWin32HandleInfoKHR , pHandle: ptr HANDLE ): VkResult {.importc, load.}

# Load VK_KHR_external_semaphore_fd
proc vkImportSemaphoreFdKHR*(device: VkDevice, pImportSemaphoreFdInfo: ptr VkImportSemaphoreFdInfoKHR ): VkResult {.importc, load.}
proc vkGetSemaphoreFdKHR*(device: VkDevice, pGetFdInfo: ptr VkSemaphoreGetFdInfoKHR , pFd: ptr int ): VkResult {.importc, load.}

# Load VK_KHR_push_descriptor
proc vkCmdPushDescriptorSetKHR*(commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, layout: VkPipelineLayout, set: uint32, descriptorWriteCount: uint32, pDescriptorWrites: ptr VkWriteDescriptorSet ): void {.importc, load.}
proc vkCmdPushDescriptorSetWithTemplateKHR*(commandBuffer: VkCommandBuffer, descriptorUpdateTemplate: VkDescriptorUpdateTemplate, layout: VkPipelineLayout, set: uint32, pData: pointer ): void {.importc, load.}

# Load VK_EXT_conditional_rendering
proc vkCmdBeginConditionalRenderingEXT*(commandBuffer: VkCommandBuffer, pConditionalRenderingBegin: ptr VkConditionalRenderingBeginInfoEXT ): void {.importc, load.}
proc vkCmdEndConditionalRenderingEXT*(commandBuffer: VkCommandBuffer): void {.importc, load.}

# Load VK_KHR_descriptor_update_template

# Load VK_NV_clip_space_w_scaling
proc vkCmdSetViewportWScalingNV*(commandBuffer: VkCommandBuffer, firstViewport: uint32, viewportCount: uint32, pViewportWScalings: ptr VkViewportWScalingNV ): void {.importc, load.}

# Load VK_EXT_direct_mode_display
proc vkReleaseDisplayEXT*(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR): VkResult {.importc, load.}

# Load VK_EXT_acquire_xlib_display
proc vkAcquireXlibDisplayEXT*(physicalDevice: VkPhysicalDevice, dpy: ptr Display , display: VkDisplayKHR): VkResult {.importc, load.}
proc vkGetRandROutputDisplayEXT*(physicalDevice: VkPhysicalDevice, dpy: ptr Display , rrOutput: RROutput, pDisplay: ptr VkDisplayKHR ): VkResult {.importc, load.}

# Load VK_EXT_display_surface_counter
proc vkGetPhysicalDeviceSurfaceCapabilities2EXT*(physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceCapabilities: ptr VkSurfaceCapabilities2EXT ): VkResult {.importc, load.}

# Load VK_EXT_display_control
proc vkDisplayPowerControlEXT*(device: VkDevice, display: VkDisplayKHR, pDisplayPowerInfo: ptr VkDisplayPowerInfoEXT ): VkResult {.importc, load.}
proc vkRegisterDeviceEventEXT*(device: VkDevice, pDeviceEventInfo: ptr VkDeviceEventInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pFence: ptr VkFence ): VkResult {.importc, load.}
proc vkRegisterDisplayEventEXT*(device: VkDevice, display: VkDisplayKHR, pDisplayEventInfo: ptr VkDisplayEventInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pFence: ptr VkFence ): VkResult {.importc, load.}
proc vkGetSwapchainCounterEXT*(device: VkDevice, swapchain: VkSwapchainKHR, counter: VkSurfaceCounterFlagBitsEXT, pCounterValue: ptr uint64 ): VkResult {.importc, load.}

# Load VK_GOOGLE_display_timing
proc vkGetRefreshCycleDurationGOOGLE*(device: VkDevice, swapchain: VkSwapchainKHR, pDisplayTimingProperties: ptr VkRefreshCycleDurationGOOGLE ): VkResult {.importc, load.}
proc vkGetPastPresentationTimingGOOGLE*(device: VkDevice, swapchain: VkSwapchainKHR, pPresentationTimingCount: ptr uint32 , pPresentationTimings: ptr VkPastPresentationTimingGOOGLE ): VkResult {.importc, load.}

# Load VK_EXT_discard_rectangles
proc vkCmdSetDiscardRectangleEXT*(commandBuffer: VkCommandBuffer, firstDiscardRectangle: uint32, discardRectangleCount: uint32, pDiscardRectangles: ptr VkRect2D ): void {.importc, load.}

# Load VK_EXT_hdr_metadata
proc vkSetHdrMetadataEXT*(device: VkDevice, swapchainCount: uint32, pSwapchains: ptr VkSwapchainKHR , pMetadata: ptr VkHdrMetadataEXT ): void {.importc, load.}

# Load VK_KHR_shared_presentable_image
proc vkGetSwapchainStatusKHR*(device: VkDevice, swapchain: VkSwapchainKHR): VkResult {.importc, load.}

# Load VK_KHR_external_fence_win32
proc vkImportFenceWin32HandleKHR*(device: VkDevice, pImportFenceWin32HandleInfo: ptr VkImportFenceWin32HandleInfoKHR ): VkResult {.importc, load.}
proc vkGetFenceWin32HandleKHR*(device: VkDevice, pGetWin32HandleInfo: ptr VkFenceGetWin32HandleInfoKHR , pHandle: ptr HANDLE ): VkResult {.importc, load.}

# Load VK_KHR_external_fence_fd
proc vkImportFenceFdKHR*(device: VkDevice, pImportFenceFdInfo: ptr VkImportFenceFdInfoKHR ): VkResult {.importc, load.}
proc vkGetFenceFdKHR*(device: VkDevice, pGetFdInfo: ptr VkFenceGetFdInfoKHR , pFd: ptr int ): VkResult {.importc, load.}

# Load VK_KHR_performance_query
proc vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR*(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, pCounterCount: ptr uint32 , pCounters: ptr VkPerformanceCounterKHR , pCounterDescriptions: ptr VkPerformanceCounterDescriptionKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR*(physicalDevice: VkPhysicalDevice, pPerformanceQueryCreateInfo: ptr VkQueryPoolPerformanceCreateInfoKHR , pNumPasses: ptr uint32 ): void {.importc, load.}
proc vkAcquireProfilingLockKHR*(device: VkDevice, pInfo: ptr VkAcquireProfilingLockInfoKHR ): VkResult {.importc, load.}
proc vkReleaseProfilingLockKHR*(device: VkDevice): void {.importc, load.}

# Load VK_KHR_get_surface_capabilities2
proc vkGetPhysicalDeviceSurfaceCapabilities2KHR*(physicalDevice: VkPhysicalDevice, pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR , pSurfaceCapabilities: ptr VkSurfaceCapabilities2KHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceSurfaceFormats2KHR*(physicalDevice: VkPhysicalDevice, pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR , pSurfaceFormatCount: ptr uint32 , pSurfaceFormats: ptr VkSurfaceFormat2KHR ): VkResult {.importc, load.}

# Load VK_KHR_get_display_properties2
proc vkGetPhysicalDeviceDisplayProperties2KHR*(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayProperties2KHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceDisplayPlaneProperties2KHR*(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayPlaneProperties2KHR ): VkResult {.importc, load.}
proc vkGetDisplayModeProperties2KHR*(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pPropertyCount: ptr uint32 , pProperties: ptr VkDisplayModeProperties2KHR ): VkResult {.importc, load.}
proc vkGetDisplayPlaneCapabilities2KHR*(physicalDevice: VkPhysicalDevice, pDisplayPlaneInfo: ptr VkDisplayPlaneInfo2KHR , pCapabilities: ptr VkDisplayPlaneCapabilities2KHR ): VkResult {.importc, load.}

# Load VK_MVK_ios_surface
proc vkCreateIOSSurfaceMVK*(instance: VkInstance, pCreateInfo: ptr VkIOSSurfaceCreateInfoMVK , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_MVK_macos_surface
proc vkCreateMacOSSurfaceMVK*(instance: VkInstance, pCreateInfo: ptr VkMacOSSurfaceCreateInfoMVK , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_EXT_debug_utils
proc vkSetDebugUtilsObjectNameEXT*(device: VkDevice, pNameInfo: ptr VkDebugUtilsObjectNameInfoEXT ): VkResult {.importc, load.}
proc vkSetDebugUtilsObjectTagEXT*(device: VkDevice, pTagInfo: ptr VkDebugUtilsObjectTagInfoEXT ): VkResult {.importc, load.}
proc vkQueueBeginDebugUtilsLabelEXT*(queue: VkQueue, pLabelInfo: ptr VkDebugUtilsLabelEXT ): void {.importc, load.}
proc vkQueueEndDebugUtilsLabelEXT*(queue: VkQueue): void {.importc, load.}
proc vkQueueInsertDebugUtilsLabelEXT*(queue: VkQueue, pLabelInfo: ptr VkDebugUtilsLabelEXT ): void {.importc, load.}
proc vkCmdBeginDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer, pLabelInfo: ptr VkDebugUtilsLabelEXT ): void {.importc, load.}
proc vkCmdEndDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer): void {.importc, load.}
proc vkCmdInsertDebugUtilsLabelEXT*(commandBuffer: VkCommandBuffer, pLabelInfo: ptr VkDebugUtilsLabelEXT ): void {.importc, load.}
proc vkCreateDebugUtilsMessengerEXT*(instance: VkInstance, pCreateInfo: ptr VkDebugUtilsMessengerCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pMessenger: ptr VkDebugUtilsMessengerEXT ): VkResult {.importc, load.}
proc vkDestroyDebugUtilsMessengerEXT*(instance: VkInstance, messenger: VkDebugUtilsMessengerEXT, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkSubmitDebugUtilsMessageEXT*(instance: VkInstance, messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: ptr VkDebugUtilsMessengerCallbackDataEXT ): void {.importc, load.}

# Load VK_ANDROID_external_memory_android_hardware_buffer
proc vkGetAndroidHardwareBufferPropertiesANDROID*(device: VkDevice, buffer: ptr AHardwareBuffer , pProperties: ptr VkAndroidHardwareBufferPropertiesANDROID ): VkResult {.importc, load.}
proc vkGetMemoryAndroidHardwareBufferANDROID*(device: VkDevice, pInfo: ptr VkMemoryGetAndroidHardwareBufferInfoANDROID , pBuffer: ptr ptr AHardwareBuffer ): VkResult {.importc, load.}

# Load VK_EXT_sample_locations
proc vkCmdSetSampleLocationsEXT*(commandBuffer: VkCommandBuffer, pSampleLocationsInfo: ptr VkSampleLocationsInfoEXT ): void {.importc, load.}
proc vkGetPhysicalDeviceMultisamplePropertiesEXT*(physicalDevice: VkPhysicalDevice, samples: VkSampleCountFlagBits, pMultisampleProperties: ptr VkMultisamplePropertiesEXT ): void {.importc, load.}

# Load VK_KHR_acceleration_structure
proc vkCreateAccelerationStructureKHR*(device: VkDevice, pCreateInfo: ptr VkAccelerationStructureCreateInfoKHR        , pAllocator: ptr VkAllocationCallbacks = nil       , pAccelerationStructure: ptr VkAccelerationStructureKHR                        ): VkResult {.importc, load.}
proc vkDestroyAccelerationStructureKHR*(device: VkDevice, accelerationStructure: VkAccelerationStructureKHR, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkCmdBuildAccelerationStructuresKHR*(commandBuffer: VkCommandBuffer, infoCount: uint32, pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR , ppBuildRangeInfos: ptr ptr VkAccelerationStructureBuildRangeInfoKHR ): void {.importc, load.}
proc vkCmdBuildAccelerationStructuresIndirectKHR*(commandBuffer: VkCommandBuffer, infoCount: uint32, pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR , pIndirectDeviceAddresses: ptr VkDeviceAddress             , pIndirectStrides: ptr uint32                    , ppMaxPrimitiveCounts: ptr ptr uint32             ): void {.importc, load.}
proc vkBuildAccelerationStructuresKHR*(device: VkDevice, deferredOperation: VkDeferredOperationKHR, infoCount: uint32, pInfos: ptr VkAccelerationStructureBuildGeometryInfoKHR , ppBuildRangeInfos: ptr ptr VkAccelerationStructureBuildRangeInfoKHR ): VkResult {.importc, load.}
proc vkCopyAccelerationStructureKHR*(device: VkDevice, deferredOperation: VkDeferredOperationKHR, pInfo: ptr VkCopyAccelerationStructureInfoKHR ): VkResult {.importc, load.}
proc vkCopyAccelerationStructureToMemoryKHR*(device: VkDevice, deferredOperation: VkDeferredOperationKHR, pInfo: ptr VkCopyAccelerationStructureToMemoryInfoKHR ): VkResult {.importc, load.}
proc vkCopyMemoryToAccelerationStructureKHR*(device: VkDevice, deferredOperation: VkDeferredOperationKHR, pInfo: ptr VkCopyMemoryToAccelerationStructureInfoKHR ): VkResult {.importc, load.}
proc vkWriteAccelerationStructuresPropertiesKHR*(device: VkDevice, accelerationStructureCount: uint32, pAccelerationStructures: ptr VkAccelerationStructureKHR , queryType: VkQueryType, dataSize: uint, pData: pointer , stride: uint): VkResult {.importc, load.}
proc vkCmdCopyAccelerationStructureKHR*(commandBuffer: VkCommandBuffer, pInfo: ptr VkCopyAccelerationStructureInfoKHR ): void {.importc, load.}
proc vkCmdCopyAccelerationStructureToMemoryKHR*(commandBuffer: VkCommandBuffer, pInfo: ptr VkCopyAccelerationStructureToMemoryInfoKHR ): void {.importc, load.}
proc vkCmdCopyMemoryToAccelerationStructureKHR*(commandBuffer: VkCommandBuffer, pInfo: ptr VkCopyMemoryToAccelerationStructureInfoKHR ): void {.importc, load.}
proc vkGetAccelerationStructureDeviceAddressKHR*(device: VkDevice, pInfo: ptr VkAccelerationStructureDeviceAddressInfoKHR ): VkDeviceAddress {.importc, load.}
proc vkCmdWriteAccelerationStructuresPropertiesKHR*(commandBuffer: VkCommandBuffer, accelerationStructureCount: uint32, pAccelerationStructures: ptr VkAccelerationStructureKHR , queryType: VkQueryType, queryPool: VkQueryPool, firstQuery: uint32): void {.importc, load.}
proc vkGetDeviceAccelerationStructureCompatibilityKHR*(device: VkDevice, pVersionInfo: ptr VkAccelerationStructureVersionInfoKHR , pCompatibility: ptr VkAccelerationStructureCompatibilityKHR ): void {.importc, load.}
proc vkGetAccelerationStructureBuildSizesKHR*(device: VkDevice, buildType: VkAccelerationStructureBuildTypeKHR, pBuildInfo: ptr VkAccelerationStructureBuildGeometryInfoKHR  , pMaxPrimitiveCounts: ptr uint32  , pSizeInfo: ptr VkAccelerationStructureBuildSizesInfoKHR           ): void {.importc, load.}

# Load VK_KHR_ray_tracing_pipeline
proc vkCmdTraceRaysKHR*(commandBuffer: VkCommandBuffer, pRaygenShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pMissShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pHitShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pCallableShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , width: uint32, height: uint32, depth: uint32): void {.importc, load.}
proc vkCreateRayTracingPipelinesKHR*(device: VkDevice, deferredOperation: VkDeferredOperationKHR, pipelineCache: VkPipelineCache, createInfoCount: uint32, pCreateInfos: ptr VkRayTracingPipelineCreateInfoKHR , pAllocator: ptr VkAllocationCallbacks = nil , pPipelines: ptr VkPipeline ): VkResult {.importc, load.}
proc vkGetRayTracingShaderGroupHandlesKHR*(device: VkDevice, pipeline: VkPipeline, firstGroup: uint32, groupCount: uint32, dataSize: uint, pData: pointer ): VkResult {.importc, load.}
proc vkGetRayTracingCaptureReplayShaderGroupHandlesKHR*(device: VkDevice, pipeline: VkPipeline, firstGroup: uint32, groupCount: uint32, dataSize: uint, pData: pointer ): VkResult {.importc, load.}
proc vkCmdTraceRaysIndirectKHR*(commandBuffer: VkCommandBuffer, pRaygenShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pMissShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pHitShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , pCallableShaderBindingTable: ptr VkStridedDeviceAddressRegionKHR , indirectDeviceAddress: VkDeviceAddress): void {.importc, load.}
proc vkGetRayTracingShaderGroupStackSizeKHR*(device: VkDevice, pipeline: VkPipeline, group: uint32, groupShader: VkShaderGroupShaderKHR): VkDeviceSize {.importc, load.}
proc vkCmdSetRayTracingPipelineStackSizeKHR*(commandBuffer: VkCommandBuffer, pipelineStackSize: uint32): void {.importc, load.}

# Load VK_EXT_image_drm_format_modifier
proc vkGetImageDrmFormatModifierPropertiesEXT*(device: VkDevice, image: VkImage, pProperties: ptr VkImageDrmFormatModifierPropertiesEXT ): VkResult {.importc, load.}

# Load VK_EXT_validation_cache
proc vkCreateValidationCacheEXT*(device: VkDevice, pCreateInfo: ptr VkValidationCacheCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pValidationCache: ptr VkValidationCacheEXT ): VkResult {.importc, load.}
proc vkDestroyValidationCacheEXT*(device: VkDevice, validationCache: VkValidationCacheEXT, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkMergeValidationCachesEXT*(device: VkDevice, dstCache: VkValidationCacheEXT, srcCacheCount: uint32, pSrcCaches: ptr VkValidationCacheEXT ): VkResult {.importc, load.}
proc vkGetValidationCacheDataEXT*(device: VkDevice, validationCache: VkValidationCacheEXT, pDataSize: ptr uint , pData: pointer ): VkResult {.importc, load.}

# Load VK_NV_shading_rate_image
proc vkCmdBindShadingRateImageNV*(commandBuffer: VkCommandBuffer, imageView: VkImageView, imageLayout: VkImageLayout): void {.importc, load.}
proc vkCmdSetViewportShadingRatePaletteNV*(commandBuffer: VkCommandBuffer, firstViewport: uint32, viewportCount: uint32, pShadingRatePalettes: ptr VkShadingRatePaletteNV ): void {.importc, load.}
proc vkCmdSetCoarseSampleOrderNV*(commandBuffer: VkCommandBuffer, sampleOrderType: VkCoarseSampleOrderTypeNV, customSampleOrderCount: uint32, pCustomSampleOrders: ptr VkCoarseSampleOrderCustomNV ): void {.importc, load.}

# Load VK_NV_ray_tracing
proc vkCreateAccelerationStructureNV*(device: VkDevice, pCreateInfo: ptr VkAccelerationStructureCreateInfoNV , pAllocator: ptr VkAllocationCallbacks = nil , pAccelerationStructure: ptr VkAccelerationStructureNV ): VkResult {.importc, load.}
proc vkDestroyAccelerationStructureNV*(device: VkDevice, accelerationStructure: VkAccelerationStructureNV, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetAccelerationStructureMemoryRequirementsNV*(device: VkDevice, pInfo: ptr VkAccelerationStructureMemoryRequirementsInfoNV , pMemoryRequirements: ptr VkMemoryRequirements2KHR ): void {.importc, load.}
proc vkBindAccelerationStructureMemoryNV*(device: VkDevice, bindInfoCount: uint32, pBindInfos: ptr VkBindAccelerationStructureMemoryInfoNV ): VkResult {.importc, load.}
proc vkCmdBuildAccelerationStructureNV*(commandBuffer: VkCommandBuffer, pInfo: ptr VkAccelerationStructureInfoNV , instanceData: VkBuffer, instanceOffset: VkDeviceSize, update: VkBool32, dst: VkAccelerationStructureNV, src: VkAccelerationStructureNV, scratch: VkBuffer, scratchOffset: VkDeviceSize): void {.importc, load.}
proc vkCmdCopyAccelerationStructureNV*(commandBuffer: VkCommandBuffer, dst: VkAccelerationStructureNV, src: VkAccelerationStructureNV, mode: VkCopyAccelerationStructureModeKHR): void {.importc, load.}
proc vkCmdTraceRaysNV*(commandBuffer: VkCommandBuffer, raygenShaderBindingTableBuffer: VkBuffer, raygenShaderBindingOffset: VkDeviceSize, missShaderBindingTableBuffer: VkBuffer, missShaderBindingOffset: VkDeviceSize, missShaderBindingStride: VkDeviceSize, hitShaderBindingTableBuffer: VkBuffer, hitShaderBindingOffset: VkDeviceSize, hitShaderBindingStride: VkDeviceSize, callableShaderBindingTableBuffer: VkBuffer, callableShaderBindingOffset: VkDeviceSize, callableShaderBindingStride: VkDeviceSize, width: uint32, height: uint32, depth: uint32): void {.importc, load.}
proc vkCreateRayTracingPipelinesNV*(device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: uint32, pCreateInfos: ptr VkRayTracingPipelineCreateInfoNV , pAllocator: ptr VkAllocationCallbacks = nil , pPipelines: ptr VkPipeline ): VkResult {.importc, load.}
proc vkGetAccelerationStructureHandleNV*(device: VkDevice, accelerationStructure: VkAccelerationStructureNV, dataSize: uint, pData: pointer ): VkResult {.importc, load.}
proc vkCmdWriteAccelerationStructuresPropertiesNV*(commandBuffer: VkCommandBuffer, accelerationStructureCount: uint32, pAccelerationStructures: ptr VkAccelerationStructureNV , queryType: VkQueryType, queryPool: VkQueryPool, firstQuery: uint32): void {.importc, load.}
proc vkCompileDeferredNV*(device: VkDevice, pipeline: VkPipeline, shader: uint32): VkResult {.importc, load.}

# Load VK_EXT_external_memory_host
proc vkGetMemoryHostPointerPropertiesEXT*(device: VkDevice, handleType: VkExternalMemoryHandleTypeFlagBits, pHostPointer: pointer , pMemoryHostPointerProperties: ptr VkMemoryHostPointerPropertiesEXT ): VkResult {.importc, load.}

# Load VK_AMD_buffer_marker
proc vkCmdWriteBufferMarkerAMD*(commandBuffer: VkCommandBuffer, pipelineStage: VkPipelineStageFlagBits, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, marker: uint32): void {.importc, load.}

# Load VK_EXT_calibrated_timestamps
proc vkGetPhysicalDeviceCalibrateableTimeDomainsEXT*(physicalDevice: VkPhysicalDevice, pTimeDomainCount: ptr uint32 , pTimeDomains: ptr VkTimeDomainEXT ): VkResult {.importc, load.}
proc vkGetCalibratedTimestampsEXT*(device: VkDevice, timestampCount: uint32, pTimestampInfos: ptr VkCalibratedTimestampInfoEXT , pTimestamps: ptr uint64 , pMaxDeviation: ptr uint64 ): VkResult {.importc, load.}

# Load VK_NV_mesh_shader
proc vkCmdDrawMeshTasksNV*(commandBuffer: VkCommandBuffer, taskCount: uint32, firstTask: uint32): void {.importc, load.}
proc vkCmdDrawMeshTasksIndirectNV*(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, drawCount: uint32, stride: uint32): void {.importc, load.}
proc vkCmdDrawMeshTasksIndirectCountNV*(commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, countBuffer: VkBuffer, countBufferOffset: VkDeviceSize, maxDrawCount: uint32, stride: uint32): void {.importc, load.}

# Load VK_NV_scissor_exclusive
proc vkCmdSetExclusiveScissorNV*(commandBuffer: VkCommandBuffer, firstExclusiveScissor: uint32, exclusiveScissorCount: uint32, pExclusiveScissors: ptr VkRect2D ): void {.importc, load.}

# Load VK_NV_device_diagnostic_checkpoints
proc vkCmdSetCheckpointNV*(commandBuffer: VkCommandBuffer, pCheckpointMarker: pointer ): void {.importc, load.}
proc vkGetQueueCheckpointDataNV*(queue: VkQueue, pCheckpointDataCount: ptr uint32 , pCheckpointData: ptr VkCheckpointDataNV ): void {.importc, load.}

# Load VK_INTEL_performance_query
proc vkInitializePerformanceApiINTEL*(device: VkDevice, pInitializeInfo: ptr VkInitializePerformanceApiInfoINTEL ): VkResult {.importc, load.}
proc vkUninitializePerformanceApiINTEL*(device: VkDevice): void {.importc, load.}
proc vkCmdSetPerformanceMarkerINTEL*(commandBuffer: VkCommandBuffer, pMarkerInfo: ptr VkPerformanceMarkerInfoINTEL ): VkResult {.importc, load.}
proc vkCmdSetPerformanceStreamMarkerINTEL*(commandBuffer: VkCommandBuffer, pMarkerInfo: ptr VkPerformanceStreamMarkerInfoINTEL ): VkResult {.importc, load.}
proc vkCmdSetPerformanceOverrideINTEL*(commandBuffer: VkCommandBuffer, pOverrideInfo: ptr VkPerformanceOverrideInfoINTEL ): VkResult {.importc, load.}
proc vkAcquirePerformanceConfigurationINTEL*(device: VkDevice, pAcquireInfo: ptr VkPerformanceConfigurationAcquireInfoINTEL , pConfiguration: ptr VkPerformanceConfigurationINTEL ): VkResult {.importc, load.}
proc vkReleasePerformanceConfigurationINTEL*(device: VkDevice, configuration: VkPerformanceConfigurationINTEL): VkResult {.importc, load.}
proc vkQueueSetPerformanceConfigurationINTEL*(queue: VkQueue, configuration: VkPerformanceConfigurationINTEL): VkResult {.importc, load.}
proc vkGetPerformanceParameterINTEL*(device: VkDevice, parameter: VkPerformanceParameterTypeINTEL, pValue: ptr VkPerformanceValueINTEL ): VkResult {.importc, load.}

# Load VK_AMD_display_native_hdr
proc vkSetLocalDimmingAMD*(device: VkDevice, swapChain: VkSwapchainKHR, localDimmingEnable: VkBool32): void {.importc, load.}

# Load VK_FUCHSIA_imagepipe_surface
proc vkCreateImagePipeSurfaceFUCHSIA*(instance: VkInstance, pCreateInfo: ptr VkImagePipeSurfaceCreateInfoFUCHSIA , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_EXT_metal_surface
proc vkCreateMetalSurfaceEXT*(instance: VkInstance, pCreateInfo: ptr VkMetalSurfaceCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_KHR_fragment_shading_rate
proc vkGetPhysicalDeviceFragmentShadingRatesKHR*(physicalDevice: VkPhysicalDevice, pFragmentShadingRateCount: ptr uint32 , pFragmentShadingRates: ptr VkPhysicalDeviceFragmentShadingRateKHR ): VkResult {.importc, load.}
proc vkCmdSetFragmentShadingRateKHR*(commandBuffer: VkCommandBuffer, pFragmentSize: ptr VkExtent2D                           , combinerOps: array[2, VkFragmentShadingRateCombinerOpKHR]): void {.importc, load.}

# Load VK_EXT_tooling_info
proc vkGetPhysicalDeviceToolPropertiesEXT*(physicalDevice: VkPhysicalDevice, pToolCount: ptr uint32 , pToolProperties: ptr VkPhysicalDeviceToolPropertiesEXT ): VkResult {.importc, load.}

# Load VK_NV_cooperative_matrix
proc vkGetPhysicalDeviceCooperativeMatrixPropertiesNV*(physicalDevice: VkPhysicalDevice, pPropertyCount: ptr uint32 , pProperties: ptr VkCooperativeMatrixPropertiesNV ): VkResult {.importc, load.}

# Load VK_NV_coverage_reduction_mode
proc vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV*(physicalDevice: VkPhysicalDevice, pCombinationCount: ptr uint32 , pCombinations: ptr VkFramebufferMixedSamplesCombinationNV ): VkResult {.importc, load.}

# Load VK_EXT_full_screen_exclusive
proc vkGetPhysicalDeviceSurfacePresentModes2EXT*(physicalDevice: VkPhysicalDevice, pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR , pPresentModeCount: ptr uint32 , pPresentModes: ptr VkPresentModeKHR ): VkResult {.importc, load.}
proc vkAcquireFullScreenExclusiveModeEXT*(device: VkDevice, swapchain: VkSwapchainKHR): VkResult {.importc, load.}
proc vkReleaseFullScreenExclusiveModeEXT*(device: VkDevice, swapchain: VkSwapchainKHR): VkResult {.importc, load.}
proc vkGetDeviceGroupSurfacePresentModes2EXT*(device: VkDevice, pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR , pModes: ptr VkDeviceGroupPresentModeFlagsKHR ): VkResult {.importc, load.}

# Load VK_EXT_headless_surface
proc vkCreateHeadlessSurfaceEXT*(instance: VkInstance, pCreateInfo: ptr VkHeadlessSurfaceCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}

# Load VK_EXT_line_rasterization
proc vkCmdSetLineStippleEXT*(commandBuffer: VkCommandBuffer, lineStippleFactor: uint32, lineStipplePattern: uint16): void {.importc, load.}

# Load VK_EXT_extended_dynamic_state
proc vkCmdSetCullModeEXT*(commandBuffer: VkCommandBuffer, cullMode: VkCullModeFlags): void {.importc, load.}
proc vkCmdSetFrontFaceEXT*(commandBuffer: VkCommandBuffer, frontFace: VkFrontFace): void {.importc, load.}
proc vkCmdSetPrimitiveTopologyEXT*(commandBuffer: VkCommandBuffer, primitiveTopology: VkPrimitiveTopology): void {.importc, load.}
proc vkCmdSetViewportWithCountEXT*(commandBuffer: VkCommandBuffer, viewportCount: uint32, pViewports: ptr VkViewport ): void {.importc, load.}
proc vkCmdSetScissorWithCountEXT*(commandBuffer: VkCommandBuffer, scissorCount: uint32, pScissors: ptr VkRect2D ): void {.importc, load.}
proc vkCmdBindVertexBuffers2EXT*(commandBuffer: VkCommandBuffer, firstBinding: uint32, bindingCount: uint32, pBuffers: ptr VkBuffer , pOffsets: ptr VkDeviceSize , pSizes: ptr VkDeviceSize , pStrides: ptr VkDeviceSize ): void {.importc, load.}
proc vkCmdSetDepthTestEnableEXT*(commandBuffer: VkCommandBuffer, depthTestEnable: VkBool32): void {.importc, load.}
proc vkCmdSetDepthWriteEnableEXT*(commandBuffer: VkCommandBuffer, depthWriteEnable: VkBool32): void {.importc, load.}
proc vkCmdSetDepthCompareOpEXT*(commandBuffer: VkCommandBuffer, depthCompareOp: VkCompareOp): void {.importc, load.}
proc vkCmdSetDepthBoundsTestEnableEXT*(commandBuffer: VkCommandBuffer, depthBoundsTestEnable: VkBool32): void {.importc, load.}
proc vkCmdSetStencilTestEnableEXT*(commandBuffer: VkCommandBuffer, stencilTestEnable: VkBool32): void {.importc, load.}
proc vkCmdSetStencilOpEXT*(commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, failOp: VkStencilOp, passOp: VkStencilOp, depthFailOp: VkStencilOp, compareOp: VkCompareOp): void {.importc, load.}

# Load VK_KHR_deferred_host_operations
proc vkCreateDeferredOperationKHR*(device: VkDevice, pAllocator: ptr VkAllocationCallbacks = nil , pDeferredOperation: ptr VkDeferredOperationKHR ): VkResult {.importc, load.}
proc vkDestroyDeferredOperationKHR*(device: VkDevice, operation: VkDeferredOperationKHR, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkGetDeferredOperationMaxConcurrencyKHR*(device: VkDevice, operation: VkDeferredOperationKHR): uint32 {.importc, load.}
proc vkGetDeferredOperationResultKHR*(device: VkDevice, operation: VkDeferredOperationKHR): VkResult {.importc, load.}
proc vkDeferredOperationJoinKHR*(device: VkDevice, operation: VkDeferredOperationKHR): VkResult {.importc, load.}

# Load VK_KHR_pipeline_executable_properties
proc vkGetPipelineExecutablePropertiesKHR*(device: VkDevice, pPipelineInfo: ptr VkPipelineInfoKHR        , pExecutableCount: ptr uint32 , pProperties: ptr VkPipelineExecutablePropertiesKHR ): VkResult {.importc, load.}
proc vkGetPipelineExecutableStatisticsKHR*(device: VkDevice, pExecutableInfo: ptr VkPipelineExecutableInfoKHR  , pStatisticCount: ptr uint32 , pStatistics: ptr VkPipelineExecutableStatisticKHR ): VkResult {.importc, load.}
proc vkGetPipelineExecutableInternalRepresentationsKHR*(device: VkDevice, pExecutableInfo: ptr VkPipelineExecutableInfoKHR  , pInternalRepresentationCount: ptr uint32 , pInternalRepresentations: ptr VkPipelineExecutableInternalRepresentationKHR ): VkResult {.importc, load.}

# Load VK_NV_device_generated_commands
proc vkGetGeneratedCommandsMemoryRequirementsNV*(device: VkDevice, pInfo: ptr VkGeneratedCommandsMemoryRequirementsInfoNV , pMemoryRequirements: ptr VkMemoryRequirements2 ): void {.importc, load.}
proc vkCmdPreprocessGeneratedCommandsNV*(commandBuffer: VkCommandBuffer, pGeneratedCommandsInfo: ptr VkGeneratedCommandsInfoNV ): void {.importc, load.}
proc vkCmdExecuteGeneratedCommandsNV*(commandBuffer: VkCommandBuffer, isPreprocessed: VkBool32, pGeneratedCommandsInfo: ptr VkGeneratedCommandsInfoNV ): void {.importc, load.}
proc vkCmdBindPipelineShaderGroupNV*(commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, pipeline: VkPipeline, groupIndex: uint32): void {.importc, load.}
proc vkCreateIndirectCommandsLayoutNV*(device: VkDevice, pCreateInfo: ptr VkIndirectCommandsLayoutCreateInfoNV , pAllocator: ptr VkAllocationCallbacks = nil , pIndirectCommandsLayout: ptr VkIndirectCommandsLayoutNV ): VkResult {.importc, load.}
proc vkDestroyIndirectCommandsLayoutNV*(device: VkDevice, indirectCommandsLayout: VkIndirectCommandsLayoutNV, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}

# Load VK_EXT_private_data
proc vkCreatePrivateDataSlotEXT*(device: VkDevice, pCreateInfo: ptr VkPrivateDataSlotCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pPrivateDataSlot: ptr VkPrivateDataSlotEXT ): VkResult {.importc, load.}
proc vkDestroyPrivateDataSlotEXT*(device: VkDevice, privateDataSlot: VkPrivateDataSlotEXT, pAllocator: ptr VkAllocationCallbacks = nil ): void {.importc, load.}
proc vkSetPrivateDataEXT*(device: VkDevice, objectType: VkObjectType, objectHandle: uint64, privateDataSlot: VkPrivateDataSlotEXT, data: uint64): VkResult {.importc, load.}
proc vkGetPrivateDataEXT*(device: VkDevice, objectType: VkObjectType, objectHandle: uint64, privateDataSlot: VkPrivateDataSlotEXT, pData: ptr uint64 ): void {.importc, load.}

# Load VK_KHR_synchronization2
proc vkCmdSetEvent2KHR*(commandBuffer: VkCommandBuffer, event: VkEvent, pDependencyInfo: ptr VkDependencyInfoKHR                          ): void {.importc, load.}
proc vkCmdResetEvent2KHR*(commandBuffer: VkCommandBuffer, event: VkEvent, stageMask: VkPipelineStageFlags2KHR): void {.importc, load.}
proc vkCmdWaitEvents2KHR*(commandBuffer: VkCommandBuffer, eventCount: uint32, pEvents: ptr VkEvent                     , pDependencyInfos: ptr VkDependencyInfoKHR         ): void {.importc, load.}
proc vkCmdPipelineBarrier2KHR*(commandBuffer: VkCommandBuffer, pDependencyInfo: ptr VkDependencyInfoKHR                                ): void {.importc, load.}
proc vkCmdWriteTimestamp2KHR*(commandBuffer: VkCommandBuffer, stage: VkPipelineStageFlags2KHR, queryPool: VkQueryPool, query: uint32): void {.importc, load.}
proc vkQueueSubmit2KHR*(queue: VkQueue, submitCount: uint32, pSubmits: ptr VkSubmitInfo2KHR           , fence: VkFence): VkResult {.importc, load.}
proc vkCmdWriteBufferMarker2AMD*(commandBuffer: VkCommandBuffer, stage: VkPipelineStageFlags2KHR, dstBuffer: VkBuffer, dstOffset: VkDeviceSize, marker: uint32): void {.importc, load.}
proc vkGetQueueCheckpointData2NV*(queue: VkQueue, pCheckpointDataCount: ptr uint32 , pCheckpointData: ptr VkCheckpointData2NV ): void {.importc, load.}

# Load VK_NV_fragment_shading_rate_enums
proc vkCmdSetFragmentShadingRateEnumNV*(commandBuffer: VkCommandBuffer, shadingRate: VkFragmentShadingRateNV, combinerOps: array[2, VkFragmentShadingRateCombinerOpKHR]): void {.importc, load.}

# Load VK_KHR_copy_commands2
proc vkCmdCopyBuffer2KHR*(commandBuffer: VkCommandBuffer, pCopyBufferInfo: ptr VkCopyBufferInfo2KHR ): void {.importc, load.}
proc vkCmdCopyImage2KHR*(commandBuffer: VkCommandBuffer, pCopyImageInfo: ptr VkCopyImageInfo2KHR ): void {.importc, load.}
proc vkCmdCopyBufferToImage2KHR*(commandBuffer: VkCommandBuffer, pCopyBufferToImageInfo: ptr VkCopyBufferToImageInfo2KHR ): void {.importc, load.}
proc vkCmdCopyImageToBuffer2KHR*(commandBuffer: VkCommandBuffer, pCopyImageToBufferInfo: ptr VkCopyImageToBufferInfo2KHR ): void {.importc, load.}
proc vkCmdBlitImage2KHR*(commandBuffer: VkCommandBuffer, pBlitImageInfo: ptr VkBlitImageInfo2KHR ): void {.importc, load.}
proc vkCmdResolveImage2KHR*(commandBuffer: VkCommandBuffer, pResolveImageInfo: ptr VkResolveImageInfo2KHR ): void {.importc, load.}

# Load VK_NV_acquire_winrt_display
proc vkAcquireWinrtDisplayNV*(physicalDevice: VkPhysicalDevice, display: VkDisplayKHR): VkResult {.importc, load.}
proc vkGetWinrtDisplayNV*(physicalDevice: VkPhysicalDevice, deviceRelativeId: uint32, pDisplay: ptr VkDisplayKHR ): VkResult {.importc, load.}

# Load VK_EXT_directfb_surface
proc vkCreateDirectFBSurfaceEXT*(instance: VkInstance, pCreateInfo: ptr VkDirectFBSurfaceCreateInfoEXT , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceDirectFBPresentationSupportEXT*(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, dfb: ptr IDirectFB ): VkBool32 {.importc, load.}

# Load VK_QNX_screen_surface
proc vkCreateScreenSurfaceQNX*(instance: VkInstance, pCreateInfo: ptr VkScreenSurfaceCreateInfoQNX , pAllocator: ptr VkAllocationCallbacks = nil , pSurface: ptr VkSurfaceKHR ): VkResult {.importc, load.}
proc vkGetPhysicalDeviceScreenPresentationSupportQNX*(physicalDevice: VkPhysicalDevice, queueFamilyIndex: uint32, window: ptr screen_window ): VkBool32 {.importc, load.}

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
