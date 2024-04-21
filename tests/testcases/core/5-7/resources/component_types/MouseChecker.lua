MouseChecker = {
	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())

		Debug.Log("Input.GetMouseButtonDown(1) : " .. tostring(Input.GetMouseButtonDown(1)))
		Debug.Log("Input.GetMouseButtonDown(2) : " .. tostring(Input.GetMouseButtonDown(2)))
		Debug.Log("Input.GetMouseButtonDown(3) : " .. tostring(Input.GetMouseButtonDown(3)))
	end
}