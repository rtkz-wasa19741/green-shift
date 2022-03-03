if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.PrintName			= "SIG 552 Commando"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.DifType = true
	SWEP.Muzzle = "cstm_muzzle_ar"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_sg552")
	
	killicon.Add( "cstm_rif_sig552", "VGUI/kills/kill_sg552", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "ak47", pos = Vector(-0.231, 3.219, 4.586), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "ak47", pos = Vector(0.017, 7.875, -2.169), angle = Angle(0, 179.994, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "ak47", pos = Vector(-0.21, 5.2, 4.921), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "ak47", pos = Vector(0.15, 7.418, -2.195), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "ak47", pos = Vector(-0.175, 2.075, 4.63), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "ak47", pos = Vector(-0.438, 12.395, -8), angle = Angle(4.44, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ak47", rel = "", pos = Vector(-0.195, -8.356, 1.968), angle = Angle(0, 0, -90), size = Vector(0.054, 0.054, 0.155), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} }
	}
	

	
	SWEP.WElements = {
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(0.662, 1.218, -1.15), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", pos = Vector(2.292, 1.093, -1), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(-2.932, 1.669, 4.807), angle = Angle(-4.444, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_borealis/bluebarrel001.mdl", pos = Vector(26.343, 1.437, -4.645), angle = Angle(90, 0, 0), size = Vector(0.05, 0.05, 0.14), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_com_sg552.mdl", pos = Vector(-0.831, 1.468, -0.851), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
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
SWEP.ViewModel = "models/weapons/v_com_sg552.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/sig552/sg552-1.wav")
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
SWEP.IncAmmoPerc = 0.42 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.PlaybackRate = 2
SWEP.MaxAmmo = 90

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.92
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
SWEP.IronsightsCone			= 0.0225
SWEP.HipCone 				= 0.06
SWEP.ScopeCone = 0.017
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(3.19, 0, 0.519)
SWEP.AimAng = Vector(1.036, 0.105, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(3.118, -2.082, 0.219)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(3.184, -3.438, 0.05)
SWEP.ReflexAng = Vector(1.036, 0.104, 0)

SWEP.FlipOriginsPos = Vector(1.48, 0, -0.48)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(3.141, 0, -0.115)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-6.394, -5.738, -3.116)
SWEP.RunAng = Vector(0, -70, 0)

util.PrecacheSound("weapons/sig552/boltback.wav")
util.PrecacheSound("weapons/sig552/boltpull.wav")
util.PrecacheSound("weapons/sig552/clipin.wav")
util.PrecacheSound("weapons/sig552/clipout.wav")
util.PrecacheSound("weapons/sig552/safety.wav")
util.PrecacheSound("weapons/sig552/sg552-1.wav")