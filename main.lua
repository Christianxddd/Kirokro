local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- GUI principal
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "ChristianPanelSecure"
gui.ResetOnSpawn = false

-- Pantalla de contraseña
local passFrame = Instance.new("Frame", gui)
passFrame.Size = UDim2.new(0.35, 0, 0.25, 0)
passFrame.Position = UDim2.new(0.325, 0, 0.35, 0)
passFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
passFrame.BackgroundTransparency = 0.2
passFrame.Active = true
Instance.new("UICorner", passFrame)
Instance.new("UIStroke", passFrame).Thickness = 2

local title = Instance.new("TextLabel", passFrame)
title.Size = UDim2.new(1, 0, 0.25, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🔐 Ingresa el código"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

local hint = Instance.new("TextLabel", passFrame)
hint.Size = UDim2.new(1, -20, 0.25, 0)
hint.Position = UDim2.new(0, 10, 0.3, 0)
hint.Text = "Saca el código desde:\nhttps://direct-link.net/1368874/wNwAURpoRoSy"
hint.Font = Enum.Font.Arcade
hint.TextScaled = true
hint.TextWrapped = true
hint.TextColor3 = Color3.fromRGB(255, 255, 160)
hint.BackgroundTransparency = 1

local input = Instance.new("TextBox", passFrame)
input.Size = UDim2.new(1, -40, 0.2, 0)
input.Position = UDim2.new(0, 20, 0.6, 0)
input.PlaceholderText = "Código..."
input.Font = Enum.Font.Arcade
input.TextScaled = true
input.TextColor3 = Color3.new(1, 1, 1)
input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local confirm = Instance.new("TextButton", passFrame)
confirm.Size = UDim2.new(1, -40, 0.2, 0)
confirm.Position = UDim2.new(0, 20, 0.83, 0)
confirm.Text = "✅ Entrar"
confirm.Font = Enum.Font.Arcade
confirm.TextScaled = true
confirm.TextColor3 = Color3.new(1, 1, 1)
confirm.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Código correcto
local codigoCorrecto = "AYAM"

confirm.MouseButton1Click:Connect(function()
	if input.Text == codigoCorrecto then
		passFrame:Destroy()

		-- INICIO DEL PANEL PROFESIONAL (todo tu sistema)
		local Panel = Instance.new("ScreenGui", PlayerGui)
		Panel.Name = "ByChristianHub"
		Panel.ResetOnSpawn = false

		local main = Instance.new("Frame", Panel)
		main.Size = UDim2.new(0.4, 0, 0.7, 0)
		main.Position = UDim2.new(0.3, 0, 0.15, 0)
		main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		main.BackgroundTransparency = 0.3
		main.Active = true
		main.Draggable = true
		Instance.new("UICorner", main)

		local title = Instance.new("TextLabel", main)
		title.Size = UDim2.new(1, 0, 0.1, 0)
		title.Text = "By Christian"
		title.Font = Enum.Font.Arcade
		title.TextScaled = true
		title.TextColor3 = Color3.fromRGB(255,255,255)
		title.BackgroundTransparency = 1

		local subtext = Instance.new("TextLabel", main)
		subtext.Position = UDim2.new(0, 0, 0.1, 0)
		subtext.Size = UDim2.new(1, 0, 0.05, 0)
		subtext.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
		subtext.Font = Enum.Font.Arcade
		subtext.TextScaled = true
		subtext.TextColor3 = Color3.new(1, 1, 1)
		subtext.BackgroundTransparency = 1

		local searchBar = Instance.new("TextBox", main)
		searchBar.PlaceholderText = "🔍 Buscar..."
		searchBar.Size = UDim2.new(0.95, 0, 0.07, 0)
		searchBar.Position = UDim2.new(0.025, 0, 0.17, 0)
		searchBar.Font = Enum.Font.Arcade
		searchBar.TextScaled = true
		searchBar.TextColor3 = Color3.new(1, 1, 1)
		searchBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Instance.new("UICorner", searchBar)

		local scrolling = Instance.new("ScrollingFrame", main)
		scrolling.Size = UDim2.new(0.95, 0, 0.7, 0)
		scrolling.Position = UDim2.new(0.025, 0, 0.25, 0)
		scrolling.CanvasSize = UDim2.new(0, 0, 5, 0)
		scrolling.ScrollBarThickness = 6
		scrolling.BackgroundTransparency = 1

		-- Función para crear carpeta
		local function crearCarpeta(nombre, scripts)
			local folderBtn = Instance.new("TextButton", scrolling)
			folderBtn.Size = UDim2.new(1, -10, 0, 40)
			folderBtn.Text = "📁 " .. nombre
			folderBtn.TextScaled = true
			folderBtn.Font = Enum.Font.Arcade
			folderBtn.TextColor3 = Color3.new(1,1,1)
			folderBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
			local folderFrame = Instance.new("Frame")
			local UIList = Instance.new("UIListLayout", folderFrame)
			UIList.Padding = UDim.new(0, 5)
			folderFrame.Size = UDim2.new(1, -10, 0, #scripts*50)
			folderFrame.BackgroundTransparency = 1
			folderFrame.Visible = false

			for _, data in ipairs(scripts) do
				local btn = Instance.new("TextButton", folderFrame)
				btn.Size = UDim2.new(1, 0, 0, 40)
				btn.Text = data.name
				btn.Font = Enum.Font.Arcade
				btn.TextScaled = true
				btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
				btn.TextColor3 = Color3.new(1,1,1)
				btn.MouseButton1Click:Connect(function()
					loadstring(game:HttpGet(data.link))()
				end)
			end

			folderBtn.MouseButton1Click:Connect(function()
				folderFrame.Visible = not folderFrame.Visible
			end)

			folderFrame.Parent = scrolling
		end

		-- Carpeta: Juegos Populares
		crearCarpeta("🎮 Juegos Populares", {
			{name = "Brainlot", link = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
			{name = "Jailbreak", link = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
			{name = "Dead Rails", link = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
			{name = "Blox Fruits", link = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
			-- Agrega más aquí si quieres
		})

		-- Carpeta: Comandos
		crearCarpeta("🧪 Comandos", {
			{name = "Fly V3", link = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
			{name = "Touch Fling", link = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
			{name = "ESP Player", link = "https://pastebin.com/raw/VR9a1GZJ"},
			{name = "Infinity Yield", link = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
		})

		-- Carpeta: General (40 scripts variados útiles)
		crearCarpeta("🌐 General", {
			{name = "Simple Admin", link = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
			{name = "Dex Explorer", link = "https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"},
			{name = "Remote Spy", link = "https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"},
			-- Añade 37+ más según lo que quieras
		})

		-- Botón de regresar
		local regresar = Instance.new("TextButton", main)
		regresar.Size = UDim2.new(0.25, 0, 0.07, 0)
		regresar.Position = UDim2.new(0.72, 0, 0.93, 0)
		regresar.Text = "⬅️ Regresar"
		regresar.Font = Enum.Font.Arcade
		regresar.TextScaled = true
		regresar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		regresar.TextColor3 = Color3.new(1,1,1)
		regresar.MouseButton1Click:Connect(function()
			for _, child in pairs(scrolling:GetChildren()) do
				if child:IsA("Frame") then
					child.Visible = false
				end
			end
		end)

		-- Icono flotante "C"
		local icon = Instance.new("TextButton", Panel)
		icon.Size = UDim2.new(0, 60, 0, 60)
		icon.Position = UDim2.new(0, 10, 0, 10)
		icon.Text = "C"
		icon.TextScaled = true
		icon.BackgroundColor3 = Color3.new(0, 0, 0)
		icon.TextColor3 = Color3.new(1,1,1)
		icon.Font = Enum.Font.Arcade
		icon.Draggable = true
		icon.MouseButton1Click:Connect(function()
			main.Visible = not main.Visible
		end)

	end
end)
