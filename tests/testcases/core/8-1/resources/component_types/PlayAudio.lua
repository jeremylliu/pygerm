PlayAudio = {
	volume = 0,
	playing = false,

	OnStart = function(self)
		Audio.Play(0, "sky_bgm", true)
		Audio.SetVolume(0, 0)
		self.playing = true
	end,

	OnUpdate = function(self)
		if self.playing then 
			self.volume = self.volume + 5
			Audio.SetVolume(0, self.volume)
		end

		if self.volume > 100 and self.playing then
			Audio.Halt(0)
			self.playing = false
		end
	end
}

