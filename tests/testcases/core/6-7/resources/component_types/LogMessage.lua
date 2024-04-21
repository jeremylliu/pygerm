LogMessage = {
	message = "???",

	OnStart = function(self)
		Debug.Log("[OnStart frame " .. Application.GetFrame() .. "] " .. self.message)
	end,

	OnUpdate = function(self)
		Debug.Log("[OnUpdate frame " .. Application.GetFrame() .. "] " .. self.message)
	end
}

