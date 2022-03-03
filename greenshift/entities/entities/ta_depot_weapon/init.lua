AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

local Models = {
	"models/Items/ammoCrate_Rockets.mdl",
	"models/Items/ammocrate_ar2.mdl",
	//"models/Items/ammocrate_buckshot.mdl",
	"models/Items/ammocrate_grenade.mdl",
	"models/Items/ammocrate_smg1.mdl" }
	//"models/Items/ammocrate_smg2.mdl" }
	
local DebrisModels = {
	"models/Gibs/metal_gib1.mdl",
	"models/Gibs/metal_gib2.mdl",
	"models/Gibs/metal_gib3.mdl",
	"models/Gibs/metal_gib4.mdl",
	"models/Gibs/metal_gib5.mdl",
	"models/Items/BoxMRounds.mdl",
	"models/Items/BoxSRounds.mdl" }
	

function ENT:Initialize()
	self.Entity:SetModel(table.Random(Models))
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity.DepotHealth = 200
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetAttacker():Team() != TEAM_REBELS then
		if self.Entity.DepotHealth - dmginfo:GetDamage() < 0 then
			self.Entity:Break(dmginfo:GetAttacker())
			
			TA_AddExperience(dmginfo:GetAttacker(), 50, 11)
			return
		end
		
		self.Entity.DepotHealth = self.Entity.DepotHealth - dmginfo:GetDamage()
	end
end

function ENT:Use(activator, caller)
	return false
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end

function ENT:Break(attacker)
	for i = 1, 7 do
		local debris = ents.Create("prop_physics")
		debris:SetModel(table.Random(DebrisModels))
		debris:SetPos(self.Entity:GetPos() + Vector(0, 0, 30) + VectorRand() * 20)
		debris:SetAngles(Angle(math.random(0, 360), math.random(0, 360), math.random(0, 360)))
		debris:Spawn()
		debris:Activate()
		debris:SetVelocity(VectorRand() * 300)
		debris:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		
		SafeRemoveEntityDelayed(debris, 10)
	end
	
	local ef = EffectData()
	ef:SetOrigin(self.Entity:GetPos())
	ef:SetScale(1)
	
	util.Effect("Explosion", ef)
	
	if #ents.FindByClass("ta_depot_weapon") + #ents.FindByClass("ta_depot_food") - 1 <= 0 then
		TA_RestartRound(false)
		
		for k, v in pairs(player.GetAll()) do
			if v:Team() == TEAM_COMBINE then
				TA_AddExperience(v, 100, 14)
			end
		end
	end
	
	//util.BlastDamage(attacker, attacker, self.Entity:GetPos(), 256, 80)
	
	self.Entity:Remove()
end