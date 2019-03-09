# vulkanim
Vulkan bindings for nim

# Features:
 * uses `distinct cint` instead of `enum` for the various vulkan constants, because nim's enums don't support duplicate values.
 * automatically converts FlagBit types to the appropriate Flags for convenience
 * includes a macro (called `vk`) to vulkan callbacks at runtime
