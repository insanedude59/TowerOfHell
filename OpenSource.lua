local Config = {

WindowName = "Tower of Hell | RightShift for toggle keybind",

Color = Color3.fromRGB(243,4,4),

Keybind = Enum.KeyCode.RightShift -- Doesn't work



}







local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()

local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Main")

local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("Main Section")

local Section2 = Tab1:CreateSection("Misc")

local Section3 = Tab2:CreateSection("UI")


local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)



Section1:CreateButton("Tp to Top",nil,function(value)
for _,v in pairs(game:GetService("Workspace").tower.finishes:GetChildren()) do
    if _ == 1 and v.Name == "Finish" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
        end
    end
end)


Section1:CreateToggle("AutoTp to Top",nil,function(value)
    tog = value
    while tog do wait(0.1)
    for _,v in pairs(game:GetService("Workspace").tower.finishes:GetChildren()) do
    if _ == 1 and v.Name == "Finish" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
            end
        end
    end
end)


Section1:CreateButton("Disable Anticheat",function()
    for _,v in pairs(getgc()) do
    if type(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript then
        if debug.getinfo(v).name == "kick" then
        hookfunction(v, function(...)
            end)
        end
    end
end

for _,v in pairs(getgc()) do
    if type(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript2 then
        if debug.getinfo(v).name == "FindFirstChild" then
        hookfunction(v, function(...)
                end)
            end
        end
end
game:GetService("Players").LocalPlayer.PlayerScripts.LocalPartScript:Destroy()
end)

Section1:CreateButton("Delete all Kill Parts",function()
      for k,v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
    if v.Name == "kills" then
        print(v.Parent)
        v.Parent:Destroy()
        end
    end
end)

local sp = Section2:CreateTextBox("WalkSpeed","Only numbers",true,function(text)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
end)

local j =Section2:CreateTextBox("JumpPower","Only numbers",true,function(text)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
end)


local s = Section2:CreateToggle("Inf Jump",nil,function(value)
    tog = value
game:GetService("UserInputService").JumpRequest:connect(function()
	if tog == true then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

s:AddToolTip("Only use this if anticheat is disabled")
j:AddToolTip("Only use this if anticheat is disabled")
sp:AddToolTip("Only use this if anticheat is disabled")
