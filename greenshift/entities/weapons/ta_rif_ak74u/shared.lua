

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.NoDocter = true
	SWEP.NoACOG = true
	SWEP.RailType = 2
	SWEP.CanAimWithRail = true
	SWEP.EoTechWithRail = false
	SWEP.DoesntDropRail = true
	
	SWEP.BulletLength = 5.45
	SWEP.CaseLength = 39
end

if ( CLIENT ) then

	SWEP.PrintName			= "AK-74U"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.DifType = true
	SWEP.PitchMod = 3
	SWEP.DrawAngleMod = -1
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.Muzzle = "cstm_muzzle_ar"
	SWEP.EoTechWithRail = true

	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_ak74u")
	
	killicon.Add( "cstm_rif_ak74u", "VGUI/kills/kill_ak74u", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Weapon_Controller", rel = "", pos = Vector(-8.525, -0.482, -0.002), angle = Angle(90, 0, 0), size = Vector(0.039, 0.039, 0.14), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["rail"] = { type = "Model", model = "models/wystan/attachments/rail.mdl", bone = "Weapon_Controller", rel = "", pos = Vector(2.206, -0.294, -0.25), angle = Angle(0, 0, 90), size = Vector(0.699, 1, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "Weapon_Controller", rel = "", pos = Vector(4.574, 2.101, -0.007), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "Weapon_Controller", rel = "", pos = Vector(13.156, -10.5, -0.294), angle = Angle(180, 4.443, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "Weapon_Controller", rel = "", pos = Vector(3.331, 2.096, -0.022), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Weapon_Controller", rel = "", pos = Vector(9.232, -4.657, 0.244), angle = Angle(-90, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(20.568, 1.506, -2.908), angle = Angle(-86.625, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["rail"] = { type = "Model", model = "models/wystan/attachments/rail.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "weapon", pos = Vector(2.319, 0.263, 4.712), angle = Angle(-2.681, 0, 0), size = Vector(0.8, 1.2, 0.8), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail", pos = Vector(-5.963, 0, -4.231), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail", pos = Vector(-9.5, -0.519, -10.087), angle = Angle(4.44, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_a74u.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.043, 1.475, 0.375), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_rif_a74u.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/sr3m/fire.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.085
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "GaussEnergy"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/g36c/g36c_sil.wav")
SWEP.SilencedVolume = 78

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.35 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.PlaybackRate = 2
SWEP.SkipIdle = true

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
SWEP.IronsightsCone			= 0.024
SWEP.HipCone 				= 0.038
SWEP.ScopeCone = 0.022
SWEP.InaccAff1 = 0.65
SWEP.ConeInaccuracyAff1 = 0.7
SWEP.MaxAmmo = 90

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(1.879, -3.369, 0.545)
SWEP.AimAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(1.858, 0, -0.24)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(1.878, 0, -0.247)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(0.72, 0, -0.721)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-9.181, -3.77, -3.28)
SWEP.RunAng = Vector(0, -70, 0)

util.PrecacheSound("weapons/sr3m/sr3m_clipout.wav")
util.PrecacheSound("weapons/sr3m/sr3m_clipin.wav")
util.PrecacheSound("weapons/sr3m/sr3m_boltpull.wav")
util.PrecacheSound("weapons/sr3m/sr3m-1.wav")
util.PrecacheSound("weapons/sr3m/draw.wav")