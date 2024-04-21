CameraControl = {
	OnUpdate = function(self)
		local t = Application.GetFrame() * 0.1
		local cam_x = math.cos(t)
		local cam_y = math.sin(t)

		Camera.SetPosition(cam_x, cam_y)
	end
}

