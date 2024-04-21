MessageOrganizer = {
	OnStart = function(self)
		local actors = Actor.FindAll("Animal")
		
		for i, animal in ipairs(actors) do
			local animal_index = i % 3
			
			if animal_index == 0 then
				animal:GetComponent("OutputMessage").message = "It's a wolverine."
			end

			if animal_index == 1 then
				animal:GetComponent("OutputMessage").message = "It's a penguin."
			end

			if animal_index == 2 then
				animal:GetComponent("OutputMessage").message = "It's a giraffe."
			end
		end
	end
}