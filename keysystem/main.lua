-- Create a function to load scripts based on the game
local function loadGameScript()
    local placeId = game.PlaceId

    if placeId == 17625359962 then -- Rivals
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeus-newui/Junkie-Development/refs/heads/main/keysystem/games/rivals.lua"))()
    else
        print("This script is not applicable for the current game.")
    end
end

-- Call the function to load the appropriate script
loadGameScript()
