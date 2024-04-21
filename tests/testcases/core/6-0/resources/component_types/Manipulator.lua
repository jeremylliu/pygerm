Manipulator = {
	OnStart = function(self)
		self.lifecycle_tester = self.actor:GetComponent("LifecycleTester")
	end,

	OnUpdate = function(self)
		if Application.GetFrame() == 3 then
			self.lifecycle_tester.enabled = false
		end

		if Application.GetFrame() == 6 then
			self.lifecycle_tester.enabled = true
		end

		if Application.GetFrame() == 9 then
			Application.Quit()
		end
	end
}