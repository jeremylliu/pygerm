DoMath = {
	a = 5,
	b = 6,
	
	OnStart = function(self)
		Debug.Log(self.a .. " + " .. self.b .. " = " .. (self.a+self.b))
	end
}