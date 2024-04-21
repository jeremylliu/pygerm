Chatterbox = {
	message = "...",

	OnUpdate = function(self)
		Debug.Log("message from [" .. self.actor:GetName() .. "] : " .. self.message)
	end
}