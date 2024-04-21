Enemy = {

	OnStart = function(self)
		Debug.Log("[Enemy] OnStart on frame " .. Application.GetFrame())
	end,

	OnUpdate = function(self)
		Debug.Log("[Enemy] OnUpdate on frame " .. Application.GetFrame())
	end
}

