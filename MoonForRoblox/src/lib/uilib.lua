local Library = {}
local Fonts = Moon.FontManager
local GUI = Instance.new("ScreenGui", game.CoreGui)
local l_order = 0
GUI.ZIndexBehavior = "Sibling"

if not isfolder("MoonForRoblox/src/cfg") then
    makefolder("MoonForRoblox/src/cfg")
end

local JSON = game:GetService("HttpService")

local CFG
if isfile("MoonForRoblox/src/cfg/bedwars.JSON") then
    CFG = JSON:JSONDecode(readfile("MoonForRoblox/src/cfg/bedwars.JSON"))
else
    CFG = {}
end

Library.Constants = {}
Library.Options = {}
Library.Windows = {}
Library.Config = CFG
getgenv().lua_library = Library
shared.GUI = GUI

local EncodedTable = JSON:JSONEncode(Library.Config)

function Library.MakeHandler()
    local Handler = {}
    local HandlerFrame = Instance.new("ScrollingFrame", GUI)
    HandlerFrame.BackgroundTransparency = 1
    HandlerFrame.Size = UDim2.new(1, 0, 1, 0)
    HandlerFrame.CanvasSize = UDim2.new(0, 0, 11111, 0)
    HandlerFrame.AutomaticSize = Enum.AutomaticSize.Y
    HandlerFrame.Position = UDim2.new(0, 20, 0, 9)
    HandlerFrame.BorderSizePixel = 0
    HandlerFrame.ScrollBarImageTransparency = 1

    local UIList = Instance.new("UIListLayout", HandlerFrame)
    UIList.Padding = UDim.new(0, 12)
    UIList.FillDirection = Enum.FillDirection.Horizontal

    function Handler.MakeTab(info)
        local DefName = info.Name
        local Name = info.Name
        local Icon = info.Icon
        local Size = info.Size
        local Divided = info.Divided or false

        if Library.Config[Name] == nil then
            Library.Config[Name] = {}
        end

        local Tab = {}

        local TabFrame = Instance.new("CanvasGroup", HandlerFrame)
        TabFrame.BackgroundTransparency = 0.2
        TabFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
        TabFrame.Size = UDim2.new(0, 276, 0, 52)
        TabFrame.AutomaticSize = Enum.AutomaticSize.Y
        Library.Windows[Name] = TabFrame
        local Corner = Instance.new("UICorner", TabFrame)
        Corner.CornerRadius = UDim.new(0, 25)

        local UIStroke = Instance.new("UIStroke", TabFrame)
        UIStroke.Thickness = 1
        UIStroke.Color = Color3.fromRGB(93, 82, 82)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local NameText = Instance.new("TextLabel", TabFrame)
        NameText.BackgroundColor3 = Color3.fromRGB(199, 199, 197)
        NameText.BackgroundTransparency = 1
        NameText.BorderColor3 = Color3.fromRGB(0, 0, 0)
        NameText.BorderSizePixel = 0
        NameText.Position = UDim2.new(0, 54, 0, 12)
        NameText.Size = UDim2.new(0, 0, 0, 0)
        NameText.AutomaticSize = Enum.AutomaticSize.XY
        NameText.Font = Enum.Font.GothamBold
        NameText.Text = Name
        NameText.TextColor3 = Color3.fromRGB(199, 199, 197)
        NameText.TextSize = 29
        Fonts.setFont("SFDisplay", NameText)

        local offsetX = Size.X.Offset
        local nOffsetX = 14
        local calcX = 23 - ((offsetX - nOffsetX) / 2)

        local offsetY = Size.Y.Offset
        local nOffsetY = 19
        local calcY = 18 + ((nOffsetY - offsetY) / 2)

        local IconFrame = Instance.new("ImageLabel", TabFrame)
        IconFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        IconFrame.BackgroundTransparency = 1
        IconFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        IconFrame.BorderSizePixel = 0
        IconFrame.Position = UDim2.new(0, calcX, 0, calcY)
        if not Divided then
            IconFrame.Position = UDim2.new(0, calcX, 0, calcY)
        end
        IconFrame.Size = Size
        IconFrame.Image = Icon

        local ToggleHandler = Instance.new("Frame", TabFrame)
        ToggleHandler.BackgroundTransparency = 1
        ToggleHandler.Size = UDim2.new(0, 276, 0, 0)
        ToggleHandler.Position = UDim2.new(0, 0, 0, 55)
        ToggleHandler.BorderSizePixel = 0

        local UIList = Instance.new("UIListLayout", ToggleHandler)
        UIList.FillDirection = Enum.FillDirection.Vertical
        UIList.SortOrder = "LayoutOrder"

        function Tab.MakeToggle(info)
            local OName = info.Name
            local Name = info.Name
            local Function = info.Function or function()
                end
            local Constant = info.Constant

            if Library.Config[DefName][Name] == nil then
                Library.Config[DefName][Name] = {Enabled = false, Keybind = "NONE"}
            end

            local ToggleT = {
                Enabled = Library.Config[DefName][Name].Enabled,
                Keybind = Library.Config[DefName][Name].Keybind
            }

            local Toggle = Instance.new("TextButton", ToggleHandler)
            Toggle.Size = UDim2.new(0, 276, 0, 45)
            Toggle.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            Toggle.BackgroundTransparency = 0.7
            Toggle.Text = ""
            Toggle.AutoButtonColor = false
            Toggle.ZIndex = 5
            Toggle.LayoutOrder = l_order
            Toggle.BorderSizePixel = 0
            Toggle.Name = Name

            local NameText = Instance.new("TextLabel", Toggle)
            NameText.Position = UDim2.new(0, 15, 0, 12)
            NameText.Size = UDim2.new(0, 0, 0, 19)
            NameText.AutomaticSize = Enum.AutomaticSize.X
            NameText.TextSize = 19
            NameText.Text = Name
            NameText.BackgroundTransparency = 1
            NameText.TextColor3 = Color3.fromRGB(136, 136, 136)
            Fonts.setFont("SFDisplay", NameText)
            l_order = l_order + 2

            local KeybindFrame = game:GetObjects("rbxassetid://14248071640")[1]
            KeybindFrame.Visible = false
            KeybindFrame.Parent = Toggle
            Fonts.setFont("SFDisplay", KeybindFrame.TextLabel)

            local settingBind = false

            function ToggleT.Toggle()
                ToggleT.Enabled = not ToggleT.Enabled
                task.spawn(info.Function, ToggleT.Enabled)
                Library.Constants[Constant] = ToggleT.Enabled
                Library.Config[DefName][Name].Enabled = ToggleT.Enabled
                if ToggleT.Enabled then
                    Toggle.BackgroundColor3 = Color3.fromRGB(30, 93, 187)
                    Toggle.BackgroundTransparency = 0
                    NameText.TextColor3 = Color3.fromRGB(242, 242, 242)
                else
                    Toggle.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                    Toggle.BackgroundTransparency = 0.7
                    NameText.TextColor3 = Color3.fromRGB(136, 136, 136)
                end
            end

            if Library.Config[DefName][Name].Enabled then
                Toggle.BackgroundColor3 = Color3.fromRGB(30, 93, 187)
                Toggle.BackgroundTransparency = 0
                NameText.TextColor3 = Color3.fromRGB(242, 242, 242)
                Library.Constants[Constant] = ToggleT.Enabled
                task.spawn(info.Function, ToggleT.Enabled)
            end

            Toggle.MouseButton1Click:Connect(ToggleT.Toggle)

            function ToggleT.AsignKeyBind(INP, Connect)
                if settingBind then
                    local KC
                    local KCName
                    print(type(INP))
                    if type(INP) == "string" then
                        KC = Enum.KeyCode[INP]
                        KCName = INP
                    else
                        KC = INP.KeyCode
                        KCName = INP.KeyCode.Name
                    end
                    print(INP, KC, KCName)
                    if KC == ToggleT.Keybind then
                        ToggleT.Keybind = "NONE"
                        Library.Config[DefName][Name].Keybind = "NONE"
                        KeybindFrame.Visible = false
                        if Connect ~= "MOOCONFIGSYSETESM!!!!" then
                            Connect:Disconnect()
                        end
                    else
                        ToggleT.Keybind = KC
                        Library.Config[DefName][Name].Keybind = KCName
                        KeybindFrame.Visible = true
                        KeybindFrame.TextLabel.Text = KCName
                        if Connect ~= "MOOCONFIGSYSETESM!!!!" then
                            Connect:Disconnect()
                        end
                    end
                end
            end

            if Library.Config[DefName][Name].Keybind ~= nil then
                if Library.Config[DefName][Name].Keybind ~= "NONE" then
                    settingBind = true
                    ToggleT.AsignKeyBind(Library.Config[DefName][Name].Keybind, "MOOCONFIGSYSETESM!!!!")
                    settingBind = false
                end
            end

            game:GetService("UserInputService").InputBegan:Connect(
                function(i, gameProcessed)
                    if not gameProcessed then
                        if
                            i.UserInputType == Enum.UserInputType.Keyboard and i.KeyCode == ToggleT.Keybind and
                                not settingBind
                         then
                            ToggleT.Toggle()
                        end
                    end
                end
            )

            local ConnectBind
            local ConnectBind2
            local shiftheld = false
            game:GetService("UserInputService").InputBegan:Connect(
                function(i, gameProcessed)
                    if i.UserInputType == Enum.UserInputType.Keyboard and i.KeyCode == Enum.KeyCode.LeftShift then
                        shiftheld = true
                    end
                end
            )

            game:GetService("UserInputService").InputEnded:Connect(
                function(i, gameProcessed)
                    if i.UserInputType == Enum.UserInputType.Keyboard and i.KeyCode == Enum.KeyCode.LeftShift then
                        shiftheld = false
                    end
                end
            )

            Toggle.MouseButton2Click:Connect(
                function()
                    if shiftheld then
                        print("Keybind Handler Started")
                        settingBind = true
                        print(settingBind)
                        ConnectBind2 =
                            game:GetService("UserInputService").InputBegan:Connect(
                            function(i, gameProcessed)
                                if not gameProcessed then
                                    if i.UserInputType == Enum.UserInputType.Keyboard then
                                        ToggleT.AsignKeyBind(i, ConnectBind2)
                                        task.wait()
                                        settingBind = false
                                    end
                                end
                            end
                        )
                    else
                        if Library.Options[Toggle.Name] ~= nil then
                            Library.Options[Toggle.Name].Visible = not Library.Options[Toggle.Name].Visible
                        end
                    end
                end
            )

            function ToggleT.MakeOptions()
                local OptionToggle = {}

                if Library.Config[DefName][OName].Options == nil then
                    Library.Config[DefName][OName].Options = {}
                end

                local OptionFrame = Instance.new("Frame", ToggleHandler)
                OptionFrame.BackgroundTransparency = 1
                OptionFrame.BorderSizePixel = 0
                OptionFrame.Size = UDim2.new(0, 275, 0, 0)
                OptionFrame.Visible = false
                OptionFrame.AutomaticSize = Enum.AutomaticSize.Y

                local UIListOption = Instance.new("UIListLayout", OptionFrame)
                UIListOption.FillDirection = Enum.FillDirection.Vertical
                UIListOption.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListOption.VerticalAlignment = Enum.VerticalAlignment.Top
                UIListOption.SortOrder = "LayoutOrder"
                UIListOption.Padding = UDim.new(0, 7)

                local FrameOne = Instance.new("Frame", OptionFrame)
                FrameOne.BackgroundTransparency = 1
                FrameOne.BorderSizePixel = 0
                FrameOne.Size = UDim2.new(0, 275, 0, 1)
                FrameOne.LayoutOrder = -1

                local FrameTwo = Instance.new("Frame", OptionFrame)
                FrameTwo.BackgroundTransparency = 1
                FrameTwo.BorderSizePixel = 0
                FrameTwo.Size = UDim2.new(0, 275, 0, 0)
                FrameTwo.LayoutOrder = 99999999
                OptionFrame.LayoutOrder = Toggle.LayoutOrder + 1
                Library.Options[Toggle.Name] = OptionFrame

                return OptionToggle
            end

            function ToggleT.MakeDropdown(info)
                local elements = info.Elements
                local text = info.Text
                local constant = info.Constant
                local obj = game:GetObjects("rbxassetid://14231456279")[1]
                local Sample = obj.allElements.TextLabel

                if Library.Config[DefName][OName].Options[text] == nil then
                    Library.Config[DefName][OName].Options[text] = {Chosen = elements[1]}
                end

                obj.Parent = Library.Options[Toggle.Name]
                obj.Frame.TextLabel.Text = Library.Config[DefName][OName].Options[text].Chosen
                obj.Frame.TextLabel.TextSize = obj.Frame.TextLabel.TextSize + 2
                obj.Frame.TextLabel.Position = UDim2.new(0, 8, 0, 7)
                obj.Frame.Frame.ImageLabel.Image = "rbxassetid://14238256425"
                obj.Frame.Frame.ImageLabel.Rotation = 90
                Fonts.setFont("SFDisplay", obj.Frame.TextLabel)
                obj.allElements.Visible = false
                obj.allElements.AutomaticSize = "None"

                Library.Constants[constant] = Library.Config[DefName][OName].Options[text].Chosen

                for _, v in next, elements do
                    local item = Sample:Clone()
                    item.Name = v
                    Fonts.setFont("SFDisplay", item)
                    item.TextSize = 17
                    item.Text = "  " .. v
                    item.Parent = obj.allElements
                    item.BackgroundTransparency = 1

                    if (item.Name == Library.Config[DefName][OName].Options[text].Chosen) then
                        item.BackgroundTransparency = 0
                    end

                    item.TextButton.MouseButton1Click:Connect(
                        function()
                            for __, butt in next, obj.allElements:GetChildren() do
                                if (butt:IsA("TextLabel")) then
                                    if not (butt.Name == item.Name) then
                                        butt.ImageLabel.ImageTransparency = 1
                                        butt.BackgroundTransparency = 1
                                    end
                                end
                            end
                            item.BackgroundTransparency = 0
                            item.ImageLabel.ImageTransparency = 0
                            obj.Frame.TextLabel.Text = item.Name
                            Library.Constants[constant] = item.Name
                            Library.Config[DefName][OName].Options[text].Chosen = item.Name
                        end
                    )
                end

                for _, v in next, obj.allElements:GetChildren() do
                    if (v:IsA("TextLabel")) then
                        if not (v.Name == Library.Config[DefName][OName].Options[text].Chosen) then
                            v.ImageLabel.ImageTransparency = 1
                        end
                    end
                end

                obj.Frame.TextButton.MouseButton1Click:Connect(
                    function()
                        obj.allElements.Visible = not obj.allElements.Visible
                        if obj.allElements.Visible then
                            obj.allElements.AutomaticSize = "Y"
                            obj.Frame.Frame.ImageLabel.Rotation = 0
                        else
                            obj.allElements.AutomaticSize = "None"
                            obj.Frame.Frame.ImageLabel.Rotation = 90
                        end
                    end
                )

                Sample:Destroy()
                obj.Text = text
                obj.TextSize = 17
                Fonts.setFont("SFDisplay", obj)
            end

            function ToggleT.MakeSubToggle(info)
                if Library.Config[DefName][OName].Options[info.Text] == nil then
                    Library.Config[DefName][OName].Options[info.Text] = {Enabled = false}
                end

                local obj = game:GetObjects("rbxassetid://14240869073")[1]
                local on = Library.Config[DefName][OName].Options[info.Text].Enabled
                obj.Frame.BackgroundTransparency = 0
                obj.Parent = Library.Options[Toggle.Name]
                obj.Text = info.Text
                obj.TextSize = 17
                obj.Frame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
                Fonts.setFont("SFDisplay", obj)
                Library.Constants[info.Constant] = on
                obj.TextButton.MouseButton1Click:Connect(
                    function()
                        Library.Constants[info.Constant] = on
                        Library.Config[DefName][OName].Options[info.Text].Enabled = on
                        if on then
                            obj.Frame.Frame:TweenPosition(
                                UDim2.new(0, 4, 0, 4),
                                Enum.EasingDirection.In,
                                Enum.EasingStyle.Linear,
                                .22,
                                true
                            )
                            on = false
                            obj.Frame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
                        else
                            obj.Frame.Frame:TweenPosition(
                                UDim2.new(0, 19, 0, 4),
                                Enum.EasingDirection.InOut,
                                Enum.EasingStyle.Quad,
                                .22,
                                true
                            )
                            on = true
                            obj.Frame.BackgroundColor3 = Color3.fromRGB(30, 93, 187)
                        end
                        Library.Constants[info.Constant] = on
                        task.spawn(info.Function, on)
                    end
                )

                if Library.Config[DefName][OName].Options[info.Text].Enabled then
                    obj.Frame.Frame:TweenPosition(
                        UDim2.new(0, 19, 0, 4),
                        Enum.EasingDirection.InOut,
                        Enum.EasingStyle.Quad,
                        .22,
                        true
                    )
                    on = true
                    obj.Frame.BackgroundColor3 = Color3.fromRGB(30, 93, 187)
                    Library.Constants[info.Constant] = on
                    task.spawn(info.Function, on)
                end
            end

            function ToggleT.MakeSlider(info)
                local Name = info.Name
                local Function = info.Function
                local min = info.Min
                local max = info.Max
                local default = info.Default
                local Round = info.Round

                if Library.Config[DefName][OName].Options[Name] == nil then
                    Library.Config[DefName][OName].Options[Name] = {Value = default}
                end

                local Slider = {Value = Library.Config[DefName][OName].Options[Name].Value}

                local SliderFrame = game:GetObjects("rbxassetid://14238485722")[1]
                SliderFrame.Parent = Library.Options[Toggle.Name]
                local slider2 = SliderFrame.Frame.Frame
                local slidertext = SliderFrame.TextLabel
                local slider = SliderFrame.Frame
                local sliderhit = SliderFrame.Frame.Frame.TextButton
                sliderhit.AutoButtonColor = false
                slidertext.Text = default
                SliderFrame.Text = Name
                Fonts.setFont("SFDisplay", slidertext)
                Fonts.setFont("SFDisplay", SliderFrame)

                Library.Constants[info.Constant] = Slider.Value

                local mouse = game.Players.LocalPlayer:GetMouse()
                local function slide(input)
                    local sizeX =
                        math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                    slider2.Size = UDim2.new(sizeX, 0, 1, 0)
                    sliderhit.Position = UDim2.new(0, (sizeX * 248) - 5, 0, -5)
                    local value = math.floor(((((max - min) * sizeX) + min) * (10 ^ Round)) + 0.5) / (10 ^ Round)
                    Slider["Value"] = value
                    slidertext.Text = tostring(value)
                    Library.Constants[info.Constant] = value
                    Library.Config[DefName][OName].Options[Name].Value = value
                    if not info["OnInputEnded"] then
                        Function(value)
                    end
                end
                local sliding
                sliderhit.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            sliding = true
                            slide(input)
                        end
                    end
                )

                sliderhit.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if info["OnInputEnded"] then
                                Function(Slider.Value)
                            end
                            sliding = false
                        end
                    end
                )

                game:GetService("UserInputService").InputChanged:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement then
                            if sliding then
                                slide(input)
                            end
                        end
                    end
                )

                Slider["Set"] = function(value)
                    local value = math.floor((math.clamp(value, min, max) * (10 ^ Round)) + 0.5) / (10 ^ Round)
                    local sizeX = slider.AbsoluteSize.X
                    slider2.Size = UDim2.new(sizeX, 0, 1, 0)
                    Slider["Value"] = value
                    local thingy = (value - min) / (max - min)
                    Library.Constants[info.Constant] = value
                    Library.Config[DefName][OName].Options[Name].Value = value
                    slider2.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                    sliderhit.Position = UDim2.new(0, (thingy * 248) - 5, 0, -5)
                    slidertext.Text = tostring(value)
                    Function(value)
                end

                Slider.Set(Slider["Value"])

                return Slider
            end

            return ToggleT
        end

        return Tab
    end

    return Handler
end

local blurUtil =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/bedwars/blur.lua"))()

game:GetService("UserInputService").InputBegan:Connect(
    function(i)
        if i.KeyCode == Enum.KeyCode.V then
            GUI.Enabled = not GUI.Enabled
            if not GUI.Enabled then
                for i, blur in next, workspace.CurrentCamera:GetDescendants() do
                    if (string.find(blur.Name, "moon")) then
                        blur:Remove()
                    end
                end
            end
            if GUI.Enabled then
                if Library.Constants.yblur then
                    for _, vf in next, Library.Windows do
                        blurUtil.new(vf, "moon")
                    end
                end
            else
                for i, blur in next, workspace.CurrentCamera:GetDescendants() do
                    if (string.find(blur.Name, "moon")) then
                        blur:Remove()
                    end
                end
            end
        end
    end
)

task.spawn(
    function()
        repeat
            if not shared.GUI then break; end;
            task.wait(7)
            EncodedTable = JSON:JSONEncode(Library.Config)
            writefile("MoonForRoblox/src/cfg/bedwars.JSON", EncodedTable)
        until not shared.GUI;
    end
)

return Library;