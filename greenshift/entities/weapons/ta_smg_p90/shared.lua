

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoAimpoint = true
	SWEP.NoACOG = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	
	SWEP.BulletLength = 5.7
	SWEP.CaseLength = 28
end

if ( CLIENT ) then

	SWEP.PrintName			= "FN P90"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_p90cstm")
	SWEP.ReloadAngleMod = -0.75
	SWEP.NoRail = true
	SWEP.DifType = true
	SWEP.Muzzle = "cstm_muzzle_smg"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	
	killicon.Add( "cstm_smg_p90cstm", "VGUI/kills/kill_p90cstm", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Body", rel = "", pos = Vector(-2.613, -13.832, -4.75), angle = Angle(0, 0, -90), size = Vector(0.05, 0.05, 0.17), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "Body", rel = "", pos = Vector(-2.596, -9, -1.019), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "Body", rel = "", pos = Vector(-2.832, -1.257, -11.738), angle = Angle(4.443, 90, 0), size = Vector(0.85, 0.85, 0.85), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-4.356, 1.794, 5.461), angle = Angle(-4.444, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.68, 1.537, -2.787), angle = Angle(-90, 0, 0), size = Vector(0.05, 0.05, 0.17), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_cst_p90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-6.057, 1.069, 1.855), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_cst_p90.mdl"
SWEP.WorldModel = "models/weapons/w_smg_p90.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/p90cstm/p90-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 17
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 50
SWEP.Primary.Delay			= 0.0666
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "AlyxGun"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/g36c/g36c_sil.wav")
SWEP.MaxAmmo = 100

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.3 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.NoBoltAnim = true

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.5
SWEP.CurCone				= 0.038
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
SWEP.IronsightsCone			= 0.023
SWEP.HipCone 				= 0.045
SWEP.ScopeCone = 0.019
SWEP.InaccAff1 = 0.45
SWEP.ConeInaccuracyAff1 = 0.55

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(3.842, -4.427, 0.98)
SWEP.AimAng = Vector(1.513, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.RunPos = Vector(-4.427, -10.492, -0.82)
SWEP.RunAng = Vector(-9.037, -70, 0)

SWEP.ReflexPos = Vector(3.855, -5.944, 0.768)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(2.279, 0, -0.08)
SWEP.FlipOriginsAng = Vector(0, 0, 0)