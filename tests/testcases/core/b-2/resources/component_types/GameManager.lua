GameManager = {

	OnStart = function(self)
		Debug.Log("Launching in scene [" .. Scene.GetCurrent() .. "]")
		Scene.DontDestroy(self.actor)
	end,

	OnUpdate = function(self)

		Debug.Log("Frame " .. Application.GetFrame() .. " : The game_manager actor is still around!")

		if Application.GetFrame() == 5 then
			Scene.Load("victory")
		end
	end
}

