if script.Enabled then--Turn off script if enabled for whatever reason
	script.Enabled=false
end
--[[
Modified By BotWot7024

		/// simpleSuite Version 1.0.1 \\\
					Notify
					
		Notify is a easy to use notification system
		which allows you to send notifications to players
		in your game.
		
		Usage:
		
		local notify = require(script.Parent.notify)
		notify.notify(player,"Title","Text","Color/Style",Duration)
		
		player should be a player, example: game.Players.Player1
		Title should be a string, example: "Hello,"
		Text should be a string, example: "world!"
		Color can be a string or table, example: "default" or "local Color = {["R"]=255,["G"]=0,["B"]=0}"
		Duration should be a number, example: 3
		
		Current Colors:
			alert - Red
			success - Green
			warning - Yellow
			info - Blue
			default - White
			NILColor - Gray(this color means the custom color sent has an NIL value)
			
		Custom Color System(Added In):
			1: To Display custom colors Just Send this through the regular Color varible, Start with this format:
				local Color = {
					["R"]=255, --Clamped To 0-255
					["G"]=0, --Clamped To 0-255
					["B"]=0, --Clamped To 0-255	
				}
			
			2: Then Send that into Notify just like before:
			   local notify = require(notify) -- Replace "notify" with the location of the module
			   local color = {["R"]=255, ["G"]=0, ["B"]=0,}
			   notify.notify(target,title,text,color,dur)

			3: You should Now have custom colors, 
				Side note!!: If it failed, the Notify Popups will use gray(Meaning You Did not send the Format Correctly)

		
		
		Notify is currently in a beta stage, more features will be added in the future.
		Please report any bugs you find to BotWot7024 (Discord Support can be found in our games, you will need RobloxVerfiy!)

--]]

