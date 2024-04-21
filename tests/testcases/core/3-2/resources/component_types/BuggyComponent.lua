BuggyComponent = {
	frame_number = 0,

	OnStart = function(self)
		Debug.ThisFunctionDoesntExist()
	end,

	OnUpdate = function(self)
		Debug.Log("The current frame is " .. self.frame_number)
		self.frame_number = self.frame_number + 1

		if self.frame_number > 2 then
			Debug.ThisFunctionDoesntExist()
		end
	end,

	OnLateUpdate = function(self)
		if self.frame_number > 5 then
			Debug.ThisFunctionDoesntExist()
		end
	end
}