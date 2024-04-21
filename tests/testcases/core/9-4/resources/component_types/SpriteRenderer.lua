SpriteRenderer = {
	image = "",
	sorting_order = 0,
	pivot_x = 0.5,
	pivot_y = 0.5,
	r = 255,
	g = 255,
	b = 255,
	a = 255,

	OnStart = function(self)
		self.transform = self.actor:GetComponent("Transform")
	end,

	OnLateUpdate = function(self)
		if self.image == "" or Application.GetFrame() > 19 or Application.GetFrame() < 2 then
			return
		end

		Image.DrawEx(self.image, self.transform.x, self.transform.y, self.transform.rotation, self.transform.scale_x, self.transform.scale_y, self.pivot_x, self.pivot_y, self.r, self.g, self.b, self.a, self.sorting_order)
	end
}

