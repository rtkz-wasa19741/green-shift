AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel("models/error.mdl")
	self.Entity:SetNoDraw(true)
	self.Entity.WinDelay = 5
	self.Entity.GameEnded = false
end

function ENT:Think()
	for k, v in pairs(ents.FindInSphere(self.Entity:GetPos(), 448)) do 
		if v:IsPlayer() then
			if v:Alive() and v:Team() == TEAM_COMBINE then
				if not v.CloakOn then
					return -- make sure that the rebels can't win if there are enemies near the escort node
				end
			end
		end
	end
	
	for k, v in pairs(ents.FindInSphere(self.Entity:GetPos(), 192)) do
		if v:IsPlayer() then
			if v:Team() == TEAM_REBELS and v.IsVIP and CurTime() > self.Entity.WinDelay and not GameEnded then
				TA_RestartRound(true) -- end the game and make the winners of the round rebels
				GameEnded = true
				
				for k2, v2 in pairs(player.GetAll()) do
					if v2:Team() == TEAM_REBELS then
						TA_AddExperience(v2, 200, 2)
					end
				end
			end
		end
	end
end

function ENT:Use(activator, caller)
	return false
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end