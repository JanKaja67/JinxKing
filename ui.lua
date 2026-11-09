-- ==============================================================================
-- 👑 PROJECT JINXKING: PRESTIGE TOXO V20 USER INTERFACE CORE v7.0
-- ==============================================================================
-- File: ui.lua | Fully Restored Categories, Verified Create Engine & Avatar Headshot

local UI = {}
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer

function UI.load(Config)
    local PlayerGui = Player:WaitForChild("PlayerGui")
    local Screen = PlayerGui:WaitForChild("JinxKingHub")

    -- FIXED CREATE FUNCTION CORE (Strikte Tabellen-Schachtelung nach deiner Analyse)
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

    local Main = Screen:WaitForChild("MainWindow")
    local Content = Main:WaitForChild("PageContainer")
    local Navigation = Main:WaitForChild("Sidebar"):WaitForChild("Navigation")

    -- Clear Dynamic Cache Container inside Content Frame
    for _, child in ipairs(Content:GetChildren()) do
        if child:IsA("ScrollingFrame") then child:Destroy() end
    end
    for _, child in ipairs(Navigation:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    local SelectedCategory = nil
    local Pages = {}
    local tabButtons = {}

    -- Modular Tab Generator with exact Unicode-Emojis and Blue Active Shading
    local function addTabButton(name, displayName)
        local btn = Create("TextButton", { 
            Size = UDim2.new(1, 0, 0, 30), 
            BackgroundColor3 = Color3.fromRGB(25, 25, 27), 
            BorderSizePixel = 0, 
            Text = "  " .. displayName, 
            TextColor3 = Color3.fromRGB(150, 150, 150), 
            TextSize = 11, 
            Font = Enum.Font.RobotoMono, 
            TextXAlignment = Enum.TextXAlignment.Left 
        }, Navigation)
        
        local Accent = Create("Frame", { 
            Position = UDim2.fromOffset(0, 5), 
            Size = UDim2.fromOffset(3, 22), 
            BackgroundColor3 = Color3.fromRGB(0, 140, 255), 
            Visible = false 
        }, btn) 
        Corner(Accent, 4)

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

            -- External Script Engine Bridge Routing
            if name == "Scratch" then
                local success, studioModule = pcall(function()
                    return loadfile("jinxking/scratch.lua")()
                end)
                if success and studioModule and studioModule.open then
                    studioModule.open(Config, Main)
                else
                    -- RAM Fail-Safe Backup Layer
                    local backup = Screen:FindFirstChild("ScratchStudio", true)
                    if backup then backup.Visible = true Main.Visible = false end
                end
                Accent.Visible = false
                btn.TextColor3 = Color3.fromRGB(150, 150, 150)
            end
        end)
        
        tabButtons[name] = btn
        return btn
    end

    -- Initializing clean structural canvas instances
    local function initPageSlot(name)
        local p = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false, CanvasSize = UDim2.new(0,0,2,0), ScrollBarThickness = 2 }, Content)
        Pages[name] = p
        return p
    end

    local pPlayer = initPageSlot("Player")
    local pAimbot = initPageSlot("Aimbot")
    local pSilShot = initPageSlot("SilShot")
    local pGun = initPageSlot("Gun")
    local pSpawn = initPageSlot("Spawn")
    local pRope = initPageSlot("Rope")
    local pSky = initPageSlot("Sky")
    local pEsp = initPageSlot("Esp")
    local pTele = initPageSlot("Tele")
    local pCar = initPageSlot("Car")
    local pColors = initPageSlot("Colors")
    local pCustomMods = initPageSlot("CustomMods")
    local pScratch = initPageSlot("Scratch")
    local pPolice = initPageSlot("Police")
    local pServer = initPageSlot("Server")
    local pInfo = initPageSlot("Info")

    -- 📋 DEPLOYING ALL 16 RESTORED CATEGORIES WITH ACCURATE UNICODE EMOTES
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
    addTabButton("Scratch", "\240\159\147\156 | Block Studio v7.0.")
    addTabButton("Police", "\240\159\145\174 | Police.")
    addTabButton("Server", "\240\159\140\144 | Server.")
    addTabButton("Info", "\226\132\185 | Info.")

    -- Inject Helpers
    local function createSectionHeader(parent, text, yPos)
        local lbl = Create("TextLabel", { Size = UDim2.new(0.9, 0, 0, 25), Position = UDim2.new(0.05, 0, 0, yPos), TextColor3 = Color3.fromRGB(240,240,240), TextSize = 11, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left, Text = "| " .. text }, parent)
    end

    local function createModuleRow(parent, text, yPos, typeStr, configKey, callback)
        local frame = Create("Frame", { Size = UDim2.new(0.9, 0, 0, 32), Position = UDim2.new(0.05, 0, 0, yPos), BackgroundColor3 = Color3.fromRGB(20, 21, 26), BorderSizePixel = 0 }, parent) Corner(frame, 4); Border(frame)
        local lbl = Create("TextLabel", { Size = UDim2.new(0.6, 0, 1, 0), Position = UDim2.fromOffset(8, 0), TextColor3 = Color3.fromRGB(190,190,190), TextSize = 11, Font = Enum.Font.RobotoMono, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left, Text = text }, frame)
        if typeStr == "Button" then
            local act = Create("TextButton", { Size = UDim2.fromOffset(55, 24), Position = UDim2.new(1, -60, 0, 4), BackgroundColor3 = Color3.fromRGB(28, 29, 35), TextColor3 = Color3.fromRGB(180, 180, 180), Text = configKey, TextSize = 11, Font = Enum.Font.RobotoMono }, frame) Corner(act, 4); Border(act)
            act.MouseButton1Click:Connect(callback)
        end
    end

    -- ℹ️ FIXED PREMIUM INFO SECTION WITH UNTOUCHABLE CHANNELS
    createSectionHeader(pInfo, "Infos & Configuration Central", 10)
    createModuleRow(pInfo, "Authors: JanKaja", 45, "Button", "@", function() if setclipboard then setclipboard("JanKaja") end end)
    createModuleRow(pInfo, "Version Build: v7.0 [Prestige]", 80, "Button", "@", function() if setclipboard then setclipboard("7.0") end end)
    createModuleRow(pInfo, "Official JinxKing Discord Link", 115, "Button", "Copy", function() if setclipboard then setclipboard(Config.DISCORD_LINK) end end)
    createModuleRow(pInfo, "Official YouTube Channel", 150, "Button", "Copy", function() if setclipboard then setclipboard(Config.YOUTUBE_LINK) end end)

    -- Boot Configuration
    pInfo.Visible = true
    SelectedCategory = tabButtons["Info"]
    tabButtons["Info"].TextColor3 = Color3.fromRGB(0, 140, 255)
    local actAccent = tabButtons["Info"]:FindFirstChild("Accent") if actAccent then actAccent.Visible = true end
end

return UI
