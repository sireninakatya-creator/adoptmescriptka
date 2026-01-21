-- Adopt Me Fake Script | Delta Compatible
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Notification
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Adopt Me Script",
        Text = "Скрипт успешно загружен (FAKE)",
        Duration = 5
    })
end)

-- GUI
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "AdoptMeFakeGUI"
ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 300, 0, 260)
Main.Position = UDim2.new(0.5, -150, 0.5, -130)
Main.BackgroundColor3 = Color3.fromRGB(30,30,30)
Main.Active = true
Main.Draggable = true

local UIcorner = Instance.new("UICorner", Main)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1
Title.Text = "Adopt Me Fake Menu"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

-- Button creator
local function createButton(text, posY)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9,0,0,35)
    btn.Position = UDim2.new(0.05,0,0,posY)
    btn.Text = text
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    Instance.new("UICorner", btn)
    return btn
end

-- Buttons
local TradeBtn = createButton("Fake Trade", 50)
local PetBtn = createButton("Spawn Fake Pet", 95)
local ClearBtn = createButton("Remove Fake Pet", 140)
local CloseBtn = createButton("Close GUI", 185)

-- FAKE TRADE
TradeBtn.MouseButton1Click:Connect(function()
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Trade",
            Text = "Обмен подтверждён ✔️ (FAKE)",
            Duration = 4
        })
    end)
end)

-- FAKE PET
local FakePet

PetBtn.MouseButton1Click:Connect(function()
    if FakePet then return end

    FakePet = Instance.new("Part", workspace)
    FakePet.Name = "FakePet"
    FakePet.Shape = Enum.PartType.Ball
    FakePet.Size = Vector3.new(2,2,2)
    FakePet.Material = Enum.Material.Neon
    FakePet.Color = Color3.fromRGB(255, 170, 0)
    FakePet.Anchored = false
    FakePet.CanCollide = false

    local weld = Instance.new("WeldConstraint", FakePet)
    weld.Part0 = FakePet
    weld.Part1 = LocalPlayer.Character:WaitForChild("HumanoidRootPart")

    FakePet.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(2,0,2)

    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Pet Spawner",
            Text = "Фейковый питомец заспавнен 🐶",
            Duration = 4
        })
    end)
end)

-- REMOVE PET
ClearBtn.MouseButton1Click:Connect(function()
    if FakePet then
        FakePet:Destroy()
        FakePet = nil
    end
end)

-- CLOSE
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
