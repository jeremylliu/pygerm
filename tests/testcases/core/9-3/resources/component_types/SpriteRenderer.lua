SpriteRenderer = {
	image = "",

	OnStart = function(self)
		self.transform = self.actor:GetComponent("Transform")
	end,

	OnLateUpdate = function(self)
		if self.image == "" or Application.GetFrame() > 9 or Application.GetFrame() < 2 then
			return
		end

		Image.Draw(self.image, self.transform.x, self.transform.y)
	end
}

