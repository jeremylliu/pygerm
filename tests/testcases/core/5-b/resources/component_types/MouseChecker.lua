MouseChecker = {
	OnStart = function(self)
		self.keys_to_check = {0, 1, 2, 3, 4, 5 }
	end,

	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())

		for i, key in ipairs(self.keys_to_check) do
			Debug.Log("Input.GetMouseButton(".. key .. ") value : " .. tostring(Input.GetMouseButton(key)))
			Debug.Log("Input.GetMouseButtonDown(".. key .. ") value : " .. tostring(Input.GetMouseButtonDown(key)))
			Debug.Log("Input.GetMouseButtonUp(".. key .. ") value : " .. tostring(Input.GetMouseButtonUp(key)))
		end
	end
}