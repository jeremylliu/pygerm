DestroyThenCheck = {
	OnUpdate = function(self)
		Debug.Log("[DestroyThenCheck] It is currently frame " .. Application.GetFrame())

		if Application.GetFrame() == 2 then
			Actor.Destroy(Actor.Find("actor2"))
		end

		local actor2 = Actor.Find("actor2")

		Debug.Log("[DestroyThenCheck] Checking on actor2 : ")
		Debug.Log(actor2:GetName())
	end
}

