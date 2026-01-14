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

print("Haze Loader initialized...")

_G.HAZE_VERSION = "mk6ztskg"

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local function fetchScript()
    local gameId = tostring(game.GameId)
    local version = _G.HAZE_VERSION
    local token = "06593f144eab44f25ed2e682491afc7e8ff6e93b1f8cadaafb60be6ff1c36182"
    local url = "https://haze.wtf/api/script/" .. version .. "/" .. gameId .. "?token=" .. token

    print("ðŸ“¡ Fetching script for game: " .. gameId)
    local response = game:HttpGet(url)
    loadstring(response)()
end

fetchScript()

Notify("The Forge Beta!", "Haze Loader has been loaded successfully.")
