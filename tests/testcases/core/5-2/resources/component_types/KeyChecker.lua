KeyChecker = {
	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())
		Debug.Log("GetKeyDown(space) : " .. tostring(Input.GetKeyDown("space")))

		if Input.GetKey("escape") then
			Application.Quit()
		end
	end
}