

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.PrintName			= "FN SCAR-L"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.NoRail = true
	SWEP.CurSightsTexture = "Models/Weapons/V_Models/FNScar/Sights"
	SWEP.InitialDraw = true
	SWEP.NoProperIronsights = true
	SWEP.Muzzle = "cstm_muzzle_ar"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_scar")
	
	killicon.Add( "cstm_rif_scarl", "VGUI/kills/kill_scar", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "car15_reciever", pos = Vector(-0.288, -9.638, 8.6), angle = Angle(-4.444, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "car15_reciever", pos = Vector(-0.06, -1.4, -4.207), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "car15_reciever", pos = Vector(0.268, -3.444, 2.187), angle = Angle(0, 180, -180), size = Vector(0.899, 0.899, 0.899), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "car15_reciever", pos = Vector(-0.094, -0.038, -4.066), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "car15_reciever", pos = Vector(-0.015, 0.344, -4.015), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "car15_reciever", pos = Vector(0.156, -5.2, 2.694), angle = Angle(0, 180, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", pos = Vector(0.837, 0.555, -0.375), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(-0.431, 0.68, -0.431), angle = Angle(0, -90, 179.824), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(-3.888, 1.162, 5.381), angle = Angle(-4.444, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_scar.mdl", pos = Vector(-0.907, 0.363, -0.318), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_xtra_pistol"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_rif_scar.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/scar/scar_unsil-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.096
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
SWEP.IncAmmoPerc = 0.4 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.MaxAmmo = 90

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.825
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
SWEP.VelocitySensivity		= 1.2 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.02
SWEP.HipCone 				= 0.042
SWEP.ScopeCone = 0.014
SWEP.InaccAff1 = 0.65
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(0, -3.444, 1.148)
SWEP.AimAng = Vector(0, 0, 0)

//SWEP.AimPos = Vector(2.953, -1.803, 0.813)
//SWEP.AimAng = Vector(0.206, -0.026, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(2.883, -1.64, 0.85)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.72, 0, -0.04)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(2.96, -1.149, 0.901)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(2.92, 1, 0.708)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-5.082, -6.886, -1.311)
SWEP.RunAng = Vector(0, -70, 0)

util.PrecacheSound("weapon/scar/scar_boltpull.wav")
util.PrecacheSound("weapon/scar/scar_boltrelease.wav")
util.PrecacheSound("weapon/scar/scar_clipin.wav")
util.PrecacheSound("weapon/scar/scar_clipout.wav")
util.PrecacheSound("weapon/scar/scar_deploy.wav")
util.PrecacheSound("weapon/scar/scar_magtap.wav")
util.PrecacheSound("weapon/scar/scar_silencer_on.wav")
util.PrecacheSound("weapon/scar/scar_silencer_off.wav")
util.PrecacheSound("weapon/scar/scar_unsil-1.wav")
util.PrecacheSound("weapon/scar/scar-1.wav")