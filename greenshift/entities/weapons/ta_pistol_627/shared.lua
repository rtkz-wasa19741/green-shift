

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoAimpoint = true
	SWEP.NoEOTech = true
	SWEP.NoDocter = true
	SWEP.HasMasher = true
	
	SWEP.BulletLength = 9.1
	SWEP.CaseLength = 33
end

if ( CLIENT ) then

	SWEP.PrintName			= "Smith and Wesson Model 627"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "f"
	SWEP.DifType = true
	SWEP.PitchMod = -1
	SWEP.DrawAngleMod = 0.5
	SWEP.Muzzle = "cstm_muzzle_pistol"
	SWEP.SparkEffect = "cstm_child_sparks_large"
	SWEP.SmokeEffect = "cstm_child_smoke_large"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_627")
	
	killicon.Add( "cstm_pistol_627", "VGUI/kills/kill_627", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["acogdot"] = { type = "Sprite", sprite = "sprites/acog_tri", bone = "Body", pos = Vector(0.004, 1.118, 2.331), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Body", pos = Vector(0, -5.744, 0.83), angle = Angle(0, 0, -90), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "Body", pos = Vector(0.25, 2.654, -2.639), angle = Angle(0, 180, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["acog"] = { type = "Model", model = "models/wystan/attachments/acog.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(1.649, 1.363, -1.264), angle = Angle(0, -90, 180), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(11.994, 1.636, -4.581), angle = Angle(-90, 0, 0), size = Vector(0.059, 0.059, 0.159), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_pist_swp627.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(-1.089, 1.031, -0.144), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.MeleeOffset = {
		['R_Forearm'] = {vector = Vector(7.1630001068115, -6.9190001487732, -0.59899997711182), angle = Vector(-18.731000900269, 0, -126)},
		['R_Wrist'] = {vector = Vector(0, 0, 0), angle = Vector(10.781000137329, 9.4440002441406, 0)},
		['R_Index1'] = {vector = Vector(0, 0, -0.31900000572205), angle = Vector(-17.54400062561, 0, 0)},
		['R_Index2'] = {vector = Vector(0, 0, 0), angle = Vector(-19.20599937439, 0, 0)},
		['R_Index3'] = {vector = Vector(0, 0, 0), angle = Vector(-70.736999511719, 0, 0)},
		['R_Mid1'] = {vector = Vector(0, 0, -0.69400000572205), angle = Vector(-43.96900177002, 0, 0)},
		['R_Mid3'] = {vector = Vector(0, 0, 0), angle = Vector(-46.937999725342, 0, 0)},
		['R_Ring1'] = {vector = Vector(0, 0, -0.49399998784065), angle = Vector(-40.349998474121, 0, 0)},
		['R_Ring2'] = {vector = Vector(0, 0, 0), angle = Vector(-23.256000518799, 0, 0)},
		['R_Ring3'] = {vector = Vector(0, 0, 0), angle = Vector(-46.937999725342, 0, 0)},
		['R_Pinky1'] = {vector = Vector(0, 0, 0), angle = Vector(-31.75, 0, 0)},
		['R_Pinky2'] = {vector = Vector(0, 0, 0), angle = Vector(-39.900001525879, 0, 0)},
		['R_Pinky3'] = {vector = Vector(0, 0, 0), angle = Vector(-27.33099937439, 0, 0)},
		['R_Thumb1'] = {vector = Vector(0, 0, 0), angle = Vector(-2.7309999465942, 17.54400062561, 0)},
		['R_Thumb2'] = {vector = Vector(0, 0, 0), angle = Vector(0, 10.630999565125, 0)},
		['R_Thumb3'] = {vector = Vector(0, 0, 0), angle = Vector(0, 19.006000518799, 0)} }
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_pist_swp627.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/627/627-1.wav")
SWEP.Primary.Recoil			= 2.5
SWEP.Primary.Damage			= 35
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 6
SWEP.Primary.Delay			= 0.27
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"
SWEP.InitialHoldtype = "pistol"
SWEP.InHoldtype = "pistol"
SWEP.NoAuto = true
SWEP.NoBoltAnim = true
SWEP.SilencedSound = Sound("weapons/g3/g3-1.wav")
SWEP.SilencedVolume = 80

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.28 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.CantChamber = true
SWEP.SkipIdle = true
SWEP.PlaybackRate = 2
SWEP.MaxAmmo = 18

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 2.5
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
SWEP.VelocitySensivity		= 1.15 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone 		= 0.029
SWEP.HipCone 				= 0.045
SWEP.ScopeCone 				= 0.021
SWEP.ConeInaccuracyAff1 = 0.5

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(2.703, 0.164, 1.564)
SWEP.AimAng = Vector(-0.445, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ReflexPos = Vector(5.122, -3.089, 2.352)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.12, 2.786, 0.119)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(2.71, -2.132, 0.75)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.RunPosPistol = Vector(-2.039, -7.573, -7.67)
SWEP.RunAngPistol = Vector(70, 0, 0)

SWEP.MeleePos = Vector(-2.56, 0, -0.48)
SWEP.MeleeAng = Vector(0, 0, 0)