KeyChecker = {
	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())
		Debug.Log("GetKeyUp(space) : " .. tostring(Input.GetKeyUp("space")))

		if Input.GetKey("escape") then
			Application.Quit()
		end
	end
}