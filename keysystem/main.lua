-- Create a function to load scripts based on the game
repeat wait(1) until game:IsLoaded()

-- Function to send notifications
local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 15,
    })
end

local function loadGameScript()
    local placeId = game.PlaceId

    if placeId == 17625359962 then -- Rivals
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/rivals.lua"))()
        Notify("Rivals!", "Script has been loaded successfully.")
    elseif placeId == 76558904092080 or placeId == 129009554587176 or placeId == 131884594917121 then -- The Forge 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/theforge.lua"))()
        Notify("The Forge Beta!", "Script has been loaded successfully.")
    elseif placeId == 2753915549 or PlaceId == 4442272183 or PlaceId == 7449423635 then -- Blox Fruit
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/onther.lua"))()
        Notify("Blox Fruit!", "Script has been loaded successfully.")
    elseif placeId == 5750914919 then -- Fisch
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/onther.lua"))()
        Notify("Fisch", "Script has been loaded successfully.")
    elseif placeId == 3317771874 then -- Pet Simulator 99
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/onther.lua"))()
        Notify("Pet Simulator 99", "Script has been loaded successfully.")
    elseif placeId == 7018190066 then -- Dead Rails
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/onther.lua"))()
        Notify("Dead Rails", "Script has been loaded successfully.")
    elseif placeId == 7436755782 then -- Grow a Garden
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/onther.lua"))()
        Notify("Grow a Garden", "Script has been loaded successfully.")
    elseif placeId == 7326934954 then -- 99 Nights in the Forest
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/onther.lua"))()
        Notify("99 Nights in the Forest", "Script has been loaded successfully.")
    elseif placeId == 8316902627 then -- Plants vs Brainrot
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/onther.lua"))()
        Notify("Plants vs Brainrot", "Script has been loaded successfully.")
    else
        game.Players.LocalPlayer:Kick("Disconnected You have been kicked from this experience: You have been permanently banned from this game by the developer. Reason: Unrecognized Client Behavior (Error Code: 267).")
    end
end

-- Call the function to load the appropriate script
loadGameScript()
