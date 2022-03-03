AddCSLuaFile("shared.lua")
include("shared.lua")

local pos, ang

function ENT:Initialize()
	self.Entity:SetModel("models/Nightv/items/spy/Nightvi.mdl") 
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
end