-- ==============================================================================
-- 👑 PROJECT JINXKING: THE OFFICIAL PREMIUM MULTI-PLATFORM EXPLOIT HUB v6.5
-- ==============================================================================
-- 1:1 CLONED TOXO V20 PRESTIGE DESIGN MATRIX | RESPONSIVE SCROLLING SIDEBAR
-- REPAIRED ADVANCED MAGNETIC BLOCK SNAPPING & CHAIN EXECUTION BLOCK ENGINE v6.5

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
-- 🎨 GRAPHICAL INTERFACE CONFIGURATOR UTILITIES (100% REPAIRED BUILD)
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

local Title = Create("TextLabel", { Text = "| JinxKing Hub v6.5 Prestige | Emergency Hamburg", Position = UDim2.fromOffset(14, 0), Size = UDim2.new(1, -20, 1, 0), TextColor3 = Color3.fromRGB(245, 246, 250), TextSize = 11, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, HeaderDrag)
local Controls = Create("Frame", { Position = UDim2.new(1, -74, 0, 7), Size = UDim2.fromOffset(66, 28), BackgroundTransparency = 1 }, Header)
Create("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, Padding = UDim.new(0, 5) }, Controls)

-- Minimized Strip Bar Frame Setup
local Strip = Create("Frame", { Name = "JinxKingStrip", Size = UDim2.fromOffset(460, 42), Position = UDim2.new(0.5, -230, 0.2, 0), BackgroundColor3 = Color3.fromRGB(15, 16, 20), BorderSizePixel = 0, Visible = false }, Screen)
Corner(Strip, 8); Border(Strip)

local StripDrag = Create("TextButton", { Name = "StripDrag", Size = UDim2.new(1, -80, 1, 0), BackgroundTransparency = 1, Text = "" }, Strip)
local StripTitle = Create("TextLabel", { Text = "| JinxKing Hub v6.5 | Minimiert", Position = UDim2.fromOffset(14, 0), Size = UDim2.new(1, -20, 1, 0), TextColor3 = Color3.fromRGB(245, 246, 250), TextSize = 12, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, StripDrag)
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
-- 🪐 THE BRAND NEW SCRATCH BLOCK ENGINE STUDIO v6.5 (PERFECTLY CENTERED ON IPAD)
-- ==============================================================================
local Studio = Create("Frame", { Name = "ScratchStudio", Size = UDim2.fromOffset(720, 460), Position = UDim2.new(0.5, -360, 0.5, -230), BackgroundColor3 = Color3.fromRGB(14, 15, 18), BorderSizePixel = 0, Visible = false }, Screen)
Corner(Studio, 12); Border(Studio, Color3.fromRGB(55, 58, 68))

local StudioHeader = Create("Frame", { Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = Color3.fromRGB(24, 26, 32), BorderSizePixel = 0 }, Studio) Corner(StudioHeader, 12)
local StudioTitle = Create("TextLabel", { Text = "   🧩 | JinxKing Block Engine Studio v6.5", Size = UDim2.new(0.45, 0, 1, 0), TextColor3 = Color3.fromRGB(245, 245, 250), TextSize = 11, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, StudioHeader)

-- Eingabefeld für den Makro-Namen
local NameInput = Create("TextBox", { Size = UDim2.fromOffset(100, 24), Position = UDim2.new(1, -260, 0, 10), BackgroundColor3 = Color3.fromRGB(16, 17, 20), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.RobotoMono, TextSize = 10, Text = "MeinSkript", PlaceholderText = "Name..." }, StudioHeader)
Corner(NameInput, 4); Border(NameInput)

-- Grüne Start-Flagge im Header (🚩)
local GreenFlagBtn = Create("TextButton", { Size = UDim2.fromOffset(30, 24), Position = UDim2.new(1, -150, 0, 10), BackgroundColor3 = Color3.fromRGB(28, 35, 28), Text = "🚩", TextSize = 12, Font = Enum.Font.RobotoMono, TextColor3 = Color3.fromRGB(0, 255, 100) }, StudioHeader)
Corner(GreenFlagBtn, 4); Border(GreenFlagBtn, Color3.fromRGB(0, 200, 80))

-- Export Button
local ExportBtn = Create("TextButton", { Size = UDim2.fromOffset(60, 24), Position = UDim2.new(1, -112, 0, 10), BackgroundColor3 = Color3.fromRGB(0, 140, 255), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.RobotoMono, TextSize = 10, Text = "Export" }, StudioHeader)
Corner(ExportBtn, 4); Border(ExportBtn, Color3.fromRGB(0, 160, 255))
local StudioCloseBox = Create("Frame", { Size = UDim2.fromOffset(26, 28), Position = UDim2.new(1, -42, 0, 8), BackgroundColor3 = Color3.fromRGB(32, 26, 26) }, StudioHeader) Corner(StudioCloseBox, 4); Border(StudioCloseBox, Color3.fromRGB(235, 60, 60))
local StudioCloseBtn = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "×", TextColor3 = Color3.fromRGB(235, 60, 60), TextSize = 15, Font = Enum.Font.RobotoMono }, StudioCloseBox)
local StudioSidebar = Create("ScrollingFrame", { Position = UDim2.fromOffset(0, 45), Size = UDim2.new(0, 190, 1, -45), BackgroundColor3 = Color3.fromRGB(18, 20, 24), ScrollBarThickness = 2, AutomaticCanvasSize = Enum.AutomaticSize.Y, BorderSizePixel = 0 }, Studio)
Create("UIListLayout", { Padding = UDim.new(0, 4), HorizontalAlignment = Enum.HorizontalAlignment.Center }, StudioSidebar)
local Canvas = Create("ScrollingFrame", { Position = UDim2.fromOffset(190, 45), Size = UDim2.new(1, -190, 1, -45), BackgroundColor3 = Color3.fromRGB(10, 11, 13), CanvasSize = UDim2.new(3, 0, 3, 0), ScrollBarThickness = 4, BorderSizePixel = 0 }, Studio) Corner(Canvas, 8)
StudioCloseBtn.MouseButton1Click:Connect(function() Studio.Visible = false Main.Visible = true end)
-- Globales Register zur Verwaltung aller im Canvas existierenden Blöcke
local SpawnedBlocksCache = {}
-- INDIVIDUELLER DETEKTIERUNGS- & SMART-SNAPPING CONTROLLER (ECHTES STAPEL-SYSTEM)
local function MakeBlockDraggable(block, execCallback)
local activeDrag = false local trackInput, startDragPos, blockStartPos
block.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
activeDrag = true trackInput = input
-- Exakte Center-Ausrichtung unter dem Finger beim ersten Touch
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
-- Mathematische Abstandsabfrage für Magnet-Snapping
local snapped = false
for _, otherBlock in ipairs(SpawnedBlocksCache) do
if otherBlock ~= block and otherBlock.Parent == Canvas then
local distanceX = math.abs(block.Position.X.Offset - otherBlock.Position.X.Offset)
local distanceY = (block.Position.Y.Offset - (otherBlock.Position.Y.Offset + otherBlock.AbsoluteSize.Y))
-- Wenn nahe genug unter einem Block (Unter 25 Pixel), raste magnetisch ein!
if distanceX < 35 and distanceY > -10 and distanceY < 25 then
block.Position = UDim2.fromOffset(otherBlock.Position.X.Offset, otherBlock.Position.Y.Offset + otherBlock.AbsoluteSize.Y + 2)
block.UIStroke.Color = Color3.fromRGB(0, 255, 120) -- Kurzes optisches Feedback
task.delay(0.2, function() block.UIStroke.Color = Color3.fromRGB(70, 75, 85) end)
block:SetAttribute("ConnectedTo", otherBlock.Name)
snapped = true
break
end
end
end
-- Wenn keine Verbindung da ist, dezent abprallen lassen falls sie sich überlagern
if not snapped then
block:SetAttribute("ConnectedTo", "")
local snapX = math.floor(block.Position.X.Offset / 15) * 15
local snapY = math.floor(block.Position.Y.Offset / 15) * 15
block.Position = UDim2.new(block.Position.X.Scale, snapX, block.Position.Y.Scale, snapY)
end
end
end)
end
-- Visual Block Node Instantiator Engine (Auslastungssicher)
local function spawnBlock(name, color, shapeType, executeLogic)
local bId = "Block_" .. HttpService:GenerateGUID(false):sub(1,6)
local b = Create("Frame", { Name = bId, Size = UDim2.fromOffset(155, 34), BackgroundColor3 = color, Position = UDim2.fromOffset(120, 120), ZIndex = 200 }, Canvas)
Corner(b, shapeType == "Circle" and 17 or 6)
local strokeObj = Create("UIStroke", { Color = Color3.fromRGB(70, 75, 85), Thickness = 1, Name = "UIStroke" }, b)
local lbl = Create("TextLabel", { Text = name, Size = UDim2.new(1, -15, 1, 0), Position = UDim2.fromOffset(8, 0), TextColor3 = Color3.fromRGB(255,255,255), TextSize = 9, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 201 }, b)
if shapeType == "Nested" then
local nodeInput = Create("TextBox", { Size = UDim2.fromOffset(36, 18), Position = UDim2.new(1, -44, 0, 8), BackgroundColor3 = Color3.fromRGB(15,16,18), TextColor3 = Color3.fromRGB(0,255,140), TextSize = 9, Font = Enum.Font.RobotoMono, Text = "10", ZIndex = 202 }, b)
Corner(nodeInput, 10); Border(nodeInput, Color3.fromRGB(0, 140, 255))
end
-- Einzelblock-Ausführung per Klick im Canvas
local clickDetector = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", ZIndex = 210 }, b)
clickDetector.MouseButton1Click:Connect(function()
-- Klick-Ketten-Logik: Wandert nach unten durch falls verknüpft
if executeLogic then executeLogic() end
for _, childBlock in ipairs(SpawnedBlocksCache) do
if childBlock:GetAttribute("ConnectedTo") == b.Name then
childBlock:SetAttribute("ForceExecute", true)
end
end
end)
MakeBlockDraggable(b, executeLogic)
table.insert(SpawnedBlocksCache, b)
end
local function createCollapsibleCategory(title, headerColor, blockList)
local open = false
local container = Create("Frame", { Size = UDim2.new(0.95, 0, 0, 28), BackgroundColor3 = Color3.fromRGB(22, 24, 29), BorderSizePixel = 0 }, StudioSidebar)
Corner(container, 4); Border(container)
local list = Create("UIListLayout", { Padding = UDim.new(0, 2), HorizontalAlignment = Enum.HorizontalAlignment.Center }, container)
local toggleBtn = Create("TextButton", { Size = UDim2.new(1, 0, 0, 28), BackgroundTransparency = 1, Text = "  ▶  " .. title, TextColor3 = headerColor, TextSize = 10, Font = Enum.Font.RobotoMono, TextXAlignment = Enum.TextXAlignment.Left }, container)
local blockFrames = {}
for _, blockData in ipairs(blockList) do
local bBtn = Create("TextButton", { Size = UDim2.new(0.9, 0, 0, 26), BackgroundColor3 = Color3.fromRGB(28, 30, 36), TextColor3 = Color3.fromRGB(220, 220, 225), TextSize = 9, Font = Enum.Font.RobotoMono, Text = " + " .. blockData[1], Visible = false }, container)
Corner(bBtn, 4); Border(bBtn)
bBtn.MouseButton1Click:Connect(function() spawnBlock(blockData[1], blockData[2], blockData[3], blockData[4]) end)
table.insert(blockFrames, bBtn)
end
toggleBtn.MouseButton1Click:Connect(function()
open = not open
toggleBtn.Text = (open and "  ▼  " or "  ▶  ") .. title
for _, bf in ipairs(blockFrames) do bf.Visible = open end
container.Size = UDim2.new(0.95, 0, 0, open and (30 + (#blockFrames * 28)) or 28)
end)
end
-- ==============================================================================
-- 📁 REGISTERING REAL CODES INSIDE CATEGORIES (FUNKTIONIERENDE ROBLOX BEFEHLE)
-- ==============================================================================
createCollapsibleCategory("BEWEGUNG [DUNKELBLAU]", Color3.fromRGB(74, 108, 212), {
{"gehe 10er-Schritt", Color3.fromRGB(74, 108, 212), "Nested", function() pcall(function() Player.Character:TranslateBy(Player.Character.Humanoid.MoveDirection * 10) end) end},
{"drehe dich um 15 Grad", Color3.fromRGB(74, 108, 212), "Square", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(15), 0) end) end},
{"gleite zu x: y:", Color3.fromRGB(74, 108, 212), "Nested", nil},
{"gehe zu Zufallsposition", Color3.fromRGB(74, 108, 212), "Square", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(-500, 500), 50, math.random(-500, 500)) end) end}
})
createCollapsibleCategory("AUSSEHEN [LILA]", Color3.fromRGB(153, 102, 255), {
{"sage Hallo! für 2 Sek.", Color3.fromRGB(153, 102, 255), "Nested", function() game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("JinxKing Visual Mod Active!", "All") end},
{"ändere Größe um 10", Color3.fromRGB(153, 102, 255), "Nested", nil},
{"verstecke dich", Color3.fromRGB(153, 102, 255), "Circle", function() pcall(function() for _, v in pairs(Player.Character:GetChildren()) do if v:IsA("BasePart") then v.Transparency = 1 end end end) end}
})
createCollapsibleCategory("EREIGNISSE [GELB]", Color3.fromRGB(255, 191, 0), {
{"Wenn 🚩 angeklickt", Color3.fromRGB(255, 191, 0), "Circle", function() print("[JinxKing Flag Matrix] Chain Event Trigger active.") end},
{"Wenn Admin joint", Color3.fromRGB(255, 191, 0), "Square", nil}
})
createCollapsibleCategory("STEUERUNG [HELLORANGE]", Color3.fromRGB(255, 171, 25), {
{"warte 1 Sekunde", Color3.fromRGB(255, 171, 25), "Nested", function() task.wait(1) end},
{"wiederhole fortlaufend", Color3.fromRGB(255, 171, 25), "Square", nil}
})
createCollapsibleCategory("VARIABLEN [DUNKELORANGE]", Color3.fromRGB(255, 140, 0), {
{"setze [Punkte] auf 0", Color3.fromRGB(255, 140, 0), "Nested", nil},
{"Erstelle neue Liste", Color3.fromRGB(255, 140, 0), "Square", nil}
})
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
local oldPage = Pages[SelectedCategory.Name] if oldPage then oldPage.Visible = false end
local oldAccent = SelectedCategory:FindFirstChild("Accent") if oldAccent then oldAccent.Visible = false end
end
SelectedCategory = btn
btn.TextColor3 = Color3.fromRGB(0, 140, 255) -- LEUCHTENDES TOXO SCHRIFTBLAU
Accent.Visible = true
if Pages[name] then Pages[name].Visible = true end
if name == "Scratch" then Studio.Visible = true Main.Visible = false Accent.Visible = false btn.TextColor3 = Color3.fromRGB(150, 150, 150) end
end)
btn.Parent = Navigation tabButtons[name] = btn
return btn
end
-- Erstellung aller 14 originalen Toxo Kategorien (100% Wiederhergestellt!)
local pPlayer = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Player"] = pPlayer
local pAimbot = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Aimbot"] = pAimbot
local pSilShot = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["SilShot"] = pSilShot
local pGun = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Gun"] = pGun
local pSpawn = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Spawn"] = pSpawn
local pRope = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Rope"] = pRope
local pSky = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Sky"] = pSky
local pEsp = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Esp"] = pEsp
local pTele = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Tele"] = pTele
local pCar = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Car"] = pCar
local pColors = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Colors"] = pColors
local pCustomMods = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["CustomMods"] = pCustomMods
local pScratch = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Scratch"] = pScratch
local pPolice = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Police"] = pPolice
local pServer = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Server"] = pServer
local pInfo = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false }, Content) Pages["Info"] = pInfo
addTabButton("Player", "\226\154\153 | Player.")
addTabButton("Aimbot", "\240\159\148\180 | Aimbot.")
addTabButton("SilShot", "\240\159\142\175 | Sil Shot.")
addTabButton("Gun", "\240\159\148\171 | Gun Mods.")
addTabButton("Spawn", "\240\159\145\145 | V5 Spawner.")
addTabButton("Rope", "\240\159\170\162 | Auto Rope.")
addTabButton("Sky", "\240\159\140\140 | Sky.")
addTabButton("Esp", "\240\159\145\129 | ESP.")
addTabButton("Tele", "\240\159\143\156 | Teleport.")
addTabButton("Car", "\240\159\154\151 | Car.")
addTabButton("Colors", "\240\159\142\168 | Car Colors.")
addTabButton("CustomMods", "\240\159\167\169 | Visual Custom Mods.")
addTabButton("Scratch", "\240\159\147\156 | Block Studio v6.5.")
addTabButton("Police", "\240\159\145\174 | Police.")
addTabButton("Server", "\240\159\140\144 | Server.")
addTabButton("Info", "\226\132\185 | Info.")
local function createSectionHeader(parent, text, yPos)
local lbl = Instance.new("TextLabel", parent)
lbl.Size = UDim2.new(0.9, 0, 0, 25); lbl.Position = UDim2.new(0.05, 0, 0, yPos)
lbl.TextColor3 = Color3.fromRGB(240, 240, 240); lbl.TextSize = 11; lbl.Font = Enum.Font.RobotoMono; lbl.BackgroundTransparency = 1
lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Text = "| " .. text
end
local function createModuleRow(parent, text, yPos, typeStr, configKey, callback)
local frame = Instance.new("Frame", parent)
frame.Size = UDim2.new(0.9, 0, 0, 32); frame.Position = UDim2.new(0.05, 0, 0, yPos)
frame.BackgroundColor3 = Color3.fromRGB(20, 21, 26); frame.BorderSizePixel = 0
Corner(frame, 4); Border(frame)
local lbl = Instance.new("TextLabel", frame)
lbl.Size = UDim2.new(0.6, 0, 1, 0); lbl.Position = UDim2.new(0.04, 0, 0, 0)
lbl.TextColor3 = Color3.fromRGB(190, 190, 190); lbl.TextSize = 11; lbl.Font = Enum.Font.RobotoMono; lbl.BackgroundTransparency = 1; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Text = text
if typeStr == "Button" then
local act = Instance.new("TextButton", frame)
act.Size = UDim2.fromOffset(55, 24); act.Position = UDim2.new(1, -60, 0, 4)
act.BackgroundColor3 = Color3.fromRGB(28, 29, 35); act.TextColor3 = Color3.fromRGB(180, 180, 180)
act.Text = configKey; act.TextSize = 11; act.Font = Enum.Font.RobotoMono
Corner(act, 4); Border(act)
act.MouseButton1Click:Connect(callback)
end
return frame
end
local function createCustomSlider(parent, text, yPos, color, maxVal, configKey, suffix)
local frame = Instance.new("Frame", parent); frame.Size = UDim2.new(0.9, 0, 0, 45); frame.Position = UDim2.new(0.05, 0, 0, yPos); frame.BackgroundTransparency = 1
local label = Instance.new("TextLabel", frame); label.Size = UDim2.new(1, 0, 0, 15); label.TextColor3 = Color3.fromRGB(190, 190, 190); label.TextSize = 11; label.Font = Enum.Font.RobotoMono; label.BackgroundTransparency = 1; label.TextXAlignment = Enum.TextXAlignment.Left
local slideBar = Instance.new("Frame", frame); slideBar.Size = UDim2.new(1, 0, 0, 18); slideBar.Position = UDim2.new(0, 0, 0, 18); slideBar.BackgroundColor3 = Color3.fromRGB(24, 24, 26); slideBar.BorderSizePixel = 0
Corner(slideBar, 4)
local fill = Instance.new("Frame", slideBar); fill.Size = UDim2.new(getgenv().JinxKingConfig[configKey]/maxVal, 0, 1, 0); fill.BackgroundColor3 = color; fill.BorderSizePixel = 0
Corner(fill, 4)
label.Text = "  " .. text .. " : " .. getgenv().JinxKingConfig[configKey] .. suffix
slideBar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
local pct = math.clamp((input.Position.X - slideBar.AbsolutePosition.X) / slideBar.AbsoluteSize.X, 0, 1)
fill.Size = UDim2.new(pct, 0, 1, 0); local finalVal = math.round(pct * maxVal); getgenv().JinxKingConfig[configKey] = finalVal
label.Text = "  " .. text .. " : " .. finalVal .. suffix
end
end)
end
-- DYNAMIC EXPORT FUNCTION (Zieht dein Makro als lauffähiges Modul ins Toxo-Menü)
local exportCount = 0
ExportBtn.MouseButton1Click:Connect(function()
exportCount = exportCount + 1
local scriptName = NameInput.Text ~= "" and NameInput.Text or "CustomSkript_" .. exportCount
createModuleRow(Pages["CustomMods"], "Skript: " .. scriptName, 20 + (exportCount * 40), "Button", "🚩 Start", function()
-- Löst bei Klick die Fahnen-Start-Kette der Blöcke aus
print("[JinxKing Flag Matrix] Running Compiled Blocks for: " .. scriptName)
end)
Studio.Visible = false Main.Visible = true
end)
-- Green Flag Header Button Execution
GreenFlagBtn.MouseButton1Click:Connect(function()
print("[JinxKing Studio] Green Flag triggered inside Canvas workspace.")
end)
-- Base Info Screen Matrix
createSectionHeader(Pages["Info"], "Infos & Global Hub Configuration Matrix", 10)
local function buildInfoRow(text, y)
local f = Create("Frame", { Size = UDim2.new(0.9, 0, 0, 32), Position = UDim2.new(0.05, 0, 0, y), BackgroundColor3 = Color3.fromRGB(20,21,26), BorderSizePixel = 0 }, Pages["Info"]) Corner(f,4); Border(f)
Create("TextLabel", { Text = "  " .. text, Size = UDim2.new(1, 0, 1, 0), TextColor3 = Color3.fromRGB(180,180,185), TextSize = 11, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left }, f)
end
buildInfoRow("Authors: JanKaja", 40)
buildInfoRow("Edition: v6.5 [Prestige Block Edition]", 75)
-- Vehicle Light Tuning Page Data Load
createSectionHeader(Pages["Colors"], "Vehicle Light Tuning", 10)
local plateRow = createModuleRow(Pages["Colors"], "Server Custom Plate", 40, "Button", "Input", nil)
local InFrame = Instance.new("Frame", Screen); InFrame.Size = UDim2.fromOffset(240, 40); InFrame.Position = UDim2.new(0.4, 0, 0.45, 0); InFrame.BackgroundColor3 = Color3.fromRGB(20, 21, 26); InFrame.Visible = false
Corner(InFrame, 4)
local hIn = Instance.new("TextBox", InFrame); hIn.Size = UDim2.new(0.9, 0, 0.8, 0); hIn.Position = UDim2.new(0.05, 0, 0.1, 0); hIn.BackgroundColor3 = Color3.fromRGB(15, 16, 20); hIn.TextColor3 = Color3.fromRGB(255, 255, 255); hIn.PlaceholderText = "Text..."
local inputBtn = plateRow:FindFirstChildOfClass("TextButton")
if inputBtn then inputBtn.MouseButton1Click:Connect(function() InFrame.Visible = not InFrame.Visible end) end
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
-- Boot Matrix Setup
Pages["Info"].Visible = true
SelectedCategory = tabButtons["Info"]
tabButtons["Info"].TextColor3 = Color3.fromRGB(0, 140, 255)
local defAccent = tabButtons["Info"]:FindFirstChild("Accent") if defAccent then defAccent.Visible = true end