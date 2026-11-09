-- ==============================================================================
-- 👑 PROJECT JINXKING: VISUAL SCRATCH STUDIO ENGINE v7.0
-- ==============================================================================
-- File: scratch.lua | Advanced 200+ Node Magnet-Snapping & Variable Grid Canvas

local ScratchStudio = {}
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer

function ScratchStudio.open(Config, MainFrame)
    local Screen = MainFrame.Parent
    
    -- 🪐 REPAIRED COMPACT GAP WINDOW (Perfekter Randabstand auf dem iPad)
    local Studio = Instance.new("Frame", Screen)
    Studio.Name = "ScratchStudio"
    Studio.Size = UDim2.new(1, -100, 1, -120)
    Studio.Position = UDim2.new(0.5, -375, 0.5, -225)
    Studio.BackgroundColor3 = Color3.fromRGB(14, 15, 18)
    Studio.BorderSizePixel = 0
    Instance.new("UICorner", Studio).CornerRadius = UDim.new(0, 12)
    local studioStroke = Instance.new("UIStroke", Studio)
    studioStroke.Color = Color3.fromRGB(55, 58, 68)

    -- Header Setup
    local Header = Instance.new("Frame", Studio)
    Header.Size = UDim2.new(1, 0, 0, 45)
    Header.BackgroundColor3 = Color3.fromRGB(24, 26, 32)
    Header.BorderSizePixel = 0
    Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)

    local Title = Instance.new("TextLabel", Header)
    Title.Text = "   🧩 | JinxKing Block Engine Studio v7.0 [Premium Sandbox]"
    Title.Size = UDim2.new(0.45, 0, 1, 0)
    Title.TextColor3 = Color3.fromRGB(245, 245, 250)
    Title.TextSize = 11; Title.Font = Enum.Font.RobotoMono; Title.BackgroundTransparency = 1
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Name Input Field
    local NameInput = Instance.new("TextBox", Header)
    NameInput.Size = UDim2.fromOffset(100, 24)
    NameInput.Position = UDim2.new(1, -260, 0, 10)
    NameInput.BackgroundColor3 = Color3.fromRGB(16, 17, 20)
    NameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameInput.Font = Enum.Font.RobotoMono; NameInput.TextSize = 10
    NameInput.Text = "MeinSkript"
    Instance.new("UICorner", NameInput).CornerRadius = UDim.new(0, 4)

    -- Green Flag (🚩 Execution Trigger)
    local GreenFlagBtn = Instance.new("TextButton", Header)
    GreenFlagBtn.Size = UDim2.fromOffset(30, 24)
    GreenFlagBtn.Position = UDim2.new(1, -150, 0, 10)
    GreenFlagBtn.BackgroundColor3 = Color3.fromRGB(28, 35, 28)
    GreenFlagBtn.Text = "🚩"
    GreenFlagBtn.TextSize = 12; GreenFlagBtn.Font = Enum.Font.RobotoMono
    GreenFlagBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
    Instance.new("UICorner", GreenFlagBtn).CornerRadius = UDim.new(0, 4)

    -- Export Button
    local ExportBtn = Instance.new("TextButton", Header)
    ExportBtn.Size = UDim2.fromOffset(60, 24)
    ExportBtn.Position = UDim2.new(1, -112, 0, 10)
    ExportBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
    ExportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExportBtn.Font = Enum.Font.RobotoMono; ExportBtn.TextSize = 10
    ExportBtn.Text = "Export"
    Instance.new("UICorner", ExportBtn).CornerRadius = UDim.new(0, 4)

    -- Close Control
    local CloseBox = Instance.new("Frame", Header)
    CloseBox.Size = UDim2.fromOffset(26, 28)
    CloseBox.Position = UDim2.new(1, -42, 0, 8)
    CloseBox.BackgroundColor3 = Color3.fromRGB(32, 26, 26)
    Instance.new("UICorner", CloseBox).CornerRadius = UDim.new(0, 4)
    
    local CloseBtn = Instance.new("TextButton", CloseBox)
    CloseBtn.Size = UDim2.new(1, 0, 1, 0)
    CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(235, 60, 60); CloseBtn.TextSize = 15; CloseBtn.Font = Enum.Font.RobotoMono

    -- Workspace Architecture
    local Sidebar = Instance.new("ScrollingFrame", Studio)
    Sidebar.Position = UDim2.fromOffset(0, 45)
    Sidebar.Size = UDim2.new(0, 190, 1, -45)
    Sidebar.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
    Sidebar.ScrollBarThickness = 2; Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y; Sidebar.BorderSizePixel = 0
    Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 4)

    local Canvas = Instance.new("ScrollingFrame", Studio)
    Canvas.Position = UDim2.fromOffset(190, 45)
    Canvas.Size = UDim2.new(1, -190, 1, -45)
    Canvas.BackgroundColor3 = Color3.fromRGB(10, 11, 13)
    Canvas.CanvasSize = UDim2.new(3, 0, 3, 0); Canvas.ScrollBarThickness = 4; Canvas.BorderSizePixel = 0
    Instance.new("UICorner", Canvas).CornerRadius = UDim.new(0, 8)

    CloseBtn.MouseButton1Click:Connect(function() Studio.Visible = false MainFrame.Visible = true end)

    local SpawnedBlocksCache = {}

    -- INTERACTIVE SMOOTH CENTER-DRAG CONTROLLER WITH SNAP-SYSTEM
    local function MakeBlockDraggable(block, isCapsule)
        local activeDrag = false local trackInput, startDragPos, blockStartPos
        block.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                activeDrag = true trackInput = input
                block.Position = UDim2.fromOffset(input.Position.X - Canvas.AbsolutePosition.X - (block.AbsoluteSize.X / 2) + Canvas.CanvasPosition.X, input.Position.Y - Canvas.AbsolutePosition.Y - (block.AbsoluteSize.Y / 2) + Canvas.CanvasPosition.Y)
                startDragPos = input.Position blockStartPos = block.Position block.ZIndex = 300
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if activeDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input == trackInput) then
                local delta = input.Position - startDragPos
                block.Position = UDim2.new(blockStartPos.X.Scale, blockStartPos.X.Offset + delta.X, blockStartPos.Y.Scale, blockStartPos.Y.Offset + delta.Y)
            end
        end)

        UIS.InputEnded:Connect(function(input)
            if input == trackInput or input.UserInputType == Enum.UserInputType.MouseButton1 then
                activeDrag = false trackInput = nil block.ZIndex = 200

                -- Magnetic Stapel-Snapping Logik
                local snapped = false
                if not isCapsule then
                    for _, other in ipairs(SpawnedBlocksCache) do
                        if other ~= block and other.Parent == Canvas and not other:GetAttribute("IsCapsule") then
                            local diffX = math.abs(block.Position.X.Offset - other.Position.X.Offset)
                            local diffY = (block.Position.Y.Offset - (other.Position.Y.Offset + other.AbsoluteSize.Y))

                            if diffX < 35 and diffY > -10 and diffY < 25 then
                                block.Position = UDim2.fromOffset(other.Position.X.Offset, other.Position.Y.Offset + other.AbsoluteSize.Y + 2)
                                block.UIStroke.Color = Color3.fromRGB(0, 255, 120)
                                task.delay(0.2, function() block.UIStroke.Color = Color3.fromRGB(70, 75, 85) end)
                                block:SetAttribute("ConnectedTo", other.Name)
                                snapped = true
                                break
                            end
                        end
                    end
                end

                if not snapped then
                    block:SetAttribute("ConnectedTo", "")
                    local snapX = math.floor(block.Position.X.Offset / 15) * 15
                    local snapY = math.floor(block.Position.Y.Offset / 15) * 15
                    block.Position = UDim2.new(block.Position.X.Scale, snapX, block.Position.Y.Scale, snapY)
                end
            end
        end)
    end

    -- Dynamic Node Spawner
    local function spawnBlock(name, color, shapeType, executeLogic)
        local bId = "Block_" .. HttpService:GenerateGUID(false):sub(1,6)
        local spawnX = Canvas.CanvasPosition.X + 80
        local spawnY = Canvas.CanvasPosition.Y + 80
        
        local b = Instance.new("Frame", Canvas)
        b.Name = bId; b.Size = UDim2.fromOffset(160, 34); b.BackgroundColor3 = color; b.Position = UDim2.fromOffset(spawnX, spawnY); b.ZIndex = 200
        Corner(b, shapeType == "Circle" and 17 or 6)
        Create("UIStroke", { Color = Color3.fromRGB(70, 75, 85), Thickness = 1, Name = "UIStroke" }, b)

        local lbl = Instance.new("TextLabel", b)
        lbl.Text = name; lbl.Size = UDim2.new(1, -15, 1, 0); lbl.Position = UDim2.fromOffset(8, 0)
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255); lbl.TextSize = 9; lbl.Font = Enum.Font.RobotoMono
        lbl.BackgroundTransparency = 1; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 201

        -- Aussparung für Eingaben oder Schachtelungen (Kreise / Variablen)
        if shapeType == "Nested" or shapeType == "Variable" then
            local nodeInput = Instance.new("TextBox", b)
            nodeInput.Size = UDim2.fromOffset(42, 18); nodeInput.Position = UDim2.new(1, -50, 0, 8)
            nodeInput.BackgroundColor3 = Color3.fromRGB(15, 16, 18); nodeInput.TextColor3 = Color3.fromRGB(0, 255, 140)
            nodeInput.TextSize = 9; nodeInput.Font = Enum.Font.RobotoMono; nodeInput.Text = "10"; nodeInput.ZIndex = 202
            Corner(nodeInput, 10)
            Create("UIStroke", { Color = Color3.fromRGB(0, 140, 255), Thickness = 1 }, nodeInput)
        end

        local clickDetector = Instance.new("TextButton", b)
        clickDetector.Size = UDim2.new(1, 0, 1, 0); clickDetector.BackgroundTransparency = 1; clickDetector.Text = ""; clickDetector.ZIndex = 210
        clickDetector.MouseButton1Click:Connect(function()
            if executeLogic then executeLogic() end
        end)

        b:SetAttribute("IsCapsule", shapeType == "Circle")
        MakeBlockDraggable(b, shapeType == "Circle")
table.insert(SpawnedBlocksCache, b)
end
-- Generator for Collapsible Side Menus
local function createCollapsibleCategory(title, headerColor, blockTable)
local open = false
local container = Instance.new("Frame", Sidebar)
container.Size = UDim2.new(0.95, 0, 0, 28); container.BackgroundColor3 = Color3.fromRGB(22, 24, 29); container.BorderSizePixel = 0
Corner(container, 4)
Create("UIStroke", { Color = Color3.fromRGB(45, 47, 55), Thickness = 1 }, container)
Instance.new("UIListLayout", container).HorizontalAlignment = Enum.HorizontalAlignment.Center
local toggleBtn = Instance.new("TextButton", container)
toggleBtn.Size = UDim2.new(1, 0, 0, 28); toggleBtn.BackgroundTransparency = 1; toggleBtn.Text = "  ▶  " .. title
toggleBtn.TextColor3 = headerColor; toggleBtn.TextSize = 10; toggleBtn.Font = Enum.Font.RobotoMono; toggleBtn.TextXAlignment = Enum.TextXAlignment.Left
local blockFrames = {}
for _, blockData in ipairs(blockTable) do
local bBtn = Instance.new("TextButton", container)
bBtn.Size = UDim2.new(0.9, 0, 0, 26); bBtn.BackgroundColor3 = Color3.fromRGB(28, 30, 36)
bBtn.TextColor3 = Color3.fromRGB(220, 220, 225); bBtn.TextSize = 9; bBtn.Font = Enum.Font.RobotoMono
bBtn.Text = " + " .. blockData[1]; bBtn.Visible = false
Corner(bBtn, 4)
Create("UIStroke", { Color = Color3.fromRGB(45, 47, 55), Thickness = 1 }, bBtn)
bBtn.MouseButton1Click:Connect(function()
spawnBlock(blockData[1], headerColor, blockData[2], blockData[3])
end)
table.insert(blockFrames, bBtn)
end
toggleBtn.MouseButton1Click:Connect(function()
open = not open
toggleBtn.Text = (open and "  ▼  " or "  ▶  ") .. title
for _, bf in ipairs(blockFrames) do bf.Visible = open end
container.Size = UDim2.new(0.95, 0, 0, open and (32 + (#blockFrames * 28)) or 28)
end)
end
-- ==============================================================================
-- 📁 DEPLOYING SCRATCH BLOCKS FOR EM HAMBURG CHEATS
-- ==============================================================================
createCollapsibleCategory("BEWEGUNG [DUNKELBLAU]", Color3.fromRGB(74, 108, 212), {
{"gehe 10er-Schritt", "Nested", function() pcall(function() Player.Character:TranslateBy(Player.Character.Humanoid.MoveDirection * 10) end) end},
{"drehe dich 15 Grad", "Square", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(15), 0) end) end},
{"zu Zufallsposition", "Square", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(-500, 500), 50, math.random(-500, 500)) end) end},
{"Teleport zu Bank", "Circle", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(234, 12, -412) end) end},
{"Teleport zu Autohaus", "Circle", function() pcall(function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(-105, 11, 320) end) end}
})
createCollapsibleCategory("AUSSEHEN [LILA]", Color3.fromRGB(153, 102, 255), {
{"sage JinxKing Active!", "Nested", function() game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("JinxKing Visual Mod Active!", "All") end},
{"Kostüm unsichtbar", "Circle", function() pcall(function() for _, v in pairs(Player.Character:GetChildren()) do if v:IsA("BasePart") then v.Transparency = 1 end end end) end},
{"Kostüm sichtbar", "Circle", function() pcall(function() for _, v in pairs(Player.Character:GetChildren()) do if v:IsA("BasePart") then v.Transparency = 0 end end end) end}
})
createCollapsibleCategory("EREIGNISSE [GELB]", Color3.fromRGB(255, 191, 0), {
{"Wenn 🚩 angeklickt", "Circle", function() print("[JinxKing Flag Matrix] Chain Event Trigger active.") end},
{"Wenn Admin joint", "Square", function() getgenv().JinxKingConfig.AdminDetectActive = true end}
})
createCollapsibleCategory("STEUERUNG [HELLORANGE]", Color3.fromRGB(255, 171, 25), {
{"warte 1 Sekunde", "Nested", function() task.wait(1) end},
{"falls [Cop in der Nähe]", "Square", nil},
{"und / oder Operator", "Nested", nil}
})
-- ==============================================================================
-- 🍊 VARIABLES SHES CAPSULES MODULE (LÄNGLICHE KREISE)
-- ==============================================================================
local varContainer = Instance.new("Frame", Sidebar)
varContainer.Size = UDim2.new(0.95, 0, 0, 28); varContainer.BackgroundColor3 = Color3.fromRGB(22, 24, 29); varContainer.BorderSizePixel = 0
Corner(varContainer, 4)
Create("UIStroke", { Color = Color3.fromRGB(45, 47, 55), Thickness = 1 }, varContainer)
local varLayout = Instance.new("UIListLayout", varContainer) varLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
local varToggle = Instance.new("TextButton", varContainer)
varToggle.Size = UDim2.new(1, 0, 0, 28); varToggle.BackgroundTransparency = 1; varToggle.Text = "  ▶  VARIABLEN [DUNKELORANGE]"
varToggle.TextColor3 = Color3.fromRGB(255, 140, 0); varToggle.TextSize = 10; varToggle.Font = Enum.Font.RobotoMono; varToggle.TextXAlignment = Enum.TextXAlignment.Left
local buildNewVarBtn = Instance.new("TextButton", varContainer)
buildNewVarBtn.Size = UDim2.new(0.9, 0, 0, 26); buildNewVarBtn.BackgroundColor3 = Color3.fromRGB(30, 25, 20)
buildNewVarBtn.TextColor3 = Color3.fromRGB(255, 160, 50); buildNewVarBtn.TextSize = 9; buildNewVarBtn.Font = Enum.Font.RobotoMono; buildNewVarBtn.Text = " + Länglicher Kreis Block"
buildNewVarBtn.Visible = false; Corner(buildNewVarBtn, 4)
Create("UIStroke", { Color = Color3.fromRGB(255, 140, 0), Thickness = 1 }, buildNewVarBtn)
local varOpen = false
local dynamicVarButtons = {}
varToggle.MouseButton1Click:Connect(function()
varOpen = not varOpen
varToggle.Text = (varOpen and "  ▼  " or "  ▶  ") .. "VARIABLEN [DUNKELORANGE]"
buildNewVarBtn.Visible = varOpen
for _, b in ipairs(dynamicVarButtons) do b.Visible = varOpen end
varContainer.Size = UDim2.new(0.95, 0, 0, varOpen and (32 + ((#dynamicVarButtons + 1) * 28)) or 28)
end)
buildNewVarBtn.MouseButton1Click:Connect(function()
-- Spawnt sofort den länglichen Variablen-Kreis auf dein Arbeitsfeld!
spawnBlock("Variable_Kapsel", Color3.fromRGB(255, 140, 0), "Circle", nil)
end)
-- Export-Matrix Verbindung
ExportBtn.MouseButton1Click:Connect(function()
local macroName = NameInput.Text ~= "" and NameInput.Text or "CustomSkript"
if Config.ExportedMacros then
table.insert(Config.ExportedMacros, macroName)
end
Studio.Visible = false MainFrame.Visible = true
end)
GreenFlagBtn.MouseButton1Click:Connect(function()
print("[JinxKing Flag Matrix] Running all connected chains under 🚩.")
end)
Studio.Visible = true
end
return ScratchStudio