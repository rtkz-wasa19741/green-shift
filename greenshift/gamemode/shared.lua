GM.Name 		= "Green Shift"
GM.Author 		= "Spy/Kogitsune"
GM.Email 		= "Nope."
GM.Website 		= "Nope."
GM.PlayerSpawnTime = {}
GM.TeamBased = true

function GM:PlayerShouldTakeDamage( ply, attacker )
	if attacker:IsPlayer() then
		if attacker:Team() == ply:Team() then
			return false
		end
	end
end

function GM:ContextScreenClick( aimvec, mousecode, pressed, ply )
	return false
end

local SPS = {
	"attacker_spawnpoint",
	"info_player_counterterrorist" }
	
local SPM = {
	"defender_spawnpoint",
	"info_player_terrorist" }

function GM:CreateTeams()

	// Don't do this if not teambased. But if it is teambased we
	// create a few teams here as an example. If you're making a teambased
	// gamemode you should override this function in your gamemode
	if ( !GAMEMODE.TeamBased ) then return end
	
	TEAM_REBELS = 1
	team.SetUp( TEAM_REBELS, "Rebels", Color( 0, 0, 255, 255 ) )
	team.SetSpawnPoint( TEAM_REBELS, SPS )
	
	TEAM_COMBINE = 2
	team.SetUp( TEAM_COMBINE, "Combine", Color( 255, 150, 0, 255 ) )
	team.SetSpawnPoint( TEAM_COMBINE, SPM )

	team.SetSpawnPoint( TEAM_SPECTATOR, "worldspawn" ) 

end

function GM:ShouldCollide( Ent1, Ent2 )
	return true
end

function GM:PlayerFootstep( ply, vPos, iFoot, strSoundName, fVolume, pFilter )
	if SERVER and ply.FootstepVolumeMul then
		local volume = (ply:GetVelocity():Length() * 0.5) * ply.FootstepVolumeMul
		
		local maxvolume = 70 * ply.FootstepVolumeMul
		
		if ply.CloakOn then
			maxvolume = 50 * ply.FootstepVolumeMul
		else
			maxvolume = 70 * ply.FootstepVolumeMul
		end
		
		if ply:Team() == TEAM_REBELS then
			ply:EmitSound("npc/footsteps/hardboot_generic" .. math.random(1, 6) .. ".wav", math.Clamp(volume, 0, maxvolume), 100)
		elseif ply:Team() == TEAM_COMBINE then
			ply:EmitSound("npc/metropolice/gear" .. math.random(1, 6) .. ".wav", math.Clamp(volume, 0, maxvolume), 100)
		end
	end
end

function GM:PlayerStepSoundTime( ply, iType, bWalking )
	
	local fStepTime = 350
	local fMaxSpeed = ply:GetMaxSpeed()
	local PlayerSpeed = ply:GetVelocity():Length()
	
	if ( iType == STEPSOUNDTIME_NORMAL || iType == STEPSOUNDTIME_WATER_FOOT ) then
		
		fStepTime = 500 - PlayerSpeed * 0.7
		
	elseif ( iType == STEPSOUNDTIME_ON_LADDER ) then
	
		fStepTime = 450 
	
	elseif ( iType == STEPSOUNDTIME_WATER_KNEE ) then
	
		fStepTime = 600 
	
	end
	
	// Step slower if crouching
	if ( ply:Crouching() ) then
		fStepTime = fStepTime + 50
	end
	
	return fStepTime
	
end

function GM:Move(ply, data)
	if SERVER then
		if ply:KeyDown(IN_SPEED) then
			if ply:KeyDown(IN_BACK) and ply.DamageSpeedMod and ply.StrafeMod then
				data:SetForwardSpeed((ply:GetRunSpeed() * -0.7 * ply.DamageSpeedMod) * ply.StrafeMod)
			elseif ply:KeyDown(IN_FORWARD) and ply.DamageSpeedMod then
				data:SetForwardSpeed(ply:GetRunSpeed() * ply.DamageSpeedMod)
			end
			
			if ply:KeyDown(IN_MOVERIGHT) and ply.StrafeMod then
				data:SetSideSpeed((ply:GetRunSpeed() * 0.8 * ply.DamageSpeedMod) * ply.StrafeMod)
			elseif ply:KeyDown(IN_MOVELEFT) and ply.StrafeMod then
				data:SetSideSpeed((ply:GetRunSpeed() * -0.8 * ply.DamageSpeedMod) * ply.StrafeMod)
			end
		end
	end
end