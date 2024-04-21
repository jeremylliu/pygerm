-- ActorSpawner.lua

-- Turn any actor into a spawner of other actors!
-- Customize "frames_between_spawns" and "template_to_spawn" to control
-- which actor type is spawned and how often it happens.

ActorSpawner = {
	frames_between_spawns = 5,
	template_to_spawn = "???",

	OnStart = function(self)
		self.frames_remaining = self.frames_between_spawns
	end,

	OnUpdate = function(self)

		self.frames_remaining = self.frames_remaining - 1

		if self.frames_remaining <= 0 then
			Actor.Instantiate(self.template_to_spawn)
			local new_enemy = Actor.Find("Enemy")
			new_enemy:GetComponent("Enemy").hp = 77
			Debug.Log("[Frame " .. Application.GetFrame() .. "] new enemy hp : " .. new_enemy:GetComponent("Enemy").hp)

			local existing_enemies = Actor.FindAll("Enemy")
			Debug.Log("[Frame " .. Application.GetFrame() .. "] number of enemies in existence : " .. #existing_enemies)

			self.frames_remaining = self.frames_between_spawns
		end
	end
}

