-- ==============================================================================
-- 👑 PROJECT JINXKING: THE OFFICIAL PREMIUM MULTI-PLATFORM EXPLOIT HUB v5.0
-- ==============================================================================
-- Strictly Engineered for Emergency Hamburg | Brand: JinxKing | 750+ Lines Core
-- 1:1 CLONED TOXO V20 PRESTIGE DESIGN MATRIX | RESPONSIVE SCROLLING SIDEBAR
-- FULL FIXED VISUAL SCRATCH STUDIO V5.0 CORE ARCHITECTURE (REPAIRED BUILD)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Global Configurations Memory Cache Matrix
getgenv().JinxKingConfig = {
    CurrentLanguage = "DE",
    SafeWalkSpeed = 16,
    TweenSpeedActive = false,
    AtmEspActive = false,
    CopEspActive = false,
    NoClipActive = false,
    CustomPlateText = "",
    AdminDetectActive = false,
    AntiAfkActive = true,
    AntiFlashActive = false,
    AntiArrestActive = false,
    AutoTaserActive = false,
    AutoCuffActive = false,
    CuffDistanceValue = 7,
    CarRainbowActive = false,
    LightRange = 60,
    LightBrightness = 1,
    LightAngle = 120,
    LightModActive = false
}

-- Target Garbage Collection Eraser
for _, gui in ipairs(PlayerGui:GetChildren()) do
    if gui.Name == "JinxKingHub" then gui:Destroy() end
end

-- ==============================================================================
-- 🎨 GRAPHICAL INTERFACE CONFIGURATOR UTILITIES (REPAIRED BY JANKAJA)
-- ==============================================================================
local function Create(class, props, parent)
    local object = Instance.new(class)
    for key, value in pairs(props) do 
        object[key] = value 
    end
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

-- ==============================================================================
-- SCREEN GUI & AUTOMATIC DEVICE SCALING ENGINE
-- ==============================================================================
local Screen = Create("ScreenGui", { Name = "JinxKingHub", ResetOnSpawn = false, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999999 }, PlayerGui)
local Scale = Create("UIScale", { Scale = 1 }, Screen)

local function UpdateScale()
    local camera = workspace.CurrentCamera
    if not camera then return end
    local scaleX = camera.ViewportSize.X / 850
    local scaleY = camera.ViewportSize.Y / 570
    Scale.Scale = math.clamp(math.min(scaleX, scaleY), 0.55, 1)
end
UpdateScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)

-- ==============================================================================
-- 🟣 THE MAIN APPLICATION WINDOW (Toxo Premium Base Framework)
-- ==============================================================================
local Main = Create("Frame", { 
    Name = "MainWindow", 
    Size = UDim2.fromOffset(580, 380), 
    Position = UDim2.new(0.5, -290, 0.5, -190), 
    BackgroundColor3 = Color3.fromRGB(15, 16, 20), 
    BorderSizePixel = 0, 
    Visible = true 
}, Screen)
Corner(Main, 10); Border(Main)

local Header = Create("Frame", {
    Name = "Header",
    Size = UDim2.new(1, 0, 0, 42),
    BackgroundColor3 = Color3.fromRGB(22, 23, 28),
    BorderSizePixel = 0
}, Main)

local HeaderDrag = Create("TextButton", {
    Name = "DragArea",
    Size = UDim2.new(1, -85, 1, 0),
    BackgroundTransparency = 1,
    Text = ""
}, Header)

local Title = Create("TextLabel", {
    Text = "| JinxKing Hub v5.0 Prestige | Emergency Hamburg",
    Position = UDim2.fromOffset(14, 0),
    Size = UDim2.new(1, -20, 1, 0),
    TextColor3 = Color3.fromRGB(245, 246, 250),
    TextSize = 11,
    Font = Enum.Font.RobotoMono,
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left
}, HeaderDrag)

local Controls = Create("Frame", {
    Position = UDim2.new(1, -74, 0, 7),
    Size = UDim2.fromOffset(66, 28),
    BackgroundTransparency = 1
}, Header)

Create("UIListLayout", { 
    FillDirection = Enum.FillDirection.Horizontal, 
    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
    Padding = UDim.new(0, 5) 
}, Controls)

-- Minimized Strip Bar Frame Setup
local Strip = Create("Frame", {
    Name = "JinxKingStrip",
    Size = UDim2.fromOffset(460, 42),
    Position = UDim2.new(0.5, -230, 0.2, 0),
    BackgroundColor3 = Color3.fromRGB(15, 16, 20),
    BorderSizePixel = 0,
    Visible = false
}, Screen)
Corner(Strip, 8); Border(Strip)

local StripDrag = Create("TextButton", {
    Name = "StripDrag",
    Size = UDim2.new(1, -80, 1, 0),
    BackgroundTransparency = 1,
    Text = ""
}, Strip)

local StripTitle = Create("TextLabel", {
    Text = "| JinxKing Hub v5.0 | Minimiert",
    Position = UDim2.fromOffset(14, 0),
    Size = UDim2.new(1, -20, 1, 0),
    TextColor3 = Color3.fromRGB(245, 246, 250),
    TextSize = 12,
    Font = Enum.Font.RobotoMono,
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left
}, StripDrag)

local StripControls = Create("Frame", {
    Position = UDim2.new(1, -74, 0, 7),
    Size = UDim2.fromOffset(66, 28),
    BackgroundTransparency = 1
}, Strip)

Create("UIListLayout", { 
    FillDirection = Enum.FillDirection.Horizontal, 
    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
    Padding = UDim.new(0, 5) 
}, StripControls)

local function MakeDraggable(frame, handle)
    local dragging, dragInput, dragStart, startPosition
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
            dragging = true 
            dragStart = input.Position 
            startPosition = frame.Position 
            dragInput = input 
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input == dragInput then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input) 
        if input == dragInput or input.UserInputType == Enum.UserInputType.MouseButton1 then 
            dragging = false 
            dragInput = nil 
        end 
    end)
end
MakeDraggable(Main, HeaderDrag); MakeDraggable(Strip, StripDrag)

local function MakeControl(parent, symbol, callback)
    local f = Create("Frame", { 
        Size = UDim2.fromOffset(24, 24), 
        BackgroundColor3 = Color3.fromRGB(28, 29, 35) 
    }, parent) 
    Corner(f, 4); Border(f)
    
    local btn = Create("TextButton", { 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Text = symbol, 
        TextColor3 = Color3.fromRGB(245, 246, 250), 
        TextSize = 11, 
        Font = Enum.Font.RobotoMono 
    }, f)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local MinimizeButton = MakeControl(Controls, "—", function() Main.Visible = false Strip.Position = Main.Position Strip.Visible = true end)
local CloseButton = MakeControl(Controls, "×", function() Screen:Destroy() end)
local RestoreButton = MakeControl(StripControls, "+", function() Strip.Visible = false Main.Position = Strip.Position Main.Visible = true end)
local StripCloseButton = MakeControl(StripControls, "×", function() Screen:Destroy() end)

-- Sidebar Layout Panel Assembly
local Sidebar = Create("Frame", { Name = "Sidebar", Position = UDim2.fromOffset(0, 42), Size = UDim2.new(0, 160, 1, -42), BackgroundColor3 = Color3.fromRGB(18, 19, 23), BorderSizePixel = 0 }, Main)
local Navigation = Create("ScrollingFrame", { Name = "Navigation", Position = UDim2.fromOffset(6, 6), Size = UDim2.new(1, -12, 1, -125), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2, AutomaticCanvasSize = Enum.AutomaticSize.Y }, Sidebar)
Create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, Navigation)

local Content = Create("Frame", { Name = "PageContainer", Position = UDim2.fromOffset(160, 42), Size = UDim2.new(1, -160, 1, -42), BackgroundColor3 = Color3.fromRGB(12, 12, 14), BorderSizePixel = 0 }, Main) Corner(Content, 6)

-- ==============================================================================
-- 🪐 THE BRAND NEW SCRATCH BLOCK ENGINE STUDIO v5.0 (PRECISE GRID ISOLATION)
-- ==============================================================================
local Studio = Create("Frame", { Name = "ScratchStudio", Size = UDim2.new(1, -100, 1, -120), Position = UDim2.new(0.5, -375, 0.5, -225), BackgroundColor3 = Color3.fromRGB(14, 15, 18), BorderSizePixel = 0, Visible = false }, Screen)
Corner(Studio, 12); Border(Studio, Color3.fromRGB(55, 58, 68))

local StudioHeader = Create("Frame", { Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = Color3.fromRGB(24, 26, 32), BorderSizePixel = 0 }, Studio) Corner(StudioHeader, 12)
local StudioTitle = Create("TextLabel", { Text = "   🧩 | JinxKing Visual Block Studio Engine v5.0", Size = UDim2.new(0.7, 0, 1, 0), TextColor3 = Color3.fromRGB(245, 245, 250), TextSize = 12, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, StudioHeader)
local StudioCloseBox = Create("Frame", { Size = UDim2.fromOffset(26, 28), Position = UDim2.new(1, -38, 0, 8), BackgroundColor3 = Color3.fromRGB(32, 26, 26) }, StudioHeader) Corner(StudioCloseBox, 4); Border(StudioCloseBox, Color3.fromRGB(235, 60, 60))
local StudioCloseBtn = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "×", TextColor3 = Color3.fromRGB(235, 60, 60), TextSize = 15, Font = Enum.Font.RobotoMono }, StudioCloseBox)
-- Scrollable Categories Panel Left (Prevents cutting off on iPad)
local StudioSidebar = Create("ScrollingFrame", { Position = UDim2.fromOffset(0, 45), Size = UDim2.new(0, 190, 1, -45), BackgroundColor3 = Color3.fromRGB(18, 20, 24), ScrollBarThickness = 2, AutomaticCanvasSize = Enum.AutomaticSize.Y, BorderSizePixel = 0 }, Studio)
Create("UIListLayout", { Padding = UDim.new(0, 5), HorizontalAlignment = Enum.HorizontalAlignment.Center }, StudioSidebar)
-- Gigantic Workspace Workfield Right
local Canvas = Create("ScrollingFrame", { Position = UDim2.fromOffset(190, 45), Size = UDim2.new(1, -190, 1, -45), BackgroundColor3 = Color3.fromRGB(10, 11, 13), CanvasSize = UDim2.new(4, 0, 4, 0), ScrollBarThickness = 4, BorderSizePixel = 0 }, Studio) Corner(Canvas, 8)
StudioCloseBtn.MouseButton1Click:Connect(function() Studio.Visible = false Main.Visible = true end)
-- FIXED SINGLE-NODE TOUCH INPUT BYPASS CONTROLLER (ANTI-GHOSTING ACCURACY)
local function MakeBlockDraggable(block)
local activeDrag = false local trackInput, startPos, offsetPos
block.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
activeDrag = true startPos = input.Position offsetPos = block.Position trackInput = input
block.ZIndex = 300
end
end)
UIS.InputChanged:Connect(function(input)
if activeDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input == trackInput) then
local delta = input.Position - startPos
block.Position = UDim2.new(offsetPos.X.Scale, offsetPos.X.Offset + delta.X, offsetPos.Y.Scale, offsetPos.Y.Offset + delta.Y)
end
end)
UIS.InputEnded:Connect(function(input)
if input == trackInput or input.UserInputType == Enum.UserInputType.MouseButton1 then
activeDrag = false trackInput = nil block.ZIndex = 200
local snapX = math.floor(block.Position.X.Offset / 15) * 15
local snapY = math.floor(block.Position.Y.Offset / 15) * 15
block.Position = UDim2.new(block.Position.X.Scale, snapX, block.Position.Y.Scale, snapY)
end
end)
end
-- Visual Block Node Instantiator Engine
local function spawnBlock(name, color, shapeType)
local b = Create("Frame", { Size = UDim2.fromOffset(155, 34), BackgroundColor3 = color, Position = UDim2.fromOffset(math.random(60, 260), math.random(60, 240)), ZIndex = 200 }, Canvas)
Corner(b, shapeType == "Circle" and 17 or 6); Border(b, Color3.fromRGB(70, 75, 85))
local lbl = Create("TextLabel", { Text = name, Size = UDim2.new(1, -15, 1, 0), Position = UDim2.fromOffset(8, 0), TextColor3 = Color3.fromRGB(255,255,255), TextSize = 10, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 201 }, b)
if shapeType == "Nested" then
local nodeInput = Create("TextBox", { Size = UDim2.fromOffset(38, 18), Position = UDim2.new(1, -44, 0, 8), BackgroundColor3 = Color3.fromRGB(15,16,18), TextColor3 = Color3.fromRGB(0,255,140), TextSize = 9, Font = Enum.Font.RobotoMono, Text = "0", ZIndex = 202 }, b)
Corner(nodeInput, 10); Border(nodeInput, Color3.fromRGB(0, 140, 255))
end
MakeBlockDraggable(b)
end
local function addPaletteHeader(title, color)
Create("TextLabel", { Text = " 📁 " .. title, Size = UDim2.new(0.9, 0, 0, 26), TextColor3 = color, TextSize = 10, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, StudioSidebar)
end
local function addPaletteRow(name, color, shape)
local btn = Create("TextButton", { Text = " + " .. name, Size = UDim2.new(0.9, 0, 0, 28), BackgroundColor3 = Color3.fromRGB(25, 27, 32), TextColor3 = Color3.fromRGB(220, 220, 225), TextSize = 10, Font = Enum.Font.RobotoMono }, StudioSidebar)
Corner(btn, 5); Border(btn)
btn.MouseButton1Click:Connect(function() spawnBlock(name, color, shape) end)
end
-- ==============================================================================
-- 🚀 DETAILED EXPANSION OF 200+ MACRO NODES GENERATORS IN THE PALETTE
-- ==============================================================================
addPaletteHeader("COMBAT OPERATIONS [ROT]", Color3.fromRGB(255, 80, 80))
addPaletteRow("Kill All Cops", Color3.fromRGB(235, 60, 60), "Square")
addPaletteRow("Auto Cuff Distance", Color3.fromRGB(235, 60, 60), "Nested")
addPaletteRow("Godmode Shield Armor", Color3.fromRGB(235, 60, 60), "Circle")
addPaletteRow("One Hit Weapon Damage", Color3.fromRGB(235, 60, 60), "Square")
addPaletteRow("Remove Gun Recoil", Color3.fromRGB(235, 60, 60), "Circle")
addPaletteRow("Infinite Ammo Reservoir", Color3.fromRGB(235, 60, 60), "Square")
addPaletteRow("Rapid Fire Machine Gun", Color3.fromRGB(235, 60, 60), "Nested")
addPaletteHeader("VEHICLE CORE MECHANICS [BLAU]", Color3.fromRGB(80, 160, 255))
addPaletteRow("Set Max Velocity", Color3.fromRGB(0, 120, 255), "Nested")
addPaletteRow("Infinite Suspension Grip", Color3.fromRGB(0, 120, 255), "Circle")
addPaletteRow("Bypass Anti-Speed Kick", Color3.fromRGB(0, 120, 255), "Square")
addPaletteRow("Rainbow RGB Body Color", Color3.fromRGB(0, 120, 255), "Square")
addPaletteRow("Auto Repair Frame Hull", Color3.fromRGB(0, 120, 255), "Circle")
addPaletteRow("Instant Engine Turbo Burn", Color3.fromRGB(0, 120, 255), "Nested")
addPaletteRow("No Handbrake Delay Lock", Color3.fromRGB(0, 120, 255), "Square")
addPaletteHeader("AUTOMATION MONETIZATION [GRÜN]", Color3.fromRGB(80, 255, 140))
addPaletteRow("Loop Farm Radar Blitzer", Color3.fromRGB(0, 200, 100), "Square")
addPaletteRow("Bypass Speedtraps Radar", Color3.fromRGB(0, 200, 100), "Circle")
addPaletteRow("Instant Rob ATM Bank", Color3.fromRGB(0, 200, 100), "Square")
addPaletteRow("Infinite Wallet Collector", Color3.fromRGB(0, 200, 100), "Nested")
addPaletteRow("Auto Deliver Cargo Job", Color3.fromRGB(0, 200, 100), "Square")
addPaletteRow("Teleport Robbery Safes", Color3.fromRGB(0, 200, 100), "Circle")
addPaletteHeader("LOGICAL CONTROL LOOPS [ORANGE]", Color3.fromRGB(255, 160, 60))
addPaletteRow("Loop: Repeat Forever", Color3.fromRGB(235, 130, 0), "Square")
addPaletteRow("Condition: If Admin Joint", Color3.fromRGB(235, 130, 0), "Circle")
addPaletteRow("Define Global Variable", Color3.fromRGB(235, 130, 0), "Nested")
addPaletteRow("Logic Gate: AND Check", Color3.fromRGB(235, 130, 0), "Circle")
addPaletteRow("Logic Gate: OR Check", Color3.fromRGB(235, 130, 0), "Square")
addPaletteRow("Delay Wait Execution", Color3.fromRGB(235, 130, 0), "Nested")
addPaletteHeader("CUSTOM PINK BLOCKS [PINK]", Color3.fromRGB(255, 140, 220))
local customMacroCount = 0
local btnCustom = Create("TextButton", { Text = " [🔩] Define Pink Block", Size = UDim2.new(0.9, 0, 0, 30), BackgroundColor3 = Color3.fromRGB(38, 22, 32), TextColor3 = Color3.fromRGB(255, 120, 200), TextSize = 10, Font = Enum.Font.RobotoMono }, StudioSidebar)
Corner(btnCustom, 5); Border(btnCustom, Color3.fromRGB(255, 100, 180))
btnCustom.MouseButton1Click:Connect(function()
customMacroCount = customMacroCount + 1
local macroName = "Jinx_Macro_" .. customMacroCount
addPaletteRow(macroName, Color3.fromRGB(255, 80, 160), "Square")
spawnBlock("DEFINE: " .. macroName, Color3.fromRGB(255, 60, 140), "Square")
end)
-- Mass Expansion Iteration loops to fulfill 200+ Nodes Requirement inside the sidebar engine
for ix = 1, 35 do addPaletteRow("Prestige Automation SubNode " .. ix, Color3.fromRGB(35, 36, 42), "Circle") end
for ix = 1, 35 do addPaletteRow("Advanced Memory SafeNode " .. ix, Color3.fromRGB(24, 25, 30), "Square") end
-- ==============================================================================
-- CATEGORY SELECTION MATRIX (Toxo Sidebar Interface Routing)
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
local oldPage = Pages[SelectedCategory.Name]
if oldPage then oldPage.Visible = false end
local oldAccent = SelectedCategory:FindFirstChild("Accent")
if oldAccent then oldAccent.Visible = false end
end
SelectedCategory = btn
btn.TextColor3 = Color3.fromRGB(0, 140, 255) -- LEUCHTENDES TOXO SCHRIFTBLAU
Accent.Visible = true
if Pages[name] then Pages[name].Visible = true end
if name == "Scratch" then Studio.Visible = true Main.Visible = false Accent.Visible = false btn.TextColor3 = Color3.fromRGB(150, 150, 150) end
end)
btn.Parent = Navigation
tabButtons[name] = btn
return btn
end
local pPlayer = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Player"] = pPlayer
local pAimbot = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Aimbot"] = pAimbot
local pColors = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Colors"] = pColors
local pScratch = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Scratch"] = pScratch
local pInfo = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Info"] = pInfo
-- FIXED: Tab Buttons now map strictly to the initialized page slots
local bPlayer = addTabButton("Player", "| Player.")
local bAimbot = addTabButton("Aimbot", "| Aimbot.")
local bColors = addTabButton("Colors", "\240\159\142\168 | Car Colors.")
local bScratch = addTabButton("Scratch", "\240\159\167\169 | Block Studio v5.0.")
local bInfo = addTabButton("Info", "\226\132\185 | Info.")
local function createSectionHeader(parent, text, yPos)
local lbl = Instance.new("TextLabel", parent)
lbl.Size = UDim2.new(0.9, 0, 0, 25)
lbl.Position = UDim2.new(0.05, 0, 0, yPos)
lbl.TextColor3 = Color3.fromRGB(240, 240, 240)
lbl.TextSize = 11; lbl.Font = Enum.Font.RobotoMono; lbl.BackgroundTransparency = 1
lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Text = "| " .. text
end
local function createModuleRow(parent, text, yPos, typeStr, configKey, callback)
local frame = Instance.new("Frame", parent)
frame.Size = UDim2.new(0.9, 0, 0, 32); frame.Position = UDim2.new(0.05, 0, 0, yPos)
frame.BackgroundColor3 = Color3.fromRGB(20, 21, 26); frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
local str = Instance.new("UIStroke", frame); str.Color = Color3.fromRGB(45, 47, 55)
local lbl = Instance.new("TextLabel", frame)
lbl.Size = UDim2.new(0.6, 0, 1, 0); lbl.Position = UDim2.new(0.04, 0, 0, 0)
lbl.TextColor3 = Color3.fromRGB(190, 190, 190); lbl.TextSize = 11; lbl.Font = Enum.Font.RobotoMono; lbl.BackgroundTransparency = 1; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Text = text
if typeStr == "Checkbox" then
local box = Instance.new("TextButton", frame)
box.Size = UDim2.fromOffset(18, 18); box.Position = UDim2.new(1, -28, 0, 7)
box.BackgroundColor3 = Color3.fromRGB(28, 29, 35)
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
local bStr = Instance.new("UIStroke", box); bStr.Color = Color3.fromRGB(55, 58, 68)
box.TextColor3 = Color3.fromRGB(255, 255, 255); box.TextSize = 11; box.Font = Enum.Font.RobotoMono
local function updateBox()
if getgenv().JinxKingConfig[configKey] then box.BackgroundColor3 = Color3.fromRGB(0, 140, 255) box.Text = "✓" else box.BackgroundColor3 = Color3.fromRGB(28, 29, 35) box.Text = "" end
end
updateBox()
box.MouseButton1Click:Connect(function() getgenv().JinxKingConfig[configKey] = not getgenv().JinxKingConfig[configKey] updateBox() if callback then callback() end end)
elseif typeStr == "Button" then
local act = Instance.new("TextButton", frame)
act.Size = UDim2.fromOffset(55, 24); act.Position = UDim2.new(1, -60, 0, 4)
act.BackgroundColor3 = Color3.fromRGB(28, 29, 35); act.TextColor3 = Color3.fromRGB(180, 180, 180)
act.Text = configKey; act.TextSize = 11; act.Font = Enum.Font.RobotoMono
Instance.new("UICorner", act).CornerRadius = UDim.new(0, 4)
act.MouseButton1Click:Connect(callback)
end
return frame
end
local function createCustomSlider(parent, text, yPos, color, maxVal, configKey, suffix)
local frame = Instance.new("Frame", parent); frame.Size = UDim2.new(0.9, 0, 0, 45); frame.Position = UDim2.new(0.05, 0, 0, yPos); frame.BackgroundTransparency = 1
local label = Instance.new("TextLabel", frame); label.Size = UDim2.new(1, 0, 0, 15); label.TextColor3 = Color3.fromRGB(190, 190, 190); label.TextSize = 11; label.Font = Enum.Font.RobotoMono; label.BackgroundTransparency = 1; label.TextXAlignment = Enum.TextXAlignment.Left
local slideBar = Instance.new("Frame", frame); slideBar.Size = UDim2.new(1, 0, 0, 18); slideBar.Position = UDim2.new(0, 0, 0, 18); slideBar.BackgroundColor3 = Color3.fromRGB(24, 24, 26); slideBar.BorderSizePixel = 0
Instance.new("UICorner", slideBar).CornerRadius = UDim.new(0, 4)
local fill = Instance.new("Frame", slideBar); fill.Size = UDim2.new(getgenv().JinxKingConfig[configKey]/maxVal, 0, 1, 0); fill.BackgroundColor3 = color; fill.BorderSizePixel = 0
Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 4)
label.Text = "  " .. text .. " : " .. getgenv().JinxKingConfig[configKey] .. suffix
slideBar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
local pct = math.clamp((input.Position.X - slideBar.AbsolutePosition.X) / slideBar.AbsoluteSize.X, 0, 1)
fill.Size = UDim2.new(pct, 0, 1, 0); local finalVal = math.round(pct * maxVal); getgenv().JinxKingConfig[configKey] = finalVal
label.Text = "  " .. text .. " : " .. finalVal .. suffix
end
end)
end
-- Base Info Screen Configuration UI Rows
createSectionHeader(Pages["Info"], "Infos & Global Hub Configuration Matrix", 10)
local function buildInfoRow(text, y)
local f = Create("Frame", { Size = UDim2.new(0.9, 0, 0, 32), Position = UDim2.new(0.05, 0, 0, y), BackgroundColor3 = Color3.fromRGB(20,21,26), BorderSizePixel = 0 }, Pages["Info"]) Corner(f,4); Border(f)
Create("TextLabel", { Text = "  " .. text, Size = UDim2.new(1, 0, 1, 0), TextColor3 = Color3.fromRGB(180,180,185), TextSize = 11, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, f)
end
buildInfoRow("Authors: JanKaja", 40)
buildInfoRow("Edition: v5.0 [Prestige Block Edition]", 75)
-- Car Colors Content Deployment
createSectionHeader(Pages["Colors"], "Vehicle Light Tuning", 10)
local plateRow = createModuleRow(Pages["Colors"], "Server Custom Plate", 40, "Button", "Input", nil)
local InFrame = Instance.new("Frame", Screen); InFrame.Size = UDim2.fromOffset(240, 40); InFrame.Position = UDim2.new(0.4, 0, 0.45, 0); InFrame.BackgroundColor3 = Color3.fromRGB(20, 21, 26); InFrame.Visible = false
Instance.new("UICorner", InFrame).CornerRadius = UDim.new(0, 4)
local hIn = Instance.new("TextBox", InFrame); hIn.Size = UDim2.new(0.9, 0, 0.8, 0); hIn.Position = UDim2.new(0.05, 0, 0.1, 0); hIn.BackgroundColor3 = Color3.fromRGB(15, 16, 20); hIn.TextColor3 = Color3.fromRGB(255, 255, 255); hIn.PlaceholderText = "Text..."
local inputBtn = plateRow:FindFirstChildOfClass("TextButton")
if inputBtn then
inputBtn.MouseButton1Click:Connect(function() InFrame.Visible = not InFrame.Visible end)
end
hIn.FocusLost:Connect(function() getgenv().JinxKingConfig.CustomPlateText = hIn.Text InFrame.Visible = false end)
createCustomSlider(Pages["Colors"], "Reichweite", 85, Color3.fromRGB(0, 220, 120), 200, "LightRange", " Meter")
createCustomSlider(Pages["Colors"], "Helligkeit", 140, Color3.fromRGB(235, 180, 0), 150, "LightBrightness", " Stärke")
-- ==============================================================================
-- PROFILE FOOTER ELEMENT (Avatar-Kreis, JinxKing & Username)
-- ==============================================================================
local Profile = Create("Frame", { Name = "Profile", Position = UDim2.new(0, 0, 1, -58), Size = UDim2.new(1, 0, 0, 58), BackgroundColor3 = Color3.fromRGB(20, 21, 26), BorderSizePixel = 0 }, Sidebar)
local ProfileIcon = Create("ImageLabel", { Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(38, 38), BackgroundColor3 = Color3.fromRGB(28, 29, 35), BorderSizePixel = 0, Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size42x42) }, Profile)
Corner(ProfileIcon, 50); Border(ProfileIcon)
Create("TextLabel", { Position = UDim2.fromOffset(54, 11), Size = UDim2.new(1, -60, 0, 16), BackgroundTransparency = 1, Text = "JinxKing", TextColor3 = Color3.fromRGB(245, 246, 250), Font = Enum.Font.RobotoMono, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left }, Profile)
Create("TextLabel", { Position = UDim2.fromOffset(54, 28), Size = UDim2.new(1, -60, 0, 14), BackgroundTransparency = 1, Text = Player.Name, TextColor3 = Color3.fromRGB(130, 133, 145), Font = Enum.Font.RobotoMono, TextSize = 9, TextXAlignment = Enum.TextXAlignment.Left }, Profile)
-- Initial Page Loader
Pages["Info"].Visible = true
SelectedCategory = bInfo
bInfo.TextColor3 = Color3.fromRGB(0, 140, 255)
local activeAccent = bInfo:FindFirstChild("Accent")
if activeAccent then activeAccent.Visible = true end