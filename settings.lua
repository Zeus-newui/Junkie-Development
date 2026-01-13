local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = 3})
    end)
end

-- 🔥 VIP CHECK FUNCTION
local function checkVip()
    local success, result = pcall(function()
        -- loadstring()...() executes the code and returns the table
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/Settings/vipusers.lua"))()
    end)

    if success and type(result) == "table" then
        -- Check if the player's ID is in the VIP table
        if table.find(result, player.UserId) then
            return true
        end
    else
        warn("⚠️ Could not load VIP list")
    end
    
    return false
end

-- 🚀 EXECUTION
if checkVip() then
    notify("🌟 VIP ACCESS", "Welcome back, Premium User!")
    -- Load your VIP-only script here
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/main.lua"))()
else
    notify("🔑 PUBLIC ACCESS", "Loading standard version...")
    -- Load your Public script here
    loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/4b91f009447c41632fdf127fd7397d650e7604b2ca483fb72388230fec75b87c/download"))()
end
