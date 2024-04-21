SleepThenQuit = {
	SleepDurationMS = 0,

	OnUpdate = function(self)
		local timestamp = os.time()
		Application.Sleep(self.SleepDurationMS)
		local elapsed_time = os.time() - timestamp
		if elapsed_time == 1 then
			Debug.Log("Yay, we've slept around one second.")
		else
			Debug.Log("Oops. Something went wrong with the sleeping.")
		end
		Application.Quit()
	end
}