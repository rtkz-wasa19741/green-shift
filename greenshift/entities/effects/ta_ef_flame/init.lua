function EFFECT:Init(ef)
	self:SetPos(ef:GetOrigin())
	self.Emitter = ParticleEmitter(ef:GetOrigin())
		
	for i = 1, 30 do
		local randomvec = VectorRand() * 100
	
		local part = self.Emitter:Add("effects/muzzleflash" .. math.random(1, 4), ef:GetOrigin())
		part:SetStartSize(16)
		part:SetEndSize(16)
		part:SetStartAlpha(255)
		part:SetEndAlpha(0)
		part:SetDieTime(1)
		part:SetRoll(math.random(0, 360))
		part:SetLighting(false)
		part:SetCollide(true)
		part:SetVelocity(Vector(0, 0, 1) * 100 + randomvec)
			
		local part = self.Emitter:Add("effects/fire_embers" .. math.random(1, 3), ef:GetOrigin())
		part:SetStartSize(16)
		part:SetEndSize(16)
		part:SetStartAlpha(255)
		part:SetEndAlpha(0)
		part:SetDieTime(1)
		part:SetRoll(math.random(0, 360))
		part:SetLighting(false)
		part:SetCollide(true)
		part:SetVelocity(Vector(0, 0, 1) * 150 + randomvec * -1)
	end
	
	for i = 1, 5 do
		local randomvel = VectorRand() * 100
	
		local part = self.Emitter:Add("effects/fire_cloud" .. math.random(1, 2), ef:GetOrigin())
		part:SetStartSize(48)
		part:SetEndSize(12)
		part:SetStartAlpha(130)
		part:SetEndAlpha(0)
		part:SetDieTime(1)
		part:SetRoll(math.random(0, 360))
		part:SetRollDelta(math.Rand(-2, 2))
		part:SetLighting(false)
		part:SetCollide(true)
		part:SetVelocity(Vector(0, 0, 1) * 150 + randomvel)
		
		local part = self.Emitter:Add("sprites/heatwave", ef:GetOrigin())
		part:SetStartSize(52)
		part:SetEndSize(42)
		part:SetStartAlpha(170)
		part:SetEndAlpha(0)
		part:SetDieTime(1)
		part:SetRoll(math.random(0, 360))
		part:SetRollDelta(math.Rand(-2, 2))
		part:SetLighting(false)
		part:SetCollide(true)
		part:SetVelocity(Vector(0, 0, 1) * 150 + randomvel)
	end
	
	self.DieTime = CurTime() + 1.25
end

function EFFECT:Think()
	if self.Emitter then
		if CurTime() > self.DieTime then
			self.Emitter:Finish()
			return false
		else
			return true
		end
	else
		return false
	end
end

function EFFECT:Render()
end