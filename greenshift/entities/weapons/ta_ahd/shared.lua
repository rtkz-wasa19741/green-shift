if( SERVER ) then
	AddCSLuaFile( "shared.lua" );
end

if( CLIENT ) then
	SWEP.PrintName = "Automatic health dispenser";
	SWEP.Slot = 2;
	SWEP.SlotPos = 0;
	SWEP.DrawAmmo = false;
	SWEP.DrawCrosshair = false;
	SWEP.BounceWeaponIcon = false
	
	SWEP.VElements = {
		["medkit"] = { type = "Model", model = "models/Items/HealthKit.mdl", bone = "Bip01_R_Hand", rel = "", pos = Vector(7.932, 2.545, -3.55), angle = Angle(90, -38.638, 112.775), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["battery"] = { type = "Model", model = "models/Items/battery.mdl", bone = "Bip01_R_Hand", rel = "", pos = Vector(9.001, 6.218, -1.293), angle = Angle(0, -109.6, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["medkit"] = { type = "Model", model = "models/Items/HealthKit.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.787, 1.713, -3.813), angle = Angle(90, 0, 102.8), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["battery"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "medkit", pos = Vector(7.718, 1.819, 3.605), angle = Angle(90, 0, 0), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Author			= "-[SB]- Spy"
SWEP.Instructions	= "Primary attack to heal people, secondary to turn on over-ride mode."
SWEP.Contact		= ""
SWEP.Purpose		= ""

SWEP.HoldType = "grenade"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_slam.mdl"
SWEP.WorldModel = "models/weapons/w_eq_flashbang_thrown.mdl"
SWEP.ViewModelBonescales = {["Detonator"] = Vector(0.009, 0.009, 0.009), ["Slam_base"] = Vector(0.009, 0.009, 0.009), ["Bip01_L_UpperArm"] = Vector(0.009, 0.009, 0.009)}
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Base = "ta_cmodel_base"

-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.Delay			= 0.9 	--In seconds
SWEP.Primary.Recoil			= 0		--Gun Kick
SWEP.Primary.Damage			= 15	--Damage per Bullet
SWEP.Primary.NumShots		= 1		--Number of shots per one fire
SWEP.Primary.Cone			= 0 	--Bullet Spread
SWEP.Primary.ClipSize		= -1	--Use "-1 if there are no clips"
SWEP.Primary.DefaultClip	= -1	--Number of shots in next clip
SWEP.Primary.Automatic   	= true	--Pistol fire (false) or SMG fire (true)
SWEP.Primary.Ammo         	= "none"	--Ammo Type
 
-------------Secondary Fire Attributes-------------------------------------
SWEP.Secondary.Delay		= 0.9
SWEP.Secondary.Recoil		= 0
SWEP.Secondary.Damage		= 0
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.Cone			= 0
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= false
SWEP.Secondary.Ammo         = "none"

SWEP.HealDelay = 0
SWEP.AccumulatedHeal = 0
SWEP.AdditionalHeal = 0

function SWEP:Initialize()
 
	self.Weapon:SetWeaponHoldType("slam")
 
    if CLIENT then
     
        self:CreateModels(self.VElements) // create viewmodels
        self:CreateModels(self.WElements) // create worldmodels
         
        // init view model bone build function
        self.BuildViewModelBones = function( s )
            if LocalPlayer():GetActiveWeapon() == self and self.ViewModelBonescales then
                for k, v in pairs( self.ViewModelBonescales ) do
                    local bone = s:LookupBone(k)
                    if (!bone) then continue end
                    local m = s:GetBoneMatrix(bone)
                    if (!m) then continue end
                    m:Scale(v)
                    s:SetBoneMatrix(bone, m)
                end
            end
        end
         
    end
 
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SetNextSecondaryFire(CurTime() + 1)

	return true
end

function SWEP:Holster()
	self.Weapon.ThrowStatus = 0
	return true
end

function SWEP:Precache()
end

local consumption, delay = 0

function SWEP:Think()
	if SERVER then
		if self.Owner:GetDTFloat(1) > 0 then
			if self.Owner:KeyDown(IN_ATTACK) then
			
				if self.Owner:KeyDown(IN_ATTACK2) then
					consumption = 2
					delay = 0.05
				else
					consumption = 1
					delay = 0.1
				end
				
				if CurTime() > self.Weapon.HealDelay then
					for k, v in pairs(ents.FindInSphere(self.Owner:GetShootPos(), 192)) do
						if v:IsPlayer() and v:Alive() then
							if v:Team() == self.Owner:Team() then
								if v:Health() < v:GetMaxHealth() then
									v:SetHealth(math.Clamp(v:Health() + (1 + self.Weapon.AdditionalHeal), 0, v:GetMaxHealth()))
									self.Owner:SetDTFloat(1, self.Owner:GetDTFloat(1) - consumption)
									
									if v != self.Owner then
										if self.Weapon.AccumulatedHeal >= 20 then
											TA_AddExperience(self.Owner, 25)
											print("DICKS")
											self.Weapon.AccumulatedHeal = 0
										else
											self.Weapon.AccumulatedHeal = self.Weapon.AccumulatedHeal + self.Weapon.AdditionalHeal
										end
									end
								end
							end
						end
					end
					
					self.Weapon.HealDelay = CurTime() + delay
					self.Owner.MedkitRegenDelay = CurTime() + 1
				end
			end
		else
			self.Weapon.HealDelay = CurTime() + 7
		end
	end
end

function SWEP:PrimaryAttack()
	return false
end

function SWEP:SecondaryAttack()
	return false
end