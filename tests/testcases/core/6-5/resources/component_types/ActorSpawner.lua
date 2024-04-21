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
			local new_enemy = Actor.Instantiate(self.template_to_spawn)
			new_enemy:GetComponent("Enemy").hp = 100
			self.frames_remaining = self.frames_between_spawns
		end
	end
}

