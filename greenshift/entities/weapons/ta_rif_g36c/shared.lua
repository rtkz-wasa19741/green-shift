

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	SWEP.NoGL = false
	SWEP.NoVertGrip = false
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then
	SWEP.PrintName			= "H&K G36C"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.NoRail = true
	SWEP.DrawAngleMod = -1
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.Muzzle = "cstm_muzzle_ar"
	
	SWEP.VertGrip_Idle = {
		['Right_Forearm'] = {vector = Vector(-2.1500000953674, 1.182000041008, 3.444000005722), angle = Vector(0, 0, 0)},
		['R_Thumb'] = {vector = Vector(0, 0, 0), angle = Vector(-2.9189999103546, -14.031000137329, -2.625)},
		['R_Thumb2'] = {vector = Vector(0, 0, 0), angle = Vector(-0.31900000572205, 0, -20.325000762939)}}
		
	SWEP.GrenadeLauncher_Idle = {
		['Right_Arm'] = {vector = Vector(0, 0, 0), angle = Vector(0, 0, 0)}}
		
	SWEP.GrenadeLauncher_Active = {
		['Right_Arm'] = {vector = Vector(0, -1, 1), angle = Vector(0, 0, 0)}}
		
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_g36c")
	
	killicon.Add( "cstm_rif_g36c", "VGUI/kills/kill_g36c", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "BaseW", pos = Vector(-0.212, -0.169, -6.901), angle = Angle(4.512, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["grenadelauncher"] = { type = "Model", model = "models/wystan/attachments/m203.mdl", bone = "BaseW", rel = "", pos = Vector(0.275, -4.296, -2.095), angle = Angle(180, 0, -180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "BaseW", pos = Vector(0.034, -10.544, 5.774), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "BaseW", pos = Vector(0.012, -9, 5.973), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "BaseW", pos = Vector(0.368, -6.709, -1.157), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "BaseW", pos = Vector(-0.038, -9.224, 5.723), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "BaseW", pos = Vector(0.212, -4.581, -1.032), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "BaseW", rel = "", pos = Vector(10.562, -17.726, -0.301), angle = Angle(0, -90, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(-3.188, 0.837, 4.044), angle = Angle(-3.931, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", pos = Vector(2.368, 0.231, -1.762), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(1.587, 0.4, -1.744), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(16.187, 15.718, -1.058), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_g36c.mdl", pos = Vector(-0.201, 0, -0.413), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_xtra_pistol"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_rif_g36c.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/g36c/g36c_nosil.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.085
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "AirboatGun"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/g36c/g36c_sil.wav")
SWEP.SilencedVolume = 75

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.45 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.MaxAmmo = 90

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.9
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
SWEP.VelocitySensivity		= 1.5 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.021
SWEP.HipCone 				= 0.06
SWEP.ScopeCone = 0.015
SWEP.InaccAff1 = 0.75
SWEP.ConeInaccuracyAff1 = 0.7
SWEP.PlaybackRate = 2.5

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "SMG1_Grenade"
SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip	= 0

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(4.064, -3, 1.475)
SWEP.AimAng = Vector(0.237, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(3.997, -3.75, 0.714)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(2.799, 0, -0.08)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(4.067, -3.569, 0.665)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(4.046, -1.5, 0.469)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-5.082, -6.886, -1.311)
SWEP.RunAng = Vector(0, -70, 0)

util.PrecacheSound("weapons/g36c/g36c_boltpull.wav")
util.PrecacheSound("weapons/g36c/g36c_boltrelease.wav")
util.PrecacheSound("weapons/g36c/g36c_clipin.wav")
util.PrecacheSound("weapons/g36c/g36c_clipout.wav")
util.PrecacheSound("weapons/g36c/g36c_nosil.wav")
util.PrecacheSound("weapons/g36c/g36c_sil.wav")
util.PrecacheSound("weapons/g36c/g36c_silencer_click.wav")
util.PrecacheSound("weapons/g36c/g36c_silencer_release.wav")
util.PrecacheSound("weapons/g36c/g36c_silencer_twist.wav")