

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.NoEOTech = true
	SWEP.DoesntDropRail = true
	SWEP.NoVertGrip = false
	SWEP.NoCMag = false
	SWEP.NoGL = false
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.PrintName			= "ZM LR300"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.NoRail = true
	SWEP.CurSightsTexture = "Models/Weapons/V_Models/FNScar/Sights"
	SWEP.InitialDraw = true
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.Muzzle = "cstm_muzzle_ar"
	SWEP.DifType = true
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_lr300")
	
	killicon.Add( "cstm_rif_lr300", "VGUI/kills/kill_lr300", Color( 255, 80, 0, 255 ) )
	
	SWEP.VertGrip_Idle = {
	['R_Forearm'] = {vector = Vector(-2.4500000476837, 0.88800001144409, -6.1119999885559), angle = Vector(0, 0, -90)},
	['R_Wrist'] = {vector = Vector(0, 0, 0), angle = Vector(0.51899999380112, 0, 0)},
	['R_Index1'] = {vector = Vector(0, 0, 0), angle = Vector(32.64400100708, 0, 0)},
	['R_Index2'] = {vector = Vector(0, 0, 0), angle = Vector(47.65599822998, 0, 0)},
	['R_Index3'] = {vector = Vector(0, 0, 0), angle = Vector(19.944000244141, 0, 0)},
	['R_Mid1'] = {vector = Vector(0, 0, 0), angle = Vector(51.361999511719, 0, 0)},
	['R_Mid2'] = {vector = Vector(0, 0, 0), angle = Vector(42.28099822998, 0, 0)},
	['R_Ring1'] = {vector = Vector(0, 0, 0), angle = Vector(41.012001037598, 0, 0)},
	['R_Ring2'] = {vector = Vector(0, 0, 0), angle = Vector(26.231000900269, 0, 0)},
	['R_Ring3'] = {vector = Vector(0, 0, 0), angle = Vector(43.125, 0, 0)},
	['R_Pinky1'] = {vector = Vector(0, 0, 0), angle = Vector(36.111999511719, 0, 0)},
	['R_Pinky2'] = {vector = Vector(0, 0, 0), angle = Vector(37.180999755859, 0, 0)},
	['R_Thumb1'] = {vector = Vector(0, 0, 0), angle = Vector(11.418000221252, -14.711999893188, 0)},
	['R_Thumb2'] = {vector = Vector(0, 0, 0), angle = Vector(4.4180002212524, -63.099998474121, 0)},
	['R_Thumb3'] = {vector = Vector(0, 0, 0), angle = Vector(0, -67.563003540039, 0)} }
	
	SWEP.CMag_Idle = {
	['R_Forearm'] = {vector = Vector(-2.944000005722, -0.92500001192093, -8), angle = Vector(36.236999511719, 0, 0)},
	['R_Thumb1'] = {vector = Vector(0, 0, 0), angle = Vector(0, -2.9809999465942, 0)},
	['R_Mid1'] = {vector = Vector(0, 0, 0), angle = Vector(-11.10000038147, 0, 0)},
	['R_Ring1'] = {vector = Vector(0, 0, 0), angle = Vector(-10.144000053406, 0, 0)},
	['R_Pinky1'] = {vector = Vector(0, 0, 0), angle = Vector(-11.39999961853, 0, 0)},
	['R_Pinky2'] = {vector = Vector(0, 0, 0), angle = Vector(-10.005999565125, 0, 0)},
	['R_Pinky3'] = {vector = Vector(0, 0, 0), angle = Vector(-0.90600001811981, 0, 0)}}
	
	SWEP.GrenadeLauncher_Idle = {
	['R_Forearm'] = {vector = Vector(-0.3740000128746, 0, -4.8000001907349), angle = Vector(0, 0, 0)}}
	
	SWEP.GrenadeLauncher_Active = {
	['R_Forearm'] = {vector = Vector(3.5650000572205, 3.569000005722, -0.76899999380112), angle = Vector(0, 0, -75.775001525879)}}
	
	SWEP.MagBone = "Mag"
	
	/*SWEP.CMag_Idle = {
	['R_Forearm'] = {vector = Vector(5.1310000419617, 1.2070000171661, 1.2569999694824), angle = Vector(0, 0, -99.15599822998)},
	['R_Thumb1'] = {vector = Vector(0, 0, 0), angle = Vector(0, -3.0190000534058, 0)},
	['R_Thumb2'] = {vector = Vector(0, 0, 0), angle = Vector(0, -13.644000053406, 0)},
	['R_Thumb3'] = {vector = Vector(0, 0, 0), angle = Vector(0, -43.71900177002, 0)} }*/
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Body", rel = "", pos = Vector(0.013, -1.969, 17.899), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.2), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "Body", rel = "", pos = Vector(0.019, -4.441, -2.083), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "Body", rel = "", pos = Vector(0.002, -4.389, -1.101), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Body", rel = "", pos = Vector(-0.301, 3.726, -6.644), angle = Angle(0, 0, -90), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "Body", rel = "", pos = Vector(-0.332, 2.642, -4.337), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "Body", rel = "", pos = Vector(-0.369, 0.893, 2.236), angle = Angle(0, 0, -90), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["cmag"] = { type = "Model", model = "models/wystan/cmag.mdl", bone = "Mag", rel = "", pos = Vector(-0.195, -0.094, -3.651), angle = Angle(90, 0, -90), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["grenadelauncher"] = { type = "Model", model = "models/wystan/attachments/m203.mdl", bone = "Body", rel = "", pos = Vector(-0.257, 1.837, -4.819), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "weapon", pos = Vector(0.943, 0.312, -1.025), angle = Angle(0, 90, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.856, 1.069, 0.837), angle = Angle(0, -90, 180), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(27.455, 1.399, -4.42), angle = Angle(-90, 0, 0), size = Vector(0.05, 0.05, 0.2), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(19.08, 16.511, -0.62), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_lr300.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.987, 1.343, -0.737), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rif_lr300.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/lr300/lr300-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 20
SWEP.Primary.Delay			= 0.0631
SWEP.Primary.DefaultClip	= 20
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

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.87
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
SWEP.VelocitySensivity		= 1.8 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.016
SWEP.HipCone 				= 0.05
SWEP.ScopeCone = 0.0135
SWEP.InaccAff1 = 0.65
SWEP.ConeInaccuracyAff1 = 0.7
SWEP.MaxAmmo = 100

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(-3.836, -7.213, 1.705)
SWEP.AimAng = Vector(-0.257, 0, 0)

//SWEP.AimPos = Vector(2.953, -1.803, 0.813)
//SWEP.AimAng = Vector(0.206, -0.026, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(-3.84, -2.063, 1.552)
SWEP.ScopeAng = Vector(-0.607, 0, 0)

SWEP.NoFlipOriginsPos = Vector(-1.68, 0, 0.079)
SWEP.NoFlipOriginsAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(-3.826, 0, 1.445)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPosNoFlip = Vector(5.573, -6.394, -2.296)
SWEP.RunAngNoFlip = Vector(0, 70, 0)

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