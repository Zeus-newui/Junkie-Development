local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local DefaultSettings = {
    AutoLoadEnabled = true,
    TeleportLoadEnabled = true,
    DisableScriptLoader = false, -- Set to false to allow loading
    ScriptToggles = {
        Rivals_Classic = false,
        Rivals_Modern = true,
        Rivals_SkinChanger = false,
        Arsenal = true,
        Universal = true,
        BigPaintball2 = true,
        AimbotFFA = false,
        Bladeball = true,
        GunGroundsFFA = false,
        CombatWarriors = false,
        Fisch = true,
        MurderMystery2 = true,
        FleeTheFacility = false,
        Forsaken = false,
        BlueLock_Rivals = false,
        GrowAGarden = true,
        Brookhaven = false,
        MurderersVsSheriffsDuels = true,
        NightsInTheForest = true,
        Fling2Climb = false,
    }
}

local Settings = table.clone(DefaultSettings)

local function loadSettings()
    local success, savedSettings = pcall(function()
        return HttpService:JSONDecode(readfile("SolunaLoaderSettings.json"))
    end)
    if success and savedSettings then
        for key, value in pairs(DefaultSettings) do
            if savedSettings[key] == nil then
                savedSettings[key] = value
            end
        end
        Settings = savedSettings
    end
end

local function saveSettings()
    writefile("SolunaLoaderSettings.json", HttpService:JSONEncode(Settings))
end

pcall(loadSettings)

if Settings.DisableScriptLoader then
    return
end

-- Function to auto-load selected scripts
local function autoLoadSelectedScripts()
    if Settings.ScriptToggles.Rivals_Classic then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/rivals-classic.lua"))()
    end
    if Settings.ScriptToggles.Rivals_Modern then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/rivals-modern.lua"))()
    end
    if Settings.ScriptToggles.Rivals_SkinChanger then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/skin-changer.lua"))()
    end
    if Settings.ScriptToggles.Arsenal then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/arsenal.lua"))()
    end
    if Settings.ScriptToggles.Universal then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/universal.lua"))()
    end
    if Settings.ScriptToggles.BigPaintball2 then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/big-paintball-2.lua"))()
    end
    if Settings.ScriptToggles.AimbotFFA then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/Aimbot-FFA.lua"))()
    end
    if Settings.ScriptToggles.Bladeball then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua"))()
    end
    if Settings.ScriptToggles.GunGroundsFFA then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/gun-grounds-ffa.lua"))()
    end
    if Settings.ScriptToggles.CombatWarriors then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/combat-warriors.lua"))()
    end
    if Settings.ScriptToggles.Fisch then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/fisch.lua"))()
    end
    if Settings.ScriptToggles.MurderMystery2 then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/murder-mystery-2.lua"))()
    end
    if Settings.ScriptToggles.FleeTheFacility then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/flee-the-facility.lua"))()
    end
    if Settings.ScriptToggles.Forsaken then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/forsaken"))()
    end
    if Settings.ScriptToggles.BlueLock_Rivals then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/blue-lock-rivals.lua"))()
    end
    if Settings.ScriptToggles.GrowAGarden then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
    end
    if Settings.ScriptToggles.Brookhaven then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/brookhaven.lua"))()
    end
    if Settings.ScriptToggles.MurderersVsSheriffsDuels then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/murderers-vs-sheriffs-duels.lua"))()
    end
    if Settings.ScriptToggles.NightsInTheForest then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/99-Nights-in-the-Forest.lua"))()
    end
    if Settings.ScriptToggles.Fling2Climb then
        loadstring(game:HttpGet("https://soluna-script.vercel.app/fling-2-climb.lua"))()
    end
end

if Settings.AutoLoadEnabled then
    autoLoadSelectedScripts()
end

if Settings.TeleportLoadEnabled then
    queue_on_teleport([[
        spawn(function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            
            local function isGameLoaded()
                return game:IsLoaded() and LocalPlayer and LocalPlayer.Character and
                       LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                       workspace.CurrentCamera
            end
            
            if not LocalPlayer then
                LocalPlayer = Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
                LocalPlayer = Players.LocalPlayer
            end
            
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.CharacterAdded:Wait()

                while not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
                    task.wait(0.1)
                end
            end
            
            if not isGameLoaded() then
                repeat task.wait(0.1) until isGameLoaded()
            end
            
            task.wait(1)

            pcall(function()
                loadstring(game:HttpGet("https://soluna-script.vercel.app/main.lua", true))()
            end)
        end)
    ]])
end

-- Auto-Load selected scripts on player join without UI.
autoLoadSelectedScripts()
