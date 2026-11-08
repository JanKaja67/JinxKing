-- ==============================================================================
-- 👑 PROJECT JINXKING: THE OFFICIAL PREMIUM MULTI-PLATFORM EXPLOIT HUB v3.5
-- ==============================================================================
-- 1:1 CLONED TOXO V20 PRESTIGE DESIGN MATRIX | RESPONSIVE MODERN UI CORE
-- Compiled, Patched and Optimized via JanKaja's Component Fragments

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ==============================================================================
-- CONFIGURATION & THEME PALETTE
-- ==============================================================================
local Config = {
    Title = "JinxKing",
    Game = "Emergency Hamburg",
    Edition = "v3.5",
    Window = Vector2.new(580, 380),
    Strip = Vector2.new(460, 42),
    Colors = {
        Background = Color3.fromRGB(15, 16, 20),
        Surface = Color3.fromRGB(20, 21, 26),
        Header = Color3.fromRGB(22, 23, 28),
        Sidebar = Color3.fromRGB(18, 19, 23),
        Button = Color3.fromRGB(28, 29, 35),
        Hover = Color3.fromRGB(38, 40, 48),
        Active = Color3.fromRGB(32, 34, 44),
        Border = Color3.fromRGB(45, 47, 55),
        Accent = Color3.fromRGB(0, 140, 255),        -- Perfektes Toxo-Schriftblau
        TextInactive = Color3.fromRGB(245, 246, 250),  -- Weiß für inaktive Tabs
        Secondary = Color3.fromRGB(130, 133, 145),
        Separator = Color3.fromRGB(55, 58, 68),
    }
}

-- Garbage Cleanup
for _, gui in ipairs(PlayerGui:GetChildren()) do
    if gui.Name == "JinxKingHub" then gui:Destroy() end
end

-- ==============================================================================
-- UTILITIES & ENGINE METHOD DEFINITIONS
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

local function Border(parent, transparency)
    Create("UIStroke", { Color = Config.Colors.Border, Thickness = 1, Transparency = transparency or 0 }, parent)
end

local function Tween(object, duration, properties)
    local animation = TweenService:Create(object, TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), properties)
    animation:Play()
    return animation
end

-- ==============================================================================
-- SCREEN ENCAPSULATION & iPad RESPONSIVE SCALING
-- ==============================================================================
local Screen = Create("ScreenGui", {
    Name = "JinxKingHub",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999999
}, PlayerGui)

local Scale = Create("UIScale", { Scale = 1 }, Screen)

local function UpdateScale()
    local camera = workspace.CurrentCamera
    if not camera then return end
    local viewport = camera.ViewportSize
    local scaleX = viewport.X / 850
    local scaleY = viewport.Y / 570
    Scale.Scale = math.clamp(math.min(scaleX, scaleY), 0.55, 1)
end
UpdateScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)

-- ==============================================================================
-- INTERFACE FRAMEWORK GENERATION
-- ==============================================================================
local Main = Create("Frame", {
    Name = "MainWindow",
    Size = UDim2.fromOffset(Config.Window.X, Config.Window.Y),
    Position = UDim2.new(0.5, -Config.Window.X / 2, 0.5, -Config.Window.Y / 2),
    BackgroundColor3 = Config.Colors.Background,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Visible = true,
    ZIndex = 1
}, Screen)
Corner(Main, 10)
Border(Main)

local Header = Create("Frame", {
    Name = "Header",
    Size = UDim2.new(1, 0, 0, 42),
    BackgroundColor3 = Config.Colors.Header,
    BorderSizePixel = 0,
    ZIndex = 2
}, Main)

local HeaderDrag = Create("TextButton", {
    Name = "DragArea",
    Size = UDim2.new(1, -85, 1, 0),
    BackgroundTransparency = 1,
    Text = "",
    AutoButtonColor = false,
    ZIndex = 2
}, Header)

Create("TextLabel", {
    Name = "Title",
    Position = UDim2.fromOffset(14, 0),
    Size = UDim2.new(1, -20, 1, 0),
    BackgroundTransparency = 1,
    Text = "| " .. Config.Title .. " " .. Config.Edition .. " | " .. Config.Game,
    TextColor3 = Config.Colors.TextInactive,
    TextSize = 11,
    Font = Enum.Font.RobotoMono,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 2
}, HeaderDrag)

local Controls = Create("Frame", {
    Position = UDim2.new(1, -74, 0, 7),
    Size = UDim2.fromOffset(66, 28),
    BackgroundTransparency = 1,
    ZIndex = 10
}, Header)

Create("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Right,
    Padding = UDim.new(0, 5)
}, Controls)

local function MakeControl(parent, symbol)
    local button = Create("TextButton", {
        Size = UDim2.fromOffset(28, 28),
        BackgroundColor3 = Config.Colors.Button,
        BorderSizePixel = 0,
        Text = symbol,
        TextColor3 = Config.Colors.TextInactive,
        TextSize = 12,
        Font = Enum.Font.RobotoMono,
        AutoButtonColor = false,
        ZIndex = 10
    }, parent)
    Corner(button, 6)
    Border(button)

    button.MouseEnter:Connect(function() Tween(button, 0.12, { BackgroundColor3 = Config.Colors.Hover }) end)
    button.MouseLeave:Connect(function() Tween(button, 0.12, { BackgroundColor3 = Config.Colors.Button }) end)
    return button
end

local MinimizeButton = MakeControl(Controls, "—")
local CloseButton = MakeControl(Controls, "×")

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
        if input == dragInput or input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false dragInput = nil end
    end)
end
MakeDraggable(Main, HeaderDrag)

-- ==============================================================================
-- NAVIGATION SIDEBAR & CONTENT MATRIX
-- ==============================================================================
local Sidebar = Create("Frame", {
    Name = "Sidebar",
    Position = UDim2.fromOffset(0, 42),
    Size = UDim2.new(0, 160, 1, -42),
    BackgroundColor3 = Config.Colors.Sidebar,
    BorderSizePixel = 0,
    ZIndex = 2
}, Main)

local Navigation = Create("ScrollingFrame", {
    Name = "Navigation",
    Position = UDim2.fromOffset(6, 6),
    Size = UDim2.new(1, -12, 1, -68),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 2,
    ScrollBarImageColor3 = Config.Colors.Accent,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    ScrollingDirection = Enum.ScrollingDirection.Y,
    ZIndex = 3
}, Sidebar)

Create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, Navigation)

local Content = Create("Frame", {
    Name = "PageContainer",
    Position = UDim2.fromOffset(160, 42),
    Size = UDim2.new(1, -160, 1, -42),
    BackgroundColor3 = Color3.fromRGB(12, 12, 14), -- Tiefschwarzer neuer Raum
    BorderSizePixel = 0,
    ZIndex = 2
}, Main)
Corner(Content, 6)

-- ==============================================================================
-- DYNAMIC MODULAR RECTANGLE CATEGORY ITERATOR
-- ==============================================================================
local SelectedCategory = nil
local Pages = {}
local CategoriesData = {}

local Categories = {
    {"\226\154\153", "Player"}, {"\240\159\148\180", "Aimbot"}, {"\240\159\142\175", "Sil Shot"},
    {"\240\159\148\171", "Gun Mods"}, {"\240\159\145\145", "VS Spawner"}, {"\240\159\170\162", "Auto Rope"},
    {"\240\159\140\140", "Sky"}, {"\240\159\145\129", "ESP"}, {"\240\159\143\156", "Teleport"},
    {"\240\159\154\151", "Car"}, {"\240\159\142\168", "Car Colors"}, {"\240\159\145\174", "Police"},
    {"\240\159\140\144", "Server"}, {"\226\132\185", "Info"}
}

for index, cat in ipairs(Categories) do
    local emoji, name = cat[1], cat[2]
    local formattedName = name .. "."

    local Page = Create("ScrollingFrame", {
        Name = name .. "Page",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = false,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Config.Colors.Accent,
        ZIndex = 3
    }, Content)
    Corner(Page, 8)
    Pages[name] = Page

    local Button = Create("TextButton", {
        Name = name,
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = Config.Colors.Sidebar,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = index,
        ZIndex = 4
    }, Navigation)
    Corner(Button, 6)

local Accent = Create("Frame", {
Name = "Accent",
Position = UDim2.fromOffset(0, 5),
Size = UDim2.fromOffset(3, 22),
BackgroundColor3 = Config.Colors.Accent,
BorderSizePixel = 0,
Visible = false,
ZIndex = 5
}, Button)
Corner(Accent, 4)
local EmojiLabel = Create("TextLabel", {
Position = UDim2.fromOffset(8, 0),
Size = UDim2.fromOffset(20, 32),
BackgroundTransparency = 1,
Text = emoji,
TextSize = 12,
Font = Enum.Font.RobotoMono,
ZIndex = 5
}, Button)
Create("Frame", {
Position = UDim2.fromOffset(30, 10),
Size = UDim2.fromOffset(1, 12),
BackgroundColor3 = Config.Colors.Separator,
BorderSizePixel = 0,
ZIndex = 5
}, Button)
local Label = Create("TextLabel", {
Position = UDim2.fromOffset(38, 0),
Size = UDim2.new(1, -40, 1, 0),
BackgroundTransparency = 1,
Text = formattedName,
TextColor3 = Config.Colors.TextInactive,
TextSize = 11,
Font = Enum.Font.RobotoMono,
TextXAlignment = Enum.TextXAlignment.Left,
ZIndex = 5
}, Button)
Button.MouseEnter:Connect(function() if SelectedCategory ~= Button then Tween(Button, 0.15, { BackgroundColor3 = Config.Colors.Hover }) end end)
Button.MouseLeave:Connect(function() if SelectedCategory ~= Button then Tween(Button, 0.15, { BackgroundColor3 = Config.Colors.Sidebar }) end end)
Button.Activated:Connect(function()
if SelectedCategory == Button then return end
-- Klick-Flash-Effekt für haptisches Feedback
Tween(Button, 0.1, { BackgroundColor3 = Config.Colors.Hover })
if SelectedCategory then
Tween(SelectedCategory, 0.15, { BackgroundColor3 = Config.Colors.Sidebar })
SelectedCategory.Accent.Visible = false
SelectedCategory.Label.TextColor3 = Config.Colors.TextInactive
if Pages[SelectedCategory.Name] then Pages[SelectedCategory.Name].Visible = false end
end
SelectedCategory = Button
Tween(Button, 0.15, { BackgroundColor3 = Config.Colors.Active })
Accent.Visible = true
Label.TextColor3 = Config.Colors.Accent -- BLITZSCHARFES SCHRIFTBLAU!
Page.Visible = true
-- Sanfte Inhalts-Einblendung
Content.BackgroundTransparency = 0.5
Tween(Content, 0.15, { BackgroundTransparency = 0 })
end)
table.insert(CategoriesData, { Button = Button, Accent = Accent, Label = Label, Page = Page, Name = name })
end
-- Erste Kategorie initial zünden
if #CategoriesData > 0 then
local first = CategoriesData[1]
SelectedCategory = first.Button
first.Button.BackgroundColor3 = Config.Colors.Active
first.Accent.Visible = true
first.Label.TextColor3 = Config.Colors.Accent
first.Page.Visible = true
end
-- ==============================================================================
-- PROFILE FOOTER LOGIC (1:1 CLONED PRESTIGE ELEMENT)
-- ==============================================================================
local Profile = Create("Frame", {
Name = "Profile",
Position = UDim2.new(0, 0, 1, -58),
Size = UDim2.new(1, 0, 0, 58),
BackgroundColor3 = Config.Colors.Surface,
BorderSizePixel = 0,
ZIndex = 6
}, Sidebar)
local ProfileIcon = Create("ImageLabel", {
Position = UDim2.fromOffset(10, 10),
Size = UDim2.fromOffset(38, 38),
BackgroundColor3 = Config.Colors.Button,
BorderSizePixel = 0,
Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size42x42),
ZIndex = 7
}, Profile)
Corner(ProfileIcon, 50)
Border(ProfileIcon)
Create("TextLabel", {
Position = UDim2.fromOffset(54, 11),
Size = UDim2.new(1, -60, 0, 16),
BackgroundTransparency = 1,
Text = "JinxKing",
TextColor3 = Config.Colors.TextInactive,
Font = Enum.Font.RobotoMono,
TextSize = 11,
TextXAlignment = Enum.TextXAlignment.Left,
ZIndex = 7
}, Profile)
Create("TextLabel", {
Position = UDim2.fromOffset(54, 28),
Size = UDim2.new(1, -60, 0, 14),
BackgroundTransparency = 1,
Text = Player.Name,
TextColor3 = Config.Colors.Secondary,
Font = Enum.Font.RobotoMono,
TextSize = 9,
TextXAlignment = Enum.TextXAlignment.Left,
ZIndex = 7
}, Profile)
-- ==============================================================================
-- THE MINIMIZED JINXKING STRIP ENGINE
-- ==============================================================================
local Strip = Create("Frame", {
Name = "JinxKingStrip",
AnchorPoint = Vector2.new(0.5, 0.5),
Size = UDim2.fromOffset(Config.Strip.X, Config.Strip.Y),
Position = UDim2.new(0.5, 0, 0.38, 0),
BackgroundColor3 = Config.Colors.Background,
BorderSizePixel = 0,
Visible = false,
ZIndex = 100
}, Screen)
Corner(Strip, 8)
Border(Strip)
local StripDrag = Create("TextButton", {
Name = "StripDrag",
Size = UDim2.new(1, -80, 1, 0),
BackgroundTransparency = 1,
Text = "",
AutoButtonColor = false,
ZIndex = 101
}, Strip)
Create("TextLabel", {
Position = UDim2.fromOffset(14, 0),
Size = UDim2.new(1, -20, 1, 0),
BackgroundTransparency = 1,
Text = "| " .. Config.Title .. " Hub | " .. Config.Edition .. " | " .. Config.Game,
TextColor3 = Config.Colors.TextInactive,
Font = Enum.Font.RobotoMono,
TextSize = 11,
TextXAlignment = Enum.TextXAlignment.Left,
ZIndex = 101
}, StripDrag)
MakeDraggable(Strip, StripDrag)
local StripControls = Create("Frame", {
Position = UDim2.new(1, -74, 0, 7),
Size = UDim2.fromOffset(66, 28),
BackgroundTransparency = 1,
ZIndex = 105
}, Strip)
Create("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, Padding = UDim.new(0, 5) }, StripControls)
local RestoreButton = MakeControl(StripControls, "+")
local StripCloseButton = MakeControl(StripControls, "×")
-- Window State Controller Logic
local IsMinimized = false
local function Minimize()
if IsMinimized then return end
IsMinimized = true
Strip.Position = Main.Position
Strip.Visible = true
Main.Visible = false
end
local function Restore()
if not IsMinimized then return end
IsMinimized = false
Main.Position = Strip.Position
Main.Visible = true
Strip.Visible = false
end
local function Close() Screen:Destroy() end
MinimizeButton.MouseButton1Click:Connect(Minimize)
RestoreButton.MouseButton1Click:Connect(Restore)
CloseButton.MouseButton1Click:Connect(Close)
StripCloseButton.MouseButton1Click:Connect(Close)
return UI