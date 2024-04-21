Enemy = {
	hp = 10,

	OnStart = function(self)
		Debug.Log("[Enemy] Enemy booting on frame " .. Application.GetFrame() .. " with hp " .. self.hp)
	end,

	OnUpdate = function(self)
		Debug.Log("[Enemy] Enemy Update on frame " .. Application.GetFrame() .. " with hp " .. self.hp)
		if Application.GetFrame() == 2 then
			self.enabled = false
		end
	end,

	OnLateUpdate = function(self)
		Debug.Log("[Enemy] Enemy LateUpdate on frame " .. Application.GetFrame() .. " with hp " .. self.hp)
	end
}