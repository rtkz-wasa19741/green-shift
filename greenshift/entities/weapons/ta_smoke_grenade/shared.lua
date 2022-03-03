if( SERVER ) then
	AddCSLuaFile( "shared.lua" );
end

if( CLIENT ) then
	SWEP.PrintName = "Smoke grenade";
	SWEP.Slot = 1;
	SWEP.SlotPos = 1;
	SWEP.DrawAmmo = false;
	SWEP.DrawCrosshair = false;
	SWEP.BounceWeaponIcon = false
end

SWEP.Author			= "-[SB]- Spy"
SWEP.Instructions	= "Primary attack to remove pin, release to throw."
SWEP.Contact		= ""
SWEP.Purpose		= ""

SWEP.HoldType = "grenade"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_eq_smokegrenade.mdl"
SWEP.WorldModel = "models/weapons/w_eq_smokegrenade_thrown.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.Delay			= 0.9 	--In seconds
SWEP.Primary.Recoil			= 0		--Gun Kick
SWEP.Primary.Damage			= 15	--Damage per Bullet
SWEP.Primary.NumShots		= 1		--Number of shots per one fire
SWEP.Primary.Cone			= 0 	--Bullet Spread
SWEP.Primary.ClipSize		= 0	--Use "-1 if there are no clips"
SWEP.Primary.DefaultClip	= -1	--Number of shots in next clip
SWEP.Primary.Automatic   	= true	--Pistol fire (false) or SMG fire (true)
SWEP.Primary.Ammo         	= "Grenade"	--Ammo Type
 
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

SWEP.ThrowStatus = 0
SWEP.MaxAmmo = 2

SWEP.DropGrenadeType = "ta_smoke"

function SWEP:Initialize()
	self.Weapon:SetWeaponHoldType("grenade")
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

function SWEP:Think()
	if self.Weapon.ThrowStatus == 1 then
		if not self.Owner:KeyDown(IN_ATTACK) then
			if CurTime() > self.Weapon.ThrowDelay then
				self.Owner:SetAnimation(PLAYER_ATTACK1)
				self.Weapon:SendWeaponAnim(ACT_VM_THROW)
				
				timer.Simple(0.25, function()
					if not IsValid(self.Weapon) or not self.Owner:Alive() or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
						return
					end
					
					if SERVER then
						self.Weapon:TakePrimaryAmmo(1)
						
						local throwable = ents.Create("ta_smoke")
						throwable:SetPos(self.Owner:EyePos() + self.Owner:GetAimVector() * 16 + self.Owner:GetRight() * 5 + self.Owner:GetUp() * -2)
						throwable:SetAngless(self.Owner:EyeAngles())
						throwable:SetOwner(self.Owner)
						throwable:Spawn()
						
						if throwable:GetPhysicsObject():IsValid() then
							throwable:GetPhysicsObject():SetVelocity(self.Owner:GetAimVector() * (1150 * self.Owner.GrenadeRangeMod))
							throwable:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-250, 250), math.random(-250, 250), math.random(-250, 250)))
						end
					
						timer.Simple(0.35, function()
							if self.Owner:IsValid() then
								for k, v in pairs(self.Owner:GetWeapons()) do
									if v:GetClass():find("^ta_rif") or v:GetClass():find("^ta_smg") or v:GetClass():find("^ta_shotgun") then
										self.Owner:SelectWeapon(v:GetClass())
										break
									end
								end
							end
						end)
					
					end
				end)
				
				self.Weapon.ThrowStatus = 0
			end
		else
			self.Weapon:SetNextPrimaryFire(CurTime() + 2)
		end
	end
end

function SWEP:PrimaryAttack()
	if self.Owner:GetEyeTrace().HitPos:Distance(self.Owner:GetShootPos()) <= 30 or self.Owner:GetAmmoCount("Grenade") == 0 then
		return
	end

	self.Weapon:SendWeaponAnim(ACT_VM_PULLPIN)
	
	self.Weapon.ThrowStatus = 1
	self.Weapon.ThrowDelay = CurTime() + 0.7
	
	self.Weapon:SetNextPrimaryFire(CurTime() + 2)
end

function SWEP:SecondaryAttack()
	return false
end