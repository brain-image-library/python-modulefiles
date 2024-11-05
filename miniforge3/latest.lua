--
-- miniforge3
--

whatis([[Name : miniforge3]])
whatis([[Version : latest]])
whatis([[Category : Open data science platform]])
whatis([[Description : Miniforge3 is a free and open-source distribution of the Python and R programming languages for scientific computing, that aims to simplify package management and deployment. Package versions are managed by the package management system conda. ]])

local os = require("os")

local directory = "~/.miniforge3"

local function directory_exists(path)
    local f = io.open(path, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

if not directory_exists(directory) then
    os.execute("mkdir -p " .. directory)
end

prepend_path("PATH","/bil/packages/miniforge3/latest/condabin")
prepend_path("PATH", "/bil/packages/miniforge3/latest/bin")
-- prepend_path("LD_LIBRARY_PATH","/bil/packages/miniforge3/latest/lib")
append_path("MANPATH", "/bil/packages/miniforge3/latest/man")
append_path("MANPATH", "/bil/packages/miniforge3/latest/share/man")
append_path("ACLOCAL_PATH", "/bil/packages/miniforge3/latest/share/aclocal")
append_path("C_INCLUDE_PATH", "/bil/packages/miniforge3/latest/include")
append_path("CPLUS_INCLUDE_PATH", "/bil/packages/miniforge3/latest/include")
append_path("INCLUDE", "/bil/packages/miniforge3/latest/include")
append_path("PKG_CONFIG_PATH", "/bil/packages/miniforge3/latest/lib/pkgconfig")
append_path("CMAKE_PREFIX_PATH", "/bil/packages/miniforge3/latest/")

execute { cmd = "source /bil/packages/miniforge3/latest/etc/profile.d/conda.sh", modeA = { "load" } }
execute { cmd = "conda activate", modeA = { "load" } }
execute { cmd = "conda deactivate", modeA = { "unload" } }
pushenv("CONDA_PKGS_DIRS", "$HOME/.miniforge3/pkgs/")