

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoEOTech = true
	SWEP.NoDocter = true
	
	SWEP.BulletLength = 7.62
	SWEP.CaseLength = 51
end

if ( CLIENT ) then

	SWEP.PrintName			= "H&K G3A3"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.Muzzle = "cstm_muzzle_br"
	SWEP.SmokeEffect = "cstm_child_smoke_large"
	SWEP.SparkEffect = "cstm_child_sparks_large"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_g3")
	
	killicon.Add( "cstm_rif_g3a3", "VGUI/kills/kill_g3", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "G3", pos = Vector(0.03, -2.408, -0.357), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "G3", pos = Vector(0.381, 4.681, 1.728), angle = Angle(180, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "G3", pos = Vector(-0.02, -2.139, -1.57), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "G3", pos = Vector(0.231, 4.618, 3.075), angle = Angle(180, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", pos = Vector(0.018, 0.542, -0.12), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(-1.476, 0.725, -0.212), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_hkg3.mdl", pos = Vector(-0.581, 0.675, -0.519), angle = Angle(0, 90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_xtra_pistol"
///SWEP.Category			= "Condition SWEPs (TEST)"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rif_hkg3.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/g3/fire.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 35
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 20
SWEP.Primary.Delay			= 0.12
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
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
SWEP.IncAmmoPerc = 0.2 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.SkipIdle = true
SWEP.PlaybackRate = 2
SWEP.MaxAmmo = 60

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 1.5
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
SWEP.IronsightsCone			= 0.0125
SWEP.HipCone 				= 0.067
SWEP.ScopeCone = 0.0095
SWEP.InaccAff1 = 0.75
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(-3.358, -1.106, 2.019)
SWEP.AimAng = Vector(-0.795, 1.389, 1.118)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(-3.333, -1.464, 1.541)
SWEP.ScopeAng = Vector(-0.797, 1.389, 1.118)

SWEP.FlipOriginsPos = Vector(-2, 0, -0.52)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(-3.352, -0.329, 1.291)
SWEP.ACOGAng = Vector(-0.796, 1.389, 1.118)

SWEP.RunPosNoFlip = Vector(5.737, -8.362, 0)
SWEP.RunAngNoFlip = Vector(0, 70, 0)

util.PrecacheSound("weapons/g3/g3_boltcatch.wav")
util.PrecacheSound("weapons/g3/g3_boltpull.wav")
util.PrecacheSound("weapons/g3/g3_clipin.wav")
util.PrecacheSound("weapons/g3/g3_clipout.wav")
util.PrecacheSound("weapons/g3/g3_deploy.wav")
util.PrecacheSound("weapons/g3/g3_deploy1.wav")
util.PrecacheSound("weapons/g3/g3_safety.wav")
util.PrecacheSound("weapons/g3/g3_silencer_on.wav")
util.PrecacheSound("weapons/g3/g3_silencer_off.wav")
util.PrecacheSound("weapons/g3/g3_unsil-1.wav")
util.PrecacheSound("weapons/g3/g3-1.wav")