# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule LibOSXUnwind_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("LibOSXUnwind")
JLLWrappers.@generate_main_file("LibOSXUnwind", UUID("a83860b7-747b-57cf-bf1f-3e79990d037f"))
end  # module LibOSXUnwind_jll
