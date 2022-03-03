

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.NoAimpoint = true
	SWEP.NoACOG = true
	SWEP.NoDocter = true
	SWEP.DoesntDropRail = true
	SWEP.RailType = 2
	
	SWEP.BulletLength = 5
	SWEP.CaseLength = 10.5
end

if ( CLIENT ) then

	SWEP.PrintName			= "Franchi SPAS-12"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "k"
	SWEP.Muzzle = "cstm_muzzle_br"
	SWEP.SparkEffect = "cstm_child_sparks_verylarge"
	SWEP.SmokeEffect = "cstm_child_smoke_verylarge"
	SWEP.DifType = true
	SWEP.EoTechWithRail = true
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_spas12")
	
	killicon.Add( "cstm_shotgun_spas12", "VGUI/kills/kill_spas12", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["rail"] = { type = "Model", model = "models/wystan/attachments/rail.mdl", bone = "Spas12_Body", rel = "", pos = Vector(-7.132, -0.007, -0.225), angle = Angle(0, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "Spas12_Body", rel = "", pos = Vector(-5.857, 2.986, 0), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "Spas12_Body", rel = "", pos = Vector(-16.532, -9.638, 0.275), angle = Angle(0, -4.444, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["rail"] = { type = "Model", model = "models/wystan/attachments/rail.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "weapon", pos = Vector(5.099, 0.119, 3.588), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail", pos = Vector(-9.714, -0.45, -9.669), angle = Angle(4.443, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_shot_francspas.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.719, 0.662, 0.375), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "shotgun"
SWEP.Base				= "ta_base_shotgun"
SWEP.Category			= "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType = "shotgun"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_shot_francspas.mdl"
SWEP.WorldModel = "models/weapons/w_shot_francspas.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/spas/spas-1.wav")
SWEP.Primary.Recoil			= 5
SWEP.Primary.Damage			= 7
SWEP.Primary.NumShots		= 12
SWEP.Primary.Cone			= 0.12
SWEP.Primary.ClipSize		= 8
SWEP.Primary.Delay			= 1
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "buckshot"
SWEP.InitialHoldtype = "shotgun"
SWEP.InHoldtype = "shotgun"

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.4 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.CantSilence = true

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 6
SWEP.CurCone				= 0.12
SWEP.DecreaseRecoilTime 	= 0
SWEP.ConeAff1 				= 0 -- Crouching/standing
SWEP.ConeAff2 				= 0 -- Using ironsights
SWEP.ViewPunchCycle 		= 0
SWEP.ViewPunchDelay			= 0
SWEP.WalkPunchCycle			= 0
SWEP.WalkPunchDelay 		= 0
SWEP.UnConeTime				= 0 -- Amount of time after firing the last shot that needs to pass until accuracy increases
SWEP.FinalCone				= 0 -- Self explanatory
SWEP.VelocitySensivity		= 0.2 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.PumpSound				= true
SWEP.IronsightsCone = 0.05
SWEP.HipCone = 0.06
SWEP.ScopeCone = 0.045
SWEP.MaxAmmo = 24

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(2.907, 2.224, 2.039)
SWEP.AimAng = Vector(0.1, 0, 0)

SWEP.ReflexPos = Vector(2.898, 0, 0.941)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.36, 2.131, 0.28)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-12.459, -1.476, -4.755)
SWEP.RunAng = Vector(0, -70, 0)