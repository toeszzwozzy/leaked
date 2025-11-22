--  _,-""`""-~`)
-- (`~_,=========\
--  |---,___.-.__,\
--  |        o     \ ___  _,,,,_     _.--.
--  \      `^`    /`_.-"~      `~-;`     \
--   \_      _  .'                 `,     |
--     |`-      Luv from lasion devs \'__/ 
--    /                      ,_       \  `'-. 
--   /    .-""~~--.            `"-,   ;_    /
--  |              \               \  | `""`
--   \__.--'`"-.   /_               |'
--              `"`  `~~~---..,     |
--                            \ _.-'`-.
--                              \       \
-- Fuck you beanz                 '.     /
-- Life sentence uilib              `"~"`

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")


local function ScaleToOffset(Scale)
	local ViewPortSize = workspace.Camera.ViewportSize
	return ({ViewPortSize.X * Scale[1],ViewPortSize.Y * Scale[2]})
end


local BeanzUI = {}
local defaulttweeninfo = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
function BeanzUI:Tween(object,tweenInfo,goal,callback)
	local tween = tweenService:Create(object,tweenInfo or defaulttweeninfo,goal)
	tween.Completed:Once(callback or function() end)
	tween:Play()
end
function BeanzUI:new(args)
	local UI = {
		CurrentTab = nil,
		Tabs = {},
		ondestroyed = nil,
		minimized = false,
	}


	-- // StarterGui.BeanzUI \\ --
	UI["1"] = Instance.new("ScreenGui",RunService:IsStudio() and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") or game:GetService("CoreGui"))
	UI["1"]["Name"] = [[BeanzUI]]
	UI["1"]["ResetOnSpawn"] = false
	UI["1"]["IgnoreGuiInset"] = false

	-- // StarterGui.BeanzUI.Main \\ --
	UI["2"] = Instance.new("Frame", UI["1"])
	UI["2"]["BorderSizePixel"] = 0
	UI["2"]["BackgroundColor3"] = Color3.fromRGB(46, 46, 46)
	UI["2"]["Size"] = args.Size
	UI["2"]["Position"] = UDim2.new(0.3, 0, 0.3, 0)
	UI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["2"]["Name"] = [[Main]]
	UI["2"]["ClipsDescendants"] = true

	-- // StarterGui.BeanzUI.Main.UICorner \\ --
	UI["3"] = Instance.new("UICorner", UI["2"])
	UI["3"]["CornerRadius"] = UDim.new(0.03, 0)

	---- // StarterGui.BeanzUI.Main.DropShadowHolder \\ --
	--UI["4"] = Instance.new("Frame", UI["2"])
	--UI["4"]["ZIndex"] = 0
	--UI["4"]["BorderSizePixel"] = 0
	--UI["4"]["Size"] = UDim2.new(1, 0, 1, 0)
	--UI["4"]["Name"] = [[DropShadowHolder]]
	--UI["4"]["BackgroundTransparency"] = 1

	---- // StarterGui.BeanzUI.Main.DropShadowHolder.DropShadow \\ --
	--UI["5"] = Instance.new("ImageLabel", UI["4"])
	--UI["5"]["ZIndex"] = 0
	--UI["5"]["BorderSizePixel"] = 0
	--UI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450)
	--UI["5"]["ScaleType"] = Enum.ScaleType.Slice
	--UI["5"]["ImageTransparency"] = 0.5
	--UI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0)
	--UI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	--UI["5"]["Image"] = [[rbxassetid://6014261993]]
	--UI["5"]["Size"] = UDim2.new(1, 47, 1, 47)
	--UI["5"]["BackgroundTransparency"] = 1
	--UI["5"]["Name"] = [[DropShadow]]
	--UI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

	-- // StarterGui.BeanzUI.Main.TopBar \\ --
	UI["6"] = Instance.new("Frame", UI["2"])
	UI["6"]["ZIndex"] = 2
	UI["6"]["BorderSizePixel"] = 0
	UI["6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
	UI["6"]["Size"] = UDim2.new(1, 0, 0.11424, 0)
	UI["6"]["Position"] = UDim2.new(0, 0, -0.00234, 0)
	UI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["6"]["Name"] = [[TopBar]]

	-- // StarterGui.BeanzUI.Main.TopBar.UICorner \\ --
	UI["7"] = Instance.new("UICorner", UI["6"])
	UI["7"]["CornerRadius"] = UDim.new(0.2, 0)

	-- // StarterGui.BeanzUI.Main.TopBar.Bottom \\ --
	UI["8"] = Instance.new("Frame", UI["6"])
	UI["8"]["ZIndex"] = 2
	UI["8"]["BorderSizePixel"] = 0
	UI["8"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
	UI["8"]["Size"] = UDim2.new(1, 0, 0.85083, 0)
	UI["8"]["Position"] = UDim2.new(0, 0, 0.14917, 0)
	UI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["8"]["Name"] = [[Bottom]]

	-- // StarterGui.BeanzUI.Main.TopBar.TItle \\ --
	UI["9"] = Instance.new("TextLabel", UI["6"])
	UI["9"]["TextWrapped"] = true
	UI["9"]["ZIndex"] = 5
	UI["9"]["BorderSizePixel"] = 0
	UI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left
	UI["9"]["TextScaled"] = true
	UI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	UI["9"]["TextSize"] = 14
	UI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	UI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	UI["9"]["BackgroundTransparency"] = 1
	UI["9"]["Size"] = UDim2.new(0.5, 0, 1, 0)
	UI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["9"]["Text"] = args.Name or "yummy beans"
	UI["9"]["Name"] = [[TItle]]
	UI["9"]["Position"] = UDim2.new(0.12321, 0, -0.02193, 0)

	-- // StarterGui.BeanzUI.Main.TopBar.TItle.UIPadding \\ --
	UI["a"] = Instance.new("UIPadding", UI["9"])
	UI["a"]["PaddingTop"] = UDim.new(0.1, 0)
	UI["a"]["PaddingLeft"] = UDim.new(0.05, 0)
	UI["a"]["PaddingBottom"] = UDim.new(0.1, 0)

	-- // StarterGui.BeanzUI.Main.TopBar.Exit \\ --
	UI["b"] = Instance.new("TextButton", UI["6"])
	UI["b"]["TextWrapped"] = true
	UI["b"]["BorderSizePixel"] = 0
	UI["b"]["TextSize"] = 14
	UI["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	UI["b"]["TextScaled"] = true
	UI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	UI["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	UI["b"]["ZIndex"] = 3
	UI["b"]["Size"] = UDim2.new(0.1, 0, 1, 0)
	UI["b"]["BackgroundTransparency"] = 1
	UI["b"]["Name"] = [[Exit]]
	UI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["b"]["Text"] = [[X]]
	UI["b"]["Position"] = UDim2.new(0.89932, 0, 0, 0)

	-- // StarterGui.BeanzUI.Main.TopBar.Exit.UIPadding \\ --
	UI["c"] = Instance.new("UIPadding", UI["b"])
	UI["c"]["PaddingTop"] = UDim.new(0.1, 0)
	UI["c"]["PaddingLeft"] = UDim.new(0.05, 0)
	UI["c"]["PaddingBottom"] = UDim.new(0.1, 0)

	-- // StarterGui.BeanzUI.Main.TopBar.Minimize \\ --
	UI["d"] = Instance.new("ImageButton", UI["6"])
	UI["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	UI["d"]["Image"] = "rbxassetid://100486206790318"
	UI["d"]["ZIndex"] = 3
	UI["d"]["ScaleType"] = Enum.ScaleType.Crop
	UI["d"]["AnchorPoint"] = Vector2.new(0.5, 0.85)
	UI["d"]["Size"] = UDim2.new(0.041, 0, 0.888, 0)
	UI["d"]["BackgroundTransparency"] = 1
	UI["d"]["Name"] = [[Minimize]]
	UI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["d"]["Position"] = UDim2.new(0.877, 0, 0.844, 0)

	-- // StarterGui.BeanzUI.Main.TopBar.Minimize.UIPadding \\ --
	UI["e"] = Instance.new("UIPadding", UI["d"])

	-- // StarterGui.test.Main.TopBar.Line \\ --
	UI["adf"] = Instance.new("Frame", UI["6"])
	UI["adf"]["ZIndex"] = 3
	UI["adf"]["BorderSizePixel"] = 0
	UI["adf"]["BackgroundColor3"] = Color3.fromRGB(151, 151, 151)
	UI["adf"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	UI["adf"]["Size"] = UDim2.new(0, 1, 0.8, 0)
	UI["adf"]["Position"] = UDim2.new(0.10084, 0, 0.5, 0)
	UI["adf"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["adf"]["Name"] = [[Line]]

	-- // StarterGui.test.Main.TopBar.ImageLabel \\ --
	UI["Iconlol"] = Instance.new("ImageLabel", UI["6"])
	UI["Iconlol"]["ZIndex"] = 3
	UI["Iconlol"]["BorderSizePixel"] = 0
	UI["Iconlol"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	UI["Iconlol"]["ScaleType"] = Enum.ScaleType.Fit
	UI["Iconlol"]["Image"] = [[http://www.roblox.com/asset/?id=18187292776]]
	UI["Iconlol"]["Size"] = UDim2.new(0.1023, 0, 1.055, 0)
	UI["Iconlol"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["Iconlol"]["BackgroundTransparency"] = 1
	UI["Iconlol"]["Position"] = UDim2.new(-0.00147, 0, -0, 0)


	-- // StarterGui.BeanzUI.Main.TopBar.Line \\ --
	UI["f"] = Instance.new("Frame", UI["6"])
	UI["f"]["ZIndex"] = 3
	UI["f"]["BorderSizePixel"] = 0
	UI["f"]["BackgroundColor3"] = Color3.fromRGB(204, 204, 204)
	UI["f"]["Size"] = UDim2.new(1, 0, 0, 1)
	UI["f"]["Position"] = UDim2.new(0, 0, 0.99327, 0)
	UI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["f"]["Name"] = [[Line]]

	-- // ServerStorage.Tab.Main.TabHolder \\ --
	UI["10"] = Instance.new("Frame", UI["2"])
	UI["10"]["BorderSizePixel"] = 0
	UI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	UI["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	UI["10"]["Size"] = UDim2.new(0.69686, 0, 0.79967, 0)
	UI["10"]["Position"] = UDim2.new(0.63331, 0, 0.57126, 0)
	UI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["10"]["Name"] = [[TabHolder]]
	UI["10"]["BackgroundTransparency"] = 1


	-- // StarterGui.BeanzUI.Main.Sidebar \\ --
	UI["75"] = Instance.new("Frame", UI["2"])
	UI["75"]["BorderSizePixel"] = 0
	UI["75"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35)
	UI["75"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	UI["75"]["Size"] = UDim2.new(0.2619, 0, 0.88598, 0)
	UI["75"]["Position"] = UDim2.new(0.13061, 0, 0.55701, 0)
	UI["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["75"]["Name"] = [[Sidebar]]

	-- // StarterGui.BeanzUI.Main.Sidebar.UICorner \\ --
	UI["76"] = Instance.new("UICorner", UI["75"])
	UI["76"]["CornerRadius"] = UDim.new(0.08, 0)

	-- // StarterGui.BeanzUI.Main.Sidebar.Hide \\ --
	UI["77"] = Instance.new("Frame", UI["75"])
	UI["77"]["ZIndex"] = 2
	UI["77"]["BorderSizePixel"] = 0
	UI["77"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35)
	UI["77"]["Size"] = UDim2.new(0.2, 0, 0.2, 0)
	UI["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["77"]["Name"] = [[Hide]]

	-- // StarterGui.BeanzUI.Main.Sidebar.Hide \\ --
	UI["78"] = Instance.new("Frame", UI["75"])
	UI["78"]["ZIndex"] = 2
	UI["78"]["BorderSizePixel"] = 0
	UI["78"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35)
	UI["78"]["Size"] = UDim2.new(0.2, 0, 0.2, 0)
	UI["78"]["Position"] = UDim2.new(0.8, 0, 0.00271, 0)
	UI["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["78"]["Name"] = [[Hide]]

	-- // StarterGui.BeanzUI.Main.Sidebar.Hide \\ --
	UI["79"] = Instance.new("Frame", UI["75"])
	UI["79"]["ZIndex"] = 2
	UI["79"]["BorderSizePixel"] = 0
	UI["79"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35)
	UI["79"]["AnchorPoint"] = Vector2.new(1, 1)
	UI["79"]["Size"] = UDim2.new(0.2, 0, 0.2, 0)
	UI["79"]["Position"] = UDim2.new(0.9974, 0, 0.99851, 0)
	UI["79"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["79"]["Name"] = [[Hide]]


	-- // StarterGui.BeanzUI.Main.Sidebar.Holder \\ --
	UI["7a"] = Instance.new("Frame", UI["75"])
	UI["7a"]["BorderSizePixel"] = 0
	UI["7a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	UI["7a"]["Size"] = UDim2.new(1, 0, 1, 0)
	UI["7a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["7a"]["Name"] = [[Holder]]
	UI["7a"]["BackgroundTransparency"] = 1

	-- // StarterGui.BeanzUI.Main.Sidebar.Holder.UIPadding \\ --
	UI["7b"] = Instance.new("UIPadding", UI["7a"])
	UI["7b"]["PaddingTop"] = UDim.new(0.05, 0)

	-- // StarterGui.BeanzUI.Main.Sidebar.Holder.UIListLayout \\ --
	UI["7c"] = Instance.new("UIListLayout", UI["7a"])
	UI["7c"]["SortOrder"] = Enum.SortOrder.LayoutOrder

	-- // StarterGui.test.Main.Notifyframe \\ --
	UI["8d"] = Instance.new("Frame", UI["2"])
	UI["8d"]["ZIndex"] = 5
	UI["8d"]["BorderSizePixel"] = 0
	UI["8d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
	UI["8d"]["Size"] = UDim2.new(0.4213, 0, 0.21207, 0)
	UI["8d"]["Position"] = UDim2.new(0.28899, 0, 1.1, 0)
	UI["8d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["8d"]["Name"] = [[Notifyframe]]

	-- // StarterGui.test.Main.Notifyframe.TextLabel \\ --
	UI["8e"] = Instance.new("TextLabel", UI["8d"])
	UI["8e"]["TextWrapped"] = true
	UI["8e"]["ZIndex"] = 5
	UI["8e"]["BorderSizePixel"] = 0
	UI["8e"]["TextScaled"] = true
	UI["8e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	UI["8e"]["TextSize"] = 100
	UI["8e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	UI["8e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	UI["8e"]["BackgroundTransparency"] = 1
	UI["8e"]["Size"] = UDim2.new(1, 0, 0.65123, 0)
	UI["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["8e"]["Text"] = [[Pick a number bruh]]
	UI["8e"]["Position"] = UDim2.new(0, 0, 0.16429, 0)

	-- // StarterGui.test.Main.Notifyframe.TextLabel.UITextSizeConstraint \\ --
	UI["8f"] = Instance.new("UITextSizeConstraint", UI["8e"])
	UI["8f"]["MaxTextSize"] = 35

	-- // StarterGui.test.Main.Notifyframe.TextButton \\ --
	UI["90"] = Instance.new("TextButton", UI["8d"])
	UI["90"]["TextWrapped"] = true
	UI["90"]["BorderSizePixel"] = 0
	UI["90"]["TextSize"] = 14
	UI["90"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	UI["90"]["TextScaled"] = true
	UI["90"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	UI["90"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	UI["90"]["ZIndex"] = 5
	UI["90"]["Size"] = UDim2.new(0.08817, 0, 0.34885, 0)
	UI["90"]["BackgroundTransparency"] = 1
	UI["90"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	UI["90"]["Text"] = [[X]]
	UI["90"]["Position"] = UDim2.new(0.91179, 0, -0.00002, 0)

	-- // StarterGui.test.Main.Notifyframe.UIStroke \\ --
	UI["91"] = Instance.new("UIStroke", UI["8d"])
	UI["91"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
	UI["91"]["Thickness"] = 2
	UI["91"]["Color"] = Color3.fromRGB(255, 255, 255)

	local Notifyframe = UI["8d"]
	local enter = UDim2.fromScale(0.289,0.786)
	local quit = Notifyframe.Position
	local tweentable = {Position = enter}
	local tweenbacktable = {Position = quit}
	local timeout = 1000

	local popupanim = tweenService:Create(Notifyframe,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),tweentable)
	local backanim = tweenService:Create(Notifyframe,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),tweenbacktable)
	function UI:Notify(text)
		Notifyframe.TextLabel.Text = tostring(text)
		if popupanim.PlaybackState == Enum.PlaybackState.Playing or popupanim.PlaybackState == Enum.PlaybackState.Completed then
			popupanim:Cancel()
			Notifyframe.Position = quit
			popupanim:Play()
			timeout = 4
		else
			popupanim:Play()
			timeout	= 4
		end
	end

	Notifyframe.TextButton.MouseButton1Up:Connect(function()
		backanim:Play()
	end)

	task.spawn(function()
		while task.wait(1) do
			if timeout > 0 then
				timeout -= 1
				if timeout == 0 then
					backanim:Play()
				end
			end
		end
	end)


	-- gold
	do
		UI["121"] = Instance.new("Frame",UI["2"])
		UI["121"]["Visible"] = false
		UI["121"]["ZIndex"] = 5
		UI["121"]["BorderSizePixel"] = 0
		UI["121"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["121"]["Size"] = UDim2.new(0.5, 0, 0.3516, 0)
		UI["121"]["Position"] = UDim2.new(0.27387, 0, 0.28093, 0)
		UI["121"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["121"]["Name"] = [[Whitelistkey]]
		UI["121"]["BackgroundTransparency"] = 0.25

		UI["122"] = Instance.new("TextLabel", UI["121"])
		UI["122"]["TextWrapped"] = true
		UI["122"]["ZIndex"] = 6
		UI["122"]["BorderSizePixel"] = 0
		UI["122"]["TextScaled"] = true
		UI["122"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["122"]["TextSize"] = 14
		UI["122"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["122"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["122"]["BackgroundTransparency"] = 1
		UI["122"]["Size"] = UDim2.new(1, 0, 0.28028, 0)
		UI["122"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["122"]["Text"] = [[Insert Gold Key]]

		UI["123"] = Instance.new("TextBox", UI["121"])
		UI["123"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["123"]["ZIndex"] = 6
		UI["123"]["BorderSizePixel"] = 0
		UI["123"]["TextWrapped"] = true
		UI["123"]["TextSize"] = 14
		UI["123"]["TextScaled"] = true
		UI["123"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["123"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["123"]["ClearTextOnFocus"] = false
		UI["123"]["Size"] = UDim2.new(0.49708, 0, 0.38033, 0)
		UI["123"]["Position"] = UDim2.new(0.09973, 0, 0.44525, 0)
		UI["123"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["123"]["Text"] = [[]]

		UI["124"] = Instance.new("TextButton", UI["121"])
		UI["124"]["TextWrapped"] = true
		UI["124"]["BorderSizePixel"] = 0
		UI["124"]["TextSize"] = 14
		UI["124"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["124"]["TextScaled"] = true
		UI["124"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["124"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["124"]["ZIndex"] = 6
		UI["124"]["Size"] = UDim2.new(0.33157, 0, 0.21319, 0)
		UI["124"]["Name"] = [[Copy]]
		UI["124"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["124"]["Text"] = [[Copy Link]]
		UI["124"]["Position"] = UDim2.new(0.63872, 0, 0.68668, 0)

		UI["125"] = Instance.new("TextButton", UI["121"])
		UI["125"]["TextWrapped"] = true
		UI["125"]["BorderSizePixel"] = 0
		UI["125"]["TextSize"] = 14
		UI["125"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["125"]["TextScaled"] = true
		UI["125"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["125"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["125"]["ZIndex"] = 6
		UI["125"]["Size"] = UDim2.new(0.13688, 0, 0.26534, 0)
		UI["125"]["BackgroundTransparency"] = 1
		UI["125"]["Name"] = [[Exit]]
		UI["125"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["125"]["Text"] = [[X]]
		UI["125"]["Position"] = UDim2.new(0.85888, 0, 0.0122, 0)

		UI["126"] = Instance.new("TextButton", UI["121"])
		UI["126"]["TextWrapped"] = true
		UI["126"]["BorderSizePixel"] = 0
		UI["126"]["TextSize"] = 14
		UI["126"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["126"]["TextScaled"] = true
		UI["126"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["126"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["126"]["ZIndex"] = 6
		UI["126"]["Size"] = UDim2.new(0.33157, 0, 0.21319, 0)
		UI["126"]["Name"] = [[Confirm]]
		UI["126"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["126"]["Text"] = [[Confirm]]
		UI["126"]["Position"] = UDim2.new(0.63872, 0, 0.41168, 0)

	end
	-- silver
	do
		UI["103"] = Instance.new("Frame", UI["2"])
		UI["103"]["Visible"] = false
		UI["103"]["ZIndex"] = 5
		UI["103"]["BorderSizePixel"] = 0
		UI["103"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["103"]["Size"] = UDim2.new(0.5, 0, 0.3516, 0)
		UI["103"]["Position"] = UDim2.new(0.27387, 0, 0.28093, 0)
		UI["103"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["103"]["Name"] = [[Key]]
		UI["103"]["BackgroundTransparency"] = 0.25

		UI["104"] = Instance.new("TextLabel", UI["103"])
		UI["104"]["TextWrapped"] = true
		UI["104"]["ZIndex"] = 6
		UI["104"]["BorderSizePixel"] = 0
		UI["104"]["TextScaled"] = true
		UI["104"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["104"]["TextSize"] = 14
		UI["104"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["104"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["104"]["BackgroundTransparency"] = 1
		UI["104"]["Size"] = UDim2.new(1, 0, 0.28028, 0)
		UI["104"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["104"]["Text"] = [[Insert Silver Key]]

		UI["105"] = Instance.new("TextBox", UI["103"])
		UI["105"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["105"]["ZIndex"] = 6
		UI["105"]["BorderSizePixel"] = 0
		UI["105"]["TextWrapped"] = true
		UI["105"]["TextSize"] = 14
		UI["105"]["TextScaled"] = true
		UI["105"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["105"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["105"]["Size"] = UDim2.new(0.49708, 0, 0.38033, 0)
		UI["105"]["Position"] = UDim2.new(0.09973, 0, 0.44525, 0)
		UI["105"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["105"]["Text"] = [[]]

		UI["106"] = Instance.new("TextButton", UI["103"])
		UI["106"]["TextWrapped"] = true
		UI["106"]["BorderSizePixel"] = 0
		UI["106"]["TextSize"] = 14
		UI["106"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["106"]["TextScaled"] = true
		UI["106"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["106"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["106"]["ZIndex"] = 6
		UI["106"]["Size"] = UDim2.new(0.33157, 0, 0.21319, 0)
		UI["106"]["Name"] = [[Confirm]]
		UI["106"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["106"]["Text"] = [[Confirm]]
		UI["106"]["Position"] = UDim2.new(0.63872, 0, 0.41168, 0)

		UI["107"] = Instance.new("TextButton", UI["103"])
		UI["107"]["TextWrapped"] = true
		UI["107"]["BorderSizePixel"] = 0
		UI["107"]["TextSize"] = 14
		UI["107"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["107"]["TextScaled"] = true
		UI["107"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["107"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["107"]["ZIndex"] = 6
		UI["107"]["Size"] = UDim2.new(0.13688, 0, 0.26534, 0)
		UI["107"]["BackgroundTransparency"] = 1
		UI["107"]["Name"] = [[Exit]]
		UI["107"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["107"]["Text"] = [[X]]
		UI["107"]["Position"] = UDim2.new(0.85888, 0, 0.0122, 0)

		UI["107"] = Instance.new("TextButton", UI["103"])
		UI["107"]["TextWrapped"] = true
		UI["107"]["BorderSizePixel"] = 0
		UI["107"]["TextSize"] = 14
		UI["107"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
		UI["107"]["TextScaled"] = true
		UI["107"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		UI["107"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		UI["107"]["ZIndex"] = 6
		UI["107"]["Size"] = UDim2.new(0.33157, 0, 0.21319, 0)
		UI["107"]["Name"] = [[Copy]]
		UI["107"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UI["107"]["Text"] = [[Copy Link]]
		UI["107"]["Position"] = UDim2.new(0.63872, 0, 0.68668, 0)

	end


	UI["b"].MouseButton1Click:Connect(function()
		if UI.ondestroyed then
			UI.ondestroyed()
		end
		UI["1"]:Destroy()
	end) 
	local oldtopbarsize = UI["6"].Size
	local oldtopbarzindex = UI["6"].ZIndex
	local oldframesize = UI["2"].Size
	local oldframezindex = UI["2"].ZIndex
	local oldexitsize = UI["b"].Size
	local oldexitzindex = UI["b"].ZIndex
	local oldminimizesize = UI["d"].Size
	local oldminimizezindex = UI["d"].ZIndex
	local oldtitlesize = UI["9"].Size
	local oldtitlezindex = UI["9"].ZIndex
	local oldlinezindex = UI["adf"].ZIndex
	local oldlogozindex = UI["Iconlol"].ZIndex

	local function dragGUI(gui)
		task.spawn(function()
			local dragging
			local dragInput
			local dragStart = Vector3.new(0,0,0)
			local startPos
			local function update(input)
				local delta = input.Position - dragStart
				local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				tweenService:Create(gui, TweenInfo.new(.20), {Position = Position}):Play()
			end
			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)
			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			uis.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					update(input)
				end
			end)
		end)
	end
	dragGUI(UI["2"])
	local olddrag
	UI["d"].MouseButton1Click:Connect(function()
		if args.Movable then
			if olddrag then
				olddrag:Destroy()
				olddrag = Instance.new("UIDragDetector")
				olddrag.Parent = UI["2"]
			end
		end
		if UI["2"].Size == oldframesize then
			UI["2"].Size = args.MinimizedSize
			UI["6"].Size = UDim2.fromScale(1,1)
			UI["6"].ZIndex = 10 -- topbar
			UI["2"].ZIndex = 9 -- mainframe
			UI["b"].ZIndex = 11 -- exit
			UI["d"].ZIndex = 11 -- minimize
			UI["9"].ZIndex = 11 -- title
			UI["2"].Sidebar.Visible = false
			UI["f"].Visible = false
			UI["2"].Transparency = 1
			UI["Iconlol"].ZIndex = 11 -- icon
			UI["adf"].ZIndex = 11
		else
			UI["2"].Size = oldframesize
			UI["6"].Size = oldtopbarsize
			UI["6"].ZIndex = oldtopbarzindex
			UI["2"].ZIndex = oldframezindex
			UI["b"].ZIndex = oldexitzindex
			UI["d"].ZIndex = oldminimizezindex
			UI["9"].ZIndex = oldtitlezindex
			UI["2"].Sidebar.Visible = true
			UI["f"].Visible = true
			UI["2"].Transparency = 0
			UI["Iconlol"].ZIndex = oldlogozindex
			UI["adf"].ZIndex = oldlinezindex
		end
	end)
	function UI:CreateTab(taboptions)
		local Tab = {
			Hover = false,
			Active = false,
			TabFrame = nil,
		}

		-- // StarterGui.BeanzUI.Main.Sidebar.Holder.Inactive \\ --
		Tab["80"] = Instance.new("TextButton", UI["7a"])
		Tab["80"]["AutoButtonColor"] = false
		Tab["80"]["Text"] = [[]]
		Tab["80"]["TextWrapped"] = true
		Tab["80"]["ZIndex"] = 3
		Tab["80"]["BorderSizePixel"] = 0
		Tab["80"]["TextXAlignment"] = Enum.TextXAlignment.Left
		Tab["80"]["TextScaled"] = true
		Tab["80"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Tab["80"]["TextSize"] = 14
		Tab["80"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		Tab["80"]["TextColor3"] = Color3.fromRGB(200, 200, 200)
		Tab["80"]["BackgroundTransparency"] = 1
		Tab["80"]["Size"] = UDim2.new(1, 0, 0.1, 0)
		Tab["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		Tab["80"]["Text"] = taboptions.Name or "Tab"
		Tab["80"]["AutomaticSize"] = Enum.AutomaticSize.None
		Tab["80"]["Name"] = [[Inactive]]
		Tab["80"]["Position"] = UDim2.new(-0, 0, 0.188, 0)

		-- // StarterGui.BeanzUI.Main.Sidebar.Holder.Inactive.UIPadding \\ --
		Tab["81"] = Instance.new("UIPadding", Tab["80"])
		Tab["81"]["PaddingTop"] = UDim.new(0.05, 0)
		Tab["81"]["PaddingLeft"] = UDim.new(0.05, 0)


		-- // StarterGui.BeanzUI.Main.Sidebar.Line \\ --
		Tab["83"] = Instance.new("Frame", Tab["75"])
		Tab["83"]["ZIndex"] = 3
		Tab["83"]["BorderSizePixel"] = 0
		Tab["83"]["BackgroundColor3"] = Color3.fromRGB(204, 204, 204)
		Tab["83"]["Size"] = UDim2.new(0, 1, 1, 0)
		Tab["83"]["Position"] = UDim2.new(0.99788, 0, 0.0047, 0)
		Tab["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		Tab["83"]["Name"] = [[Line]]

		-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame \\ --
		Tab["11"] = Instance.new("ScrollingFrame", UI["10"])
		Tab["11"]["Active"] = true
		Tab["11"]["BorderSizePixel"] = 0
		Tab["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Tab["11"]["Size"] = UDim2.new(1, 0, 1, 0)
		Tab["11"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
		Tab["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		Tab["11"]["BackgroundTransparency"] = 1

		-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.UIListLayout \\ --
		Tab["12"] = Instance.new("UIListLayout", Tab["11"])
		Tab["12"]["Padding"] = UDim.new(0.01, 0)
		Tab["12"]["SortOrder"] = (taboptions.Alphabetical == true and Enum.SortOrder.Name) or Enum.SortOrder.LayoutOrder

		-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.UIPadding \\ --
		Tab["13"] = Instance.new("UIPadding", Tab["11"])
		Tab["13"]["PaddingTop"] = UDim.new(0.01, 0)
		Tab["13"]["PaddingLeft"] = UDim.new(0.01, 0)




		local scrollingFrame = Tab["11"]
		local tabButton = Tab["80"]



		scrollingFrame.Visible = false
		scrollingFrame.Name = taboptions.Name or "ScrollingFrame"


		tabButton.MouseEnter:Connect(function()
			Tab.Hover = true
			if not Tab.Active then
				BeanzUI:Tween(tabButton,nil,  {TextColor3 = Color3.fromRGB(255,255,255)})
			end
		end)

		tabButton.MouseLeave:Connect(function()
			Tab.Hover = false
			if not Tab.Active then
				BeanzUI:Tween(tabButton,nil,  {TextColor3 = Color3.fromRGB(200,200,200)})
			end
		end)

		function Tab:Activate()
			if not Tab.Active then
				Tab.Active = true
				UI.CurrentTab = Tab
				BeanzUI:Tween(tabButton,nil,  {BackgroundTransparency = 0.8})
				BeanzUI:Tween(tabButton,nil,  {TextColor3 = Color3.fromRGB(255,255,255)})
				Tab["11"].Visible = true
			end
		end

		function Tab:SetText(text)
			taboptions.Name = text
			tabButton.Name = text
			tabButton.Text = text
		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				BeanzUI:Tween(tabButton,nil,  {BackgroundTransparency = 1})
				Tab.Hover = false
				BeanzUI:Tween(tabButton,nil,  {TextColor3 = Color3.fromRGB(200,200,200)})
				Tab["11"].Visible = false
			end
		end
		tabButton.MouseButton1Click:Connect(function()
			Tab:Activate()
			for _, tab in UI.Tabs do
				if tab ~= Tab then
					tab:Deactivate()
				end
			end
		end)
		table.insert(UI.Tabs,Tab)
		if UI.CurrentTab == nil then
			Tab:Activate()
		end

		function Tab:Button(buttonoptions)
			local Button = {}

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Button \\ --
			Button["14"] = Instance.new("TextButton", Tab["11"])
			Button["14"]["Text"] = [[]]
			Button["14"]["BorderSizePixel"] = 0
			Button["14"]["BackgroundColor3"] = buttonoptions.Color or Color3.fromRGB(0, 0, 0)
			Button["14"]["AutomaticSize"] = Enum.AutomaticSize.None
			Button["14"]["Size"] = (buttonoptions.Mini and UDim2.new(0.9, 0, 0.04, 0)) or (buttonoptions.Small and UDim2.new(0.9, 0, 0.05, 0)) or UDim2.new(0.9, 0, 0.06, 0)
			Button["14"]["Position"] = UDim2.new(0, 0, 0.0101, 0)
			Button["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Button["14"]["Name"] = buttonoptions.Name or "Button"

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Button.UICorner \\ --
			Button["15"] = Instance.new("UICorner", Button["14"])


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Button.Title \\ --
			Button["16"] = Instance.new("TextLabel", Button["14"])
			Button["16"]["TextWrapped"] = true
			Button["16"]["BorderSizePixel"] = 0
			Button["16"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Button["16"]["TextScaled"] = true
			Button["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Button["16"]["TextSize"] = 14
			Button["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Button["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			Button["16"]["BackgroundTransparency"] = 1
			Button["16"]["Size"] = UDim2.new(1, 0, 0.7, 0)
			Button["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Button["16"]["Text"] = buttonoptions.ButtonText or "Button"
			Button["16"]["AutomaticSize"] = Enum.AutomaticSize.None
			Button["16"]["Name"] = [[Title]]
			Button["16"]["Position"] = UDim2.new(0, 0, 0.15, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Button.Title.UIPadding \\ --
			Button["17"] = Instance.new("UIPadding", Button["16"])
			Button["17"]["PaddingLeft"] = UDim.new(0.05, 0)	
			Button["17"]["PaddingRight"] = UDim.new(0.1, 0)


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Button.Icon \\ --
			Button["19"] = Instance.new("ImageLabel", Button["14"])
			Button["19"]["BorderSizePixel"] = 0
			Button["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Button["19"]["ScaleType"] = Enum.ScaleType.Fit
			Button["19"]["Image"] = [[rbxassetid://91052455220714]]
			Button["19"]["Size"] = UDim2.new(0.07635, 0, 0.71069, 0)
			Button["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Button["19"]["BackgroundTransparency"] = 1
			Button["19"]["Name"] = [[Icon]]
			Button["19"]["Visible"] = true
			Button["19"]["Position"] = UDim2.new(0.87516, 0, 0.13931, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Button.UIStroke \\ --
			Button["1a"] = Instance.new("UIStroke", Button["14"])
			Button["1a"]["Color"] = Color3.fromRGB(154, 154, 154)
			Button["1a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

			local button = Button["14"]
			local title = Button["16"]
			local uistroke = Button["1a"]
			button.MouseButton1Click:Connect(function()
				if buttonoptions.Pressed then
					buttonoptions.Pressed()
				end
				if buttonoptions.Callback then
					buttonoptions.Callback()
					end
			end)

			function Button:SetText(text)
				title.Text = text
			end
			function Button:IsOn()
				return not (uistroke.Color == Color3.fromRGB(154,154,154))
			end
			function Button:Toggle(v)
				if not v then
					if not Button:IsOn() then
						uistroke.Color = Color3.fromRGB(0,170,0)
					else
						uistroke.Color = Color3.fromRGB(154,154,154)
					end
				else
					if v == true then
						uistroke.Color = Color3.fromRGB(0,170,0)
					else
						uistroke.Color = Color3.fromRGB(154,154,154)
					end
				end
			end
			function Button:ToggleVisible(b)
				if b == true then
					button.Visible = true
				elseif b == false then
					button.Visible = false
				else
					button.Visible = not button.Visible
				end
			end
			function Button:SetCallback(fnc)
				buttonoptions.Pressed = fnc
			end
			return Button
		end
		function Tab:Warning(warningoptions)
			local Warning = {}
			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Warning \\ --
			Warning["69"] = Instance.new("Frame", Tab["11"])
			Warning["69"]["BorderSizePixel"] = 0
			Warning["69"]["BackgroundColor3"] = Color3.fromRGB(118, 103, 2)
			Warning["69"]["AutomaticSize"] = Enum.AutomaticSize.Y
			Warning["69"]["Size"] = UDim2.new(0.9, 0, 0.05534, 0)
			Warning["69"]["Position"] = UDim2.new(0, 0, 0.08296, 0)
			Warning["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Warning["69"]["Name"] = [[Warning]]

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Warning.UICorner \\ --
			Warning["6a"] = Instance.new("UICorner", Warning["69"])


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Warning.Title \\ --
			Warning["6b"] = Instance.new("TextLabel", Warning["69"])
			Warning["6b"]["TextWrapped"] = true
			Warning["6b"]["BorderSizePixel"] = 0
			Warning["6b"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Warning["6b"]["TextScaled"] = true
			Warning["6b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Warning["6b"]["TextSize"] = 14
			Warning["6b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Warning["6b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			Warning["6b"]["BackgroundTransparency"] = 1
			Warning["6b"]["Size"] = UDim2.new(1, 0, 0.7, 0)
			Warning["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Warning["6b"]["Text"] = warningoptions.Text
			Warning["6b"]["AutomaticSize"] = Enum.AutomaticSize.Y
			Warning["6b"]["Name"] = [[Title]]
			Warning["6b"]["Position"] = UDim2.new(0, 0, 0.13174, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Warning.Title.UIPadding \\ --
			Warning["6c"] = Instance.new("UIPadding", Warning["6b"])
			Warning["6c"]["PaddingLeft"] = UDim.new(0.05, 0)
			Warning["6c"]["PaddingRight"] = UDim.new(0.05, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Warning.Title.UITextSizeConstraint \\ --
			Warning["6d"] = Instance.new("UITextSizeConstraint", Warning["6b"])
			Warning["6d"]["MaxTextSize"] = 16
			Warning["6d"]["MinTextSize"] = 14

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Warning.UIStroke \\ --
			Warning["6e"] = Instance.new("UIStroke", Warning["69"])
			Warning["6e"]["Color"] = Color3.fromRGB(198, 198, 0)

			local warning = Warning["6b"]
			function Warning:SetText(text)
				warningoptions.Text = text
				warning.Text = text
			end

			function Warning:Toggle(b)
				if b then
					warning.Parent.Visible = true
				else
					warning.Parent.Visible = false
				end
			end

			return Warning
		end
		function Tab:Info(infooptions)
			local Info = {}


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Info \\ --
			Info["63"] = Instance.new("Frame", Tab["11"])
			Info["63"]["BorderSizePixel"] = 0
			Info["63"]["BackgroundColor3"] = Color3.fromRGB(0, 88, 132)
			Info["63"]["AutomaticSize"] = Enum.AutomaticSize.Y
			Info["63"]["Size"] = UDim2.new(0.9, 0, 0.05534, 0)
			Info["63"]["Position"] = UDim2.new(0, 0, 0.08296, 0)
			Info["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Info["63"]["Name"] = [[Info]]

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Info.UICorner \\ --
			Info["64"] = Instance.new("UICorner", Info["63"])


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Info.Title \\ --
			Info["65"] = Instance.new("TextLabel", Info["63"])
			Info["65"]["TextWrapped"] = true
			Info["65"]["BorderSizePixel"] = 0
			Info["65"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Info["65"]["TextScaled"] = true
			Info["65"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Info["65"]["TextSize"] = 14
			Info["65"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Info["65"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			Info["65"]["BackgroundTransparency"] = 1
			Info["65"]["Size"] = UDim2.new(1, 0, 0.7, 0)
			Info["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Info["65"]["Text"] = infooptions.Text
			Info["65"]["AutomaticSize"] = Enum.AutomaticSize.Y
			Info["65"]["Name"] = [[Title]]
			Info["65"]["Position"] = UDim2.new(0, 0, 0.13174, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Info.Title.UIPadding \\ --
			Info["66"] = Instance.new("UIPadding", Info["65"])
			Info["66"]["PaddingLeft"] = UDim.new(0.05, 0)
			Info["66"]["PaddingRight"] = UDim.new(0.05, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Info.Title.UITextSizeConstraint \\ --
			Info["67"] = Instance.new("UITextSizeConstraint", Info["65"])
			Info["67"]["MaxTextSize"] = 16
			Info["67"]["MinTextSize"] = 10

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Info.UIStroke \\ --
			Info["68"] = Instance.new("UIStroke", Info["63"])
			Info["68"]["Color"] = Color3.fromRGB(0, 145, 217)

			local info = Info["65"]
			function Info:SetText(text)
				infooptions.Text = text
				info.Text = text
			end
			function Info:Toggle(b)
				if b then
					info.Parent.Visible = true
				else
					info.Parent.Visible = false
				end
			end
			return Info
		end
		function Tab:Message(messageoptions)
			local Message = {}

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Message \\ --
			Message["6f"] = Instance.new("Frame", Tab["11"])
			Message["6f"]["BorderSizePixel"] = 0
			Message["6f"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37)
			Message["6f"]["AutomaticSize"] = Enum.AutomaticSize.Y
			Message["6f"]["Size"] = UDim2.new(0.9, 0, 0.05534, 0)
			Message["6f"]["Position"] = UDim2.new(0, 0, 0.08296, 0)
			Message["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Message["6f"]["Name"] = [[Message]]

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Message.UICorner \\ --
			Message["70"] = Instance.new("UICorner", Message["6f"])


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Message.Title \\ --
			Message["71"] = Instance.new("TextLabel", Message["6f"])
			Message["71"]["TextWrapped"] = true
			Message["71"]["BorderSizePixel"] = 0
			Message["71"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Message["71"]["TextScaled"] = true
			Message["71"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Message["71"]["TextSize"] = 14
			Message["71"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Message["71"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			Message["71"]["BackgroundTransparency"] = 1
			Message["71"]["Size"] = UDim2.new(1, 0, 0.7, 0)
			Message["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Message["71"]["Text"] = messageoptions.Text
			Message["71"]["AutomaticSize"] = Enum.AutomaticSize.Y
			Message["71"]["Name"] = [[Title]]
			Message["71"]["Position"] = UDim2.new(0, 0, 0.13174, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Message.Title.UIPadding \\ --
			Message["72"] = Instance.new("UIPadding", Message["71"])
			Message["72"]["PaddingLeft"] = UDim.new(0.05, 0)
			Message["72"]["PaddingRight"] = UDim.new(0.05, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Message.Title.UITextSizeConstraint \\ --
			Message["73"] = Instance.new("UITextSizeConstraint", Message["71"])
			Message["73"]["MaxTextSize"] = 16
			Message["73"]["MinTextSize"] = 10

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Message.UIStroke \\ --
			Message["74"] = Instance.new("UIStroke", Message["6f"])
			Message["74"]["Color"] = Color3.fromRGB(154, 154, 154)
			-- // StarterGui.BeanzUI.Main.Sidebar.Holder \\ --
			Message["7a"] = Instance.new("Frame", Message["75"])
			Message["7a"]["BorderSizePixel"] = 0
			Message["7a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Message["7a"]["Size"] = UDim2.new(1, 0, 1, 0)
			Message["7a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Message["7a"]["Name"] = [[Holder]]
			Message["7a"]["BackgroundTransparency"] = 1

			local message = Message["71"]
			function Message:SetText(text)
				messageoptions.Text = text
				message.Text = text
			end
			function Message:Toggle(b)
				if b then
					message.Parent.Visible = true
				else
					message.Parent.Visible = false
				end
			end
			return Message
		end
		function Tab:Slider(slideroptions)
			local Slider = {
				Callback = nil,
				Decimals = 1,
			}

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider \\ --
			Slider["1b"] = Instance.new("Frame", Tab["11"])
			Slider["1b"]["BorderSizePixel"] = 0
			Slider["1b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
			Slider["1b"]["Size"] = UDim2.new(0.9, 0, 0.08, 0)
			Slider["1b"]["Position"] = UDim2.new(0, 0, 0.41186, 0)
			Slider["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Slider["1b"]["Name"] = slideroptions.Name or slideroptions.Text or "Slider"

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.UICorner \\ --
			Slider["1c"] = Instance.new("UICorner", Slider["1b"])


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.Title \\ --
			Slider["1d"] = Instance.new("TextLabel", Slider["1b"])
			Slider["1d"]["TextWrapped"] = true
			Slider["1d"]["BorderSizePixel"] = 0
			Slider["1d"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Slider["1d"]["TextScaled"] = true
			Slider["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Slider["1d"]["TextSize"] = 14
			Slider["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Slider["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			Slider["1d"]["BackgroundTransparency"] = 1
			Slider["1d"]["Size"] = UDim2.new(1, 0, 0.45282, 0)
			Slider["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Slider["1d"]["Text"] = slideroptions.Text
			Slider["1d"]["AutomaticSize"] = Enum.AutomaticSize.None
			Slider["1d"]["Name"] = [[Title]]
			Slider["1d"]["Position"] = UDim2.new(0, 0, 0.15, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.Title.UIPadding \\ --
			Slider["1e"] = Instance.new("UIPadding", Slider["1d"])
			Slider["1e"]["PaddingLeft"] = UDim.new(0.05, 0)


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.UIStroke \\ --
			Slider["20"] = Instance.new("UIStroke", Slider["1b"])
			Slider["20"]["Color"] = Color3.fromRGB(154, 154, 154)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.Number \\ --
			Slider["21"] = Instance.new("TextBox", Slider["1b"])
			Slider["21"]["TextWrapped"] = true
			Slider["21"]["BorderSizePixel"] = 0
			Slider["21"]["TextScaled"] = true
			Slider["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Slider["21"]["TextSize"] = 14
			Slider["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Slider["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			Slider["21"]["BackgroundTransparency"] = 1
			Slider["21"]["Size"] = UDim2.new(0.12762, 0, 0.48197, 0)
			Slider["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Slider["21"]["Text"] = [[60]]
			Slider["21"]["AutomaticSize"] = Enum.AutomaticSize.None
			Slider["21"]["Name"] = [[Number]]
			Slider["21"]["Position"] = UDim2.new(0.85101, 0, 0.12085, 0)


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.SliderBackground \\ --
			Slider["23"] = Instance.new("TextButton", Slider["1b"])
			Slider["23"]["BorderSizePixel"] = 0
			Slider["23"]["AutoButtonColor"] = false
			Slider["23"]["Text"] = [[]]
			Slider["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Slider["23"]["Size"] = UDim2.new(0.92981, 0, 0.2, 0)
			Slider["23"]["Position"] = UDim2.new(0.03509, 0, 0.7, 0)
			Slider["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Slider["23"]["Name"] = [[SliderBackground]]
			Slider["23"]["BackgroundTransparency"] = 1

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.SliderBackground.UICorner \\ --
			Slider["24"] = Instance.new("UICorner", Slider["23"])
			Slider["24"]["CornerRadius"] = UDim.new(1, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.SliderBackground.UIStroke \\ --
			Slider["25"] = Instance.new("UIStroke", Slider["23"])
			Slider["25"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			Slider["25"]["Color"] = Color3.fromRGB(141, 141, 141)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.SliderBackground.Bar \\ --
			Slider["26"] = Instance.new("Frame", Slider["23"])
			Slider["26"]["BorderSizePixel"] = 0
			Slider["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Slider["26"]["Size"] = UDim2.new(0.6, 0, 1, 0)
			Slider["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Slider["26"]["Name"] = [[Bar]]

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Slider.SliderBackground.Bar.UICorner \\ --
			Slider["27"] = Instance.new("UICorner", Slider["26"])
			Slider["27"]["CornerRadius"] = UDim.new(1, 0)

			local sliderBackground = Slider["23"]
			local sliderBar = Slider["26"]
			local sliderNumber = Slider["21"]

			local percentage
			local value

			if slideroptions.Decimals then
				Slider.Decimals = 10 ^ slideroptions.Decimals
			end
			-- Sets the value of the slider
			function Slider:SetValue(v:number)
				if not v then
					percentage = math.clamp((mouse.X - sliderBackground.AbsolutePosition.X) / (sliderBackground.AbsoluteSize.X),0,1)
				else
					percentage = v / slideroptions.max
				end
				value = math.floor((((slideroptions.max - slideroptions.min)* percentage) + slideroptions.min)* Slider.Decimals)
				value /= Slider.Decimals
				value = math.clamp(value,slideroptions.min,slideroptions.max)
				percentage = math.clamp(percentage,0,1)
				sliderNumber.Text = tostring(value)
				sliderBar.Size = UDim2.fromScale(percentage,1)
			end

			function Slider:GetValue()
				return tonumber(value) or 0
			end

			function Slider:SetCallback(fnc,decimals)
				slideroptions.Callback = fnc
				if decimals then
					Slider.Decimals = 10 ^ decimals
				end
			end

			sliderBackground.MouseButton1Down:Connect(function()
				Slider.Held = true
			end)

			sliderNumber.FocusLost:Connect(function()
				Slider:SetValue(tonumber(sliderNumber.Text) or 0)
			end)
			sliderBackground.MouseButton1Up:Connect(function()
				Slider.Held = false
				if slideroptions.Callback then
					slideroptions.Callback()
				end
			end)

			sliderBackground.Parent.MouseMoved:Connect(function()
				if not Slider.Held then return end
				Slider:SetValue()
			end)

			sliderBackground.Parent.MouseLeave:Connect(function()
				Slider.Held = false
				if slideroptions.Callback then
					slideroptions.Callback()
				end
			end)
			Slider:SetValue(0)
			return Slider
		end
		function Tab:Dropdown(dropdownoptions)
			local Dropdown = {
				Selected = nil,
				Closed = true,
			}


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown \\ --
			Dropdown["28"] = Instance.new("TextButton", Tab["11"])
			Dropdown["28"]["BorderSizePixel"] = 0
			Dropdown["28"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdown["28"]["ClipsDescendants"] = true
			Dropdown["28"]["Size"] = UDim2.new(0.9, 0, 0.2376, 0)
			Dropdown["28"]["Position"] = UDim2.new(0, 0, 0.24976, 0)
			Dropdown["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdown["28"]["Name"] = [[Dropdown]]
			Dropdown["28"]["Text"] = [[]]
			Dropdown["28"]["AutoButtonColor"] = false
			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.UICorner \\ --
			Dropdown["29"] = Instance.new("UICorner", Dropdown["28"])


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Title \\ --
			Dropdown["2a"] = Instance.new("TextLabel", Dropdown["28"])
			Dropdown["2a"]["TextWrapped"] = true
			Dropdown["2a"]["BorderSizePixel"] = 0
			Dropdown["2a"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Dropdown["2a"]["TextScaled"] = true
			Dropdown["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdown["2a"]["TextSize"] = 14
			Dropdown["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Dropdown["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdown["2a"]["BackgroundTransparency"] = 1
			Dropdown["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Dropdown["2a"]["Size"] = UDim2.new(1, 0, 0.18954, 0)
			Dropdown["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdown["2a"]["Text"] = dropdownoptions.Name
			Dropdown["2a"]["AutomaticSize"] = Enum.AutomaticSize.None
			Dropdown["2a"]["Name"] = [[Title]]
			Dropdown["2a"]["Position"] = UDim2.new(0.5, 0, 0.15762, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Title.UIPadding \\ --
			Dropdown["2b"] = Instance.new("UIPadding", Dropdown["2a"])
			Dropdown["2b"]["PaddingLeft"] = UDim.new(0.05, 0)


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Icon \\ --
			Dropdown["2d"] = Instance.new("ImageLabel", Dropdown["28"])
			Dropdown["2d"]["BorderSizePixel"] = 0
			Dropdown["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdown["2d"]["ScaleType"] = Enum.ScaleType.Fit
			Dropdown["2d"]["Image"] = [[rbxassetid://107003984522008]]
			Dropdown["2d"]["Size"] = UDim2.new(0.07635, 0, 0.18778, 0)
			Dropdown["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdown["2d"]["BackgroundTransparency"] = 1
			Dropdown["2d"]["Rotation"] = 90
			Dropdown["2d"]["Name"] = [[Icon]]
			Dropdown["2d"]["Position"] = UDim2.new(0.87516, 0, 0.05838, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.UIStroke \\ --
			Dropdown["2e"] = Instance.new("UIStroke", Dropdown["28"])
			Dropdown["2e"]["Color"] = Color3.fromRGB(154, 154, 154)
			Dropdown["2e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Options \\ --
			Dropdown["2f"] = Instance.new("ScrollingFrame", Dropdown["28"])
			Dropdown["2f"]["BorderSizePixel"] = 0
			Dropdown["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdown["2f"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Dropdown["2f"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
			Dropdown["2f"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
			Dropdown["2f"]["Size"] = UDim2.new(0.95, 0, 0.7, 0)
			Dropdown["2f"]["Position"] = UDim2.new(0.5, 0, 0.6005, 0)
			Dropdown["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdown["2f"]["Name"] = [[Options]]
			Dropdown["2f"]["BackgroundTransparency"] = 1
			Dropdown["2f"]["AutomaticSize"] = Enum.AutomaticSize.None

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Options.UIListLayout \\ --
			Dropdown["30"] = Instance.new("UIListLayout", Dropdown["2f"])
			Dropdown["30"]["Padding"] = UDim.new(0.05, 0)
			Dropdown["30"]["SortOrder"] = Enum.SortOrder.LayoutOrder

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Options.UIPadding \\ --
			Dropdown["34"] = Instance.new("UIPadding", Dropdown["2f"])
			Dropdown["34"]["PaddingTop"] = UDim.new(0.1, 0)


			-- // StarterGui.bruhnpp.Main.TabHolder.Autofarm.Dropdown.TextBox \\ --
			Dropdown["37"] = Instance.new("TextBox", Dropdown["28"])
			Dropdown["37"]["CursorPosition"] = -1
			Dropdown["37"]["Active"] = false
			Dropdown["37"]["Interactable"] = false
			Dropdown["37"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdown["37"]["PlaceholderColor3"] = Color3.fromRGB(113, 113, 113)
			Dropdown["37"]["BorderSizePixel"] = 0
			Dropdown["37"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Dropdown["37"]["TextWrapped"] = true
			Dropdown["37"]["TextSize"] = 14
			Dropdown["37"]["TextScaled"] = true
			Dropdown["37"]["BackgroundColor3"] = Color3.fromRGB(186, 186, 186)
			Dropdown["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Dropdown["37"]["ClearTextOnFocus"] = false
			Dropdown["37"]["PlaceholderText"] = [[]]
			Dropdown["37"]["Size"] = UDim2.new(0.90372, 0, 0.37501, 0)
			Dropdown["37"]["Position"] = UDim2.new(0.05, 0, 0.55, 0)
			Dropdown["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdown["37"]["Text"] = [[]]

			-- // StarterGui.bruhnpp.Main.TabHolder.Autofarm.Dropdown.TextBox.UIStroke \\ --
			Dropdown["38"] = Instance.new("UIStroke", Dropdown["37"])
			Dropdown["38"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			Dropdown["38"]["Color"] = Color3.fromRGB(255, 255, 255)

			-- // StarterGui.bruhnpp.Main.TabHolder.Autofarm.Dropdown.TextBox.UIPadding \\ --
			Dropdown["39"] = Instance.new("UIPadding", Dropdown["37"])
			Dropdown["39"]["PaddingLeft"] = UDim.new(0.05, 0)

			-- // StarterGui.bruhnpp.Main.TabHolder.Autofarm.Dropdown.TextBox.UICorner \\ --
			Dropdown["3a"] = Instance.new("UICorner", Dropdown["37"])

			local dropdown = Dropdown["28"]
			dropdown.ClipsDescendants = true
			local text = Dropdown["2a"]
			local arrow = Dropdown["2d"]
			local selectedtext = Dropdown["37"]

			local dropdownclosedsize = UDim2.fromScale(0.9,0.09326)
			local dropdownclosedtextsize = UDim2.fromScale(1,0.4)
			local dropdownclosedtextposition = UDim2.fromScale(0.5,0.3)
			local arrowclosedsize = UDim2.fromScale(0.07881, 1.18696)
			local arrowclosedposition = UDim2.fromScale(0.87213,-0.3)


			local dropdownopensize = UDim2.fromScale(dropdown.Size.X.Scale,dropdown.Size.Y.Scale)
			local dropdownopentextsize = UDim2.fromScale(text.Size.X.Scale,text.Size.Y.Scale)
			local dropdownopentextposition = UDim2.fromScale(text.Position.X.Scale,text.Position.Y.Scale)
			local arrowopensize = UDim2.fromScale(arrow.Size.X.Scale,arrow.Size.Y.Scale)
			local arrowopenposition = UDim2.fromScale(arrow.Position.X.Scale,arrow.Position.Y.Scale)

			dropdown.Size = dropdownclosedsize
			text.Size = dropdownclosedtextsize
			text.Position = dropdownclosedtextposition
			arrow.Size = arrowclosedsize
			arrow.Position = arrowclosedposition

			local debounce = false

			local function toggledropdown()
				if debounce then return end
				debounce = true
				dropdown.Options.Visible = false
				dropdown.TextBox.Visible = true
				if not Dropdown.Closed then
					BeanzUI:Tween(dropdown,nil,{Size = dropdownclosedsize},function()
						Dropdown.Closed = true
						debounce = false
					end)
					BeanzUI:Tween(text,nil,{Size = dropdownclosedtextsize, Position = dropdownclosedtextposition})
					BeanzUI:Tween(arrow,nil,{Size = arrowclosedsize, Position = arrowclosedposition, Rotation = 90})
				else
					dropdown.TextBox.Visible = false
					BeanzUI:Tween(dropdown,nil,{Size = dropdownopensize},function()
						dropdown.Options.Visible = true
						Dropdown.Closed = false
						debounce = false
					end)

					BeanzUI:Tween(text,nil,{Size = dropdownopentextsize, Position = dropdownopentextposition})
					BeanzUI:Tween(arrow,nil,{Size = arrowopensize, Position = arrowopenposition, Rotation = -90})
				end
			end

			function Dropdown:Select(buzzon)
				for _, button in dropdown.Options:GetChildren() do
					if button:IsA("TextButton") then
						button.UIStroke.Enabled = false
					end
				end
				buzzon.UIStroke.Enabled = true
				Dropdown.Selected = buzzon
				selectedtext.PlaceholderText = buzzon.Name
				toggledropdown()
			end
			function Dropdown:Default(option)
				for _, button in dropdown.Options:GetChildren() do
					if button:IsA("TextButton") then
						button.UIStroke.Enabled = false
					end
				end
				option:GetButton().UIStroke.Enabled = true
				selectedtext.PlaceholderText = option:GetButton().Name
				Dropdown.Selected = option:GetButton()
			end

			function Dropdown:GetOption()
				if Dropdown.Selected then
					return Dropdown.Selected.Name
				end
				return nil
			end

			function Dropdown:Option(option)
				local Option = {}


				-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Options.Option1 \\ --
				Option["31"] = Instance.new("TextButton", Dropdown["2f"])
				Option["31"]["TextWrapped"] = true
				Option["31"]["BorderSizePixel"] = 0
				Option["31"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Option["31"]["TextScaled"] = true
				Option["31"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55)
				Option["31"]["TextSize"] = 14
				Option["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
				Option["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Option["31"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
				Option["31"]["Size"] = UDim2.new(0.9, 0, 0.24645, 0)
				Option["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
				Option["31"]["Text"] = option.Name
				Option["31"]["AutomaticSize"] = Enum.AutomaticSize.None
				Option["31"]["Name"] = option.Name
				Option["31"]["Position"] = UDim2.new(0.5, 0, 0.12323, 0)

				-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Options.Option1.UIPadding \\ --
				Option["32"] = Instance.new("UIPadding", Option["31"])
				Option["32"]["PaddingLeft"] = UDim.new(0.05, 0)

				-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Dropdown.Options.Option1.UICorner \\ --
				Option["33"] = Instance.new("UICorner", Option["31"])
				Option["33"]["CornerRadius"] = UDim.new(1, 0)

				-- manual uistroke
				Option["34"] = Instance.new("UIStroke", Option["31"])
				Option["34"]["Enabled"] = false
				Option["34"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
				Option["34"]["Thickness"] = 2
				Option["34"]["Color"] = Color3.fromRGB(153,153,153)	
				local button = Option["31"]
				button.MouseButton1Click:Connect(function()
					Dropdown:Select(button)
				end)

				function Option:GetButton()
					return button
				end


				return Option
			end
			dropdown.Options.Visible = false	
			dropdown.MouseButton1Click:Connect(toggledropdown)
			return Dropdown
		end

		function Tab:Toggle(toggleoptions)
			local Toggle = {
				Locked = false
			}

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Toggle \\ --
			Toggle["51"] = Instance.new("TextButton", Tab["11"])
			Toggle["51"]["BorderSizePixel"] = 0
			Toggle["51"]["BackgroundColor3"] = toggleoptions.Color or Color3.fromRGB(0, 0, 0)
			Toggle["51"]["Size"] = (toggleoptions.Mini and UDim2.new(0.9, 0, 0.04, 0)) or (toggleoptions.Small and UDim2.new(0.9, 0, 0.05, 0)) or UDim2.new(0.9, 0, 0.06, 0)
			Toggle["51"]["Position"] = UDim2.new(0, 0, 0.0101, 0)
			Toggle["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Toggle["51"]["Name"] = [[Toggle]]

			Toggle["51"]["Text"] = [[]]

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Toggle.UICorner \\ --
			Toggle["52"] = Instance.new("UICorner", Toggle["51"])


			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Toggle.Title \\ --
			Toggle["53"] = Instance.new("TextLabel", Toggle["51"])
			Toggle["53"]["TextWrapped"] = true
			Toggle["53"]["BorderSizePixel"] = 0
			Toggle["53"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Toggle["53"]["TextScaled"] = true
			Toggle["53"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Toggle["53"]["TextSize"] = 14
			Toggle["53"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Toggle["53"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			Toggle["53"]["BackgroundTransparency"] = 1
			Toggle["53"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Toggle["53"]["Size"] = UDim2.new(1, 0, 0.7, 0)
			Toggle["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Toggle["53"]["Text"] = toggleoptions.Text
			Toggle["53"]["AutomaticSize"] = Enum.AutomaticSize.None
			Toggle["53"]["Name"] = [[Title]]
			Toggle["53"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Toggle.Title.UIPadding \\ --
			Toggle["54"] = Instance.new("UIPadding", Toggle["53"])
			Toggle["54"]["PaddingLeft"] = UDim.new(0.05, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Toggle.UIStroke \\ --
			Toggle["56"] = Instance.new("UIStroke", Toggle["51"])
			Toggle["56"]["Color"] = Color3.fromRGB(154, 154, 154)
			Toggle["56"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Toggle.Bool \\ --
			Toggle["57"] = Instance.new("Frame", Toggle["51"])
			Toggle["57"]["BorderSizePixel"] = 0
			Toggle["57"]["BackgroundColor3"] = Color3.fromRGB(20, 255, 8)
			Toggle["57"]["Size"] = UDim2.new(0.05914, 0, 0.61915, 0)
			Toggle["57"]["Position"] = UDim2.new(0.88391, 0, 0.18468, 0)
			Toggle["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Toggle["57"]["Name"] = [[Bool]]

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Toggle.Bool.UICorner \\ --
			Toggle["58"] = Instance.new("UICorner", Toggle["57"])
			Toggle["58"]["CornerRadius"] = UDim.new(0.2, 0)

			-- // StarterGui.BeanzUI.Main.TabHolder.ScrollingFrame.Toggle.Bool.UIStroke \\ --
			Toggle["59"] = Instance.new("UIStroke", Toggle["57"])
			Toggle["59"]["Thickness"] = 1.1
			Toggle["59"]["Color"] = Color3.fromRGB(255, 255, 255)

			Toggle["60"] = Instance.new("UIAspectRatioConstraint",Toggle["57"])

			local button = Toggle["51"]
			local status = Toggle["57"]


			function Toggle:SetCallback(fnc)
				Toggle.ChangedCallback = fnc
			end

			if toggleoptions.Toggled == false then
				status.BackgroundTransparency = 1
			else
				status.BackgroundTransparency = 0
			end
			button.MouseButton1Click:Connect(function()
				if Toggle.Locked == false then
					if status.BackgroundTransparency == 1 then
						status.BackgroundTransparency = 0
					else
						status.BackgroundTransparency = 1
					end
				end
				if Toggle.ChangedCallback then
					Toggle.ChangedCallback()
				end
			end)
			function Toggle:IsToggled()
				return status.BackgroundTransparency == 0
			end
			function Toggle:Toggle(v)
				if v ~= nil then
					if v == true then
						status.BackgroundTransparency = 0
					else
						status.BackgroundTransparency = 1
					end
				else
					if status.BackgroundTransparency == 1 then
						status.BackgroundTransparency = 0
					else
						status.BackgroundTransparency = 1
					end
				end
				if Toggle.ChangedCallback then
					Toggle.ChangedCallback()
				end
			end
			function Toggle:Lock()
				Toggle.Locked = true
			end
			function Toggle:Unlock()
				Toggle.Locked = false
			end
			function Toggle:IsLocked()
				return Toggle.Locked
			end
			return Toggle
		end

		function Tab:TextBox(textboxoptions)
			local TextBox = {}

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox \\ --
			TextBox["75"] = Instance.new("Frame", Tab["11"])
			TextBox["75"]["BorderSizePixel"] = 0
			TextBox["75"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["75"]["Size"] = UDim2.new(0.9, 0, 0.06377, 0)
			TextBox["75"]["BackgroundColor3"] = textboxoptions.Color or Color3.fromRGB(0, 0, 0)
			TextBox["75"]["Position"] = UDim2.new(0, 0, 0.51186, 0)
			TextBox["75"]["BorderColor3"] = Color3.new(0,0,0)
			TextBox["75"]["Name"] = [[TextBox]]

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox.UICorner \\ --
			TextBox["76"] = Instance.new("UICorner", TextBox["75"])


			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox.Title \\ --
			TextBox["77"] = Instance.new("TextLabel", TextBox["75"])
			TextBox["77"]["TextWrapped"] = true
			TextBox["77"]["BorderSizePixel"] = 0
			TextBox["77"]["TextXAlignment"] = Enum.TextXAlignment.Left
			TextBox["77"]["TextScaled"] = true
			TextBox["77"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TextBox["77"]["TextSize"] = 14
			TextBox["77"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			TextBox["77"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			TextBox["77"]["BackgroundTransparency"] = 1
			TextBox["77"]["Size"] = UDim2.new(1, 0, 0.5, 0)
			TextBox["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["77"]["Text"] = textboxoptions.Text or "Textbox"
			TextBox["77"]["Name"] = [[Title]]
			TextBox["77"]["Position"] = UDim2.new(0, 0, 0.26446, 0)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox.Title.UIPadding \\ --
			TextBox["78"] = Instance.new("UIPadding", TextBox["77"])
			TextBox["78"]["PaddingLeft"] = UDim.new(0.05, 0)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox.UIStroke \\ --
			TextBox["79"] = Instance.new("UIStroke", TextBox["75"])
			TextBox["79"]["Color"] = Color3.fromRGB(154, 154, 154)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox.TextBox \\ --
			TextBox["7a"] = Instance.new("TextBox", TextBox["75"])
			TextBox["7a"]["CursorPosition"] = -1
			TextBox["7a"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["7a"]["BorderSizePixel"] = 0
			TextBox["7a"]["TextXAlignment"] = Enum.TextXAlignment.Left
			TextBox["7a"]["TextWrapped"] = true
			TextBox["7a"]["TextSize"] = 14
			TextBox["7a"]["PlaceholderText"] = textboxoptions.PlaceholderText or "Placeholder"
			TextBox["7a"]["PlaceholderColor3"] = Color3.new(0.443137, 0.443137, 0.443137)
			TextBox["7a"]["TextScaled"] = true
			TextBox["7a"]["ClearTextOnFocus"] = false
			TextBox["7a"]["BackgroundColor3"] = Color3.fromRGB(185, 185, 185)
			TextBox["7a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			TextBox["7a"]["Size"] = UDim2.new(0.52197, 0, 0.71728, 0)
			TextBox["7a"]["Position"] = UDim2.new(0.45527, 0, 0.13354, 0)
			TextBox["7a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["7a"]["Text"] = [[]]

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox.TextBox.UIStroke \\ --
			TextBox["7b"] = Instance.new("UIStroke", TextBox["7a"])
			TextBox["7b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			TextBox["7b"]["Color"] = Color3.fromRGB(255, 255, 255)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox.TextBox.UICorner \\ --
			TextBox["7c"] = Instance.new("UICorner", TextBox["7a"])


			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.TextBox.TextBox.UIPadding \\ --
			TextBox["7d"] = Instance.new("UIPadding", TextBox["7a"])
			TextBox["7d"]["PaddingLeft"] = UDim.new(0.05, 0)
			local button = TextBox["75"]
			local textbox = TextBox["7a"]

			function TextBox:ToggleVisible(b)
				if b == true then
					button.Visible = true
				elseif b == false then
					button.Visible = false
				else
					button.Visible = not button.Visible
				end
			end
			function TextBox:GetText()
				return textbox.Text
			end
			function TextBox:SetCallback(fnc)
				TextBox.Callback = fnc
			end
			textbox.FocusLost:Connect(function(enterpressed)
				if TextBox.Callback then
					TextBox.Callback()
				end
			end)
			function TextBox:SetText(text)
				textbox.Text = text
			end
			return TextBox
		end

		function Tab:BindButton(options)
			local BindButton = {}

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind \\ --
			BindButton["92"] = Instance.new("Frame", Tab["11"])
			BindButton["92"]["BorderSizePixel"] = 0
			BindButton["92"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
			BindButton["92"]["Size"] = UDim2.new(0.9, 0, 0.07, 0)
			BindButton["92"]["Position"] = UDim2.new(0, 0, 0.51186, 0)
			BindButton["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			BindButton["92"]["Name"] = [[ButtonBind]]

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind.UICorner \\ --
			BindButton["93"] = Instance.new("UICorner", BindButton["92"])


			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind.Title \\ --
			BindButton["94"] = Instance.new("TextLabel", BindButton["92"])
			BindButton["94"]["TextWrapped"] = true
			BindButton["94"]["BorderSizePixel"] = 0
			BindButton["94"]["TextXAlignment"] = Enum.TextXAlignment.Left
			BindButton["94"]["TextScaled"] = true
			BindButton["94"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			BindButton["94"]["TextSize"] = 14
			BindButton["94"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			BindButton["94"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			BindButton["94"]["BackgroundTransparency"] = 1
			BindButton["94"]["Size"] = UDim2.new(1, 0, 0.45282, 0)
			BindButton["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			BindButton["94"]["Text"] = options.Name or [[CustomBind]]
			BindButton["94"]["Name"] = [[Title]]
			BindButton["94"]["Position"] = UDim2.new(0, 0, 0.26446, 0)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind.Title.UIPadding \\ --
			BindButton["95"] = Instance.new("UIPadding", BindButton["94"])
			BindButton["95"]["PaddingLeft"] = UDim.new(0.05, 0)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind.UIStroke \\ --
			BindButton["96"] = Instance.new("UIStroke", BindButton["92"])
			BindButton["96"]["Color"] = Color3.fromRGB(154, 154, 154)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind.TextBox \\ --
			BindButton["97"] = Instance.new("TextButton", BindButton["92"])
			BindButton["97"]["TextWrapped"] = true
			BindButton["97"]["BorderSizePixel"] = 0
			BindButton["97"]["TextSize"] = 14
			BindButton["97"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			BindButton["97"]["TextScaled"] = true
			BindButton["97"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255)
			BindButton["97"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			BindButton["97"]["Size"] = UDim2.new(0.17467, 0, 0.71728, 0)
			BindButton["97"]["Name"] = [[TextBox]]
			BindButton["97"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			BindButton["97"]["Text"] = [[Move]]
			BindButton["97"]["Position"] = UDim2.new(0.80257, 0, 0.13354, 0)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind.TextBox.UIStroke \\ --
			BindButton["98"] = Instance.new("UIStroke", BindButton["97"])
			BindButton["98"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			BindButton["98"]["Thickness"] = 0.8
			BindButton["98"]["Color"] = Color3.fromRGB(255, 255, 255)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind.TextBox.UICorner \\ --
			BindButton["99"] = Instance.new("UICorner", BindButton["97"])


			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.ButtonBind.TextBox.UIPadding \\ --
			BindButton["9a"] = Instance.new("UIPadding", BindButton["97"])
			BindButton["9a"]["PaddingLeft"] = UDim.new(0.05, 0)


			-- // StarterGui.skullissuesifuusethis.MobileLock \\ --
			BindButton["ba"] = Instance.new("TextButton", UI["1"])
			BindButton["ba"]["TextWrapped"] = true
			BindButton["ba"]["Visible"] = options.Visible
			BindButton["ba"]["BorderSizePixel"] = 0
			BindButton["ba"]["TextSize"] = 14
			BindButton["ba"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			BindButton["ba"]["TextScaled"] = true
			BindButton["ba"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			BindButton["ba"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			BindButton["ba"]["Size"] = UDim2.new(0.05, 0, 0.08961, 0)
			BindButton["ba"]["Name"] = [[MobileLock]]
			BindButton["ba"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			BindButton["ba"]["Text"] = options.Text or [[Lock]]
			BindButton["ba"]["Position"] = UDim2.new(0.66912, 0, 0.67579, 0)

			-- // StarterGui.skullissuesifuusethis.MobileLock.UICorner \\ --
			BindButton["bb"] = Instance.new("UICorner", BindButton["ba"])
			BindButton["bb"]["CornerRadius"] = UDim.new(1, 0)

			-- // StarterGui.skullissuesifuusethis.MobileLock.UIAspectRatioConstraint \\ --
			BindButton["bc"] = Instance.new("UIAspectRatioConstraint", BindButton["ba"])
			BindButton["bc"]["AspectRatio"] = 0.99777

			local mover = nil
			BindButton["97"].MouseButton1Click:Connect(function()
				if BindButton["97"]["BackgroundColor3"] == Color3.fromRGB(0, 0, 255) then
					BindButton["97"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 127)
					BindButton["ba"]["Position"] = UDim2.new(0.66912, 0, 0.67579, 0)
					if mover then mover:Destroy() end
					mover = Instance.new("UIDragDetector")
					mover.Parent = BindButton["ba"]
				else
					BindButton["97"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255)
					mover:Destroy()
				end
			end)
			function BindButton:GetButton()
				return BindButton["ba"]
			end
			function BindButton:ToggleVisible(v)
				if v == true then
					BindButton["ba"]["Visible"] = true
				elseif v == false then
					BindButton["ba"]["Visible"] = false
				else
					BindButton["ba"]["Visible"] = not BindButton["b5"]["Visible"]
				end
			end
			return BindButton
		end
		function Tab:BindKey(options)
			local KeyBind = {
				Callback = nil,
				IsKey = false,
				UseProc = false,
			}
			if #options.Bind == 1 then
				KeyBind.IsKey = true
			end
			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind \\ --
			KeyBind["92"] = Instance.new("Frame", Tab["11"])
			KeyBind["92"]["BorderSizePixel"] = 0
			KeyBind["92"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
			KeyBind["92"]["Size"] = UDim2.new(0.9, 0, 0.07, 0)
			KeyBind["92"]["Position"] = UDim2.new(0, 0, 0.51186, 0)
			KeyBind["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			KeyBind["92"]["Name"] = (options.Name or "Keybind")

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind.UICorner \\ --
			KeyBind["93"] = Instance.new("UICorner", KeyBind["92"])


			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind.Title \\ --
			KeyBind["94"] = Instance.new("TextLabel", KeyBind["92"])
			KeyBind["94"]["TextWrapped"] = true
			KeyBind["94"]["BorderSizePixel"] = 0
			KeyBind["94"]["TextXAlignment"] = Enum.TextXAlignment.Left
			KeyBind["94"]["TextScaled"] = true
			KeyBind["94"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			KeyBind["94"]["TextSize"] = 14
			KeyBind["94"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			KeyBind["94"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
			KeyBind["94"]["BackgroundTransparency"] = 1
			KeyBind["94"]["Size"] = UDim2.new(1, 0, 0.45282, 0)
			KeyBind["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			KeyBind["94"]["Text"] = options.Name or "Keybind"
			KeyBind["94"]["Name"] = [[Title]]
			KeyBind["94"]["Position"] = UDim2.new(0, 0, 0.26446, 0)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind.Title.UIPadding \\ --
			KeyBind["95"] = Instance.new("UIPadding", KeyBind["94"])
			KeyBind["95"]["PaddingLeft"] = UDim.new(0.05, 0)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind.UIStroke \\ --
			KeyBind["96"] = Instance.new("UIStroke", KeyBind["92"])
			KeyBind["96"]["Color"] = Color3.fromRGB(154, 154, 154)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind.TextBox \\ --
			KeyBind["97"] = Instance.new("TextBox", KeyBind["92"])
			KeyBind["97"]["CursorPosition"] = -1
			KeyBind["97"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			KeyBind["97"]["BorderSizePixel"] = 0
			KeyBind["97"]["TextWrapped"] = true
			KeyBind["97"]["TextSize"] = 14
			KeyBind["97"]["TextScaled"] = true
			KeyBind["97"]["BackgroundColor3"] = Color3.fromRGB(185, 185, 185)
			KeyBind["97"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			KeyBind["97"]["PlaceholderText"] = options.Placeholder or [[Bind]]
			KeyBind["97"]["Size"] = UDim2.new(0.17467, 0, 0.71728, 0)
			KeyBind["97"]["Position"] = UDim2.new(0.80257, 0, 0.13354, 0)
			KeyBind["97"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			KeyBind["97"]["Text"] = options.Bind or [[]]
			KeyBind.Bind = options.Bind

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind.TextBox.UIStroke \\ --
			KeyBind["98"] = Instance.new("UIStroke", KeyBind["97"])
			KeyBind["98"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			KeyBind["98"]["Color"] = Color3.fromRGB(255, 255, 255)

			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind.TextBox.UICorner \\ --
			KeyBind["99"] = Instance.new("UICorner", KeyBind["97"])


			-- // StarterGui.test.Main.TabHolder.ScrollingFrame.KeyBind.TextBox.UIPadding \\ --
			KeyBind["9a"] = Instance.new("UIPadding", KeyBind["97"])
			KeyBind["9a"]["PaddingLeft"] = UDim.new(0.05, 0)
			local focused = false

			KeyBind["97"].Focused:Connect(function()
				task.wait(0.01)
				focused = true
			end)
			KeyBind["97"].FocusLost:Connect(function()
				task.wait(0.01)
				focused = false
			end)
			uis.InputBegan:Connect(function(input, proc)
				if focused == true then
					if input.UserInputType == Enum.UserInputType.Keyboard then
						if input.KeyCode ~= Enum.KeyCode.Escape then
							KeyBind["97"].Text = input.KeyCode.Name
							KeyBind.Bind = input.KeyCode.Name
							KeyBind.IsKey = true
						end
						KeyBind["97"]:ReleaseFocus()
					elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
						KeyBind["97"].Text = "LMB"
						KeyBind["97"]:ReleaseFocus()
						KeyBind.IsKey = false
						KeyBind.Bind = "MouseButton1"
					elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
						KeyBind.IsKey = false
						KeyBind["97"].Text = "RMB"
						KeyBind.Bind = "MouseButton2"
						KeyBind["97"]:ReleaseFocus()
					elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
						KeyBind.IsKey = false
						KeyBind["97"].Text = "MMB"
						KeyBind.Bind = "MouseButton3"
						KeyBind["97"]:ReleaseFocus()
					else
						KeyBind["97"]:ReleaseFocus()
					end


					focused	= false
				else
					if proc and KeyBind.UseProc then return end
					if KeyBind.IsKey then
						if input.KeyCode.Name == KeyBind.Bind then
							if KeyBind.Callback then
								KeyBind:Callback()
							end
						end
					else
						if input.UserInputType == Enum.UserInputType[KeyBind.Bind] then
							if KeyBind.Callback then
								KeyBind:Callback()
							end
						end
					end
				end
			end)
			function KeyBind:SetCallback(fnc,proc)
				KeyBind.UseProc = proc
				KeyBind.Callback = fnc
			end
			function KeyBind:GetBind()
				return KeyBind.Bind
			end
			return KeyBind
		end

		return Tab
	end
	function  UI:Drawing(drawingoptions)

		local Drawing = {}
		if drawingoptions.Type == "Circle" then
			if not tonumber(drawingoptions.Size) then
				drawingoptions.Size = 0.1
			end
			-- // StarterGui.skullissuesifuusethis.MouseFrame \\ --
			Drawing["b5"] = Instance.new("Frame", UI["1"])
			Drawing["b5"]["BorderSizePixel"] = 0
			Drawing["b5"]["BackgroundColor3"] = Color3.fromRGB(0,0,0)
			Drawing["b5"]["AnchorPoint"] = Vector2.new(.5,.5)
			Drawing["b5"]["Size"] = UDim2.new(drawingoptions.Size,0,drawingoptions.Size,0)
			Drawing["b5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
			Drawing["b5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Drawing["b5"]["Name"] = [[zirkul]]
			Drawing["b5"]["BackgroundTransparency"] = 1
			Drawing["b5"]["Visible"] = drawingoptions.Visible == true

			-- // StarterGui.skullissuesifuusethis.MouseFrame.UICorner \\ --
			Drawing["b6"] = Instance.new("UICorner", Drawing["b5"])
			Drawing["b6"]["CornerRadius"] = UDim.new(1, 0)

			-- // StarterGui.skullissuesifuusethis.MouseFrame.UIStroke \\ --
			Drawing["b7"] = Instance.new("UIStroke", Drawing["b5"])
			Drawing["b7"]["Thickness"] = 0.60
			Drawing["b7"]["Color"] = drawingoptions.Color or Color3.fromRGB(0, 0, 0)

			-- // StarterGui.skullissuesifuusethis.MouseFrame.UIAspectRatioConstraint \\ --
			Drawing["b8"] = Instance.new("UIAspectRatioConstraint", Drawing["b5"])
		end
		function Drawing:ToggleVisible(v)
			if v == true then
				Drawing["b5"]["Visible"] = true
			elseif v == false then
				Drawing["b5"]["Visible"] = false
			else
				Drawing["b5"]["Visible"] = not Drawing["b5"]["Visible"]
			end
		end
		function Drawing:SetRadius(v)
			drawingoptions.Size = v
			Drawing["b5"]["Size"] = UDim2.new(drawingoptions.Size,0,drawingoptions.Size,0)
		end
		function Drawing:SetColor(v)
			drawingoptions.Color = v
			Drawing["b7"]["Color"] = drawingoptions.Color or Color3.fromRGB(0, 0, 0)
		end
		function Drawing:GetPosition(v)
			return Drawing["b5"]["AbsolutePosition"]
		end
		function Drawing:SetPosition(v)
			Drawing["b5"]["Position"] = v
		end
		function Drawing:GetRadius(v)
			return Drawing["b5"]["AbsoluteSize"].X
		end
		return Drawing
	end

	return UI
end

return BeanzUI
