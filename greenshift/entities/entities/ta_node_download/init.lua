AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel("models/props_combine/combine_interface002.mdl")
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity.Hacker = nil
end

function ENT:Think()
	if ValidEntity(self.Entity.Hacker) and self.Entity.Hacker:Alive() and self.Entity.Hacker:GetPos():Distance(self.Entity:GetPos()) <= 80 and GetGlobalInt("n1data") != 100 and GameEnded != true then
		SetGlobalInt("n1data", GetGlobalInt("n1data") + 1)
		
		if GetGlobalInt("n1data") == 100 then
			umsg.Start("UPDDT")
				umsg.Short(3) -- 3 is complete download
				umsg.Entity(self.Entity.Hacker)
			umsg.End()
			
			TA_NotifyPlayers(self.Entity.Hacker.Class)
			TA_AddExperience(self.Entity.Hacker, 100, 5)
			
			for k, v in pairs(player.GetAll()) do
				if v != self.Entity.Hacker then
					if v:Team() == TEAM_REBELS then
						TA_AddExperience(v, 50, 6)
					end
				end
			end
			
			self.Entity.Hacker:AddFrags(1)
			self.Entity.Hacker.IsHacking = false
			self.Entity.Hacker = nil
		end
	elseif not self.Entity.Hacker or self.Entity.Hacker:GetPos():Distance(self.Entity:GetPos()) > 80 or not self.Entity.Hacker:Alive() or GameEnded == true or self.Entity.Hacker.CloakOn then
		if self.Entity.Hacker != nil then
			umsg.Start("UPDDT")
				umsg.Short(2) -- 2 is interrupt download
				umsg.Entity(self.Entity.Hacker)
			umsg.End()
		
			self.Entity.Hacker.IsHacking = false
			self.Entity.Hacker = nil
		end
	end
end

function ENT:Use(activator, caller)
	if self.Entity.Hacker == nil and activator:GetPos():Distance(self.Entity:GetPos()) <= 80 and activator:Team() == TEAM_REBELS and activator:Alive() and GetGlobalInt("n1data") != 100 and GameEnded != true and not activator.CloakOn then
		self.Entity.Hacker = activator
		activator.IsHacking = true
		
		umsg.Start("UPDDT")
			umsg.Short(1) -- 1 is start download
			umsg.Entity(self.Entity.Hacker)
		umsg.End()
	end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end