

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	SWEP.NoGL = false
	SWEP.NoCMag = false
	SWEP.NoVertGrip = false
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.PrintName			= "H&K416"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.NoRail = true
	SWEP.CurSightsTexture = "Models/Weapons/V_Models/twinke.hk416/10"
	SWEP.CurWSightsTexture = "Models/Weapons/W_Models/twinke.hk416/10"
	SWEP.InitialDraw = true
	SWEP.NoProperIronsights = true
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_hk416")
	SWEP.Bone = "Right_L_Arm"
	SWEP.BoneOffset = Vector(0, 0, 5)
	SWEP.CurOffset = Vector(0, 0, 0)
	SWEP.CurAngleOffset = Angle(0, 0, 0)
	SWEP.ActiveOffset = Vector(-4.5, -4.5, 0)
	SWEP.ActiveAngleOffset = Vector(0, 0, -90)
	SWEP.DrawAngleMod = -1
	SWEP.SilencerAngleMod = -1
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.Muzzle = "cstm_muzzle_ar"
	
	SWEP.GrenadeLauncher_Idle = {
	["Right_L_Arm"] = {vector = Vector(0, 0, 5), angle = Vector(0, 0, 0)}}
	
	SWEP.GrenadeLauncher_Active = {
	['Right_L_Arm'] = {vector = Vector(-4.7369999885559, -3.6510000228882, 2.055999994278), angle = Vector(0, 0, -90)}}
	//["Right_L_Arm"] = {vector = Vector(-4.5, -4.5, 0), angle = Vector(0, 0, -90)}}
	
	SWEP.CMag_Idle = {
	['Right_L_Arm'] = {vector = Vector(0.75499999523163, 0.76099997758865, 4.7199997901917), angle = Vector(27.413000106812, 0, 24.20599937439)},
	['Bone14'] = {vector = Vector(0, 0, 0), angle = Vector(-6.1560001373291, 0, 0)},
	['Bone15'] = {vector = Vector(0, 0, 0), angle = Vector(-11.444000244141, 0, 0)},
	['Bone18'] = {vector = Vector(0, 0, 0), angle = Vector(-39.450000762939, 0, 0)},
	['Bone19'] = {vector = Vector(0, 0, 0), angle = Vector(-2.6189999580383, 0, 0)},
	['Bone20'] = {vector = Vector(0, 0, 0), angle = Vector(22.131000518799, 0, 0)},
	['Bone10'] = {vector = Vector(0, 0, 0), angle = Vector(-5.4689998626709, 0, 0)},
	['Bone06'] = {vector = Vector(0, 0, 0), angle = Vector(8.5430002212524, 0, 0)},
	['Bone08'] = {vector = Vector(0, 0, 0), angle = Vector(-13.251000404358, 0, 0)} }
	
	SWEP.VertGrip_Idle = {
	['Right_L_Arm'] = {vector = Vector(-0.21899999678135, -2.7750000953674, -0.73000001907349), angle = Vector(-22.231000900269, 10.093999862671, -99.78099822998)},
	['Right_Hand'] = {vector = Vector(0, 0, 0), angle = Vector(0, 27.337999343872, 0)},
	['Bone06'] = {vector = Vector(0, 0, 0), angle = Vector(37.794998168945, 0, 0)},
	['Bone07'] = {vector = Vector(0, 0, 0), angle = Vector(32.733001708984, 0, 0)},
	['Bone10'] = {vector = Vector(0, 0, 0), angle = Vector(51.257999420166, 0, 0)},
	['Bone12'] = {vector = Vector(0, 0, 0), angle = Vector(49.988998413086, 0, 0)},
	['Bone14'] = {vector = Vector(0, 0, 0), angle = Vector(49.063999176025, 0, 0)},
	['Bone16'] = {vector = Vector(0, 0, 0), angle = Vector(44.226001739502, 0, 0)},
	['Bone18'] = {vector = Vector(0, 0, 0), angle = Vector(34.095001220703, 0, 0)},
	['Bone20'] = {vector = Vector(0, 0, 0), angle = Vector(34.488998413086, 0, 0)},
	['Bone22'] = {vector = Vector(0, 0, 0), angle = Vector(19.305999755859, -9.7440004348755, 0)},
	['Bone23'] = {vector = Vector(0, 0, 0), angle = Vector(0, -38.35599899292, 25.843999862671)},
	['Bone24'] = {vector = Vector(0, 0, 0), angle = Vector(0, -37.637001037598, 0)} }
	
	SWEP.MagBone = "magazine"
	
	killicon.Add( "cstm_rif_hk416", "VGUI/kills/kill_hk416", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "smdimport", pos = Vector(-0.338, -7.875, 8.043), angle = Angle(-4.441, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "smdimport", pos = Vector(-0.043, 0.481, -4.784), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["grenadelauncher"] = { type = "Model", model = "models/wystan/attachments/m203.mdl", bone = "smdimport", rel = "", pos = Vector(0.18, -4.744, 1.957), angle = Angle(180, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "smdimport", pos = Vector(0.312, -1.8, 2.331), angle = Angle(0, 180, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "smdimport", pos = Vector(-0.071, 1.963, -4.58), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "smdimport", pos = Vector(-0.145, 0.968, -4.502), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "smdimport", pos = Vector(0.105, -3.681, 2.256), angle = Angle(0, 180, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["cmag"] = { type = "Model", model = "models/wystan/cmag.mdl", bone = "magazine", rel = "", pos = Vector(0.174, -4.007, -0.931), angle = Angle(0, -90, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "smdimport", rel = "", pos = Vector(-0.438, 19.618, 1.018), angle = Angle(0, 0, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(-1.869, 1.394, 4.881), angle = Angle(-4.441, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(1.718, 0.938, -1.025), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", pos = Vector(3.305, 0.794, -0.788), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(16.669, 11.762, -1.356), angle = Angle(0, 0, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_m416.mdl", pos = Vector(-0.894, 0.612, -0.475), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_xtra_pistol"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_rif_m416.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/m416/m416_unsil-1.wav")
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
SWEP.SilencedSound = Sound("weapons/m416/m416-1.wav")
SWEP.SilencedVolume = 75

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.49 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.MaxAmmo = 90

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 1
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
SWEP.VelocitySensivity		= 1.6 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.021
SWEP.HipCone 				= 0.057
SWEP.ScopeCone = 0.0155
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

SWEP.AimPos = Vector(-0.32, -6.066, 1.6)
SWEP.AimAng = Vector(0, 0, 0)

//SWEP.AimPos = Vector(2.867, -3.444, 0.964)
//SWEP.AimAng = Vector(0, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(2.796, -3.28, 1.026)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.72, 0, -0.04)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(2.868, -3.444, 0.949)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(2.901, -2, 0.745)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-10.164, -6.394, -2.951)
SWEP.RunAng = Vector(0, -70, 0)

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