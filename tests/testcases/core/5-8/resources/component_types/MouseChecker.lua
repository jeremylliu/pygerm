MouseChecker = {
	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())

		Debug.Log("Input.GetMouseButtonUp(1) : " .. tostring(Input.GetMouseButtonUp(1)))
		Debug.Log("Input.GetMouseButtonUp(2) : " .. tostring(Input.GetMouseButtonUp(2)))
		Debug.Log("Input.GetMouseButtonUp(3) : " .. tostring(Input.GetMouseButtonUp(3)))
	end
}