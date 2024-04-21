DestroyActor = {
	actor_name = "???",
	frame_countdown = 5,

	OnUpdate = function(self)
		self.frame_countdown = self.frame_countdown - 1

		if self.frame_countdown == 0 then
			local actor_to_destroy = Actor.Find(self.actor_name)
			Actor.Destroy(actor_to_destroy)
		end
	end
}

