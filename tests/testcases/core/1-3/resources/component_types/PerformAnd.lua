PerformAnd = {
	a = false,
	b = false,
	
	OnStart = function(self)
		local boolean_result = (self.a and self.b)
		Debug.Log(tostring(self.a) .. " and " .. tostring(self.b) .. " = " .. tostring(boolean_result))
	end
}
