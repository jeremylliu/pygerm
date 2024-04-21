KeyChecker = {
	OnStart = function(self)
		self.keys_to_check = {"up", "down", "right", "left", "escape", "lshift", "rshift", "lctrl", "rctrl", "lalt", "ralt", "tab", "return", "enter", "escape", "backspace", "delete", "insert", "space", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/", ";", "=", "-", ".", ",", "[", "]", "'", "\"" }
	end,

	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame())

		for i, key in ipairs(self.keys_to_check) do
			Debug.Log("key [" .. key .. "] GetKeyDown value : " .. tostring(Input.GetKeyDown(key)))
			Debug.Log("key [" .. key .. "] GetKeyUp value : " .. tostring(Input.GetKeyUp(key)))
		end
	end
}