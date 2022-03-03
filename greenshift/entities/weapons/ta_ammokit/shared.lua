if( SERVER ) then
	AddCSLuaFile( "shared.lua" );
end

if( CLIENT ) then
	SWEP.PrintName = "Ammokit";
	SWEP.Slot = 3;
	SWEP.SlotPos = 3;
	SWEP.DrawAmmo = false;
	SWEP.DrawCrosshair = false;
	
	SWEP.VElements = {
		["ammokit"] = { type = "Model", model = "models/Items/BoxSRounds.mdl", bone = "Bip01_R_Hand", pos = Vector(7.443, 3.819, 1.1), angle = Angle(0, 62, -100.362), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
		
	SWEP.WElements = {
		["medkit"] = { type = "Model", model = "models/Items/BoxSRounds.mdl", pos = Vector(2.599, 6.098, 0.319), angle = Angle(0, -27.632, -78.349), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Author			= "-[SB]- Spy"
SWEP.Instructions	= "Primary attack to throw"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Category = "Throwable Weapons"

SWEP.HoldType = "slam"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_slam.mdl"
SWEP.WorldModel = "models/weapons/w_slam.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {["Slam_base"] = Vector(0.009, 0.009, 0.009), ["Detonator"] = Vector(0.009, 0.009, 0.009), ["Bip01_L_Clavicle"] = Vector(0.009, 0.009, 0.009)}

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Base = "cmodel_cstm_base"

-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.Delay			= 0.9 	--In seconds
SWEP.Primary.Recoil			= 0		--Gun Kick
SWEP.Primary.Damage			= 15	--Damage per Bullet
SWEP.Primary.NumShots		= 1		--Number of shots per one fire
SWEP.Primary.Cone			= 0 	--Bullet Spread
SWEP.Primary.ClipSize		= -1	--Use "-1 if there are no clips"
SWEP.Primary.DefaultClip	= -1	--Number of shots in next clip
SWEP.Primary.Automatic   	= false	--Pistol fire (false) or SMG fire (true)
SWEP.Primary.Ammo         	= "none"	--Ammo Type
 
-------------Secondary Fire Attributes-------------------------------------
SWEP.Secondary.Delay		= 0.9
SWEP.Secondary.Recoil		= 0
SWEP.Secondary.Damage		= 0
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.Cone			= 0
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"
SWEP.IncreaseDelay			= CurTime()

function SWEP:SetupDataTables()
	self.Weapon:DTVar("Int", 0, "progress")
end

function SWEP:Initialize()
 
	self:SetWeaponHoldType(self.HoldType)
	self.Weapon.dt.progress = 100
 
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
	self.Weapon:SendWeaponAnim(ACT_SLAM_THROW_ND_DRAW)
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SetNextSecondaryFire(CurTime() + 1)
	return true
end

function SWEP:Holster()
	return true
end

function SWEP:Precache()
end

function SWEP:PrimaryAttack()
	if self.Owner:GetEyeTrace().HitPos:Distance(self.Owner:GetShootPos()) <= 30 or self.Weapon.dt.progress != 100 then
		return
	end

	self.Weapon:SendWeaponAnim(ACT_SLAM_THROW_THROW_ND)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	local wep = self.Owner:GetActiveWeapon():GetClass()
	
	timer.Simple(0.4, function()
		if self.Weapon != self.Owner:GetActiveWeapon() then
			return
		end
		
		if SERVER then
			local throwable = ents.Create("ta_activated_ammokit")
			throwable:SetPos(self.Owner:EyePos() + self.Owner:GetAimVector() * 16 + self.Owner:GetRight() * 2 + self.Owner:GetUp() * -3)
			throwable:SetAngless(self.Owner:EyeAngles() - Angle(45, 0, 0))
			throwable:SetOwner(self.Owner)
			throwable:Spawn()
			
			if throwable:GetPhysicsObject():IsValid() then
				throwable:GetPhysicsObject():SetMass(5)
				throwable:GetPhysicsObject():SetVelocity(self.Owner:GetAimVector() * 250)
			end
			
			SafeRemoveEntity(self.Owner.CurAmmoKitEnt)
			self.Owner.CurAmmoKitEnt = throwable
		
			timer.Simple(1, function()
				if throwable == NULL then
					return
				end
				
				throwable:SetOwner(NULL)
			end)
			self.Weapon:SendWeaponAnim(ACT_SLAM_THROW_THROW_ND2)
			self.Weapon.dt.progress = 0
			
			for k, v in pairs(ents.FindInSphere(self.Owner:GetPos(), 256)) do -- make sure to say "take this medkit" or something like that if there are others around, not talk to yourself
				if v:IsPlayer() and self.Owner:UniqueID() != v:UniqueID() and v:Alive() and self.Owner:Team() == TEAM_REBELS then
					self.Owner:EmitSound("vo/npc/male01/ammo0" .. math.random(1, 5) .. ".wav", 85, math.random(99, 101))
					break
				end
			end
		end
		
	end)
	
	timer.Simple(1, function()
		if self.Weapon != self.Owner:GetActiveWeapon() then
			return
		end
		
		if SERVER then
			self.Weapon:SendWeaponAnim(ACT_SLAM_THROW_ND_DRAW)
		end
	end)
	
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	
end

function SWEP:SecondaryAttack()
	return false
end