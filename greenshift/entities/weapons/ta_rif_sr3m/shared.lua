

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoEOTech = true
	SWEP.NoDocter = true
	SWEP.NoACOG = true
	
	SWEP.BulletLength = 5.45
	SWEP.CaseLength = 39
end

if ( CLIENT ) then

	SWEP.PrintName			= "SR-3M Vikhr"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.DifType = true
	SWEP.PitchMod = -1
	SWEP.Muzzle = "cstm_muzzle_ar"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_sr3m")
	
	killicon.Add( "cstm_rif_sr3m", "VGUI/kills/kill_sr3m", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "Gun", pos = Vector(-2.293, 0.319, 6.485), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Gun", pos = Vector(-2.543, 7.072, 1.837), angle = Angle(180, 180, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Gun", pos = Vector(-2.326, 2.519, 17.656), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
	}
	
	SWEP.WElements = {
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(0.712, 1.062, 1.024), angle = Angle(180, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", pos = Vector(20.767, 1.274, -3.225), angle = Angle(-90, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_sr-3m.mdl", pos = Vector(-0.419, 0.981, -0.014), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rif_sr-3m.mdl"
SWEP.WorldModel = "models/weapons/w_rif_galil.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/sr3m/fire.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 29
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.066
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
SWEP.IncAmmoPerc = 0.4 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.PlaybackRate = 2
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
SWEP.VelocitySensivity		= 1.4 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.024
SWEP.HipCone 				= 0.04
SWEP.ScopeCone = 0.02
SWEP.InaccAff1 = 0.65
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(-2.256, -1.795, 0.621)
SWEP.AimAng = Vector(1.156, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(-2.221, -0.493, 0.305)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.NoFlipOriginsPos = Vector(-1.4, 0, -0.801)
SWEP.NoFlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPosNoFlip = Vector(6.393, -3.116, -3.444)
SWEP.RunAngNoFlip = Vector(0, 70, 0)

util.PrecacheSound("weapons/sr3m/sr3m_clipout.wav")
util.PrecacheSound("weapons/sr3m/sr3m_clipin.wav")
util.PrecacheSound("weapons/sr3m/sr3m_boltpull.wav")
util.PrecacheSound("weapons/sr3m/sr3m-1.wav")
util.PrecacheSound("weapons/sr3m/draw.wav")