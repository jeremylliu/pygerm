DrawText = {
	message = "???",
	font = "???",
	fontsize = 16,
	r = 0,
	g = 0,
	b = 0,
	a = 255,

	OnStart = function(self)
		self.transform = self.actor:GetComponent("Transform")
	end,

	OnUpdate = function(self)
		Text.Draw(self.message, self.transform.x, self.transform.y, 
		self.font, self.fontsize, self.r, self.g, self.b, self.a)
	end
}

