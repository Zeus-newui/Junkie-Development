-- 🔥 HAZE LOADER MK6 - CLEAN VERSION
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

-- Wait for game to fully load
repeat wait() until game:IsLoaded()
wait(1)

-- Notification function
local function Notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 8,
            Icon = "rbxassetid://6034833295"
        })
    end)
end

Notify("🔥 Haze Loader", "Initializing...")

print("🚀 Haze Loader MK6 initialized!")
_G.HAZE_VERSION = "mk6ztskg"

local function fetchScript()
    local gameId = tostring(game.GameId)
    local version = _G.HAZE_VERSION
    local token = "06593f144eab44f25ed2e682491afc7e8ff6e93b1f8cadaafb60be6ff1c36182"
    local url = "https://haze.wtf/api/script/" .. version .. "/" .. gameId .. "?token=" .. token
    
    print("📱 Game ID:", gameId)
    print("🔗 Fetching from:", url)
    
    local response = HttpService:GetAsync(url)
    print("📥 Response received:", #response.." characters")
    
    loadstring(response)()
end

Notify("✅ Haze Loaded!", "Script executing...")

-- Load the script
fetchScript()

-- Auto-reload every 30 seconds (optional)
spawn(function()
    while wait(30) do
        if _G.HazeLoaded then break end
        print("🔄 Auto-reloading Haze...")
        fetchScript()
    end
end)

print("✨ Haze Loader fully operational!")
