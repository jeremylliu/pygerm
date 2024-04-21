MouseChecker = {
	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())

		Debug.Log("Input.GetMouseButton(1) : " .. tostring(Input.GetMouseButton(1)))
		Debug.Log("Input.GetMouseButton(2) : " .. tostring(Input.GetMouseButton(2)))
		Debug.Log("Input.GetMouseButton(3) : " .. tostring(Input.GetMouseButton(3)))
	end
}