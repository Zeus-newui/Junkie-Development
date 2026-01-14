
-- Haze Loader v2.3
-- https://haze.wtf

print("ðŸŒŠ Haze Loader initialized...")

_G.HAZE_VERSION = "mk6ztskg"

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local function fetchScript()
    local gameId = tostring(game.GameId)
    local version = _G.HAZE_VERSION
    local token = "98211fd34e51ab3de3fd3f4765cb5ebd196135010e50a46f686e23da7fbb5404"
    local url = "https://haze.wtf/api/script/" .. version .. "/" .. gameId .. "?token=" .. token

    print("ðŸ“¡ Fetching script for game: " .. gameId)
    local response = game:HttpGet(url)
    loadstring(response)()
end

fetchScript()
