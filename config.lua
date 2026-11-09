-- ==============================================================================
-- 👑 PROJECT JINXKING: CONFIGURATION CORE GENERATOR v7.0
-- ==============================================================================
-- File: config.lua | The Global Brain, Social Database & Live Variable Memory

local Config = {}

-- ⚙️ YOUR FIXED PREMIUM SECURITY CREDENTIALS
Config.KEY_FILE = "jinxking_key.txt"
Config.CORRECT_KEY = "JanKaja"

-- 📢 JINXKING OFFICIAL MEDIA CENTRALE (NEVER DELETED)
Config.DISCORD_LINK = "https://discord.gg"
Config.YOUTUBE_LINK = "https://youtube.com"

-- 🚗 EMERGENCY HAMBURG EXPLOIT EVENT ID
Config.PLATE_REMOTE_ID = "96fe0154-8895-4aad-bb55-27adea18d2da"

-- 🗃️ LIVE RUNTIME ADJUSTMENTS CACHE
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

-- 🧬 MULTI-NESTING SCRATCH VARIABLE ENGINE DATA (Längliche Kreise Speicher)
Config.VisualVariables = {
    ["Punkte"] = 0,
    ["Geld"] = 1000,
    ["Cops"] = 0,
    ["Speed"] = 50
}

-- 📋 DYNAMIC CUSTOM SKRIPT REGISTRY
Config.ExportedMacros = {}

-- Key Verification System Backend
function Config.isVerified()
    if readfile then
        local success, savedKey = pcall(function() return readfile(Config.KEY_FILE) end)
        if success and savedKey == Config.CORRECT_KEY then return true end
    end
    return false
end

function Config.saveKey()
    if writefile then pcall(function() writefile(Config.KEY_FILE, Config.CORRECT_KEY) end) end
end

return Config
