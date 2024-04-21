MouseChecker = {
	OnUpdate = function(self)
		mouse_pos = Input.GetMousePosition()
		Debug.Log("The current frame is " .. Application.GetFrame() .. " Mouse Position : " .. tostring(mouse_pos.x) .. "," .. tostring(mouse_pos.y))
	end
}