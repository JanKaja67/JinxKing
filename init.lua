-- ==============================================================================
-- 👑 PROJECT JINXKING: MASTER INITIALIZER BOOTSTRAP v7.0
-- ==============================================================================
-- File: init.lua | The Main Online Gateway Loader for Delta Executor

-- Passe hier deinen GitHub-Benutzernamen an, damit der Pfad exakt stimmt!
local GITHUB_USER = "JanKajaHub"
local BASE_URL = "https://githubusercontent.com" .. GITHUB_USER .. "/JinxKing/main/"

local function loadCloudFile(fileName)
    local success, content = pcall(function()
        return game:HttpGet(BASE_URL .. fileName, true)
    end)
    if success and content then
        local loaded, err = loadstring(content)
        if loaded then
            return loaded()
        else
            warn("[JinxKing Boot] Error compiling " .. fileName .. ": " .. tostring(err))
        end
    end
    warn("[JinxKing Boot] Failed to download " .. fileName)
    return nil
end

-- Start loading the architecture step by step
print("[JinxKing Boot] Connecting to GitHub Asset Servers...")

local Config = loadCloudFile("config.lua")
if Config then
    getgenv().JinxKingConfigModule = Config
    
    -- Load Bypasses & Logic Core inside background threads
    task.spawn(function()
        -- Background security checks here
    end)

    -- Fire up the User Interface & Scratch Studio
    local UI = loadCloudFile("ui.lua")
    if UI and UI.load then
        UI.load(Config)
        print("[JinxKing Boot] Prestige Framework successfully activated!")
    end
else
    error("[JinxKing Boot] Critical Error: Base configuration missing!")
end
