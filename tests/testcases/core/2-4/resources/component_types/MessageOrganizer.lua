MessageOrganizer = {
	OnStart = function(self)
		Debug.Log("ok, time to get a reference to Nikhil's actor.")
		local nikhil_actor = Actor.Find("Nikhil")

		Debug.Log ("ok ok, now time to get his components.")
		local nikhil_message_component = nikhil_actor:GetComponent("OutputMessage")
		
		Debug.Log ("OK OK OK! Now to mess with them.")
		nikhil_message_component.message = "I'm in your actor. Messing with your components!"
	end
}