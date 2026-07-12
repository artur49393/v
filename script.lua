-- Создание графического интерфейса
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SaveButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Настройка контейнера GUI
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Главное окно
MainFrame.Name = "TeleportMenu"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 180, 0, 160)
MainFrame.Active = true
MainFrame.Draggable = true -- Меню можно перетаскивать по экрану пальцем/мышкой

local FrameCorner = UICorner:Clone()
FrameCorner.Parent = MainFrame

-- Заголовок меню
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 140, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "TP Position"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка Свернуть/Развернуть
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0, 145, 0, 5)
MinimizeButton.Size = UDim2.new(0, 30, 0, 25)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.SourceSansBold
local MinCorner = UICorner:Clone()
MinCorner.Parent = MinimizeButton

-- Кнопка "Сохранить место"
SaveButton.Parent = MainFrame
SaveButton.BackgroundColor3 = Color3.fromRGB(0, 150, 70)
SaveButton.Position = UDim2.new(0, 10, 0, 45)
SaveButton.Size = UDim2.new(0, 160, 0, 45)
SaveButton.Text = "Сохранить место"
SaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton.TextSize = 14
SaveButton.Font = Enum.Font.SourceSansBold
local SaveCorner = UICorner:Clone()
SaveCorner.Parent = SaveButton

-- Кнопка "Телепорт"
TeleportButton.Parent = MainFrame
TeleportButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
TeleportButton.Position = UDim2.new(0, 10, 0, 100)
TeleportButton.Size = UDim2.new(0, 160, 0, 45)
TeleportButton.Text = "Телепортнутся"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.TextSize = 14
TeleportButton.Font = Enum.Font.SourceSansBold
local TPCorner = UICorner:Clone()
TPCorner.Parent = TeleportButton

-- Переменная для хранения координат
local savedCFrame = nil
local player = game:GetService("Players").LocalPlayer

-- Функция сохранения позиции
SaveButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        savedCFrame = character.HumanoidRootPart.CFrame
        SaveButton.Text = "Сохранено! ✓"
        task.wait(1)
        SaveButton.Text = "Сохранить место"
    end
end)

-- Функция телепортации
TeleportButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        if savedCFrame then
            character.HumanoidRootPart.CFrame = savedCFrame
        else
            TeleportButton.Text = "Сначала сохрани!"
            task.wait(1)
            TeleportButton.Text = "Телепортнутся"
        end
    end
end)

-- Логика сворачивания меню
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    if not isMinimized then
        MainFrame.Size = UDim2.new(0, 180, 0, 35)
        SaveButton.Visible = false
        TeleportButton.Visible = false
        MinimizeButton.Text = "+"
        isMinimized = true
    else
        MainFrame.Size = UDim2.new(0, 180, 0, 160)
        SaveButton.Visible = true
        TeleportButton.Visible = true
        MinimizeButton.Text = "-"
        isMinimized = false
    end
end)
