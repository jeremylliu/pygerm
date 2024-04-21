SpriteRenderer = {
	image = "",

	OnStart = function(self)
		self.transform = self.actor:GetComponent("Transform")
	end,

	OnLateUpdate = function(self)
		Image.Draw(self.image, self.transform.x, self.transform.y)
	end
}

