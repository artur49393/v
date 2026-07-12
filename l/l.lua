-- Создание графического интерфейса
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Кнопки для Места 1
local SaveButton1 = Instance.new("TextButton")
local TeleportButton1 = Instance.new("TextButton")

-- Кнопки для Места 2
local SaveButton2 = Instance.new("TextButton")
local TeleportButton2 = Instance.new("TextButton")

-- Настройка контейнера GUI
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Главное окно (увеличено по высоте под 4 кнопки)
MainFrame.Name = "MultiTeleportMenu"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 240)
MainFrame.Active = true
MainFrame.Draggable = true

local FrameCorner = UICorner:Clone()
FrameCorner.Parent = MainFrame

-- Заголовок меню
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 150, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "Multi-Teleport"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка Свернуть/Развернуть
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0, 165, 0, 5)
MinimizeButton.Size = UDim2.new(0, 30, 0, 25)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.SourceSansBold
local MinCorner = UICorner:Clone()
MinCorner.Parent = MinimizeButton

-- --- МЕСТО 1 ---
SaveButton1.Parent = MainFrame
SaveButton1.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
SaveButton1.Position = UDim2.new(0, 10, 0, 40)
SaveButton1.Size = UDim2.new(0, 180, 0, 40)
SaveButton1.Text = "Сохранить Место 1"
SaveButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton1.TextSize = 14
SaveButton1.Font = Enum.Font.SourceSansBold
local CornerS1 = UICorner:Clone()
CornerS1.Parent = SaveButton1

TeleportButton1.Parent = MainFrame
TeleportButton1.BackgroundColor3 = Color3.fromRGB(0, 90, 150)
TeleportButton1.Position = UDim2.new(0, 10, 0, 85)
TeleportButton1.Size = UDim2.new(0, 180, 0, 40)
TeleportButton1.Text = "Телепорт в Место 1"
TeleportButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton1.TextSize = 14
TeleportButton1.Font = Enum.Font.SourceSansBold
local CornerT1 = UICorner:Clone()
CornerT1.Parent = TeleportButton1

-- --- МЕСТО 2 ---
SaveButton2.Parent = MainFrame
SaveButton2.BackgroundColor3 = Color3.fromRGB(0, 150, 70)
SaveButton2.Position = UDim2.new(0, 10, 0, 145)
SaveButton2.Size = UDim2.new(0, 180, 0, 40)
SaveButton2.Text = "Сохранить Место 2"
SaveButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton2.TextSize = 14
SaveButton2.Font = Enum.Font.SourceSansBold
local CornerS2 = UICorner:Clone()
CornerS2.Parent = SaveButton2

TeleportButton2.Parent = MainFrame
TeleportButton2.BackgroundColor3 = Color3.fromRGB(0, 110, 50)
TeleportButton2.Position = UDim2.new(0, 10, 0, 190)
TeleportButton2.Size = UDim2.new(0, 180, 0, 40)
TeleportButton2.Text = "Телепорт в Место 2"
TeleportButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton2.TextSize = 14
TeleportButton2.Font = Enum.Font.SourceSansBold
local CornerT2 = UICorner:Clone()
CornerT2.Parent = TeleportButton2

-- Переменные для координат
local savedCFrame1 = nil
local savedCFrame2 = nil
local player = game:GetService("Players").LocalPlayer

-- Логика Места 1
SaveButton1.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        savedCFrame1 = character.HumanoidRootPart.CFrame
        SaveButton1.Text = "Точка 1 сохранена! ✓"
        task.wait(1)
        SaveButton1.Text = "Сохранить Место 1"
    end
end)

TeleportButton1.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        if savedCFrame1 then
            character.HumanoidRootPart.CFrame = savedCFrame1
        else
            TeleportButton1.Text = "Пусто!"
            task.wait(1)
            TeleportButton1.Text = "Телепорт в Место 1"
        end
    end
end)

-- Логика Места 2
SaveButton2.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        savedCFrame2 = character.HumanoidRootPart.CFrame
        SaveButton2.Text = "Точка 2 сохранена! ✓"
        task.wait(1)
        SaveButton2.Text = "Сохранить Место 2"
    end
end)

TeleportButton2.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        if savedCFrame2 then
            character.HumanoidRootPart.CFrame = savedCFrame2
        else
            TeleportButton2.Text = "Пусто!"
            task.wait(1)
            TeleportButton2.Text = "Телепорт в Место 2"
        end
    end
end)

-- Логика сворачивания меню
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    if not isMinimized then
        MainFrame.Size = UDim2.new(0, 200, 0, 35)
        SaveButton1.Visible = false
        TeleportButton1.Visible = false
        SaveButton2.Visible = false
        TeleportButton2.Visible = false
        MinimizeButton.Text = "+"
        isMinimized = true
    else
        MainFrame.Size = UDim2.new(0, 200, 0, 240)
        SaveButton1.Visible = true
        TeleportButton1.Visible = true
        SaveButton2.Visible = true
        TeleportButton2.Visible = true
        MinimizeButton.Text = "-"
        isMinimized = false
    end
end)
