PrintFrame = {
	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())

		if Application.GetFrame() > 9 then
			Application.Quit()
		end
	end
}