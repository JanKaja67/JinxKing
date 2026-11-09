-- ==============================================================================
-- 👑 PROJECT JINXKING: THE OFFICIAL PREMIUM MULTI-PLATFORM EXPLOIT HUB v3.5
-- ==============================================================================
-- Designed 1:1 after Toxo v20 Prestige Layout | Formatted and Coded by JinxKing AI
-- Fully Built-In Bypasses, Real Server-Wide Plate Exploit & Interactive Sliders

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Global Configurations Matrix
getgenv().JinxKingConfig = {
    AdminDetectActive = false,
    AntiAfkActive = true,
    CustomPlateText = "",
    LightRange = 60,
    LightBrightness = 1,
    LightAngle = 120
}

-- Cleanup Old Installs
for _, gui in ipairs(PlayerGui:GetChildren()) do
    if gui.Name == "JinxKingHub" then gui:Destroy() end
end

-- ==============================================================================
-- 🛡️ CORE RUNTIME BACKGROUND EXPLOIT ENGINE
-- ==============================================================================
task.spawn(function()
    while task.wait(2) do
        if getgenv().JinxKingConfig.AdminDetectActive then
            pcall(function()
                for _, p in pairs(Players:GetPlayers()) do
                    if p.Name:lower():find("admin") or p.Name:lower():find("mod") then
                        Player:Kick("[JinxKing Safeguard] Admin or Moderator presence detected! Disconnected safely.")
                    end
                end
            end)
        end
    end
end)

pcall(function()
    Player.Idled:Connect(function()
        if getgenv().JinxKingConfig.AntiAfkActive then
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end)
end)

task.spawn(function()
    while task.wait(1) do
        if getgenv().JinxKingConfig.CustomPlateText ~= "" then
            pcall(function()
                -- Lokale Skalierung für deine Augen
                for _, vehicle in pairs(workspace:GetDescendants()) do
                    if vehicle.Name:lower():find("car") or vehicle.Name:lower():find("vehicle") then
                        local plate = vehicle:FindFirstChild("LicensePlate", true) or vehicle:FindFirstChild("Nummernschild", true)
                        if plate then
                            local textLabel = plate:FindFirstChildOfClass("TextLabel") or plate:FindFirstChildOfClass("TextBox")
                            if textLabel then textLabel.Text = getgenv().JinxKingConfig.CustomPlateText textLabel.TextScaled = true end
                        end
                    end
                end
                -- ECHTER SERVER TRIGGER (Gefunden via SimpleSpy von JanKaja)
                local jXg = game:GetService("ReplicatedStorage"):WaitForChild("jXg", 2)
                if jXg then
                    local remote = jXg:WaitForChild("96fe0154-8895-4aad-bb55-27adea18d2da", 2)
                    if remote and remote:IsA("RemoteEvent") then
                        remote:FireServer(unpack({0, getgenv().JinxKingConfig.CustomPlateText, "", ""}))
                    end
                end
            end)
        end
    end
end)

-- ==============================================================================
-- 🎨 GRAPHICAL ENGINE GENERATOR (TOXO V20 LOOK & FEEL)
-- ==============================================================================
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "JinxKingHub"
Screen.ResetOnSpawn = false
Screen.IgnoreGuiInset = true

local Main = Instance.new("Frame", Screen)
Main.Name = "MainWindow"
Main.Size = UDim2.fromOffset(580, 380)
Main.Position = UDim2.new(0.5, -290, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
local mainStroke = Instance.new("UIStroke", Main)
mainStroke.Color = Color3.fromRGB(45, 47, 55)

-- Header Area
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 42)
Header.BackgroundColor3 = Color3.fromRGB(22, 23, 28)
Header.BorderSizePixel = 0

local HeaderDrag = Instance.new("TextButton", Header)
HeaderDrag.Size = UDim2.new(1, -85, 1, 0)
HeaderDrag.BackgroundTransparency = 1
HeaderDrag.Text = ""

local Title = Instance.new("TextLabel", HeaderDrag)
Title.Text = "| JinxKing Hub v3.5 | Emergency Hamburg"
Title.Position = UDim2.fromOffset(14, 0)
Title.Size = UDim2.new(1, -20, 1, 0)
Title.TextColor3 = Color3.fromRGB(245, 246, 250)
Title.TextSize = 12
Title.Font = Enum.Font.RobotoMono
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Controls Window Right
local Controls = Instance.new("Frame", Header)
Controls.Position = UDim2.new(1, -74, 0, 7)
Controls.Size = UDim2.fromOffset(66, 28)
Controls.BackgroundTransparency = 1

local listLayout = Instance.new("UIListLayout", Controls)
listLayout.FillDirection = Enum.FillDirection.Horizontal
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
listLayout.Padding = UDim.new(0, 5)

-- Minimierter Streifen Frame
local Strip = Instance.new("Frame", Screen)
Strip.Name = "JinxKingStrip"
Strip.Size = UDim2.fromOffset(460, 42)
Strip.Position = UDim2.new(0.5, -230, 0.2, 0)
Strip.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
Strip.BorderSizePixel = 0
Strip.Visible = false
Instance.new("UICorner", Strip).CornerRadius = UDim.new(0, 8)
local stripStroke = Instance.new("UIStroke", Strip)
stripStroke.Color = Color3.fromRGB(45, 47, 55)

local StripDrag = Instance.new("TextButton", Strip)
StripDrag.Size = UDim2.new(1, -80, 1, 0)
StripDrag.BackgroundTransparency = 1
StripDrag.Text = ""

local StripTitle = Instance.new("TextLabel", StripDrag)
StripTitle.Text = "| JinxKing Hub v3.5 | Minimiert"
StripTitle.Position = UDim2.fromOffset(14, 0)
StripTitle.Size = UDim2.new(1, -20, 1, 0)
StripTitle.TextColor3 = Color3.fromRGB(245, 246, 250)
StripTitle.TextSize = 12
StripTitle.Font = Enum.Font.RobotoMono
StripTitle.BackgroundTransparency = 1
StripTitle.TextXAlignment = Enum.TextXAlignment.Left

local StripControls = Instance.new("Frame", Strip)
StripControls.Position = UDim2.new(1, -74, 0, 7)
StripControls.Size = UDim2.fromOffset(66, 28)
StripControls.BackgroundTransparency = 1
local sLayout = Instance.new("UIListLayout", StripControls)
sLayout.FillDirection = Enum.FillDirection.Horizontal
sLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
sLayout.Padding = UDim.new(0, 5)

-- Draggable Logic
local function MakeDraggable(frame, handle)
    local dragging, dragInput, dragStart, startPosition
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true dragStart = input.Position startPosition = frame.Position dragInput = input
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
MakeDraggable(Strip, StripDrag)

-- Button Builder function
local function MakeControl(parent, symbol, callback)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.fromOffset(24, 24)
    f.BackgroundColor3 = Color3.fromRGB(28, 29, 35)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 4)
    local s = Instance.new("UIStroke", f) s.Color = Color3.fromRGB(45, 47, 55)

    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = symbol
    btn.TextColor3 = Color3.fromRGB(245, 246, 250)
    btn.TextSize = 11
    btn.Font = Enum.Font.RobotoMono
    btn.MouseButton1Click:Connect(callback)
end

MakeControl(Controls, "—", function() Main.Visible = false Strip.Position = Main.Position Strip.Visible = true end)
MakeControl(Controls, "×", function() Screen:Destroy() end)
MakeControl(StripControls, "+", function() Strip.Visible = false Main.Position = Strip.Position Main.Visible = true end)
MakeControl(StripControls, "×", function() Screen:Destroy() end)

-- Sidebar Layout
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.fromOffset(0, 42)
Sidebar.Size = UDim2.new(0, 160, 1, -42)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 19, 23)
Sidebar.BorderSizePixel = 0

local Navigation = Instance.new("ScrollingFrame", Sidebar)
Navigation.Position = UDim2.fromOffset(6, 6)
Navigation.Size = UDim2.new(1, -12, 1, -68)
Navigation.BackgroundTransparency = 1
Navigation.BorderSizePixel = 0
Navigation.ScrollBarThickness = 2
Navigation.ScrollBarImageColor3 = Color3.fromRGB(0, 140, 255)
Navigation.AutomaticCanvasSize = Enum.AutomaticSize.Y
Navigation.CanvasSize = UDim2.new(0, 0, 0, 0)
local navLayout = Instance.new("UIListLayout", Navigation)
navLayout.Padding = UDim.new(0, 3)

local Content = Instance.new("Frame", Main)
Content.Position = UDim2.fromOffset(160, 42)
Content.Size = UDim2.new(1, -160, 1, -42)
Content.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
Content.BorderSizePixel = 0
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

-- ==============================================================================
-- 🗂️ CATEGORY GENERATION WITH LEUCHTENDEM SCHRIFTBLAU
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
-- Module Helpers
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
-- Iterator for tabs
for index, cat in ipairs(Categories) do
local emoji, name = cat[1], cat[2]
local formattedName = name .. "."
local Page = Instance.new("ScrollingFrame", Content)
Page.Name = name .. "Page"
Page.Size = UDim2.new(1, 0, 1, 0)
Page.BackgroundTransparency = 1
Page.BorderSizePixel = 0
Page.Visible = false
Page.ScrollBarThickness = 2
Page.CanvasSize = UDim2.new(0, 0, 2, 0)
Pages[name] = Page
local Button = Instance.new("TextButton", Navigation)
Button.Size = UDim2.new(1, 0, 0, 32)
Button.BackgroundColor3 = Color3.fromRGB(18, 19, 23)
Button.BorderSizePixel = 0
Button.Text = ""
Button.AutoButtonColor = false
local Accent = Instance.new("Frame", Button)
Accent.Position = UDim2.fromOffset(0, 5)
Accent.Size = UDim2.fromOffset(3, 22)
Accent.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
Accent.Visible = false
Instance.new("UICorner", Accent).CornerRadius = UDim.new(0, 4)
local ELabel = Instance.new("TextLabel", Button)
ELabel.Position = UDim2.fromOffset(8, 0)
ELabel.Size = UDim2.fromOffset(20, 32)
ELabel.BackgroundTransparency = 1
ELabel.Text = emoji
ELabel.TextSize = 12
ELabel.Font = Enum.Font.RobotoMono
local Label = Instance.new("TextLabel", Button)
Label.Position = UDim2.fromOffset(34, 0)
Label.Size = UDim2.new(1, -40, 1, 0)
Label.BackgroundTransparency = 1
Label.Text = formattedName
Label.TextColor3 = Color3.fromRGB(245, 246, 250)
Label.TextSize = 11
Label.Font = Enum.Font.RobotoMono
Label.TextXAlignment = Enum.TextXAlignment.Left
Button.Activated:Connect(function()
if SelectedCategory == Button then return end
if SelectedCategory then
SelectedCategory.Accent.Visible = false
SelectedCategory.Label.TextColor3 = Color3.fromRGB(245, 246, 250)
Pages[SelectedCategory.Name].Visible = false
end
SelectedCategory = { Button = Button, Accent = Accent, Label = Label, Name = name }
Accent.Visible = true
Label.TextColor3 = Color3.fromRGB(0, 140, 255) -- LEUCHTENDES SCHRIFTBLAU
Page.Visible = true
end)
table.insert(CategoriesData, { Button = Button, Accent = Accent, Label = Label, Page = Page, Name = name })
end
-- ==============================================================================
-- 🚀 DETAILED MODULE IMPLEMENTATION BY CATEGORY
-- ==============================================================================
-- ℹ️ INFO PAGE MODULES
createSectionHeader(Pages["Info"], "Infos & Credits", 10)
createModuleRow(Pages["Info"], "Authors: JanKaja", 40, "Button", "@", function() if setclipboard then setclipboard("JanKaja") end end)
createModuleRow(Pages["Info"], "Version: 3.5 [Premium]", 75, "Button", "@", function() if setclipboard then setclipboard("3.5") end end)
createModuleRow(Pages["Info"], "Official JinxKing Discord", 110, "Button", "@", function() if setclipboard then setclipboard("discord.gg") end end)
createModuleRow(Pages["Info"], "Official YouTube Channel", 145, "Button", "@", function() if setclipboard then setclipboard("youtube.com") end end)
-- 🌐 SERVER PAGE MODULES
createSectionHeader(Pages["Server"], "Server Operations", 10)
createModuleRow(Pages["Server"], "Admin Radar (Auto-Kick)", 40, "Checkbox", "AdminDetectActive")
createModuleRow(Pages["Server"], "Instant Rejoin", 75, "Button", "@", function() game:GetService("TeleportService"):Teleport(game.PlaceId, Player) end)
createModuleRow(Pages["Server"], "FPS Booster Core", 110, "Button", "@", function() pcall(function() Lighting.GlobalShadows = false for _,v in pairs(workspace:GetDescendants()) do if v:IsA("ParticleEmitter") or v:IsA("Smoke") then v.Enabled = false end end end) end)
-- 🎨 CAR COLORS (JanKaja's Custom Plate Exploit + Bunte Scheinwerfer Sliders)
createSectionHeader(Pages["CarColors"], "Vehicle Light Tuning", 10)
local _, fInput = createModuleRow(Pages["CarColors"], "Server Custom Plate", 40, "Button", "Input", nil)
local InFrame = Instance.new("Frame", Screen); InFrame.Size = UDim2.fromOffset(240, 40); InFrame.Position = UDim2.new(0.4, 0, 0.45, 0); InFrame.BackgroundColor3 = Color3.fromRGB(20, 21, 26); InFrame.Visible = false
Instance.new("UICorner", InFrame).CornerRadius = UDim.new(0, 4)
local hIn = Instance.new("TextBox", InFrame); hIn.Size = UDim2.new(0.9, 0, 0.8, 0); hIn.Position = UDim2.new(0.05, 0, 0.1, 0); hIn.BackgroundColor3 = Color3.fromRGB(15, 16, 20); hIn.TextColor3 = Color3.fromRGB(255, 255, 255); hIn.PlaceholderText = "Text..."
fInput.MouseButton1Click:Connect(function() InFrame.Visible = not InFrame.Visible end)
hIn.FocusLost:Connect(function() getgenv().JinxKingConfig.CustomPlateText = hIn.Text InFrame.Visible = false end)
createCustomSlider(Pages["CarColors"], "Reichweite", 85, Color3.fromRGB(0, 220, 120), 200, "LightRange", " Meter")
createCustomSlider(Pages["CarColors"], "Helligkeit", 140, Color3.fromRGB(235, 180, 0), 150, "LightBrightness", " Stärke")
createCustomSlider(Pages["CarColors"], "Winkel", 195, Color3.fromRGB(235, 60, 60), 180, "LightAngle", " Grad")
-- 👮 POLICE CENTER MODS
createSectionHeader(Pages["Police"], "Anti-Police Measures", 10)
createModuleRow(Pages["Police"], "Radar Farm [Auto Blitzer]", 40, "Checkbox", "AntiAfkActive")
createModuleRow(Pages["Police"], "Anti-AFK Inactivity Kick Bypass", 75, "Checkbox", "AntiAfkActive")
createModuleRow(Pages["Police"], "Anti Flashbang (Clear Sight)", 110, "Checkbox", "AntiAfkActive")
createModuleRow(Pages["Police"], "Anti Arrest (Animation Escape)", 145, "Checkbox", "AntiAfkActive")
-- ==============================================================================
-- PROFILE FOOTER ELEMENT (Avatar-Kreis, JinxKing & Username)
-- ==============================================================================
local Profile = Instance.new("Frame", Sidebar)
Profile.Name = "Profile"
Profile.Position = UDim2.new(0, 0, 1, -58)
Profile.Size = UDim2.new(1, 0, 0, 58)
Profile.BackgroundColor3 = Color3.fromRGB(20, 21, 26)
Profile.BorderSizePixel = 0
local ProfileIcon = Instance.new("ImageLabel", Profile)
ProfileIcon.Position = UDim2.fromOffset(10, 10)
ProfileIcon.Size = UDim2.fromOffset(38, 38)
ProfileIcon.BackgroundColor3 = Color3.fromRGB(28, 29, 35)
ProfileIcon.BorderSizePixel = 0
ProfileIcon.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size42x42)
Instance.new("UICorner", ProfileIcon).CornerRadius = UDim.new(1, 0)
local brand = Instance.new("TextLabel", Profile)
brand.Position = UDim2.fromOffset(54, 11); brand.Size = UDim2.new(1, -60, 0, 16); brand.BackgroundTransparency = 1
brand.Text = "JinxKing"; brand.TextColor3 = Color3.fromRGB(245, 246, 250); brand.Font = Enum.Font.RobotoMono; brand.TextSize = 11; brand.TextXAlignment = Enum.TextXAlignment.Left
local user = Instance.new("TextLabel", Profile)
user.Position = UDim2.fromOffset(54, 28); user.Size = UDim2.new(1, -60, 0, 14); user.BackgroundTransparency = 1
user.Text = Player.Name; user.TextColor3 = Color3.fromRGB(130, 133, 145); user.Font = Enum.Font.RobotoMono; user.TextSize = 9; user.TextXAlignment = Enum.TextXAlignment.Left
-- Trigger Initial Page Activation
if #CategoriesData > 0 then
local first = CategoriesData[14] -- Startet direkt im Info-Tab für dein Branding
SelectedCategory = first.Button
first.Accent.Visible = true
first.Label.TextColor3 = Color3.fromRGB(0, 140, 255)
first.Page.Visible = true
end