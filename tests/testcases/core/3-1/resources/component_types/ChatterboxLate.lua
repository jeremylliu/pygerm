ChatterboxLate = {
	message = "...",

	OnLateUpdate = function(self)
		Debug.Log("message from [" .. self.actor:GetName() .. "] : " .. self.message)
	end
}