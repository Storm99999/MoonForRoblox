--[[
    Moon Rewrite - Storm

    Additions:
      [+] Cleaner, more readable code
      [+] Un-neccessary code removal
      [+] Commented code, easier to understand what it does
]]


--> Inits
local Lol = Instance.new("ScreenGui", game:GetService"CoreGui")
local hudFolder = Instance.new("Folder", Lol)
--> Services
local replicatedService = game:GetService'ReplicatedStorage'
local CollService = game:GetService'CollectionService'
local ts = game:GetService'TweenService'
local runService = game:GetService'RunService'
--> Fetches
local HUD_IMPORT_OBJECT = game:GetObjects"rbxassetid://12176692693"[1]
local Followers = game:GetObjects"rbxassetid://14289122777"[1]
local Circle = game:GetObjects"rbxassetid://14871756509"[1]
--> Variables
local CS = ColorSequence
local CSKeypoint = ColorSequenceKeypoint
local antiVoidPosition = Vector3.zero
local LocalEntity = game.Players.LocalPlayer
local client = require(replicatedService.TS.remotes).default.Client
local KnitClient = debug.getupvalue(require(LocalEntity.PlayerScripts.TS.knit).setup, 6)
local circleDebounce = false

--> Extra
local supportFrame = game:GetObjects"rbxassetid://13119197703"[1]
local getmoonasset = function(asset) return ((syn and getsynasset) or getcustomasset)(asset) end
--> Fetching from github
writefile("paimon.webm", game:HttpGet"https://github.com/Storm99999/whitelistkeys/blob/main/paimon.webm?raw=true")
--> Sets
HUD_IMPORT_OBJECT.Parent = hudFolder
HUD_IMPORT_OBJECT.Visible = false
supportFrame.VideoFrame.Video = ""
supportFrame.VideoFrame.Draggable = true
supportFrame.VideoFrame["Bloxy Cola"].Video = getmoonasset"paimon.webm"
supportFrame.VideoFrame["Bloxy Cola"].Looped = true
supportFrame.VideoFrame["Bloxy Cola"].Playing = true
supportFrame.VideoFrame["Bloxy Cola"].Draggable = true
supportFrame.Enabled = false
supportFrame.Parent = game.CoreGui
supportFrame.VideoFrame["Bloxy Cola"].BorderSizePixel = 0
supportFrame.VideoFrame["Bloxy Cola"].BackgroundTransparency = 1
Circle.Parent = game.CoreGui
--> TargetHUD Fetches
local HUD_IMPORT_OBJECT2 = game:GetObjects"rbxassetid://13717970397"[1]
HUD_IMPORT_OBJECT2.Parent = hudFolder
HUD_IMPORT_OBJECT2.Visible = false
HUD_IMPORT_OBJECT2.Position = HUD_IMPORT_OBJECT.Position -- had to

local HUD_IMPORT_OBJECT3 = game:GetObjects"rbxassetid://13842544797"[1]
HUD_IMPORT_OBJECT3.Parent = hudFolder
HUD_IMPORT_OBJECT3.Visible = false
HUD_IMPORT_OBJECT3.Position = HUD_IMPORT_OBJECT.Position -- had to

local HUD_IMPORT_OBJECT4 = game:GetObjects"rbxassetid://13842550264"[1]
HUD_IMPORT_OBJECT4.Parent = hudFolder
HUD_IMPORT_OBJECT4.Visible = false
HUD_IMPORT_OBJECT4.Position = HUD_IMPORT_OBJECT.Position -- had to

local HUD_IMPORT_OBJECT5 = game:GetObjects"rbxassetid://13842548308"[1]
HUD_IMPORT_OBJECT5.Parent = hudFolder
HUD_IMPORT_OBJECT5.Visible = false
HUD_IMPORT_OBJECT5.Position = HUD_IMPORT_OBJECT.Position -- had to

local HUD_IMPORT_OBJECT6 = game:GetObjects"rbxassetid://14030972754"[1]
HUD_IMPORT_OBJECT6.Parent = hudFolder
HUD_IMPORT_OBJECT6.Visible = false
HUD_IMPORT_OBJECT6.Position = HUD_IMPORT_OBJECT.Position -- had to

local HUD_IMPORT_OBJECT7 = game:GetObjects"rbxassetid://14689152448"[1]
HUD_IMPORT_OBJECT7.Parent = hudFolder
HUD_IMPORT_OBJECT7.Visible = false
HUD_IMPORT_OBJECT7.Position = HUD_IMPORT_OBJECT.Position -- had to

local HUD_IMPORT_OBJECT8 = game:GetObjects"rbxassetid://14925245852"[1]
HUD_IMPORT_OBJECT8.Parent = hudFolder
HUD_IMPORT_OBJECT8.Visible = false
HUD_IMPORT_OBJECT8.Position = HUD_IMPORT_OBJECT.Position -- had to
local main = HUD_IMPORT_OBJECT8
--> UI Fixups
local astolfoColors = {
    Color3.fromRGB(180, 114, 255),
    Color3.fromRGB(98, 98, 255),
    Color3.fromRGB(117, 241, 255)
}
local rightColor = 1
local lastChange = tick()
local function createSequence(args)
    local seq =
        CS.new(
        {
            CSKeypoint.new(0, args.c1),
            CSKeypoint.new(1, args.c2)
        }
    )
    return seq
end

local fadeLoop =
    coroutine.create(
    function()
        while runService.Heartbeat:Wait() do
            for i = 0.1, 0.4, 0.001 do
                local r = math.clamp(1 - i, 0, 1)
                local l = math.clamp(0.9 - i, 0, 1)

                local hsvColor1, hsvColor2 = Color3.fromHSV(r, 0.5, 1), Color3.fromHSV(l, 0.5, 1)
                -- wtf was i smoking when i made this shit
                main.UIGradient.Color = createSequence{c1 = hsvColor1, c2 = hsvColor2}
                main.Glow.UIGradient.Color = createSequence{c1 = hsvColor1, c2 = hsvColor2}
                main.UIStroke.UIGradient.Color = createSequence{c1 = hsvColor1, c2 = hsvColor2}
                if lua_library.Constants.uifix and lua_library.Constants.uifixmode == "Nova" then
                    for _, v in next, LocalEntity.PlayerGui.hotbar:GetDescendants() do
                        if v:IsA"Frame" then
                            if v:FindFirstChildOfClass"ImageButton" then
                                if not v:FindFirstChildOfClass("ImageButton"):FindFirstChild"UICorner" then
                                    Instance.new("UICorner", v:FindFirstChildOfClass"ImageButton")
                                end
                                if not v:FindFirstChildOfClass"ImageButton":FindFirstChild"UIGradient" then
                                    Instance.new("UIGradient", v:FindFirstChildOfClass"ImageButton")
                                end
                                if v:FindFirstChildOfClass"ImageButton":FindFirstChild("1") then
                                    v:FindFirstChildOfClass"ImageButton"["1"]:Destroy()
                                end
                                if not v:FindFirstChildOfClass"ImageButton":FindFirstChild"GradientStroke" then
                                    local stroke = Instance.new("UIStroke", v:FindFirstChildOfClass"ImageButton")
                                    stroke.Thickness = 1
                                    stroke.Color = Color3.fromRGB(255, 255, 255)
                                    stroke.Transparency = 0.5
                                    stroke.Name = "GradientStroke"
                                    local grad = Instance.new("UIGradient", stroke)
                                    grad.Rotation = 0
                                end
                                v:FindFirstChildOfClass"ImageButton".BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                v:FindFirstChildOfClass"ImageButton".ImageColor3 = Color3.fromRGB(255, 255, 255)

                                if v:FindFirstChildOfClass"ImageButton":FindFirstChildOfClass"UIGradient" ~= nil then
                                    v:FindFirstChildOfClass"ImageButton":FindFirstChildOfClass"UIGradient".Rotation =
                                        0
                                    v:FindFirstChildOfClass"ImageButton":FindFirstChildOfClass"UIGradient".Color =
                                        createSequence{c1 = hsvColor1, c2 = hsvColor2}
                                    v:FindFirstChildOfClass"ImageButton":FindFirstChild"GradientStroke":FindFirstChildOfClass(
                                            "UIGradient"
                                        ).Color = createSequence{c1 = hsvColor1, c2 = hsvColor2}
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
            for i = 0.6, 0.9, 0.001 do
                local r = math.clamp(i, 0, 1)
                local l = math.clamp(i - 0.1, 0, 1)

                local hsvColor1, hsvColor2 = Color3.fromHSV(r, 0.5, 1), Color3.fromHSV(l, 0.5, 1)

                main.UIGradient.Color = createSequence({c1 = hsvColor1, c2 = hsvColor2})
                main.Glow.UIGradient.Color = createSequence({c1 = hsvColor1, c2 = hsvColor2})
                main.UIStroke.UIGradient.Color = createSequence({c1 = hsvColor1, c2 = hsvColor2})

                --> Stage 5 Eye Cancer
                if lua_library.Constants.uifix and lua_library.Constants.uifixmode == "Nova" then
                    for _, v in next, LocalEntity.PlayerGui.hotbar:GetDescendants() do
                        if v:IsA"Frame" then
                            if v:FindFirstChildOfClass"ImageButton" then
                                if not v:FindFirstChildOfClass"ImageButton":FindFirstChild"UICorner" then
                                    Instance.new("UICorner", v:FindFirstChildOfClass"ImageButton")
                                end
                                if not v:FindFirstChildOfClass"ImageButton":FindFirstChild"UIGradient" then
                                    Instance.new("UIGradient", v:FindFirstChildOfClass"ImageButton")
                                end
                                if v:FindFirstChildOfClass"ImageButton":FindFirstChild"1" then
                                    v:FindFirstChildOfClass"ImageButton"["1"]:Destroy()
                                end
                                if not v:FindFirstChildOfClass"ImageButton":FindFirstChild"GradientStroke" then
                                    local stroke = Instance.new("UIStroke", v:FindFirstChildOfClass"ImageButton")
                                    stroke.Thickness = 1
                                    stroke.Color = Color3.fromRGB(255, 255, 255)
                                    stroke.Transparency = 0.5
                                    stroke.Name = "GradientStroke"
                                    local grad = Instance.new("UIGradient", stroke)
                                    grad.Rotation = 0
                                end
                                v:FindFirstChildOfClass"ImageButton".BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                v:FindFirstChildOfClass"ImageButton".ImageColor3 = Color3.fromRGB(255, 255, 255)

                                if v:FindFirstChildOfClass"ImageButton":FindFirstChildOfClass"UIGradient" ~= nil then
                                    v:FindFirstChildOfClass"ImageButton":FindFirstChildOfClass"UIGradient".Rotation =
                                        0
                                    v:FindFirstChildOfClass"ImageButton":FindFirstChildOfClass"UIGradient".Color =
                                        createSequence{c1 = hsvColor1, c2 = hsvColor2}
                                    v:FindFirstChildOfClass"ImageButton":FindFirstChild"GradientStroke":FindFirstChildOfClass(
                                            "UIGradient"
                                        ).Color = createSequence{c1 = hsvColor1, c2 = hsvColor2}
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    end
)

coroutine.resume(fadeLoop)

--> Skyboxes Init
local Skyboxes = {
    ["Purple Nebula"] = {
        ["SkyboxBk"] = "rbxassetid://159454299",
        ["SkyboxDn"] = "rbxassetid://159454296",
        ["SkyboxFt"] = "rbxassetid://159454293",
        ["SkyboxLf"] = "rbxassetid://159454286",
        ["SkyboxRt"] = "rbxassetid://159454300",
        ["SkyboxUp"] = "rbxassetid://159454288"
    },
    ["Night Sky"] = {
        ["SkyboxBk"] = "rbxassetid://12064107",
        ["SkyboxDn"] = "rbxassetid://12064152",
        ["SkyboxFt"] = "rbxassetid://12064121",
        ["SkyboxLf"] = "rbxassetid://12063984",
        ["SkyboxRt"] = "rbxassetid://12064115",
        ["SkyboxUp"] = "rbxassetid://12064131"
    },
    ["Pink Daylight"] = {
        ["SkyboxBk"] = "rbxassetid://271042516",
        ["SkyboxDn"] = "rbxassetid://271077243",
        ["SkyboxFt"] = "rbxassetid://271042556",
        ["SkyboxLf"] = "rbxassetid://271042310",
        ["SkyboxRt"] = "rbxassetid://271042467",
        ["SkyboxUp"] = "rbxassetid://271077958"
    },
    ["Morning Glow"] = {
        ["SkyboxBk"] = "rbxassetid://1417494030",
        ["SkyboxDn"] = "rbxassetid://1417494146",
        ["SkyboxFt"] = "rbxassetid://1417494253",
        ["SkyboxLf"] = "rbxassetid://1417494402",
        ["SkyboxRt"] = "rbxassetid://1417494499",
        ["SkyboxUp"] = "rbxassetid://1417494643"
    },
    ["Setting Sun"] = {
        ["SkyboxBk"] = "rbxassetid://626460377",
        ["SkyboxDn"] = "rbxassetid://626460216",
        ["SkyboxFt"] = "rbxassetid://626460513",
        ["SkyboxLf"] = "rbxassetid://626473032",
        ["SkyboxRt"] = "rbxassetid://626458639",
        ["SkyboxUp"] = "rbxassetid://626460625"
    },
    ["Fade Blue"] = {
        ["SkyboxBk"] = "rbxassetid://153695414",
        ["SkyboxDn"] = "rbxassetid://153695352",
        ["SkyboxFt"] = "rbxassetid://153695452",
        ["SkyboxLf"] = "rbxassetid://153695320",
        ["SkyboxRt"] = "rbxassetid://153695383",
        ["SkyboxUp"] = "rbxassetid://153695471"
    },
    ["Elegant Morning"] = {
        ["SkyboxBk"] = "rbxassetid://153767241",
        ["SkyboxDn"] = "rbxassetid://153767216",
        ["SkyboxFt"] = "rbxassetid://153767266",
        ["SkyboxLf"] = "rbxassetid://153767200",
        ["SkyboxRt"] = "rbxassetid://153767231",
        ["SkyboxUp"] = "rbxassetid://153767288"
    },
    ["Neptune"] = {
        ["SkyboxBk"] = "rbxassetid://218955819",
        ["SkyboxDn"] = "rbxassetid://218953419",
        ["SkyboxFt"] = "rbxassetid://218954524",
        ["SkyboxLf"] = "rbxassetid://218958493",
        ["SkyboxRt"] = "rbxassetid://218957134",
        ["SkyboxUp"] = "rbxassetid://218950090"
    },
    ["Redshift"] = {
        ["SkyboxBk"] = "rbxassetid://401664839",
        ["SkyboxDn"] = "rbxassetid://401664862",
        ["SkyboxFt"] = "rbxassetid://401664960",
        ["SkyboxLf"] = "rbxassetid://401664881",
        ["SkyboxRt"] = "rbxassetid://401664901",
        ["SkyboxUp"] = "rbxassetid://401664936"
    },
    ["Aesthetic Night"] = {
        ["SkyboxBk"] = "rbxassetid://1045964490",
        ["SkyboxDn"] = "rbxassetid://1045964368",
        ["SkyboxFt"] = "rbxassetid://1045964655",
        ["SkyboxLf"] = "rbxassetid://1045964655",
        ["SkyboxRt"] = "rbxassetid://1045964655",
        ["SkyboxUp"] = "rbxassetid://1045962969"
    }
}

--> Session Stats, Watermarks Init
local watermarks = {}
local sessioninfos = {}
local sessiondata = {hours = 0, mins = 0, secs = 0, kills = 0, reports = 0}
local watermarkGUI = Instance.new("ScreenGui", game:GetService"CoreGui")
watermarkGUI.ZIndexBehavior = "Global"

pcall(
    function()
        if isfile("sessdata.txt") then
            sessiondata = game:GetService"HttpService":JSONDecode(readfile"sessdata.txt")
        else
            writefile("sessdata.txt", "")
        end
    end
)

task.spawn(
    function()
        local sessioninf = game:GetObjects"rbxassetid://9983357080"[1]
        sessioninf.Parent = watermarkGUI
        sessioninf.Visible = false
        sessioninfos["Meteor"] = sessioninf
    end
)

task.spawn(
    function()
        local sessioninf = game:GetObjects"rbxassetid://14926213627"[1]
        sessioninf.Parent = watermarkGUI
        sessioninf.Visible = false
        sessioninfos["Moon"] = sessioninf
        local UserInputService = game:GetService"UserInputService"

        local gui = sessioninf

        local dragging
        local dragInput
        local dragStart
        local startPos

        function Lerp(a, b, m)
            return a + (b - a) * m
        end

        local lastMousePos
        local lastGoalPos
        local DRAG_SPEED = (8) -- // The speed of the UI drag
        function Update(dt)
            if not (startPos) then
                return
            end
            if not (dragging) and (lastGoalPos) then
                gui.Position =
                    UDim2.new(
                    startPos.X.Scale,
                    Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED),
                    startPos.Y.Scale,
                    Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED)
                )
                return
            end

            local delta = (lastMousePos - UserInputService:GetMouseLocation())
            local xGoal = (startPos.X.Offset - delta.X)
            local yGoal = (startPos.Y.Offset - delta.Y)
            lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
            gui.Position =
                UDim2.new(
                startPos.X.Scale,
                Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED),
                startPos.Y.Scale,
                Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED)
            )
        end

        gui.InputBegan:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseButton1 or
                        input.UserInputType == Enum.UserInputType.Touch
                 then
                    dragging = true
                    dragStart = input.Position
                    startPos = gui.Position
                    lastMousePos = UserInputService:GetMouseLocation()

                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                dragging = false
                            end
                        end
                    )
                end
            end
        )

        gui.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                        input.UserInputType == Enum.UserInputType.Touch
                 then
                    dragInput = input
                end
            end
        )

        runService.Heartbeat:Connect(Update)
    end
)

task.spawn(
    function()
        local sessioninf = game:GetObjects"rbxassetid://9902487114"[1]
        sessioninf.Parent = watermarkGUI
        sessioninf.Visible = false
        sessioninfos["Prism"] = sessioninf
        local button = sessioninf.Frame
        local gradient = button.UIGradient
        local ti = TweenInfo.new(1.6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
        local offset1 = {Offset = Vector2.new(1, 0)}
        local create = ts:Create(gradient, ti, offset1)
        local startingPos = Vector2.new(-1, 0)
        local addWait = .36
        local function animate()
            create:Play()
            create.Completed:Wait()
            gradient.Offset = startingPos
            create:Play()
            create.Completed:Wait()
            gradient.Offset = startingPos
            task.wait(addWait)
            animate()
        end
        animate()
    end
)
local tenacityGradients = {
    Pink = CS.new(
        {
            CSKeypoint.new(0, Color3.fromRGB(255, 170, 255)),
            CSKeypoint.new(1, Color3.fromRGB(85, 170, 255))
        }
    ),
    Tropical = CS.new(
        {
            CSKeypoint.new(0, Color3.fromRGB(89, 238, 207)),
            CSKeypoint.new(1, Color3.fromRGB(0, 141, 248))
        }
    )
}
task.spawn(
    function()
        local TextLabel = Instance.new"TextLabel"
        local Glow2 = Instance.new"ImageLabel"
        local UIGradient = Instance.new"UIGradient"
        local Glow1 = Instance.new"ImageLabel"
        local UIGradient_2 = Instance.new"UIGradient"
        local UIGradient_3 = Instance.new"UIGradient"
        local temp = "Tropical"

        TextLabel.Parent = watermarkGUI
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0.0656934232, 0, 0.064927876, 0)
        TextLabel.Size = UDim2.new(0.104275286, 0, 0.055493895, 0)
        TextLabel.ZIndex = 0
        TextLabel.Font = Enum.Font.Unknown
        TextLabel.Text = "Tenacity"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextScaled = true
        TextLabel.TextSize = 14
        TextLabel.TextWrapped = true
        Moon.FontManager.setFont("GreyCliff", TextLabel)
        Glow2.Name = "Glow2"
        Glow2.Parent = TextLabel
        Glow2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Glow2.BackgroundTransparency = 1
        Glow2.Position = UDim2.new(0.740000188, 0, -0.459999532, 0)
        Glow2.Size = UDim2.new(0.469999999, 0, 1.16796291, 0)
        Glow2.ZIndex = 0
        Glow2.Image = "http://www.roblox.com/asset/?id=9313765710"
        Glow2.ImageTransparency = 0.75

        UIGradient.Color = tenacityGradients[temp]
        UIGradient.Parent = Glow2

        Glow1.Name = "Glow1"
        Glow1.Parent = TextLabel
        Glow1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Glow1.BackgroundTransparency = 1
        Glow1.Position = UDim2.new(-0.454999834, 0, -0.319999993, 0)
        Glow1.Size = UDim2.new(1.89999998, 0, 1.74267483, 0)
        Glow1.ZIndex = 0
        Glow1.Image = "http://www.roblox.com/asset/?id=9313765710"
        Glow1.ImageTransparency = 0.25

        UIGradient_2.Color = tenacityGradients[temp]
        UIGradient_2.Parent = Glow1

        UIGradient_3.Color = tenacityGradients[temp]
        UIGradient_3.Parent = TextLabel

        watermarks["tenacity"] = TextLabel
        TextLabel.Visible = true
        Moon.FontManager.setFont("GreyCliff", TextLabel)
    end
)

task.spawn(
    function()
        local watermark = game:GetObjects"rbxassetid://13987520095"[1]
        watermark.Parent = watermarkGUI
        watermark.Inner.Data.Text = "moonclient.xyz | " .. os.date("%x") .. " | dev"
        watermark.Visible = false
        watermarks["skeet"] = watermark
        local button = watermark.Inner.line
        local gradient = button.UIGradient
        local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local offset = {Offset = Vector2.new(1, 0)}
        local create = ts:Create(gradient, ti, offset)
        local startingPos = Vector2.new(-1, 0)
        local list = {}
        local s, kpt = CS.new, CSKeypoint.new
        local counter = 0
        local status = "down"
        gradient.Offset = startingPos
        local function rainbowColors()
            local sat, val = 255, 255
            for i = 1, 15 do
                local hue = i * 17
                table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))
            end
        end
        rainbowColors()
        gradient.Color =
            s(
            {
                kpt(0, list[#list]),
                kpt(0.5, list[#list - 1]),
                kpt(1, list[#list - 2])
            }
        )
        counter = #list
        local function animate()
            create:Play()
            create.Completed:Wait()
            gradient.Offset = startingPos
            gradient.Rotation = 180
            if counter == #list - 1 and status == "down" then
                gradient.Color =
                    s(
                    {
                        kpt(0, gradient.Color.Keypoints[1].Value),
                        kpt(0.5, list[#list]),
                        kpt(1, list[1])
                    }
                )
                counter = 1
                status = "up"
            elseif counter == #list and status == "down" then
                gradient.Color =
                    s(
                    {
                        kpt(0, gradient.Color.Keypoints[1].Value),
                        kpt(0.5, list[1]),
                        kpt(1, list[2])
                    }
                )
                counter = 2
                status = "up"
            elseif counter <= #list - 2 and status == "down" then
                gradient.Color =
                    s(
                    {
                        kpt(0, gradient.Color.Keypoints[1].Value),
                        kpt(0.5, list[counter + 1]),
                        kpt(1, list[counter + 2])
                    }
                )
                counter = counter + 2
                status = "up"
            end
            create:Play()
            create.Completed:Wait()
            gradient.Offset = startingPos
            gradient.Rotation = 0
            if counter == #list - 1 and status == "up" then
                gradient.Color =
                    s(
                    {
                        kpt(0, list[1]),
                        kpt(0.5, list[#list]),
                        kpt(1, gradient.Color.Keypoints[3].Value)
                    }
                )
                counter = 1
                status = "down"
            elseif counter == #list and status == "up" then
                gradient.Color =
                    s(
                    {
                        kpt(0, list[2]),
                        kpt(0.5, list[1]),
                        kpt(1, gradient.Color.Keypoints[3].Value)
                    }
                )
                counter = 2
                status = "down"
            elseif counter <= #list - 2 and status == "up" then
                gradient.Color =
                    s(
                    {
                        kpt(0, list[counter + 2]),
                        kpt(0.5, list[counter + 1]),
                        kpt(1, gradient.Color.Keypoints[3].Value)
                    }
                )
                counter = counter + 2
                status = "down"
            end
            animate()
        end
        animate()
    end
)

task.spawn(
    function()
        local watermark = game:GetObjects"rbxassetid://14257233079"[1]
        watermark.Parent = watermarkGUI
        watermark.TextLabel.Text =
            "  Moon <font color='#808080'>│</font> dev build <font color='#808080'>│</font> Instances: " ..
            #game:GetDescendants()
        watermarks["neverlose"] = watermark
        watermark.Visible = false
    end
)

task.spawn(
    function()
        local watermark = game:GetObjects"rbxassetid://9893467535"[1]
        watermark.Parent = watermarkGUI
        watermarks["moon"] = watermark
        watermark.Visible = false
    end
)

task.spawn(function() local watermark = game:GetObjects"rbxassetid://14257314231"[1] watermark.Parent = watermarkGUI watermarks["novoline"] = watermark watermark.Visible = false end)


--> Module Fetching
local Modules = {
    Sprint = require(
        LocalEntity.PlayerScripts.TS.controllers["global"].sprint["sprint-controller"]
    ).SprintController,
    ItemHandle = debug.getupvalue(require(replicatedService.TS.item["item-meta"]).getItemMeta, 1),
    BlockController2 = require(
        replicatedService["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement[
            "block-placer"
        ]
    ).BlockPlacer,
    BlockController = require(
        replicatedService["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out
    ).BlockEngine,
    BlockEngine = require(LocalEntity.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
    Shop = debug.getupvalue(
        debug.getupvalue(
            require(game.ReplicatedStorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem,
            1
        ),
        2
    ),
    Balloon = KnitClient.Controllers.BalloonController,
    Viewmodel = KnitClient.Controllers.ViewmodelController,
    ReachRequire = require(replicatedService.TS.combat["combat-constant"]).CombatConstant,
    InventoryUtil = require(replicatedService.TS.inventory["inventory-util"]).InventoryUtil,
    ItemTable = debug.getupvalue(require(game.ReplicatedStorage.TS.item["item-meta"]).getItemMeta, 1)
}

--> Remote Fetching
local Remotes = {
    AttackPacket = replicatedService.rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.SwordHit,
    Knockback = debug.getupvalue(
        require(replicatedService.TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity,
        1
    )
}

--> Essential Functions
function GetAliveState()
    if LocalEntity.Character and LocalEntity.Character:FindFirstChild "Humanoid" then
        if
            LocalEntity.Character.Humanoid.Health > 0 and
                LocalEntity.Character:FindFirstChild "HumanoidRootPart"
         then
            return true
        end
    end
end

function IsThatGuyAlive(who)
    if who.Character and who.Character:FindFirstChild "Humanoid" then
        if who.Character.Humanoid.Health > 0 and who.Character:FindFirstChild "HumanoidRootPart" then
            return true
        end
    end
end

function ShootProjectile(item, ammo, target)
    local args = {
        [1] = game.ReplicatedStorage.Inventories[LocalEntity.Name]:FindFirstChild(item),
        [2] = ammo,
        [3] = ammo,
        [4] = target.HumanoidRootPart.Position,
        [5] = target.HumanoidRootPart.Position,
        [6] = Vector3.new(0, -30, 0),
        [7] = game:GetService("HttpService"):GenerateGUID(true),
        [8] = {
            ["drawDurationSeconds"] = 0.9719230972696096,
            ["shotId"] = game:GetService("HttpService"):GenerateGUID(false)
        },
        [9] = (workspace:GetServerTimeNow() - 0.11)
    }

    replicatedService.rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ProjectileFire:InvokeServer(
        unpack(args)
    )
end

function GetNearPlayer(dist)
    local character = nil
    local charactermindistance = math.huge
    for _, v in next, game.Players:GetPlayers() do
        if v.Team ~= LocalEntity.Team and v ~= LocalEntity and IsThatGuyAlive(v) then
            local Distance =
                (LocalEntity.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
            if (Distance < dist) and (Distance < charactermindistance) then
                character = v.Character
                charactermindistance = Distance
            end
        end
    end
    return character
end

function GetInventory(blackboy)
    blackboy = blackboy or LocalEntity
    return Modules.InventoryUtil.getInventory(blackboy).items
end

local params = RaycastParams.new()
params.IgnoreWater = true
function DestroyBed(part)
    local raycastResult = workspace:Raycast(part.Position + Vector3.new(0, 24, 0), Vector3.new(0, -27, 0), params)
    if raycastResult then
        local targetblock = raycastResult.Instance
        replicatedService.rbxts_include.node_modules["@easy-games"]["block-engine"]["node_modules"][
            "@rbxts"
        ]["net"]["out"]["_NetManaged"].DamageBlock:InvokeServer(
            {
                ["blockRef"] = {
                    ["blockPosition"] = Vector3.new(
                        targetblock.Position.X / 3,
                        targetblock.Position.Y / 3,
                        targetblock.Position.Z / 3
                    )
                },
                ["hitPosition"] = Vector3.new(
                    targetblock.Position.X / 3,
                    targetblock.Position.Y / 3,
                    targetblock.Position.Z / 3
                ),
                ["hitNormal"] = Vector3.new(
                    targetblock.Position.X / 3,
                    targetblock.Position.Y / 3,
                    targetblock.Position.Z / 3
                )
            }
        )
    end
end

-- thanks to moerii for reminding me CollectionService exists
function StealChests()
    for _, chest in next, CollService:GetTagged("chest") do
        if (localEntity.Character.HumanoidRootPart.Position-chest.Position).Magnitude <= 27 then
            if chest:FindFirstChild"ChestFolderValue" and chest:FindFirstChild"ChestFolderValue".Value ~= nil then
                local chestModel = chest:FindFirstChild"ChestFolderValue".Value

                if (#chestModel:GetChildren() > 0) then
                    client:GetNamespace"Inventory":Get"SetObservedChest":SendToServer(chestModel);
                    for _, item in next, chestModel:GetChildren() do if item:IsA"Accessory" then client:GetNamespace"Inventory":Get"ChestGetItem":CallServer(chestModel, item); task.wait(0.1) end end
                end

                client:GetNamespace"Inventory":Get"SetObservedChest":SendToServer()
            end
        end
    end
end


function getBlock()
    local ItemTable = debug.getupvalue(require(game.ReplicatedStorage.TS.item["item-meta"]).getItemMeta, 1)
    for _, v in next, GetInventory() do
        if ItemTable[v.itemType].block ~= nil then
            return v.itemType, v.amount
        end
    end
end
local blocktable = Modules.BlockController2.new(Modules.BlockEngine, getBlock())
local block, amount

function FetchBeds()
    local beds = {}
    for _, v in next, workspace:GetChildren() do
        if
            string.lower(v.Name) == "bed" and v:FindFirstChild"Covers" ~= nil and
                v:FindFirstChild"Covers".BrickColor ~= LocalEntity.Team.TeamColor
         then
            table.insert(beds, v)
        end
    end
    return beds
end

function placeBlock(vec3)
    blocktable:placeBlock(vec3)
end

--> Hit Particles Init
local hitassets = game:GetObjects"rbxassetid://12439219837"[1]
hitassets.Parent = game.ReplicatedStorage

local RealParticles = {
    Tenacity = hitassets:WaitForChild "Tenacity":FindFirstChild("ParticleEmitter"),
    Glint = hitassets:WaitForChild "Glint":FindFirstChild("ParticleEmitter"),
    Hearts = hitassets:WaitForChild "Hearts":FindFirstChild("ParticleEmitter"),
    Critical = hitassets:WaitForChild "Critical":FindFirstChild("ParticleEmitter")
}
warn("[Moon]: Particles passed", "OK!")

function hasItem(item)
    if GetInventory() ~= nil and table.find(GetInventory(), item) then
        return true
    end

    return false
end

function GetSword()
    local dmg = 0
    local sword = nil
    for i, v in next, GetInventory() do
        if
            v.itemType:lower():find"sword" or v.itemType:lower():find"scythe" or v.itemType:lower():find"blade" or
                v.itemType:lower():find"dagger" or
                v.itemType:lower():find"hammer"
         then
            if Modules.ItemTable[v.itemType].sword.damage > dmg then
                sword = v.tool
            end
        end
    end
    return sword
end

function GetCurrentMap()
    for _, v in next, workspace:GetChildren() do
        if (v.Name == "Map") then
            if v:FindFirstChild"Worlds" then
                for __, vee in next, v.Worlds:GetChildren() do
                    if vee.Name ~= "Void_World" then
                        return vee.Name
                    end
                end
            end
        end
    end
end

--> Killaura Animations
local Animations = {
    ["Normal"] = {
        {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.05},
        {CFrame = CFrame.new(0.69, -0.71, 0.6) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.05}
    },
    ["Smooth"] = {
        {CFrame = CFrame.new(1, 0, 0.5) * CFrame.Angles(math.rad(-90), math.rad(60), math.rad(-60)), Time = 0.2},
        {CFrame = CFrame.new(1, -0.2, -0.5) * CFrame.Angles(math.rad(-160), math.rad(60), math.rad(-30)), Time = 0.12}
    },
    ["Slow"] = {
        {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.15},
        {CFrame = CFrame.new(0.69, -0.71, 0.6) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.15}
    },
    ["1.8"] = {
        {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(-65), math.rad(55), math.rad(-51)), Time = 0.12},
        {CFrame = CFrame.new(0.16, -1.16, 1) * CFrame.Angles(math.rad(-179), math.rad(54), math.rad(33)), Time = 0.12}
    },
    ["Blocking"] = {
        {
            CFrame = CFrame.new(-0.01, -3.51, -2.01) * CFrame.Angles(math.rad(-180), math.rad(85), math.rad(-180)),
            Time = 0
        }
    },
    ["Swag2"] = {
        {CFrame = CFrame.new(-0.3, -0.53, -0.6) * CFrame.Angles(math.rad(160), math.rad(127), math.rad(90)), Time = 0.1},
        {
            CFrame = CFrame.new(-0.3, -0.53, -0.6) * CFrame.Angles(math.rad(160), math.rad(127), math.rad(90)),
            Time = 0.13
        },
        {CFrame = CFrame.new(-0.27, -0.8, -1.2) * CFrame.Angles(math.rad(160), math.rad(90), math.rad(90)), Time = 0.13},
        {
            CFrame = CFrame.new(-0.01, -0.65, -0.8) * CFrame.Angles(math.rad(160), math.rad(111), math.rad(90)),
            Time = 0.13
        }
    },
    ["Kawaii"] = {
        {CFrame = CFrame.new(-0.01, 0.49, -1.51) * CFrame.Angles(math.rad(90), math.rad(45), math.rad(-90)), Time = 0},
        {
            CFrame = CFrame.new(-0.01, 0.49, -1.51) * CFrame.Angles(math.rad(-51), math.rad(48), math.rad(24)),
            Time = 0.06
        },
        {
            CFrame = CFrame.new(-0.01, 0.49, -1.51) * CFrame.Angles(math.rad(90), math.rad(45), math.rad(-90)),
            Time = 0.06
        }
    },
    ["Swank"] = {
        {CFrame = CFrame.new(-0.01, -.45, -0.7) * CFrame.Angles(math.rad(-0), math.rad(85), math.rad(0)), Time = 0.1},
        {CFrame = CFrame.new(-0.02, -.45, -0.7) * CFrame.Angles(math.rad(59), math.rad(19), math.rad(-37)), Time = 0.09}
    },
    ["Swank2"] = {
        {CFrame = CFrame.new(0.7, -0.7, 0.6) * CFrame.Angles(math.rad(-16), math.rad(60), math.rad(-80)), Time = 0.09},
        {CFrame = CFrame.new(0.7, -0.7, 0.6) * CFrame.Angles(math.rad(-16), math.rad(60), math.rad(-80)), Time = 0.09},
        {
            CFrame = CFrame.new(0.95, -1.06, -2.25) * CFrame.Angles(math.rad(-179), math.rad(61), math.rad(80)),
            Time = 0.15
        }
    },
    ["TenacityOld2"] = {
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(25), math.rad(-60)), Time = 0.1},
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-40), math.rad(40), math.rad(-90)), Time = 0.1},
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(55), math.rad(-115)), Time = 0.1},
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-50), math.rad(70), math.rad(-60)), Time = 0.1},
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(70), math.rad(-70)), Time = 0.1}
    },
    ["OldSwank3"] = {
        {CFrame = CFrame.new(1, -1, 2) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.4},
        {CFrame = CFrame.new(-1, 1, -2.2) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.4}
    },
    ["TenacityOld"] = {
        {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(-math.rad(190), math.rad(110), -math.rad(90)), Time = 0.3},
        {CFrame = CFrame.new(0.3, -2, 2) * CFrame.Angles(math.rad(120), math.rad(140), math.rad(320)), Time = 0.3}
    },
    ["AstolfoNew"] = {
        {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(-math.rad(190), math.rad(110), -math.rad(90)), Time = 0.3}
    },
    ["Exhibition Old"] = {
        {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(50), math.rad(-90)), Time = 0.15},
        {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(50), math.rad(-90)), Time = 0.05},
        {CFrame = CFrame.new(0.7, -0.71, 0.59) * CFrame.Angles(math.rad(-84), math.rad(50), math.rad(-38)), Time = 0.1},
        {CFrame = CFrame.new(0.7, -0.71, 0.59) * CFrame.Angles(math.rad(-84), math.rad(50), math.rad(-38)), Time = 0.05},
        {CFrame = CFrame.new(0.63, -0.1, 1.37) * CFrame.Angles(math.rad(-84), math.rad(50), math.rad(-38)), Time = 0.15}
    },
    ["Exhibition"] = {
        {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(50), math.rad(-90)), Time = 0.1},
        {CFrame = CFrame.new(0.7, -0.71, 0.59) * CFrame.Angles(math.rad(-84), math.rad(50), math.rad(-38)), Time = 0.2}
    },
    ["Sigma"] = {
        {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.05},
        {CFrame = CFrame.new(0.69, -0.71, 0.6) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.05}
    },
    ["Sigma2"] = {
        {CFrame = CFrame.new(0.3, -0.8, -1.3) * CFrame.Angles(math.rad(160), math.rad(84), math.rad(90)), Time = 0.18},
        {CFrame = CFrame.new(0.3, -0.9, -1.17) * CFrame.Angles(math.rad(160), math.rad(70), math.rad(90)), Time = 0.18},
        {CFrame = CFrame.new(0.4, -0.65, -0.8) * CFrame.Angles(math.rad(160), math.rad(111), math.rad(90)), Time = 0.18}
    },
    ["Tap"] = {
        {CFrame = CFrame.new(5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), Time = 0.25},
        {CFrame = CFrame.new(5, -1, -0.3) * CFrame.Angles(math.rad(-100), math.rad(-30), math.rad(10)), Time = 0.25}
    },
    ["Swag"] = {
        {
            CFrame = CFrame.new(-0.01, -0.01, -1.01) * CFrame.Angles(math.rad(-90), math.rad(90), math.rad(0)),
            Time = 0.08
        },
        {
            CFrame = CFrame.new(-0.01, -0.01, -1.01) * CFrame.Angles(math.rad(10), math.rad(70), math.rad(-90)),
            Time = 0.08
        }
    },
    ["Suicide"] = {
        {CFrame = CFrame.new(-2.5, -4.5, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0)), Time = 0.1},
        {CFrame = CFrame.new(-2.5, -1, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0)), Time = 0.05}
    },
    ["Goofy"] = {
        {CFrame = CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.10},
        {CFrame = CFrame.new(0.5, -0.51, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.08},
        {CFrame = CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.08}
    },
    ["Rise"] = {
        {CFrame = CFrame.new(0.7, -0.7, 0.6) * CFrame.Angles(math.rad(-16), math.rad(60), math.rad(-80)), Time = 0},
        {CFrame = CFrame.new(0.7, -0.7, 0.6) * CFrame.Angles(math.rad(-16), math.rad(60), math.rad(-80)), Time = 0.900},
        {
            CFrame = CFrame.new(0.95, -1.06, -2.25) * CFrame.Angles(math.rad(-179), math.rad(61), math.rad(80)),
            Time = 0.15
        }
    },
    ["Rise2"] = {
        {CFrame = CFrame.new(0.9, 0, 0) * CFrame.Angles(math.rad(-80), math.rad(60), math.rad(-40)), Time = 0.14},
        {CFrame = CFrame.new(0.5, -0.2, -0.7) * CFrame.Angles(math.rad(-150), math.rad(55), math.rad(20)), Time = 0.14}
    },
    ["Rise3"] = {
        {CFrame = CFrame.new(0.6, -1, 0) * CFrame.Angles(-math.rad(190), math.rad(110), -math.rad(90)), Time = 0.3},
        {CFrame = CFrame.new(0.6, -1.5, 2) * CFrame.Angles(math.rad(120), math.rad(140), math.rad(320)), Time = 0.1}
    },
    ["Rise4"] = {
        {CFrame = CFrame.new(0.3, -2, 0.5) * CFrame.Angles(-math.rad(190), math.rad(110), -math.rad(90)), Time = 0.3},
        {CFrame = CFrame.new(0.3, -1.5, 1.5) * CFrame.Angles(math.rad(120), math.rad(140), math.rad(320)), Time = 0.1}
    },
    ["Swong"] = {
        {CFrame = CFrame.new(0, 0, -.6) * CFrame.Angles(math.rad(-60), math.rad(50), math.rad(-70)), Time = 0.1},
        {CFrame = CFrame.new(0, -.3, -.6) * CFrame.Angles(math.rad(-160), math.rad(60), math.rad(10)), Time = 0.2}
    },
    ["Eternal"] = {
        {CFrame = CFrame.new(0, 0, -1) * CFrame.Angles(math.rad(-40), math.rad(60), math.rad(-80)), Time = 0.17},
        {CFrame = CFrame.new(0, 0, -1) * CFrame.Angles(math.rad(-60), math.rad(60), math.rad(-80)), Time = 0.17}
    },
    ["monkey"] = {
        {CFrame = CFrame.new(0, -3, 0) * CFrame.Angles(-math.rad(120), math.rad(530), -math.rad(220)), Time = 0.2},
        {CFrame = CFrame.new(0.9, 0, 1.5) * CFrame.Angles(math.rad(7), math.rad(30), math.rad(820)), Time = 0.2}
    },
    ["Throw"] = {
        {CFrame = CFrame.new(-3, -3, -3) * CFrame.Angles(math.rad(255), math.rad(122), math.rad(321)), Time = 0.5},
        {CFrame = CFrame.new(1, 1, 1) * CFrame.Angles(math.rad(156), math.rad(54), math.rad(91)), Time = 0.5}
    },
    ["Slide"] = {
        {CFrame = CFrame.new(0.7, -0.7, 0.6) * CFrame.Angles(math.rad(-16), math.rad(60), math.rad(-80)), Time = 0},
        {CFrame = CFrame.new(0.7, -0.7, 0.6) * CFrame.Angles(math.rad(-171), math.rad(47), math.rad(74)), Time = 0.16}
    },
    ["Ketamine2"] = {
        {CFrame = CFrame.new(5, -3, 2) * CFrame.Angles(math.rad(120), math.rad(160), math.rad(140)), Time = 0.07},
        {CFrame = CFrame.new(5, -2.5, -1) * CFrame.Angles(math.rad(80), math.rad(180), math.rad(180)), Time = 0.07},
        {CFrame = CFrame.new(5, -3.4, -3.3) * CFrame.Angles(math.rad(45), math.rad(160), math.rad(190)), Time = 0.07},
        {CFrame = CFrame.new(5, -2.5, -1) * CFrame.Angles(math.rad(80), math.rad(180), math.rad(180)), Time = 0.07}
    },
    ["Astolfo2"] = {
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(25), math.rad(-60)), Time = 0.1},
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-40), math.rad(40), math.rad(-90)), Time = 0.1},
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(55), math.rad(-115)), Time = 0.1},
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-50), math.rad(70), math.rad(-60)), Time = 0.1},
        {CFrame = CFrame.new(0.63, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(70), math.rad(-70)), Time = 0.1}
    },
    ["Ketamine"] = {
        {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(1), math.rad(-7), math.rad(7)), Time = 0},
        {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-0), math.rad(0), math.rad(-0)), Time = 0.08},
        {CFrame = CFrame.new(-0.01, 0, 0) * CFrame.Angles(math.rad(-7), math.rad(-7), math.rad(-1)), Time = 0.08},
        {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(1), math.rad(-7), math.rad(7)), Time = 0.11}
    },
    ["Swiss"] = {
        {CFrame = CFrame.new(1, -1.4, 1.4) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.25},
        {CFrame = CFrame.new(-1.4, 1, -1) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.25}
    },
    ["Old"] = {
        {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(-math.rad(190), math.rad(110), -math.rad(90)), Time = 0.3},
        {CFrame = CFrame.new(0.3, -2, 2) * CFrame.Angles(math.rad(120), math.rad(140), math.rad(320)), Time = 0.3}
    },
    ["Extension"] = {
        {CFrame = CFrame.new(3, 0, 1) * CFrame.Angles(math.rad(-60), math.rad(30), math.rad(-40)), Time = 0.2},
        {CFrame = CFrame.new(3.3, -.2, 0.7) * CFrame.Angles(math.rad(-70), math.rad(10), math.rad(-20)), Time = 0.2},
        {CFrame = CFrame.new(3.8, -.2, 1.3) * CFrame.Angles(math.rad(-80), math.rad(0), math.rad(-20)), Time = 0.1},
        {CFrame = CFrame.new(3, .3, 1.3) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-20)), Time = 0.07},
        {CFrame = CFrame.new(3, .3, .8) * CFrame.Angles(math.rad(-90), math.rad(10), math.rad(-40)), Time = 0.07}
    },
    ["Astolfo"] = {
        {CFrame = CFrame.new(5, -1, -1) * CFrame.Angles(math.rad(-40), math.rad(0), math.rad(0)), Time = 0.05},
        {CFrame = CFrame.new(5, -0.7, -1) * CFrame.Angles(math.rad(-120), math.rad(20), math.rad(-10)), Time = 0.05}
    },
    German = {
        {CFrame = CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.10},
        {CFrame = CFrame.new(0.5, -0.51, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.08},
        {CFrame = CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.08}
    },
    Penis = {
        {CFrame = CFrame.new(-1.8, 0.5, -1.01) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), Time = 0.05},
        {
            CFrame = CFrame.new(-1.8, -0.21, -1.01) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)),
            Time = 0.05
        }
    },
    KillMyself = {
        {CFrame = CFrame.new(-2.5, -4.5, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0)), Time = 0.1},
        {CFrame = CFrame.new(-2.5, -1, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0)), Time = 0.05}
    }
}

--> TargetHUD Functions
function UpdateTarget(player_object)
    -- defenitions
    local hud = hudFolder.TargetHUD
    local humanoid = (player_object.Character and player_object.Character:FindFirstChildWhichIsA"Humanoid")
    local function getAvatarPicture(x)
        return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            x.UserId .. "&width=420&height=420&format=png"
    end
    -- functionality
    hud.EntityImage.Image = getAvatarPicture(player_object)
    hud.userEntity.Text = (player_object and player_object.Name)
    ts:Create(
        hud.health.Top,
        TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)}
    ):Play()
    hud.health.Amount.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
end

function UpdateTarget2(player_object)
    -- defenitions
    local hud = hudFolder.NewHUD
    local humanoid = (player_object.Character and player_object.Character:FindFirstChildWhichIsA"Humanoid")
    local function getAvatarPicture(x)
        return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            x.UserId .. "&width=420&height=420&format=png"
    end
    -- functionality
    hud.EntityImage.Image = getAvatarPicture(player_object)
    hud.userEntity.Text = (player_object and player_object.Name)
    ts:Create(
        hud.health.Top,
        TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)}
    ):Play()
end

function UpdateTarget3(player_object)
    -- defenitions
    local hud = hudFolder.MoonHUD
    local humanoid = (player_object.Character and player_object.Character:FindFirstChildWhichIsA("Humanoid"))
    local function getAvatarPicture(x)
        return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            x.UserId .. "&width=420&height=420&format=png"
    end
    -- functionality
    hud.EntityImage.Image = getAvatarPicture(player_object)
    hud.userEntity.Text = (player_object and player_object.Name)
    ts:Create(
        hud.health.Top,
        TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)}
    ):Play()
end

function UpdateTarget4(player_object)
    -- defenitions
    local hud = hudFolder.Rise
    local humanoid = (player_object.Character and player_object.Character:FindFirstChildWhichIsA("Humanoid"))
    local function getAvatarPicture(x)
        return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            x.UserId .. "&width=420&height=420&format=png"
    end
    -- functionality
    hud.EntityImage.Image = getAvatarPicture(player_object)
    hud.userEntity.Text = (player_object and player_object.Name)
    ts:Create(
        hud.health.Top,
        TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)}
    ):Play()
end

function UpdateTarget5(player_object)
    -- defenitions
    local hud = hudFolder.Novoline
    local humanoid = (player_object.Character and player_object.Character:FindFirstChildWhichIsA("Humanoid"))
    local function getAvatarPicture(x)
        return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            x.UserId .. "&width=420&height=420&format=png"
    end
    -- functionality
    hud.EntityImage.Image = getAvatarPicture(player_object)
    hud.userEntity.Text = (player_object and player_object.Name)
    hud.healthlabel.Text = math.round(humanoid.Health)
    ts:Create(
        hud.health.Top,
        TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)}
    ):Play()
end

function UpdateTarget6(player_object)
    -- defenitions
    local hud = hudFolder.Monsoon
    local humanoid = (player_object.Character and player_object.Character:FindFirstChildWhichIsA("Humanoid"))
    local function getAvatarPicture(x)
        return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            x.UserId .. "&width=420&height=420&format=png"
    end
    -- functionality
    hud.EntityImage.Image = getAvatarPicture(player_object)
    hud.userEntity.Text = (player_object and player_object.Name)
    hud.healthlabel.Text = math.floor(humanoid.Health) .. "%"
    ts:Create(
        hud.health.Top,
        TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)}
    ):Play()
end

function UpdateTarget7(player_object)
    -- defenitions
    local hud = hudFolder.moohud
    local humanoid = (player_object.Character and player_object.Character:FindFirstChildWhichIsA("Humanoid"))
    local function getAvatarPicture(x)
        return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            x.UserId .. "&width=420&height=420&format=png"
    end
    -- functionality
    hud.EntityImage.Image = getAvatarPicture(player_object)
    hud.userEntity.Text = (player_object and player_object.Name)
    hud.userHealth.Text = math.floor(humanoid.Health) .. " HP"
    ts:Create(
        hud.health.Top,
        TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)}
    ):Play()
end

function UpdateTarget8(player_object)
    -- defenitions
    local hud = hudFolder.Main
    local humanoid = (player_object.Character and player_object.Character:FindFirstChildWhichIsA("Humanoid"))
    local function getAvatarPicture(x)
        return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            x.UserId .. "&width=420&height=420&format=png"
    end
    -- functionality
    hud.PlayerAvatar.Image = getAvatarPicture(player_object)
    hud.PlayerName.Text = (player_object and player_object.Name)
    hud.HealthBar:TweenSize(
        UDim2.new(math.clamp(humanoid.Health / 106, 0, 1), 0.936, 0.209, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.15
    )
    hud.HealthText.Text = math.floor(humanoid.Health) .. "%"
end

local targethud_ON = false
local targethud_ON2 = false
local targethud_ON3 = false
local targethud_ON4 = false
local targethud_ON5 = false
local targethud_ON6 = false
local targethud_ON7 = false

local hitsound_Create = true

--> Emitters and Calculations for particles
function CreateCustomParticle(part, particle, lifeTime)
    if part then
        if not part:FindFirstChild("Attachment0") then
            local A0 = Instance.new("Attachment")
            A0.Name = "Attachment0"
            A0.Parent = part
            local emitter = RealParticles[particle]:Clone()
            emitter.Parent = part
            emitter:Emit(10)
            task.wait(lifeTime)
            emitter:Destroy()
            A0:Destroy()
        end
    end
end

function CalculateParticlePosition(plr)
    return (IsThatGuyAlive(plr) and plr.Character.HumanoidRootPart.Position + Vector3.new(0, 2.5, 0) or Vector3.new())
end

function CreateParticle(amount, lifeTime, position)
    for i = 1, amount do
        local ray = Instance.new("Part", workspace)
        ray.Position = position
        ray.Size = Vector3.new(0.2700822353363037, 0.2700822353363037, 0.2700822353363037)
        ray.Material = Enum.Material.Neon
        ray.Color = Color3.new(0, 0.396078, 0.909804)
        ray.Shape = Enum.PartType.Ball
        ray.CanCollide = false
        local c2 = Instance.new("Part", workspace)
        c2.Position = position
        c2.Size = Vector3.new(0.524470865726471, 0.524470865726471, 0.524470865726471)
        c2.Material = Enum.Material.Neon
        c2.Color = Color3.new(0.431373, 0.207843, 1)
        c2.Transparency = 0.9
        c2.Shape = Enum.PartType.Ball
        c2.CanCollide = false
        local hit = Instance.new("Part", workspace)
        hit.Position = position
        hit.Size = Vector3.new(0.770000159740448, 0.770000159740448, 0.770000159740448)
        hit.Material = Enum.Material.Neon
        hit.Color = Color3.new(0.431373, 0.207843, 1)
        hit.Transparency = 0.9
        hit.Shape = Enum.PartType.Ball

        local weld1 = Instance.new("Weld", ray)
        weld1.Part0 = ray
        weld1.Part1 = c2
        local weld2 = Instance.new("Weld", ray)
        weld2.Part0 = ray
        weld2.Part1 = hit

        local att = Instance.new("Attachment", ray)
        local linVel = Instance.new("LinearVelocity", ray)
        linVel.VectorVelocity = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5))

        game:GetService("Debris"):AddItem(ray, lifeTime)
        game:GetService("Debris"):AddItem(c2, lifeTime)
        game:GetService("Debris"):AddItem(hit, lifeTime)

        hit.Touched:Connect(
            function(part)
                if part ~= nil and part:IsA("BasePart") and part.CanCollide and part.Parent.Name ~= "Orbiz" then
                    local distance = (part.Position - ray.Position).Unit * 7
                    linVel.VectorVelocity = -distance
                end
            end
        )

        task.spawn(
            function()
                while ray do
                    if ray.Velocity.Magnitude < 4 then
                        linVel.VectorVelocity = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5))
                    end
                    task.wait(1)
                end
            end
        )

        task.spawn(
            function()
                task.wait(lifeTime - 1.5)
                ts:Create(ray, TweenInfo.new(1.5), {Transparency = 1}):Play()
                ts:Create(c2, TweenInfo.new(1.5), {Transparency = 1}):Play()
                ts:Create(hit, TweenInfo.new(1.5), {Transparency = 1}):Play()
            end
        )

        runService.Heartbeat:Wait()
    end
end
local can_create = true -- debounce
local debounce = false
local library = lua_library

--> UI Library Init, Setup.
local lib = lua_library.MakeHandler()

local Combat = lib.MakeTab({Name = "Combat", Icon = "rbxassetid://14202494448", Size = UDim2.new(0, 14, 0, 19)})
local Movement =
    lib.MakeTab({Name = "Movement", Icon = "rbxassetid://14202574925", Size = UDim2.new(0, 16, 0, 22), Divided = false})
local Player = lib.MakeTab({Name = "Player", Icon = "rbxassetid://14202573678", Size = UDim2.new(0, 16, 0, 17)})
local Exploits = lib.MakeTab({Name = "Exploits", Icon = "rbxassetid://14202576201", Size = UDim2.new(0, 16, 0, 19)})
task.spawn(
    function()
        Exploits.MakeToggle(
            {
                Name = "BedTP",
                Function = function()
                    local beds = FetchBeds()
                    local mybeloved = beds[1] -- first bed thats in the table :3
                    local connection
                    local function stupidretardation()
                        local nearest = nil
                        local min = math.huge

                        for _, v in next, beds do
                            local distance =
                                (v.Position - LocalEntity.Character.HumanoidRootPart.Position).magnitude
                            if distance < min then
                                nearest = v
                                min = distance
                            end
                        end

                        return nearest
                    end
                    local function tweenMyBeloved()
                        if mybeloved then
                            ts:Create(
                                LocalEntity.Character:WaitForChild("HumanoidRootPart"),
                                TweenInfo.new(0.91),
                                {CFrame = stupidretardation().CFrame + Vector3.new(0, 5, 0)}
                            ):Play()
                            if connection then
                                connection:Disconnect()
                            end
                        end
                    end

                    LocalEntity.Character.Humanoid.Health = 0
                    connection =
                        LocalEntity.CharacterAdded:Connect(
                        function()
                            tweenMyBeloved()
                        end
                    )
                end,
                Constant = "bedtp"
            }
        )

        Exploits.MakeToggle(
            {Name = "ScytheFuni", Function = function(v)
                end, Constant = "ScytheFuni"}
        )

        Exploits.MakeToggle(
            {
                Name = "PlayerTP",
                Function = function()
                    local mybeloved = GetNearPlayer(math.huge)
                    local connection
                    local function tweenMyBeloved()
                        if mybeloved then
                            ts:Create(
                                LocalEntity.Character:WaitForChild"HumanoidRootPart",
                                TweenInfo.new(0.97),
                                {CFrame = mybeloved.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)}
                            ):Play()
                            if connection then
                                connection:Disconnect()
                            end
                        end
                    end

                    LocalEntity.Character.Humanoid.Health = 0
                    connection =
                        LocalEntity.CharacterAdded:Connect(
                        function()
                            tweenMyBeloved()
                        end
                    )
                end,
                Constant = "plrtp"
            }
        )

        Exploits.MakeToggle(
            {
                Name = "ClickTP",
                Function = function()
                    if GetAliveState() then
                        local mouse2 = LocalEntity:GetMouse()
                        local hitpos = mouse2.Hit.p
                        ts:Create(
                            LocalEntity.Character.HumanoidRootPart,
                            TweenInfo.new(0.4),
                            {CFrame = CFrame.new(hitpos)}
                        ):Play()
                    end
                end,
                Constant = "plrtp"
            }
        )

        Exploits.MakeToggle(
            {
                Name = "Dupe",
                Function = function()
                    local args = {
                        [1] = {
                            ["shopItem"] = {
                                ["lockAfterPurchase"] = true,
                                ["itemType"] = "emerald_chestplate",
                                ["price"] = 0,
                                ["customDisplayName"] = "Emerald Armor",
                                ["currency"] = "iron",
                                ["category"] = "Combat",
                                ["amount"] = 1,
                                ["ignoredByKit"] = {
                                    [1] = "bigman"
                                },
                                ["spawnWithItems"] = {
                                    [1] = "emerald_boots",
                                    [2] = "emerald_pants",
                                    [3] = "emerald_helmet"
                                },
                                ["nextTier"] = "iron_chestplate"
                            },
                            ["shopId"] = "2_item_shop_1"
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild(
                        "@rbxts"
                    ):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild(
                        "BedwarsPurchaseItem"
                    ):InvokeServer(unpack(args))
                end,
                Constant = "funny463"
            }
        )

        Exploits.MakeToggle(
            {Name = "DragonBreath", Function = function()
                end, Constant = "breath"}
        )
        Exploits.MakeToggle(
            {Name = "PartyPopper", Function = function()
                end, Constant = "pop"}
        )
        Exploits.MakeToggle(
            {Name = "AutoReport", Function = function()
                end, Constant = "autorep"}
        )
    end
)
local Visual = lib.MakeTab({Name = "Visual", Icon = "rbxassetid://14202577393", Size = UDim2.new(0, 22, 0, 15)})

local blurUtil =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/bedwars/blur.lua"))()
getgenv().blurUtility = blurUtil

local ka =
    Combat.MakeToggle(
    {Name = "Aura", Function = function() end, Constant = "killaura"}
)
ka.MakeOptions()
ka.MakeDropdown(
    {
        Elements = {
            "AstolfoNew",
            "Normal",
            "Smooth",
            "Swag2",
            "Slow",
            "1.8",
            "Exhibition Old",
            "Exhibition",
            "TenacityOld",
            "TenacityOld2",
            "Sigma",
            "Sigma2",
            "Tap",
            "Swag",
            "Suicide",
            "Rise",
            "Rise2",
            "Rise3",
            "Rise4",
            "Eternal",
            "Swong",
            "Old",
            "Throw",
            "Slide",
            "Kawaii",
            "Blocking",
            "Swank",
            "Swank2",
            "OldSwank3",
            "Swiss",
            "Goofy",
            "Extension",
            "monkey",
            "Astolfo",
            "Astolfo2",
            "Ketamine",
            "Ketamine2",
            "German",
            "Penis",
            "KillMyself"
        },
        Text = "Animation",
        Constant = "KAnimation"
    }
)
Combat.MakeToggle(
    {Name = "Velocity", Function = function() end, Constant = "velo"}
)
Combat.MakeToggle(
    {Name = "Sprint", Function = function() end, Constant = "sprint"}
)
Visual.MakeToggle(
    {
        Name = "Effects",
        Function = function(x)
            if x then
                for _, vf in next, lua_library.Windows do
                    blurUtil.new(vf, "moon")
                end
                blurUtil.new(game.CoreGui.ExperienceChat.appLayout.chatWindow, "chat")
            else
                for _, v in next, workspace.CurrentCamera:GetDescendants() do
                    if (string.find(v.Name, "moon")) then
                        v:Remove()
                    end
                end
            end
        end,
        Constant = "yblur"
    }
)

local cef =
    Visual.MakeToggle(
    {Name = "ChatEffects", Function = function()end, Constant = "chateff"}
)
cef.MakeOptions()
cef.MakeDropdown({Elements = {"None", "Minecraft", "SFDisplay"}, Text = "Font", Constant = "chatfont"})
cef.MakeSubToggle(
    {Name = "Rainbow Text", Function = function()
        end, Text = "Rainbow", Constant = "rbw"}
)

task.spawn(
    function()
        local hitsounds =
            Visual.MakeToggle(
            {Name = "Hitsound", Function = function()                end, Constant = "hitsounds"}
        )
        hitsounds.MakeOptions()
        hitsounds.MakeDropdown(
            {
                Elements = {
                    "aimhook",
                    "skeet.cc",
                    "neverlose",
                    "baimware",
                    "osu",
                    "rust",
                    "bag",
                    "sit",
                    "reminder",
                    "uwu",
                    "zing",
                    "crowbar",
                    "ara ara",
                    "burp",
                    "mario",
                    "laugh",
                    "huh"
                },
                Text = "Sound",
                Constant = "hits"
            }
        )
        local hiteff =
            Visual.MakeToggle(
            {Name = "Hit Particles", Function = function()end, Constant = "particles"}
        )
        hiteff.MakeOptions()
        hiteff.MakeDropdown(
            {Elements = {"XP", "Tenacity", "Glint", "Critical", "Hearts"}, Text = "Effect", Constant = "particle"}
        )
    end
)

task.spawn(function()
    local texturePack = Visual.MakeToggle({Name = "TexturePack", Function = function() end, Constant = "resp"})
    texturePack.MakeOptions()
    texturePack.MakeDropdown({
        Elements = {
            "Moon", "Moon2", "Moon3", "Moon4", "Moon5", "MoeriiV1", "LongSword", "Galaxy", "Tenacity 5.0", 
            "Mastadawn3", "Exhibition", "Exhibition_Short", "RubyPack", "jungle 16x", "Drim", "Tenacity 1.0", 
            "Tenacity 2.0", "Tenacity 3.0", "Tenacity 4.0", "Exhibition Private", "Exhibition V2", "Novoline", 
            "Novoline2", "Pulsive", "MeteorRemake2", "Meteor Remake", "Mastadawn", "Mastadawn2", "Meteor3", 
            "Astolfo", "Snoopy Crack", "Snoopy Crack 2", "256x", "Collector", "Rise6", "1.19", "PvP", "n1san1", 
            "Dnut Private"
        },
        Text = "Pack",
        Constant = "texturePack"
    })

    local swordGlint = Visual.MakeToggle({Name = "Sword Glint", Function = function() end, Constant = "swordGlint"})
    local chinahat = Visual.MakeToggle({Name = "Chinahat", Function = function() end, Constant = "hat"})
    local rainbowHealthbar = Visual.MakeToggle({Name = "Rainbow Healthbar", Function = function() end, Constant = "rhealth"})
    local rainbowArmour = Visual.MakeToggle({Name = "Rainbow Armour", Function = function() end, Constant = "rarmour"})
    local paimon = Visual.MakeToggle({
        Name = "Paimon",
        Function = function(x)
            supportFrame.Enabled = x
        end,
        Constant = "Paimon"
    })
    local cleanUIFix = Visual.MakeToggle({Name = "Clean UI", Function = function() end, Constant = "uifix"})
    cleanUIFix.MakeOptions()
    cleanUIFix.MakeDropdown({Elements = {"Clean", "Nova"}, Text = "Style", Constant = "uifixmode"})
    Visual.MakeToggle({Name = "Jump Circle", Function = function() end, Constant = "jumpcircle"})
    local customCharacter = Visual.MakeToggle({Name = "Custom Character", Function = function() end, Constant = "char"})
    customCharacter.MakeOptions()
    customCharacter.MakeDropdown({
        Elements = {
            "Freddy Plush", "amongus", "chair", "friday", "maxwell", "paimon", "floppa", "Nightmare", 
            "Nightmare Bonnie", "Dababy", "Bugs Bunny", "Rabbid", "KFC", "Furry", "Squidward"
        },
        Text = "Model",
        Constant = "follower"
    })
    local watermarkToggle = Visual.MakeToggle({Name = "Watermark", Function = function() end, Constant = "th"})
    watermarkToggle.MakeOptions()
    watermarkToggle.MakeDropdown({
        Elements = {"moon", "tenacity", "neverlose", "skeet", "novoline", "none"},
        Text = "Style",
        Constant = "mark"
    })

    local ambiance = Visual.MakeToggle({Name = "Ambiance", Function = function(x) end, Constant = "tzutz"})
    ambiance.MakeOptions()
    ambiance.MakeSlider({
        Name = "Time",
        Min = 0,
        Max = 24,
        Default = 12,
        Round = 1,
        Function = function(v) game.Lighting.ClockTime = v end,
        Constant = "TimeValue"
    })
    local skybox = Visual.MakeToggle({Name = "Skybox", Function = function() end, Constant = "ambi"})
    skybox.MakeOptions()
    skybox.MakeDropdown({
        Elements = {
            "Purple Nebula", "Night Sky", "Pink Daylight", "Morning Glow", "Setting Sun", "Fade Blue", 
            "Elegant Morning", "Neptune", "Redshift", "Aesthetic Night"
        },
        Text = "Skybox",
        Constant = "sky"
    })
end)

task.spawn(function()
    local targetHUD = Visual.MakeToggle({Name = "TargetHUD", Function = function() end, Constant = "thud"})
    targetHUD.MakeOptions()
    targetHUD.MakeDropdown({
        Elements = {"Nova", "MoonBeta", "Monsoon", "New", "Classic", "Rise", "Moon", "Novoline"},
        Text = "HUD",
        Constant = "targethud"
    })
    local sessionStatsHUD = Visual.MakeToggle({Name = "SessionStats", Function = function() end, Constant = "stats"})
    sessionStatsHUD.MakeOptions()
    sessionStatsHUD.MakeDropdown({Elements = {"Moon", "Meteor", "Prism"}, Text = "HUD", Constant = "shud"})
end)

task.spawn(function()
    local connection
    local realSpeed = 2
    local enabled
    local speedCC = Movement.MakeToggle({
        Name = "Speed",
        Function = function(x)
            enabled = x
            if enabled then
                connection = LocalEntity.CharacterAdded:Connect(function()
                    repeat
                        task.wait()
                        if GetAliveState() then
                            local moveDir = LocalEntity.Character.Humanoid.MoveDirection
                            LocalEntity.Character.HumanoidRootPart.CFrame =
                                LocalEntity.Character.HumanoidRootPart.CFrame +
                                (LocalEntity.Character.Humanoid.MoveDirection * realSpeed)
                        end
                    until not enabled
                end)

                repeat
                    task.wait()
                    if GetAliveState() then
                        local moveDir = LocalEntity.Character.Humanoid.MoveDirection
                        LocalEntity.Character.HumanoidRootPart.CFrame =
                            LocalEntity.Character.HumanoidRootPart.CFrame +
                            (LocalEntity.Character.Humanoid.MoveDirection * realSpeed)
                    end
                until not enabled
            else
                connection:Disconnect()
                enabled = false
            end
        end,
        Constant = "speedCC"
    })

    speedCC.MakeOptions()
    speedCC.MakeSlider({
        Name = "Speed",
        Min = 0.015,
        Max = 35,
        Default = 0.2,
        Round = 1,
        Function = function(v) realSpeed = v end,
        Constant = "SpeedSlider"
    })
end)

local damageBooster = Movement.MakeToggle({Name = "DamageBooster", Function = function() end, Constant = "speed"})
damageBooster.MakeOptions()
local dmgBoosterValue = 1.4
damageBooster = speed.MakeSlider({
    Name = "Boost Speed",
    Min = 1,
    Max = 1.6,
    Default = 1.4,
    Round = 1,
    Function = function(v) end,
    Constant = "DMGBoosterV"
})

local expansionValue = 4
task.spawn(function()
    local breaker = Player.MakeToggle({Name = "Breaker", Function = function() end, Constant = "nuker"})
    local stealer = Player.MakeToggle({Name = "Stealer", Function = function() end, Constant = "stealer"})
    local scaffold = Player.MakeToggle({Name = "Scaffold", Function = function() end, Constant = "scaffold"})
    local autoProjectile = Player.MakeToggle({Name = "AutoProjectile", Function = function() end, Constant = "projaimbot"})
    local autoQueue = Player.MakeToggle({Name = "AutoQueue", Function = function() end, Constant = "autoqueue"})
    local antiVoid = Player.MakeToggle({Name = "AntiVoid", Function = function() end, Constant = "av"})
    scaffold.MakeOptions()
    scaffold.MakeSlider({
        Name = "Expansion",
        Min = 1,
        Max = 8,
        Default = 4,
        Round = 1,
        Function = function(v) expansionValue = v end,
        Constant = "ExpansionValue"
    })
    antiVoid.MakeOptions()
    antiVoid.MakeDropdown({Elements = {"bounce", "tween"}, Text = "Mode", Constant = "avMode"})
end)

local flyToggled = false
local cFrameBeforeFly
local flySpeed = {Value = 1}
local UIS = game:GetService("UserInputService")
local RayCastParams = RaycastParams.new()
RayCastParams.FilterDescendantsInstances = {game.Players, game.Workspace.CurrentCamera, LocalEntity.Character}
RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist

local fly = Movement.MakeToggle({
    Name = "Fly",
    Function = function(v)
        flyToggled = v
        if flyToggled then
            cFrameBeforeFly = LocalEntity.Character.HumanoidRootPart.CFrame
            repeat
                if not flyToggled then break end
                task.wait()
                if GetAliveState() then
                    if UIS:IsKeyDown(Enum.KeyCode.Space) then
                        cFrameBeforeFly = CFrame.new(0, cFrameBeforeFly.Y + flySpeed.Value, 0)
                    elseif UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
                        cFrameBeforeFly = CFrame.new(0, cFrameBeforeFly.Y - flySpeed.Value, 0)
                    end
                    LocalEntity.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                            LocalEntity.Character.HumanoidRootPart.CFrame.X,
                            cFrameBeforeFly.Y,
                            LocalEntity.Character.HumanoidRootPart.CFrame.Z
                        )
                end
            until not flyToggled
        else
            if GetAliveState() then
                LocalEntity.Character.HumanoidRootPart.Velocity = Vector3.new()
            end
        end
    end,
    Constant = "fly"
})

local fastFly = Movement.MakeToggle({
    Name = "FastFly",
    Function = function(v) end,
    Constant = "fastfly"
})

local flyOpt = fly.MakeOptions()
fastFly.MakeOptions()
fastFly.MakeDropdown({Elements = {"Heatseeker", "VelocityUp"}, Text = "Type", Constant = "FlyMeth"})

flySpeed = fly.MakeSlider({
    Name = "Speed",
    Min = 0.2,
    Max = 5,
    Default = 1,
    Round = 1,
    Function = function(v) end,
    Constant = "SpeedFlyV"
})

local funnyFlyToggled = false
local funnyFly = Movement.MakeToggle({
    Name = "FunnyFly",
    Function = function(v)
        funnyFlyToggled = v
        if funnyFlyToggled then
            task.spawn(function()
                while funnyFlyToggled do
                    task.wait()
                    if not funnyFlyToggled then break end
                    if GetAliveState() then
                        task.wait(0.1)
                        LocalEntity.Character.HumanoidRootPart.Velocity =
                            LocalEntity.Character.HumanoidRootPart.Velocity + Vector3.new(0, 85, 0)
                        LocalEntity.Character.HumanoidRootPart.CFrame =
                            LocalEntity.Character.HumanoidRootPart.CFrame + Vector3.new(0, 1, 1)
                    end
                end
            end)
        else
            if GetAliveState() then
                LocalEntity.Character.HumanoidRootPart.Velocity = Vector3.new()
            end
        end
    end,
    Constant = "funnyfly"
})

local gravJump = Movement.MakeToggle({
    Name = "GravityJump",
    Function = function(v)
        if v then
            workspace.Gravity = 10
        else
            workspace.Gravity = 196.2
        end
    end,
    Constant = "gravfly"
})


--> Sound Functions
function getSound()
    local function Get(fileName, url)
        writefile(fileName, game:HttpGet(url))
        return getmoonasset(fileName)
    end

    local hits = library.Constants.hits

    local soundMap = {
        ["skeet.cc"] = "rbxassetid://5447626464",
        ["baimware"] = "rbxassetid://6607339542",
        ["neverlose"] = "rbxassetid://6607204501",
        ["rust"] = "rbxassetid://5043539486",
        ["bag"] = "rbxassetid://364942410",
        ["sit"] = {"sit.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/sit.mp3"},
        ["osu"] = {"osu.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/osu.mp3"},
        ["reminder"] = {"reminder.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/reminder.mp3"},
        ["uwu"] = {"uwu.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/uwu.mp3"},
        ["zing"] = {"zing.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/animezing.mp3"},
        ["crowbar"] = {"crowbar.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/crowbar.mp3"},
        ["laugh"] = {"laugh.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/laugh.mp3"},
        ["burp"] = {"burp.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/burp.mp3"},
        ["mario"] = {"mario.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/mariowoahh.mp3"},
        ["huh"] = {"huh.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/huhh.mp3"},
        ["ara ara"] = {"ara.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/ara.mp3"},
        ["aimhook"] = {"nv.mp3", "https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/aimhook/sounds/Track.mp3"},
    }

    local soundInfo = soundMap[hits]

    if type(soundInfo) == "string" then
        return soundInfo
    elseif type(soundInfo) == "table" then
        return task.spawn(function()
            return Get(soundInfo[1], soundInfo[2])
        end)
    end
end

--> Killaura, Core
local viewmodel, weld, oldweld = workspace.CurrentCamera:WaitForChild("Viewmodel").RightHand.RightWrist, viewmodel.C0, viewmodel.C0

function SendAttackPacket()
    for _, v in next, game.Players:GetPlayers() do
        if GetAliveState() and IsThatGuyAlive(v) and v ~= LocalEntity then
            if (v.Character.HumanoidRootPart.Position - LocalEntity.Character.HumanoidRootPart.Position).Magnitude < 24 and v.Team ~= LocalEntity.Team then
                local selfPosition = LocalEntity.Character.HumanoidRootPart.Position + (20 > 14 and (LocalEntity.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(LocalEntity.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
                local Entity, target = v.Character, v.Character:GetPrimaryPartCFrame().Position

                Remotes.AttackPacket:FireServer({
                    ["chargedAttack"] = {["chargeRatio"] = 0},
                    ["entityInstance"] = Entity,
                    ["validate"] = {
                        ["targetPosition"] = {["value"] = target},
                        ["selfPosition"] = {["value"] = selfPosition}
                    },
                    ["weapon"] = (GetSword() ~= nil and GetSword())
                })

                task.spawn(function()
                    if not debounce then
                        for __, vee in next, Animations[library.Constants.KAnimation] do
                            if workspace.CurrentCamera.Viewmodel and workspace.CurrentCamera.Viewmodel.RightHand.RightWrist then
                                debounce = true
                                local Anim = ts:Create(viewmodel, TweenInfo.new(vee.Time), {C0 = oldweld * vee.CFrame})
                                Anim:Play()
                                Anim.Completed:Wait()
                                task.wait(vee.Time - 0.1)
                                local time = .69
                                Anim = ts:Create(viewmodel, TweenInfo.new(time), {C0 = weld})
                                Anim:Play()
                                debounce = false
                            end
                        end
                    end
                end)

                task.spawn(function()
                    if library.Constants.hitsounds then
                        if true then
                            if hitsound_Create then
                                hitsound_Create = false
                                local sound = Instance.new("Sound")
                                sound.Name = "Hitsound_1"
                                sound.Parent = game:GetService("SoundService")
                                sound.SoundId = getSound()
                                sound.Volume = 0.89
                                sound.PlayOnRemove = true
                                sound:Destroy()
                                task.delay(0.92, function()
                                    hitsound_Create = true
                                end)
                            end
                        end
                    end
                end)

                task.spawn(function()
                    if library.Constants.thud then
                        local hudType = library.Constants.targethud
                        local updateFunc, hudObj

                        if hudType == "Classic" then
                            updateFunc, hudObj = UpdateTarget, HUD_IMPORT_OBJECT
                        elseif hudType == "New" then
                            updateFunc, hudObj = UpdateTarget2, HUD_IMPORT_OBJECT2
                        elseif hudType == "Rise" then
                            updateFunc, hudObj = UpdateTarget4, HUD_IMPORT_OBJECT4
                        elseif hudType == "Monsoon" then
                            updateFunc, hudObj = UpdateTarget6, HUD_IMPORT_OBJECT6
                        elseif hudType == "Novoline" then
                            updateFunc, hudObj = UpdateTarget5, HUD_IMPORT_OBJECT5
                        elseif hudType == "Moon" then
                            updateFunc, hudObj = UpdateTarget3, HUD_IMPORT_OBJECT3
                        elseif hudType == "MoonBeta" then
                            updateFunc, hudObj = UpdateTarget7, HUD_IMPORT_OBJECT7
                        elseif hudType == "Nova" then
                            updateFunc, hudObj = UpdateTarget8, HUD_IMPORT_OBJECT8
                        end

                        if updateFunc and hudObj then
                            updateFunc(v)
                            hudObj.Visible = true
                            task.wait(2.5)
                            hudObj.Visible = false
                        end
                    end
                end)

                local args = {[1] = {["hand"] = GetSword()}}
                replicatedService.rbxts_include.node_modules:FindFirstChild"@rbxts".net.out._NetManaged.SetInvItem:InvokeServer(unpack(args))

                task.spawn(function()
                    if library.Constants.particles then
                        if library.Constants.particle == "XP" then
                            if library.Constants.particles and can_create then
                                CreateParticle(3, 1, CalculateParticlePosition(v))
                                can_create = false
                                task.wait(.65)
                                can_create = true
                            end
                        else
                            CreateCustomParticle(v.Character.Head, library.Constants.particle, 0.9)
                        end
                    end
                end)
            end
        end
    end
end

--> Hooks
local reportedfags = {}
do
    local _superSpeed = false

    LocalEntity.CharacterAdded:Connect(
        function()
            task.wait(1)
            warn"[Moon]: Init CharacterAdded Hook, DamageBooster module on hold..."
            LocalEntity.Character.Humanoid:GetPropertyChangedSignal"Health":Connect(
                function()
                    task.spawn(
                        function()
                            _superSpeed = true
                            task.wait(0.89)
                            _superSpeed = false
                        end
                    )
                end
            )
        end
    )
end;

--> Session stats update
local function updateKillsText(kills)
    sessioninfos["Meteor"].kills.Text = "Kills: " .. kills
    sessioninfos["Prism"].kills.Text = "Kills: " .. kills
    sessioninfos["Moon"].CombatIcon.TextLabel.Text = kills
end

local function updateSessionTime()
    while task.wait(1) do
        if sessiondata.secs < 60 then
            sessiondata.secs = sessiondata.secs + 1
        else
            sessiondata.mins = sessiondata.mins + 1
            sessiondata.secs = 0
        end
        if sessiondata.mins == 60 then
            sessiondata.hours = sessiondata.hours + 1
            sessiondata.mins = 0
            sessiondata.secs = 0
        end
        writefile("sessdata.txt", game:GetService("HttpService"):JSONEncode(sessiondata))
        local timeString = string.format("Session Time: %dh %dm %ds", sessiondata.hours, sessiondata.mins, sessiondata.secs)
        sessioninfos["Meteor"].timeinfo.Text = timeString
        sessioninfos["Prism"].timeinfo.Text = timeString
        sessioninfos["Moon"].TimeIcon.TextLabel.Text = timeString
    end
end

LocalEntity:WaitForChild"leaderstats".Kills:GetPropertyChangedSignal("Value"):Connect(function()
    local updatedKills = sessiondata.kills + 1
    sessiondata.kills = updatedKills
    updateKillsText(updatedKills)
end)

-- Loops Init
local function handleactions()
    while task.wait(3) do
        if library.Constants.char then
            for _, v in next, game.Players:GetPlayers() do
                if IsThatGuyAlive(v) then
                    for i, obj in next, v.Character:GetChildren() do
                        if (obj:IsA"BasePart" or obj:IsA"MeshPart") then
                            obj.Transparency = 1
                        end

                        if (obj:IsA"Accessory") then
                            if obj:FindFirstChild("Handle") then
                                obj.Handle.Transparency = 1
                            end
                        end
                    end
                end
            end
        end
        if library.Constants.ambi then
            if game.Lighting:FindFirstChildOfClass"Sky" then
                game.Lighting:FindFirstChildOfClass"Sky":Destroy()
            end
            local skybox = Instance.new("Sky", game.Lighting)
            local skyboxInfo = Skyboxes[(library.Constants.sky and library.Constants.sky or "Purple Nebula")]
            skybox.SkyboxLf = skyboxInfo.SkyboxLf
            skybox.SkyboxBk = skyboxInfo.SkyboxBk
            skybox.SkyboxDn = skyboxInfo.SkyboxDn
            skybox.SkyboxFt = skyboxInfo.SkyboxFt
            skybox.SkyboxRt = skyboxInfo.SkyboxRt
            skybox.SkyboxUp = skyboxInfo.SkyboxUp
            skybox.Name = "override"
        end

        if library.Constants.autorep then
            for _, v in next, game.Players:GetPlayers() do
                if v.Name ~= LocalEntity.Name then
                    if not table.find(reportedfags, v.UserId) then
                        local args = { [1] = v.UserId }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.ReportPlayer:FireServer(unpack(args))
                        warn("[Moon @ AutoReport]: Reported: " .. v.Name)
                        table.insert(reportedfags, v.UserId)
                        sessiondata.reports = sessiondata.reports + 1
                    end
                end
            end
        end
    end
end

do
    task.spawn(updateSessionTime)
    task.spawn(handleactions)
end;


local chinahat
local chatService = game:GetService("TextChatService").ChatWindowConfiguration
local statsMap = {
    Meteor = library.Constants.shud == "Meteor",
    Prism = library.Constants.shud == "Prism",
    Moon = library.Constants.shud == "Moon",
}

local function handleStatsVisibility()
    for name, sessioninfo in next, sessioninfos do
        sessioninfo.Visible = statsMap[name]
    end
end

local function updateReportsText()
    for _, sessioninfo in next, sessioninfos do
        sessioninfo.reports.Text = "Reports: " .. sessiondata.reports
    end
end





--> Core Loops
task.spawn(function()
    while task.wait() do
        if GetAliveState() then
            if LocalEntity.Character.Humanoid.FloorMaterial ~= Enum.Material.Air and LocalEntity.Character.Humanoid.FloorMaterial ~= Enum.Material.ForceField then
                antiVoidPosition = LocalEntity.Character.PrimaryPart.CFrame
                antiVoidPosition = antiVoidPosition + Vector3.new(0, 6, 0)
            end
        end
        statsMap.Meteor = library.Constants.shud == "Meteor"; statsMap.Prism = library.Constants.shud == "Prism"; statsMap.Moon = library.Constants.shud == "Moon"
        if library.Constants.chateff and library.Constants.rbw then
            chatService.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        end
        if library.Constants.breath then
            game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.DragonBreath:FireServer(
                {["player"] = LocalEntity}
            )
        end
        if library.Constants.pop then
            game:GetService("ReplicatedStorage")["events-@easy-games/game-core:shared/game-core-networking@getEvents.Events"].useAbility:FireServer("PARTY_POPPER")
        end
        if not library.Constants.hat and chinahat then
            chinahat:Destroy()
        end

        if library.Constants.rarmour and GetAliveState() then
            local armourTypes = {"boots", "chestplate", "helmet"}
            for _, v in next, LocalEntity.Character:GetChildren() do
                for _, armourType in next, armourTypes do
                    if string.find(string.lower(v.Name), armourType) then
                        v.Handle.Material = "ForceField"
                        v.Handle.TextureID = ""
                        v.Handle.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                end
            end
        end

        if library.Constants.uifix and library.Constants.uifixmode == "Clean" then
            local hotbarDescendants = LocalEntity.PlayerGui.hotbar:GetDescendants()
            for _, v in next, hotbarDescendants do
                if v:IsA("Frame") and v:FindFirstChildOfClass"ImageButton" then
                    local imageButton = v:FindFirstChildOfClass"ImageButton"
                    if not imageButton:FindFirstChild"UICorner" then
                        local uiCorner = Instance.new("UICorner", imageButton)
                    end
                    if imageButton:FindFirstChild"1" then
                        imageButton["1"]:Destroy()
                    end
                end
            end
        end

        if library.Constants.mark == "none" then
            for _, watermark in next, watermarks do
                watermark.Visible = false
            end
        else
            for name, watermark in next, watermarks do
                watermark.Visible = (name == library.Constants.mark)
            end
        end

        if library.Constants.rhealth and LocalEntity.PlayerGui:FindFirstChild("hotbar") then
            local hotbar = LocalEntity.PlayerGui.hotbar["1"]
            if hotbar and hotbar:FindFirstChild"HotbarHealthbarContainer" then
                local healthbars = hotbar.HotbarHealthbarContainer.HealthbarProgressWrapper:GetChildren()
                for _, v in next, healthbars do
                    if not v:IsA("UIListLayout") then
                        v.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                end
            end
        end

        -- function calls (__call), dont wanna put them here cause it will get fucking messy again.
        handleStatsVisibility()
        updateReportsText()
    end
end)


task.spawn(function()
    while task.wait() do
        if library.Constants.nuker and GetAliveState() then
            task.spawn(function()
                if LocalEntity:GetAttribute("DenyBlockBreak") then
                    LocalEntity:SetAttribute("DenyBlockBreak", nil)
                end
            end)
            local beds = FetchBeds()
            for _, v in next, beds do
                local mag = (v.Position - LocalEntity.Character.PrimaryPart.Position).Magnitude
                if mag < 24 then DestroyBed(v) end
            end
        end

        if library.Constants.stealer and GetAliveState() then
            StealChests()
        end

        if library.Constants.scaffold and GetAliveState() then
            block, amount = getBlock() 

            for i = 1, library.Constants.ExpansionValue do
                if getBlock() then
                    blocktable.blockType = getBlock()
                end
                local vecPos = LocalEntity.Character.HumanoidRootPart.Position +
                                (LocalEntity.Character.Humanoid.MoveDirection * (i * 3.3)) +
                                Vector3.new(0, -math.floor(LocalEntity.Character.Humanoid.HipHeight * 3), 0)
                local dividedPos = Vector3.new(vecPos.X / 3, vecPos.Y / 3, vecPos.Z / 3)
                if getBlock() and Modules.BlockController:isAllowedPlacement(LocalEntity, blocktable.blockType, dividedPos) then
                    placeBlock(dividedPos)
                    Modules.Viewmodel:playAnimation(require(game.ReplicatedStorage.TS.animation["animation-type"]).AnimationType.FP_USE_ITEM)
                end
            end
        end

        if library.Constants.speed and GetAliveState() and _superSpeed then
            LocalEntity.Character.HumanoidRootPart.CFrame =
                LocalEntity.Character.HumanoidRootPart.CFrame +
                (LocalEntity.Character.Humanoid.MoveDirection * DMGBooster.Value)
        end

        if library.Constants.projaimbot and GetAliveState() then
            local projectiles = {"fireball", "snowball", "wood_bow", "wood_crossbow", "tactical_crossbow"}
            for _, projectile in next, projectiles do -- moerii why the fuck do you use pairs
                if hasItem(projectile) and hasItem("arrow") then
                    ShootProjectile(projectile, "arrow", GetNearPlayer(math.huge))
                end
            end
        end
    end
end)


runService.Heartbeat:Connect(function(delta)
    if library.Constants.fastfly and (library.Constants.FlyMeth == "Heatseeker" or library.Constants.FlyMeth == "VelocityUp") then
        if GetAliveState() then
            if not LocalEntity.Character.HumanoidRootPart:FindFirstChild"Fun" then
                local flye = Instance.new("BodyVelocity")
                flye.MaxForce = Vector3.new(0, 9e9, 0)
                flye.Name = "Fun"
                flye.Parent = LocalEntity.Character.HumanoidRootPart
            end
            if library.Constants.FlyMeth == "Heatseeker" then
                local speedValue = (tick() % 1 < 0.6 and 6 or (23 / 0.4))
                LocalEntity.Character.HumanoidRootPart.CFrame =
                    LocalEntity.Character.HumanoidRootPart.CFrame +
                    (LocalEntity.Character.Humanoid.MoveDirection * (speedValue - 20)) * delta
            elseif library.Constants.FlyMeth == "VelocityUp" then
                local moveVec = LocalEntity.Character.Humanoid.MoveDirection
                LocalEntity.Character.HumanoidRootPart.CFrame =
                    LocalEntity.Character.HumanoidRootPart.CFrame +
                    (moveVec * 7.3 * math.clamp((tick() % 2), 0.5, 40) * delta)
            end
            LocalEntity.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1.3, 0)
        end
    else
        if LocalEntity.Character.HumanoidRootPart:FindFirstChild("Fun") then
            LocalEntity.Character.HumanoidRootPart.Fun:Destroy()
        end
    end
end)

runService.RenderStepped:Connect(function()
    game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.GroundHit:FireServer(workspace.Map.Worlds[GetCurrentMap()].Blocks, math.huge)
    if library.Constants.killaura then SendAttackPacket() end
    if library.Constants.sprint then Modules.Sprint:startSprinting() end
    if library.Constants.velo then Remotes.Knockback.kbUpwardStrength = 0 Remotes.Knockback.kbDirectionStrength = 0 else Remotes.Knockback.kbUpwardStrength = 11000 Remotes.kbDirectionStrength = 11000 end
    if library.Constants.ScytheFuni and GetAliveState() then local args = {[1] = {["direction"] = LocalEntity.Character.HumanoidRootPart.CFrame.LookVector * 9304588888888345983450980850394538940}} game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.ScytheDash:FireServer(unpack(args)) end
end)

runService.RenderStepped:Connect(function()
    if library.Constants.av then
        if not workspace:FindFirstChild"av" then
            local av = Instance.new("Part", workspace)
            av.Name = "av"
            av.Size = Vector3.new(2100, 0.6, 2000)
            av.Position = Vector3.new(161.5, 25, 246.9)
            av.Transparency = .5
            av.Anchored = true
            av.Material = "ForceField"
            av.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            av.Touched:Connect(function(ht)
                if library.Constants.avMode == "bounce" or library.Constants.avMode == nil then
                    if ht.Parent and ht.Parent:FindFirstChild("Humanoid") and ht.Parent.Name == LocalEntity.Name then
                        LocalEntity.Character.Humanoid:ChangeState("Jumping")
                        task.wait(0.15)
                        LocalEntity.Character.Humanoid:ChangeState("Jumping")
                        task.wait(0.15)
                        LocalEntity.Character.Humanoid:ChangeState("Jumping")
                    end
                end

                if library.Constants.avMode == "tween" then
                    if antiVoidPosition ~= nil and not library.Constants.fly then
                        local tween = ts:Create(
                            LocalEntity.Character.HumanoidRootPart,
                            TweenInfo.new(0.2, Enum.EasingStyle.Exponential),
                            {CFrame = antiVoidPosition}
                        )
                        tween:Play()
                        task.wait(0.36)
                        tween:Cancel()
                    end
                end
            end)
        end
    else
        if workspace:FindFirstChild"av" then
            workspace.av:Destroy()
        end
    end
end)

--> DamageBooster Core
if GetAliveState() then
    client:WaitFor"EntityDamageEvent":andThen(
        function(v)
            v:Connect(
                function(black)
                    if black.entityInstance == LocalEntity.Character then
                        warn"[Moon]: EntityDamageEvent Fired"
                        task.spawn(
                            function()
                                _superSpeed = true
                                task.wait(0.89)
                                _superSpeed = false
                            end
                        )
                    end
                end
            )
        end
    )
end

game.CoreGui.ExperienceChat.appLayout.chatWindow.scrollingView.bottomLockedScrollView.RCTScrollView.RCTScrollContentView.ChildAdded:Connect(
    function(x)
        if library.Constants.chateff and library.Constants.chatfont ~= "None" then
            Moon.FontManager.setFont(library.Constants.chatfont, x)
        end
    end
)

--> Jump Circles
if GetAliveState() then
    local hum = LocalEntity.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.Jumping:Connect(
            function()
                if library.Constants.jumpcircle then
                    if circleDebounce then
                        return
                    end
                    local emitter = Circle:Clone()
                    emitter.Parent = workspace
                    emitter.CFrame = LocalEntity.Character.HumanoidRootPart.CFrame - Vector3.new(0, 3, 0)
                    emitter.ParticleEmitter:Emit(1)
                    task.delay(
                        emitter.ParticleEmitter.Lifetime.Max,
                        function()
                            emitter:Destroy()
                        end
                    )
                    circleDebounce = true
                    task.delay(
                        0.5,
                        function()
                            circleDebounce = false
                        end
                    )
                end
            end
        )
    end
end

LocalEntity.CharacterAdded:Connect(
    function()
        task.wait(1)
        local character = LocalEntity.Character
        if character ~= nil then
            local hum = LocalEntity.Character:FindFirstChildOfClass"Humanoid"
            if hum then
                hum.Jumping:Connect(
                    function()
                        if library.Constants.jumpcircle then
                            if circleDebounce then
                                return
                            end
                            local emitter = Circle:Clone()
                            emitter.Parent = workspace
                            emitter.CFrame =
                                LocalEntity.Character.HumanoidRootPart.CFrame - Vector3.new(0, 3, 0)
                            emitter.ParticleEmitter:Emit(1)
                            task.delay(
                                emitter.ParticleEmitter.Lifetime.Max,
                                function()
                                    emitter:Destroy()
                                end
                            )
                            circleDebounce = true
                            task.delay(
                                0.5,
                                function()
                                    circleDebounce = false
                                end
                            )
                        end
                    end
                )
            end
        end
    end
)

--> Auto Queue
local function moonstate() return require(LocalEntity.PlayerScripts.TS.ui.store).ClientStore:getState().Game.matchState end
local function getqueething() return require(LocalEntity.PlayerScripts.TS.ui.store).ClientStore:getState().Game.queueType end

task.spawn(function()
    repeat
        task.wait(1)
    until moonstate() == 2
    if library.Constants.autoqueue then
        game:GetService("ReplicatedStorage"):FindFirstChild(
            "events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"
        ).joinQueue:FireServer({["queueType"] = getqueething()})
        warn("[Moon @ QueueHandler]: Queued")
    end

    return;
end)
