Hud = {
	OnLateUpdate = function(self)
		if Application.GetFrame() > 10 or Application.GetFrame() < 2 then
			return
		end

		Image.DrawUI("background", 0, 0)
		
		-- Draw lives
		Image.DrawUI("hud", 0, 0)
		local lives = 3
	
		for i = 0, lives-1 do
			local x_pos = 15
			local y_pos = 20

			Image.DrawUI("life", x_pos + 50 * i, y_pos - 8 * i)
		end
	end
}

