

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.DoesntDropRail = true
	SWEP.NoACOG = true
	SWEP.NoDocter = true
	SWEP.CantSilence = true
	
	SWEP.BulletLength = 5.56
	SWEP.CaseLength = 45
end

if ( CLIENT ) then

	SWEP.PrintName			= "M249 SAW"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.DifType = true
	SWEP.PitchMod = -1
	SWEP.RollMod = -1
	SWEP.Muzzle = "cstm_muzzle_ar"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_m249")
	
	killicon.Add( "cstm_rif_m249norm", "VGUI/kills/kill_m249", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "hatch", pos = Vector(0.043, 4.425, 1.726), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "hatch", pos = Vector(-0.245, 14.262, -10.895), angle = Angle(4.443, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "hatch", pos = Vector(-0.015, 5.824, 1.613), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "hatch", pos = Vector(0.237, 10.475, -5.145), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(-4.588, 1.274, 3.868), angle = Angle(-4.443, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(-0.769, 0.85, -1.994), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_mach_m249norm.mdl", pos = Vector(3.368, 0.669, -0.426), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.NoRail = true

end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_mach_m249norm.mdl"
SWEP.WorldModel = "models/weapons/w_mach_m249para.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/m249/fire.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 18
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 100
SWEP.Primary.Delay			= 0.066
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "AirboatGun"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/m4a1/m4a1-1.wav")
SWEP.SilencedVolume = 75

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.15 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.CantChamber = true
SWEP.ConeInaccuracyAff1 = 0.2
SWEP.MaxAmmo = 200

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
SWEP.IronsightsCone			= 0.025
SWEP.HipCone 				= 0.06
SWEP.ScopeCone = 0.02

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(-4.015, -1.8, 1.759)
SWEP.AimAng = Vector(0.206, -0.03, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(-3.974, -3.231, 1.191)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(-4.032, -3.116, 1.077)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.RunPosNoFlip = Vector(6.721, -7.213, -2.132)
SWEP.RunAngNoFlip = Vector(0, 70, 0)

util.PrecacheSound("weapons/schmung.m249/boltpull.wav")
util.PrecacheSound("weapons/schmung.m249/boltrel.wav")
util.PrecacheSound("weapons/schmung.m249/magin.wav")