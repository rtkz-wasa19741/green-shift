if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	SWEP.CantSilence = true
	SWEP.NoVertGrip = false
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.PrintName			= "SIG 551"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.DifType = true
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.Muzzle = "cstm_muzzle_ar"
	
	SWEP.VertGrip_Idle = {
		['R_Forearm'] = {vector = Vector(1.75100004673, 0.625, -2.6070001125336), angle = Vector(0, 0, -70.875)},
		['R_Index1'] = {vector = Vector(0, 0, 0), angle = Vector(-46.187999725342, 0, 0)},
		['R_Index2'] = {vector = Vector(0, 0, 0), angle = Vector(-13.987999916077, 0, 0)},
		['R_Index3'] = {vector = Vector(0, 0, 0), angle = Vector(-22.305999755859, 0, 0)},
		['R_Mid1'] = {vector = Vector(0, 0, 0), angle = Vector(-35.174999237061, 0, 0)},
		['R_Mid2'] = {vector = Vector(0, 0, 0), angle = Vector(-9.4130001068115, 0, 0)},
		['R_Mid3'] = {vector = Vector(0, 0, 0), angle = Vector(-24.363000869751, 0, 0)},
		['R_Ring1'] = {vector = Vector(0, 0, 0), angle = Vector(-24.687999725342, 0, 0)},
		['R_Ring3'] = {vector = Vector(0, 0, 0), angle = Vector(-24.488000869751, 0, 0)},
		['R_Pinky1'] = {vector = Vector(0, 0, 0), angle = Vector(5.313000202179, -3.8129999637604, 0)},
		['R_Pinky3'] = {vector = Vector(0, 0, 0), angle = Vector(-45.831001281738, 0, 0)},
		['R_Thumb1'] = {vector = Vector(0, 0, 0), angle = Vector(-21.587999343872, 15.47500038147, 0)},
		['R_Thumb2'] = {vector = Vector(0, 0, 0), angle = Vector(-5.6189999580383, 65.41300201416, 0)},
		['R_Thumb3'] = {vector = Vector(0, 0, 0), angle = Vector(0, 77.474998474121, 0)} }
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_sg551")
	
	killicon.Add( "cstm_rif_sg551", "VGUI/kills/kill_sg551", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "Body", rel = "", pos = Vector(0.067, -1.15, -3.889), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "Body", rel = "", pos = Vector(0.293, 8.968, 8.744), angle = Angle(-4.444, 90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Body", rel = "", pos = Vector(-0.182, 5.179, 2.868), angle = Angle(0, 0, 179.975), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "Body", rel = "", pos = Vector(0.041, 1.605, -4.24), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "Body", rel = "", pos = Vector(0.018, -0.65, -3.863), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "Body", rel = "", pos = Vector(-0.313, 3.812, 2.831), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "Body", rel = "", pos = Vector(-0.35, 2.555, 1.756), angle = Angle(0, 0, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.35, 1.225, -0.618), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.912, 1.7, 5.275), angle = Angle(-4.444, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.517, 1.082, -0.438), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_sg551.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.65, 1.419, -0.625), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(17.993, 13.6, -1.308), angle = Angle(0, 0, 180), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.NoRail = true
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_rif_sg551.mdl"
SWEP.WorldModel = "models/weapons/w_rif_sg552.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/sg551/sg551-1.wav")
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
SWEP.MaxAmmo = 90

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.39 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.PlaybackRate = 2

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.97
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
SWEP.IronsightsCone			= 0.019
SWEP.HipCone 				= 0.062
SWEP.ScopeCone = 0.014
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(3.453, -2.587, 1.347)
SWEP.AimAng = Vector(1.187, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(3.424, -2.82, 1.207)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(3.473, -2.82, 1.238)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.48, 0, -0.48)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(3.454, -1.532, 0.865)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-5.082, -6.886, -1.311)
SWEP.RunAng = Vector(0, -70, 0)

util.PrecacheSound("weapons/sig552/boltback.wav")
util.PrecacheSound("weapons/sig552/boltpull.wav")
util.PrecacheSound("weapons/sig552/clipin.wav")
util.PrecacheSound("weapons/sig552/clipout.wav")
util.PrecacheSound("weapons/sig552/safety.wav")
util.PrecacheSound("weapons/sig552/sg552-1.wav")