Hud = {
	OnLateUpdate = function(self)	
		if Application.GetFrame() > 28 or Application.GetFrame() < 2 then
			return
		end
		
		-- Draw lives
		Image.DrawUI("hud", 0, 0)
		local lives = 3
	
		-- Draw background
		Image.DrawUIEx("background", 0, 0, 255, 255, 255, 255, -1)

		for i = 0, lives-1 do
			local x_pos = 15
			local y_pos = 20

			if i == 0 then
				Image.DrawUIEx("life", x_pos + 50 * i, y_pos - 8 * i, 0, 0, 0, 255, 1)
			end

			if i == 1 then
				Image.DrawUIEx("life", x_pos + 50 * i, y_pos - 8 * i, 255, 255, 255, 100, 1)
			end

			if i == 2 then
				local sin_value_01 = (math.sin(Application.GetFrame() * 0.4) + 1) * 0.5
				Image.DrawUIEx("life", x_pos + 50 * i, y_pos - 8 * i, 255, 255 * sin_value_01, 255 * sin_value_01, 255, 1)
			end
		end
	end
}

