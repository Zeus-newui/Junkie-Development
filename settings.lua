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
    loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/74a3e244d227624a252d5335c0c58c73012798e76922309592e0287c4a28d303/download"))()
end
