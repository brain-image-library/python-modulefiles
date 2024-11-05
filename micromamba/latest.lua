--
-- micromamba
--

whatis([[Name : micromamba]])
whatis([[Version : latest]])
whatis([[Category : Open data science platform]])
whatis([[Description : Micromamba is a free and open-source distribution of the Python and R programming languages for scientific computing, that aims to simplify package management and deployment. Package versions are managed by the package management system conda. ]])

local os = require("os")
local directory = "~/.micromamba/pkgs"

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

pushenv("MAMBA_ROOT_PREFIX", "~/.micromamba/pkgs/")

local package = "micromamba"
local version = "latest"
local base    = pathJoin("/bil/packages",package,version)
prepend_path("PATH", base)
