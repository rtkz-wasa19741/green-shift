

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoEOTech = true
	SWEP.NoDocter = true
	SWEP.NoAimpoint = true
	
	SWEP.BulletLength = 7.62
	SWEP.CaseLength = 51
end

if ( CLIENT ) then

	SWEP.PrintName			= "FN FAL"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.DifType = true
	SWEP.Muzzle = "cstm_muzzle_br"
	SWEP.SparkEffect = "cstm_child_sparks_large"
	SWEP.SmokeEffect = "cstm_child_smoke_large"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_fal")
	
	killicon.Add( "cstm_rif_fnfal", "VGUI/kills/kill_fal", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "FAL_Animations_By_Spork", pos = Vector(0.018, 20.006, 0.101), angle = Angle(0, 0, 90), size = Vector(0.05, 0.05, 0.174), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "FAL_Animations_By_Spork", rel = "", pos = Vector(-0.01, -1.25, 2.329), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "FAL_Animations_By_Spork", rel = "", pos = Vector(-0.364, -3.488, -4.757), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", pos = Vector(31.5, 1.093, -3.276), angle = Angle(-90, 0, 0), size = Vector(0.05, 0.05, 0.174), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.169, 0.731, 0.361), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_fnfal.mdl", pos = Vector(-0.35, 0.794, -0.463), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rif_fnfal.mdl"
SWEP.WorldModel = "models/weapons/w_rif_galil.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/fnfal/fnfal-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 36
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 20
SWEP.Primary.Delay			= 0.092
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "SniperPenetratedRound"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/g3/g3-1.wav")
SWEP.SilencedVolume = 78

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.41 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.NoAuto = true
SWEP.MaxAmmo = 60

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 1.65
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
SWEP.IronsightsCone			= 0.01
SWEP.HipCone 				= 0.065
SWEP.ScopeCone = 0.007
SWEP.InaccAff1 = 0.75
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(-2.55, -3.626, 1.424)
SWEP.AimAng = Vector(0.256, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(-3.333, -1.464, 1.541)
SWEP.ScopeAng = Vector(-0.797, 1.389, 1.118)

SWEP.NoFlipOriginsPos = Vector(-1.441, 0, -0.44)
SWEP.NoFlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-5.082, -6.886, -1.311)
SWEP.RunAng = Vector(0, -70, 0)

SWEP.ACOGPos = Vector(-2.56, -0.329, 0.778)
SWEP.ACOGAng = Vector(0, 0, 0)

util.PrecacheSound("weapons/fnfal/fnfal_clipout.wav")
util.PrecacheSound("weapons/fnfal/fnfal_clipin.wav")
util.PrecacheSound("weapons/fnfal/fnfal_boltpull.wav")
util.PrecacheSound("weapons/fnfal/fnfal_cliptap.wav")
util.PrecacheSound("weapons/fnfal/fnfal-1.wav")