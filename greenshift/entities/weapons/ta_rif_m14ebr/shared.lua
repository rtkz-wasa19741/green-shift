

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	SWEP.NoVertGrip = false
	
	SWEP.BulletLength = 7.62
	SWEP.CaseLength = 51
end

if ( CLIENT ) then

	SWEP.PrintName			= "M14 EBR"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "z"
	SWEP.DifType = true
	SWEP.Muzzle = "cstm_muzzle_br"
	SWEP.SmokeEffect = "cstm_child_smoke_large"
	SWEP.SparkEffect = "cstm_child_sparks_large"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_m14")
	
	killicon.Add( "cstm_rif_m14ebr", "VGUI/kills/kill_m14", Color( 255, 80, 0, 255 ) )
	
	SWEP.VertGrip_Idle = {
		['Bone25'] = {vector = Vector(0, 0.83700001239777, -2.3629999160767), angle = Vector(0, 0, -96.262001037598)},
		['Bone31'] = {vector = Vector(0, 0, 0), angle = Vector(-11.762999534607, 0, 12.069000244141)},
		['Bone32'] = {vector = Vector(0, 0, 0), angle = Vector(-51.006000518799, 0, 0)},
		['Bone33'] = {vector = Vector(0, 0, 0), angle = Vector(-21.156000137329, 0, 0)},
		['Bone35'] = {vector = Vector(0, 0, 0), angle = Vector(-14.85000038147, 0, 14.362000465393)},
		['Bone36'] = {vector = Vector(0, 0, 0), angle = Vector(-31.781999588013, 0, 0)},
		['Bone37'] = {vector = Vector(0, 0, 0), angle = Vector(-5.4749999046326, 0, 0)},
		['Bone39'] = {vector = Vector(0, 0, 0), angle = Vector(-9.4940004348755, 0, 0)},
		['Bone40'] = {vector = Vector(0, 0, 0), angle = Vector(-27.79400062561, -22.89999961853, 0)},
		['Bone43'] = {vector = Vector(0, 0, 0), angle = Vector(7.1810002326965, -4.0560002326965, 16.54400062561)},
		['Bone45'] = {vector = Vector(0, 0, 0), angle = Vector(-51.756000518799, 0, 0)},
		['Bone27'] = {vector = Vector(0, 0, 0), angle = Vector(-15.781000137329, 10.019000053406, 0)},
		['Bone28'] = {vector = Vector(0, 0, 0), angle = Vector(0, 47.831001281738, 0)},
		['Bone29'] = {vector = Vector(0, 0, 0), angle = Vector(0, 88.125, 0)} }

	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "killer dildo", pos = Vector(0.05, -17.407, 1.83), angle = Angle(0, 0, -90), size = Vector(0.07, 0.07, 0.17), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "killer dildo", pos = Vector(-0.201, 9.942, -8.912), angle = Angle(4.44, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "killer dildo", pos = Vector(0.056, -0.831, 3.882), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "killer dildo", pos = Vector(0.412, 1.437, -3.227), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "killer dildo", pos = Vector(0.063, 1.618, 3.644), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "killer dildo", pos = Vector(0.071, -0.113, 3.703), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "killer dildo", pos = Vector(0.314, 6.25, -3.113), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "killer dildo", rel = "", pos = Vector(-0.313, -16.601, -1.981), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", pos = Vector(26.292, 0.949, -4.257), angle = Angle(-90, 0, 0), size = Vector(0.07, 0.07, 0.17), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(0.344, 1.243, 6.413), angle = Angle(-4.444, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", pos = Vector(4.574, 0.592, 0.681), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", pos = Vector(4.144, 0.75, 0.574), angle = Angle(0, -90, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vertgrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(26.086, 1.355, -0.713), angle = Angle(0, 90, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_m14.mdl", pos = Vector(-6.862, 0.6, 0.143), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
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
SWEP.ViewModel = "models/weapons/v_rif_m14.mdl"
SWEP.WorldModel = "models/weapons/w_rif_aug.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/m14/m14-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 42
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 10
SWEP.Primary.Delay			= 0.2
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "SniperPenetratedRound"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/g3/g3-1.wav")
SWEP.SilencedVolume = 82

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.415 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.NoAuto = true
SWEP.PlaybackRate = 1.5
SWEP.MaxAmmo = 60

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 2.1
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
SWEP.IronsightsCone			= 0.017
SWEP.HipCone 				= 0.06
SWEP.ScopeCone 				= 0.012
SWEP.ConeInaccuracyAff1 = 0.7

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(2.496, -1.713, 1.569)
SWEP.AimAng = Vector(-0.993, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ScopePos = Vector(2.494, -2.623, 0.582)
SWEP.ScopeAng = Vector(0, 0, 0)

SWEP.ReflexPos = Vector(2.5, -2.623, 0.523)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1, 0, -0.24)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(2.486, -2, 0.347)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-9.672, -8.362, -2.296)
SWEP.RunAng = Vector(0, -70, 0)

util.PrecacheSound("weapons/m14/m14_clipout.wav")
util.PrecacheSound("weapons/m14/m14_clipin.wav")
util.PrecacheSound("weapons/m14/m14_boltpull.wav")
util.PrecacheSound("weapons/m14/m14-1.wav")