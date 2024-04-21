Hud = {
	OnLateUpdate = function(self)
		if Application.GetFrame() % 10 == 0 then
			return
		end

		-- Draw lives
		Image.DrawUI("hud", 0, 0, 0)
		local lives = 3
	
		for i = 0, lives-1 do
			local x_pos = 15
			local y_pos = 20

			Image.DrawUIEx("life", x_pos + 50 * i, y_pos - 8 * i, 255, 255, 255, 255, 1)
		end
	end
}

