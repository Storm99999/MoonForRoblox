local module = {}
shared.Thing = false

local HS = game:GetService"HttpService"

local request = request or http_request or syn and syn.request or function()
    end
local getAsset = syn and getsynasset or getcustomasset

local fontTable = {
    Minecraft = "https://github.com/MoeriiLua/fontNIGTHING/raw/main/Minecraft%20Regular.otf",
    SFDisplay = "https://github.com/Storm99999/Moon/raw/main/src/fonts/SFPRODISPLAYBOLD.OTF",
    GreyCliff = "https://github.com/Storm99999/Moon/raw/main/src/fonts/GreyCliff.otf"
}

if not isfolder"Fonts" then makefolder("Fonts") end

for i, v in next, fontTable do
    if isfile("Fonts/" .. i .. ".otf") then
    end
    writefile("Fonts/" .. i .. ".otf", request{Url = v, Method = "GET"}.Body)
end

module.setFont = function(font, textlabel)
    if fontTable[font] == nil then
        error("Font not found: " .. font)
    end
    if not isfile("Fonts/" .. font .. "Face.json") then
        writefile(
            "Fonts/" .. font .. "Face.json",
            HS:JSONEncode(
                {
                    name = font,
                    faces = {
                        {
                            name = "Regular",
                            weight = 300,
                            style = "normal",
                            assetId = getAsset("Fonts/" .. font .. ".otf")
                        }
                    }
                }
            )
        )
    end
    local decodeLol = HS:JSONDecode(readfile"Fonts/" .. font .. "Face.json")
    if decodeLol.faces[1].assetId ~= getAsset("Fonts/" .. font .. ".otf") then
        writefile(
            "Fonts/" .. font .. "Face.json",
            HS:JSONEncode(
                {
                    name = font,
                    faces = {
                        {
                            name = "Regular",
                            weight = 300,
                            style = "normal",
                            assetId = getAsset("Fonts/" .. font .. ".otf")
                        }
                    }
                }
            )
        )
    end
    textlabel.FontFace = Font.new(getAsset"Fonts/" .. font .. "Face.json")
end

shared.Thing = true

return module;