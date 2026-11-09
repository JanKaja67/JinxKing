-- ==============================================================================
-- 👑 PROJECT JINXKING: THE OFFICIAL PREMIUM MULTI-PLATFORM EXPLOIT HUB v3.5
-- ==============================================================================
-- 1:1 CLONED TOXO V20 PRESTIGE DESIGN MATRIX | INTEGRATED FULL SCRATCH VISUAL STUDIO
-- Coded with Advanced Nesting Input Nodes, Variables, Lists & Custom Pink Blocks

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Global Configurations Memory Cache
getgenv().JinxKingConfig = {
    AdminDetectActive = false,
    AntiAfkActive = true,
    CustomPlateText = "",
    LightRange = 60,
    LightBrightness = 1,
    LightAngle = 120
}

-- Cleanup Old Frameworks
for _, gui in ipairs(PlayerGui:GetChildren()) do
    if gui.Name == "JinxKingHub" then gui:Destroy() end
end

-- UI Engine Utilities
local function Create(class, props, parent)
    local object = Instance.new(class)
    for key, value in pairs(props) do object[key] = value end
    object.Parent = parent
    return object
end

local function Corner(parent, radius)
    Create("UICorner", { CornerRadius = UDim.new(0, radius) }, parent)
end

local function Border(parent, color)
    Create("UIStroke", { Color = color or Color3.fromRGB(45, 47, 55), Thickness = 1 }, parent)
end

local function Tween(object, duration, properties)
    local animation = TweenService:Create(object, TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), properties)
    animation:Play()
    return animation
end

-- Screen Optimization Gui
local Screen = Create("ScreenGui", { Name = "JinxKingHub", ResetOnSpawn = false, IgnoreGuiInset = true }, PlayerGui)
local Scale = Create("UIScale", { Scale = 1 }, Screen)
local function UpdateScale()
    local camera = workspace.CurrentCamera
    if not camera then return end
    Scale.Scale = math.clamp(math.min(camera.ViewportSize.X / 850, camera.ViewportSize.Y / 570), 0.55, 1)
end
UpdateScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)

-- ==============================================================================
-- 🟣 THE MAIN APPLICATION WINDOW (Toxo Base Frame)
-- ==============================================================================
local Main = Create("Frame", { Name = "MainWindow", Size = UDim2.fromOffset(580, 380), Position = UDim2.new(0.5, -290, 0.5, -190), BackgroundColor3 = Color3.fromRGB(15, 16, 20), BorderSizePixel = 0, ClipsDescendants = true, Visible = true }, Screen)
Corner(Main, 10); Border(Main)

local Header = Create("Frame", Main) Header.Size = UDim2.new(1, 0, 0, 42) Header.BackgroundColor3 = Color3.fromRGB(22, 23, 28) Header.BorderSizePixel = 0
local HeaderDrag = Create("TextButton", Header) HeaderDrag.Size = UDim2.new(1, -85, 1, 0) HeaderDrag.BackgroundTransparency = 1 HeaderDrag.Text = ""

local Title = Create("TextLabel", HeaderDrag)
Title.Text = "| JinxKing Hub v3.5 | Emergency Hamburg" Title.Position = UDim2.fromOffset(14, 0) Title.Size = UDim2.new(1, -20, 1, 0) Title.TextColor3 = Color3.fromRGB(245, 246, 250) Title.TextSize = 11 Title.Font = Enum.Font.RobotoMono Title.BackgroundTransparency = 1 Title.TextXAlignment = Enum.TextXAlignment.Left

local Controls = Create("Frame", Header) Controls.Position = UDim2.new(1, -74, 0, 7) Controls.Size = UDim2.fromOffset(66, 28) Controls.BackgroundTransparency = 1
Create("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, Padding = UDim.new(0, 5) }, Controls)

-- Minimized Strip Controller
local Strip = Create("Frame", Screen) Strip.Name = "JinxKingStrip" Strip.Size = UDim2.fromOffset(460, 42) Strip.Position = UDim2.new(0.5, -230, 0.2, 0) Strip.BackgroundColor3 = Color3.fromRGB(15, 16, 20) Strip.Visible = false
Corner(Strip, 8); Border(Strip)
local StripDrag = Create("TextButton", Strip) StripDrag.Size = UDim2.new(1, -80, 1, 0) StripDrag.BackgroundTransparency = 1 StripDrag.Text = ""
local StripTitle = Create("TextLabel", StripDrag) StripTitle.Text = "| JinxKing Hub v3.5 | Minimiert" StripTitle.Position = UDim2.fromOffset(14, 0) StripTitle.Size = UDim2.new(1, -20, 1, 0) StripTitle.TextColor3 = Color3.fromRGB(245, 246, 250) StripTitle.TextSize = 12 StripTitle.Font = Enum.Font.RobotoMono Title.BackgroundTransparency = 1
local StripControls = Create("Frame", Strip) StripControls.Position = UDim2.new(1, -74, 0, 7) StripControls.Size = UDim2.fromOffset(66, 28) StripControls.BackgroundTransparency = 1
Create("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, Padding = UDim.new(0, 5) }, StripControls)

local function MakeDraggable(frame, handle)
    local dragging, dragInput, dragStart, startPosition
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true dragStart = input.Position startPosition = frame.Position dragInput = input end
    end)
    UIS.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input == dragInput then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input) if input == dragInput or input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false dragInput = nil end end)
end
MakeDraggable(Main, HeaderDrag); MakeDraggable(Strip, StripDrag)

local function MakeControl(parent, symbol, callback)
    local f = Create("Frame", { Size = UDim2.fromOffset(24, 24), BackgroundColor3 = Color3.fromRGB(28, 29, 35) }, parent) Corner(f, 4); Border(f)
    local btn = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = symbol, TextColor3 = Color3.fromRGB(245, 246, 250), TextSize = 11, Font = Enum.Font.RobotoMono }, f)
    btn.MouseButton1Click:Connect(callback)
end
MakeControl(Controls, "—", function() Main.Visible = false Strip.Position = Main.Position Strip.Visible = true end)
MakeControl(Controls, "×", function() Screen:Destroy() end)
MakeControl(StripControls, "+", function() Strip.Visible = false Main.Position = Strip.Position Main.Visible = true end)
MakeControl(StripControls, "×", function() Screen:Destroy() end)

-- Sidebar Assembly
local Sidebar = Create("Frame", { Name = "Sidebar", Position = UDim2.fromOffset(0, 42), Size = UDim2.new(0, 160, 1, -42), BackgroundColor3 = Color3.fromRGB(18, 19, 23), BorderSizePixel = 0 }, Main)
local Navigation = Create("ScrollingFrame", { Name = "Navigation", Position = UDim2.fromOffset(6, 6), Size = UDim2.new(1, -12, 1, -125), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2, AutomaticCanvasSize = Enum.AutomaticSize.Y }, Sidebar)
Create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, Navigation)

local Content = Create("Frame", { Name = "PageContainer", Position = UDim2.fromOffset(160, 42), Size = UDim2.new(1, -160, 1, -42), BackgroundColor3 = Color3.fromRGB(12, 12, 14), BorderSizePixel = 0 }, Main) Corner(Content, 6)

-- ==============================================================================
-- 🪐 GIGANTIC SCREEN-FILLING VISUAL SCRATCH STUDIO FRAMEWORK
-- ==============================================================================
local Studio = Create("Frame", { Name = "ScratchStudio", Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(12, 13, 16), BorderSizePixel = 0, Visible = false }, Screen)
local StudioHeader = Create("Frame", { Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = Color3.fromRGB(20, 21, 25), BorderSizePixel = 0 }, Studio)
local StudioTitle = Create("TextLabel", { Text = "  | JinxKing Block Engine Studio v3.5 [Scratch Mode]", Size = UDim2.new(0.7, 0, 1, 0), TextColor3 = Color3.fromRGB(240, 240, 245), TextSize = 13, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, StudioHeader)

local StudioCloseBox = Create("Frame", { Size = UDim2.fromOffset(28, 28), Position = UDim2.new(1, -40, 0, 8), BackgroundColor3 = Color3.fromRGB(35, 25, 25) }, StudioHeader) Corner(StudioCloseBox, 4); Border(StudioCloseBox, Color3.fromRGB(235, 60, 60))
local StudioCloseBtn = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "×", TextColor3 = Color3.fromRGB(235, 60, 60), TextSize = 16, Font = Enum.Font.RobotoMono }, StudioCloseBox)

local StudioSidebar = Create("ScrollingFrame", { Position = UDim2.fromOffset(0, 45), Size = UDim2.new(0, 180, 1, -45), BackgroundColor3 = Color3.fromRGB(18, 19, 22), ScrollBarThickness = 2, AutomaticCanvasSize = Enum.AutomaticSize.Y }, Studio) Create("UIListLayout", { Padding = UDim.new(0, 4) }, StudioSidebar)
local Canvas = Create("ScrollingFrame", { Position = UDim2.fromOffset(180, 45), Size = UDim2.new(1, -180, 1, -45), BackgroundColor3 = Color3.fromRGB(9, 10, 12), CanvasSize = UDim2.new(3, 0, 3, 0), ScrollBarThickness = 4 }, Studio)

StudioCloseBtn.MouseButton1Click:Connect(function() Studio.Visible = false Main.Visible = true end)

-- Drag and Drop Function Matrix for iPad Touches
local function MakeBlockDraggable(block)
    local activeDrag = false local trackInput, startPos, offsetPos
    block.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            activeDrag = true startPos = input.Position offsetPos = block.Position trackInput = input
end
end)
UIS.InputChanged:Connect(function(input)
if activeDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input == trackInput) then
local delta = input.Position - startPos
block.Position = UDim2.new(offsetPos.X.Scale, offsetPos.X.Offset + delta.X, offsetPos.Y.Scale, offsetPos.Y.Offset + delta.Y)
end
end)
UIS.InputEnded:Connect(function(input) if input == trackInput or input.UserInputType == Enum.UserInputType.MouseButton1 then activeDrag = false trackInput = nil end end)
end
-- Engine Generator for building Scratch Blocks
local function spawnBlock(name, color, shapeType)
local b = Create("Frame", { Size = UDim2.fromOffset(140, 34), BackgroundColor3 = color, Position = UDim2.fromOffset(math.random(50, 200), math.random(50, 200)) }, Canvas)
Corner(b, shapeType == "Circle" and 15 or 5); Border(b)
local lbl = Create("TextLabel", { Text = name, Size = UDim2.new(1, -10, 1, 0), Position = UDim2.fromOffset(5, 0), TextColor3 = Color3.fromRGB(255,255,255), TextSize = 10, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, b)
if shapeType == "Nested" then
local inputNode = Create("TextBox", { Size = UDim2.fromOffset(40, 18), Position = UDim2.new(1, -48, 0, 8), BackgroundColor3 = Color3.fromRGB(15,15,15), TextColor3 = Color3.fromRGB(0,255,100), TextSize = 9, Font = Enum.Font.RobotoMono, Text = "" }, b)
Corner(inputNode, 10); Border(inputNode)
end
MakeBlockDraggable(b)
end
-- Add Palette Injectors to Studio Sidebar
local function addPaletteHeader(title)
local l = Create("TextLabel", { Text = " " .. title, Size = UDim2.new(1, 0, 0, 24), TextColor3 = Color3.fromRGB(140,140,145), TextSize = 10, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, StudioSidebar)
end
local function addPaletteRow(name, color, shape)
local btn = Create("TextButton", { Text = " + " .. name, Size = UDim2.new(0.9, 0, 0, 26), BackgroundColor3 = Color3.fromRGB(24,25,30), TextColor3 = Color3.fromRGB(200,200,205), TextSize = 10, Font = Enum.Font.RobotoMono }, StudioSidebar)
Corner(btn, 4); Border(btn)
btn.MouseButton1Click:Connect(function() spawnBlock(name, color, shape) end)
end
addPaletteHeader("KAMPF MODUL [ROT]")
addPaletteRow("Kill Wanted Cops", Color3.fromRGB(235, 60, 60), "Square")
addPaletteRow("Auto Taser Defense", Color3.fromRGB(235, 60, 60), "Circle")
addPaletteHeader("AUTO MODUL [BLAU]")
addPaletteRow("Set Max Speed [X]", Color3.fromRGB(0, 120, 255), "Nested")
addPaletteRow("Server Fly Mode", Color3.fromRGB(0, 120, 255), "Square")
addPaletteHeader("MONEY MODUL [GRÜN]")
addPaletteRow("Radar Loop Farm", Color3.fromRGB(0, 200, 100), "Square")
addPaletteRow("ATM Automatic Rob", Color3.fromRGB(0, 200, 100), "Circle")
addPaletteHeader("STRUKTUREN [ORANGE]")
addPaletteRow("Schleife: Dauerhaft", Color3.fromRGB(235, 130, 0), "Square")
addPaletteRow("Variable erstellen", Color3.fromRGB(235, 130, 0), "Circle")
addPaletteHeader("CUSTOM BLOCKS [PINK]")
local customBlockCount = 0
local btnCustom = Create("TextButton", { Text = " + Create Custom Block", Size = UDim2.new(0.9, 0, 0, 28), BackgroundColor3 = Color3.fromRGB(35, 20, 30), TextColor3 = Color3.fromRGB(255, 120, 200), TextSize = 10, Font = Enum.Font.RobotoMono }, StudioSidebar)
Corner(btnCustom, 4); Border(btnCustom, Color3.fromRGB(255, 100, 180))
btnCustom.MouseButton1Click:Connect(function()
customBlockCount = customBlockCount + 1
local blockName = "Custom_Block_" .. customBlockCount
addPaletteRow(blockName, Color3.fromRGB(255, 80, 160), "Square")
spawnBlock("DEF: " .. blockName, Color3.fromRGB(255, 60, 140), "Square")
end)
-- ==============================================================================
-- CATEGORY SELECTION CORE (Toxo Sidebar Integration)
-- ==============================================================================
local SelectedCategory = nil
local Pages = {}
local tabButtons = {}
local function addTabButton(name, displayName)
local btn = Create("TextButton", { Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Color3.fromRGB(25, 25, 27), BorderSizePixel = 0, Text = "  " .. displayName, TextColor3 = Color3.fromRGB(150, 150, 150), TextSize = 11, Font = Enum.Font.RobotoMono, TextXAlignment = Enum.TextXAlignment.Left }, Navigation)
local Accent = Create("Frame", { Position = UDim2.fromOffset(0, 5), Size = UDim2.fromOffset(3, 22), BackgroundColor3 = Color3.fromRGB(0, 140, 255), Visible = false }, btn) Corner(Accent, 4)
btn.MouseButton1Click:Connect(function()
if SelectedCategory == btn then return end
if SelectedCategory then
SelectedCategory.TextColor3 = Color3.fromRGB(150, 150, 150)
SelectedCategory.Frame.Visible = false
end
SelectedCategory = btn
btn.TextColor3 = Color3.fromRGB(0, 140, 255) -- SCHRIFTBLAU AKTIV!
Accent.Visible = true
if Pages[name] then Pages[name].Visible = true end
-- Special Studio Category Bypass Execution Trigger
if name == "Scratch" then Studio.Visible = true Main.Visible = false Accent.Visible = false btn.TextColor3 = Color3.fromRGB(150, 150, 150) end
end)
btn.Parent = Navigation
tabButtons[name] = btn
end
local pInfo = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Info"] = pInfo
local pColors = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Colors"] = pColors
local pScratch = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Scratch"] = pScratch
addTabButton("Colors", "\240\159\142\168 | Car Colors.")
addTabButton("Scratch", "\240\159\167\169 | Block Engine Studio.") -- Deaktiviert Hauptmenü und springt in den Scratch-Modus
addTabButton("Info", "\226\132\185 | Info.")
-- Info content load
createSectionHeader(pInfo, "Infos & Configuration Matrix", 10)
local function buildInfo(txt, y)
local f = Create("Frame", { Size = UDim2.new(0.9, 0, 0, 32), Position = UDim2.new(0.05, 0, 0, y), BackgroundColor3 = Color3.fromRGB(20,21,26), BorderSizePixel = 0 }, pInfo) Corner(f,4); Border(f)
local l = Create("TextLabel", { Text = "  " .. txt, Size = UDim2.new(1, 0, 1, 0), TextColor3 = Color3.fromRGB(180,180,185), TextSize = 11, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, f)
end
buildInfo("Authors: JanKaja", 40)
buildInfo("Edition: v3.5 [Premium Block Edition]", 75)
-- ==============================================================================
-- PROFILE FOOTER LOGIC (1:1 CLONED PRESTIGE ELEMENT)
-- ==============================================================================
local Profile = Create("Frame", { Name = "Profile", Position = UDim2.new(0, 0, 1, -58), Size = UDim2.new(1, 0, 0, 58), BackgroundColor3 = Color3.fromRGB(20, 21, 26), BorderSizePixel = 0 }, Sidebar)
local ProfileIcon = Create("ImageLabel", { Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(38, 38), BackgroundColor3 = Color3.fromRGB(28, 29, 35), BorderSizePixel = 0, Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size42x42) }, Profile)
Corner(ProfileIcon, 50); Border(ProfileIcon)
Create("TextLabel", { Position = UDim2.fromOffset(54, 11), Size = UDim2.new(1, -60, 0, 16), BackgroundTransparency = 1, Text = "JinxKing", TextColor3 = Color3.fromRGB(245, 246, 250), Font = Enum.Font.RobotoMono, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left }, Profile)
Create("TextLabel", { Position = UDim2.fromOffset(54, 28), Size = UDim2.new(1, -60, 0, 14), BackgroundTransparency = 1, Text = Player.Name, TextColor3 = Color3.fromRGB(130, 133, 145), Font = Enum.Font.RobotoMono, TextSize = 9, TextXAlignment = Enum.TextXAlignment.Left }, Profile)
-- Boot Default Tab
pInfo.Visible = true
SelectedCategory = tabButtons["Info"]
tabButtons["Info"].TextColor3 = Color3.fromRGB(0, 140, 255)
print("[JinxKing Core Engine] Framework successfully launched on your iPad Device!")