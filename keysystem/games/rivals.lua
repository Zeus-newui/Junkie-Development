loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/other.lua"))()

local z3USLoader = Instance.new("ScreenGui")
z3USLoader.Name = "UsedID Loader"
z3USLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
z3USLoader.Parent = game:GetService("CoreGui")
z3USLoader.ResetOnSpawn = false
z3USLoader.DisplayOrder = 999999
z3USLoader.IgnoreGuiInset = true

local autoloadEnabled = true
local silentloadEnabled = true
local version = "New"

repeat task.wait() until game:IsLoaded()
repeat task.wait() until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character
repeat task.wait() until not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("LoadingScreen")

getgenv().autoload = true
getgenv().silentload = true
getgenv().SCRIPT_KEY = ""

loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/8be52e21a0145a401c446ca7ab2b5df9bd327ea80b0cf1d2fe99e442edd0f9c9/download"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Test.lua"))()

print("✅ UsedID Rivals SILENT LOADER - LOADED!")
