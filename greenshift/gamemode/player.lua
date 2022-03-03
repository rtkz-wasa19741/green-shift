function GM:PlayerDeathThink(ply)
	if CurTime() < ply.PlayerSpawnTime or GameEnded == true or GetConVarNumber("ta_hardcore") >= 1 then
		return
	end

	if ply:KeyPressed(IN_ATTACK) then
		ply:Spawn()
	end
end