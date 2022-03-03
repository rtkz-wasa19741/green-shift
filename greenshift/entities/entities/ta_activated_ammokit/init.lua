AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel("models/Items/BoxSRounds.mdl") 
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	self.Entity.CanHurt = true
	local phys = self.Entity:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
	
	self.Entity.AmmoCharge = 12
	self.Entity.AmmoGiveDelay = CurTime()
	timer.Simple(300, function()
		SafeRemoveEntity(self.Entity)
	end)
end

function ENT:Use()
return false
end

function ENT:OnTakeDamage(dmginfo)
	self.Entity:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
end

function ENT:Think()
	if SERVER then
		if CurTime() > self.Entity.AmmoGiveDelay then
			for k, v in pairs(ents.FindInSphere(self.Entity:GetPos(), 128)) do
				if v:IsPlayer() and v:Alive() then
					if self.Entity.AmmoCharge > 0 then
						if v:GetActiveWeapon():GetPrimaryAmmoType() != -1 then //if v:Health() < v:GetMaxHealth() then
							if v:GetActiveWeapon().Primary and v:GetActiveWeapon().Primary.ClipSize then
								if v:GetAmmoCount(v:GetActiveWeapon():GetPrimaryAmmoType()) < v:GetActiveWeapon().MaxAmmo then
									self.Entity.AmmoCharge = self.Entity.AmmoCharge - 1
									v:EmitSound("items/ammo_pickup.wav", 60, 100)
								else 
									return
								end
							
								local ammo = math.Clamp(v:GetAmmoCount(v:GetActiveWeapon():GetPrimaryAmmoType()) + (v:GetActiveWeapon().Primary.ClipSize > 50 and v:GetActiveWeapon().Primary.ClipSize / 2 or v:GetActiveWeapon().Primary.ClipSize), 0, v:GetActiveWeapon().MaxAmmo)
								v:SetAmmo(ammo, v:GetActiveWeapon():GetPrimaryAmmoType())
							else
								v:GiveAmmo(15, v:GetActiveWeapon():GetPrimaryAmmoType())
								//v:EmitSound("items/ammo_pickup.wav", 60, 100)
								self.Entity.AmmoCharge = self.Entity.AmmoCharge - 1
							end
						end
						
						for k2, v2 in ipairs(v:GetWeapons()) do
							if v:GetAmmoCount(v2:GetPrimaryAmmoType()) == 0 and v2:Clip1() == 0 and v:GetActiveWeapon():GetClass() != v2:GetClass() then
								if v2.Primary and v2.Primary.ClipSize then
									v:SetAmmo(v2.Primary.ClipSize * 0.5, v2:GetPrimaryAmmoType())
								else
									v:SetAmmo(15, v2:GetPrimaryAmmoType())
								end
							end
						end
						
						if v:GetActiveWeapon().Secondary and v:GetActiveWeapon().Secondary.Ammo == "SMG1_Grenade" and v:GetAmmoCount("SMG1_Grenade") < 3 then
							v:GiveAmmo(1, "SMG1_Grenade")
						end
					else
						SafeRemoveEntity(self.Entity)
					end
				end
				
			end
			self.Entity.AmmoGiveDelay = CurTime() + 0.8
		end
	end
end

function ENT:OnRemove()
return false
end 