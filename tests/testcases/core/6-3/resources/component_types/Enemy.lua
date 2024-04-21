Enemy = {
	hp = 10,

	OnStart = function(self)
		Debug.Log("[Enemy] Enemy booting on frame " .. Application.GetFrame() .. " with hp " .. self.hp .. " and key " .. self.key)
	end,

	OnUpdate = function(self)
		Debug.Log("[Enemy] Enemy Update on frame " .. Application.GetFrame() .. " with hp " .. self.hp .. " and key " .. self.key)
	end
}