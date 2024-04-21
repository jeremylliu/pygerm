MessageOrganizer = {
	OnStart = function(self)
		local output_component = self.actor:GetComponent("OutputMessage")
		output_component.message = "It's a bit burdensome, but functionality like this adds tremendous flexibility to our engine as we will soon see."
	end
}