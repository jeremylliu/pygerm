LifecycleTester = {
	OnStart = function(self)
		Debug.Log("OnStart called on frame " .. Application.GetFrame())
	end,

	OnUpdate = function(self)
		Debug.Log("The current frame is " .. Application.GetFrame() .. " and my enabled variable = " .. tostring(self.enabled))
	end,

	OnLateUpdate = function(self)
		Debug.Log("LateUpdate on frame " .. Application.GetFrame())
	end
}