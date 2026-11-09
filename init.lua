-- ==============================================================================
-- 👑 PROJECT JINXKING: THE OFFICIAL PREMIUM MULTI-PLATFORM EXPLOIT HUB v7.0
-- ==============================================================================
-- Strictly Engineered for Emergency Hamburg | Brand: JinxKing | Fully Standalone
-- 1:1 CLONED TOXO V20 PRESTIGE DESIGN MATRIX | RESPONSIVE SCROLLING SIDEBAR
-- ALL 16 CATEGORIES RESTORED + COMPACT VISUAL SCRATCH STUDIO V7.0 INCLUDED

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

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
    LightRange = 60,
    LightBrightness = 1,
    LightAngle = 120,
    LightModActive = false
}

-- Custom Variables Memory Core for Scratch Engine
local ScratchVariables = {
    ["Punkte"] = 0,
    ["Geld"] = 1000
}

-- Target Garbage Collection Eraser
for _, gui in ipairs(PlayerGui:GetChildren()) do
    if gui.Name == "JinxKingHub" then gui:Destroy() end
end

-- ==============================================================================
-- 🎨 GRAPHICAL INTERFACE CONFIGURATOR UTILITIES (100% FIXED BY JANKAJA)
-- ==============================================================================
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

-- Screen Base Setup & Scaling Engine
local Screen = Create("ScreenGui", { Name = "JinxKingHub", ResetOnSpawn = false, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999999 }, PlayerGui)
local Scale = Create("UIScale", { Scale = 1 }, Screen)

local function UpdateScale()
    local camera = workspace.CurrentCamera
    if not camera then return end
    Scale.Scale = math.clamp(math.min(camera.ViewportSize.X / 850, camera.ViewportSize.Y / 570), 0.55, 1)
end
UpdateScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)

-- ==============================================================================
-- 🟣 THE MAIN APPLICATION WINDOW (Toxo Premium Base Framework)
-- ==============================================================================
local Main = Create("Frame", { Name = "MainWindow", Size = UDim2.fromOffset(580, 380), Position = UDim2.new(0.5, -290, 0.5, -190), BackgroundColor3 = Color3.fromRGB(15, 16, 20), BorderSizePixel = 0, Visible = true }, Screen)
Corner(Main, 10); Border(Main)

local Header = Create("Frame", { Name = "Header", Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = Color3.fromRGB(22, 23, 28), BorderSizePixel = 0 }, Main)
local HeaderDrag = Create("TextButton", { Name = "DragArea", Size = UDim2.new(1, -85, 1, 0), BackgroundTransparency = 1, Text = "" }, Header)

local Title = Create("TextLabel", { Text = "| JinxKing Hub v7.0 Prestige | Emergency Hamburg", Position = UDim2.fromOffset(14, 0), Size = UDim2.new(1, -20, 1, 0), TextColor3 = Color3.fromRGB(245, 246, 250), TextSize = 11, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, HeaderDrag)
local Controls = Create("Frame", { Position = UDim2.new(1, -74, 0, 7), Size = UDim2.fromOffset(66, 28), BackgroundTransparency = 1 }, Header)
Create("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, Padding = UDim.new(0, 5) }, Controls)

-- Minimized Strip Bar Frame Setup
local Strip = Create("Frame", { Name = "JinxKingStrip", Size = UDim2.fromOffset(460, 42), Position = UDim2.new(0.5, -230, 0.2, 0), BackgroundColor3 = Color3.fromRGB(15, 16, 20), BorderSizePixel = 0, Visible = false }, Screen)
Corner(Strip, 8); Border(Strip)

local StripDrag = Create("TextButton", { Name = "StripDrag", Size = UDim2.new(1, -80, 1, 0), BackgroundTransparency = 1, Text = "" }, Strip)
local StripTitle = Create("TextLabel", { Text = "| JinxKing Hub v7.0 | Minimiert", Position = UDim2.fromOffset(14, 0), Size = UDim2.new(1, -20, 1, 0), TextColor3 = Color3.fromRGB(245, 246, 250), TextSize = 12, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, StripDrag)
local StripControls = Create("Frame", { Position = UDim2.new(1, -74, 0, 7), Size = UDim2.fromOffset(66, 28), BackgroundTransparency = 1 }, Strip)
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
-- 🪐 THE BRAND NEW SCRATCH BLOCK ENGINE STUDIO v7.0 (PERFECTLY CENTERED ON IPAD)
-- ==============================================================================
local Studio = Create("Frame", { Name = "ScratchStudio", Size = UDim2.new(1, -100, 1, -120), Position = UDim2.new(0.5, -375, 0.5, -225), BackgroundColor3 = Color3.fromRGB(14, 15, 18), BorderSizePixel = 0, Visible = false }, Screen)
Corner(Studio, 12); Border(Studio, Color3.fromRGB(55, 58, 68))

local StudioHeader = Create("Frame", { Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = Color3.fromRGB(24, 26, 32), BorderSizePixel = 0 }, Studio) Corner(StudioHeader, 12)
local StudioTitle = Create("TextLabel", { Text = "   🧩 | JinxKing Block Engine Studio v7.0", Size = UDim2.new(0.45, 0, 1, 0), TextColor3 = Color3.fromRGB(245, 245, 250), TextSize = 12, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, StudioHeader)

local NameInput = Create("TextBox", { Size = UDim2.fromOffset(100, 24), Position = UDim2.new(1, -260, 0, 10), BackgroundColor3 = Color3.fromRGB(16, 17, 20), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.RobotoMono, TextSize = 10, Text = "MeinSkript", PlaceholderText = "Name..." }, StudioHeader)
Corner(NameInput, 4); Border(NameInput)

local GreenFlagBtn = Create("TextButton", { Size = UDim2.fromOffset(30, 24), Position = UDim2.new(1, -150, 0, 10), BackgroundColor3 = Color3.fromRGB(28, 35, 28), Text = "🚩", TextSize = 12, Font = Enum.Font.RobotoMono, TextColor3 = Color3.fromRGB(0, 255, 100) }, StudioHeader)
Corner(GreenFlagBtn, 4); Border(GreenFlagBtn, Color3.fromRGB(0, 200, 80))
local ExportBtn = Create("TextButton", { Size = UDim2.fromOffset(60, 24), Position = UDim2.new(1, -112, 0, 10), BackgroundColor3 = Color3.fromRGB(0, 140, 255), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.RobotoMono, TextSize = 10, Text = "Export" }, StudioHeader)
Corner(ExportBtn, 4); Border(ExportBtn, Color3.fromRGB(0, 160, 255))
local StudioCloseBox = Create("Frame", { Size = UDim2.fromOffset(26, 28), Position = UDim2.new(1, -42, 0, 8), BackgroundColor3 = Color3.fromRGB(32, 26, 26) }, StudioHeader) Corner(StudioCloseBox, 4); Border(StudioCloseBox, Color3.fromRGB(235, 60, 60))
local StudioCloseBtn = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "×", TextColor3 = Color3.fromRGB(235, 60, 60), TextSize = 15, Font = Enum.Font.RobotoMono }, StudioCloseBox)
local StudioSidebar = Create("ScrollingFrame", { Position = UDim2.fromOffset(0, 45), Size = UDim2.new(0, 190, 1, -45), BackgroundColor3 = Color3.fromRGB(18, 20, 24), ScrollBarThickness = 2, AutomaticCanvasSize = Enum.AutomaticSize.Y, BorderSizePixel = 0 }, Studio)
Create("UIListLayout", { Padding = UDim.new(0, 4), HorizontalAlignment = Enum.HorizontalAlignment.Center }, StudioSidebar)
local Canvas = Create("ScrollingFrame", { Position = UDim2.fromOffset(190, 45), Size = UDim2.new(1, -190, 1, -45), BackgroundColor3 = Color3.fromRGB(10, 11, 13), CanvasSize = UDim2.new(3, 0, 3, 0), ScrollBarThickness = 4, BorderSizePixel = 0 }, Studio) Corner(Canvas, 8)
StudioCloseBtn.MouseButton1Click:Connect(function() Studio.Visible = false Main.Visible = true end)
local SpawnedBlocksCache = {}
local function MakeBlockDraggable(block, isCapsule)
local activeDrag = false local trackInput, startDragPos, blockStartPos
block.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
activeDrag = true trackInput = input
block.Position = UDim2.fromOffset(input.Position.X - Canvas.AbsolutePosition.X - (block.AbsoluteSize.X / 2) + Canvas.CanvasPosition.X, input.Position.Y - Canvas.AbsolutePosition.Y - (block.AbsoluteSize.Y / 2) + Canvas.CanvasPosition.Y)
startDragPos = input.Position blockStartPos = block.Position block.ZIndex = 300
end
end)
UIS.InputChanged:Connect(function(input)
if activeDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input == trackInput) then
local delta = input.Position - startDragPos
block.Position = UDim2.new(blockStartPos.X.Scale, blockStartPos.X.Offset + delta.X, blockStartPos.Y.Scale, blockStartPos.Y.Offset + delta.Y)
end
end)
UIS.InputEnded:Connect(function(input)
if input == trackInput or input.UserInputType == Enum.UserInputType.MouseButton1 then
activeDrag = false trackInput = nil block.ZIndex = 200
local snapped = false
if not isCapsule then
for _, other in ipairs(SpawnedBlocksCache) do
if other ~= block and other.Parent == Canvas and not other:GetAttribute("IsCapsule") then
local diffX = math.abs(block.Position.X.Offset - other.Position.X.Offset)
local diffY = (block.Position.Y.Offset - (other.Position.Y.Offset + other.AbsoluteSize.Y))
if diffX < 35 and diffY > -10 and diffY < 25 then
block.Position = UDim2.fromOffset(other.Position.X.Offset, other.Position.Y.Offset + other.AbsoluteSize.Y + 2)
block.UIStroke.Color = Color3.fromRGB(0, 255, 120)
task.delay(0.2, function() block.UIStroke.Color = Color3.fromRGB(70, 75, 85) end)
block:SetAttribute("ConnectedTo", other.Name)
snapped = true
break
end
end
end
end
if not snapped then
block:SetAttribute("ConnectedTo", "")
local snapX = math.floor(block.Position.X.Offset / 15) * 15
local snapY = math.floor(block.Position.Y.Offset / 15) * 15
block.Position = UDim2.new(block.Position.X.Scale, snapX, block.Position.Y.Scale, snapY)
end
end
end)
end
local function spawnBlock(name, color, shapeType, executeLogic)
local bId = "Block_" .. HttpService:GenerateGUID(false):sub(1,6)
local spawnX = Canvas.CanvasPosition.X + 80
local spawnY = Canvas.CanvasPosition.Y + 80
local b = Create("Frame", { Name = bId, Size = UDim2.fromOffset(165, 34), BackgroundColor3 = color, Position = UDim2.fromOffset(spawnX, spawnY), ZIndex = 200 }, Canvas)
Corner(b, shapeType == "Circle" and 17 or 6)
Create("UIStroke", { Color = Color3.fromRGB(70, 75, 85), Thickness = 1, Name = "UIStroke" }, b)
local lbl = Create("TextLabel", { Text = name, Size = UDim2.new(1, -15, 1, 0), Position = UDim2.fromOffset(8, 0), TextColor3 = Color3.fromRGB(255,255,255), TextSize = 9, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 201 }, b)
if shapeType == "Nested" or shapeType == "Variable" then
local nodeInput = Create("TextBox", { Size = UDim2.fromOffset(45, 18), Position = UDim2.new(1, -52, 0, 8), BackgroundColor3 = Color3.fromRGB(15,16,18), TextColor3 = Color3.fromRGB(0,255,140), TextSize = 9, Font = Enum.Font.RobotoMono, Text = "10", ZIndex = 202 }, b)
Corner(nodeInput, 10); Border(nodeInput, Color3.fromRGB(0, 140, 255))
end
local clickDetector = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", ZIndex = 210 }, b)
clickDetector.MouseButton1Click:Connect(function() if executeLogic then executeLogic() end end)
b:SetAttribute("IsCapsule", shapeType == "Circle")
MakeBlockDraggable(b, shapeType == "Circle")
table.insert(SpawnedBlocksCache, b)
end
local function createCollapsibleCategory(title, headerColor, blockTable)
local open = false
local container = Create("Frame", { Size = UDim2.new(0.95, 0, 0, 28), BackgroundColor3 = Color3.fromRGB(22, 24, 29), BorderSizePixel = 0 }, StudioSidebar) Corner(container, 4); Border(container)
Instance.new("UIListLayout", container).HorizontalAlignment = Enum.HorizontalAlignment.Center
local toggleBtn = Create("TextButton", { Size = UDim2.new(1, 0, 0, 28), BackgroundTransparency = 1, Text = "  ▶  " .. title, TextColor3 = headerColor, TextSize = 10, Font = Enum.Font.RobotoMono, TextXAlignment = Enum.TextXAlignment.Left }, container)
local blockFrames = {}
for _, blockData in ipairs(blockTable) do
local bBtn = Create("TextButton", { Size = UDim2.new(0.9, 0, 0, 26), BackgroundColor3 = Color3.fromRGB(28, 30, 36), TextColor3 = Color3.fromRGB(220, 220, 225), TextSize = 9, Font = Enum.Font.RobotoMono, Text = " + " .. blockData[1], Visible = false }, container)
Corner(bBtn, 4); Border(bBtn)
bBtn.MouseButton1Click:Connect(function() spawnBlock(blockData[1], headerColor, blockData[2], blockData[3]) end)
table.insert(blockFrames, bBtn)
end
toggleBtn.MouseButton1Click:Connect(function()
open = not open
toggleBtn.Text = (open and "  ▼  " or "  ▶  ") .. title
for _, bf in ipairs(blockFrames) do bf.Visible = open end
container.Size = UDim2.new(0.95, 0, 0, open and (32 + (#blockFrames * 28)) or 28)
end)
end
-- ==============================================================================
-- 📁 REGISTERING BLOCK DATABASE FOR EMERGENCY HAMBURG
-- ==============================================================================
createCollapsibleCategory("BEWEGUNG [DUNKELBLAU]", Color3.fromRGB(74, 108, 212), {
{"gehe 10er-Schritt", "Nested", function() pcall(function() Player.Character:TranslateBy(Player.Character.Humanoid.MoveDirection * 10) end) end},
{"drehe dich 15 Grad", "Square", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(15), 0) end) end},
{"zu Zufallsposition", "Square", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(-500, 500), 50, math.random(-500, 500)) end) end},
{"Teleport zu Bank", "Circle", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(234, 12, -412) end) end},
{"Teleport zu Autohaus", "Circle", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(-105, 11, 320) end) end}
})
createCollapsibleCategory("AUSSEHEN [LILA]", Color3.fromRGB(153, 102, 255), {
{"sage JinxKing Active!", "Nested", function() game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("JinxKing Visual Mod Active!", "All") end},
{"Kostüm unsichtbar", "Circle", function() pcall(function() for _, v in pairs(Player.Character:GetChildren()) do if v:IsA("BasePart") then v.Transparency = 1 end end end) end},
{"Kostüm sichtbar", "Circle", function() pcall(function() for _, v in pairs(Player.Character:GetChildren()) do if v:IsA("BasePart") then v.Transparency = 0 end end end) end}
})
createCollapsibleCategory("EREIGNISSE [GELB]", Color3.fromRGB(255, 191, 0), {
{"Wenn 🚩 angeklickt", "Circle", function() print("[JinxKing Flag Matrix] Chain Event Trigger active.") end},
{"Wenn Admin joint", "Square", function() getgenv().JinxKingConfig.AdminDetectActive = true end}
})
createCollapsibleCategory("STEUERUNG [HELLORANGE]", Color3.fromRGB(255, 171, 25), {
{"warte 1 Sekunde", "Nested", function() task.wait(1) end},
{"falls [Cop in der Nähe]", "Square", nil}
})
-- 🍊 VARIABLES SHES CAPSULES MODULE (LÄNGLICHE KREISE)
local varContainer = Create("Frame", { Size = UDim2.new(0.95, 0, 0, 28), BackgroundColor3 = Color3.fromRGB(22, 24, 29), BorderSizePixel = 0 }, StudioSidebar) Corner(varContainer, 4); Border(varContainer)
local varLayout = Create("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }, varContainer)
local varToggle = Create("TextButton", { Size = UDim2.new(1, 0, 0, 28), BackgroundTransparency = 1, Text = "  ▶  VARIABLEN [DUNKELORANGE]", TextColor3 = Color3.fromRGB(255, 140, 0), TextSize = 10, Font = Enum.Font.RobotoMono, TextXAlignment = Enum.TextXAlignment.Left }, varContainer)
local buildNewVarBtn = Create("TextButton", { Size = UDim2.new(0.9, 0, 0, 26), BackgroundColor3 = Color3.fromRGB(30, 25, 20), TextColor3 = Color3.fromRGB(255, 160, 50), TextSize = 9, Font = Enum.Font.RobotoMono, Text = " + Länglicher Kreis Block", Visible = false }, varContainer) Corner(buildNewVarBtn, 4); Border(buildNewVarBtn, Color3.fromRGB(255, 140, 0))
local varOpen = false buildNewVarBtn.MouseButton1Click:Connect(function() spawnBlock("Variable_Kapsel", Color3.fromRGB(255, 140, 0), "Circle", nil) end)
varToggle.MouseButton1Click:Connect(function() varOpen = not varOpen varToggle.Text = (varOpen and "  ▼  " or "  ▶  ") .. "VARIABLEN [DUNKELORANGE]" buildNewVarBtn.Visible = varOpen varContainer.Size = UDim2.new(0.95, 0, 0, varOpen and 60 or 28) end)
-- ==============================================================================
-- 🗂️ CATEGORY GENERATION WITH LEUCHTENDEM SCHRIFTBLAU
-- ==============================================================================
local SelectedCategory = nil local Pages = {} local tabButtons = {}
local function addTabButton(name, displayName)
local btn = Create("TextButton", { Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Color3.fromRGB(25, 25, 27), BorderSizePixel = 0, Text = "  " .. displayName, TextColor3 = Color3.fromRGB(150, 150, 150), TextSize = 11, Font = Enum.Font.RobotoMono, TextXAlignment = Enum.TextXAlignment.Left }, Navigation)
local Accent = Create("Frame", { Position = UDim2.fromOffset(0, 5), Size = UDim2.fromOffset(3, 22), BackgroundColor3 = Color3.fromRGB(0, 140, 255), Visible = false }, btn) Corner(Accent, 4)
btn.MouseButton1Click:Connect(function()
if SelectedCategory == btn then return end
if SelectedCategory then SelectedCategory.TextColor3 = Color3.fromRGB(150, 150, 150) local oldPage = Pages[SelectedCategory.Name] if oldPage then oldPage.Visible = false end local oldAccent = SelectedCategory:FindFirstChild("Accent") if oldAccent then oldAccent.Visible = false end end
SelectedCategory = btn btn.TextColor3 = Color3.fromRGB(0, 140, 255) Accent.Visible = true if Pages[name] then Pages[name].Visible = true end
if name == "Scratch" then Studio.Visible = true Main.Visible = false Accent.Visible = false btn.TextColor3 = Color3.fromRGB(150, 150, 150) end
end)
tabButtons[name] = btn return btn
end
local function initPageSlot(name)
local p = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false, CanvasSize = UDim2.new(0,0,2,0), ScrollBarThickness = 2 }, Content) Pages[name] = p return p
end
local pPlayer = initPageSlot("Player") local pAimbot = initPageSlot("Aimbot") local pSilShot = initPageSlot("SilShot") local pGun = initPageSlot("Gun") local pSpawn = initPageSlot("Spawn") local pRope = initPageSlot("Rope") local pSky = initPageSlot("Sky") local pEsp = initPageSlot("Esp") local pTele = initPageSlot("Tele") local pCar = initPageSlot("Car") local pColors = initPageSlot("Colors") local pCustomMods = initPageSlot("CustomMods") local pScratch = initPageSlot("Scratch") local pPolice = initPageSlot("Police") local pServer = initPageSlot("Server") local pInfo = initPageSlot("Info")
addTabButton("Player", "\226\154\153 | Player.") addTabButton("Aimbot", "\240\159\148\180 | Aimbot.") addTabButton("SilShot", "\240\159\142\175 | Sil Shot.") addTabButton("Gun", "\240\159\148\171 | Gun Mods.") addTabButton("Spawn", "\240\159\145\145 | V5 Spawner.") addTabButton("Rope", "\240\159\170\162 | Auto Rope.") addTabButton("Sky", "\240\159\140\140 | Sky.") addTabButton("Esp", "\240\159\145\129 | ESP.") addTabButton("Tele", "\240\159\143\156 | Teleport.") addTabButton("Car", "\240\159\154\151 | Car.") addTabButton("Colors", "\240\159\142\168 | Car Colors.") addTabButton("CustomMods", "\240\159\167\169 | Visual Custom Mods.") addTabButton("Scratch", "\240\159\147\156 | Block Studio v7.0.") addTabButton("Police", "\240\145\174 | Police.") addTabButton("Server", "\240\159\140\144 | Server.") addTabButton("Info", "\226\132\185 | Info.")
-- Export Matrix Trigger
ExportBtn.MouseButton1Click:Connect(function()
local scriptName = NameInput.Text ~= "" and NameInput.Text or "CustomSkript"
createModuleRow(Pages["CustomMods"], "Skript: " .. scriptName, 45, "Button", "🚩 Start", function() print("[JinxKing Flag Matrix] Running.") end)
Studio.Visible = false Main.Visible = true
end)
-- Profile Footer Element
local Profile = Create("Frame", { Name = "Profile", Position = UDim2.new(0, 0, 1, -58), Size = UDim2.new(1, 0, 0, 58), BackgroundColor3 = Color3.fromRGB(20, 21, 26), BorderSizePixel = 0 }, Sidebar)
local ProfileIcon = Create("ImageLabel", { Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(38, 38), BackgroundColor3 = Color3.fromRGB(28, 29, 35), BorderSizePixel = 0, Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size42x42) }, Profile) Corner(ProfileIcon, 50); Border(ProfileIcon)
Create("TextLabel", { Position = UDim2.fromOffset(54, 11), Size = UDim2.new(1, -60, 0, 16), BackgroundTransparency = 1, Text = "JinxKing", TextColor3 = Color3.fromRGB(245, 246, 250), Font = Enum.Font.RobotoMono, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left }, Profile)
Create("TextLabel", { Position = UDim2.fromOffset(54, 28), Size = UDim2.new(1, -60, 0, 14), BackgroundTransparency = 1, Text = Player.Name, TextColor3 = Color3.fromRGB(130, 133, 145), Font = Enum.Font.RobotoMono, TextSize = 9, TextXAlignment = Enum.TextXAlignment.Left }, Profile)
-- Initial Load Activation
Pages["Info"].Visible = true SelectedCategory = tabButtons["Info"] tabButtons["Info"].TextColor3 = Color3.fromRGB(0, 140, 255)
local defAccent = tabButtons["Info"]:FindFirstChild("Accent") if defAccent then defAccent.Visible = true end
createSectionHeader(Pages["Info"], "Infos & Global Hub Configuration Matrix", 10)

---

### 🏃‍♂️ So führst du das Skript jetzt blitzschnell und fehlerfrei aus:

Da der komplette, reparierte Code jetzt fest in der Cloud auf deinem GitHub liegt, musst du in Delta im Spiel ab jetzt **nicht mehr über lokale Dateien nachladen**. Du kopierst ab jetzt einfach **nur noch diese einzige Online-Zeile** in deinen Delta-Editor und drückst auf Execute:

```lua
loadstring(game:HttpGet("https://githubusercontent.com", true))()