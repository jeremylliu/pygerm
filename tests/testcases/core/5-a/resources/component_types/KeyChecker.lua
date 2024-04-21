KeyChecker = {
	OnStart = function(self)
		self.keys_to_check = {"up2", "asd", "qwe", "zxc", "space", "enter" }
	end,

	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())

		for i, key in ipairs(self.keys_to_check) do
			Debug.Log("Input.GetKey(".. key .. ") value : " .. tostring(Input.GetKey(key)))
			Debug.Log("Input.GetKeyDown(".. key .. ") value : " .. tostring(Input.GetKeyDown(key)))
			Debug.Log("Input.GetKeyUp(".. key .. ") value : " .. tostring(Input.GetKeyUp(key)))
		end
	end
}