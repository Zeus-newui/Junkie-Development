-- Create a function to load scripts based on the game
repeat wait(1) until game:IsLoaded()

local function loadGameScript()
    local placeId = game.PlaceId

    if placeId == 17625359962 then -- Rivals
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/rivals.lua"))()
    elseif placeId == 76558904092080 or placeId == 129009554587176 or placeId == 131884594917121 then -- The Forge 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/theforge.lua"))()
    else
        print("This script is not applicable for the current game.")
    end
end

-- Call the function to load the appropriate script
loadGameScript()
