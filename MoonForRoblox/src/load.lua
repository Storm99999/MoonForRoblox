--[[
    Moon Main File - Storm
]]


local succ, err =
    pcall(
    function()
        local file_functions = {
            isfile,
            readfile,
            writefile,
            listfiles,
            appendfile
        }

        for func, _ in next, file_functions do
            if not func then
                return error("Moon is not supported by your executor, please use fluxus or synapse v3.")
            end
        end

        local request = http_request or request or HttpPost or syn.request or fluxus.request
        if not request then
            return error("Moon is not supported by your executor, please use fluxus or synapse v3.")
        end
    end
)

if not isfolder("MoonForRoblox") then
    return warn("[Moon @ Load]: MoonForRoblox folder is missing/corrupt.")
end

local MoonGlobal = {}
getgenv().Moon = MoonGlobal
MoonGlobal.FontManager = loadfile"MoonForRoblox/src/lib/fonts.lua"()
MoonGlobal.GuiLibrary = loadfile"MoonForRoblox/src/lib/uilib.lua"()

loadfile"MoonForRoblox/src/core/main.lua"()
loadfile"MoonForRoblox/src/lib/api/v2.lua"()
