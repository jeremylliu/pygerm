ScreenSaverMovement = {

	OnStart = function(self)
		self.transform = self.actor:GetComponent("Transform")
		self.x_vel = 10
		self.y_vel = 10
	end,

	OnUpdate = function(self)

		if self.transform.position.x >= 640 then
			self.x_vel = -math.abs(self.x_vel)
		end

		if self.transform.position.x <= 0 then
			self.x_vel = math.abs(self.x_vel)
		end

		if self.transform.position.y >= 360 then
			self.y_vel = -math.abs(self.y_vel)
		end

		if self.transform.position.y <= 0 then
			self.y_vel = math.abs(self.y_vel)
		end
		
		self.transform.position.x = self.transform.position.x + self.x_vel
		self.transform.position.y = self.transform.position.y + self.y_vel
	end
}

