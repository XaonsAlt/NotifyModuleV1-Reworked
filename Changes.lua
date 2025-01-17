```
local module = {}
local TweenService = game.Workspace:WaitForChild("Services"):FindFirstChild("notify"):FindFirstChild("TweenService"):FindFirstChild("Event") -- Replace "notify" with the location of the module
local NVersion=script:WaitForChild("Version")
NVersion.Value="V1.03"
print("Started notify Module")
function insertContainer(p)
	if p == nil then
		local simpleSuite = Instance.new("ScreenGui")
		simpleSuite.Name = "simpleSuite"
		simpleSuite.DisplayOrder = 25
		simpleSuite.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		simpleSuite.Parent = game:GetService("StarterGui")

		local Notifications = Instance.new("Frame")
		Notifications.BackgroundTransparency = 1
		Notifications.Name = "Notifications"
		Notifications.Position = UDim2.new(0.815, 0, 0.08, 0)
		Notifications.Size = UDim2.new(0.175, 0, 0.9, 0)
		Notifications.Parent = simpleSuite

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.Padding = UDim.new(0.025, 0)
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout.Parent = Notifications
	else
		local simpleSuite = Instance.new("ScreenGui")
		simpleSuite.Name = "simpleSuite"
		simpleSuite.DisplayOrder = 25
		simpleSuite.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		simpleSuite.Parent = p:WaitForChild("PlayerGui")

		local Notifications = Instance.new("Frame")
		Notifications.BackgroundTransparency = 1
		Notifications.Name = "Notifications"
		Notifications.Position = UDim2.new(0.815, 0, 0.08, 0)
		Notifications.Size = UDim2.new(0.175, 0, 0.9, 0)
		Notifications.Parent = simpleSuite

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.Padding = UDim.new(0.025, 0)
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout.Parent = Notifications
	end
end

insertContainer()

--Preset colors
local colors = {
	NILColor = Color3.fromRGB(79, 79, 79),
	alert = Color3.fromRGB(255, 105, 105),
	success = Color3.fromRGB(105, 255, 105),
	warning = Color3.fromRGB(255, 255, 105),
	info = Color3.fromRGB(105, 105, 255),
	default = Color3.fromRGB(255, 255, 255)	
}

function module.notify(target,title,text,color,dur)

	if target:WaitForChild("PlayerGui"):FindFirstChild("simpleSuite") ~= nil then

		local duration

		if dur == nil then
			duration = 3
		else if dur ~= nil and dur >= 0.1 then
				duration = tonumber(dur)
			end
		end
		--Rescripted by botwot7024 (Below this line)
		if title ~= nil and text ~= nil and color ~= nil then
			local selectedColor = colors.default
			if type(color)=="string" then--Only here for backwards compatibility(old format)
				if string.lower(color) == "alert" or string.lower(color) == "success" or string.lower(color) == "warning" or string.lower(color) == "info" or string.lower(color) == "default" then
					if string.lower(color) == "alert" then
						selectedColor = colors.alert
					elseif string.lower(color) == "success" then
						selectedColor = colors.success
					elseif string.lower(color) == "warning" then
						selectedColor = colors.warning
					elseif string.lower(color) == "info" then
						selectedColor = colors.info
					elseif string.lower(color) == "default" then
						selectedColor = colors.default
					end
				else--if String but not table or know preset then default to NIL color
					selectedColor = colors.NILColor
				end	
			elseif type(color)=="table" then--If new format then
				if color.R==nil or color.G==nil or color.B==nil then--The New DefaultColor System
					selectedColor = colors.NILColor
				else
					selectedColor = Color3.fromRGB(math.clamp(color.R*255,0,255), math.clamp(color.G*255,0,255), math.clamp(color.B*255,0,255))
				end
			else--if no color defined at all default to "Default"
				selectedColor = colors.default
			end
			--Rescripted by botwot7024 (Above this line)
			local notification_number = 1


			if game.Players:FindFirstChild(target.Name) then
				local player = game.Players:FindFirstChild(target.Name)

				for _,v in pairs(player.PlayerGui.simpleSuite.Notifications:GetChildren()) do
					notification_number = notification_number +1
				end


				local Notification1 = Instance.new("Frame")
				Notification1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				Notification1.BorderSizePixel = 0
				Notification1.Name = "Notification"..notification_number
				Notification1.Size = UDim2.new(0, 0, 0, 0)
				Notification1.Parent = player.PlayerGui:WaitForChild("simpleSuite").Notifications

				local Color = Instance.new("Frame")
				Color.BackgroundColor3 = selectedColor
				Color.BorderSizePixel = 0
				Color.Name = "Color"
				Color.Size = UDim2.new(0.025, 0, 1, 0)
				Color.Parent = Notification1

				local Content = Instance.new("Frame")
				Content.BackgroundTransparency = 1
				Content.Name = "Content"
				Content.Position = UDim2.new(0.025, 0, 0, 0)
				Content.Size = UDim2.new(0.975, 0, 1, 0)
				Content.Parent = Notification1

				local Title = Instance.new("TextLabel")
				Title.BackgroundTransparency = 1
				Title.Font = Enum.Font.SourceSansSemibold
				Title.Name = "Title"
				Title.Size = UDim2.new(1, 0, 0.4, 0)
				Title.Text = title
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextScaled = true
				Title.TextSize = 14
				Title.TextWrapped = true
				Title.Parent = Content

				local Text = Instance.new("TextLabel")
				Text.BackgroundTransparency = 1
				Text.Font = Enum.Font.SourceSans
				Text.Name = "Text"
				Text.Position = UDim2.new(0, 0, 0.2999997, 0)
				Text.Size = UDim2.new(1, 0, 0.7, 0)
				Text.Text = text
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.TextScaled = true
				Text.TextSize = 14
				Text.TextWrapped = true
				Text.Parent = Content

				--Rescripted by botwot7024
				if script:FindFirstChild("TweenService") then
					local Time=os.clock()
					print("Tweening 1 at "..Time)
					TweenService:Fire(Notification1, UDim2.new(1, 0, 0.1, 0), duration, UDim2.new(0, 0, 0, 0), 1.1, Time)
					print("Tweening 2 at "..os.clock())
				else
					Notification1:TweenSize(UDim2.new(1, 0, 0.1, 0))
					wait(duration)
					
					Notification1:TweenSize(UDim2.new(0, 0, 0, 0))
					wait(1.1)
					
					Notification1:Destroy()
				end
				--Rescripted by botwot7024
			end
		end
	else
		insertContainer(target)
		wait(0.05)
		module.notify(target,title,text,color,dur)
	end

end

return module
```
