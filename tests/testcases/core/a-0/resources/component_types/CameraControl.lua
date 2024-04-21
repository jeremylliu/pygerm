CameraControl = {
	OnUpdate = function(self)
		local cam_x = Camera.GetPositionX()
		local cam_y = Camera.GetPositionY()

		Debug.Log("Frame " .. Application.GetFrame() .. " : Camera is at position (" .. cam_x .. "," .. cam_y .. ")")

		Camera.SetPosition(cam_x + 0.01, cam_y + 0.005)
	end
}

