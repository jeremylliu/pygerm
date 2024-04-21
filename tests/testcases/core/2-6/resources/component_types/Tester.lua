Tester = {
	OnStart = function(self)
		Debug.Log("testing nil return values (should appear as blank lines)...")

		local actor = Actor.Find("MissingActor")
		Debug.Log(actor)

		local component = self.actor:GetComponent("MissingComponent")
		Debug.Log(component)
		
		local component_by_key = self.actor:GetComponentByKey("MissingKey")
		Debug.Log(component_by_key)

		Debug.Log("ok, bye.")
	end
}