SpawnThenDestroy = {
	OnUpdate = function(self)
		Debug.Log("[DestroyActor] It is currently frame " .. Application.GetFrame())

		if Application.GetFrame() == 2 then
			local new_enemy = Actor.Instantiate("Enemy")
			Actor.Destroy(new_enemy)
		end
	end
}

