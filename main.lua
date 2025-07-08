local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "Christian_Panel"
gui.ResetOnSpawn = false

-- Pantalla de contraseña
local passFrame = Instance.new("Frame", gui)
passFrame.Size = UDim2.new(1, 0, 1, 0)
passFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local passLabel = Instance.new("TextLabel", passFrame)
passLabel.Size = UDim2.new(1, 0, 0.2, 0)
passLabel.Position = UDim2.new(0, 0, 0.2, 0)
passLabel.Text = "Ingresa el código para acceder al panel:\nAYAM"
passLabel.Font = Enum.Font.Arcade
passLabel.TextColor3 = Color3.new(1, 1, 1)
passLabel.TextScaled = true
passLabel.BackgroundTransparency = 1

local passBox = Instance.new("TextBox", passFrame)
passBox.Size = UDim2.new(0.3, 0, 0.08, 0)
passBox.Position = UDim2.new(0.35, 0, 0.45, 0)
passBox.PlaceholderText = "Escribe aquí el código"
passBox.TextScaled = true
passBox.Font = Enum.Font.SourceSans
passBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
passBox.TextColor3 = Color3.new(1, 1, 1)

local enterBtn = Instance.new("TextButton", passFrame)
enterBtn.Size = UDim2.new(0.15, 0, 0.07, 0)
enterBtn.Position = UDim2.new(0.425, 0, 0.57, 0)
enterBtn.Text = "Entrar"
enterBtn.Font = Enum.Font.SourceSansBold
enterBtn.TextColor3 = Color3.new(1, 1, 1)
enterBtn.TextScaled = true
enterBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

-- Botón flotante (icono C)
local openBtn = Instance.new("TextButton")
openBtn.Parent = gui
openBtn.Text = "C"
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
openBtn.TextScaled = true
openBtn.Font = Enum.Font.Arcade
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Draggable = true
openBtn.Visible = false

-- Panel principal
local panel = Instance.new("Frame")
panel.Parent = gui
panel.Size = UDim2.new(0.5, 0, 0.7, 0)
panel.Position = UDim2.new(0.25, 0, 0.15, 0)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.Visible = false
panel.Draggable = true
panel.Active = true

-- Efecto Rainbow
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t * 0.1) % 1, 1, 1)
end
game:GetService("RunService").RenderStepped:Connect(function()
	stroke.Color = rainbow()
end)

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "By Christian"
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.BackgroundTransparency = 1

-- Barra de búsqueda
local searchBox = Instance.new("TextBox", panel)
searchBox.Size = UDim2.new(0.9, 0, 0.08, 0)
searchBox.Position = UDim2.new(0.05, 0, 0.12, 0)
searchBox.PlaceholderText = "Buscar script..."
searchBox.Font = Enum.Font.SourceSans
searchBox.TextScaled = true
searchBox.TextColor3 = Color3.new(1, 1, 1)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- Contenedor scroll vertical para scripts
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, 0, 0.7, 0)
scroll.Position = UDim2.new(0, 0, 0.21, 0)
scroll.CanvasSize = UDim2.new(0, 0, 10, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

-- Botón de regresar (se muestra en subpaneles)
local backBtn = Instance.new("TextButton", panel)
backBtn.Size = UDim2.new(0.2, 0, 0.07, 0)
backBtn.Position = UDim2.new(0.75, 0, 0.93, 0)
backBtn.Text = "Regresar"
backBtn.Visible = false
backBtn.Font = Enum.Font.Arcade
backBtn.TextColor3 = Color3.new(1, 1, 1)
backBtn.TextScaled = true
backBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)

-- Función para crear carpetas
local function crearCarpeta(nombre, scripts)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(0.9, 0, 0.07, 0)
	btn.Position = UDim2.new(0.05, 0, #scroll:GetChildren() * 0.08, 0)
	btn.Text = nombre
	btn.Font = Enum.Font.Arcade
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(30,30,30)

	btn.MouseButton1Click:Connect(function()
		scroll:ClearAllChildren()
		backBtn.Visible = true
		for i, script in ipairs(scripts) do
			local sub = Instance.new("TextButton", scroll)
			sub.Size = UDim2.new(0.9, 0, 0.07, 0)
			sub.Position = UDim2.new(0.05, 0, i * 0.08, 0)
			sub.Text = script[1]
			sub.Font = Enum.Font.Arcade
			sub.TextColor3 = Color3.new(1,1,1)
			sub.TextScaled = true
			sub.BackgroundColor3 = Color3.fromRGB(40,40,40)
			sub.MouseButton1Click:Connect(function()
				loadstring(game:HttpGet(script[2]))()
			end)
		end
	end)
end

-- Botón regresar funcional
backBtn.MouseButton1Click:Connect(function()
	scroll:ClearAllChildren()
	backBtn.Visible = false
	initCarpetas()
end)

-- Scripts
local juegosPopulares = {
	{"🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{"🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{"🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{"🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
}

local comandos = {
	{"🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{"👁 ESP Player", "https://pastebin.com/raw/PuFYe5BE"},
	{"🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{"📜 Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}

local general = {}
for i = 1, 40 do
	table.insert(general, {"🔧 Script " .. i, "https://pastebin.com/raw/V6DGfWbV"}) -- puedes cambiar esto a scripts reales
end

-- Inicializar carpetas
function initCarpetas()
	crearCarpeta("📁 Juegos Populares", juegosPopulares)
	crearCarpeta("🛠 Comandos", comandos)
	crearCarpeta("🧩 General", general)
end

-- Acciones tras ingresar código
enterBtn.MouseButton1Click:Connect(function()
	if passBox.Text == "AYAM" then
		passFrame:Destroy()
		openBtn.Visible = true
	end
end)

-- Mostrar/Ocultar panel
openBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Iniciar carpetas
initCarpetas()
