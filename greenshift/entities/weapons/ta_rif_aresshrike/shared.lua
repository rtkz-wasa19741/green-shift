

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.DoesntDropRail = true
	SWEP.NoACOG = true
	SWEP.NoDocter = true
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.PrintName			= "ARES Shrike 5.56"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.NoRail = true
	SWEP.DifType = true
	SWEP.Muzzle = "cstm_muzzle_ar"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_ares")
	
	killicon.Add( "cstm_rif_aresshrike", "VGUI/kills/kill_ares", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Cylinder16", pos = Vector(-0.101, -1.127, 12.406), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "Object03", pos = Vector(0.244, 10.637, -13.125), angle = Angle(87.081, 90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "Object03", pos = Vector(0.017, -1.625, 0), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "Object03", pos = Vector(-0.026, -1.731, -2.2), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Object03", pos = Vector(-0.232, 5.131, -8.131), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(0.218, 0.718, -1.951), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(-4.463, 1.106, 3.18), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", pos = Vector(25.886, 0.887, -5.18), angle = Angle(-90, 0, 0), size = Vector(0.07, 0.07, 0.17), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_mach_aresshrk.mdl", pos = Vector(2.825, 0.606, -0.745), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_mach_aresshrk.mdl"
SWEP.WorldModel = "models/weapons/w_mach_m249para.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/ares/ares-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 20
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 200
SWEP.Primary.Delay			= 0.096
SWEP.Primary.DefaultClip	= 200
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "AirboatGun"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/m4a1/m4a1-1.wav")
SWEP.SilencedVolume = 75

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.3 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.CantChamber = true
SWEP.ConeInaccuracyAff1 = 0.2
SWEP.MaxAmmo = 200

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.65
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
SWEP.VelocitySensivity		= 1.35 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.026
SWEP.HipCone 				= 0.05
SWEP.ScopeCone = 0.02
SWEP.SkipIdle = true

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(-3.8, -1.77, 0.428)
SWEP.AimAng = Vector(0.418, -0.044, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(-3.755, -2.131, -0.13)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(-3.8, -1.968, -0.24)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.RunPosNoFlip = Vector(4.262, -7.049, -2.787)
SWEP.RunAngNoFlip = Vector(0, 70, 0)

util.PrecacheSound("weapons/ares/ares-1.wav")
util.PrecacheSound("weapons/ares/boxin.wav")
util.PrecacheSound("weapons/ares/boxout.wav")
util.PrecacheSound("weapons/ares/bullet.wav")
util.PrecacheSound("weapons/ares/button.wav")
util.PrecacheSound("weapons/ares/coverdown.wav")
util.PrecacheSound("weapons/ares/coverup.wav")
util.PrecacheSound("weapons/ares/ready.wav")