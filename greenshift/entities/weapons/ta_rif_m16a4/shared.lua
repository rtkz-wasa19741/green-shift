

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.NoEOTech = true
	SWEP.DoesntDropRail = true
	SWEP.NoGL = false
	SWEP.NoVertGrip = false
	SWEP.NoCMag = false
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.PrintName			= "M16A4"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.NoRail = true
	SWEP.InitialDraw = true
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_m16")
	SWEP.Bone = "Right_L_Arm"
	SWEP.BoneOffset = Vector(0, 0, 5)
	SWEP.CurOffset = Vector(0, 0, 0)
	SWEP.CurAngleOffset = Angle(0, 0, 0)
	SWEP.ActiveOffset = Vector(-4.5, -4.5, 0)
	SWEP.ActiveAngleOffset = Vector(0, 0, -90)
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.Muzzle = "cstm_muzzle_ar"
	
	SWEP.GrenadeLauncher_Idle = {
	['R_Upperarm'] = {vector = Vector(1.4880000352859, -2.319000005722, -4.25), angle = Vector(0, 0, 0)}}
	
	SWEP.GrenadeLauncher_Active = {
	['R_Upperarm'] = {vector = Vector(17.243999481201, 15, -10.305999755859), angle = Vector(0, -90, -90)},
	['R_Thumb1'] = {vector = Vector(0, 0, 0), angle = Vector(-7.5939998626709, -17.625, 0)},
	['R_Thumb2'] = {vector = Vector(0, 0, 0), angle = Vector(-13.769000053406, 15.612999916077, 0)},
	['R_Index1'] = {vector = Vector(0, 0, 0), angle = Vector(-35.73099899292, 0, 0)},
	['R_Index2'] = {vector = Vector(0, 0, 0), angle = Vector(66.018997192383, 0, 0)}}
	
	SWEP.VertGrip_Idle = {
	['R_Armdummy'] = {vector = Vector(5.7810001373291, 2.2249999046326, 7.0869998931885), angle = Vector(52.661998748779, -68.063003540039, 0)},
	['R_Thumb1'] = {vector = Vector(0, 0, 0), angle = Vector(-26.593999862671, 20.106000900269, 0)},
	['R_Thumb2'] = {vector = Vector(0, 0, 0), angle = Vector(4.313000202179, 51.549999237061, 0)},
	['R_Index1'] = {vector = Vector(0, 0, 0), angle = Vector(16.018999099731, 4.7189998626709, 0)},
	['R_Index2'] = {vector = Vector(0, 0, 0), angle = Vector(-29.886999130249, -8.918999671936, 0)},
	['R_Mid1'] = {vector = Vector(0, 0, 0), angle = Vector(-25.898000717163, 0, 0)},
	['R_Mid2'] = {vector = Vector(0, 0, 0), angle = Vector(-22.961000442505, 0, 0)},
	['R_Pinky2'] = {vector = Vector(0, 0, 0), angle = Vector(-29.516000747681, 0, 0)},
	['R_Ring1'] = {vector = Vector(0, 0, 0), angle = Vector(-27.704000473022, 0, 0)} }
	
	SWEP.CMag_Idle = {
	['R_Upperarm'] = {vector = Vector(0.33700001239777, -3.6570000648499, -5.6560001373291), angle = Vector(0, 0, -44.76900100708)},
	['R_Thumb1'] = {vector = Vector(0, 0, 0), angle = Vector(0, 0, -18.66900062561)},
	['R_Thumb2'] = {vector = Vector(0, 0, 0), angle = Vector(0, 18.131000518799, 8.8120002746582)},
	['R_Thumb3'] = {vector = Vector(0, 0, 0), angle = Vector(0, 23.993999481201, 2.0929999351501)},
	['R_Index1'] = {vector = Vector(0, 0, 0), angle = Vector(14.444000244141, 14.305999755859, 25.913000106812)},
	['R_Index2'] = {vector = Vector(0, 0, 0), angle = Vector(-14.987000465393, 0, 0)},
	['R_Index3'] = {vector = Vector(0, 0, 0), angle = Vector(-11.555999755859, 0, 0)},
	['R_Mid1'] = {vector = Vector(0, 0, 0), angle = Vector(3.2560000419617, 0, 0)},
	['R_Ring2'] = {vector = Vector(0, 0, 0), angle = Vector(5.9060001373291, 0, 0)},
	['R_Pinky1'] = {vector = Vector(0, 0, 0), angle = Vector(13.937000274658, 0, 0)}}
	
	SWEP.MagBone = "Clip"
	
	killicon.Add( "cstm_rif_m16a4", "VGUI/kills/kill_m16", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "Body", rel = "", pos = Vector(-0.049, 4.587, -6.776), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "Body", rel = "", pos = Vector(0.312, -2.507, -9.039), angle = Angle(180, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "Body", rel = "", pos = Vector(-0.087, 4.474, -5.17), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Body", rel = "", pos = Vector(0.163, -2.283, -9.818), angle = Angle(180, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["grenadelauncher"] = { type = "Model", model = "models/wystan/attachments/m203.mdl", bone = "Body", rel = "", pos = Vector(0.206, -2.681, -9.57), angle = Angle(0, 180, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "Body", rel = "", pos = Vector(-0.438, -1.726, 15.869), angle = Angle(0, 0, 90), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["cmag"] = { type = "Model", model = "models/wystan/cmag.mdl", bone = "Clip", rel = "", pos = Vector(0.273, 0.263, -3.744), angle = Angle(90, 0, 90), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.369, 0.861, -2.72), angle = Angle(0, -90, 182), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.157, 1, -2.889), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(16, 16.249, -1.139), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_m164.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.601, 0.63, -0.426), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_xtra_pistol"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_rif_m164.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/m16/fire.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.0631
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "AirboatGun"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/m416/m416-1.wav")
SWEP.SilencedVolume = 75
SWEP.MaxAmmo = 90

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.38 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.Burst = true
SWEP.NumShots = 0
SWEP.PlaybackRate = 3

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.8
SWEP.CurCone				= 0.04
SWEP.DecreaseRecoilTime 	= 0
SWEP.ConeAff1 				= 0 -- Crouching/standing
SWEP.ConeAff2 				= 0 -- Using ironsights
SWEP.ViewPunchCycle 		= 0
SWEP.ViewPunchDelay			= 0
SWEP.WalkPunchCycle			= 0
SWEP.WalkPunchDelay 		= 0
SWEP.UnConeTime				= 0 -- Amount of time after firing the last shot that needs to pass until accuracy increases
SWEP.FinalCone				= 0 -- Self explanatory
SWEP.VelocitySensivity		= 2.2 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.017
SWEP.HipCone 				= 0.063
SWEP.ScopeCone = 0.011
SWEP.InaccAff1 = 0.75
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "SMG1_Grenade"
SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip	= 0

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(3.894, -4.755, 1.911)
SWEP.AimAng = Vector(-0.138, 0.019, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.FlipOriginsPos = Vector(1.72, 0, -0.04)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(3.898, 0, 0.479)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-5.082, -6.886, -1.311)
SWEP.RunAng = Vector(0, -70, 0)

SWEP.ScopePos = Vector(3.857, -1.076, 0.587)
SWEP.ScopeAng = Vector(0, 0, 0)

util.PrecacheSound("weapons/m416/m416_boltforward.wav")
util.PrecacheSound("weapons/m416/m416_boltpull.wav")
util.PrecacheSound("weapons/m416/m416_boltrelease.wav")
util.PrecacheSound("weapons/m416/m416_clipin.wav")
util.PrecacheSound("weapons/m416/m416_clipout.wav")
util.PrecacheSound("weapons/m416/m416_deploy.wav")
util.PrecacheSound("weapons/m416/m416_silencer_on.wav")
util.PrecacheSound("weapons/m416/m416_silencer_off.wav")
util.PrecacheSound("weapons/m416/m416_tap.wav")
util.PrecacheSound("weapons/m416/m416_unsil-1.wav")
util.PrecacheSound("weapons/m416/m416-1.wav")
util.PrecacheSound("weapons/m416/safety.wav")
util.PrecacheSound("weapons/m416/assist.wav")

function SWEP:Reload()
	if self.Weapon.HasReleasedKey == false or CurTime() < self.Weapon.ReloadDelay then
		return
	end

	if SERVER then
		if self.Owner:KeyDown(IN_USE) then
			//if self.Weapon.NoAuto != true then
				if self.Weapon.Burst == false then
					self.Primary.Automatic = true
					self.Weapon.Burst = true
					self.Primary.Delay = 0.0631
					self.Weapon:EmitSound("weapons/smg1/switch_single.wav", 70, math.random(99, 101))
					umsg.Start("FRMD", self.Owner)
						umsg.String("burst")
					umsg.End()
				else
					self.Primary.Automatic = false
					self.Weapon.Burst = false
					self.Primary.Delay = 0.2
					self.Weapon:EmitSound("weapons/smg1/switch_burst.wav", 70, math.random(99, 101))
					umsg.Start("FRMD", self.Owner)
						umsg.String("semi")
					umsg.End()
				end
				
				self.Weapon.HasReleasedKey = false
				self.Weapon.ReloadDelay = CurTime() + 0.5
				
				return
			//end
		end
	end
		
	if self.Weapon:GetDTInt(3) != 2 then
		if self.Weapon:Clip1() < self.Primary.ClipSize + 1 and self.Weapon:Clip1() < self.Primary.ClipSize then
			if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
				if CurTime() > self.Weapon.ReloadDelay then
					self.Weapon:StartCustomReload(self.Weapon.AnimPrefix .. (self.Weapon.ReloadAct or "reload"), self.Weapon.ReloadSpeed)
					self.Owner:SetAnimation(PLAYER_RELOAD)
					if SERVER then
					
						for k, v in pairs(ents.FindInSphere(self.Owner:GetShootPos(), 192)) do
							if v:IsPlayer() and v:Team() == self.Owner:Team() and v != self.Owner then -- make sure that we are close to a player to inform them and make sure that we aren't talking to ourselves
								if self.Owner:Team() == TEAM_REBELS then
									if CurTime() > self.Owner.ReloadSayDelay then
										self.Owner:EmitSound("vo/npc/male01/coverwhilereload0" .. math.random(1, 2) .. ".wav", 70, math.random(99, 101))
										self.Owner.ReloadSayDelay = CurTime() + 2
									end
								end
								
								break
							end
						end
						
						if self.Owner:GetFOV() != 0 then
							self.Owner:SetFOV(0, 0.3)
							self.Owner:DrawViewModel(true)
							self.Weapon.LastMag = self.Weapon:Clip1()
							if self.Weapon:Clip1() > 1 then
								if not self.Weapon.CantChamber then
									self.Owner:SetAmmo(self.Owner:GetAmmoCount(self.Weapon:GetPrimaryAmmoType()) + self.Weapon:Clip1() - 1, self.Weapon:GetPrimaryAmmoType())
									self.Weapon:SetClip1(1)
								else
									self.Owner:SetAmmo(self.Owner:GetAmmoCount(self.Weapon:GetPrimaryAmmoType()) + self.Weapon:Clip1(), self.Weapon:GetPrimaryAmmoType())
									self.Weapon:SetClip1(0)
								end
							end
						end
					end
					self.Weapon:SetDTInt(3, 0)
				end
			end
		end
	end
end

function SWEP:PrimaryAttack()

	if self.Weapon.Burst and self.Weapon.NumShots == 3 then
		return
	end

	if self.Weapon.ShouldBolt == true or self.Weapon.IsReloading == true then
		return
	end
	
	if self.Weapon:GetDTInt(3) == 2 then
		return
	end
	
	local time = CurTime()
	
	if self.Weapon.SecondaryAtt == 1 and self.Owner:KeyDown(IN_USE) and self.Weapon:GetDTInt(3) != 8 then
	
		if SERVER then
			if self.Weapon.Grenade == false then
				self.Owner:EmitSound("weapons/shotgun/shotgun_empty.wav", 65, math.random(99, 101))
				self.Weapon.Grenade = true
			else
				self.Owner:EmitSound("weapons/ClipEmpty_Rifle.wav", 65, math.random(99, 101))
				self.Weapon.Grenade = false
			end
		end
		
		self.Weapon:SetNextPrimaryFire( time + 0.25 )
		self.Weapon:SetNextSecondaryFire( time + 0.25 )
		return
	end
	
	if (self.Weapon:Clip1() == 0 or self.Owner:WaterLevel() == 3) then
		self.Weapon:EmitSound("weapons/shotgun/shotgun_empty.wav", 65, math.random(99, 101))
		self.Weapon:SetNextSecondaryFire( CurTime() + 0.05 )
		self.Weapon:SetNextPrimaryFire( CurTime() + 0.25 )
		return
	end
	
	if CLIENT and not SinglePlayer() then
		if self.Owner:KeyDown(IN_USE) then
			if (self.Weapon.VElements and self.Weapon.VElements["grenadelauncher"] and self.Weapon.VElements["grenadelauncher"].color.a == 255) or self.Weapon:GetDTInt(3) == 8 then
				return
			end
		else
			if self.Weapon.VElements and self.Weapon.VElements["grenadelauncher"] and self.Weapon.VElements["grenadelauncher"].color.a == 255 and self.Weapon:GetDTInt(3) == 8 then
				return
			end
		end
	end
	
	if SERVER then
		if self.Weapon.SecondaryAtt == 1 and self.Weapon.Grenade and self.Weapon:GetDTInt(3) == 8 then
			if self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
				self.Owner:EmitSound("weapons/shotgun/shotgun_empty.wav", 65, math.random(99, 101))
				self.Weapon:SetNextPrimaryFire( time + 0.25 )
				self.Weapon:SetNextSecondaryFire( time + 0.05 )
				return
			end
		
			local prop = ents.Create(self.Weapon.GrenadeType)
			prop:SetPos(self.Owner:EyePos() + self.Owner:GetAimVector() * 24 + self.Owner:GetRight() * 4 + self.Owner:GetUp() * -6)
			prop:SetOwner(self.Owner)
			prop:SetAngles(self.Owner:EyeAngles())
			prop.BlastRadius = self.Weapon.BlastRadius
			prop.BlastDamage = self.Weapon.BlastDamage
			prop:Spawn()
			prop:GetPhysicsObject():SetVelocity(self.Owner:GetAimVector() * 3500)
			prop:SetGravity(1.8)
			prop:SetOwner(self.Owner)
			
			self.Owner:ViewPunch(Angle(-10, 0, 0))
			self.Owner:EmitSound("weapons/grenade_launcher1.wav", 85, 100)
			self.Weapon:TakeSecondaryAmmo(1)
			self.Weapon:SetDTInt(3, 0)
			self.Owner:SetFOV(0, 0.3)
			
			if self.Owner:GetAmmoCount("SMG1_Grenade") > 0 then
				self.Weapon:SetNextPrimaryFire(time + 3)
				self.Weapon:SetNextSecondaryFire(time + 3)
				self.Weapon.ReloadDelay = time + 3
				self.Owner.AttachDelay = time + 3
			else
				self.Weapon:SetNextPrimaryFire(time + 0.3)
				self.Weapon:SetNextSecondaryFire(time + 0.3)
				self.Weapon.ReloadDelay = time + 0.3
				self.Owner.AttachDelay = time + 0.3
			end
			
			timer.Simple(0.5, function()
				if (self.Weapon == nil or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass()) or self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
					return
				end
			
			self.Weapon:SetDTInt(3, 6)
			end)
				
			timer.Simple(1, function()
				if (self.Weapon == nil or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass()) or self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
					return
				end
				
				self.Owner:EmitSound("weapons/smg1/smg1_reload.wav", 50, 100)
				self.Owner:DoAnimationEvent(ACT_ITEM_GIVE)
			end)
			
			timer.Simple(2.75, function()
				if (self.Weapon == nil or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass()) or self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
					return
				end
				
				self.Weapon:SetDTInt(3, 0)
			end)
				
			if self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
				self.Weapon.Grenade = false
			end
			
			return
		end
	end
	
	self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	if ( !self:CanPrimaryAttack() ) then return end
	
	if SERVER then
		if self.Weapon.IsSilenced == false then
			self.Owner:EmitSound(self.Primary.Sound, self.Weapon.UnsilencedVolume, math.random(99, 101))
		else
			self.Owner:EmitSound(self.Weapon.SilencedSound, self.Weapon.SilencedVolume, math.random(99, 101))
		end
		
		if self.Weapon:Clip1() <= 10 then
			self.Owner:EmitSound("weapons/ClipEmpty_Rifle.wav", 60 - (self.Weapon:Clip1() * 4), 100)
		end
		
		if self.Owner.CloakOn then
			self.Owner:SetDTInt(2, 0)
		end
	end
	
	self.Weapon.ReloadDelay = CurTime() + 0.5
	self.Owner.AttachDelay = CurTime() + 0.5
	if self.Weapon:GetDTInt(3) != 1 then
		self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil * 1.2, self.Primary.NumShots, self.Weapon:GetDTFloat(0))
	else
		self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil * 0.75, self.Primary.NumShots, self.Weapon:GetDTFloat(0))
	end
	
	if self.Weapon.Burst then
		self.Weapon.NumShots = self.Weapon.NumShots + 1
	end
	
	self:TakePrimaryAmmo( 1 )
	
	self.Weapon.ConeInaccuracy = math.Clamp(self.Weapon.ConeInaccuracy + (0.005 + self.Weapon.DefRecoil * (0.006 - (self.Weapon.ConeDecAff1 + self.Weapon.ConeDecAff2))) * self.Weapon.InaccAff1, 0, 0.12 * (self.Weapon.ConeInaccuracyAff1))
	self.Weapon.ConeInaccDelay = CurTime() + self.Primary.Delay * 1.05
	
	if ( self.Owner:IsNPC() ) then return end
	
	self.Owner:ViewPunch( Angle(-1 * (self.Primary.Recoil + self.Weapon.ConeInaccuracy * 4) * (1 - (self.Weapon.RecoilAff1 + self.Weapon.RecoilAff2 + self.Weapon.RecoilAff3)), 0, 0 ) )
	
end