MessageOrganizer = {
	OnStart = function(self)
		local message_components = self.actor:GetComponents("OutputMessage")
		
		for i, value in ipairs(message_components) do
			value.message = value.message .. " now customized! (" .. i .. ")"
		end
	end
}