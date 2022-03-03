AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel("models/Items/AR2_Grenade.mdl") 
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_NPC)
	local phys = self.Entity:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
	
	self.Entity:GetPhysicsObject():SetBuoyancyRatio(0)
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

function ENT:PhysicsCollide(data, physobj)
	self.Entity:EmitSound("weapons/smokegrenade/sg_explode.wav", 100, 100)
	ParticleEffect("cstm_smoke", self.Entity:GetPos(), Angle(0, 0, 0), nil)
	
	self.Entity:Remove()
end
