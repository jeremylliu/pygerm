MouseChecker = {
	OnUpdate = function(self)
		Debug.Log("Frame " .. Application.GetFrame() .. " Input.GetMouseScrollDelta() : " .. tostring(Input.GetMouseScrollDelta()))
	end
}