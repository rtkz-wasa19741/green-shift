/* List of playtesters:
>:3 (dedicated playtester)
CmdrSFC (dedicated playtester)
Kogitsune (dedicated playtester)
Beggor (dedicated playtester)
Robse (aka Wobin Ralker)
RaVeN X
Don Carmine
Phillie Frost
Black Tea the Teabag
The Werewolf
ZBOT

List of people that helped me out and provided various Lua help:
Kogitsune

*/

umsg.PoolString("RSP")
umsg.PoolString("RPTINFO")
umsg.PoolString("GAY")

local WallRunSound = {
	Sound("player/footsteps/concrete1.wav"),
	Sound("player/footsteps/concrete2.wav"),
	Sound("player/footsteps/concrete3.wav"),
	Sound("player/footsteps/concrete4.wav") }
	
local TakeAmmoSound = {
	Sound("vo/npc/male01/ammo03.wav"),
	Sound("vo/npc/male01/ammo04.wav"),
	Sound("vo/npc/male01/ammo05.wav"), }
	
local GrabSound = {
	Sound("physics/flesh/flesh_impact_hard3.wav"),
	Sound("physics/flesh/flesh_impact_hard4.wav"),
	Sound("physics/flesh/flesh_impact_hard5.wav") }
	
local Roll = {
	Sound("physics/cardboard/cardboard_box_break1.wav"),
	Sound("climbswep/rolls/roll_1.mp3") }
	
local ThanksSounds = {
	Sound("vo/npc/male01/nice.wav"),
	Sound("vo/npc/male01/thislldonicely01.wav"),
	Sound("vo/npc/male01/fantastic01.wav"),
	Sound("vo/npc/male01/yeah02.wav") }
	
local ClimbSound = {}

	ClimbSound.Else = {
	Sound("physics/body/body_medium_impact_soft1.wav"),
	Sound("physics/body/body_medium_impact_soft2.wav"),
	Sound("physics/body/body_medium_impact_soft3.wav"),
	Sound("physics/body/body_medium_impact_soft4.wav") }
	
	ClimbSound.Glass = {
	Sound("physics/glass/glass_sheet_step1.wav"),
	Sound("physics/glass/glass_sheet_step1.wav"),
	Sound("physics/glass/glass_sheet_step1.wav"),
	Sound("physics/glass/glass_sheet_step1.wav") }
	
	ClimbSound.Metal = {
	Sound("physics/metal/metal_box_impact_soft1.wav"),
	Sound("physics/metal/metal_box_impact_soft2.wav"),
	Sound("physics/metal/metal_box_impact_soft3.wav") }
	
	ClimbSound.Vent = {
	Sound("physics/metal/metal_box_footstep1.wav"),
	Sound("physics/metal/metal_box_footstep2.wav"),
	Sound("physics/metal/metal_box_footstep3.wav"),
	Sound("physics/metal/metal_box_footstep4.wav") }
	
	ClimbSound.Grate = {
	Sound("physics/metal/metal_chainlink_impact_soft1.wav"),
	Sound("physics/metal/metal_chainlink_impact_soft2.wav"),
	Sound("physics/metal/metal_chainlink_impact_soft3.wav") }
	
	ClimbSound.Plastic = {
	Sound("physics/plastic/plastic_box_impact_soft1.wav"),
	Sound("physics/plastic/plastic_box_impact_soft2.wav"),
	Sound("physics/plastic/plastic_box_impact_soft3.wav"),
	Sound("physics/plastic/plastic_box_impact_soft4.wav") }
	
	ClimbSound.Wood = {
	Sound("physics/wood/wood_box_impact_soft1.wav"),
	Sound("physics/wood/wood_box_impact_soft2.wav"),
	Sound("physics/wood/wood_box_impact_soft3.wav") }
	
	ClimbSound.Concrete = {
	Sound("player/footsteps/concrete1.wav"),
	Sound("player/footsteps/concrete2.wav"),
	Sound("player/footsteps/concrete3.wav"),
	Sound("player/footsteps/concrete4.wav") }
	
	ClimbSound.Tile = {
	Sound("physics/plaster/ceiling_tile_step1.wav"),
	Sound("physics/plaster/ceiling_tile_step2.wav"),
	Sound("physics/plaster/ceiling_tile_step3.wav"),
	Sound("physics/plaster/ceiling_tile_step4.wav") }
	
local PS = {}
	
PS.Small = {
	Sound("vo/npc/male01/pain03.wav"),
	Sound("vo/npc/male01/pain05.wav"),
	Sound("vo/npc/male01/pain06.wav") }

PS.Medium = {
	Sound("vo/npc/male01/pain02.wav"),
	Sound("vo/npc/male01/pain04.wav") }
	
PS.High = {
	Sound("vo/npc/male01/pain07.wav"),
	Sound("vo/npc/male01/pain08.wav"),
	Sound("vo/npc/male01/pain09.wav") }
	
PS.SmallMP = {
	Sound("npc/metropolice/knockout2.wav"),
	Sound("npc/metropolice/pain1.wav") }

PS.MediumMP = {
	Sound("npc/metropolice/pain2.wav"),
	Sound("npc/metropolice/pain1.wav") }
	
PS.HighMP = {
	Sound("npc/metropolice/pain4.wav"),
	Sound("npc/metropolice/pain3.wav") }
	
PS.MPD = {
	Sound("npc/metropolice/die1.wav"),
	Sound("npc/metropolice/die2.wav"),
	Sound("npc/metropolice/die3.wav"),
	Sound("npc/metropolice/die4.wav") }

CreateConVar("ta_respawntime_rebel", "5", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY}) -- in seconds
CreateConVar("ta_respawntime_combine", "5", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY}) -- in seconds
CreateConVar("ta_painsounds_derpmode", "0", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY})
CreateConVar("ta_rounds", "4", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY})
CreateConVar("ta_timelimit_tdm", "15", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY}) -- in minutes
CreateConVar("ta_timelimit_comsab", "10", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY}) -- in minutes
CreateConVar("ta_timelimit_supplydepot", "5", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY}) -- in minutes
CreateConVar("ta_timelimit_vip", "5", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY}) -- in minutes
CreateConVar("ta_hardcore", "0", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY})
CreateConVar("ta_vip_lives", "3", {FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY})

include( 'shared.lua' )
include('filestodownload.lua')
include('player.lua')
include('precache.lua')
AddCSLuaFile('cl_targetid.lua')
AddCSLuaFile('cl_scoreboard.lua')
AddCSLuaFile('cl_init.lua')
--AddCSLuaFile('cl_nv.lua')
--AddCSLuaFile('cl_emv.lua')
--AddCSLuaFile("autorun/client/climb_helpmenu.lua")
AddCSLuaFile('shared.lua')
AddCSLuaFile('cl_deathnotice.lua')
AddCSLuaFile('precache.lua')
DeriveGamemode("base")

GM.Name 		= "Green Shift"
GM.Author 		= "Spy/Kogitsune + Fixed by rtkz_wasa19741"
GM.Email 		= "Nope."
GM.Website 		= "Nope."

local MapGameTypes = {}
local Depots = {}
local EscortPos = {}
local TerminalPos = {}
local ReversedSPCombine = {}
local ReversedSPRebels = {}
Rebels = {}
local Combine = {}
GameType = ""
GameEnded = false
GameStarted = false
FirstPlayerSpawned = false
LastVIP = nil
VIPEnt = nil
CurrentRound = 0
ReverseSpawnpoints = false
ChosenVIPEnt = false
EndGameClass = nil
CurCurTime = 0
Time = 0

local TotalRebels = 0
local TotalCombine = 0

function TA_RegisterMapToGameType(map, gametype, ent1pos, ent1ang, ent2pos, ent2ang, mixspawnpoints)
	table.insert(MapGameTypes, {map = map, gametype = gametype, ent1 = {pos = ent1pos, ang = ent1ang}, ent2 = {pos = ent2pos, ang = ent2ang}, mixspawnpoints = mixspawnpoints})
end

function TA_RegisterSupplyDepot(entity, map, pos, ang)
	table.insert(Depots, {entity = entity, map = map, pos = pos, ang = ang})
end

function TA_RegisterEscortPositions(pos)
	table.insert(EscortPos, {pos = pos})
end

function TA_RegisterTerminalPositions(pos, angle)
	table.insert(TerminalPos, {pos = pos, angle = angle})
end

/* Gametypes:
"assassination" - Search and Eliminate
"supplydepot" - Supply Depot
"commsabot" -- Communications Sabotage
*/

TA_RegisterMapToGameType("de_cbble", "assassination", Vector(1265.4838, -1020.9183, -127.9688), nil, nil, nil, true)
TA_RegisterMapToGameType("de_piranesi", "assassination", Vector(-1858.1869, 2273.0918, 224.0313), nil, nil, nil, true)
TA_RegisterMapToGameType("de_tides", "assassination", Vector(1251.7769, -1400.5587, -63.9688), nil, nil, nil, true)
TA_RegisterMapToGameType("de_nuke", "commsabot", Vector(-58.4765, -558.2797, -415.6359), Angle(0, -180, 0), Vector(1264.1121, -378.3813, -639.6747), Angle(0, -90, 0), false)
TA_RegisterMapToGameType("cs_compound", "commsabot", Vector(1752.9603, 442.4931, 0.2862), Angle(0.000, 90.000, 0.000), Vector(1665.1187, -1410.4471, 16.3546), Angle(0.000, -90.000, 0.000), false)
TA_RegisterMapToGameType("de_prodigy", "commsabot", Vector(306.4508, -435.1147, -207.7359), Angle(0, 0, 0), Vector(1907.3274, -219.3938, -415.3743), Angle(0, -90, 0), true)
TA_RegisterMapToGameType("de_port", "supplydepot", nil, nil, nil, nil, false)
TA_RegisterMapToGameType("de_inferno", "supplydepot", nil, nil, nil, nil, false)
TA_RegisterMapToGameType("de_nightfever", "commsabot", Vector(1898.3487548828, 1662.8507080078, 128.43109130859), Angle(0, 0, 0), Vector(-385.16156005859, 1477.2319335938, 168.19520568848), Angle(0.252685546875, -90, 0.010986328125), false)

TA_RegisterSupplyDepot("ta_depot_food", "de_port", Vector(-1556.1710205078, 376.88357543945, 512.31298828125), Angle(0.0054931640625, 54.613037109375, 0.0494384765625))
TA_RegisterSupplyDepot("ta_depot_food", "de_port", Vector(-1535.1832275391, 687.77838134766, 512.37176513672), Angle(0, -137.548828125, -0.0823974609375))
TA_RegisterSupplyDepot("ta_depot_food", "de_port", Vector(-758.68432617188, 711.24353027344, 512.50201416016), Angle(0, -70.015869140625, 0.032958984375))
TA_RegisterSupplyDepot("ta_depot_food", "de_port", Vector(-744.38049316406, 496.40438842773, 512.42065429688), Angle(0.164794921875, -122.34924316406, 0.2032470703125))

TA_RegisterSupplyDepot("ta_depot_weapon", "de_port", Vector(-849.05187988281, 333.59524536133, 528.44158935547), Angle(-0.1373291015625, 74.981689453125, -0.19775390625))
TA_RegisterSupplyDepot("ta_depot_weapon", "de_port", Vector(-1298.4525146484, 7.6437859535217, 528.37579345703), Angle(0.15380859375, 161.06506347656, 0.02197265625))
TA_RegisterSupplyDepot("ta_depot_weapon", "de_port", Vector(-1176.2093505859, 327.75378417969, 528.47381591797), Angle(-0.3076171875, 99.525146484375, -0.10986328125))
TA_RegisterSupplyDepot("ta_depot_weapon", "de_port", Vector(-1196.3742675781, 201.87242126465, 756.53381347656), Angle(0.0823974609375, 0.9228515625, -3.284912109375))
TA_RegisterSupplyDepot("ta_depot_weapon", "de_port", Vector(-1201.3094482422, 550.72833251953, 759.03576660156), Angle(0.296630859375, 2.1917724609375, -3.955078125))

TA_RegisterSupplyDepot("ta_depot_food", "de_inferno", Vector(2102.5249023438, 330.25527954102, 160.40863037109), Angle(0.0054931640625, 20.462036132813, 0.164794921875))
TA_RegisterSupplyDepot("ta_depot_food", "de_inferno", Vector(2222.1215820313, 885.35693359375, 151.44078063965), Angle(3.3782958984375, 38.995971679688, 2.669677734375))
TA_RegisterSupplyDepot("ta_depot_food", "de_inferno", Vector(2117.7360839844, -349.08782958984, 80.446922302246), Angle(-0.076904296875, -71.383666992188, -0.0714111328125))
TA_RegisterSupplyDepot("ta_depot_food", "de_inferno", Vector(2512.5869140625, 498.72982788086, 212.34048461914), Angle(0, -168.57971191406, -0.098876953125))

TA_RegisterSupplyDepot("ta_depot_weapon", "de_inferno", Vector(2484.0434570313, -109.75532531738, 96.45344543457), Angle(0.186767578125, 15.172119140625, 0.010986328125))
TA_RegisterSupplyDepot("ta_depot_weapon", "de_inferno", Vector(1968.6135253906, -197.34661865234, 96.424499511719), Angle(0.1318359375, -1.3018798828125, 0.2362060546875))
TA_RegisterSupplyDepot("ta_depot_weapon", "de_inferno", Vector(1983.3660888672, 676.0380859375, 176.3532409668), Angle(0.0823974609375, -108.60534667969, 0.06591796875))
TA_RegisterSupplyDepot("ta_depot_weapon", "de_inferno", Vector(1828.2135009766, 672.80352783203, 176.44277954102), Angle(0.2032470703125, -10.404052734375, 0))

function GM:InitPostEntity()
	TA_CreateStuff()
end

function GM:EntityRemoved(ent)
	if ent:IsPlayer() then
		if ent.Charge then
			SafeRemoveEntity(ent.Charge)
			ent.Charge = nil
		end
	
		if ent.IsVIP then
			VIPEnt = nil
			TA_ChooseVIP(1)
		end
	end
	
	if GetConVarNumber("ta_hardcore") >= 1 then
		if ent:IsPlayer() then
			if ent:Team() == TEAM_REBELS then
				TotalRebels = TotalRebels - 1
				
				if TotalRebels <= 0 then
					TA_RestartRound(false)
				end
			elseif ent:Team() == TEAM_COMBINE then
				TotalRebels = TotalRebels - 1
				
				if TotalRebels <= 0 then
					TA_RestartRound(true)
				end
			end
		end
	end
end

function GM:PlayerDisconnected(ply)
	if ply.IsVIP then
		VIPEnt = nil
		TA_ChooseVIP(1)
	end
end

function TA_CreateStuff()
	for k, v in pairs(MapGameTypes) do
		if v.map == game.GetMap() then
		
			if v.mixspawnpoints == true then
			
				ReverseSpawnpoints = true
			
				ReversedSPCombine = {}
				ReversedSPRebels = {}
				
				for k, v in pairs(ents.FindByClass("info_player_counterterrorist")) do
					table.insert(ReversedSPCombine, Vector(v:GetPos().x, v:GetPos().y, v:GetPos().z))
				end
				
				for k, v in pairs(ents.FindByClass("info_player_terrorist")) do
					table.insert(ReversedSPRebels, Vector(v:GetPos().x, v:GetPos().y, v:GetPos().z))
				end
			end
			
			if v.gametype == "assassination" then
				GameType = "assassination"
			
				//for k, v in pairs(EscortPos) do
				local ent = ents.Create("ta_escort_node")
				ent:SetPos(v.ent1.pos)
				ent:Spawn()
				//end
				
				GAMEMODE.Name = "Green Shift (Search and Eliminate)"
				
				break
			elseif v.gametype == "commsabot" then
				GameType = "commsabot"
				
				local node1 = ents.Create("ta_node_download")
				node1:SetPos(v.ent1.pos)
				node1:SetAngles(v.ent1.ang)
				node1:Spawn()
				
				local node2 = ents.Create("ta_node_upload")
				node2:SetPos(v.ent2.pos)
				node2:SetAngles(v.ent2.ang)
				node2:Spawn()

				SetGlobalInt("n1data", 0)
				SetGlobalInt("n2data", 0)

				GAMEMODE.Name = "Green Shift (Communications Sabotage)"
			elseif v.gametype == "supplydepot" then
				GameType = "supplydepot"

				for k2, v2 in pairs(Depots) do -- not exactly a good way of doing this (table in a table in a table), but it works (I am lazy)
					if v2.map == game.GetMap() then
						local entity = ents.Create(v2.entity)
						entity:SetPos(v2.pos)
						entity:SetAngles(v2.ang)
						entity:Spawn()
					end
				end
				
				GAMEMODE.Name = "Green Shift (Supply Depot)"
			else
				GAMEMODE.Name = "Green Shift (Team Deathmatch)"
			end
		end
	end
end

function GM:PlayerSpawn(ply)
	local Team = ply:Team()
	
	if GetConVarNumber("ta_hardcore") >= 1 then
		if Team == TEAM_REBELS then
			TotalRebels = TotalRebels + 1
		end
		
		if Team == TEAM_COMBINE then
			TotalCombine = TotalCombine + 1
		end
	end
	
	if ply.Class != ply.NewClass then
		ply.Class = ply.NewClass
	end
	
	if ply.Class == "Recon" then
		ply:SetWalkSpeed(130)
		ply:SetRunSpeed(350)
		ply.MaxWallRuns = 3
		ply.CanShimmy = true
		ply.CanWallJump = true
		ply:SetHealth(80)
		ply:SetMaxHealth(80)
		ply:SetArmor(40)
		ply.MaxArmor = 40
		ply.Class = "Recon"
		ply:SetDTFloat(1, 20)
		ply:SetDTInt(2, 100)
		ply:SetDTInt(3, 255)
		ply.ChargeChangeDelay = 0
		ply.CloakOn = false
		ply:Give("ta_recon_knife")
	elseif ply.Class == "Engineer" then
		ply:SetWalkSpeed(130)
		ply:SetRunSpeed(320)
		ply.MaxWallRuns = 2
		ply.CanShimmy = true
		ply.CanWallJump = false
		ply:SetHealth(85)
		ply:SetMaxHealth(85)
		ply:SetArmor(85)
		ply.MaxArmor = 85
		ply.Class = "Engineer"
		ply:SetDTFloat(1, 20)
		ply:SetDTFloat(2, 80)
		ply:SetDTInt(3, 0)
		ply.ArmorRegenDelay = 0
		ply:Give("ta_charge")
		ply:GiveAmmo(1, "slam")
	elseif ply.Class == "Assault" then
		ply.Class = "Assault"
		ply:SetWalkSpeed(130)
		ply:SetRunSpeed(270)
		ply.MaxWallRuns = 1
		ply.CanShimmy = false
		ply.CanWallJump = false
		ply:SetHealth(100)
		ply:SetMaxHealth(100)
		ply:SetArmor(50)
		ply.MaxArmor = 50
		ply.Class = "Assault"
		ply:SetDTFloat(1, 20)
		ply:SetDTFloat(2, 80)
		ply:SetDTInt(3, 0)
		ply.AmmoRegenDelay = 0
		ply:Give("ta_incendiary_grenade")
		ply:GiveAmmo(1, "RPG_Round")
	elseif ply.Class == "Medic" then
		ply.Class = "Medic"
		ply:SetWalkSpeed(130)
		ply:SetRunSpeed(270)
		ply.MaxWallRuns = 1
		ply.CanShimmy = false
		ply.CanWallJump = false
		ply:SetHealth(110)
		ply:SetMaxHealth(110)
		ply:SetArmor(55)
		ply.MaxArmor = 55
		ply.Class = "Medic"
		ply:SetDTFloat(1, 100)
		ply:SetDTFloat(2, 0)
		ply:SetDTInt(3, 0)
		ply:Give("ta_ahd") 
	end
	
	if Team == TEAM_REBELS then
	
		if ply.Class == "Recon" then
			ply:SetModel("models/player/Phoenix.mdl")
		elseif ply.Class == "Engineer" then
			ply:SetModel("models/player/group03/male_07.mdl")
		elseif ply.Class == "Assault" then
			ply:SetModel("models/player/swat.mdl")
		elseif ply.Class == "Medic" then
			ply:SetModel("models/player/riot.mdl")
		end
		
		if GameType == "assassination" and VIPEnt == nil and not ChosenVIPEnt then
			TA_ChooseVIP(10)
			ChosenVIPEnt = true
		end
		
	elseif Team == TEAM_COMBINE then
	
		if ply.Class == "Recon" then
			ply:SetModel("models/player/police.mdl")
		elseif ply.Class == "Engineer" then
			ply:SetModel("models/player/combine_soldier_prisonguard.mdl")
		elseif ply.Class == "Assault" then
			ply:SetModel("models/player/combine_super_soldier.mdl")
		elseif ply.Class == "Medic" then
			ply:SetModel("models/player/combine_soldier.mdl")
		end
		
	end
	
	if Team != TEAM_SPECTATOR then
		if not ply.Class or not ply.NewClass then
			ply.Class = "Recon"
			ply.NewClass = "Recon"
		end
	elseif Team == TEAM_SPECTATOR and not ply.InitialSpawn then
		ply:KillSilent()
		ply:ConCommand("ta_teammenu_initial")
	end
	
	ply:SetColor( Color(255, 255, 255, 255) )
	ply:SetMaterial("")
	ply:SetHull(Vector(-16, -16, 0), Vector(16, 16, 72))
	ply:SetHullDuck(Vector(-16, -16, 0), Vector(16, 16, 36))
	
	ply.HitOffset = Vector(0, 0, 0)
	ply.Direction = 0
	ply.DirType = 0
	ply.TraceRange = 25
	ply.WallRuns = 0
	ply.ActionDelay = 0
	ply.CanTrace = false
	ply.XVel = 0
	ply.YVel = 0
	ply.HasGrabbed = false
	ply.ReturnCheck = false
	ply.ShouldAnimate = false
	ply.Force = 100
	ply.ForwardForce = 30
	ply.TimeUntilRelease = 0
	ply.MoveDir = 0
	ply.LastShimmyZPos = 0
	ply.HasWallJumped = false
	ply.GrabPos = Vector(0, 0, 0)
	ply.HitPos = Vector(0, 0, 0)
	ply.UsedZPos = Vector(0, 0, 0)
	ply.NextTeamChange = 0
	ply.MedkitRegenDelay = CurTime() + 0.1
	ply.PlayerSpawnTime = 0
	ply.CrouchAff = 0
	ply:SetCanZoom(false)
	ply.LastAmmo = nil
	ply.ReloadSayDelay = CurTime() + 2
	ply.PainDelay = 0
	ply.GodTime = CurTime() + 5
	ply.SwitchedTeams = false
	ply.DamageSpeedMod = 1
	ply.StrafeMod = 1
	ply.HealAmount = 25
	ply.HealAmountToGive = 25
	ply.DrainMod = 1
	ply.GrenadeRangeMod = 1
	ply.SelfRepairMod = 1
	ply.HealSelfMedicMod = 1
	ply.FootstepVolumeMul = 1
	ply.MedkitRegenDelayMul = 1
	ply.CurSpectate = 0
	ply.SpectateDelay = 0
	ply:SetJumpPower(200)
	ply:UnSpectate()
	ply.Attackers = {}
	
	if Team == TEAM_SPECTATOR then
		ply:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		ply:GodEnable()
		ply:SetNoDraw(true)
		
	else
		ply:SetCollisionGroup(COLLISION_GROUP_PLAYER)
		ply:GodDisable()
		ply:SetNoDraw(false)
	end
	
	if Team == TEAM_SPECTATOR and (ply.Class or ply.NewClass) then
		TA_CheckTeam(ply)
	end
	
	ply.GrabTrace = {}
	
	ply.ManRandom = math.random(1, 4)
	
	TA_GiveLoadout(ply)
	TA_GivePerks(ply)
	TA_SetRequiredExperience(ply, true)
	
	if ReverseSpawnpoints == true then
		if Team == TEAM_COMBINE then
			ply:SetPos(table.Random(ReversedSPCombine))
		elseif Team == TEAM_REBELS then
			ply:SetPos(table.Random(ReversedSPRebels))
		end
	end
	
	if IsValid(VIPEnt) then
		if Team == TEAM_REBELS then
			umsg.Start("ReportVIP", ply)
				umsg.Entity(VIPEnt)
			umsg.End()
		end
	end
	
	ply.Charge = nil
end

function GM:PlayerInitialSpawn(ply)
	ply:SetTeam(TEAM_SPECTATOR)
	ply:Spectate(5)
	ply.NextTeamChange = 0.1
	//ply:ConCommand("ta_teammenu_initial")
	ply:KillSilent()
	//ply:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	//ply:GodEnable()
	//ply:SetNoDraw(true)
	ply.InitialSpawn = true
	
	if not ply:GetPData("InitialWipe1") then
		ply:SetPData("Experience", 0)
		ply:SetPData("Level", 1)
		ply:SetPData("SkillPoints", 0)
		ply:SetPData("InitialWipe1", 1)
		
		for i = 1, 20 do
			if not ply:GetPData("Skill" .. i) then
				ply:SetPData("Skill" .. i, 0)
			end
		end
	end
	
	for k, v in pairs(player.GetAll()) do
		if v != ply and v:Team() != TEAM_SPECTATOR and v.Class and v.NewClass then
			umsg.Start("RPTINFO", ply)
				umsg.Entity(v)
				umsg.Short(v:GetMaxHealth())
				umsg.Short(v.MaxArmor)
				umsg.String(v.Class or v.NewClass)
			umsg.End()
		end
	end
end
		
function GM:PlayerShouldTakeDamage(ply, attacker)
	return true
end

function GM:ShowHelp(ply)
	ply:ConCommand("ta_helpmenu")
end

function GM:ShowTeam(ply)
	ply:ConCommand("ta_teammenu")
end

function GM:ShowSpare1(ply)
	ply:ConCommand("ta_classmenu")
end

function GM:ShowSpare2(ply)
	return false
end

function GM:PlayerSwitchFlashlight(ply, cantoggle)
	return true
end

function GM:CanPlayerSuicide(ply)
	if not ply.IsVIP then
		return true
	else
		SendUserMessage("NoSCD", ply)
		return false
	end
end

function GM:Think()
	for _, ply in pairs(player.GetAll()) do
	    if not ply or not ply:IsValid() then continue end
		if ply:Alive() and ply:Team() != TEAM_SPECTATOR and ply:GetModel() != "models/player.mdl" then
			
			ply.DamageSpeedMod = math.Approach(ply.DamageSpeedMod or 1, 1, 0.005)
			
			if ply.Class == "Recon" then
				if ply.CloakOn then
				
					if ply:GetDTInt(2) != 0 then
						ply:SetDTInt(3, math.Approach(ply:GetDTInt(3), 20, 3))
					
						if CurTime() > ply.ChargeChangeDelay then
							local DrainAmount = (1 + ply:GetVelocity():Length() / 100 * ply.DrainMod)
							ply:SetDTInt(2, math.Approach(ply:GetDTInt(2), 0, DrainAmount))
							ply.ChargeChangeDelay = CurTime() + 0.2
						end
						
						if ply:GetDTInt(3) <= 20 and ply:GetMaterial() != "ta/shader3_custom5" then
							ply:SetMaterial("ta/shader3_custom5")
						end
						
						if IsValid(ply:GetActiveWeapon()) then
							ply:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 0.5)
						end
					else
						ply.CloakOn = false
						ply:EmitSound("buttons/button19.wav", 55, 100)
					end
				else
					if CurTime() > ply.ChargeChangeDelay then
						ply:SetDTInt(2, math.Approach(ply:GetDTInt(2), 100, 1))
						ply.ChargeChangeDelay = CurTime() + 0.2
					end
					
					ply:SetMaterial("")
					ply:SetDTInt(3, math.Approach(ply:GetDTInt(3), 255, 10))
				end
			end
		end
		
		if not ply:Alive() then
			if ply.SpectateDelay and CurTime() > ply.SpectateDelay then
				if ply:KeyDown(IN_MOVELEFT) then
					TA_SpectatePrevious(ply)
					ply.SpectateDelay = CurTime() + 1
				elseif ply:KeyDown(IN_MOVERIGHT) then
					TA_SpectateNext(ply)
					ply.SpectateDelay = CurTime() + 1
				end
			end
		end
	
		if ply:Team() == TEAM_SPECTATOR and (ply.Class or ply.NewClass) then
			TA_CheckTeam(ply) -- more preventions
		end
	end
end

function GM:Tick()
	for k, v in pairs (player.GetAll()) do
		if v and v:IsValid() and v:Alive() and v:Team() != TEAM_SPECTATOR and v:GetModel() != "models/player.mdl" then
		    local class = v.Class
			if class == "Medic" then
				if v.MedkitRegenDelay and CurTime() > v.MedkitRegenDelay then
					v:SetDTFloat(1, math.Clamp(v:GetDTFloat(1) + 0.285714, 0, 100))
					v.MedkitRegenDelay = CurTime() + (0.1 * v.MedkitRegenDelayMul)
				end
			else
				if v.MedkitRegenDelay and CurTime() > v.MedkitRegenDelay then
					v:SetDTFloat(1, math.Clamp(v:GetDTFloat(1) + 0.0444444, 0, 20))
					v.MedkitRegenDelay = CurTime() + 0.1
				end
			end
			
			if class == "Engineer" then
				if v.ArmorRegenDelay and CurTime() > v.ArmorRegenDelay then
					v:SetDTFloat(2, math.Clamp(v:GetDTFloat(2) + 0.285714, 0, 80))
					v.ArmorRegenDelay = CurTime() + 0.1
				end
			end
			
			if class == "Assault" then
				if v.AmmoRegenDelay and CurTime() > v.AmmoRegenDelay then
					v:SetDTFloat(2, math.Clamp(v:GetDTFloat(2) + 0.285714, 0, 80))
					v.AmmoRegenDelay = CurTime() + 0.1
				end
			end
			
			if v:GetActiveWeapon() and v:GetActiveWeapon():IsValid() then
			    local getactiveweapon = v:GetActiveWeapon()
				if getactiveweapon:GetClass():find("^ta_") then
					if v:OnGround() then
						if v:KeyDown(IN_SPEED) and v:GetVelocity():Length() > v:GetWalkSpeed() then
						
							if (getactiveweapon.LastMag == 0 and getactiveweapon.ShouldBolt == true) or (getactiveweapon.LastMag != 0 and getactiveweapon.ShouldBolt == false) then
						        local name = v:Nick()
								if timer.IsTimer("StartCustomReloadTimer" .. name) then
									timer.Destroy("StartCustomReloadTimer" .. name)
									timer.Destroy("StartCustomReloadTimer2" .. name)
										
									getactiveweapon:SendWeaponAnim(getactiveweapon.IdleAnim or ACT_VM_IDLE)
										
									if getactiveweapon:GetClass() != "test_sniper_awp" then
										getactiveweapon:SetNextPrimaryFire(CurTime() + 0.3)
										getactiveweapon:SetNextSecondaryFire(CurTime() + 0.3)
									end
										
									getactiveweapon.ShouldBolt = false
									getactiveweapon.ReloadDelay = CurTime() + 0.3
								end
								
							end

						end
					end
				end
			end
		
			if not v:OnGround() and v:GetMoveType() == MOVETYPE_WALK and v:GetMoveType() != MOVETYPE_LADDER then

				if not v.HasGrabbed and v:GetMoveType() == MOVETYPE_WALK and v:EyeAngles().p <= 40 and v:KeyDown(IN_JUMP) and CurTime() > v.ActionDelay then
					if SVCLMB_CanGrab(v, 1, 36) then
						if v:GetVelocity().z < 0 then
							v:ViewPunch(Angle(5, 0, 0))
						else
							v:ViewPunch(Angle(-5, 0, 0))
						end
					
						v.ActionDelay = CurTime() + 0.3
						v.HasGrabbed = true
						v.ReturnCheck = true
						v:SetMoveType(MOVETYPE_NONE)
						v:SetLocalVelocity(Vector(0, 0, 0))
						v:EmitSound(table.Random(GrabSound), 60, 100)
						v.GrabZPos = v:GetShootPos().z
						v:SetHull(Vector(-8, -8, 0), Vector(8, 8, 72))
						v:SetHullDuck(Vector(-8, -8, 0), Vector(8, 8, 36))
					end
				end
				
				if v.HasGrabbed then
				
					if IsValid(v:GetActiveWeapon()) then
						v:GetActiveWeapon():SetDTInt(3, 6)
						v:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 0.5)
					end
					
				end
				
				if v:GetVelocity().x < 0 then
					v.XVel = v:GetVelocity().x / -1
				else
					v.XVel = v:GetVelocity().x
				end
				
				-- We mustn't take the Z velocity into account when calculating forward velocity
				
				if v:GetVelocity().y < 0 then
					v.YVel = v:GetVelocity().y / -1
				else
					v.YVel = v:GetVelocity().y
				end
				
				if v:KeyDown(IN_MOVELEFT) then
					v.Direction = -v:EyeAngles():Right()
					v.CanTrace = true
					v.DirType = 0 -- if DirType is 0 then to wall-run the player needs a certain velocity
					v.TraceRange = 32
					v.Force = 115
					v.ForwardForce = 30
				elseif v:KeyDown(IN_MOVERIGHT) then
					v.Direction = v:EyeAngles():Right()
					v.CanTrace = true
					v.DirType = 0
					v.TraceRange = 32
					v.Force = 115
					v.ForwardForce = 30
				elseif v:KeyDown(IN_FORWARD) then
					v.Direction = v:GetForward()
					v.CanTrace = true
					v.DirType = 1
					v.TraceRange = 32
					v.Force = 200
					v.ForwardForce = 0
				else
					v.CanTrace = false
				end
				
				if ((v.XVel + v.YVel > v:GetWalkSpeed() * 1.5 and v.DirType == 0) and v:KeyDown(IN_JUMP) and not v.HasGrabbed) or ((v.XVel + v.YVel < v:GetWalkSpeed() * 0.8 and v.DirType == 1) and v:KeyDown(IN_JUMP) and not v.HasGrabbed and v:GetVelocity().z > -250)then
				
					if v.WallRuns < v.MaxWallRuns and v.Direction != 0 then
						if CurTime() > v.ActionDelay then
							if v.CanTrace then
								local td = {}
								td.start = v:GetPos() + Vector(0, 0, 24) -- Starting a trace from the position of legs 
								td.endpos = td.start + v.Direction * v.TraceRange
								td.filter = v
								
								local trace = util.TraceLine(td)
							
								if trace.Hit and not trace.Entity:IsPlayer() and not trace.Entity:GetPhysicsObject():IsMoveable() then
								
									if trace.MatType == MAT_CONCRETE then
										v.ActualSound = ClimbSound.Concrete
									elseif trace.MatType == MAT_METAL then
										v.ActualSound = ClimbSound.Metal
									elseif trace.MatType == MAT_VENT then
										v.ActualSound = ClimbSound.Vent
									elseif trace.MatType == MAT_GRATE then
										v.ActualSound = ClimbSound.Grate
									elseif trace.MatType == MAT_WOOD then
										v.ActualSound = ClimbSound.Wood
									elseif trace.MatType == MAT_TILE then
										v.ActualSound = ClimbSound.Tile
									elseif trace.MatType == MAT_PLASTIC or trace.MatType == MAT_COMPUTER then
										v.ActualSound = ClimbSound.Plastic
									elseif trace.MatType == MAT_GLASS then
										v.ActualSound = ClimbSound.Glass
									else
										v.ActualSound = ClimbSound.Else
									end
								
									v:SetVelocity(Vector(0, 0, v.Force - v:GetVelocity().z) + v:GetForward() * v.ForwardForce)
									v:EmitSound(table.Random(v.ActualSound), 75, 100)
									v.ActionDelay = CurTime() + 0.25
									v.WallRuns = v.WallRuns + 1
									v.ReturnCheck = false
									if v.DirType == 1 then
										if IsValid(v:GetActiveWeapon()) then
											v:GetActiveWeapon():SetDTInt(3, 6)
											v:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 2)
											
											SVCLMB_CreateTimer(v)
										end
									end
								end
							end
						end
					end
				end

			else
			
				if v.HasGrabbed then
				
					if v:KeyDown(IN_DUCK) then
						v.CrouchAff = 12
					else
						v.CrouchAff = 0
					end
					
					if IsValid(v:GetActiveWeapon()) then
						v:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 2)
						v:GetActiveWeapon().ReloadDelay = CurTime() + 2
						v.AttachDelay = CurTime() + 2
					end
					
					if v.GrabPos and v.HitPos and v:GetPos() != v.HitPos then
						v:SetPos(Lerp(0.25, v:GetPos() + Vector(0, 0, v.CrouchAff), v.HitPos))
					end
					
					if v.CanShimmy then
					
						if SVCLMB_CanGrab(v, 0, 40) then
							local td = {}
							td.start = v:GetShootPos()
							td.endpos = td.start + v:GetForward() * 36
							td.filter = v
								
							local trace = util.TraceLine(td)
								
							if v:KeyDown(IN_MOVERIGHT) then
								v.MoveDir = trace.HitNormal:Angle():Right() * 1.5
							elseif v:KeyDown(IN_MOVELEFT) then
								v.MoveDir = -trace.HitNormal:Angle():Right() * 1.5
							else
								v.MoveDir = 0
							end
							
							local td2 = {}
							td2.start = v:GetShootPos()
							td2.endpos = td.start + v:GetAimVector() * 36
							td2.filter = v
								
							local trace2 = util.TraceLine(td2)
								
							if trace.Hit or trace2.Hit then
								if trace2.HitPos.z - trace.HitPos.z > 5 or trace.HitPos.z - trace2.HitPos.z > 5 then	
									v.UsedZPos = trace2.HitPos.z
								else
									v.UsedZPos = trace.HitPos.z
								end
							end
							
							if v.MoveDir != 0 and (trace.Hit or trace2.Hit) then
								v.HitPos = Vector(trace.HitPos.x, trace.HitPos.y, v.UsedZPos) - Vector(0, 0, 64) - v:GetForward() * 34
								v:SetPos(Vector(trace.HitPos.x, trace.HitPos.y, v.UsedZPos) - (Vector(0, 0, 64) + v:GetForward() * 34 + v.MoveDir))
							end
						end
					end
				end
			
				if v.WallRuns != 0 then
					v.WallRuns = 0
					v.HasWallJumped = false
				end
				
				if v.HasDoneARoll == true then
					v:SetLocalVelocity(v:GetForward() * 150)
				end
			end
		end
	end
end

function SVCLMB_CanGrab(ply, num, dist)
	
	ply.HitOffset = Vector(0, 0, 0) -- reset it
		
	ply.GrabTrace.start = ply:GetShootPos()
	ply.GrabTrace.endpos = ply.GrabTrace.start + (ply:GetAimVector() * dist)
	ply.GrabTrace.filter = ply
	local shootpos = ply:GetShootPos()
	local right = ply:GetRight()

	local trLo = util.TraceLine(ply.GrabTrace)
	
	if trLo.Hit and not trLo.Entity:GetPhysicsObject():IsMoveable() then -- make sure not to run useless traces
	
		ply.GrabTrace.start = shootpos + Vector( 0, 0, 15 )
		ply.GrabTrace.endpos = ply.GrabTrace.start + (ply:GetAimVector() * dist)

		local trHi = util.TraceLine(ply.GrabTrace)
		
		if not trHi.Hit then -- make sure not to run useless traces

			ply.GrabTrace.start = shootpos - Vector(0, 0, 12)
			ply.GrabTrace.endpos = ply.GrabTrace.start + right * dist
			
			local trRi = util.TraceLine(ply.GrabTrace)

			ply.GrabTrace.start = shootpos - Vector(0, 0, 12)
			ply.GrabTrace.endpos = ply.GrabTrace.start + -right * dist
			
			local trLe = util.TraceLine(ply.GrabTrace)
			
			ply.GrabTrace.start = trLo.HitPos
			ply.GrabTrace.endpos = ply.GrabTrace.start + trLo.HitNormal:Angle():Forward() * 64
			
			local trBack = util.TraceLine(ply.GrabTrace)
			
			-- trace left and right to make sure that when you grab onto something, you don't get stuck in a wall
			
			if trRi.Hit and not trLe.Hit then
				ply.HitOffset = trRi.HitNormal:Angle():Forward() * 16
			end
			
			if trLe.Hit and not trRi.Hit then
				ply.HitOffset = trLe.HitNormal:Angle():Forward() * 16
			end
			
			if trLo and trHi and not trBack.Hit and not trLo.Entity:IsPlayer() and not trHi.Entity:IsPlayer() and not trLo.Entity:IsNPC() and not trHi.Entity:IsNPC() and trHi.HitPos.z > shootpos.z and trLo.HitNormal.z <= 0.6 and trLo.HitNormal.z >= 0 and not ply:Crouching() then
				if num == 1 then
					ply.HitPos = trLo.HitPos + ply.HitOffset - (Vector(0, 0, 64) - trLo.HitNormal:Angle():Forward() * 34)
				end
				
				return true
			else 
				return false
			end
		end
	end
end

function SVCLMB_CreateTimer(ply)
	timer.Create("RestoreTimer" .. ply:Nick(), 1, 1, function()
		if ply.ReturnCheck then
			return
		end
		
		if ply:IsValid() then
			if IsValid(ply:GetActiveWeapon()) then
				//ply:DrawViewModel(true)
				ply:GetActiveWeapon():SetDTInt(3, 0)
				ply:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 0.8)
				ply.ShouldAnimate = false
			end
			
			ply.ReturnCheck = true
		end
	end)
end

function GM:DoPlayerDeath( ply, attacker, dmginfo )
	if ply:Team() == TEAM_REBELS then
	
		if GameType == "supplydepot" then
			ply.PlayerSpawnTime = CurTime() + GetConVarNumber("ta_respawntime_rebel") * 2
		else
			ply.PlayerSpawnTime = CurTime() + GetConVarNumber("ta_respawntime_rebel")
		end
		
	elseif ply:Team() == TEAM_COMBINE then
	
		if GameType == "commsabot" then
			ply.PlayerSpawnTime = CurTime() + GetConVarNumber("ta_respawntime_combine") * 2
		else
			ply.PlayerSpawnTime = CurTime() + GetConVarNumber("ta_respawntime_combine")
		end
		
	end
	
	if ply:GetActiveWeapon().ThrowStatus and ply:GetActiveWeapon().ThrowStatus == 1 then
		local ent = ents.Create(ply:GetActiveWeapon().DropGrenadeType)
		ent:SetPos(ply:GetShootPos())
		ent:SetAngles(ply:EyeAngles())
		ent:SetOwner(ply)
		ent:Spawn()
		
		local physobj = ent:GetPhysicsObject()
		
		if physobj:IsValid() then
			//physobj:SetVelocity(ply:GetVelocity())
			physobj:AddAngleVelocity(Vector(math.random(-250, 250), math.random(-250, 250), math.random(-250, 250)))
		end
	end
	
	umsg.Start("RSP", ply)
		umsg.Short(ply.PlayerSpawnTime)
		umsg.Short(GetConVarNumber("ta_hardcore"))
	umsg.End()

	ply:AddDeaths( 1 )
	
	if ( attacker:IsValid() && attacker:IsPlayer() ) then
	
		if attacker != ply then
			attacker:AddFrags( 1 )
		end
		
	end
	
	ply:SetColor( Color(255, 255, 255, 255) )
	ply:SetMaterial("")
	ply:CreateRagdoll()
	
	if ply != attacker then
		if dmginfo:IsDamageType(DMG_BULLET) or dmginfo:IsDamageType(DMG_BLAST) then
			TA_AddExperience(attacker, 50, 0)
		elseif dmginfo:IsDamageType(DMG_CLUB) then
			TA_AddExperience(attacker, 75, 0)
		end
	end
	
	if ply:IsOnFire() then
		ply:Extinguish()
	end
	
	if ply.Charge then
		ply.Charge:Explode()
	end
	
end

function GM:PlayerDeath(ply, inflictor, attacker)
	if ply.IsVIP then
	
		ply.Lives = ply.Lives - 1
		
		umsg.Start("LVS", ply)
			umsg.Short(ply.Lives)
		umsg.End()
		
		if ply.Lives <= 0 then
			if GameEnded == false then
				for k, v in pairs(team.GetPlayers(TEAM_COMBINE)) do
					TA_AddExperience(v, 200, 1)
				end
			
				TA_RestartRound(false)
			end
		end
	end
	
	if GetConVarNumber("ta_painsounds_derpmode") > 0 then
		ply:EmitSound("annoying/man" .. ply.ManRandom .. "_pain" .. math.random(1, 3) .. ".wav", 90, 100)
	else
		if ply:Team() == TEAM_REBELS then
			ply:EmitSound(table.Random(PS.High, 95, 100))
		elseif ply:Team() == TEAM_COMBINE then
			ply:EmitSound(table.Random(PS.MPD, 95, 100))
		end
	end
	
	if attacker:IsPlayer() then
	
		umsg.Start("PKill", ply)
			umsg.Entity(ply)
			umsg.Entity(attacker)
		umsg.End()
	
		umsg.Start("PKill", attacker)
			umsg.Entity(ply)
			umsg.Entity(attacker)
		umsg.End()
		
	elseif attacker:GetClass() == "ta_frag" or attacker:GetClass() == "ta_smoke" or attacker:GetClass() == "ta_gren_explosive" or attacker:GetClass() == "ta_incendiary" or attacker:GetClass() == "ta_activated_charge" then
	
		local owner
		
		if IsValid(attacker:GetOwner()) then
			owner = attacker:GetOwner()
		else
			owner = attacker.EntOwner
		end
	
		umsg.Start("PKill", ply) 
			umsg.Entity(ply)
			umsg.Entity(owner)
		umsg.End()
		
		umsg.Start("PKill", attacker)
			umsg.Entity(ply)
			umsg.Entity(attacker)
		umsg.End()

	end
	
	if GetConVarNumber("ta_hardcore") >= 1 then
		if ply:Team() == TEAM_REBELS then
			TotalRebels = TotalRebels - 1
			
			if TotalRebels <= 0 then
				TA_RestartRound(false)
			end
		elseif ply:Team() == TEAM_COMBINE then
			TotalCombine = TotalCombine - 1
			
			if TotalCombine <= 0 then
				TA_RestartRound(false)
			end
		end
	end
	if ply.Attackers then
		for k, v in pairs(ply.Attackers) do
			if v.attacker and v.attacker != attacker and attacker != ply and IsValid(v.attacker) then
				TA_AddExperience(v.attacker, 25, 13)
			end
		end
	end
	
	ply.Attackers = {}
end

function GM:ScalePlayerDamage(ply, hitgroup, dmginfo)
	if hitgroup == HITGROUP_HEAD then
		dmginfo:ScaleDamage(1.5)
		
	elseif hitgroup == HITGROUP_LEFTARM or hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then
		dmginfo:ScaleDamage(0.75)
	else
		dmginfo:ScaleDamage(1)
	end
end

function GM:EntityTakeDamage( ent, inflictor, attacker, amount, dmginfo )
	if not ent:IsPlayer() then
	//if attacker:IsPlayer() and not IsValid(attacker:GetActiveWeapon()) then
		return
	end

	if ent:IsPlayer() then
		if ent:Alive() then
			if dmginfo:IsFallDamage() then
				if ent.HasDoneARoll then
					if (ent:Health() - (dmginfo:GetDamage() * 0.5)) > 0 then
						//if dmginfo:IsFallDamage() then
							dmginfo:ScaleDamage(0.5)
							ent:SetUnDuckSpeed(0.6)
						//end
					end
				else
					ent.DamageSpeedMod = 0.5
				end
			end
			
			if GetConVarNumber("ta_painsounds_derpmode") > 0 then
				ent:EmitSound("annoying/man" .. ent.ManRandom .. "_pain" .. math.random(1, 3) .. ".wav", 90, 100)
			else
				if ent:Health() - dmginfo:GetDamage() > 0 then 
					if CurTime() > ent.PainDelay then
						local sound, volume
					
						if ent:Team() == TEAM_REBELS then
						
							if dmginfo:GetDamage() <= 15 then
								sound = table.Random(PS.Small)
								volume = 85
							elseif dmginfo:GetDamage() <= 40 then
								sound = table.Random(PS.Medium)
								volume = 90
							else
								sound = table.Random(PS.High)
								volume = 95
							end
									
						elseif ent:Team() == TEAM_COMBINE then
								
							if dmginfo:GetDamage() <= 15 then
								sound = table.Random(PS.SmallMP)
								volume = 85
							elseif dmginfo:GetDamage() <= 40 then
								sound = table.Random(PS.MediumMP)
								volume = 90
							else
								sound = table.Random(PS.HighMP)
								volume = 95
							end
									
						end
								
						if sound and volume then
							ent:EmitSound(sound, volume, 100)
						end
								
						ent.PainDelay = CurTime() + math.Rand(0.7, 1.1)
					end
				end
			end
		end
		
		if attacker:IsPlayer() then
			if ent:Alive() then
				if ent:Team() == attacker:Team() and ent != attacker then
					dmginfo:ScaleDamage(0)
					return false
				end
				
				if ent.GodTime > CurTime() then
					dmginfo:ScaleDamage(0)
					return false
				end

				if ent.Class == "Recon" and ent.CloakOn then
					ent:SetDTInt(2, 0)
				end
				
				ent.DamageSpeedMod = 0.5
				
				if ent.Attackers then -- this is probably a horrible way of doing this, but it works
					local CanInsert = true
					
					for k, v in pairs(ent.Attackers) do
						if v.attacker == attacker then
							CanInsert = false
							break
						end
					end
					
					if CanInsert then
						table.insert(ent.Attackers, {attacker = attacker})
					end
				else
					table.insert(ent.Attackers, {attacker = attacker})
				end
					
				if dmginfo:IsDamageType(DMG_BLAST) then
					dmginfo:ScaleDamage(attacker.ExplosiveDamageMod or 1)
				end
				
				if dmginfo:IsDamageType(DMG_BULLET) then
				end
					
				local wep = attacker:GetActiveWeapon()
					
				if IsValid(attacker:GetActiveWeapon()) and attacker:GetActiveWeapon().IsCustomWeapon then
					local distance = attacker:GetPos():Distance(ent:GetPos())
					
					if ent:IsPlayer() and ent:Armor() > 0 then
						if wep:GetDTInt(2) == 2 then
							attacker.DamageAff1 = 0.3
						elseif wep:GetDTInt(2) == 3 then
							attacker.DamageAff1 = -0.3
						else
							attacker.DamageAff1 = 0
						end
					elseif ent:IsPlayer() and ent:Armor() <= 0 then
						if wep:GetDTInt(2) == 2 then
							attacker.DamageAff1 = -0.3
						elseif wep:GetDTInt(2) == 3 then
							attacker.DamageAff1 = 0.3
						else
							attacker.DamageAff1 = 0
						end
					else -- if he is an NPC then do the same as if he wouldn't have armor/etc.
						if wep:GetDTInt(2) == 2 then
							if ent:IsNPC() then
								attacker.DamageAff1 = -0.3
							else
								attacker.DamageAff1 = 0.3 -- breakable stuff should get extra damage
							end
						elseif wep:GetDTInt(2) == 3 then
							if ent:IsNPC() then
								attacker.DamageAff1 = 0.3
							else
								attacker.DamageAff1 = -0.3 -- breakable stuff should get less damage
							end
						else
							attacker.DamageAff1 = 0
						end
					end
					

					dmginfo:ScaleDamage(1 + attacker.DamageAff1) -- scale the damage with ammo types
					
					local FinalDamageDecay
					
					if distance >= wep.EffectiveRange then
						FinalDamageDecay = wep.DamageDecay
					else
						FinalDamageDecay = wep.DamageDecay * (distance / wep.EffectiveRange)
					end
					
					dmginfo:ScaleDamage(1 - FinalDamageDecay)
				end
			end
		end
	end
end

function GM:GetFallDamage(ply, speed)
	speed = speed - 480
	return speed * (100/(1024-480))
end

function GM:KeyRelease(ply, key)
	if ply:Alive() then
		if ply.HasGrabbed and key == IN_DUCK then
			if ply.TimeUntilRelease > CurTime() then
				ply:SetMoveType(MOVETYPE_WALK)
				ply:SetHull(Vector(-16, -16, 0), Vector(16, 16, 72))
				ply:SetHullDuck(Vector(-16, -16, 0), Vector(16, 16, 36))
				ply.HasGrabbed = false
				ply.TimeUntilRelease = 0
				ply.ActionDelay = CurTime() + 0.5
				if IsValid(ply:GetActiveWeapon()) then
					//ply:DrawViewModel(true)
					ply:GetActiveWeapon():SetDTInt(3, 0)
					ply:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 0.8)
					ply.ShouldAnimate = false
				end
				ply.ReturnCheck = false
			end
		end
		
		local wep = ply:GetActiveWeapon()	
		
		if wep != NULL and wep.IsCustomWeapon then
			if ply:GetVelocity():Length() >= ply:GetWalkSpeed() * 0.8 then
				if key == IN_SPEED then
			
					if timer.IsTimer("StartCustomReloadTimer" .. ply:Nick()) then
						timer.Destroy("StartCustomReloadTimer" .. ply:Nick())
						timer.Destroy("StartCustomReloadTimer2" .. ply:Nick())
					end
								
					wep:SendWeaponAnim(wep.IdleAnim or ACT_VM_IDLE)
					wep:SetNextPrimaryFire(CurTime() + 0.3)
					wep:SetNextSecondaryFire(CurTime() + 0.3)
					wep.ShouldBolt = false
					wep.ReloadDelay = CurTime() + 0.3
						
					/*if ply:GetActiveWeapon().LastMag == 0 and ply:GetActiveWeapon().ShouldBolt == false then
						return
					end
				
					if ply:GetActiveWeapon():GetClass() != "cstm_sniper_awp" then
						ply:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 0.3)
						ply:GetActiveWeapon():SetNextSecondaryFire(CurTime() + 0.3)
					end
					
					ply:GetActiveWeapon().ReloadDelay = CurTime() + 0.3*/
				end
			end
		end
	end
end

function GM:KeyPress(ply, key)
	if ply:Alive() then
		
		if ply:OnGround() then
			ply.ActionDelay = CurTime() + 0.25
		end
		
		if key == IN_JUMP then //and ply:KeyDown(IN_DUCK) then
			if ply.HasGrabbed and ply:GetMoveType() == MOVETYPE_NONE and CurTime() > ply.ActionDelay then
				ply.HasGrabbed = false
				ply.ActionDelay = CurTime() + 0.5
				ply:SetMoveType(MOVETYPE_WALK)
				ply:SetHull(Vector(-16, -16, 0), Vector(16, 16, 72))
				ply:SetHullDuck(Vector(-16, -16, 0), Vector(16, 16, 36))
				ply:SetLocalVelocity(ply:GetForward() * 60 + Vector(0, 0, 250))
				if IsValid(ply:GetActiveWeapon()) then
					//ply:DrawViewModel(true)
					ply:GetActiveWeapon():SetDTInt(3, 0)
					ply:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 0.8)
					ply.ShouldAnimate = false
				end
				ply:EmitSound("player/suit_sprint.wav", 75, math.random(95, 105))
			end
		elseif key == IN_JUMP and ply:KeyDown(IN_FORWARD) then
			ply.ActionDelay = CurTime() + 0.2
			
			if ply.HasGrabbed and ply:GetMoveType() == MOVETYPE_NONE then
				ply:SetMoveType(MOVETYPE_WALK)
				ply:SetHull(Vector(-16, -16, 0), Vector(16, 16, 72))
				ply:SetHullDuck(Vector(-16, -16, 0), Vector(16, 16, 36))
				ply.HasGrabbed = false
				ply.ReturnCheck = false
				ply:SetLocalVelocity(Vector(ply:GetAimVector().x * 375, ply:GetAimVector().y * 375, 170))
				ply:ViewPunch(Angle(-5, 0, 0))
				if IsValid(ply:GetActiveWeapon()) then
					SVCLMB_CreateTimer(ply)
				end
			end
			
		elseif key == IN_DUCK then
			ply.TimeUntilRelease = CurTime() + 0.225		
		end
		
		if key == IN_JUMP and not ply.HasGrabbed and ply.WallRuns >= 2 and CurTime() > ply.ActionDelay * 0.5 and not ply.HasWallJumped and ply.CanWallJump then
			if ply.Direction == ply:GetForward() then
				ply:SetEyeAngles(ply:EyeAngles() - Angle(0, 180, 0))
				ply:SetLocalVelocity(Vector(ply:GetAimVector().x * 375, ply:GetAimVector().y * 375, 170))
			elseif ply.Direction == ply:EyeAngles():Right()then
				ply:SetEyeAngles(ply:EyeAngles() - Angle(0, 90, 0))
				ply:SetLocalVelocity(Vector(ply:GetAimVector().x * 450, ply:GetAimVector().y * 450, 170))
			elseif ply.Direction == -ply:EyeAngles():Right() then
				ply:SetEyeAngles(ply:EyeAngles() + Angle(0, 90, 0))
				ply:SetLocalVelocity(Vector(ply:GetAimVector().x * 450, ply:GetAimVector().y * 450, 170))
			end
			
			ply:ViewPunch(Angle(-5, 0, 0))
			ply.TimeUntilRelease = 0
			ply.HasWallJumped = true
		end	
	end
end

function GM:OnPlayerHitGround(ply)
	if ply:Alive() then
		ply.WallRuns = 0
		ply.HasWallJumped = false
		local wep = ply:GetActiveWeapon()
		
		if ply:EyeAngles().p >= 35 then
			if ply:KeyDown(IN_DUCK) and ply:Crouching() and ply:GetVelocity().z <= -400 and ply:GetVelocity():Length() <= 1000 then
			
				ply:EmitSound(table.Random(Roll), 70, math.random(95, 105))
				
				umsg.Start("Spin To", ply)
					umsg.Float(360)
					umsg.Float(1.8)
				umsg.End()
				
				if math.random(1, 100) <= 2 then
					umsg.Start("GAY") -- easter egg
						umsg.Entity(ply)
					umsg.End()
				end
				
				ply.HasDoneARoll = true
				
				if IsValid(wep) then
					wep:SetDTInt(3, 6)
					wep:SetNextPrimaryFire(CurTime() + 0.65)
					wep:SetNextSecondaryFire(CurTime() + 0.65)
				end
				//ply:DrawViewModel(false)
				
				timer.Simple(0.5, function()
					if ply:IsValid() then
						if IsValid(wep) then
							wep:SetDTInt(3, 0)
							//ply:DrawViewModel(true)
						end
						
						ply.HasDoneARoll = false
					end
				end)
				
				timer.Simple(1.2, function()
					if ply:IsValid() then
						ply:SetUnDuckSpeed(0.35)
					end
				end)
			end
		end
		
		if ply.ShouldAnimate then
			if IsValid(wep) then
				//ply:DrawViewModel(true)
				wep:SetDTInt(3, 0)
				wep:SetNextPrimaryFire(CurTime() + 0.8)
				ply.ShouldAnimate = false
			end
			
			ply.ReturnCheck = true
		end
	end
end

local function TA_GoRebel(ply)
	if ply:Alive() and ply:Team() != TEAM_SPECTATOR then
		ply:ChatPrint("Cannot switch teams while alive")
		return
	end
	
	if #team.GetPlayers(TEAM_REBELS) > #team.GetPlayers(TEAM_COMBINE) then
		return
	end
	
	if ply.IsVIP then
		ply:ChatPrint("You're the VIP. Cannot switch teams.")
	end

	if CurTime() < ply.NextTeamChange then
		ply:ChatPrint("Please wait " .. math.Round(ply.NextTeamChange - CurTime()) .. " seconds before trying to change teams.")
		return
	end

	if ply:Team() != TEAM_REBELS then
		ply:SetTeam(TEAM_REBELS)
		//ply:ConCommand("ta_classmenu")
		//ply:Spawn()
		ply.NextTeamChange = CurTime() + 2
	end
end

concommand.Add("ta_gorebel", TA_GoRebel)

local function TA_GoCombine(ply)
	if ply:Alive() and ply:Team() != TEAM_SPECTATOR then
		ply:ChatPrint("Cannot switch teams while alive")
		return
	end
	
	if #team.GetPlayers(TEAM_COMBINE) > #team.GetPlayers(TEAM_REBELS) then
		ply:ChatPrint("Team Combine is full.")
		return
	end
	
	if ply.IsVIP then
		ply:ChatPrint("You're the VIP. Cannot switch teams.")
	end
	
	if CurTime() < ply.NextTeamChange then
		ply:ChatPrint("Please wait " .. math.Round(ply.NextTeamChange - CurTime()) .. " seconds before trying to change teams.")
		return
	end
	
	if ply:Team() != TEAM_COMBINE then
		ply:SetTeam(TEAM_COMBINE)
		//ply:ConCommand("ta_classmenu")
		//ply:Spawn()
		ply.NextTeamChange = CurTime() + 2
	end
end

concommand.Add("ta_gocombine", TA_GoCombine)

local function TA_GoRecon(ply)
	if ply:Alive() and not ply.InitialSpawn then
		ply:ChatPrint("You will become a Recon upon respawning")
		ply.NewClass = "Recon"
		return
	end
	
	TA_CheckTeam(ply)
	
	if ply.Class != "Recon"  then
		ply.NewClass = "Recon"
		
		umsg.Start("RPTINFO")
			umsg.Entity(ply)
			umsg.Short(80)
			umsg.Short(40)
			umsg.String("Recon")
		umsg.End()
		
		timer.Simple(0.1, function()
			ply:ConCommand("ta_helpmenu")
		end)
	end
end

concommand.Add("ta_gorecon", TA_GoRecon)

local function TA_GoEngineer(ply)
	if ply:Alive() and not ply.InitialSpawn then
		ply:ChatPrint("You will become an Engineer upon respawning")
		ply.NewClass = "Engineer"
		return
	end
	
	TA_CheckTeam(ply)
	
	if ply.Class != "Engineer"  then
		ply.NewClass = "Engineer"
		
		umsg.Start("RPTINFO")
			umsg.Entity(ply)
			umsg.Short(85)
			umsg.Short(85)
			umsg.String("Engineer")
		umsg.End()
		
		timer.Simple(0.1, function()
			ply:ConCommand("ta_helpmenu")
		end)
	end
end

concommand.Add("ta_goengineer", TA_GoEngineer)

local function TA_GoAssault(ply)
	if ply:Alive() and not ply.InitialSpawn then
		ply:ChatPrint("You will become an Assault upon respawning")
		ply.NewClass = "Assault"
		return
	end
	
	TA_CheckTeam(ply)
	
	if ply.Class != "Assault"  then
		ply.NewClass = "Assault"
		
		umsg.Start("RPTINFO")
			umsg.Entity(ply)
			umsg.Short(100)
			umsg.Short(50)
			umsg.String("Assault")
		umsg.End()
		
		timer.Simple(0.1, function()
			ply:ConCommand("ta_helpmenu")
		end)
	end
end

concommand.Add("ta_goassault", TA_GoAssault)

local function TA_GoMedic(ply)
	if ply:Alive() and not ply.InitialSpawn then
		ply:ChatPrint("You will become a Medic upon respawning")
		ply.NewClass = "Medic"
		return
	end
	
	TA_CheckTeam(ply)
	
	if ply.Class != "Medic"  then
		ply.NewClass = "Medic"
		
		umsg.Start("RPTINFO")
			umsg.Entity(ply)
			umsg.Short(110)
			umsg.Short(55)
			umsg.String("Medic")
		umsg.End()
		
		timer.Simple(0.1, function()
			ply:ConCommand("ta_helpmenu")
		end)
	end
end

concommand.Add("ta_gomedic", TA_GoMedic)

function TA_CheckTeam(ply)
	if ply:Team() == TEAM_SPECTATOR then
		local Rebels = #team.GetPlayers(TEAM_REBELS)
		local Combine = #team.GetPlayers(TEAM_COMBINE)
		
		if Rebels < Combine then
			ply:SetTeam(TEAM_REBELS)
		elseif Rebels > Combine then
			ply:SetTeam(TEAM_COMBINE)
		else
			ply:SetTeam(TEAM_REBELS)
		end
		
		ply.Class = "Recon"
		ply.NewClass = "Recon"
		ply:Spawn()
		ply.InitialSpawn = false
	end
end

local PrimaryWeapons = {}

function TA_RegisterPrimaryWeapon(weapon, ammo, ammotype, number, altammo)
	table.insert(PrimaryWeapons, {weapon = weapon, ammo = ammo, ammotype = ammotype, number = number, altammo = altammo})
end

TA_RegisterPrimaryWeapon("ta_smg_skorpion", 160, "pistol", 0)
TA_RegisterPrimaryWeapon("ta_smg_mp7", 120, "pistol", 1)
TA_RegisterPrimaryWeapon("ta_smg_vector", 120, "HelicopterGun", 2) -- .45 ACP
TA_RegisterPrimaryWeapon("ta_smg_bizon", 192, "Gravity", 3) -- 9x18 Makarov
TA_RegisterPrimaryWeapon("ta_smg_p90", 100, "AlyxGun", 4)
TA_RegisterPrimaryWeapon("ta_smg_kacpdw", 90, "smg1", 5)
TA_RegisterPrimaryWeapon("ta_shotgun_m3", 24, "buckshot", 6)
TA_RegisterPrimaryWeapon("ta_shotgun_xm1014", 21, "buckshot", 7)
TA_RegisterPrimaryWeapon("ta_shotgun_spas12", 24, "buckshot", 8)
TA_RegisterPrimaryWeapon("ta_rif_hk416", 90, "AirboatGun", 9, true) -- 5.56x45MM
TA_RegisterPrimaryWeapon("ta_rif_scarl", 90, "AirboatGun", 10) -- 5.56x45MM
TA_RegisterPrimaryWeapon("ta_rif_sig552", 90, "AirboatGun", 11) -- 5.56x45MM
TA_RegisterPrimaryWeapon("ta_rif_sr3m", 90, "GaussEnergy", 12) -- 9x39MM
TA_RegisterPrimaryWeapon("ta_rif_g36c", 90, "AirboatGun", 13, true) -- 9x39MM
TA_RegisterPrimaryWeapon("ta_rif_auga3", 90, "AirboatGun", 14)
TA_RegisterPrimaryWeapon("ta_rif_sg551", 90, "AirboatGun", 15)
TA_RegisterPrimaryWeapon("ta_rif_m16a4", 90, "AirboatGun", 16, true)
TA_RegisterPrimaryWeapon("ta_rif_lr300", 100, "AirboatGun", 17)
TA_RegisterPrimaryWeapon("ta_rif_m4a1", 90, "AirboatGun", 18, true)
TA_RegisterPrimaryWeapon("ta_rif_ak74u", 90, "GaussEnergy", 19)
TA_RegisterPrimaryWeapon("ta_rif_m14ebr", 60, "SniperPenetratedRound", 20) -- 7.62x51MM
TA_RegisterPrimaryWeapon("ta_rif_g3a3", 60, "SniperPenetratedRound", 21) -- 7.62x51MM
TA_RegisterPrimaryWeapon("ta_rif_fnfal", 60, "SniperPenetratedRound", 22) -- 7.62x51MM
TA_RegisterPrimaryWeapon("ta_rif_m249norm", 200, "AirboatGun", 23) -- 5.56x45MM
TA_RegisterPrimaryWeapon("ta_rif_aresshrike", 200, "AirboatGun", 24) -- 5.56x45MM

local SecondaryWeapons = {}

function TA_RegisterSecondaryWeapon(weapon, ammo, ammotype, number)
	table.insert(SecondaryWeapons, {weapon = weapon, ammo = ammo, ammotype = ammotype, number = number})
end

TA_RegisterSecondaryWeapon("ta_pistol_627", 18, "357", 0) 
TA_RegisterSecondaryWeapon("ta_pistol_m1911", 28, "HelicopterGun", 1)
TA_RegisterSecondaryWeapon("ta_pistol_makarov", 64, "Gravity", 2)  
TA_RegisterSecondaryWeapon("ta_pistol_glock", 57, "pistol", 3)
TA_RegisterSecondaryWeapon("ta_pistol_m92fs", 60, "pistol", 4)
TA_RegisterSecondaryWeapon("ta_frag_grenade", 1, "Grenade", 5)
TA_RegisterSecondaryWeapon("ta_smoke_grenade", 2, "Grenade", 6)

function TA_GiveLoadout(ply)
	local PrimaryWeaponNum = tonumber(ply:GetInfo("ta_weapon_primary"))
	local SecondaryWeaponNum = tonumber(ply:GetInfo("ta_weapon_secondary"))
	local wep = ply:GetActiveWeapon()
	
	if ply.Class == "Recon" then
	
		if not PrimaryWeaponNum or PrimaryWeaponNum > 5 then
			ply:Give("ta_smg_skorpion")
			ply:GiveAmmo(160, "pistol")
		else
			for k, v in ipairs(PrimaryWeapons) do 
				if PrimaryWeaponNum == v.number then
					ply:Give(v.weapon)
					ply:GiveAmmo(v.ammo, v.ammotype)
				end
			end
		end
		
		if not PrimaryWeaponNum or SecondaryWeaponNum > 6 then
			ply:Give("ta_pistol_m1911")
			ply:GiveAmmo(28, "HelicopterGun")
		else
			for k, v in ipairs(SecondaryWeapons) do 
				if SecondaryWeaponNum == v.number then
					ply:Give(v.weapon)
					ply:GiveAmmo(v.ammo, v.ammotype)
				end
			end
		end
		
	elseif ply.Class == "Engineer" then
	
		if not PrimaryWeaponNum or PrimaryWeaponNum > 8 then
			ply:Give("ta_smg_vector")
			ply:GiveAmmo(90, "HelicopterGun")
		else
			for k, v in ipairs(PrimaryWeapons) do 
				if PrimaryWeaponNum == v.number then
					ply:Give(v.weapon)
					ply:GiveAmmo(v.ammo, v.ammotype)
				end
			end
		end
		
		if not PrimaryWeaponNum or SecondaryWeaponNum > 6 then
			ply:Give("ta_pistol_makarov")
			ply:GiveAmmo(64, "Gravity")
		else
			for k, v in ipairs(SecondaryWeapons) do 
				if SecondaryWeaponNum == v.number then
					ply:Give(v.weapon)
					ply:GiveAmmo(v.ammo, v.ammotype)
				end
			end
		end
		
	elseif ply.Class == "Assault" then
	
		if not PrimaryWeaponNum or PrimaryWeaponNum > 24 then
			ply:Give("ta_rif_hk416")
			ply:GiveAmmo(90, "AirboatGun")
			
			ply:GiveAmmo(1, "SMG1_Grenade")
		else
			for k, v in ipairs(PrimaryWeapons) do 
				if PrimaryWeaponNum == v.number then
					ply:Give(v.weapon)
					ply:GiveAmmo(v.ammo, v.ammotype)
					
					if v.altammo then
						ply:GiveAmmo(1, "SMG1_Grenade")
					end
				end
			end
		end
		
		if not PrimaryWeaponNum or SecondaryWeaponNum > 6 then
			ply:Give("ta_pistol_627")
			ply:GiveAmmo(18, "magnum")
		else
			for k, v in ipairs(SecondaryWeapons) do 
				if SecondaryWeaponNum == v.number then
					ply:Give(v.weapon)
					ply:GiveAmmo(v.ammo, v.ammotype)
				end
			end
		end
		
	elseif ply.Class == "Medic" then
		
		if not PrimaryWeaponNum or (PrimaryWeaponNum > 19 and PrimaryWeaponNum < 22) then
			ply:Give("ta_rif_hk416")
			ply:GiveAmmo(90, "AirboatGun")
			
			ply:GiveAmmo(1, "SMG1_Grenade")
		else
			for k, v in ipairs(PrimaryWeapons) do 
				if PrimaryWeaponNum == v.number then
					ply:Give(v.weapon)
					ply:GiveAmmo(v.ammo, v.ammotype)
					
					if v.altammo then
						ply:GiveAmmo(1, "SMG1_Grenade")
					end
				end
			end
		end
		
		if not PrimaryWeaponNum or SecondaryWeaponNum > 6 then
			ply:Give("ta_pistol_m1911")
			ply:GiveAmmo(28, "HelicopterGun")
		else
			for k, v in ipairs(SecondaryWeapons) do 
				if SecondaryWeaponNum == v.number then
					ply:Give(v.weapon)
					ply:GiveAmmo(v.ammo, v.ammotype)
				end
			end
		end
		
	end
	
	timer.Simple(0.1, function()
		if ply:Team() != TEAM_SPECTATOR and IsValid(wep) then
		
			local ammotype = tonumber(ply:GetInfo("ta_weapon_primary_ammo"))
			if ammotype == 2 then
				for k, v in ipairs(ply:GetWeapons()) do
					if v:GetClass():find("^ta_smg_") or v:GetClass():find("^ta_rif_") then
						v:SetDTInt(2, 3)
					end
				end
			elseif ammotype == 3 then
				for k, v in ipairs(ply:GetWeapons()) do
					if v:GetClass():find("^ta_smg_") or v:GetClass():find("^ta_rif_") then
						v:SetDTInt(2, 2)
					end
				end
			elseif ammotype == 4 then
				for k, v in ipairs(ply:GetWeapons()) do
					if (v:GetClass():find("^ta_smg_") or v:GetClass():find("^ta_rif_")) and not v:GetClass():find("^ta_rif_aresshrike") and v:GetClass():find("^ta_rif_m249norm") then
						v.Primary.Damage = v.Primary.Damage * 1.15
						v.DefRecoil = v.DefRecoil * 1.3
					//	v:SetDTInt(2, 1)
					end
				end
			elseif ammotype == 5 then
				for k, v in ipairs(ply:GetWeapons()) do
					if v:GetClass():find("^ta_shotgun_") then
						v.Primary.Damage = v.Primary.Damage * 7.6
						v.Primary.NumShots = 1
						v.IronsightsCone = v.IronsightsCone * 0.05
						v.ScopeCone = v.ScopeCone * 0.05
						v.VelocitySensivity = 2.2
						
						umsg.Start("NBUL")
							umsg.Entity(v)
						umsg.End()
					end
				end
			end
			
			local attachment = tonumber(ply:GetInfo("ta_weapon_primary_attachment"))
			local attachment2 = tonumber(ply:GetInfo("ta_weapon_primary_attachment2"))
			local secattachment = tonumber(ply:GetInfo("ta_weapon_secondary_attachment"))
			
			for k, v in ipairs(ply:GetWeapons()) do
				if v:GetClass():find("^ta_smg_") or v:GetClass():find("^ta_rif_") or v:GetClass():find("^ta_shotgun_") then
					if attachment == 4 then
						if v.NoEOTech != true then
							v:NWATT(attachment)
							
							//if not v:GetClass():find("ta_rif_aresshrike") or not v:GetClass():find("ta_rif_m249norm") then
							if v.ConeInaccuracyAff1 > 0.45 then
								v.ConeInaccuracyAff1 = 0.45 -- 45% max bullet spread
							end
							
							v.HipCone = v.HipCone * 1.2 -- 120% hip cone inaccuracy
							v.DrawSpeed = v.DrawSpeed - 0.07
						end
					elseif attachment == 3 then
						if v.NoAimpoint != true then
							v:NWATT(attachment)
							v.HipCone = v.HipCone * 1.4
							v.DrawSpeed = v.DrawSpeed - 0.07
						end
					elseif attachment == 2 then
						if v.NoACOG != true then
							v:NWATT(attachment)
							v.HipCone = v.HipCone * 1.6
							v.DrawSpeed = v.DrawSpeed - 0.07
						end
					end
						
					if attachment2 == 6 then
						if v.NoGL != true then
							v:NWATT(attachment2)
							v.SecondaryAtt = 1
							v.DrawSpeed = v.DrawSpeed - 0.1
							v.HipCone = v.HipCone * 1.1
						end
					elseif attachment2 == 7 then
						if v.NoVertGrip != true then
							v:NWATT(attachment2)
						end
					elseif attachment2 == 8 then
						if v.NoCMag != true then
							v:NWATT(attachment2)
							v.MaxAmmo = 100
							ply:SetAmmo(100, v:GetPrimaryAmmoType())
						end
					end
				elseif v:GetClass():find("^ta_pistol_") then
					if secattachment == 2 then
						if v.NoACOG != true then
							v:NWATT(secattachment)
							v.HipCone = v.HipCone * 1.3
							v.DrawSpeed = v.DrawSpeed - 0.11
						end
					elseif secattachment == 9 then
						if v.NoDocter != true then
							v:NWATT(secattachment)
							v.HipCone = v.HipCone * 1.1
							v.DrawSpeed = v.DrawSpeed - 0.08
						end
					end
				end
			end
		end
	end)
end

local Skills = {}

function TA_RegisterSkill(number, requiredSkill)
	if requiredSkill then
		table.insert(Skills, {skillname = "Skill" .. number, number = number, requiredSkill = "Skill" .. requiredSkill})
	else
		table.insert(Skills, {skillname = "Skill" .. number, number = number})
	end
end

TA_RegisterSkill(1, nil)
TA_RegisterSkill(2, 1)
TA_RegisterSkill(3, 2)
TA_RegisterSkill(4, 3)
TA_RegisterSkill(5, 4)
TA_RegisterSkill(6, nil)
TA_RegisterSkill(7, 6)
TA_RegisterSkill(8, 7)
TA_RegisterSkill(9, 8)
TA_RegisterSkill(10, 9)
TA_RegisterSkill(11, nil)
TA_RegisterSkill(12, 11)
TA_RegisterSkill(13, 12)
TA_RegisterSkill(14, 13)
TA_RegisterSkill(15, 14)
TA_RegisterSkill(16, nil)
TA_RegisterSkill(17, 16)
TA_RegisterSkill(18, 17)
TA_RegisterSkill(19, 18)
TA_RegisterSkill(20, 19)

--[[
1 = Butcher
2 = Obstacle Course
3 = Invisible Man
4 = Makeshift Armor
5 = Demolition Man
6 = Armored Knight
7 = Full Pockets
8 = Heave-Ho!
9 = Marksman
10 = Regular Routine
11 = Steady Hand
12 = Lifesaver
13 = Efficient Medicine
14 = Battle-Hardened]]--

function TA_GivePerks(ply)
	if ply:Team() != TEAM_SPECTATOR then
		if not ply:GetPData("InitialWipe1") then
			ply:SetPData("Experience", 0)
			ply:SetPData("Level", 1)
			ply:SetPData("SkillPoints", 0)
			ply:SetPData("InitialWipe1", 1)
			
			for i = 1, 20 do
				if not ply:GetPData("Skill" .. i) then
					ply:SetPData("Skill" .. i, 0)
				end
			end
		end
		
		local PerkNumber = tonumber(ply:GetInfo("ta_personalattribute"))
		
		if PerkNumber == 1 then -- Constant Pacing
			ply:SetRunSpeed(ply:GetRunSpeed() * 0.9)
			ply:SetWalkSpeed(ply:GetWalkSpeed() * 1.3)
		elseif PerkNumber == 2 then -- Head-First
			ply:SetRunSpeed(ply:GetRunSpeed() * 1.2)
			ply.StrafeMod = 0
		elseif PerkNumber == 3 then -- Walking Ammo Bag
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.MaxAmmo = v.MaxAmmo + v.Primary.ClipSize
						ply:GiveAmmo(v.Primary.ClipSize, v:GetPrimaryAmmoType())
					end
				end
			end)
			
			ply:SetRunSpeed(ply:GetRunSpeed() * 0.9)
		elseif PerkNumber == 4 then -- Agile Hands
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.ReloadSpeed = v.ReloadSpeed + 0.2
						v.DrawSpeed = v.DrawSpeed - 0.1
					end
				end
			end)
		elseif PerkNumber == 5 then -- Spray and Pray
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.ConeInaccuracyAff1 = math.Clamp(v.ConeInaccuracyAff1 - 0.3, 0.2, 1)
						v.HipCone = v.HipCone * 1.1
						v.IronsightsCone = v.IronsightsCone * 1.1
						
						if v.ScopeCone then
							v.ScopeCone = v.ScopeCone * 1.1
						end
					end
				end
			end)
		elseif PerkNumber == 6 then
			ply.MaxWallRuns = math.Clamp(ply.MaxWallRuns + 1, 1, 3)
			
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						if v.MaxAmmo - v.Primary.ClipSize <= 0 then
							ply:RemoveAmmo(v.MaxAmmo * 0.5, v:GetPrimaryAmmoType())
							v.MaxAmmo = v.MaxAmmo * 0.5
						else
							v.MaxAmmo = v.MaxAmmo - v.Primary.ClipSize
							ply:RemoveAmmo(v.Primary.ClipSize, v:GetPrimaryAmmoType())
						end
					end
				end
			end)
		elseif PerkNumber == 7 then
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.HipCone = v.HipCone * 1.1
						v.IronsightsCone = v.IronsightsCone * 0.85
						
						if v.ScopeCone then
							v.ScopeCone = v.ScopeCone * 0.85
						end
					end
				end
			end)
		elseif PerkNumber == 8 then
			ply.MaxArmor = ply.MaxArmor + 65
			ply:SetRunSpeed(ply:GetRunSpeed() * 0.85)
			ply.MaxWallRuns = ply.MaxWallRuns - 1
		end
		
		if ply:GetPData("Skill1") == "1" then -- Butcher
			umsg.Start("UNLCK", ply)
				umsg.Short(1)
			umsg.End()
			
			timer.Simple(0.2, function()
				if ply.Class == "Recon" then
					for k, v in pairs(ply:GetWeapons()) do
						if v:GetClass() == "ta_recon_knife" then
							v.DamageToPlayers1 = v.DamageToPlayers1 * 1.5
							v.DamageToPlayers2 = v.DamageToPlayers2 * 1.5
							v.SwingDelay = v.SwingDelay - 0.1
						end
					end
				end
			end)
		end
		
		if ply:GetPData("Skill2") == "1" then -- Obstacle Course
			umsg.Start("UNLCK", ply)
				umsg.Short(2)
			umsg.End()
			
			ply:SetJumpPower(ply:GetJumpPower() * 1.1)
		end
	
		if ply:GetPData("Skill3") == "1" then -- Lightweight
			umsg.Start("UNLCK", ply)
				umsg.Short(3)
			umsg.End()
			
			if ply.Class == "Recon" then
				ply.FootstepVolumeMul = 0.8
			end
		end
		
		if ply:GetPData("Skill4") == "1" then -- Quickdraw
			umsg.Start("UNLCK", ply)
				umsg.Short(4)
			umsg.End()
			
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.DrawSpeed = v.DrawSpeed + 0.1
					end
				end
			end)
		end
		
		if ply:GetPData("Skill5") == "1" then -- Invisible Man
			umsg.Start("UNLCK", ply)
				umsg.Short(5)
			umsg.End()
			
			ply.DrainMod = 0.8
		end
		
		if ply:GetPData("Skill6") == "1" then -- Makeshift Armor
			umsg.Start("UNLCK", ply)
				umsg.Short(6)
			umsg.End()
			
			ply.SelfRepairMod = 0.75
		end
		
		if ply:GetPData("Skill7") == "1" then -- Script Kiddie
			umsg.Start("UNLCK", ply)
				umsg.Short(7)
			umsg.End()
			
			for k, v in pairs(ply:GetWeapons()) do
				if v:GetClass() == "ta_charge" then
					v.PlantSpeedMul = 2
				end
			end
		end
		
		if ply:GetPData("Skill8") == "1" then -- Demolition Man
			umsg.Start("UNLCK", ply)
				umsg.Short(8)
			umsg.End()

			ply.ExplosiveDamageMod = 1.1
		end
		
		if ply:GetPData("Skill9") == "1" then -- Armored Knight
			umsg.Start("UNLCK", ply)
				umsg.Short(9)
			umsg.End()
			
			ply.MaxArmor = ply.MaxArmor + 15
			ply:SetArmor(ply.MaxArmor)
		end
		
		if ply:GetPData("Skill10") == "1" then -- Explosive Hoarder
			umsg.Start("UNLCK", ply)
				umsg.Short(10)
			umsg.End()
			
			if ply.Class == "Engineer" then
				timer.Simple(0.2, function()
					for k, v in pairs(ply:GetWeapons()) do
						if v:GetClass() == "ta_charge" then
							v.MaxAmmo = 2
							ply:GiveAmmo(1, "slam")
						end
					end
				end)
			end
		end
		
		if ply:GetPData("Skill11") == "1" then -- Full Pockets
			umsg.Start("UNLCK", ply)
				umsg.Short(11)
			umsg.End()
			
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.MaxAmmo = v.MaxAmmo + v.Primary.ClipSize
						ply:GiveAmmo(v.Primary.ClipSize, v:GetPrimaryAmmoType())
					end
				end
			end)
		end
		
		if ply:GetPData("Skill12") == "1" then -- Heave-Ho!
			umsg.Start("UNLCK", ply)
				umsg.Short(12)
			umsg.End()
			
			ply.GrenadeRangeMod = 1.15
		end
		
		if ply:GetPData("Skill13") == "1" then -- Marksman
			umsg.Start("UNLCK", ply)
				umsg.Short(13)
			umsg.End()
			
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.IronsightsCone = v.IronsightsCone * 0.9
						
						if v.ScopeCone then
							v.ScopeCone = v.ScopeCone * 0.9
						end
					end
				end
			end)
		end
		
		if ply:GetPData("Skill14") == "1" then -- Regular Routine
			umsg.Start("UNLCK", ply)
				umsg.Short(14)
			umsg.End()
			
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.ReloadSpeed = v.ReloadSpeed + 0.1
					end
				end
			end)
		end
		
		if ply:GetPData("Skill15") == "1" then -- Steady Hand
			umsg.Start("UNLCK", ply)
				umsg.Short(15)
			umsg.End()
			
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v.IsCustomWeapon then
						v.RecoilAff4 = 0.1
					end
				end
			end)
		end
		
		if ply:GetPData("Skill16") == "1" then -- Lifesaver
			umsg.Start("UNLCK", ply)
				umsg.Short(16)
			umsg.End()
			
			ply.HealAmountToGive = 30
		end
		
		if ply:GetPData("Skill17") == "1" then -- Efficient Medicine
			umsg.Start("UNLCK", ply)
				umsg.Short(17)
			umsg.End()
			
			ply.HealSelfMedicMod = 0.5
		end
		
		if ply:GetPData("Skill18") == "1" then -- Battle-Hardened
			umsg.Start("UNLCK", ply)
				umsg.Short(18)
			umsg.End()

			ply:SetMaxHealth(ply:GetMaxHealth() * 1.1)
			ply:SetHealth(ply:GetMaxHealth())
		end
		
		if ply:GetPData("Skill19") == "1" then
			umsg.Start("UNLCK", ply)
				umsg.Short(19)
			umsg.End()
			
			ply.MedkitRegenDelayMul = 0.8
		end
		
		if ply:GetPData("Skill20") == "1" then
			umsg.Start("UNLCK", ply)
				umsg.Short(20)
			umsg.End()
			
			timer.Simple(0.2, function()
				for k, v in pairs(ply:GetWeapons()) do
					if v:GetClass() == "ta_ahd" then
						v.AdditionalHeal = 1
					end
				end
			end)
		end
		
		umsg.Start("RPTINFO")
			umsg.Entity(ply)
			umsg.Short(ply:GetMaxHealth())
			umsg.Short(ply.MaxArmor)
			umsg.String(ply.Class or ply.NewClass)
		umsg.End()
	end
end

local function TA_UseMedkit(ply)
	if not ply:Alive() or ply:Health() >= ply:GetMaxHealth() or ply:GetDTFloat(1) / 20 < 1 or CurTime() < ply.ActionDelay  then
		return
	end
	
	if ply.Class == "Medic" and ply:GetDTFloat(1) / 20 < 2 then
		return
	end
	
	local wep = ply:GetActiveWeapon()
	
	if IsValid(wep) then
		wep:SetNextPrimaryFire(CurTime() + 2)
		wep:SetNextPrimaryFire(CurTime() + 2)
		wep:SetDTInt(3, 6)
	end
	
	ply.ActionDelay = CurTime() + 2
	ply:SetFOV(0)

	
	timer.Simple(0.5, function()
		if not IsValid(ply) or not ply:Alive() then
			return
		end
		
		ply:SetHealth(math.Clamp(ply:Health() + ply.HealAmount, 0, ply:GetMaxHealth()))
		ply.HealAmount = 25
		
		if ply.Class == "Medic" then
			ply:SetDTFloat(1, ply:GetDTFloat(1) - (40 * ply.HealSelfMedicMod))
		else
			ply:SetDTFloat(1, ply:GetDTFloat(1) - 20)
		end
		
		if ply:IsOnFire() then
			ply:Extinguish()
		end
		
		ply:EmitSound("items/medshot4.wav", 60, 100)
	end)
	
	timer.Simple(1.5, function()
		if not IsValid(ply) then
			return
		end
		
		if IsValid(wep) then
			wep:SetDTInt(3, 0)
		end
	end)
end

concommand.Add("ta_use_medkit", TA_UseMedkit)

local function TA_DoAction(ply)
	local trace = ply:GetEyeTrace()

	if ply.Class == "Medic" then
		if CurTime() < ply.ActionDelay or ply:GetDTFloat(1) / 20 < 1 or trace.Entity:GetDTFloat(1) >= 20 or not ply:Alive() then
			return
		end
	
		if trace.HitPos:Distance(ply:GetShootPos()) < 70 and trace.Entity:IsPlayer() then
			if trace.Entity:Team() == ply:Team() and ply:Alive() then
				ply:DoAnimationEvent(ACT_ITEM_GIVE)
				local wep = ply:GetActiveWeapon()
				
				if IsValid(wep) then
					wep:SetDTInt(3, 6)
				end
				
				ply.ActionDelay = CurTime() + 1.5
				ply:SetFOV(0)
				
				if IsValid(wep) then
					wep:SetNextPrimaryFire(CurTime() + 0.5)
					wep:SetNextSecondaryFire(CurTime() + 0.5)
				end
				
				timer.Simple(0.5, function()
					if ply:GetDTFloat(1) / 20 < 1 or trace.Entity:GetDTFloat(1) >= 20 or not ply:Alive() then
						return
					else
						wep:SetDTInt(3, 0)
						ply.ActionDelay = CurTime() + 0.5
					end
					
					if trace.HitPos:Distance(ply:GetShootPos()) < 70 and trace.Entity:IsPlayer() and trace.Entity:Team() == ply:Team() and ply:Alive() then -- double check everything in case another player tries to give a player another medkit
						trace.Entity:SetDTFloat(1, 20)
						trace.Entity:EmitSound("weapons/draw_melee.wav", 60, 100)
						trace.Entity.HealAmount = ply.HealAmountToGive
						ply:SetDTFloat(1, ply:GetDTFloat(1) - 20)
						ply.MedkitRegenDelay = CurTime() + 1
						TA_AddExperience(ply, 25, 0)
						wep:SetDTInt(3, 0)
						
						if IsValid(wep) then
							wep:SetNextPrimaryFire(CurTime() + 1.5)
							wep:SetNextSecondaryFire(CurTime() + 1.5)
						end
				
						ply:AddFrags(1)
						
						if ply:Team() == TEAM_REBELS then
							ply:EmitSound("vo/npc/male01/health0" .. math.random(1, 5) .. ".wav", 80, math.random(99, 101))
						end
						
						local TracedEnt = trace.Entity
						
						umsg.Start("ACT", ply)
							umsg.Entity(TracedEnt)
							umsg.Entity(ply)
							umsg.Short(5)
						umsg.End()
						
						umsg.Start("ACT", TracedEnt)
							umsg.Entity(TracedEnt)
							umsg.Entity(ply)
							umsg.Short(5)
						umsg.End()
						
						if TracedEnt:Team() == TEAM_REBELS then
							timer.Simple(1, function()
								TracedEnt:EmitSound(table.Random(ThanksSounds), 85, math.random(99, 101))
							end)
						end
					end
				end)
			end
		end
	elseif ply.Class == "Engineer" then
	
		if trace.HitPos:Distance(ply:GetShootPos()) < 70 and trace.Entity:IsPlayer() then
			if trace.Entity:Team() == ply:Team() and ply:Alive() then
			
				if CurTime() < ply.ActionDelay or trace.Entity:Armor() >= trace.Entity.MaxArmor then
					return
				end
				
				local wep = ply:GetActiveWeapon()
				ply:DoAnimationEvent(ACT_ITEM_GIVE)
				
				if IsValid(wep) then
					wep:SetDTInt(3, 6)
				end
				
				ply.ActionDelay = CurTime() + 1.5
				
				if IsValid(wep) then
					wep:SetNextPrimaryFire(CurTime() + 1.5)
					wep:SetNextSecondaryFire(CurTime() + 1.5)
				end
				
				ply:SetFOV(0)
				
				timer.Simple(0.5, function()
					if not ply:Alive() then
						return
					else
						if IsValid(wep) then
							wep:SetDTInt(3, 0)
						end
						
						ply.ActionDelay = CurTime() + 0.5
						
						if IsValid(wep) then
							wep:SetNextPrimaryFire(CurTime() + 0.5)
							wep:SetNextSecondaryFire(CurTime() + 0.5)
						end
					end
					
					if trace.HitPos:Distance(ply:GetShootPos()) < 70 and trace.Entity:IsPlayer() and trace.Entity:Team() == ply:Team() and ply:Alive() then
						trace.Entity:EmitSound("wear_" .. math.random(2, 4) .. ".mp3", 70, 100)
						trace.Entity:SetArmor(trace.Entity.MaxArmor)
						ply:SetDTFloat(2, ply:GetDTFloat(2) - 20)
						ply.ArmorRegenDelay = CurTime() + 1
						TA_AddExperience(ply, 25, 0)
						wep:SetDTInt(3, 0)
						ply:AddFrags(1)
						
						local TracedEnt = trace.Entity
						
						umsg.Start("ACT", ply)
							umsg.Entity(TracedEnt)
							umsg.Entity(ply)
							umsg.Short(2)
						umsg.End()
						
						umsg.Start("ACT", TracedEnt)
							umsg.Entity(TracedEnt)
							umsg.Entity(ply)
							umsg.Short(2)
						umsg.End()
						
						if TracedEnt:Team() == TEAM_REBELS then
							timer.Simple(1, function()
								TracedEnt:EmitSound(table.Random(ThanksSounds), 85, math.random(99, 101))
							end)
						end
					end
				end)
			end
		else
			if CurTime() < ply.ActionDelay or ply:Armor() >= ply.MaxArmor or ply:GetDTFloat(2) < 40 * ply.SelfRepairMod then
				return
			end
			
			local wep = ply:GetActiveWeapon()
			
			if IsValid(wep) then
				wep:SetDTInt(3, 6)
			end
			
			ply.ActionDelay = CurTime() + 1.5
			
			if IsValid(wep) then
				wep:SetNextPrimaryFire(CurTime() + 1.5)
				wep:SetNextPrimaryFire(CurTime() + 1.5)
			end
			
			ply:SetFOV(0)
				
			timer.Simple(0.5, function()
				if ply:GetDTFloat(2) < 40 * ply.SelfRepairMod or not ply:Alive() or ply:Armor() >= ply.MaxArmor  then
					return
				else
					wep:SetDTInt(3, 0)
					ply.ActionDelay = CurTime() + 0.5
					
					if IsValid(wep) then
						wep:SetNextPrimaryFire(CurTime() + 0.5)
						wep:SetNextSecondaryFire(CurTime() + 0.5)
					end
					
				end
				
				umsg.Start("ACT", ply)
					umsg.Entity(0)
					umsg.Entity(0)
					umsg.Short(1)
				umsg.End()
					
				ply:SetArmor(ply.MaxArmor)
				ply:SetDTFloat(2, ply:GetDTFloat(2) - 40 * ply.SelfRepairMod)
				ply:EmitSound("wear_" .. math.random(2, 4) .. ".mp3", 70, 100)
				ply.ArmorRegenDelay = CurTime() + 1
				wep:SetDTInt(3, 0)
			end)
		end
	elseif ply.Class == "Assault" then
		if trace.HitPos:Distance(ply:GetShootPos()) < 70 and trace.Entity:IsPlayer() then
			if trace.Entity:Team() == ply:Team() and ply:Alive() then
				if CurTime() < ply.ActionDelay or trace.Entity:GetAmmoCount(trace.Entity:GetActiveWeapon():GetPrimaryAmmoType()) >= trace.Entity:GetActiveWeapon().MaxAmmo or not trace.Entity:GetActiveWeapon().MaxAmmo then
					return
				end
				
				local wep = ply:GetActiveWeapon()
				ply:DoAnimationEvent(ACT_ITEM_GIVE)
				wep:SetDTInt(3, 6)
				ply.ActionDelay = CurTime() + 1.5
				
				if IsValid(wep) then
					wep:SetNextPrimaryFire(CurTime() + 1.5)
					wep:SetNextSecondaryFire(CurTime() + 1.5)
				end
					
				ply:SetFOV(0)
				
				timer.Simple(0.5, function()
					if not ply:Alive() or not trace.Entity:Alive() then
						return
					else
						wep:SetDTInt(3, 0)
						ply.ActionDelay = CurTime() + 0.5
						
						if IsValid(wep) then
							wep:SetNextPrimaryFire(CurTime() + 0.5)
							wep:SetNextSecondaryFire(CurTime() + 0.5)
						end
					
					end
					
					if trace.HitPos:Distance(ply:GetShootPos()) < 70 and trace.Entity:IsPlayer() and trace.Entity:Team() == ply:Team() then
						trace.Entity:EmitSound("items/ammo_pickup.wav", 60, 100)
						trace.Entity:RemoveAllAmmo()
						
						for k, v in ipairs(trace.Entity:GetWeapons()) do
						
							if trace.Entity.LastAmmo == v:GetPrimaryAmmoType() then
								trace.Entity:SetAmmo(trace.Entity:GetAmmoCount(v:GetPrimaryAmmoType()) + v.MaxAmmo, v:GetPrimaryAmmoType())
							else
								trace.Entity:SetAmmo(v.MaxAmmo, v:GetPrimaryAmmoType())
							end
							
							trace.Entity.LastAmmo = v:GetPrimaryAmmoType()
						end
						
						trace.Entity:GiveAmmo(1, "SMG1_Grenade")
						
						if ply:Team() == TEAM_REBELS then
							ply:EmitSound(table.Random(TakeAmmoSound), 85, math.random(99, 101))
						end
						
						ply:SetDTFloat(2, ply:GetDTFloat(2) - 20)
						TA_AddExperience(ply, 25, 0)
						ply.AmmoRegenDelay = CurTime() + 1
						wep:SetDTInt(3, 0)
						ply:AddFrags(1)
						
						local TracedEnt = trace.Entity
						
						umsg.Start("ACT", ply)
							umsg.Entity(TracedEnt)
							umsg.Entity(ply)
							umsg.Short(4)
						umsg.End()
						
						umsg.Start("ACT", TracedEnt)
							umsg.Entity(TracedEnt)
							umsg.Entity(ply)
							umsg.Short(4)
						umsg.End()
						
						if TracedEnt:Team() == TEAM_REBELS then
							timer.Simple(1, function()
								TracedEnt:EmitSound(table.Random(ThanksSounds), 85, math.random(99, 101))
							end)
						end
					end
				end)
			end
		else
		
			local wep = ply:GetActiveWeapon()
			
			if not IsValid(ply) or CurTime() < ply.ActionDelay or not IsValid(wep) or ply:GetAmmoCount(wep:GetPrimaryAmmoType()) >= wep.MaxAmmo or ply:GetDTFloat(2) < 20 then
				return
			end
			
			wep:SetDTInt(3, 6)
			ply.ActionDelay = CurTime() + 1.5
			
			if IsValid(wep) then
				wep:SetNextPrimaryFire(CurTime() + 1.5)
				wep:SetNextSecondaryFire(CurTime() + 1.5)
			end
			
			ply:SetFOV(0)
				
			timer.Simple(0.5, function()
				if ply:GetDTFloat(2) < 20 or not ply:Alive() or ply:GetAmmoCount(wep:GetPrimaryAmmoType()) >= wep.MaxAmmo then
					return
				else
					wep:SetDTInt(3, 0)
					ply.ActionDelay = CurTime() + 0.5
					
					if IsValid(wep) then
						wep:SetNextPrimaryFire(CurTime() + 0.5)
						wep:SetNextSecondaryFire(CurTime() + 0.5)
					end
				end
				
				ply:RemoveAllAmmo()
					
				for k, v in ipairs(ply:GetWeapons()) do
				
					if ply.LastAmmo == v:GetPrimaryAmmoType() then
						ply:SetAmmo(ply:GetAmmoCount(v:GetPrimaryAmmoType()) + v.MaxAmmo, v:GetPrimaryAmmoType())
					else
						ply:SetAmmo(v.MaxAmmo, v:GetPrimaryAmmoType())
					end
					
					ply.LastAmmo = v:GetPrimaryAmmoType()
					
				end
				
				ply:GiveAmmo(1, "SMG1_Grenade")
				
				ply:SetDTFloat(2, ply:GetDTFloat(2) - 20)
				ply:EmitSound("items/ammo_pickup.wav", 60, 100)
				ply.ArmorRegenDelay = CurTime() + 1
				wep:SetDTInt(3, 0)
				
				umsg.Start("ACT", ply)
					umsg.Entity(0)
					umsg.Entity(0)
					umsg.Short(3)
				umsg.End()

			end)
		end
	elseif ply.Class == "Recon" then
		if CurTime() < ply.ActionDelay or not ply:Alive() or ply.IsHacking then
			return
		end
			
		if not ply.CloakOn and ply:GetDTInt(2) > 20 then
			ply.CloakOn = true
			ply:EmitSound("buttons/button18.wav", 55, 100)
		elseif (ply.CloakOn and ply:GetDTInt(2) < 20) or ply.CloakOn then
			ply.CloakOn = false
			ply:EmitSound("buttons/button19.wav", 55, 100)
		end
		
		if IsValid(wep) then
			wep:SetNextPrimaryFire(CurTime() + 0.5)
			wep:SetNextPrimaryFire(CurTime() + 0.5)
		end
		ply.ActionDelay = CurTime() + 0.5
	end
end

concommand.Add("ta_do_action", TA_DoAction)

local function TA_GiveMeInfo(ply)
	for k, v in pairs(player.GetAll()) do
		if v != ply and ply:Alive() and ply:Team() != 1002 and v:Team() != 1002 and v:Alive() and v.Class and v.MaxArmor and v.MaxHealth then
			umsg.Start("RPTINFO", ply)
				umsg.Entity(v)
				umsg.Short(v:GetMaxHealth())
				umsg.Short(v.MaxArmor)
				umsg.String(v.Class)
			umsg.End()
		end
	end
end

concommand.Add("ta_givemeinfo", TA_GiveMeInfo)

function TA_FinishSpawn(ply)
	if GameStarted == false then
		CurCurTime = CurTime() -- hacky as fuck
	end

	if FirstPlayerSpawned == false then
		if GameType == "assassination" then
			timer.Create("RoundTimeLimit", GetConVarNumber("ta_timelimit_vip") * 60, 1, function()
				TA_RestartRound(false)
				
				for k, v in pairs(team.GetPlayers(TEAM_COMBINE)) do
					TA_AddExperience(v, 200, 3)
				end
			end)
			
			Time = GetConVarNumber("ta_timelimit_vip") * 60
		elseif GameType == "commsabot" then
			timer.Create("RoundTimeLimit", GetConVarNumber("ta_timelimit_comsab") * 60, 1, function()
				TA_RestartRound(false)
				
				for k, v in pairs(team.GetPlayers(TEAM_COMBINE)) do
					TA_AddExperience(v, 200, 4)
				end
			end)
			
			Time = GetConVarNumber("ta_timelimit_comsab") * 60
			
		elseif GameType == "supplydepot" then
			timer.Create("RoundTimeLimit", GetConVarNumber("ta_timelimit_supplydepot") * 60, 1, function()
				TA_RestartRound(true)
				
				for k, v in pairs(team.GetPlayers(TEAM_REBELS)) do
					TA_AddExperience(v, 200, 9)
				end
			end)
			
			Time = GetConVarNumber("ta_timelimit_supplydepot") * 60
		else
			timer.Create("RoundTimeLimit", GetConVarNumber("ta_timelimit_tdm") * 60, 1, function()
				if team.TotalFrags(TEAM_REBELS) > team.TotalFrags(TEAM_COMBINE) then
					TA_RestartRound(true)
					
					for k, v in pairs(team.GetPlayers(TEAM_REBELS)) do
						TA_AddExperience(v, 200, 12)
					end
				else
					TA_RestartRound(false)
					
					for k, v in pairs(team.GetPlayers(TEAM_COMBINE)) do
						TA_AddExperience(v, 200, 12)
					end
				end
			end)
			
			Time = GetConVarNumber("ta_timelimit_tdm") * 60
		end
	
		FirstPlayerSpawned = true
	end
	
	if ply.InitialSpawn then
		umsg.Start("TimeLeft", ply)
			umsg.Short(Time + CurCurTime) -- this way the time indicator is always correct, regardless of how much time (CurTime()) has passed
		umsg.End()
	
		ply:UnSpectate()
		ply:Spawn()
		ply.InitialSpawn = false
		GameStarted = true
	end
end

concommand.Add("ta_finishspawn", TA_FinishSpawn)

function TA_EndGame(boolean)
	//if GameType == "assassination" then
	
	umsg.Start("EndGame")
		umsg.Bool(boolean)
		umsg.String(game.GetMapNext())
	umsg.End()
		
	GameEnded = true
		
	for k, v in pairs(player.GetAll()) do
		v:StripWeapons()
	end
		
	timer.Simple(30, function()
		game.LoadNextMap()
	end)
	//end
end

function TA_NotifyPlayers(class)
	EndGameClass = class

	umsg.Start("EGSTAT")
		umsg.String(class)
	umsg.End()
end

function TA_RestartRound(boolean)
	timer.Destroy("RoundTimeLimit")
	TotalRebels = 0
	TotalCombine = 0
	
	if CurrentRound + 1 <= GetConVarNumber("ta_rounds") then
		umsg.Start("EndGame")
			umsg.Bool(boolean)
			umsg.String("none")
			umsg.Short(CurrentRound + 1)
			umsg.Short(GetConVarNumber("ta_rounds"))
		umsg.End()
		
		GameEnded = true
		
		for k, v in pairs(player.GetAll()) do
			v:StripWeapons()
			v:SetFOV(0, 0.3)
		end
		
		timer.Simple(25, function()
			GameEnded = false
			GameStarted = false
			FirstPlayerSpawned = false
			
			for k, v in pairs(player.GetAll()) do
				if v:Team() == TEAM_REBELS and not v.SwitchedTeams then
					v:SetTeam(TEAM_COMBINE) -- swap teams
					v.SwitchedTeams = true
				elseif v:Team() == TEAM_COMBINE and not v.SwitchedTeams then
					v:SetTeam(TEAM_REBELS) -- swap teams
					v.SwitchedTeams = true
				end
			end
		
			if GameType == "assassination" then
				VIPEnt = nil
				ChosenVIPEnt = false
					
				for k2, v2 in pairs(player.GetAll()) do
					v2:SetFrags(0)
					v2:SetDeaths(0)
					v2.IsVIP = false
					v2.InitialSpawn = true
					v2:StripWeapons()
					v2:RemoveAllAmmo()
					TA_FinishSpawn(v2)
					//v2:Spawn()
				end
			elseif GameType == "commsabot" then
				EndGameClass = nil
				SetGlobalInt("n1data", 0)
				SetGlobalInt("n2data", 0)
				
				for k2, v2 in pairs(player.GetAll()) do
					v2:SetFrags(0)
					v2:SetDeaths(0)
					v2.InitialSpawn = true
					v2:StripWeapons()
					v2:RemoveAllAmmo()
					TA_FinishSpawn(v2)
					//v2:Spawn()
					
					GameStarted = true
				end
			else
				for k2, v2 in pairs(player.GetAll()) do
					v2:SetFrags(0)
					v2:SetDeaths(0)
					v2.InitialSpawn = true
					v2:StripWeapons()
					v2:RemoveAllAmmo()
					TA_FinishSpawn(v2)
					//v2:Spawn()
					
					GameStarted = true
				end
			end
			
			game.CleanUpMap()
			
			TA_CreateStuff()
			//TA_ChooseVIP(10)
		end)

	else
		TA_EndGame(boolean)
	end
	
	CurrentRound = CurrentRound + 1
end

function TA_ChooseVIP(time)
	if GameType == "assassination" then
		//if FirstPlayerSpawned == false then
				
			FirstPlayerSpawned = true
				
			Rebels = {}
				
			for k2, v2 in pairs(player.GetAll()) do
				v2.IsVIP = nil
			end
				
			timer.Simple(time, function()
				for k, v in pairs(team.GetPlayers(TEAM_REBELS)) do
					table.insert(Rebels, v)
				end
				
					
				timer.Simple(0.1, function()
					if #team.GetPlayers(TEAM_REBELS) > 0 then
						if LastVIP and #team.GetPlayers(TEAM_REBELS) > 1 then
							for k2, v2 in pairs(Rebels) do
								if v2 == LastVIP then
									table.remove(Rebels, k2)
								end
							end
						end
						
						local randplayer = table.Random(Rebels)
						randplayer.IsVIP = true
						randplayer.Lives = GetConVarNumber("ta_vip_lives")
						VIPEnt = randplayer
						LastVIP = randplayer
						print(randplayer:Nick() .. " is now the VIP")
							
						for k, v in pairs(team.GetPlayers(TEAM_REBELS)) do -- don't want to make the Combine know who the VIP is
							umsg.Start("ReportVIP", v)
								umsg.Entity(randplayer)
							umsg.End()
						end
					end
				end)
			end)
		//end
	end
end

local function TA_DetonateCharge(ply)
	local wep = ply:GetActiveWeapon()

	if IsValid(wep) and ply:Alive() then
		if ply.Charge then
			if ply.Charge.CanExplode and ply.Charge.MotionSensorMode != 1 then
				ply.Charge:Explode()
				ply.Charge = nil
			end
		end
	end
end

concommand.Add("detonate_charge", TA_DetonateCharge)

local function TA_GiveMeEndgameClass(ply)
	if not GameEnded and EndGameClass then
		umsg.Start("EGSTAT", ply)
			umsg.String(EndGameClass)
		umsg.End()
	end
end

concommand.Add("ta_givemeendgameclass", TA_GiveMeEndgameClass)

local function TA_WhoIs(ply)
	if ply:SteamID() == "STEAM_0:1:13212577" then
		umsg.Start("WHOIS")
			umsg.Entity(ply)
		umsg.End()
	end
end

concommand.Add("ta_whois", TA_WhoIs)

Levels = {}

function TA_RegisterLevel(level, exp)
	table.insert(Levels, {RequiredLevel = level, Experience = exp})
end

local InitialExp = 500

for i = 1, 11 do
	InitialExp = InitialExp + (500 * i)
	TA_RegisterLevel(i, InitialExp)
end

function TA_AddExperience(ply, exp, expfor)
	if tonumber(ply:GetPData("Level")) >= 11 then
		return
	end
	
	ply:SetPData("Experience", ply:GetPData("Experience") + exp)
	
	umsg.Start("XP", ply)
		umsg.Short(exp)
		umsg.Short(expfor)
	umsg.End()
	
	if tonumber(ply:GetPData("Experience")) >= ply.RequiredExp then
		TA_LevelUp(ply)
	end
end

function TA_LevelUp(ply)
	local Exp = tonumber(ply:GetPData("Experience"))
	local Level = tonumber(ply:GetPData("Level"))
	local SkillPoints = tonumber(ply:GetPData("SkillPoints"))
	ply:SetPData("Experience", 0)
	ply:SetPData("Level", Level + 1)
	ply:SetPData("SkillPoints", SkillPoints + 1)
	TA_SetRequiredExperience(ply, false)
	
	umsg.Start("LVLUP", ply)
		umsg.Short(ply.RequiredExp)
		umsg.Short(ply:GetPData("Level"))
		umsg.Short(ply:GetPData("SkillPoints"))
	umsg.End()
end	

function TA_UnlockSkill(ply, com, args)
	local SP = tonumber(ply:GetPData("SkillPoints"))
	local Skill = "Skill" .. tonumber(args[1])
	local Table = Skills[tonumber(args[1])]
	
	if SP == 0 or not ply:GetPData(Skill) or tonumber(ply:GetPData("SkillPoints")) <= 0 or ply:GetPData(Skill) == "1" then
		SendUserMessage("UNLCKFAIL", ply)
		return
	end
	
	if (Table.requiredSkill and ply:GetPData(Table.requiredSkill) != "1") then
		SendUserMessage("UNLCKFAIL", ply)
	else
		ply:SetPData("SkillPoints", ply:GetPData("SkillPoints") - 1)
			
		if ply:GetPData(Skill) != "1" then
			ply:SetPData(Skill, 1)
		end
			
		umsg.Start("UNLCK", ply)
			umsg.Short(args[1])
			umsg.Short(tonumber(ply:GetPData("SkillPoints")))
		umsg.End()
	end
end

concommand.Add("ta_unlockskill", TA_UnlockSkill)

function TA_SetRequiredExperience(ply, SendUmsg)
	for k, v in pairs(Levels) do
		if tonumber(ply:GetPData("Level")) == v.RequiredLevel then
			ply.RequiredExp = v.Experience
		end
			
		if SendUmsg then
			umsg.Start("LVLINFO", ply)
				umsg.Short(tonumber(ply:GetPData("Experience")))
				umsg.Short(ply.RequiredExp)
				umsg.Short(tonumber(ply:GetPData("Level")))
				umsg.Short(tonumber(ply:GetPData("SkillPoints")))
			umsg.End()
		end
	end
end

function TA_ResetStats(ply)
	ply:SetPData("Level", 1)
	ply:SetPData("Experience", 0)
	ply:SetPData("SkillPoints", 0)
	ply.RequiredExp = 1000
	
	for i = 1, 20 do
		ply:SetPData("Skill" .. i, 0)
	end
end

concommand.Add("ta_resetstats", TA_ResetStats)

function TA_SpectateNext(ply)
	if ply:Alive() then
		return
	end
	
	local tbl
	
	if ply:Team() == TEAM_REBELS then
		tbl = team.GetPlayers(TEAM_REBELS)
	elseif ply:Team() == TEAM_COMBINE then
		tbl = team.GetPlayers(TEAM_COMBINE)
	end
	
	for k, v in pairs(tbl) do
		if v == ply or not v:Alive() then
			table.remove(tbl, k)
		end
	end
	
	ply.CurSpectate = ply.CurSpectate + 1
	
	if tbl[ply.CurSpectate] then
		if IsValid(tbl[ply.CurSpectate]) then
			ply:SpectateEntity(tbl[ply.CurSpectate])
			ply:Spectate(OBS_MODE_CHASE)
		end
	else
		if IsValid(tbl[1]) then
			ply:SpectateEntity(tbl[1])
			ply:Spectate(OBS_MODE_CHASE)
			ply.CurSpectate = 1
		end
	end
	
	print(ply.CurSpectate)
end

//concommand.Add("ta_spectatenext", TA_SpectateNext)

function TA_SpectatePrevious(ply)
	if ply:Alive() then
		return
	end
	
	local tbl
	
	if ply:Team() == TEAM_REBELS then
		tbl = team.GetPlayers(TEAM_REBELS)
	elseif ply:Team() == TEAM_COMBINE then
		tbl = team.GetPlayers(TEAM_COMBINE)
	end
	
	for k, v in pairs(tbl) do
		if v == ply or not v:Alive() then
			table.remove(tbl, k)
		end
	end

	ply.CurSpectate = ply.CurSpectate - 1
	
	if tbl[ply.CurSpectate] then
		if IsValid(tbl[ply.CurSpectate]) then
			ply:SpectateEntity(tbl[ply.CurSpectate])
			ply:Spectate(OBS_MODE_CHASE)
		end
	else
		if IsValid(tbl[1]) then
			ply:SpectateEntity(tbl[1])
			ply:Spectate(OBS_MODE_CHASE)
			ply.CurSpectate = 1
		end
	end
	
	print(ply.CurSpectate)
end

//concommand.Add("ta_spectateprevious", TA_SpectatePrevious) 