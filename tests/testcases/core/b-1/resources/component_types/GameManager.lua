GameManager = {

	OnStart = function(self)
		Debug.Log("Launching in scene [" .. Scene.GetCurrent() .. "]")
	end,

	OnUpdate = function(self)
		if Application.GetFrame() == 5 then
			Scene.Load("victory2")
			Scene.Load("victory")
		end
	end
}

