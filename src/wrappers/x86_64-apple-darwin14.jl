# Autogenerated wrapper script for LibOSXUnwind_jll for x86_64-apple-darwin14
export libosxunwind

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"

# Relative path to `libosxunwind`
const libosxunwind_splitpath = ["lib", "libosxunwind.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libosxunwind_path = ""

# libosxunwind-specific global declaration
# This will be filled out by __init__()
libosxunwind_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libosxunwind = "@rpath/libosxunwind.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LibOSXUnwind")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libosxunwind_path = normpath(joinpath(artifact_dir, libosxunwind_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libosxunwind_handle = dlopen(libosxunwind_path)
    push!(LIBPATH_list, dirname(libosxunwind_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

