include("shared.lua")

function ENT:Initialize()
	self.Entity.Emitter = ParticleEmitter(self.Entity:GetPos())
	self.Entity.ParticleDelay = 0
end

function ENT:Draw()
	self.Entity:DrawModel()
end

function ENT:Think()
	//if CurTime() > self.Entity.ParticleDelay then
		local part = self.Entity.Emitter:Add("particle/smokesprites_000" .. math.random(1, 9), self.Entity:GetPos())
		part:SetStartSize(4)
		part:SetEndSize(8)
		part:SetStartAlpha(255)
		part:SetEndAlpha(0)
		part:SetDieTime(1)
		part:SetRoll(math.random(0, 360))
		part:SetRollDelta(0.01)
		part:SetColor(120, 120, 120)
		part:SetLighting(false)
		part:SetVelocity(VectorRand() * 25)
	//	self.Entity.ParticleDelay = CurTime() + 0.01
	//end
end 