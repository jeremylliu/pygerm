DrawText = {
	message = "???",

	OnStart = function(self)
		self.transform = self.actor:GetComponent("Transform")
	end,

	OnUpdate = function(self)
		Text.Draw(self.message, self.transform.position.x, self.transform.position.y, 
		"NotoSans-Regular", 12, 0, 0, 0, 255)
	end
}

