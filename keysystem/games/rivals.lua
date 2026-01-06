-- Load external scripts
loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/other.lua"))()

-- Create the GUI
local z3USLoader = Instance.new("ScreenGui")
z3USLoader.Name = "Z3US Loader"
z3USLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
z3USLoader.Parent = game:GetService("CoreGui")
z3USLoader.ResetOnSpawn = false
z3USLoader.DisplayOrder = 999999
z3USLoader.IgnoreGuiInset = true

local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Position = UDim2.fromScale(0.0883, 0.11)
frame.Size = UDim2.fromOffset(878, 550)

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		local dragStart = input.Position
		local frameStart = frame.Position

		local connection
		connection = game:GetService("UserInputService").InputChanged:Connect(function(inputChanged)
			if inputChanged.UserInputType == Enum.UserInputType.MouseMovement then
				local delta = inputChanged.Position - dragStart
				frame.Position = UDim2.new(
					frameStart.X.Scale,
					frameStart.X.Offset + delta.X,
					frameStart.Y.Scale,
					frameStart.Y.Offset + delta.Y
				)
			end
		end)

		local endConnection
		endConnection = game:GetService("UserInputService").InputEnded:Connect(function(inputEnded)
			if inputEnded.UserInputType == Enum.UserInputType.MouseButton1 then
				connection:Disconnect()
				endConnection:Disconnect()
			end
		end)
	end
end)

-- Check if autoloadEnabled and silentloadEnabled are defined before using them
local autoloadEnabled = true -- Set a default value or define it according to your needs
local silentloadEnabled = true -- Set a default value or define it according to your needs

-- Execute additional scripts
getgenv().autoload = autoloadEnabled
getgenv().silentload = silentloadEnabled

-- Load external Lua scripts (ensure to verify their safety)
loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/8be52e21a0145a401c446ca7ab2b5df9bd327ea80b0cf1d2fe99e442edd0f9c9/download"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Test.lua"))()

-- Update toggle appearance (make sure this function is defined in the loaded scripts)
updateToggleAppearance()
