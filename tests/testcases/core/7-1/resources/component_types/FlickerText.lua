FlickerText = {

	OnStart = function(self)
		self.draw_text = self.actor:GetComponent("DrawText")
	end,

	OnUpdate = function(self)
		if Application.GetFrame() % 8 >= 4 then
			self.draw_text.enabled = true
		
		else
			self.draw_text.enabled = false
		end
	end
}

