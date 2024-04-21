DrawText = {
	message = "???",

	OnStart = function(self)
		self.transform = self.actor:GetComponent("Transform")
	end,

	OnUpdate = function(self)
		Text.Draw(self.message, self.transform.x, self.transform.y, 
		"NotoSans-Regular", 24, 0, 0, 0, 50)
	end
}

