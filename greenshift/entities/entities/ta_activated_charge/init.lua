AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel("models/weapons/w_c4_planted.mdl") 
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self.Entity:GetPhysicsObject():EnableMotion(false) -- freeze the entity
	self.Entity.CanExplode = true
	self.Entity.BeepDelay = 0
	self.Entity.MotionSensorMode = 0
end

function ENT:Think()
	if self.Entity.CanExplode then
		if self.Entity.MotionSensorMode > 0 then
			for k, v in pairs(ents.FindInSphere(self.Entity:GetPos(), 128)) do
				if v:IsPlayer() then
					if v:Team() != self.Entity.EntOwner:Team() then
						if v:GetVelocity():Length() > 80 then -- faster than ducked speed
							local td = {}
							td.start = self.Entity:GetPos()
							td.endpos = v:EyePos() + (v:EyePos() - td.start):GetNormal() * 256
							td.filter = self.Entity
							
							local trace = util.TraceLine(td)
							
							if trace.Entity:IsPlayer() then
								self.Entity:Explode()
							end
						end
					end
				end
			end
			
			if self.Entity.MotionSensorMode == 2 then
				if CurTime() > self.Entity.BeepDelay then
					self.Entity:EmitSound("weapons/c4/c4_beep1.wav", 75, 100)
					self.Entity.BeepDelay = CurTime() + 1
				end
			end
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetAttacker():Team() != self.Entity.EntOwner:Team() then
		self.Entity:MakeDud()
	end
end
				
function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end

function ENT:Explode()
	local ent = self.Entity
	local entOwner = self.Entity.EntOwner
	SafeRemoveEntity(self.Entity)
			
	local ef = EffectData()
	ef:SetOrigin(ent:GetPos())
	ef:SetMagnitude(1)
				
	util.Effect("Explosion", ef)
	
	ent.EntOwner.Charge = nil
	util.BlastDamage(ent.EntOwner, ent.EntOwner, ent:GetPos(), 384, 120)
end

function ENT:MakeDud()
	self.Entity.CanExplode = false
	self.Entity.EntOwner.Charge = nil
	self.Entity:GetPhysicsObject():EnableMotion(true)
	self.Entity:GetPhysicsObject():Wake()
	
	timer.Simple(5, function()
		if ValidEntity(self.Entity) then
			SafeRemoveEntity(self.Entity)
		end
	end)
end