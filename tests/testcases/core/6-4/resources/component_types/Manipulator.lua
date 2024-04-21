Manipulator = {
	OnUpdate = function(self)
		Debug.Log("[Manipulator] Game Tick " .. Application.GetFrame())

		if Application.GetFrame() == 2 then
			Debug.Log("[Manipulator] Adding enemy component and adjusting its hp...")
			enemy_component = self.actor:AddComponent("Enemy")
			enemy_component.hp = 100
		end

		if Application.GetFrame() == 5 then
			Debug.Log("[Manipulator] Removing enemy component...")
			enemy_component = self.actor:GetComponent("Enemy")
			Debug.Log(enemy_component.hp) -- Should print the hp value like normal.

			self.actor:RemoveComponent(enemy_component)

			enemy_component = self.actor:GetComponent("Enemy")
			Debug.Log(enemy_component.hp) -- Should error-out because enemy_component is now nil.
		end

		if Application.GetFrame() == 8 then
			enemy_component = self.actor:GetComponent("Enemy")
			Debug.Log(enemy_component.hp) -- Should error-out because enemy_component has been nil for several frames.
			Debug.Log("[Manipulator] Ok! Bye!")
			Application.Quit()
		end
	end
}