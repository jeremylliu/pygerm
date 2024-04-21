DoMath = {
	a = 0.0,
	b = 0.0,
	
	OnStart = function(self)
		Debug.Log(string.format("%.3f + %.3f = %.3f", self.a, self.b, (self.a + self.b)))
	end
}
