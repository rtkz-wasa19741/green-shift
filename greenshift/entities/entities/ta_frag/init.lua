AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel("models/weapons/w_eq_fraggrenade_thrown.mdl") 
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_NPC)
	self.NextImpact = 0
	local phys = self.Entity:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
	
	self.Entity:GetPhysicsObject():SetBuoyancyRatio(0)
	
	timer.Simple(3, function()
		if self.Entity:IsValid() then
			util.BlastDamage(self.Entity:GetOwner(), self.Entity:GetOwner(), self.Entity:GetPos(), 384, 100)
			
			local ef = EffectData()
			ef:SetOrigin(self.Entity:GetPos())
			ef:SetMagnitude(1)
			
			util.Effect("Explosion", ef)
			
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
	if physobj:GetVelocity():Length() > 500 then -- let it roll
		physobj:SetVelocity(physobj:GetVelocity() * 0.6) -- cheap as fuck, but it works
	end
	
	if physobj:GetVelocity():Length() > 100 then
		if CurTime() > self.Entity.NextImpact then
			self.Entity:EmitSound("weapons/hegrenade/he_bounce-1.wav", 75, 100)
			self.Entity.NextImpact = CurTime() + 0.1
		end
	end
end