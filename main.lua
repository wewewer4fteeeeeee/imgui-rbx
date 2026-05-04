local util = {}

function util:egg(stringx) 
    local output = {}
    for i = 1, #stringx do
        local charCode = string.byte(stringx, i)
        local egged = ""
        for j = 1, math.random(5, 10) do
            egged = egged .. string.char(math.random(32, 126))
        end
        output[#output+1] = string.format("%03d%s", charCode, egged)
    end
    return table.concat(output)
end

local main = {}
local TweenService = game:GetService("TweenService")


function main:Begin(PROPS) 
    if not PROPS then 
        return
    end

    warn("imgui-rbx ENHANCED | Modern UI with reactive backgrounds");

    local MenuOptions = PROPS or {
        Name = PROPS.Name or "imgui-rbx | enhanced",
        Width = PROPS.Width or 574,
        Height = PROPS.Height or 350
    }

    local function SecureGui(gui_element)
        if (syn and syn.protect_gui) then 
            syn.protect_gui(gui_element)
            gui_element.Parent = game:GetService("CoreGui")                                 
        elseif gethui then
            gui_element.Parent = gethui()  
        else
            error("Cannot secure GUI, it's unsafe to continue.");                           
            gui_element.Parent = game:GetService("Players").LocalPlayer.PlayerGui           
        end
    end

    local function GetFont() 
        local urlllllegoo = PROPS.Font
        
        if urlllllegoo and urlllllegoo:find("http") then
            local uhhsumimportantstuff = "font_" .. game:GetService("HttpService"):GenerateGUID(false):gsub("-",""):sub(1, 8) .. ".ttf"
            local haythisisajson = uhhsumimportantstuff .. ".font"
            
            local hayyyitworkedlegoo, data = pcall(function() return game:HttpGet(urlllllegoo) end)
            if hayyyitworkedlegoo and data then
                writefile(uhhsumimportantstuff, data)
                local hayitsourfont = getcustomasset(uhhsumimportantstuff)
                
                local hayyyitsourfontasajson = {
                    name = "hayyyitsourfont",
                    faces = {{
                        name = "hayyyitsourfont", weight = 400, style = "normal", assetId = hayitsourfont
                    }}
                }
                writefile(haythisisajson, game:GetService("HttpService"):JSONEncode(hayyyitsourfontasajson))
                return Font.new(getcustomasset(haythisisajson))
            end
        end

        return Font.fromId(12187371840)
    end

local function soundsupportyippie(url)
    if not url or url == "" then return nil end
    if not string.find(url, "http") then return url end

    local filename = "sound_" .. game:GetService("HttpService"):GenerateGUID(false):gsub("-",""):sub(1, 8) .. ".mp3"
    
    local success, data = pcall(function() 
        return game:HttpGet(url) 
    end)

    if success and data then
        writefile(filename, data)
        return getcustomasset(filename)
    end

    return nil
end

local assetId = soundsupportyippie(PROPS.Sound)
if assetId then
    local s = Instance.new("Sound")
    s.SoundId = assetId
    s.Parent = game:GetService("SoundService")
    s:Play()
end

    
    local function imagesuportyippie(url)
        if not url or url == "" then return nil end
        if not string.find(url, "http") then return url end
        local filename = "cache_" .. game:GetService("HttpService"):GenerateGUID(false):gsub("-","") .. ".png"
        local success, _ = pcall(function()
            writefile(filename, game:HttpGet(url))
        end)
        if success then
            return getcustomasset(filename)
        end
        return nil
    end

    local ImGui = Instance.new("ScreenGui")
    local Window = Instance.new("Frame")
    local WindowCorner = Instance.new("UICorner")
    local WindowStroke = Instance.new("UIStroke")
    local WindowPanel = Instance.new("Frame")
    local WindowPanelIcon = Instance.new("ImageLabel")
    local MinimiseButton = Instance.new("TextButton")
    local MinimiseButtonIcon = Instance.new("ImageLabel")
    local WindowPanelIconPadding = Instance.new("UIPadding")
    local WindowDisplayName = Instance.new("TextLabel")
    local WindowDisplayNamePadding = Instance.new("UIPadding")
    local ResizeAll = Instance.new("TextButton")
    local ResizeAllIcon = Instance.new("ImageLabel")
    local WindowElementContainer = Instance.new("Frame")
    local WindowElements = Instance.new("ScrollingFrame")
    local WindowElementsLayout = Instance.new("UIListLayout")
    local WindowElementsPadding = Instance.new("UIPadding")
    
    local WindowElementsContainerLayout = Instance.new("UIListLayout")
    local AWindowSep = Instance.new("Frame")

    ImGui.Name = string.format("ImGui-%s", tostring(util:egg(tostring(game:GetService("Players").LocalPlayer.UserId))))
    ImGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ImGui.ResetOnSpawn = false
    SecureGui(ImGui)

    Window.Name = "Window"
    Window.Parent = ImGui
    Window.Active = true
    Window.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    Window.BackgroundTransparency = 0.1
    Window.ClipsDescendants = true
    Window.Position = UDim2.new(0.283211678, 0, 0.155285195, 0)
    Window.Selectable = true
    Window.Size = UDim2.new(0, MenuOptions.Width, 0, MenuOptions.Height)

    WindowCorner.CornerRadius = UDim.new(0, 12)
    WindowCorner.Name = "WindowCorner"
    WindowCorner.Parent = Window

    WindowStroke.Name = "WindowStroke"
    WindowStroke.Parent = Window
    WindowStroke.Color = Color3.fromRGB(80, 80, 100)
    WindowStroke.Thickness = 1.5
    WindowStroke.Transparency = 0.5

    WindowPanel.Name = "WindowPanel"
    WindowPanel.Parent = Window
    WindowPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowPanel.BackgroundTransparency = 1.000
    WindowPanel.Size = UDim2.new(1, 0, 0, 30)
    WindowPanel.ZIndex = 2

    WindowPanelIcon.Name = "WindowPanelIcon"
    WindowPanelIcon.Parent = WindowPanel
    WindowPanelIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    WindowPanelIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowPanelIcon.BackgroundTransparency = 1.000
    WindowPanelIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    WindowPanelIcon.Size = UDim2.new(0.999999881, 0, 1, 0)
    WindowPanelIcon.ZIndex = 2
    WindowPanelIcon.Image = "rbxassetid://13034670565"
    WindowPanelIcon.ScaleType = Enum.ScaleType.Tile
    WindowPanelIcon.ImageTransparency = 0.85

    MinimiseButton.Name = "MinimiseButton"
    MinimiseButton.Parent = WindowPanelIcon
    MinimiseButton.AnchorPoint = Vector2.new(0.5, 0.5)
    MinimiseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinimiseButton.BackgroundTransparency = 1.000
    MinimiseButton.Position = UDim2.new(0, 13, 0.5, 0)
    MinimiseButton.Size = UDim2.new(0.0452961661, 0, 1, 0)
    MinimiseButton.FontFace = GetFont()
    MinimiseButton.Text = ""
    MinimiseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimiseButton.TextSize = 14.000

    MinimiseButtonIcon.Name = "MinimiseButtonIcon"
    MinimiseButtonIcon.Parent = MinimiseButton
    MinimiseButtonIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    MinimiseButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinimiseButtonIcon.BackgroundTransparency = 1.000
    MinimiseButtonIcon.Position = UDim2.new(0.5, 0, 0.5, 2)
    MinimiseButtonIcon.Size = UDim2.new(0, 12, 0, 12)
    MinimiseButtonIcon.Image = "rbxassetid://13034875812"

    WindowPanelIconPadding.Name = "WindowPanelIconPadding"
    WindowPanelIconPadding.Parent = WindowPanelIcon
    WindowPanelIconPadding.PaddingLeft = UDim.new(0, 2)

    WindowDisplayName.Name = "WindowDisplayName"
    WindowDisplayName.Parent = WindowPanelIcon
    WindowDisplayName.AnchorPoint = Vector2.new(0.5, 0.5)
    WindowDisplayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowDisplayName.BackgroundTransparency = 1.000
    WindowDisplayName.Position = UDim2.new(0.5, 0, 0.5, 0)
    WindowDisplayName.Size = UDim2.new(1, 0, 1, 0)
    WindowDisplayName.FontFace = GetFont()
    WindowDisplayName.Text = PROPS.Name
    WindowDisplayName.TextColor3 = Color3.fromRGB(240, 240, 245)
    WindowDisplayName.TextSize = 16.000
    WindowDisplayName.TextXAlignment = Enum.TextXAlignment.Left

    WindowDisplayNamePadding.Name = "WindowDisplayNamePadding"
    WindowDisplayNamePadding.Parent = WindowDisplayName
    WindowDisplayNamePadding.PaddingLeft = UDim.new(0, 30)

    ResizeAll.Name = "ResizeAll"
    ResizeAll.Parent = Window
    ResizeAll.AnchorPoint = Vector2.new(0.5, 0.5)
    ResizeAll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ResizeAll.BackgroundTransparency = 1.000
    ResizeAll.BorderSizePixel = 0
    ResizeAll.Position = UDim2.new(0, 563, 0, 339)
    ResizeAll.Size = UDim2.new(0, 22, 0, 22)
    ResizeAll.FontFace = GetFont()
    ResizeAll.Text = ""
    ResizeAll.TextColor3 = Color3.fromRGB(0, 0, 0)
    ResizeAll.TextSize = 14.000
    ResizeAll.ZIndex = 2

    ResizeAllIcon.Name = "ResizeAllIcon"
    ResizeAllIcon.Parent = ResizeAll
    ResizeAllIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    ResizeAllIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ResizeAllIcon.BackgroundTransparency = 1.000
    ResizeAll.Position = UDim2.new(0.5, 0, 0.5, 0)
    ResizeAllIcon.Size = UDim2.new(1.06818187, 0, 1, 0)
    ResizeAllIcon.ZIndex = -1
    ResizeAllIcon.Image = "rbxassetid://13034819689"

    WindowElementContainer.Name = "WindowElementContainer"
    WindowElementContainer.Parent = Window
    WindowElementContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowElementContainer.BackgroundTransparency = 1.000
    WindowElementContainer.Size = UDim2.new(1, 0, 1, 0)

    WindowElements.Name = "WindowElements"
    WindowElements.Parent = WindowElementContainer
    WindowElements.Active = true
    WindowElements.AnchorPoint = Vector2.new(0.5, 0.5)
    WindowElements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowElements.BackgroundTransparency = 1.000
    WindowElements.BorderSizePixel = 0
    WindowElements.Position = UDim2.new(0.5, 0, 0.555, 0)
    WindowElements.Size = UDim2.new(1, -5, 0.9, 0)
    WindowElements.CanvasSize = UDim2.new(0, 0, 0, 0)
    WindowElements.ScrollBarThickness = 8
    WindowElements.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)

    WindowElementsLayout.Name = "WindowElementsLayout"
    WindowElementsLayout.Parent = WindowElements
    WindowElementsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    WindowElementsLayout.Padding = UDim.new(0, 8)

    WindowElementsPadding.Name = "WindowElementsPadding"
    WindowElementsPadding.Parent = WindowElements
    WindowElementsPadding.PaddingBottom = UDim.new(0, 15)
    WindowElementsPadding.PaddingLeft = UDim.new(0, 7)
    WindowElementsPadding.PaddingRight = UDim.new(0, 20)
    WindowElementsPadding.PaddingTop = UDim.new(0, 10)

    WindowElementsContainerLayout.Name = "WindowElementsContainerLayout"
    WindowElementsContainerLayout.Parent = WindowElementContainer
    WindowElementsContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    AWindowSep.Name = "AWindowSep"
    AWindowSep.Parent = WindowElementContainer
    AWindowSep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    AWindowSep.BackgroundTransparency = 1.000
    AWindowSep.Position = UDim2.new(0.00609756075, 0, 0, 0)
    AWindowSep.Size = UDim2.new(0, 567, 0, 30)

-- skiddie diddy 
local BackgroundContainer = Instance.new("Frame")
BackgroundContainer.Name = "BackgroundContainer"
BackgroundContainer.Parent = Window
BackgroundContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
BackgroundContainer.BackgroundTransparency = 1
BackgroundContainer.Size = UDim2.new(1, 0, 1, 0)
BackgroundContainer.ZIndex = -10
BackgroundContainer.ClipsDescendants = true

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0, 8)
bgCorner.Parent = BackgroundContainer

local nodeCount = 70 
local nodeSize = 4   
local lineMaxDist = 0.15
local nodes = {}
local lineCache = {}
local activeLines = 0

local function getLine(container)
    activeLines = activeLines + 1
    if lineCache[activeLines] then
        lineCache[activeLines].Visible = true
        return lineCache[activeLines]
    end

    local line = Instance.new("Frame")
    line.Name = "ConnectionLine"
    line.BorderSizePixel = 0
    line.BackgroundColor3 = Color3.new(1, 1, 1)
    line.AnchorPoint = Vector2.new(0.5, 0.5)
    line.ZIndex = -9
    line.Parent = container
    table.insert(lineCache, line)
    return line
end

for i = 1, nodeCount do
    local node = Instance.new("Frame")
    node.Size = UDim2.new(0, nodeSize, 0, nodeSize)
    node.BackgroundColor3 = Color3.new(1, 1, 1)
    node.BackgroundTransparency = 0.4 
    node.BorderSizePixel = 0
    node.Parent = BackgroundContainer
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = node

    local randomPos = Vector2.new(math.random(), math.random())
    node.Position = UDim2.new(randomPos.X, 0, randomPos.Y, 0)

    nodes[i] = {
        frame = node,
        pos = randomPos
    }
end

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    if not Window or not Window:IsDescendantOf(game) or not Window.Visible then 
        BackgroundContainer.Visible = false
        return 
    end
    BackgroundContainer.Visible = true
    
    local size = BackgroundContainer.AbsoluteSize
    local mousePos = UserInputService:GetMouseLocation()
    local windowPos = BackgroundContainer.AbsolutePosition
    
    local mX = (mousePos.X - windowPos.X) / size.X
    local mY = (mousePos.Y - windowPos.Y) / size.Y 
    local mouseVec = Vector2.new(mX, mY)

    activeLines = 0
    for _, l in ipairs(lineCache) do l.Visible = false end

    for i, n1 in ipairs(nodes) do
        local mDist = (n1.pos - mouseVec).Magnitude
        
        if mDist < 0.22 then
            local line = getLine(BackgroundContainer)
            local p1 = Vector2.new(n1.pos.X * size.X, n1.pos.Y * size.Y)
            local p2 = Vector2.new(mouseVec.X * size.X, mouseVec.Y * size.Y)
            
            line.BackgroundColor3 = Color3.fromRGB(130, 50, 255)
            line.BackgroundTransparency = 0.2 + (mDist / 0.22) * 0.8
            line.Size = UDim2.new(0, (p1 - p2).Magnitude, 0, 1.5)
            line.Position = UDim2.new(0, (p1.X + p2.X) / 2, 0, (p1.Y + p2.Y) / 2)
            line.Rotation = math.deg(math.atan2(p2.Y - p1.Y, p2.X - p1.X))
            
            n1.frame.BackgroundTransparency = 0
            n1.frame.BackgroundColor3 = Color3.fromRGB(130, 50, 255)
        else
            n1.frame.BackgroundTransparency = 0.4
            n1.frame.BackgroundColor3 = Color3.new(1, 1, 1)
        end

        for j = i + 1, #nodes do
            local n2 = nodes[j]
            local dist = (n1.pos - n2.pos).Magnitude
            if dist < lineMaxDist then
                local line = getLine(BackgroundContainer)
                local p1 = Vector2.new(n1.pos.X * size.X, n1.pos.Y * size.Y)
                local p2 = Vector2.new(n2.pos.X * size.X, n2.pos.Y * size.Y)
                
                line.BackgroundColor3 = Color3.new(1, 1, 1)
                line.BackgroundTransparency = 0.8 + (dist / lineMaxDist) * 0.2
                line.Size = UDim2.new(0, (p1 - p2).Magnitude, 0, 0.5)
                line.Position = UDim2.new(0, (p1.X + p2.X) / 2, 0, (p1.Y + p2.Y) / 2)
                line.Rotation = math.deg(math.atan2(p2.Y - p1.Y, p2.X - p1.X))
            end
        end
    end
end)

    
    local ElementHandler = {}

    function ElementHandler:Text(TextDisplay) 
        local Label_Element = Instance.new("TextLabel")
        Label_Element.Name = "Label_Element"
        Label_Element.Parent = WindowElements
        Label_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label_Element.BackgroundTransparency = 1.000
        Label_Element.Size = UDim2.new(1, 0, 0, 20)
        Label_Element.FontFace = GetFont()
        Label_Element.Text = TextDisplay
        Label_Element.TextColor3 = Color3.fromRGB(240, 240, 250)
        Label_Element.TextSize = 17.000
        Label_Element.TextXAlignment = Enum.TextXAlignment.Left
    end

    function ElementHandler:Button(TextDisplay) 
        local Button_Element = Instance.new("TextButton")
        local Button_ElementPadding = Instance.new("UIPadding")
        local Button_Corner = Instance.new("UICorner")
        local Button_Stroke = Instance.new("UIStroke")
        local OnClick = {}

        Button_Element.Name = "Button_Element"
        Button_Element.Parent = WindowElements
        Button_Element.BackgroundColor3 = Color3.fromRGB(60, 90, 150)
        Button_Element.BorderSizePixel = 0
        Button_Element.Position = UDim2.new(0, 0, 0.0833333358, 0)
        Button_Element.Size = UDim2.new(0, 21, 0, 26)
        Button_Element.FontFace = GetFont()
        Button_Element.Text = TextDisplay
        Button_Element.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button_Element.TextSize = 17.000
        Button_Element.AutoButtonColor = false

        Button_Corner.CornerRadius = UDim.new(0, 6)
        Button_Corner.Parent = Button_Element

        Button_Stroke.Name = "Button_Stroke"
        Button_Stroke.Parent = Button_Element
        Button_Stroke.Color = Color3.fromRGB(100, 130, 200)
        Button_Stroke.Thickness = 1
        Button_Stroke.Transparency = 0.5

        Button_ElementPadding.Name = "Button_ElementPadding"
        Button_ElementPadding.Parent = Button_Element
        Button_ElementPadding.PaddingLeft = UDim.new(0, 10)
        Button_ElementPadding.PaddingRight = UDim.new(0, 10)

        -- Hover effect
        Button_Element.MouseEnter:Connect(function()
            TweenService:Create(Button_Element, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 110, 180)}):Play()
            TweenService:Create(Button_Stroke, TweenInfo.new(0.2), {Transparency = 0.2}):Play()
        end)
        
        Button_Element.MouseLeave:Connect(function()
            TweenService:Create(Button_Element, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 90, 150)}):Play()
            TweenService:Create(Button_Stroke, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
        end)

        Button_Element.Activated:Connect(function(inputObject, clickCount)
            if inputObject.UserInputType.Name == "MouseButton1" then 
                return true
            end
        end)

        function OnClick:Connect(Function) 
            Button_Element.MouseButton1Click:Connect(Function)
        end
                
        local box = Button_Element
        local text = box.Text

        local size = box.TextBounds.X
        
        if game:IsLoaded() then box.Size = UDim2.new(0, size + 25, 0, 26) end

        return OnClick
    end



function ElementHandler:soundyoo(config)
    local haysound = config.haysound or ""
    local asset = soundsupportyippie(haysound)
    
    local sound_element = Instance.new("Frame")
    local play_btn = Instance.new("TextButton")
    local stop_btn = Instance.new("TextButton")
    local sound_obj = Instance.new("Sound")
    local sound_corner = Instance.new("UICorner")
    local stop_corner = Instance.new("UICorner")

    sound_element.Name = "soundyoo_element"
    sound_element.Parent = WindowElements -- Now it correctly sees this variable
    sound_element.BackgroundTransparency = 1
    sound_element.Size = UDim2.new(1, 0, 0, 40)

    sound_obj.Name = "InternalSound"
    sound_obj.SoundId = asset or ""
    sound_obj.Parent = sound_element

    play_btn.Name = "PlayButton"
    play_btn.Parent = sound_element
    play_btn.Size = UDim2.new(0, 80, 0, 30)
    play_btn.Position = UDim2.new(0, 5, 0.5, 0)
    play_btn.AnchorPoint = Vector2.new(0, 0.5)
    play_btn.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
    play_btn.FontFace = GetFont() -- Matches your InputText style
    play_btn.Text = "Play"
    play_btn.TextColor3 = Color3.fromRGB(240, 240, 250)
    play_btn.TextSize = 16

    sound_corner.CornerRadius = UDim.new(0, 6)
    sound_corner.Parent = play_btn

    stop_btn.Name = "StopButton"
    stop_btn.Parent = sound_element
    stop_btn.Size = UDim2.new(0, 80, 0, 30)
    stop_btn.Position = UDim2.new(0, 92, 0.5, 0)
    stop_btn.AnchorPoint = Vector2.new(0, 0.5)
    stop_btn.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
    stop_btn.FontFace = GetFont()
    stop_btn.Text = "Stop"
    stop_btn.TextColor3 = Color3.fromRGB(240, 240, 250)
    stop_btn.TextSize = 16

    stop_corner.CornerRadius = UDim.new(0, 6)
    stop_corner.Parent = stop_btn

    play_btn.MouseButton1Click:Connect(function()
        sound_obj:Play()
    end)

    stop_btn.MouseButton1Click:Connect(function()
        sound_obj:Stop()
    end)

    return sound_element
end

    function ElementHandler:InputText(InputTextOptions) 
        local TextBox_Element = Instance.new("Frame")
        local TextBox_ElementName = Instance.new("TextLabel")
        local TextBox_ElementLayout = Instance.new("UIListLayout")
        local TextBox_ElementInput = Instance.new("TextBox")
        local TextBox_ElementInputPadding = Instance.new("UIPadding")
        local TextBox_Corner = Instance.new("UICorner")
        local TextBox_Stroke = Instance.new("UIStroke")

        TextBox_Element.Name = "TextBox_Element"
        TextBox_Element.Parent = WindowElements
        TextBox_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextBox_Element.BackgroundTransparency = 1.000
        TextBox_Element.Size = UDim2.new(1, 0, 0, 26)

        TextBox_ElementName.Name = "TextBox_ElementName"
        TextBox_ElementName.Parent = TextBox_Element
        TextBox_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextBox_ElementName.BackgroundTransparency = 1.000
        TextBox_ElementName.Position = UDim2.new(2.21000004, 0, 0, 0)
        TextBox_ElementName.Size = UDim2.new(1, 0, 0.0299999993, 23)
        TextBox_ElementName.FontFace = GetFont()
        TextBox_ElementName.Text = InputTextOptions.Name
        TextBox_ElementName.TextColor3 = Color3.fromRGB(240, 240, 250)
        TextBox_ElementName.TextSize = 17.000
        TextBox_ElementName.TextXAlignment = Enum.TextXAlignment.Left

        TextBox_ElementLayout.Name = "TextBox_ElementLayout"
        TextBox_ElementLayout.Parent = TextBox_Element
        TextBox_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        TextBox_ElementLayout.Padding = UDim.new(0, 7)

        TextBox_ElementInput.Name = "TextBox_ElementInput"
        TextBox_ElementInput.Parent = TextBox_Element
        TextBox_ElementInput.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
        TextBox_ElementInput.BorderSizePixel = 0
        TextBox_ElementInput.ClipsDescendants = true
        TextBox_ElementInput.Size = UDim2.new(0.32, 0, 1, 0)
        TextBox_ElementInput.ClearTextOnFocus = false
        TextBox_ElementInput.FontFace = GetFont()
        TextBox_ElementInput.PlaceholderColor3 = Color3.fromRGB(180, 180, 190)
        TextBox_ElementInput.ShowNativeInput = false
        TextBox_ElementInput.Text = ""
        TextBox_ElementInput.TextColor3 = Color3.fromRGB(240, 240, 250)
        TextBox_ElementInput.TextSize = 16.000
        TextBox_ElementInput.TextXAlignment = Enum.TextXAlignment.Left

        TextBox_Corner.CornerRadius = UDim.new(0, 6)
        TextBox_Corner.Parent = TextBox_ElementInput

        TextBox_Stroke.Parent = TextBox_ElementInput
        TextBox_Stroke.Color = Color3.fromRGB(80, 100, 150)
        TextBox_Stroke.Thickness = 1
        TextBox_Stroke.Transparency = 0.6

        TextBox_ElementInputPadding.Name = "TextBox_ElementInputPadding"
        TextBox_ElementInputPadding.Parent = TextBox_ElementInput
        TextBox_ElementInputPadding.PaddingLeft = UDim.new(0, 8)
        TextBox_ElementInputPadding.PaddingRight = UDim.new(0, 8)

        TextBox_ElementInput.Focused:Connect(function()
            TweenService:Create(TextBox_Stroke, TweenInfo.new(0.2), {Transparency = 0.2, Color = Color3.fromRGB(120, 140, 255)}):Play()
        end)

        TextBox_ElementInput.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
            TweenService:Create(TextBox_Stroke, TweenInfo.new(0.2), {Transparency = 0.6, Color = Color3.fromRGB(80, 100, 150)}):Play()
            if enterPressed then
                pcall(InputTextOptions.OnEnter, TextBox_ElementInput.Text)
            end
        end)
    end

    function ElementHandler:SliderFloat(SliderOptions) 
        local Slider_Element = Instance.new("Frame")
        local Slider_ElementFrame = Instance.new("Frame")
        local Slider_ElementSelector = Instance.new("Frame")
        local Slider_ElementValue = Instance.new("TextLabel")
        local Slider_ElementOnInput = Instance.new("TextButton")
        local Slider_ElementName = Instance.new("TextLabel")
        local Slider_ElementLayout = Instance.new("UIListLayout")
        local Slider_Corner = Instance.new("UICorner")
        local Selector_Corner = Instance.new("UICorner")
        local Slider_Stroke = Instance.new("UIStroke")

        Slider_Element.Name = "Slider_Element"
        Slider_Element.Parent = WindowElements
        Slider_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_Element.BackgroundTransparency = 1.000
        Slider_Element.Size = UDim2.new(1, 0, 0, 26)

        Slider_ElementFrame.Name = "Slider_ElementFrame"
        Slider_ElementFrame.Parent = Slider_Element
        Slider_ElementFrame.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
        Slider_ElementFrame.BorderSizePixel = 0
        Slider_ElementFrame.ClipsDescendants = true
        Slider_ElementFrame.Size = UDim2.new(0.32, 0, 1, 0)

        Slider_Corner.CornerRadius = UDim.new(0, 6)
        Slider_Corner.Parent = Slider_ElementFrame

        Slider_Stroke.Parent = Slider_ElementFrame
        Slider_Stroke.Color = Color3.fromRGB(80, 100, 150)
        Slider_Stroke.Thickness = 1
        Slider_Stroke.Transparency = 0.6

        Slider_ElementSelector.Name = "Slider_ElementSelector"
        Slider_ElementSelector.Parent = Slider_ElementFrame
        Slider_ElementSelector.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider_ElementSelector.BackgroundColor3 = Color3.fromRGB(120, 140, 255)
        Slider_ElementSelector.BackgroundTransparency = 0
        Slider_ElementSelector.BorderSizePixel = 0
        Slider_ElementSelector.Position = UDim2.new(0, 10, 0.5, 0)
        Slider_ElementSelector.Size = UDim2.new(0, 16, 0, 24)

        Selector_Corner.CornerRadius = UDim.new(0, 4)
        Selector_Corner.Parent = Slider_ElementSelector

        Slider_ElementValue.Name = "Slider_ElementValue"
        Slider_ElementValue.Parent = Slider_ElementFrame
        Slider_ElementValue.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider_ElementValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementValue.BackgroundTransparency = 1.000
        Slider_ElementValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        Slider_ElementValue.Size = UDim2.new(1, 0, 1, 0)
        Slider_ElementValue.FontFace = GetFont()
        Slider_ElementValue.LineHeight = 0.930
        Slider_ElementValue.Text = SliderOptions.Default
        Slider_ElementValue.TextColor3 = Color3.fromRGB(240, 240, 250)
        Slider_ElementValue.TextSize = 17.000

        Slider_ElementOnInput.Name = "Slider_ElementOnInput"
        Slider_ElementOnInput.Parent = Slider_ElementFrame
        Slider_ElementOnInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementOnInput.BackgroundTransparency = 1.000
        Slider_ElementOnInput.Size = UDim2.new(1, 0, 1, 0)
        Slider_ElementOnInput.FontFace = GetFont()
        Slider_ElementOnInput.Text = ""
        Slider_ElementOnInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Slider_ElementOnInput.TextSize = 14.000

        Slider_ElementName.Name = "Slider_ElementName"
        Slider_ElementName.Parent = Slider_Element
        Slider_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementName.BackgroundTransparency = 1.000
        Slider_ElementName.Position = UDim2.new(2.21000004, 0, 0, 0)
        Slider_ElementName.Size = UDim2.new(1, 0, 0.0299999993, 23)
        Slider_ElementName.FontFace = GetFont()
        Slider_ElementName.Text = SliderOptions.Name
        Slider_ElementName.TextColor3 = Color3.fromRGB(240, 240, 250)
        Slider_ElementName.TextSize = 17.000
        Slider_ElementName.TextXAlignment = Enum.TextXAlignment.Left

        Slider_ElementLayout.Name = "Slider_ElementLayout"
        Slider_ElementLayout.Parent = Slider_Element
        Slider_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        Slider_ElementLayout.Padding = UDim.new(0, 7)

        local minValue = SliderOptions.Min
        local maxValue = SliderOptions.Max
        local decimalPlaces = 3
        local defaultValue = SliderOptions.Default

        local function updateSlider(input)
            local sliderWidth = Slider_ElementOnInput.AbsoluteSize.X - 10
            local sliderPosition = math.clamp(input.Position.X - (Slider_ElementOnInput.AbsolutePosition.X + 5), 0, sliderWidth) / sliderWidth
            local sliderValue = minValue + (maxValue - minValue) * sliderPosition

            if sliderPosition <= 0 then
                sliderPosition = 0
                sliderValue = minValue
            elseif sliderPosition >= 1 then
                sliderPosition = 1
                sliderValue = maxValue
            else
                sliderValue = minValue + (maxValue - minValue) * sliderPosition
            end

            Slider_ElementValue.Text = string.format("%."..decimalPlaces.."f", sliderValue)
            Slider_ElementSelector.Position = UDim2.new(sliderPosition, 0, 0.5, 0)

            pcall(SliderOptions.OnChanged, sliderValue)
        end

        local function setSliderValue(value)
            value = math.clamp(value, minValue, maxValue)
            local sliderPosition = (value - minValue) / (maxValue - minValue)
            Slider_ElementValue.Text = string.format("%."..decimalPlaces.."f", value)
            Slider_ElementSelector.Position = UDim2.new(sliderPosition, 0, 0.5, 0)
        end

        setSliderValue(defaultValue)

        local dragging = false

        Slider_ElementOnInput.MouseButton1Down:Connect(function()
            dragging = true
            TweenService:Create(Slider_ElementSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 18, 0, 26)}):Play()
        end)

        Slider_ElementOnInput.MouseButton1Up:Connect(function()
            dragging = false
            TweenService:Create(Slider_ElementSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 16, 0, 24)}):Play()
        end)

        Slider_ElementFrame.MouseLeave:Connect(function() 
            dragging = false
            TweenService:Create(Slider_ElementSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 16, 0, 24)}):Play()
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                updateSlider(input)
            end
        end)
    end

    function ElementHandler:SliderInteger(SliderOptions) 
        local Slider_Element = Instance.new("Frame")
        local Slider_ElementFrame = Instance.new("Frame")
        local Slider_ElementSelector = Instance.new("Frame")
        local Slider_ElementValue = Instance.new("TextLabel")
        local Slider_ElementOnInput = Instance.new("TextButton")
        local Slider_ElementName = Instance.new("TextLabel")
        local Slider_ElementLayout = Instance.new("UIListLayout")
        local Slider_Corner = Instance.new("UICorner")
        local Selector_Corner = Instance.new("UICorner")
        local Slider_Stroke = Instance.new("UIStroke")

        Slider_Element.Name = "Slider_Element"
        Slider_Element.Parent = WindowElements
        Slider_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_Element.BackgroundTransparency = 1.000
        Slider_Element.Size = UDim2.new(1, 0, 0, 26)

        Slider_ElementFrame.Name = "Slider_ElementFrame"
        Slider_ElementFrame.Parent = Slider_Element
        Slider_ElementFrame.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
        Slider_ElementFrame.BorderSizePixel = 0
        Slider_ElementFrame.ClipsDescendants = true
        Slider_ElementFrame.Size = UDim2.new(0.32, 0, 1, 0)

        Slider_Corner.CornerRadius = UDim.new(0, 6)
        Slider_Corner.Parent = Slider_ElementFrame

        Slider_Stroke.Parent = Slider_ElementFrame
        Slider_Stroke.Color = Color3.fromRGB(80, 100, 150)
        Slider_Stroke.Thickness = 1
        Slider_Stroke.Transparency = 0.6

        Slider_ElementSelector.Name = "Slider_ElementSelector"
        Slider_ElementSelector.Parent = Slider_ElementFrame
        Slider_ElementSelector.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider_ElementSelector.BackgroundColor3 = Color3.fromRGB(120, 140, 255)
        Slider_ElementSelector.BackgroundTransparency = 0
        Slider_ElementSelector.BorderSizePixel = 0
        Slider_ElementSelector.Position = UDim2.new(0, 10, 0.5, 0)
        Slider_ElementSelector.Size = UDim2.new(0, 16, 0, 24)

        Selector_Corner.CornerRadius = UDim.new(0, 4)
        Selector_Corner.Parent = Slider_ElementSelector

        Slider_ElementValue.Name = "Slider_ElementValue"
        Slider_ElementValue.Parent = Slider_ElementFrame
        Slider_ElementValue.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider_ElementValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementValue.BackgroundTransparency = 1.000
        Slider_ElementValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        Slider_ElementValue.Size = UDim2.new(1, 0, 1, 0)
        Slider_ElementValue.FontFace = GetFont()
        Slider_ElementValue.LineHeight = 0.930
        Slider_ElementValue.Text = SliderOptions.Default
        Slider_ElementValue.TextColor3 = Color3.fromRGB(240, 240, 250)
        Slider_ElementValue.TextSize = 17.000

        Slider_ElementOnInput.Name = "Slider_ElementOnInput"
        Slider_ElementOnInput.Parent = Slider_ElementFrame
        Slider_ElementOnInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementOnInput.BackgroundTransparency = 1.000
        Slider_ElementOnInput.Size = UDim2.new(1, 0, 1, 0)
        Slider_ElementOnInput.FontFace = GetFont()
        Slider_ElementOnInput.Text = ""
        Slider_ElementOnInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Slider_ElementOnInput.TextSize = 14.000

        Slider_ElementName.Name = "Slider_ElementName"
        Slider_ElementName.Parent = Slider_Element
        Slider_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementName.BackgroundTransparency = 1.000
        Slider_ElementName.Position = UDim2.new(2.21000004, 0, 0, 0)
        Slider_ElementName.Size = UDim2.new(1, 0, 0.0299999993, 23)
        Slider_ElementName.FontFace = GetFont()
        Slider_ElementName.Text = SliderOptions.Name
        Slider_ElementName.TextColor3 = Color3.fromRGB(240, 240, 250)
        Slider_ElementName.TextSize = 17.000
        Slider_ElementName.TextXAlignment = Enum.TextXAlignment.Left

        Slider_ElementLayout.Name = "Slider_ElementLayout"
        Slider_ElementLayout.Parent = Slider_Element
        Slider_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        Slider_ElementLayout.Padding = UDim.new(0, 7)

        local minValue = SliderOptions.Min
        local maxValue = SliderOptions.Max
        local decimalPlaces = 0
        local defaultValue = SliderOptions.Default

        local function updateSlider(input)
            local sliderWidth = Slider_ElementOnInput.AbsoluteSize.X - 10
            local sliderPosition = math.clamp(input.Position.X - (Slider_ElementOnInput.AbsolutePosition.X + 5), 0, sliderWidth) / sliderWidth
            local sliderValue = minValue + (maxValue - minValue) * sliderPosition

            if sliderPosition <= 0 then
                sliderPosition = 0
                sliderValue = minValue
            elseif sliderPosition >= 1 then
                sliderPosition = 1
                sliderValue = maxValue
            else
                sliderValue = math.floor(minValue + (maxValue - minValue) * sliderPosition)
            end

            Slider_ElementValue.Text = string.format("%."..decimalPlaces.."f", sliderValue)
            Slider_ElementSelector.Position = UDim2.new(sliderPosition, 0, 0.5, 0)

            pcall(SliderOptions.OnChanged, sliderValue)
        end

        local function setSliderValue(value)
            value = math.clamp(value, minValue, maxValue)
            local sliderPosition = (value - minValue) / (maxValue - minValue)
            Slider_ElementValue.Text = string.format("%."..decimalPlaces.."f", value)
            Slider_ElementSelector.Position = UDim2.new(sliderPosition, 0, 0.5, 0)
        end

        setSliderValue(defaultValue)

        local dragging = false

        Slider_ElementOnInput.MouseButton1Down:Connect(function()
            dragging = true
            TweenService:Create(Slider_ElementSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 18, 0, 26)}):Play()
        end)

        Slider_ElementOnInput.MouseButton1Up:Connect(function()
            dragging = false
            TweenService:Create(Slider_ElementSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 16, 0, 24)}):Play()
        end)

        Slider_ElementFrame.MouseLeave:Connect(function() 
            dragging = false
            TweenService:Create(Slider_ElementSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 16, 0, 24)}):Play()
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                updateSlider(input)
            end
        end)
    end

    function ElementHandler:CheckBox(CheckBoxOptions) 
        local CheckBox_Element = Instance.new("Frame")
        local CheckBox_ElementLayout = Instance.new("UIListLayout")
        local CheckBox_ElementBox = Instance.new("Frame")
        local CheckBox_ElementBoxInput = Instance.new("TextButton")
        local CheckBox_ElementImage = Instance.new("ImageLabel")
        local CheckBox_ElementName = Instance.new("TextLabel")
        local CheckBox_Corner = Instance.new("UICorner")
        local CheckBox_Stroke = Instance.new("UIStroke")

        local Enabled = CheckBoxOptions.Enabled

        CheckBox_Element.Name = "CheckBox_Element"
        CheckBox_Element.Parent = WindowElements
        CheckBox_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_Element.BackgroundTransparency = 1.000
        CheckBox_Element.Size = UDim2.new(1, 0, 0, 26)
        
        CheckBox_ElementLayout.Name = "CheckBox_ElementLayout"
        CheckBox_ElementLayout.Parent = CheckBox_Element
        CheckBox_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        CheckBox_ElementLayout.SortOrder = Enum.SortOrder.LayoutOrder
        CheckBox_ElementLayout.Padding = UDim.new(0, 10)
        
        CheckBox_ElementBox.Name = "CheckBox_ElementBox"
        CheckBox_ElementBox.Parent = CheckBox_Element
        CheckBox_ElementBox.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
        CheckBox_ElementBox.BorderSizePixel = 0
        CheckBox_ElementBox.Size = UDim2.new(0, 24, 0, 24)

        CheckBox_Corner.CornerRadius = UDim.new(0, 6)
        CheckBox_Corner.Parent = CheckBox_ElementBox

        CheckBox_Stroke.Parent = CheckBox_ElementBox
        CheckBox_Stroke.Color = Color3.fromRGB(80, 100, 150)
        CheckBox_Stroke.Thickness = 1
        CheckBox_Stroke.Transparency = 0.6
        
        CheckBox_ElementBoxInput.Name = "CheckBox_ElementBoxInput"
        CheckBox_ElementBoxInput.Parent = CheckBox_ElementBox
        CheckBox_ElementBoxInput.AnchorPoint = Vector2.new(0.5, 0.5)
        CheckBox_ElementBoxInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_ElementBoxInput.BackgroundTransparency = 1.000
        CheckBox_ElementBoxInput.Position = UDim2.new(0.5, 0, 0.5, 0)
        CheckBox_ElementBoxInput.Size = UDim2.new(1, 0, 1, 0)
        CheckBox_ElementBoxInput.FontFace = GetFont()
        CheckBox_ElementBoxInput.Text = ""
        CheckBox_ElementBoxInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        CheckBox_ElementBoxInput.TextSize = 14.000
        CheckBox_ElementBoxInput.AutoButtonColor = false
        
        CheckBox_ElementImage.Name = "CheckBox_ElementImage"
        CheckBox_ElementImage.Parent = CheckBox_ElementBox
        CheckBox_ElementImage.AnchorPoint = Vector2.new(0.5, 0.5)
        CheckBox_ElementImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_ElementImage.BackgroundTransparency = 1.000
        CheckBox_ElementImage.Position = UDim2.new(0.5, 0, 0.5, 0)
        CheckBox_ElementImage.Size = UDim2.new(0, 16, 0, 16)
        CheckBox_ElementImage.Image = "rbxassetid://13058405207"
        CheckBox_ElementImage.ImageColor3 = Color3.fromRGB(120, 140, 255)
        
        CheckBox_ElementName.Name = "CheckBox_ElementName"
        CheckBox_ElementName.Parent = CheckBox_Element
        CheckBox_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_ElementName.BackgroundTransparency = 1.000
        CheckBox_ElementName.Size = UDim2.new(1, 0, 0, 23)
        CheckBox_ElementName.FontFace = GetFont()
        CheckBox_ElementName.Text = CheckBoxOptions.Name
        CheckBox_ElementName.TextColor3 = Color3.fromRGB(240, 240, 250)
        CheckBox_ElementName.TextSize = 17.000
        CheckBox_ElementName.TextXAlignment = Enum.TextXAlignment.Left
                
        if Enabled then
            CheckBox_ElementImage.Visible = true
            CheckBox_ElementBox.BackgroundColor3 = Color3.fromRGB(60, 90, 150)
            pcall(CheckBoxOptions.OnChanged, Enabled)
        else
            CheckBox_ElementImage.Visible = false
            pcall(CheckBoxOptions.OnChanged, Enabled)
        end

        CheckBox_ElementBoxInput.MouseButton1Click:Connect(function()
            Enabled = not Enabled

            if Enabled then
                CheckBox_ElementImage.Visible = true
                TweenService:Create(CheckBox_ElementBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 90, 150)}):Play()
                TweenService:Create(CheckBox_Stroke, TweenInfo.new(0.2), {Transparency = 0.3}):Play()
            else
                CheckBox_ElementImage.Visible = false
                TweenService:Create(CheckBox_ElementBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 60, 100)}):Play()
                TweenService:Create(CheckBox_Stroke, TweenInfo.new(0.2), {Transparency = 0.6}):Play()
            end

            pcall(CheckBoxOptions.OnChanged, Enabled)
        end)
    end



function Window:Button(config)
    local name = config.Name or "Button"
    local callback = config.Callback or function() end
    
    local btn_element = Instance.new("TextButton")
    btn_element.Name = "button_element"
    btn_element.Parent = WindowElements
    btn_element.Size = UDim2.new(1, -10, 0, 30)
    btn_element.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn_element.Text = name
    btn_element.TextColor3 = Color3.new(1, 1, 1)
    btn_element.Font = Enum.Font.Code
    btn_element.TextSize = 14

    btn_element.MouseButton1Click:Connect(callback)
    
    return btn_element
end

            
    function ElementHandler:imgyoo(config)
        local hayimg = config.hayimg or ""
        local asset = imagesuportyippie(hayimg)
        
        local img_element = Instance.new("Frame")
        local img_display = Instance.new("ImageLabel")
        local img_corner = Instance.new("UICorner")
        
        img_element.Name = "imgyoo_element"
        img_element.Parent = WindowElements
        img_element.BackgroundTransparency = 1
        img_element.Size = UDim2.new(1, 0, 0, 90) 
        
        img_display.Name = "hayyyitsourimg"
        img_display.Parent = img_element
        img_display.AnchorPoint = Vector2.new(0, 0.5)
        img_display.Position = UDim2.new(0, 5, 0.5, 0)
        img_display.Size = UDim2.new(0, 80, 0, 80) 
        img_display.Image = asset or ""
        img_display.BackgroundTransparency = 0.9
        img_display.BackgroundColor3 = Color3.fromRGB(40, 60, 100)

        img_corner.CornerRadius = UDim.new(0, 8)
        img_corner.Parent = img_display
        
        return img_element
    end

    function ElementHandler:Seperator() 
        local Seperator_Element = Instance.new("Frame")
        
        Seperator_Element.Name = "Seperator_Element"
        Seperator_Element.Parent = WindowElements
        Seperator_Element.BackgroundColor3 = Color3.fromRGB(80, 100, 120)
        Seperator_Element.BorderSizePixel = 0
        Seperator_Element.BackgroundTransparency = 0.7
        Seperator_Element.Size = UDim2.new(1, 0, 0, 1)
    end

    function ElementHandler:ColorPicker3(ColorPickerArgs) 
        local Color_Element = Instance.new("Frame")
        local Color_ElementLayout = Instance.new("UIListLayout")
        local Color_ElementRed = Instance.new("Frame")
        local Color_ElementRedTextInput = Instance.new("TextBox")
        local Color_ElementRedButtonInput = Instance.new("TextButton")
        local Color_ElementGreen = Instance.new("Frame")
        local Color_ElementGreenTextInput = Instance.new("TextBox")
        local Color_ElementGreenButtonInput = Instance.new("TextButton")
        local Color_ElementBlue = Instance.new("Frame")
        local Color_ElementBlueTextInput = Instance.new("TextBox")
        local Color_ElementBlueButtonInput = Instance.new("TextButton")
        local Color_ElementDisplay = Instance.new("Frame")
        local Color_ElementName = Instance.new("TextLabel")

        local ColorPickerName = ColorPickerArgs.Name

        Color_Element.Name = "Color_Element"
        Color_Element.Parent = WindowElements
        Color_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_Element.BackgroundTransparency = 1.000
        Color_Element.Position = UDim2.new(0, 0, 0.49666667, 0)
        Color_Element.Size = UDim2.new(1, 0, 0, 26)

        Color_ElementLayout.Name = "Color_ElementLayout"
        Color_ElementLayout.Parent = Color_Element
        Color_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        Color_ElementLayout.SortOrder = Enum.SortOrder.LayoutOrder
        Color_ElementLayout.Padding = UDim.new(0, 7)

        -- Red
        Color_ElementRed.Name = "Color_ElementRed"
        Color_ElementRed.Parent = Color_Element
        Color_ElementRed.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
        Color_ElementRed.BorderSizePixel = 0
        Color_ElementRed.Size = UDim2.new(0, 60, 1, 0)
        local red_corner = Instance.new("UICorner")
        red_corner.CornerRadius = UDim.new(0, 6)
        red_corner.Parent = Color_ElementRed

        Color_ElementRedTextInput.Name = "Color_ElementRedTextInput"
        Color_ElementRedTextInput.Parent = Color_ElementRed
        Color_ElementRedTextInput.AnchorPoint = Vector2.new(0.5, 0.5)
        Color_ElementRedTextInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementRedTextInput.BackgroundTransparency = 1.000
        Color_ElementRedTextInput.Position = UDim2.new(0.5, 0, 0.5, 0)
        Color_ElementRedTextInput.Size = UDim2.new(0, 25, 1, 0)
        Color_ElementRedTextInput.FontFace = GetFont()
        Color_ElementRedTextInput.PlaceholderColor3 = Color3.fromRGB(180, 180, 190)
        Color_ElementRedTextInput.PlaceholderText = "R:255"
        Color_ElementRedTextInput.Text = "R:255"
        Color_ElementRedTextInput.TextColor3 = Color3.fromRGB(240, 240, 250)
        Color_ElementRedTextInput.TextSize = 16.000

        Color_ElementRedButtonInput.Name = "Color_ElementRedButtonInput"
        Color_ElementRedButtonInput.Parent = Color_ElementRed
        Color_ElementRedButtonInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementRedButtonInput.BackgroundTransparency = 1.000
        Color_ElementRedButtonInput.Size = UDim2.new(1, 0, 1, 0)
        Color_ElementRedButtonInput.FontFace = GetFont()
        Color_ElementRedButtonInput.Text = ""
        Color_ElementRedButtonInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Color_ElementRedButtonInput.TextSize = 14.000

        -- Green
        Color_ElementGreen.Name = "Color_ElementGreen"
        Color_ElementGreen.Parent = Color_Element
        Color_ElementGreen.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
        Color_ElementGreen.BorderSizePixel = 0
        Color_ElementGreen.Size = UDim2.new(0, 60, 1, 0)
        local green_corner = Instance.new("UICorner")
        green_corner.CornerRadius = UDim.new(0, 6)
        green_corner.Parent = Color_ElementGreen

        Color_ElementGreenTextInput.Name = "Color_ElementGreenTextInput"
        Color_ElementGreenTextInput.Parent = Color_ElementGreen
        Color_ElementGreenTextInput.AnchorPoint = Vector2.new(0.5, 0.5)
        Color_ElementGreenTextInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementGreenTextInput.BackgroundTransparency = 1.000
        Color_ElementGreenTextInput.Position = UDim2.new(0.5, 0, 0.5, 0)
        Color_ElementGreenTextInput.Size = UDim2.new(0, 25, 1, 0)
        Color_ElementGreenTextInput.FontFace = GetFont()
        Color_ElementGreenTextInput.PlaceholderColor3 = Color3.fromRGB(180, 180, 190)
        Color_ElementGreenTextInput.PlaceholderText = "G:255"
        Color_ElementGreenTextInput.Text = "G:255"
        Color_ElementGreenTextInput.TextColor3 = Color3.fromRGB(240, 240, 250)
        Color_ElementGreenTextInput.TextSize = 16.000

        Color_ElementGreenButtonInput.Name = "Color_ElementGreenButtonInput"
        Color_ElementGreenButtonInput.Parent = Color_ElementGreen
        Color_ElementGreenButtonInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementGreenButtonInput.BackgroundTransparency = 1.000
        Color_ElementGreenButtonInput.Size = UDim2.new(1, 0, 1, 0)
        Color_ElementGreenButtonInput.FontFace = GetFont()
        Color_ElementGreenButtonInput.Text = ""
        Color_ElementGreenButtonInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Color_ElementGreenButtonInput.TextSize = 14.000

        -- Blue
        Color_ElementBlue.Name = "Color_ElementBlue"
        Color_ElementBlue.Parent = Color_Element
        Color_ElementBlue.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
        Color_ElementBlue.BorderSizePixel = 0
        Color_ElementBlue.Size = UDim2.new(0, 60, 1, 0)
        local blue_corner = Instance.new("UICorner")
        blue_corner.CornerRadius = UDim.new(0, 6)
        blue_corner.Parent = Color_ElementBlue

        Color_ElementBlueTextInput.Name = "Color_ElementBlueTextInput"
        Color_ElementBlueTextInput.Parent = Color_ElementBlue
        Color_ElementBlueTextInput.AnchorPoint = Vector2.new(0.5, 0.5)
        Color_ElementBlueTextInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementBlueTextInput.BackgroundTransparency = 1.000
        Color_ElementBlueTextInput.Position = UDim2.new(0.5, 0, 0.5, 0)
        Color_ElementBlueTextInput.Size = UDim2.new(0, 25, 1, 0)
        Color_ElementBlueTextInput.FontFace = GetFont()
        Color_ElementBlueTextInput.PlaceholderColor3 = Color3.fromRGB(180, 180, 190)
        Color_ElementBlueTextInput.PlaceholderText = "B:255"
        Color_ElementBlueTextInput.Text = "B:255"
        Color_ElementBlueTextInput.TextColor3 = Color3.fromRGB(240, 240, 250)
        Color_ElementBlueTextInput.TextSize = 16.000

        Color_ElementBlueButtonInput.Name = "Color_ElementBlueButtonInput"
        Color_ElementBlueButtonInput.Parent = Color_ElementBlue
        Color_ElementBlueButtonInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementBlueButtonInput.BackgroundTransparency = 1.000
        Color_ElementBlueButtonInput.Size = UDim2.new(1, 0, 1, 0)
        Color_ElementBlueButtonInput.FontFace = GetFont()
        Color_ElementBlueButtonInput.Text = ""
        Color_ElementBlueButtonInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Color_ElementBlueButtonInput.TextSize = 14.000

        Color_ElementDisplay.Name = "Color_ElementDisplay"
        Color_ElementDisplay.Parent = Color_Element
        Color_ElementDisplay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementDisplay.BorderSizePixel = 0
        Color_ElementDisplay.Size = UDim2.new(0, 26, 0, 26)
        local display_corner = Instance.new("UICorner")
        display_corner.CornerRadius = UDim.new(0, 6)
        display_corner.Parent = Color_ElementDisplay

        Color_ElementName.Name = "Color_ElementName"
        Color_ElementName.Parent = Color_Element
        Color_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementName.BackgroundTransparency = 1.000
        Color_ElementName.Position = UDim2.new(2.21000075, 0, 0, 0)
        Color_ElementName.Size = UDim2.new(1, 0, 0, 26)
        Color_ElementName.FontFace = GetFont()
        Color_ElementName.Text = ColorPickerName
        Color_ElementName.TextColor3 = Color3.fromRGB(240, 240, 250)
        Color_ElementName.TextSize = 17.000
        Color_ElementName.TextXAlignment = Enum.TextXAlignment.Left

        local CurrentColor = ColorPickerArgs.DefaultColor or Color3.fromRGB(255, 255, 255)

        local R, G, B = CurrentColor.R, CurrentColor.G, CurrentColor.B;

        local function setColor()
            Color_ElementDisplay.BackgroundColor3 = CurrentColor
            pcall(ColorPickerArgs.OnChanged, CurrentColor)
        end

        local function updateColor()
            CurrentColor = Color3.fromRGB(R, G, B)
            setColor()
        end

        setColor()

        Color_ElementRedTextInput.Text = string.format("R:%.0f", Color_ElementDisplay.BackgroundColor3.R);
        Color_ElementGreenTextInput.Text = string.format("G:%.0f", Color_ElementDisplay.BackgroundColor3.G);
        Color_ElementBlueTextInput.Text = string.format("B:%.0f", Color_ElementDisplay.BackgroundColor3.B);

        for _, colorButton in pairs(Color_Element:GetDescendants()) do
            if colorButton:IsA("TextButton") then
                colorButton.MouseButton1Down:Connect(function()
                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        local x = math.clamp(UserInputService:GetMouseLocation().X - colorButton.AbsolutePosition.X, 0, colorButton.AbsoluteSize.X)
                        local value = math.floor(x / colorButton.AbsoluteSize.X * 255 + 0.5)
                        local color = string.sub(colorButton.Name, 14, 14)

                        if color == "R" then
                            R = value
                            Color_ElementRedTextInput.Text = string.format("R:%s", value);
                            updateColor()
                        elseif color == "G" then
                            G = value
                            Color_ElementGreenTextInput.Text = string.format("G:%s", value);
                            updateColor()
                        elseif color == "B" then
                            B = value
                            Color_ElementBlueTextInput.Text = string.format("B:%s", value);
                            updateColor()
                        end

                        task.wait()
                    end
                end)
            end
        end
    end

    function ElementHandler:RadioButtons(RadioButtonsArgs) 
        local Radio_Element = Instance.new("Frame")
        local Radio_ElementLayout = Instance.new("UIListLayout")

        Radio_Element.Name = "Radio_Element"
        Radio_Element.Parent = WindowElements
        Radio_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Radio_Element.BackgroundTransparency = 1.000
        Radio_Element.Position = UDim2.new(0, 0, 0.49666667, 0)
        Radio_Element.Size = UDim2.new(1, 0, 0, 26)

        Radio_ElementLayout.Name = "Radio_ElementLayout"
        Radio_ElementLayout.Parent = Radio_Element
        Radio_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        Radio_ElementLayout.SortOrder = Enum.SortOrder.LayoutOrder
        Radio_ElementLayout.Padding = UDim.new(0, 7)

        local Default = RadioButtonsArgs.Default
        local RadioButtons = {}

        for i, radio in pairs(RadioButtonsArgs.Buttons) do 
            local Radio_ElementItem = Instance.new("Frame")
            local Radio_ElementItemLayout = Instance.new("UIListLayout")
            local Radio_ElementItemButton = Instance.new("Frame")
            local Radio_ElementItemButtonCorner = Instance.new("UICorner")
            local Radio_ElementItemButtonState = Instance.new("Frame")
            local Radio_ElementItemButtonStateCorner = Instance.new("UICorner")
            local Radio_ElementItemButtonInput = Instance.new("TextButton")
            local Radio_ElementItemName = Instance.new("TextLabel")
            local RadioEnabled = false

            Radio_Element.Name = "Radio_Element"
            Radio_Element.Parent = WindowElements
            Radio_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Radio_Element.BackgroundTransparency = 1.000
            Radio_Element.Position = UDim2.new(0, 0, 0.49666667, 0)
            Radio_Element.Size = UDim2.new(1, 0, 0, 26)

            Radio_ElementItemName.Name = "Radio_ElementItemName"
            Radio_ElementItemName.Parent = Radio_ElementItem
            Radio_ElementItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Radio_ElementItemName.BackgroundTransparency = 1.000
            Radio_ElementItemName.Position = UDim2.new(0.240384609, 0, 0, 0)
            Radio_ElementItemName.Size = UDim2.new(0.644999981, 0, 1, 0)
            Radio_ElementItemName.FontFace = GetFont()
            Radio_ElementItemName.Text = radio
            Radio_ElementItemName.TextColor3 = Color3.fromRGB(240, 240, 250)
            Radio_ElementItemName.TextSize = 17.000
            Radio_ElementItemName.TextXAlignment = Enum.TextXAlignment.Left

            Radio_ElementLayout.Name = "Radio_ElementLayout"
            Radio_ElementLayout.Parent = Radio_Element
            Radio_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
            Radio_ElementLayout.SortOrder = Enum.SortOrder.LayoutOrder
            Radio_ElementLayout.Padding = UDim.new(0, 7)

            Radio_ElementItem.Name = "Radio_ElementItem"
            Radio_ElementItem.Parent = Radio_Element
            Radio_ElementItem.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
            Radio_ElementItem.BackgroundTransparency = 1.000
            Radio_ElementItem.Size = UDim2.new(0, 26 + (Radio_ElementItemName.TextBounds.X) + 7, 1, 0)

            Radio_ElementItemLayout.Name = "Radio_ElementItemLayout"
            Radio_ElementItemLayout.Parent = Radio_ElementItem
            Radio_ElementItemLayout.FillDirection = Enum.FillDirection.Horizontal
            Radio_ElementItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
            Radio_ElementItemLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            Radio_ElementItemLayout.Padding = UDim.new(0, 7)

            Radio_ElementItemButton.Name = "Radio_ElementItemButton"
            Radio_ElementItemButton.Parent = Radio_ElementItem
            Radio_ElementItemButton.BackgroundColor3 = Color3.fromRGB(40, 60, 100)
            Radio_ElementItemButton.BorderSizePixel = 0
            Radio_ElementItemButton.Size = UDim2.new(0, 20, 0, 20)

            Radio_ElementItemButtonCorner.CornerRadius = UDim.new(1, 0)
            Radio_ElementItemButtonCorner.Name = "Radio_ElementItemButtonCorner"
            Radio_ElementItemButtonCorner.Parent = Radio_ElementItemButton

            Radio_ElementItemButtonState.Name = "Radio_ElementItemButtonState"
            Radio_ElementItemButtonState.Parent = Radio_ElementItemButton
            Radio_ElementItemButtonState.AnchorPoint = Vector2.new(0.5, 0.5)
            Radio_ElementItemButtonState.BackgroundColor3 = Color3.fromRGB(120, 140, 255)
            Radio_ElementItemButtonState.BorderSizePixel = 0
            Radio_ElementItemButtonState.Position = UDim2.new(0.5, 0, 0.5, 0)
            Radio_ElementItemButtonState.Size = UDim2.new(0, 12, 0, 12)

            Radio_ElementItemButtonStateCorner.CornerRadius = UDim.new(1, 0)
            Radio_ElementItemButtonStateCorner.Name = "Radio_ElementItemButtonStateCorner"
            Radio_ElementItemButtonStateCorner.Parent = Radio_ElementItemButtonState

            Radio_ElementItemButtonInput.Name = "Radio_ElementItemButtonInput"
            Radio_ElementItemButtonInput.Parent = Radio_ElementItemButton
            Radio_ElementItemButtonInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Radio_ElementItemButtonInput.BackgroundTransparency = 1.000
            Radio_ElementItemButtonInput.Size = UDim2.new(1, 0, 1, 0)
            Radio_ElementItemButtonInput.FontFace = GetFont()
            Radio_ElementItemButtonInput.Text = ""
            Radio_ElementItemButtonInput.TextColor3 = Color3.fromRGB(0, 0, 0)
            Radio_ElementItemButtonInput.TextSize = 14.000
            Radio_ElementItemButtonInput.AutoButtonColor = false

            if radio == Default then 
                RadioEnabled = true
                Radio_ElementItemButtonState.Visible = true;
            else
                RadioEnabled = false
                Radio_ElementItemButtonState.Visible = false;
            end

            local radioButton = {
                Name = radio,
                Enabled = RadioEnabled,
                Update = nil
            }

            radioButton.Update = function() 
                if radioButton.Enabled then
                    Radio_ElementItemButtonState.Visible = true;
                else
                    Radio_ElementItemButtonState.Visible = false;
                end
            end

            Radio_ElementItemButtonInput.MouseButton1Click:Connect(function()
                if not radioButton.Enabled then
                    radioButton.Enabled = true
                    radioButton.Update()
                    pcall(RadioButtonsArgs.OnChanged, radioButton.Name, radioButton.Enabled)
                    for _, rad in pairs(RadioButtons) do 
                        if rad ~= radioButton then
                            rad.Enabled = false
                            rad.Update()
                        end
                    end
                end
            end)

            table.insert(RadioButtons, radioButton)
        end
    end

    function ElementHandler:BeginMenuBar() 
        local MenuBar = Instance.new("Frame")
        local MenuBarLayout = Instance.new("UIListLayout")

        MenuBar.Name = "MenuBar"
        MenuBar.Parent = WindowElementContainer
        MenuBar.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
        MenuBar.BorderColor3 = Color3.fromRGB(74, 74, 83)
        MenuBar.Position = UDim2.new(-0.048780486, 0, 0.0417362265, 0)
        MenuBar.Size = UDim2.new(1, 0, 0, 26)

        MenuBarLayout.Name = "MenuBarLayout"
        MenuBarLayout.Parent = MenuBar
        MenuBarLayout.FillDirection = Enum.FillDirection.Horizontal
        MenuBarLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local currentlyOpen = false

        function ElementHandler:BeginMenu(MenuName) 
            local MenuBarItem = Instance.new("TextButton")

            MenuBarItem.Name = MenuName
            MenuBarItem.Parent = MenuBar
            MenuBarItem.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
            MenuBarItem.BorderSizePixel = 0
            MenuBarItem.Size = UDim2.new(0, (MenuBarItem.TextBounds.X + 5), 1, 0)
            MenuBarItem.FontFace = GetFont()
            MenuBarItem.Text = MenuName
            MenuBarItem.TextColor3 = Color3.fromRGB(240, 240, 250)
            MenuBarItem.TextSize = 17.000
            MenuBarItem.AutoButtonColor = false

            local Open = false

            MenuBarItem.MouseButton1Click:Connect(function()
                Open = not Open
            end)

            function ElementHandler:MenuItem(ItemProperties) 
                local MenuBarItem_Items = Instance.new("Frame")
                local MenuBarItem_Items_2 = Instance.new("UIListLayout")
                local MenuBarItem_Items_ItemMain = Instance.new("TextButton")
                local MenuBarItem_Items_ItemMainPadding = Instance.new("UIPadding")
                local MenuBarItem_ItemsPadding = Instance.new("UIPadding")
                local MenuBarPadding = Instance.new("UIPadding")

                MenuBarItem_Items.Name = "MenuBarItem_Items"
                MenuBarItem_Items.Parent = MenuBar:FindFirstChild(ItemProperties.Menu)
                MenuBarItem_Items.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
                MenuBarItem_Items.BackgroundTransparency = 0.050
                MenuBarItem_Items.BorderColor3 = Color3.fromRGB(74, 74, 83)
                MenuBarItem_Items.Position = UDim2.new(0, 0, 1, 1)
                MenuBarItem_Items.Size = UDim2.new(0, 100, 0, 26)
                MenuBarItem_Items.Visible = Open

                local function Update() 
                    MenuBarItem_Items.Visible = Open
                end

                MenuBarItem_Items_2.Name = "MenuBarItem_Items"
                MenuBarItem_Items_2.Parent = MenuBarItem_Items
                MenuBarItem_Items_2.SortOrder = Enum.SortOrder.LayoutOrder

                MenuBarItem_Items_ItemMain.Name = "MenuBarItem_Items_ItemMain"
                MenuBarItem_Items_ItemMain.Parent = MenuBarItem_Items
                MenuBarItem_Items_ItemMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                MenuBarItem_Items_ItemMain.BackgroundTransparency = 1.000
                MenuBarItem_Items_ItemMain.Size = UDim2.new(1, 0, 0, 23)
                MenuBarItem_Items_ItemMain.FontFace = GetFont()
                MenuBarItem_Items_ItemMain.Text = ItemProperties.Name
                MenuBarItem_Items_ItemMain.TextColor3 = Color3.fromRGB(240, 240, 250)
                MenuBarItem_Items_ItemMain.TextSize = 16.000
                MenuBarItem_Items_ItemMain.TextXAlignment = Enum.TextXAlignment.Left
                MenuBarItem_Items_ItemMain.AutoButtonColor = false

                MenuBarItem_Items_ItemMainPadding.Name = "MenuBarItem_Items_ItemMainPadding"
                MenuBarItem_Items_ItemMainPadding.Parent = MenuBarItem_Items_ItemMain
                MenuBarItem_Items_ItemMainPadding.PaddingLeft = UDim.new(0, 5)

                MenuBarItem_ItemsPadding.Name = "MenuBarItem_ItemsPadding"
                MenuBarItem_ItemsPadding.Parent = MenuBarItem_Items
                MenuBarItem_ItemsPadding.PaddingTop = UDim.new(0, 3)

                MenuBarPadding.Name = "MenuBarPadding"
                MenuBarPadding.Parent = MenuBar
                MenuBarPadding.PaddingLeft = UDim.new(0, 6)

                MenuBarItem.MouseButton1Click:Connect(function()
                    MenuBarItem_Items.Visible = Open
                end)

                MenuBarItem_Items_ItemMain.MouseButton1Click:Connect(function()
                    if not ItemProperties.OnClick then 
                        return
                    end

                    pcall(ItemProperties.OnClick)
                end)
            end
        end
    end

    -- Window dragging
    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil
    
    local function updateDrag(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(Window, tweenInfo, { Position = newPosition })
        tween:Play()
    end
    
    WindowPanel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Window.Position
    
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    WindowPanel.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)

    -- Window resizing
    local selected = false
    local debounce = false
    
    local function updateInitialPosition()
        local initialPosition = UDim2.new(1, -(ResizeAll.AbsoluteSize.X - 10), 1, -(ResizeAll.AbsoluteSize.Y - 10) + 0.1)
        local tweenInfo = TweenInfo.new(0.01, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local initTween = TweenService:Create(ResizeAll, tweenInfo, {
            Position = initialPosition
        })
        initTween:Play()
    end
    updateInitialPosition()
    
    local function ResizeWindow()
        if debounce then
            return
        end
        debounce = true
    
        local mousePos = UserInputService:GetMouseLocation()
        local windowLeft = Window.AbsolutePosition.X
        local windowTop = Window.AbsolutePosition.Y
        local cornerWidth = ResizeAll.AbsoluteSize.X
        local cornerHeight = ResizeAll.AbsoluteSize.Y
    
        local newWidth = math.max((mousePos.X - windowLeft + (cornerWidth / 2)), 35)
        local newHeight = math.max(((mousePos.Y - windowTop + (cornerHeight / 2)) - 35), 35)
    
        local tweenInfo = TweenInfo.new(0.01, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local resizeTween = TweenService:Create(Window, tweenInfo, {
            Size = UDim2.new(0, newWidth, 0, newHeight)
        })
        resizeTween:Play()
        
        updateInitialPosition()
    
        debounce = false
    end
    
    ResizeAll.MouseButton1Down:Connect(function()
        selected = true
        ResizeWindow()
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if selected and input.UserInputType == Enum.UserInputType.MouseMovement then
            ResizeWindow()
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            selected = false
        end
    end)
    
    Window:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        updateInitialPosition()
    end)

    local showing = true
    MinimiseButton.MouseButton1Click:Connect(function() 
        showing = not showing
        
        if not showing then
            WindowElementContainer.Visible = false
            WindowPanelIcon.ImageTransparency = 0.3
            Window.BackgroundTransparency = 1
            ResizeAll.Visible = false
        else
            WindowElementContainer.Visible = true
            WindowPanelIcon.ImageTransparency = 0
            Window.BackgroundTransparency = 0.1
            ResizeAll.Visible = true
        end
    end)
    
    function ElementHandler:End()
        local showing = true
        MinimiseButton.MouseButton1Click:Connect(function() 
            showing = not showing
            
            if not showing then
                WindowElementContainer.Visible = false
                WindowPanelIcon.ImageTransparency = 0.3
                Window.BackgroundTransparency = 1
                ResizeAll.Visible = false
                MinimiseButtonIcon.Rotation = 180
            else
                WindowElementContainer.Visible = true
                WindowPanelIcon.ImageTransparency = 0.85
                Window.BackgroundTransparency = 0.1
                ResizeAll.Visible = true
                MinimiseButtonIcon.Rotation = 0
            end
        end)

        Window:GetPropertyChangedSignal("Size"):Connect(function()
            local children = WindowElements:GetChildren()
            WindowElements.ScrollingEnabled = true
    
            WindowElements.CanvasSize = UDim2.new(0, 0, 0, 0)
            
            local totalHeight = 0
            for _, child in ipairs(children) do
                if child:IsA("GuiObject") then
                    totalHeight = (totalHeight + child.Size.Y.Offset) + 5
                end
            end
            
            if totalHeight > WindowElements.AbsoluteSize.Y then
                local padding = 0
                padding = WindowElementsContainerLayout.Padding.Offset
                WindowElements.CanvasSize = UDim2.new(0, 0, 0, totalHeight + padding)
            end
        end)

        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode.Name == "RightBracket" then
                if syn and syn.protect_gui then
                    syn.unprotect_gui(ImGui)
                    ImGui:Destroy()
                elseif gethui then
                    ImGui.Parent = nil
                    ImGui:Destroy()
                end
            end
        end)
    end

    return ElementHandler
end

return main
