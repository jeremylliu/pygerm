KeyChecker = {
	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())
		Debug.Log("is space down : " .. tostring(Input.GetKey("space")))

		if Input.GetKey("escape") then
			Application.Quit()
		end
	end
}