PlayAudio = {

	OnUpdate = function(self)
		if Application.GetFrame() == 2 then
			Audio.Play(0, "sky_bgm", true)
		end
	end
}

