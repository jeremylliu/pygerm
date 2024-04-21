ScreenSaver = {
	
	OnStart = function(self)
		self.resolution_x = 640
		self.resolution_y = 360
	end,

	OnUpdate = function(self)
		
		local frame = Application.GetFrame()

		if frame < 2 or frame > 20 then
			return
		end

		for x = 0, self.resolution_x-1 do
			for y = 0, self.resolution_y-1 do

				local rv = 0
				local gv = 0
				local bv = 0
				local av = 255

				-- Stage 1
				bv = 255.0 * (1.0 - (y / (self.resolution_y-1)))
				--gv = 255.0 * math.cos(frame * 0.4 + y * 0.4)
				--bv = 255.0 * y
				--av = 255.0 * x

				-- Stage 2
				if frame > 5 then
					gv = 255.0 * ((math.sin(y * 0.05 + frame * 5) + 1) * 0.5)
				end

				-- Stage 3
				if frame > 10 then
					rv = 255.0 * ((math.cos(x * 0.05 + frame * 5) + 1) * 0.5)
				end

				-- stage 4
				if frame > 15 then
					av = 255.0 * (1.0 - (x / (self.resolution_x-1)))
				end

				Image.DrawPixel(x, y, rv, gv, bv, av)
			end
		end
	end
}

