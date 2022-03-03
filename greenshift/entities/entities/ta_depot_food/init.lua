AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

local Models = {
	"models/props/CS_militia/food_stack.mdl",
	"models/props/CS_militia/boxes_frontroom.mdl",
	"models/props/CS_militia/boxes_garage_lower.mdl" }
	
local DebrisModels = {
	"models/Items/item_item_crate_chunk01.mdl",
	"models/Items/item_item_crate_chunk02.mdl",
	"models/Items/item_item_crate_chunk05.mdl",
	"models/Items/item_item_crate_chunk06.mdl",
	"models/Items/item_item_crate_chunk07.mdl",
	"models/Items/item_item_crate_chunk08.mdl" }
	
local FoodModels = {
	"models/props/cs_office/trash_can_p7.mdl",
	"models/props/cs_office/trash_can_p8.mdl",
	"models/props/cs_office/Water_bottle.mdl",
	"models/props_junk/PopCan01a.mdl",
	"models/props/cs_italy/bananna_bunch.mdl",
	"models/props/cs_italy/bananna.mdl",
	"models/props/cs_italy/orange.mdl",
	"models/props_junk/GlassBottle01a.mdl",
	"models/props/CS_militia/bottle01.mdl",
	"models/props/CS_militia/bottle02.mdl",
	"models/props/CS_militia/bottle03.mdl",
	"models/props_junk/watermelon01.mdl" }
	

function ENT:Initialize()
	self.Entity:SetModel(table.Random(Models))
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity.DepotHealth = 500
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetAttacker():Team() != TEAM_REBELS then
		if self.Entity.DepotHealth - dmginfo:GetDamage() < 0 then
			self.Entity:Break()
			TA_AddExperience(dmginfo:GetAttacker(), 50, 10)
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

function ENT:Break()
	for i = 1, 7 do
		local debris = ents.Create("prop_physics")
		debris:SetModel(table.Random(DebrisModels))
		debris:SetPos(self.Entity:GetPos() + Vector(0, 0, 30) + VectorRand() * 20)
		debris:SetAngles(Angle(math.random(0, 360), math.random(0, 360), math.random(0, 360)))
		debris:Spawn()
		debris:Activate()
		debris:SetVelocity(VectorRand() * 100)
		debris:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		
		SafeRemoveEntityDelayed(debris, 10)
	end
	
	for i = 1, 7 do
		local food = ents.Create("prop_physics")
		food:SetModel(table.Random(FoodModels))
		food:SetPos(self.Entity:GetPos() + Vector(0, 0, 30) + VectorRand() * 20)
		food:SetAngles(Angle(math.random(0, 360), math.random(0, 360), math.random(0, 360)))
		food:Spawn()
		food:Activate()
		food:SetVelocity(VectorRand() * 100)
		food:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		
		SafeRemoveEntityDelayed(food, 10)
	end
	
	if #ents.FindByClass("ta_depot_weapon") + #ents.FindByClass("ta_depot_food") - 1 <= 0 then
		TA_RestartRound(false)
		
		for k, v in pairs(player.GetAll()) do
			if v:Team() == TEAM_COMBINE then
				TA_AddExperience(v, 100, 14)
			end
		end
	end
	
	self.Entity:Remove()
end