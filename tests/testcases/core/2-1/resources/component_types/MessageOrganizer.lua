MessageOrganizer = {
	OnStart = function(self)
		local output_component = self.actor:GetComponentByKey("2")
		output_component.message = "Hello from " .. self.actor:GetName()
	end
}