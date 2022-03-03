

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	SWEP.NoVertGrip = false
	SWEP.NoCMag = false
	SWEP.NoGL = false
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.OffsetBones = {}
	SWEP.TargetOffset = {}

	SWEP.PrintName			= "M4A1"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.NoRail = true
	SWEP.CurSightsTexture = "Models/Weapons/V_Models/twinke.hk416/10"
	SWEP.CurWSightsTexture = "Models/Weapons/W_Models/twinke.hk416/10"
	SWEP.InitialDraw = true
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_m4a1")
	
	SWEP.GrenadeLauncher_Idle = {
		['Left_L_Arm'] = {vector = Vector(0, 0, 2.6119999885559), angle = Vector(0, 0, 0)},
		['Left1'] = {vector = Vector(0, 0, 0), angle = Vector(5.1939997673035, -13.812999725342, 0)},
		['Left2'] = {vector = Vector(0, 0, 0), angle = Vector(0, 11.069000244141, 0)} }
	
	SWEP.GrenadeLauncher_Active = {
		['Left_L_Arm'] = {vector = Vector(-4.6950001716614, 2.819000005722, 1.2690000534058), angle = Vector(0, -8.6440000534058, 89.849998474121)},
		['Left1'] = {vector = Vector(0, 0, 0), angle = Vector(-7.8249998092651, 0, 0)},
		['Left4'] = {vector = Vector(0, 0, 0), angle = Vector(18.312999725342, -1.5119999647141, 0)},
		['Left7'] = {vector = Vector(0, 0, 0), angle = Vector(14.437999725342, 3.319000005722, 0)},
		['Left10'] = {vector = Vector(0, 0, 0), angle = Vector(7.3629999160767, 0, 0)},
		['Left13'] = {vector = Vector(0, 0, 0), angle = Vector(-8.581000328064, 0, 0)} }
		
	
	SWEP.PitchMod = -1
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.Muzzle = "cstm_muzzle_ar"
	
	SWEP.VertGrip_Idle = {
		['Left_L_Arm'] = {vector = Vector(-0.38100001215935, -0.21899999678135, 1.8940000534058), angle = Vector(0, 0, 90)},
		['Left4'] = {vector = Vector(0, -0.15000000596046, 0), angle = Vector(60.14400100708, -13.27499961853, 0)},
		['Left5'] = {vector = Vector(0, 0, 0), angle = Vector(19.218999862671, -3.8310000896454, 0)},
		['Left7'] = {vector = Vector(0, 0, 0), angle = Vector(42.444000244141, -8.8680000305176, 0)},
		['Left9'] = {vector = Vector(0, 0, 0), angle = Vector(13.449999809265, 0, 0)},
		['Left10'] = {vector = Vector(0, 0, 0), angle = Vector(31.812000274658, -1.3999999761581, 0)},
		['Left12'] = {vector = Vector(0, 0, 0), angle = Vector(24.488000869751, 0, 0)},
		['Left13'] = {vector = Vector(0, 0, 0), angle = Vector(19.91900062561, 0, 0)},
		['Left1'] = {vector = Vector(0, 0, 0), angle = Vector(27.77499961853, 0.98199999332428, 0)},
		['Left2'] = {vector = Vector(0, 0, 0), angle = Vector(0, 23.14999961853, 0)},
		['Left3'] = {vector = Vector(0, 0, 0), angle = Vector(0, 44.89400100708, 0)} }
	
	SWEP.CMag_Idle = {
	['Left_L_Arm'] = {vector = Vector(1.5190000534058, -0.20000000298023, 4.6750001907349), angle = Vector(22.937000274658, 0, 0)},
	['Left7'] = {vector = Vector(0, 0, 0), angle = Vector(-7.0689997673035, 0, 0)},
	['Left10'] = {vector = Vector(0, 0, 0), angle = Vector(-9.0069999694824, 0, 0)},
	['Left13'] = {vector = Vector(0, 0, 0), angle = Vector(-12.675999641418, 0, 0)} }
	
	SWEP.OtherBone = "|*M4| - Carry Handle"
	SWEP.MagBone = "|*M4| - Magazine"
	
	killicon.Add( "cstm_rif_m4a1", "VGUI/kills/kill_m4a1", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "|*M4| - Receiver", rel = "", pos = Vector(-1.744, -5.337, 0.317), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "|*M4| - Receiver", rel = "", pos = Vector(-1.685, -8.513, 0.61), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "|*M4| - Receiver", rel = "", pos = Vector(-1.425, 2.062, 13.225), angle = Angle(-4.444, 90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "|*M4| - Receiver", rel = "", pos = Vector(-2.106, -3.056, 7.407), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "|*M4| - Receiver", rel = "", pos = Vector(-1.657, -7, 0.62), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "|*M4| - Receiver", rel = "", pos = Vector(-1.907, -2.337, 7.381), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "|*M4| - Receiver", rel = "", pos = Vector(-12.275, -15.818, 5.263), angle = Angle(0, -90, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["cmag"] = { type = "Model", model = "models/wystan/cmag.mdl", bone = "|*M4| - Magazine", rel = "", pos = Vector(-1.788, -6.257, 5.343), angle = Angle(0, 90, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["grenadelauncher"] = { type = "Model", model = "models/wystan/attachments/m203.mdl", bone = "|*M4| - Receiver", rel = "", pos = Vector(-1.856, -4.401, 6.057), angle = Angle(0, 0, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(15.975, 16.618, -0.445), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.375, 1.781, 3.957), angle = Angle(-4.444, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.118, 1.187, -1.994), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.288, 1.319, -1.951), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_m4cu.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.668, 0.999, -0.245), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_xtra_pistol"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rif_m4cu.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/m4a1customizable/m4a1_unsil-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.063
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "AirboatGun"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/m4a1customizable/m4a1-1.wav")
SWEP.SilencedVolume = 75

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "SMG1_Grenade"
SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip	= 0

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.PlaybackRate = 2
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.4 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
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
SWEP.VelocitySensivity		= 2.2 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.018
SWEP.HipCone 				= 0.065
SWEP.ScopeCone = 0.0125
SWEP.InaccAff1 = 0.75
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(-2.895, -3.319, 0.547)
SWEP.AimAng = Vector(0.079, 0, -0.327)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(-2.846, -2.488, 0.568)
SWEP.ScopeAng = Vector(0, 0.2, 0)

SWEP.NoFlipOriginsPos = Vector(-1.16, 0, -0.16)
SWEP.NoFlipOriginsAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(-2.886, -1.311, 0.656)
SWEP.ReflexAng = Vector(-0.814, 0, 0)

SWEP.ACOGPos = Vector(-2.952, 0, 0.268)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPosNoFlip = Vector(7.376, -3.935, -2.951)
SWEP.RunAngNoFlip = Vector(0, 70, 0)

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