(function(define)
--> 保护函数, 请勿删除

local _CONFIG = {
	    uiName = define,
}

		local a = {
			Plrs = "Players",
			LP = "LocalPlayer",
			RS = "ReplicatedStorage"
		}
		local b = setmetatable({}, {
			__index = function(self, c)
				return game.GetService(game, c)
			end,
			__call = function(self, c)
				return game.GetService(game, c)
			end
		})
		if b.CoreGui:FindFirstChild(_CONFIG.uiName) then
			b.CoreGui[_CONFIG.uiName]:Destroy()
		end
		local dm = UDim.new
		local dn = UDim2.new
		local dp = Color3.fromRGB
		local dq = Instance.new
		local dr = function()
		end
		local ds = b.Players.LocalPlayer:GetMouse()
		getgenv().library = {
			flags = {
				GetState = function(dt, du)
					return library.flags[du].State
				end
			},
			modules = {},
			currentTab = nil
		}
		function library:UpdateToggle(du, be)
			local be = be or library.flags:GetState(du)
			if be == library.flags:GetState(du) then
				return
			end
			library.flags[du]:SetState(be)
		end
		local dv = {}
		function dv:Tween(dw, dx, dy, dz, dA)
			return b.TweenService:Create(
 	    dx, TweenInfo.new(dy or 0.25, Enum.EasingStyle[dz or "Linear"], Enum.EasingDirection[dA or "InOut"]), dw)
		end
		function dv:SwitchTab(dB)
			local dC = library.currentTab
			if dC == dB then
				return
			end
			library.currentTab = dB
			dv:Tween({
				Transparency = 1
			}, dC[2].Glow):Play()
			dv:Tween({
				Transparency = 0
			}, dB[2].Glow):Play()
			dC[1].Visible = false
			dB[1].Visible = true
		end
		local dD = dq("ScreenGui")
		local Open = dq("TextButton")
		local dE = dq("Frame")
		local dF = dq("UICorner")
		local dG = dq("TextLabel")
		local dH = dq("UICorner")
		local dI = dq("Frame")
		local dJ = dq("UICorner")
		local dK = dq("ScrollingFrame")
		local dL = dq("UIListLayout")
		local dM = dq("UIPadding")
		local dN = dq("Frame")
		local dO = dq("UICorner")
		dD.Name = _CONFIG.uiName
		dD.Parent = b.CoreGui
		dE.Name = "Main"
		dE.Parent = dD
		dE.BackgroundColor3 = dp(52, 62, 72)
		dE.BorderSizePixel = 0
		dE.Position = dn(0.5, 0, 0.5, 0)
		dE.Size = dn(0, 448, 0, 280)
		dE.AnchorPoint = Vector2.new(0.5, 0.5)
		dE.Active = true
		dE.Draggable = true
		dF.CornerRadius = dm(0, 6)
		dF.Name = "MainCorner"
		dF.Parent = dE
		dG.Parent = dE
		dG.BackgroundColor3 = dp(58, 69, 80)
		dG.BorderSizePixel = 0
		dG.Position = dn(0, 6, 0, 6)
		dG.Size = dn(0, 436, 0, 24)
		dG.Font = Enum.Font.GothamBold
		dG.Text = "  " .. _CONFIG.uiName;
		dG.TextColor3 = dp(255, 255, 255)
		dG.TextSize = 14.000
		dG.TextXAlignment = Enum.TextXAlignment.Left
		Open.Name = "Open"
		Open.Parent = dD
		Open.BackgroundColor3 = dE.BackgroundColor3;
		Open.Position = UDim2.new(0.839879155, 0, - 0.0123076923, 0)
		Open.BorderSizePixel = 2
		Open.BorderColor3 = dG.BackgroundColor3
		Open.Size = UDim2.new(0, 55, 0, 25)
		Open.Font = Enum.Font.SourceSans
		Open.Text = "隐藏"
		Open.TextColor3 = Color3.fromRGB(255, 255, 255)
		Open.TextSize = 14.000
		Open.Active = true
		Open.Draggable = true
		local TOGGLE = true;
		Open.MouseButton1Down:connect(function()
			TOGGLE = not TOGGLE
			dE.Visible = TOGGLE
			Open.Text = (TOGGLE and "隐藏" or "打开");
		end)
		dH.CornerRadius = dm(0, 6)
		dH.Name = "TextLabelCorner"
		dH.Parent = dG
		dI.Name = "Sidebar"
		dI.Parent = dE
		dI.BackgroundColor3 = dp(58, 69, 80)
		dI.BorderSizePixel = 0
		dI.Position = dn(0, 6, 0, 36)
		dI.Size = dn(0, 106, 0, 238)
		dJ.CornerRadius = dm(0, 6)
		dJ.Name = "SidebarCorner"
		dJ.Parent = dI
		dK.Name = "TabButtons"
		dK.Parent = dI
		dK.Active = true
		dK.BackgroundColor3 = dp(255, 255, 255)
		dK.BackgroundTransparency = 1.000
		dK.BorderSizePixel = 0
		dK.Size = dn(0, 106, 0, 238)
		dK.ScrollBarThickness = 0
		dL.Parent = dK
		dL.HorizontalAlignment = Enum.HorizontalAlignment.Center
		dL.SortOrder = Enum.SortOrder.LayoutOrder
		dL.Padding = dm(0, 5)
		dM.Parent = dK
		dM.PaddingTop = dm(0, 6)
		dN.Name = "TabHolder"
		dN.Parent = dE
		dN.BackgroundColor3 = dp(58, 69, 80)
		dN.BorderSizePixel = 0
		dN.Position = dn(0, 118, 0, 36)
		dN.Size = dn(0, 324, 0, 238)
		dO.CornerRadius = dm(0, 6)
		dO.Name = "TabHolderCorner"
		dO.Parent = dN
		dL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
	function()
			dK.CanvasSize = dn(0, 0, 0, dL.AbsoluteContentSize.Y + 12)
		end)
		function createBaseNotifications()
			if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationHolder") then
				return game:GetService("Players").LocalPlayer.PlayerGui.NotificationHolder
			end
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			local ToggleNotif = Instance.new("Frame")
			ToggleNotif.Name = "ToggleNotif"
			ToggleNotif.ZIndex = 5
			ToggleNotif.AnchorPoint = Vector2.new(1, 1)
			ToggleNotif.Visible = false
			ToggleNotif.Size = UDim2.new(0, 291, 0, 56)
			ToggleNotif.Position = UDim2.new(1, 0, 1, 0)
			ToggleNotif.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
			ToggleNotif.Parent = ScreenGui
			local UiCorner = Instance.new("UICorner")
			UiCorner.Name = "UiCorner"
			UiCorner.Parent = ToggleNotif
			local Dropshadow = Instance.new("UIStroke")
			Dropshadow.Name = "Dropshadow"
			Dropshadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Dropshadow.Transparency = 0.8
			Dropshadow.Thickness = 2
			Dropshadow.Color = Color3.fromRGB(20, 20, 20)
			Dropshadow.Parent = ToggleNotif
			local SepVertical = Instance.new("Frame")
			SepVertical.Name = "SepVertical"
			SepVertical.Size = UDim2.new(0, 2, 0, 56)
			SepVertical.BackgroundTransparency = 0.5
			SepVertical.Position = UDim2.new(0.7423077, 0, 0, 0)
			SepVertical.BorderSizePixel = 0
			SepVertical.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			SepVertical.Parent = ToggleNotif
			local SepHorizontal = Instance.new("Frame")
			SepHorizontal.Name = "SepHorizontal"
			SepHorizontal.Size = UDim2.new(0, 72, 0, 2)
			SepHorizontal.BackgroundTransparency = 0.5
			SepHorizontal.Position = UDim2.new(0.75, 0, 0.4464286, 2)
			SepHorizontal.BorderSizePixel = 0
			SepHorizontal.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			SepHorizontal.Parent = ToggleNotif
			local Title = Instance.new("TextLabel")
			Title.Name = "Title"
			Title.Size = UDim2.new(0, 216, 0, 19)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.FontSize = Enum.FontSize.Size14
			Title.TextSize = 14
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.Font = Enum.Font.SourceSans
			Title.Parent = ToggleNotif
			local Paragraph = Instance.new("TextLabel")
			Paragraph.Name = "Paragraph"
			Paragraph.Size = UDim2.new(0, 218, 0, 37)
			Paragraph.BackgroundTransparency = 1
			Paragraph.Position = UDim2.new(0, 0, 0.3392857, 0)
			Paragraph.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Paragraph.FontSize = Enum.FontSize.Size14
			Paragraph.TextSize = 14
			Paragraph.TextColor3 = Color3.fromRGB(255, 255, 255)
			Paragraph.Text = ""
			Paragraph.TextYAlignment = Enum.TextYAlignment.Top
			Paragraph.TextWrapped = true
			Paragraph.Font = Enum.Font.SourceSans
			Paragraph.TextWrap = true
			Paragraph.TextXAlignment = Enum.TextXAlignment.Left
			Paragraph.Parent = ToggleNotif
			local UIPadding = Instance.new("UIPadding")
			UIPadding.PaddingLeft = UDim.new(0, 10)
			UIPadding.PaddingRight = UDim.new(0, 5)
			UIPadding.Parent = Paragraph
			local True = Instance.new("TextButton")
			True.Name = "True"
			True.Size = UDim2.new(0, 72, 0, 27)
			True.BackgroundTransparency = 1
			True.Position = UDim2.new(0.75, 0, 0, 0)
			True.BorderSizePixel = 0
			True.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			True.FontSize = Enum.FontSize.Size14
			True.TextSize = 14
			True.TextColor3 = Color3.fromRGB(255, 255, 255)
			True.Text = "Yes"
			True.Font = Enum.Font.SourceSans
			True.Parent = ToggleNotif
			local False = Instance.new("TextButton")
			False.Name = "False"
			False.Size = UDim2.new(0, 72, 0, 27)
			False.BackgroundTransparency = 1
			False.Position = UDim2.new(0.75, 0, 0.5178571, 0)
			False.BorderSizePixel = 0
			False.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			False.FontSize = Enum.FontSize.Size14
			False.TextSize = 14
			False.TextColor3 = Color3.fromRGB(255, 255, 255)
			False.Text = "No"
			False.Font = Enum.Font.SourceSans
			False.Parent = ToggleNotif
			local LocalScript = Instance.new("LocalScript")
			LocalScript.Parent = ScreenGui
			local DefaultNotif = Instance.new("Frame")
			DefaultNotif.Name = "DefaultNotif"
			DefaultNotif.ZIndex = 5
			DefaultNotif.AnchorPoint = Vector2.new(1, 1)
			DefaultNotif.Visible = false
			DefaultNotif.Size = UDim2.new(0, 291, 0, 56)
			DefaultNotif.Position = UDim2.new(1, 0, 0.9999999, 0)
			DefaultNotif.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
			DefaultNotif.Parent = ScreenGui
			local UiCorner1 = Instance.new("UICorner")
			UiCorner1.Name = "UiCorner"
			UiCorner1.Parent = DefaultNotif
			local Dropshadow1 = Instance.new("UIStroke")
			Dropshadow1.Name = "Dropshadow"
			Dropshadow1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Dropshadow1.Transparency = 0.8
			Dropshadow1.Thickness = 2
			Dropshadow1.Color = Color3.fromRGB(20, 20, 20)
			Dropshadow1.Parent = DefaultNotif
			local Title1 = Instance.new("TextLabel")
			Title1.Name = "Title"
			Title1.Size = UDim2.new(0, 291, 0, 19)
			Title1.BackgroundTransparency = 1
			Title1.BorderSizePixel = 0
			Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title1.FontSize = Enum.FontSize.Size14
			Title1.TextSize = 14
			Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title1.Font = Enum.Font.SourceSans
			Title1.Parent = DefaultNotif
			local Paragraph1 = Instance.new("TextLabel")
			Paragraph1.Name = "Paragraph"
			Paragraph1.Size = UDim2.new(0, 291, 0, 37)
			Paragraph1.BackgroundTransparency = 1
			Paragraph1.Position = UDim2.new(0, 0, 0.3392857, 0)
			Paragraph1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Paragraph1.FontSize = Enum.FontSize.Size14
			Paragraph1.TextSize = 14
			Paragraph1.TextColor3 = Color3.fromRGB(255, 255, 255)
			Paragraph1.Text = ""
			Paragraph1.TextYAlignment = Enum.TextYAlignment.Top
			Paragraph1.TextWrapped = true
			Paragraph1.Font = Enum.Font.SourceSans
			Paragraph1.TextWrap = true
			Paragraph1.TextXAlignment = Enum.TextXAlignment.Left
			Paragraph1.Parent = DefaultNotif
			local UIPadding1 = Instance.new("UIPadding")
			UIPadding1.PaddingLeft = UDim.new(0, 10)
			UIPadding1.PaddingRight = UDim.new(0, 5)
			UIPadding1.Parent = Paragraph1
			if syn then
				syn.protect_gui(ScreenGui)
			end
			ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
			return ScreenGui
		end
		notificationHolder = createBaseNotifications()
		notifAmount = 0
		removedPos = nil
		function library:SelectNotify(args)
			args = args or {}
			args.TweenSpeed = args.TweenSpeed or 1
			args.TweenInSpeed = args.TweenInSpeed or args.TweenSpeed
			args.TweenOutSpeed = args.TweenOutSpeed or args.TweenSpeed
			args.TweenVerticalSpeed = args.TweenVerticalSpeed or args.TweenSpeed
			args.Title = args.Title or "Title"
			args.Text = args.Text or "Text"
			args.TrueText = args.TrueText or "Yes"
			args.FalseText = args.FalseText or "No"
			args.Duration = args.Duration or 5
			args.Callback = args.Callback or function()
				warn("No callback for notif")
			end
		
		---- arg defining ^
			notifAmount = notifAmount + 1
			local track = notifAmount
			local notifNum = notifAmount
			local doesExist = true
			local notif = notificationHolder.ToggleNotif:Clone()
			local removed = false
			notif.Parent = notificationHolder
			notif.Visible = true
			notif.Position = UDim2.new(1, 300, 1, - 5)
			notif.Transparency = 0.05
			notif.True.Text = args.TrueText
			notif.False.Text = args.FalseText
			task.spawn(function()
				task.wait(args.Duration + args.TweenInSpeed)
				doesExist = false
			end)
			notif.True.MouseButton1Click:Connect(function()
				doesExist = false
				removed = true
				notifAmount = notifAmount - 1
				removedPos = notif.Position.Y.Offset
				pcall(args.Callback, true)
			end)
			notif.False.MouseButton1Click:Connect(function()
				doesExist = false
				removed = true
				notifAmount = notifAmount - 1
				removedPos = notif.Position.Y.Offset
				pcall(args.Callback, false)
			end)
			notif.Paragraph.Text = args.Text
			notif.Title.Text = args.Title
			notif:TweenPosition(UDim2.new(1, - 5, 1, - 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenInSpeed)
			task.spawn(function()
				local originalPos = notif.Position
				while doesExist and task.wait() do
					local pos = notif.Position
					if notifAmount > track then
						notif:TweenPosition(UDim2.new(1, - 5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
						track = track + 1
					end
					if notifAmount < track then
						if removedPos > pos.Y.Offset then
							notif:TweenPosition(UDim2.new(1, - 5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
						else
							notifNum = notifNum - 1
						end
						track = track - 1
					end
				end
				local pos = notif.Position
				if removed == false then
					notifAmount = notifAmount - 1
					removedPos = notif.Position.Y.Offset
				end
				notif:TweenPosition(UDim2.new(1, 300, 1, pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenOutSpeed, true)
				task.wait(args.TweenOutSpeed)
				notif:Destroy()
			end)
		end
		function library:Notify(args)
			args = args or {}
			args.TweenSpeed = args.TweenSpeed or 1
			args.TweenInSpeed = args.TweenInSpeed or args.TweenSpeed
			args.TweenOutSpeed = args.TweenOutSpeed or args.TweenSpeed
			args.TweenVerticalSpeed = args.TweenVerticalSpeed or args.TweenSpeed
			args.Title = args.Title or "Title"
			args.Text = args.Text or "Text"
			args.Duration = args.Duration or 5
		
		---- arg defining ^
			notifAmount = notifAmount + 1
			local track = notifAmount
			local notifNum = notifAmount
			local removed = false
			local doesExist = true
			local notif = notificationHolder.DefaultNotif:Clone()
			notif.Parent = notificationHolder
			notif.Visible = true
			notif.Position = UDim2.new(1, 300, 1, - 5)
			notif.Transparency = 0.05
			notif.InputBegan:Connect(function(InputObject)
				if InputObject.UserInputType == Enum.UserInputType.MouseButton1 then
					task.spawn(function()
						local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
						game:GetService("TweenService"):Create(notif, tweenInfo, {
							Transparency = 0.8
						}):Play()
					end)
					doesExist = false
					removed = true
					notifAmount = notifAmount - 1
					removedPos = notif.Position.Y.Offset
				end
			end)
			task.spawn(function()
				task.wait(args.Duration + args.TweenInSpeed)
				doesExist = false
			end)
			notif.Paragraph.Text = args.Text
			notif.Title.Text = args.Title
			notif:TweenPosition(UDim2.new(1, - 5, 1, - 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenInSpeed)
			task.spawn(function()
				local originalPos = notif.Position
				while doesExist and task.wait() do
					local pos = notif.Position
					if notifAmount > track then
						notif:TweenPosition(UDim2.new(1, - 5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
						track = track + 1
					end
					if notifAmount < track then
						if removedPos > pos.Y.Offset then
							notif:TweenPosition(UDim2.new(1, - 5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
						else
							notifNum = notifNum - 1
						end
						track = track - 1
					end
				end
				local pos = notif.Position
				if removed == false then
					notifAmount = notifAmount - 1
					removedPos = notif.Position.Y.Offset
				end
				notif:TweenPosition(UDim2.new(1, 300, 1, pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenOutSpeed, true)
				task.wait(args.TweenOutSpeed)
				notif:Destroy()
			end)
		end
		function library:CreateTab(dZ)
			local d_ = dq("TextButton")
			local e0 = dq("UICorner")
			local e1 = dq("Frame")
			local e2 = dq("UICorner")
			local e3 = dq("UIGradient")
			local e4 = dq("ScrollingFrame")
			local e5 = dq("UIPadding")
			local e6 = dq("UIListLayout")
			d_.Name = "TabButton"
			d_.Parent = dK
			d_.BackgroundColor3 = dp(52, 62, 72)
			d_.BorderSizePixel = 0
			d_.Size = dn(0, 94, 0, 28)
			d_.AutoButtonColor = false
			d_.Font = Enum.Font.GothamSemibold
			d_.Text = dZ
			d_.TextColor3 = dp(255, 255, 255)
			d_.TextSize = 14.000
			e0.CornerRadius = dm(0, 6)
			e0.Name = "TabButtonCorner"
			e0.Parent = d_
			e1.Name = "Glow"
			e1.Parent = d_
			e1.BackgroundColor3 = dp(255, 255, 255)
			e1.BorderSizePixel = 0
			e1.Position = dn(0, 0, 0.928571463, 0)
			e1.Size = dn(0, 94, 0, 2)
			e1.Transparency = 1
			e2.CornerRadius = dm(0, 6)
			e2.Name = "GlowCorner"
			e2.Parent = e1
			e3.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, dp(52, 62, 72)),
				ColorSequenceKeypoint.new(0.50, dp(255, 255, 255)),
				ColorSequenceKeypoint.new(1.00, dp(52, 62, 72))
			}
			e3.Name = "GlowGradient"
			e3.Parent = e1
			e4.Name = "Tab"
			e4.Parent = dN
			e4.Active = true
			e4.BackgroundColor3 = dp(255, 255, 255)
			e4.BackgroundTransparency = 1.000
			e4.BorderSizePixel = 0
			e4.Size = dn(0, 324, 0, 238)
			e4.ScrollBarThickness = 0
			e4.Visible = false
			if library.currentTab == nil then
				library.currentTab = {
					e4,
					d_
				}
				e1.Transparency = 0
				e4.Visible = true
			end
			e5.Name = "TabPadding"
			e5.Parent = e4
			e5.PaddingTop = dm(0, 6)
			e6.Name = "TabLayout"
			e6.Parent = e4
			e6.HorizontalAlignment = Enum.HorizontalAlignment.Center
			e6.SortOrder = Enum.SortOrder.LayoutOrder
			e6.Padding = dm(0, 5)
			e6:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
	function()
				e4.CanvasSize = dn(0, 0, 0, e6.AbsoluteContentSize.Y + 12)
			end)
			d_.MouseButton1Click:Connect(
	function()
				dv:SwitchTab({
					e4,
					d_
				})
			end)
			local e7 = {}
			function e7:NewSeparator()
				local e8 = dq("Frame")
				e8.Transparency = 1
				e8.Size = dn(0, 0, 0, 0)
				e8.BorderSizePixel = 0
				e8.Parent = e4
			end
			function e7:NewButton(e9, ea)
				local ea = ea or dr
				local eb = dq("TextButton")
				local ec = dq("UICorner")
				eb.Name = "BtnModule"
				eb.Parent = e4
				eb.BackgroundColor3 = dp(52, 62, 72)
				eb.BorderSizePixel = 0
				eb.Size = dn(0, 312, 0, 28)
				eb.AutoButtonColor = false
				eb.Font = Enum.Font.GothamSemibold
				eb.Text = "  " .. e9
				eb.TextColor3 = dp(255, 255, 255)
				eb.TextSize = 14.000
				eb.TextXAlignment = Enum.TextXAlignment.Left
				ec.CornerRadius = dm(0, 6)
				ec.Name = "BtnModuleCorner"
				ec.Parent = eb
				eb.MouseButton1Click:Connect(ea)
			end
			function e7:NewToggle(e9, du, ed, ea)
				local ea = ea or dr
				local ed = ed or false
				local ee = dq("TextButton")
				local ef = dq("UICorner")
				local eg = dq("Frame")
				local eh = dq("UIGradient")
				local ei = dq("UICorner")
				local ej = dq("Frame")
				local ek = dq("UICorner")
				local el = dq("UIGradient")
				library.flags[du or e9] = {
					State = false,
					Callback = ea,
					SetState = function(self, be)
						local be = be ~= nil and be or not library.flags:GetState(du)
						library.flags[du].State = be
						task.spawn(
	            function()
							library.flags[du].Callback(be)
						end)
						dv:Tween({
							Transparency = be and 1 or 0
						}, eg):Play()
						dv:Tween({
							Transparency = be and 0 or 1
						}, ej):Play()
					end
				}
				ee.Name = "ToggleModule"
				ee.Parent = e4
				ee.BackgroundColor3 = dp(52, 62, 72)
				ee.BorderSizePixel = 0
				ee.Size = dn(0, 312, 0, 28)
				ee.AutoButtonColor = false
				ee.Font = Enum.Font.GothamSemibold
				ee.Text = "  " .. e9
				ee.TextColor3 = dp(255, 255, 255)
				ee.TextSize = 14.000
				ee.TextXAlignment = Enum.TextXAlignment.Left
				ef.CornerRadius = dm(0, 6)
				ef.Name = "ToggleModuleCorner"
				ef.Parent = ee
				eg.Name = "OffStatus"
				eg.Parent = ee
				eg.BackgroundColor3 = dp(255, 255, 255)
				eg.BorderSizePixel = 0
				eg.Position = dn(0.878205061, 0, 0.178571433, 0)
				eg.Size = dn(0, 34, 0, 18)
				eh.Color = ColorSequence.new{
					ColorSequenceKeypoint.new(0.00, dp(255, 83, 83)),
					ColorSequenceKeypoint.new(0.15, dp(255, 83, 83)),
					ColorSequenceKeypoint.new(0.62, dp(52, 62, 72)),
					ColorSequenceKeypoint.new(1.00, dp(52, 62, 72))
				}
				eh.Rotation = 300
				eh.Name = "OffGrad"
				eh.Parent = eg
				ei.CornerRadius = dm(0, 4)
				ei.Name = "OffStatusCorner"
				ei.Parent = eg
				ej.Name = "OnStatus"
				ej.Parent = ee
				ej.BackgroundColor3 = dp(255, 255, 255)
				ej.BackgroundTransparency = 1.000
				ej.BorderSizePixel = 0
				ej.Position = dn(0.878205121, 0, 0.178571433, 0)
				ej.Size = dn(0, 34, 0, 18)
				ej.Transparency = 1
				ek.CornerRadius = dm(0, 4)
				ek.Name = "OnStatusCorner"
				ek.Parent = ej
				el.Color = ColorSequence.new{
					ColorSequenceKeypoint.new(0.00, dp(52, 62, 72)),
					ColorSequenceKeypoint.new(0.38, dp(48, 57, 67)),
					ColorSequenceKeypoint.new(1.00, dp(53, 255, 134))
				}
				el.Rotation = 300
				el.Name = "OnGrad"
				el.Parent = ej
				ee.MouseButton1Click:Connect(
	    function()
					library.flags[du or e9]:SetState()
				end)
				if ed then
					library.flags[du or e9]:SetState(ed)
				end
			end
			function e7:NewBind(e9, em, ea)
				local em = Enum.KeyCode[em]
				local en = {
					Return = true,
					Space = true,
					Tab = true,
					Backquote = true,
					CapsLock = true,
					Escape = true,
					Unknown = true
				}
				local eo = {
					RightControl = "Right Ctrl",
					LeftControl = "Left Ctrl",
					LeftShift = "Left Shift",
					RightShift = "Right Shift",
					Semicolon = ";",
					Quote = '"',
					LeftBracket = "[",
					RightBracket = "]",
					Equals = "=",
					Minus = "-",
					RightAlt = "Right Alt",
					LeftAlt = "Left Alt"
				}
				local ep = em
				local eq = em and (eo[em.Name] or em.Name) or "None"
				local er = dq("TextButton")
				local es = dq("UICorner")
				local et = dq("TextButton")
				local eu = dq("UICorner")
				er.Name = "KeybindModule"
				er.Parent = e4
				er.BackgroundColor3 = dp(52, 62, 72)
				er.BorderSizePixel = 0
				er.Size = dn(0, 312, 0, 28)
				er.AutoButtonColor = false
				er.Font = Enum.Font.GothamSemibold
				er.Text = "  " .. e9
				er.TextColor3 = dp(255, 255, 255)
				er.TextSize = 14.000
				er.TextXAlignment = Enum.TextXAlignment.Left
				es.CornerRadius = dm(0, 6)
				es.Name = "KeybindModuleCorner"
				es.Parent = er
				et.Name = "KeybindValue"
				et.Parent = er
				et.BackgroundColor3 = dp(58, 69, 80)
				et.BorderSizePixel = 0
				et.Position = dn(0.75, 0, 0.178571433, 0)
				et.Size = dn(0, 74, 0, 18)
				et.AutoButtonColor = false
				et.Font = Enum.Font.Gotham
				et.Text = eq
				et.TextColor3 = dp(255, 255, 255)
				et.TextSize = 12.000
				eu.CornerRadius = dm(0, 4)
				eu.Name = "KeybindValueCorner"
				eu.Parent = et
				b.UserInputService.InputBegan:Connect(
	    function(aJ, aK)
					if aK then
						return
					end
					if aJ.UserInputType ~= Enum.UserInputType.Keyboard then
						return
					end
					if aJ.KeyCode ~= ep then
						return
					end
					ea(ep.Name)
				end)
				et.MouseButton1Click:Connect(
	    function()
					et.Text = "..."
					wait()
					local ev, ew = b.UserInputService.InputEnded:Wait()
					local ex = tostring(ev.KeyCode.Name)
					if ev.UserInputType ~= Enum.UserInputType.Keyboard then
						et.Text = eq
						return
					end
					if en[ex] then
						et.Text = eq
						return
					end
					wait()
					ep = Enum.KeyCode[ex]
					et.Text = eo[ex] or ex
				end)
			end
			function e7:NewSlider(e9, du, em, ey, ez, eA, ea)
				local em = em or ey
				local ea = ea or dr
				local eB = dq("TextButton")
				local eC = dq("UICorner")
				local eD = dq("Frame")
				local eE = dq("UICorner")
				local eF = dq("Frame")
				local eG = dq("UICorner")
				local eH = dq("TextBox")
				local eI = dq("UICorner")
				local eJ = dq("TextButton")
				local eK = dq("TextButton")
				library.flags[du] = {
					State = em,
					SetValue = function(self, be)
						local eL = (ds.X - eD.AbsolutePosition.X) / eD.AbsoluteSize.X
						if be then
							eL = (be - ey) / (ez - ey)
						end
						eL = math.clamp(eL, 0, 1)
						if eA then
							be = be or tonumber(string.format("%.1f", tostring(ey + (ez - ey) * eL)))
						else
							be = be or math.floor(ey + (ez - ey) * eL)
						end
						library.flags[du].State = tonumber(be)
						eH.Text = tostring(be)
						eF.Size = dn(eL, 0, 1, 0)
						ea(tonumber(be))
					end
				}
				eB.Name = "SliderModule"
				eB.Parent = e4
				eB.BackgroundColor3 = dp(52, 62, 72)
				eB.BorderSizePixel = 0
				eB.Position = dn(0, 0, - 0.140425533, 0)
				eB.Size = dn(0, 312, 0, 28)
				eB.AutoButtonColor = false
				eB.Font = Enum.Font.GothamSemibold
				eB.Text = "  " .. e9
				eB.TextColor3 = dp(255, 255, 255)
				eB.TextSize = 14.000
				eB.TextXAlignment = Enum.TextXAlignment.Left
				eC.CornerRadius = dm(0, 6)
				eC.Name = "SliderModuleCorner"
				eC.Parent = eB
				eD.Name = "SliderBar"
				eD.Parent = eB
				eD.BackgroundColor3 = dp(58, 69, 80)
				eD.BorderSizePixel = 0
				eD.Position = dn(0.442307681, 0, 0.392857134, 0)
				eD.Size = dn(0, 108, 0, 6)
				eE.CornerRadius = dm(0, 2)
				eE.Name = "SliderBarCorner"
				eE.Parent = eD
				eF.Name = "SliderPart"
				eF.Parent = eD
				eF.BackgroundColor3 = dp(255, 255, 255)
				eF.BorderSizePixel = 0
				eF.Size = dn(0, 0, 0, 6)
				eG.CornerRadius = dm(0, 2)
				eG.Name = "SliderPartCorner"
				eG.Parent = eF
				eH.Name = "SliderValue"
				eH.Parent = eB
				eH.BackgroundColor3 = dp(58, 69, 80)
				eH.BorderSizePixel = 0
				eH.Position = dn(0.884615362, 0, 0.178571433, 0)
				eH.Size = dn(0, 32, 0, 18)
				eH.Font = Enum.Font.Gotham
				eH.Text = em or ey
				eH.TextColor3 = dp(255, 255, 255)
				eH.TextSize = 12.000
				eI.CornerRadius = dm(0, 4)
				eI.Name = "SliderValueCorner"
				eI.Parent = eH
				eJ.Name = "AddSlider"
				eJ.Parent = eB
				eJ.BackgroundColor3 = dp(255, 255, 255)
				eJ.BackgroundTransparency = 1.000
				eJ.BorderSizePixel = 0
				eJ.Position = dn(0.807692289, 0, 0.178571433, 0)
				eJ.Size = dn(0, 18, 0, 18)
				eJ.Font = Enum.Font.Gotham
				eJ.Text = "+"
				eJ.TextColor3 = dp(255, 255, 255)
				eJ.TextSize = 18.000
				eK.Name = "MinusSlider"
				eK.Parent = eB
				eK.BackgroundColor3 = dp(255, 255, 255)
				eK.BackgroundTransparency = 1.000
				eK.BorderSizePixel = 0
				eK.Position = dn(0.365384609, 0, 0.178571433, 0)
				eK.Size = dn(0, 18, 0, 18)
				eK.Font = Enum.Font.Gotham
				eK.Text = "-"
				eK.TextColor3 = dp(255, 255, 255)
				eK.TextSize = 18.000
				eK.MouseButton1Click:Connect(
	    function()
					local eM = library.flags:GetState(du)
					eM = math.clamp(eM - 1, ey, ez)
					library.flags[du]:SetValue(eM)
				end)
				eJ.MouseButton1Click:Connect(
	    function()
					local eM = library.flags:GetState(du)
					eM = math.clamp(eM + 1, ey, ez)
					library.flags[du]:SetValue(eM)
				end)
				library.flags[du]:SetValue(em)
				local dS, eN, eO = false, false, {
					[""] = true,
					["-"] = true
				}
				eD.InputBegan:Connect(
	    function(dX)
					if dX.UserInputType == Enum.UserInputType.MouseButton1 or dX.UserInputType == Enum.UserInputType.Touch then
						library.flags[du]:SetValue()
						dS = true
					end
				end)
				b.UserInputService.InputEnded:Connect(
	    function(dX)
					if dS and dX.UserInputType == Enum.UserInputType.MouseButton1 or dX.UserInputType == Enum.UserInputType.Touch then
						dS = false
					end
				end)
				b.UserInputService.InputChanged:Connect(
	    function(dX)
					if dS == true then
						library.flags[du]:SetValue()
					end
				end)
				eH.Focused:Connect(
	    function()
					eN = true
				end)
				eH.FocusLost:Connect(
	    function()
					eN = false
					if eH.Text == "" then
						library.flags[du]:SetValue(em)
					end
				end)
				eH:GetPropertyChangedSignal("Text"):Connect(
	    function()
					if not eN then
						return
					end
					eH.Text = eH.Text:gsub("%D+", "")
					local e9 = eH.Text
					if not tonumber(e9) then
						eH.Text = eH.Text:gsub("%D+", "")
					elseif not eO[e9] then
						if tonumber(e9) > ez then
							e9 = ez
							eH.Text = tostring(ez)
						end
						library.flags[du]:SetValue(tonumber(e9))
					end
				end)
			end
			function e7:NewDropdown(e9, du, eP, ea)
				local ea = ea or dr
				library.flags[du] = {
					State = eP[1]
				}
				local eQ = dq("TextButton")
				local eR = dq("UICorner")
				local eS = dq("TextBox")
				local eT = dq("TextButton")
				local eU = dq("TextButton")
				local eV = dq("UICorner")
				local eW = dq("UIListLayout")
				local eX = dq("UIPadding")
				eQ.Name = "DropdownModule"
				eQ.Parent = e4
				eQ.BackgroundColor3 = dp(52, 62, 72)
				eQ.BorderSizePixel = 0
				eQ.Size = dn(0, 312, 0, 28)
				eQ.AutoButtonColor = false
				eQ.Font = Enum.Font.GothamSemibold
				eQ.Text = ""
				eQ.TextColor3 = dp(255, 255, 255)
				eQ.TextSize = 14.000
				eQ.TextXAlignment = Enum.TextXAlignment.Left
				eR.CornerRadius = dm(0, 6)
				eR.Name = "DropdownModuleCorner"
				eR.Parent = eQ
				eS.Name = "DropdownText"
				eS.Parent = eQ
				eS.BackgroundColor3 = dp(255, 255, 255)
				eS.BackgroundTransparency = 1.000
				eS.Position = dn(0.025641026, 0, 0, 0)
				eS.Size = dn(0, 192, 0, 28)
				eS.Font = Enum.Font.GothamSemibold
				eS.PlaceholderText = e9
				eS.PlaceholderColor3 = dp(255, 255, 255)
				eS.TextColor3 = dp(255, 255, 255)
				eS.TextSize = 14.000
				eS.TextXAlignment = Enum.TextXAlignment.Left
				eS.Text = ""
				eT.Name = "OpenDropdown"
				eT.Parent = eQ
				eT.BackgroundColor3 = dp(255, 255, 255)
				eT.BackgroundTransparency = 1.000
				eT.BorderSizePixel = 0
				eT.Position = dn(0.907051265, 0, 0.178571433, 0)
				eT.Size = dn(0, 18, 0, 18)
				eT.Font = Enum.Font.Gotham
				eT.Text = "+"
				eT.TextColor3 = dp(255, 255, 255)
				eT.TextSize = 22.000
				eU.Name = "DropdownBottom"
				eU.Parent = e4
				eU.BackgroundColor3 = dp(52, 62, 72)
				eU.BorderSizePixel = 0
				eU.ClipsDescendants = true
				eU.Position = dn(0.0185185187, 0, 0.206896558, 0)
				eU.Size = dn(0, 312, 0, 0)
				eU.AutoButtonColor = false
				eU.Font = Enum.Font.GothamSemibold
				eU.Text = ""
				eU.TextColor3 = dp(255, 255, 255)
				eU.TextSize = 14.000
				eU.TextXAlignment = Enum.TextXAlignment.Left
				eU.Visible = false
				eV.CornerRadius = dm(0, 6)
				eV.Name = "DropdownBottomCorner"
				eV.Parent = eU
				eW.Name = "DropdownBottomLayout"
				eW.Parent = eU
				eW.HorizontalAlignment = Enum.HorizontalAlignment.Center
				eW.SortOrder = Enum.SortOrder.LayoutOrder
				eW.Padding = dm(0, 6)
				eX.Name = "DropdownBottomPadding"
				eX.Parent = eU
				eX.PaddingTop = dm(0, 6)
				local eY = false
				eW:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
	            function()
					if not eY then
						return
					end
					dv:Tween({
						Size = dn(0, 312, 0, eW.AbsoluteContentSize.Y + 12)
					}, eU, 0.1):Play()
				end)
				local eZ = function()
					local NewValue = eS.Text			
					for _, Element in next, eU:GetChildren() do
						if Element:IsA("TextButton") then
							if string.find(Element.Name:lower(), NewValue:lower()) then
								Element.Visible = true
							else
								Element.Visible = false
							end
						end
					end
				end
				local e_ = function(e9)
					local eP = eU:GetChildren()
					for ai = 1, # eP do
						local bd = eP[ai]
						if e9 == "" then
							eZ()
						else
							if bd:IsA("TextButton") then
								if bd.Name:lower():sub(1, string.len(e9)) == e9:lower() then
									bd.Visible = true
								else
									bd.Visible = false
								end
							end
						end
					end
				end
				local f0 = function()
					eY = not eY
					if eY then
						eU.Visible = true
						eZ()
					else
						task.spawn(
	                    function()
							task.wait(0.35)
							eU.Visible = false
						end)
					end
					eT.Text = eY and "-" or "+"
					dv:Tween({
						Size = dn(0, 312, 0, eY and eW.AbsoluteContentSize.Y + 12 or 0)
					}, eU, 0.35):Play()
				end
				eT.MouseButton1Click:Connect(f0)
				eS.Focused:Connect(
	            function()
					if eY then
						return
					end
					f0()
				end)
				eS:GetPropertyChangedSignal("Text"):Connect(function() -- 改版
					local NewValue = eS.Text			
					for _, Element in next, eU:GetChildren() do
						if Element:IsA("TextButton") then
							if string.find(Element.Name:lower(), NewValue:lower()) then
								Element.Visible = true
							else
								Element.Visible = false
							end
						end
					end
				end)
				library.flags[du].SetOptions = function(self, eP)
					library.flags[du]:ClearOptions()
					for ai = 1, # eP do
						library.flags[du]:AddOption(eP[ai])
					end
				end
				library.flags[du].ClearOptions = function(self)
					local f1 = eU:GetChildren()
					for ai = 1, # f1 do
						local dx = f1[ai]
						if dx:IsA("TextButton") then
							dx:Destroy()
						end
					end
				end
				library.flags[du].AddOption = function(self, bd)
					local f2 = dq("TextButton")
					local f3 = dq("UICorner")
					f2.Name = bd
					f2.Parent = eU
					f2.BackgroundColor3 = dp(58, 69, 80)
					f2.BorderSizePixel = 0
					f2.Size = dn(0, 300, 0, 28)
					f2.AutoButtonColor = false
					f2.Font = Enum.Font.GothamSemibold
					f2.Text = bd
					f2.TextColor3 = dp(255, 255, 255)
					f2.TextSize = 14.000
					f3.CornerRadius = dm(0, 6)
					f3.Name = "OptionCorner"
					f3.Parent = f2
					f2.MouseButton1Click:Connect(
	                function()
						eS.PlaceholderText = bd
						eS.Text = ""
						library.flags[du].State = bd
						task.spawn(f0)
						ea(bd)
					end)
				end
				library.flags[du].RemoveOption = function(self, bd)
					eU:WaitForChild(bd):Destroy()
				end
				library.flags[du]:SetOptions(eP)
			end
			function e7:NewBox(e9, du, ea)
				local ea = ea or dr
				local eB = dq("TextButton")
				local eC = dq("UICorner")
				local eH = dq("TextBox")
				local eI = dq("UICorner")
				eB.Name = "SliderModule"
				eB.Parent = e4
				eB.BackgroundColor3 = dp(52, 62, 72)
				eB.BorderSizePixel = 0
				eB.Position = dn(0, 0, - 0.140425533, 0)
				eB.Size = dn(0, 312, 0, 28)
				eB.AutoButtonColor = false
				eB.Font = Enum.Font.GothamSemibold
				eB.Text = "  " .. e9
				eB.TextColor3 = dp(255, 255, 255)
				eB.TextSize = 14.000
				eB.TextXAlignment = Enum.TextXAlignment.Left
				eC.CornerRadius = dm(0, 6)
				eC.Name = "BoxButtonCorner"
				eC.Parent = eB
				eH.Name = "Box"
				eH.Parent = eB
				eH.BackgroundColor3 = dp(58, 69, 80)
				eH.BorderSizePixel = 0
				eH.Position = dn(0.774615362, 0, 0.178571433, 0)
				eH.Size = dn(0, 65, 0, 18)
				eH.Font = Enum.Font.Gotham
				eH.Text = ""
				eH.PlaceholderText = du
				eH.TextColor3 = dp(255, 255, 255)
				eH.TextSize = 12.000
				eI.CornerRadius = dm(0, 4)
				eI.Name = "BoxCorner"
				eI.Parent = eH
				eH.FocusLost:Connect(
	            function(EnterPressed)
					if not EnterPressed then
						return
					else
						ea(eH.Text)
						if getgenv().ClearTextBoxText then
							wait(0.10)
							eH.Text = ""
						end
					end
				end)
			end
			return e7
		end
		setmetatable(getgenv().library, {
			__newindex = function(self, i, v)
				if i == 'Name' then
					dG.Text = "   " .. v
					return true
				end
				rawset(self, i, v)
			end
		})

local win1 = library:CreateTab("详情");

win1:NewButton("自己看着填", function()
    library:SelectNotify{
        Title = "小黑子",
        Text = "食不食油饼",
        TrueText = "对呀",
        FalseText = "我错了",
        Callback = function()
            print("我按了按钮");
        end,
        Duration = 3, -- 几秒后消失
    }
end)

win1:NewButton("自己看着填", function()
    library:Notify{
        Title = "标题",
        Text = "内容",
        Duration = 5, -- 几秒后消失
    }
end)

win1:NewSeparator()
-- 创建一个空白区域

win1:NewButton("十字架（瞎找的，脚本就是这个格式）", function()--演示
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizizhen"))()
    print("btn3");
end)
local win1 = library:CreateTab("a");
win1:NewToggle("a", "i", true, function(bool)
    print(bool)
        flags.light = val
   
    if val then
        local l = Instance.new("PointLight")
        l.Range = 10000
        l.Brightness = 2
        l.Parent = char.PrimaryPart
       
        repeat task.wait() until not flags.light
        l:Destroy() 
    end
end)
local _default = 10; -- 默认值
local min = 0; -- 最小值
local max = 300; -- 最大值
local showFloat = false; -- 显示小数点


win1:NewSlider("滑块", "滑块id", _default, min, max, showFloat, function(value)
    print(("现在是%d"):format(value));
end)


win1:NewToggle("按钮", "id随便", false, function(bool)
    print(bool)
end)


local this_table = {
"L",
"i",
"n",
"u",
"x",
}
win1:NewDropdown("下拉列表", "这个有用", this_table, function(item)
	print(item);
end)

win1:NewButton("添加元素", function()
    library.flags["这个有用"]:AddOption("wow");
end)

win1:NewButton("删除元素", function()
    library.flags["这个有用"]:RemoveOption("L");
end)

win1:NewBox("文本盒子", "请输入!", function(text)
    print(text);
end)



end)("走马观花")
