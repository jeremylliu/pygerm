Manipulator = {
	OnStart = function(self)
		Debug.Log("Hi, I'm the manipulator component. I've just shut off the LifecycleTester so it won't run.")
		self.lifecycle_tester = self.actor:GetComponent("LifecycleTester")
		self.lifecycle_tester.enabled = false
	end,

	OnUpdate = function(self)
		if Application.GetFrame() == 3 then
			Debug.Log("Ok! Bye!")
			Application.Quit()
		end
	end
}