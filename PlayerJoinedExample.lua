local notify = require(game.Workspace:FindFirstChild("Services"):FindFirstChild("notify"))
game.Workspace.Services.ChildAdded:Connect(function(Obj)--incase of an update use this
	if Obj.Name=="notify" then
		print("ReFound notify")
		notify = require(game.Workspace:FindFirstChild("Services"):FindFirstChild("notify"))
		return notify
	end
end)

--Player added --> Notify them
game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Wait()
	local Color = {["R"]=20,["G"]=255,["B"]=10}
	notify.notify(plr, "Test", "TestMSG", Color, 3)
end)
