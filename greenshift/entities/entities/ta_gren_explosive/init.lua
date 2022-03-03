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
	util.BlastDamage(self.Entity:GetOwner(), self.Entity:GetOwner(), self.Entity:GetPos(), self.Entity.BlastRadius, self.Entity.BlastDamage)
	local ef = EffectData()
	ef:SetOrigin(self.Entity:GetPos())
	ef:SetMagnitude(1)
	util.Effect("Explosion", ef)
	
	self.Entity:Remove()
end
