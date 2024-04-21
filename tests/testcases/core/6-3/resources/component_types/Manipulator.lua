Manipulator = {
	OnUpdate = function(self)
		Debug.Log("[Manipulator] Game Tick " .. Application.GetFrame())

		if Application.GetFrame() == 2 then
			Debug.Log("[Manipulator] Adding enemy component and adjusting its hp...")
			enemy_component = self.actor:AddComponent("Enemy")

			enemy_component.hp = 100
		end

		if Application.GetFrame() == 8 then
			Debug.Log("[Manipulator] Ok! Bye!")
			Application.Quit()
		end
	end
}