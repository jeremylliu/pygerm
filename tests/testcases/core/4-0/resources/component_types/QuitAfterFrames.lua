QuitAfterFrames = {
	frames = -1,

	OnUpdate = function(self)
		self.frames = self.frames - 1

		if self.frames == 0 then
			Application.Quit()
		end
	end
}