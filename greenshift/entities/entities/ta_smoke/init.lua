AddCSLuaFile("cl_init.lua")	
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel("models/weapons/w_eq_smokegrenade_thrown.mdl") 
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_NPC)
	self.Entity.NextImpact = 0
	local phys = self.Entity:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
	
	self.Entity:GetPhysicsObject():SetBuoyancyRatio(0)
	
	timer.Simple(3, function()
		if self.Entity:IsValid() then
			self.Entity:EmitSound("weapons/smokegrenade/sg_explode.wav", 100, 100)
			
			ParticleEffect("cstm_smoke", self.Entity:GetPos(), Angle(0, 0, 0), nil)
	
			self.Entity:Remove()
		end
	end)
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

function ENT:PhysicsCollide(data, physobj)
	if physobj:GetVelocity():Length() > 500 then
		physobj:SetVelocity(physobj:GetVelocity() * 0.6) -- cheap as fuck, but it works
	end
	
	if physobj:GetVelocity():Length() > 100 then
		if CurTime() > self.Entity.NextImpact then
			self.Entity:EmitSound("weapons/smokegrenade/grenade_hit1.wav", 75, 100)
			self.Entity.NextImpact = CurTime() + 0.1
		end
	end
end