
if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
	SWEP.ScopeStatus = 0
	SWEP.LastMag = 0
	SWEP.NoGL = true
	SWEP.SecondaryAtt = 0
	SWEP.GrenadeType = "ta_gren_explosive"
	SWEP.BlastRadius = 256
	SWEP.BlastDamage = 80
	SWEP.Grenade = false
	SWEP.DrawSpeed = 1
	SWEP.NoCMag = true
	SWEP.MeleeDelay = 0
	SWEP.NoVertGrip = true
	SWEP.IsCustomWeapon = true
	SWEP.MeleeDamageMin = 15
	SWEP.MeleeDamageMax = 20
	SWEP.ReloadSpeed = 1

end

if ( CLIENT ) then

	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 70
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true
	SWEP.DrawWeaponInfoBox  = true
	SWEP.HasInstalledScope  = false
	SWEP.TimeToStartOffset = 0
	SWEP.PitchMod = 1
	SWEP.RollMod = 1
	SWEP.TargetOffset = {}
	SWEP.OffsetBones = {}
	SWEP.IsCustomWeapon = true
	SWEP.LastActivity = "asd"
	// This is the font that's used to draw the death icons
	
	language.Add("striderminigun_ammo", "7.62x39MM Ammo")
	language.Add("combinecannon_ammo", ".50AE Ammo")
	language.Add("airboatgun_ammo", "5.56x45MM NATO Ammo")
	language.Add("sniperround_ammo", ".338 Lapua Magnum Ammo")
	language.Add("sniperpenetratedround_ammo", "7.62x51MM NATO Ammo")
	language.Add("alyxgun_ammo", "5.7x28MM Ammo")
	language.Add("helicoptergun_ammo", ".45 ACP Ammo")

end

SWEP.Author			= "LEETNOOB"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= "PRIMARY ATTACK key to fire\nSECONDARY ATTACK key to toggle ironsights\nUSE key + SECONDARY ATTACK key - attach suppressor\nUSE key + RELOAD key - switch between semi-auto/auto firemodes (SMGs/ARs)"

// Note: This is how it should have worked. The base weapon would set the category
// then all of the children would have inherited that.
// But a lot of SWEPS have based themselves on this base (probably not on purpose)
// So the category name is now defined in all of the child SWEPS.
//SWEP.Category			= "Counter-Strike"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound			= Sound( "Weapon_AK47.Single" )
SWEP.Primary.Recoil			= 1.5
SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.Delay			= 0.15

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Base = "ta_cmodel_base"
SWEP.Category = "Customizable weaponry"

SWEP.RunPos = Vector(-3.587, -11.735, -0.438)
SWEP.RunAng = Vector(0, -70, 0)

SWEP.RunPosPistol = Vector(0.328, -10.82, -4.621)
SWEP.RunAngPistol = Vector(70, 0, 0)

SWEP.RunPosNoFlip = Vector(3.443, -10.164, 0)
SWEP.RunAngNoFlip = Vector(0, 70, 0)

SWEP.FlipOriginsPos = Vector(3.305, -1.968, 0.735)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.NoFlipOriginsPos = Vector(-2.25, 0, -0.695)
SWEP.NoFlipOriginsAng = Vector(0, 0, 0)

SWEP.MeleePos = Vector(-2.945, -16.951, -6.206)
SWEP.MeleeAng = Vector(0, -90, 29.261)

SWEP.MeleePosNoFlip = Vector(3.769, -9.672, -7.049)
SWEP.MeleeAngNoFlip = Vector(28.688, 70, 0)

SWEP.ConeAff3 = 0
SWEP.ConeInaccuracy = 0
SWEP.ConeInaccuracyDec = 0
SWEP.SilencedSound = Sound("weapons/usp/usp1.wav")
SWEP.SilencedVolume = 70
SWEP.UnsilencedVolume = 101
SWEP.ConeInaccuracyAff1 = 1
SWEP.RecoilAff1 = 0
SWEP.RecoilAff2 = 0
SWEP.RecoilAff3 = 0
SWEP.RecoilAff4 = 0
SWEP.InaccAff1 = 1
SWEP.ConeInaccDelay = 0
SWEP.ConeDecAff1 = 0
SWEP.ConeDecAff2 = 0
SWEP.ShouldBolt = false

/*---------------------------------------------------------
---------------------------------------------------------*/
function SWEP:Initialize()

	if ( SERVER ) then
		self:SetNPCMinBurst( 30 )
		self:SetNPCMaxBurst( 30 )
		self:SetNPCFireRate( 0.01 )
		
		if self.BulletLength and self.CaseLength then
			self.EffectiveRange = self.CaseLength * 10 - self.BulletLength * 5 -- setup realistic base effective range
			self.EffectiveRange = self.EffectiveRange / 3 -- use only 33% of it's effective range, because the maps aren't big enough and we want to balance shit out
			self.EffectiveRange = self.EffectiveRange * 39.37 -- convert meters to units
			self.DamageDecay = self.BulletLength / self.CaseLength -- setup the damage decay over distance in percentage
		end
	end
	
	self:SetWeaponHoldType(self.HoldType)
	self.Weapon:SetDTInt(3, 0)
	self.Weapon:SetDTFloat(0, 0)
	self.Weapon:SetDTInt(2, 0)
	self.Weapon.ReloadDelay = CurTime() + 0.1
	
	self.Primary.Recoil = self.Weapon.DefRecoil
	
	self.Weapon.PrimarySound = CreateSound(self.Weapon, self.Primary.Sound)
	self.Weapon.PrimarySound:Stop()
	self.Weapon.PrimarySound:SetSoundLevel(self.Weapon.Volume or 110)
	
	self.Weapon.SecondarySound = CreateSound(self.Weapon, self.Weapon.SilencedSound)
	self.Weapon.SecondarySound:Stop()
	self.Weapon.SecondarySound:SetSoundLevel(60)
	
    if CLIENT then
		self.Weapon.FireMode = self.Primary.Automatic
		
		if self.Primary.Automatic and not self.Weapon.Burst then
			self.Weapon.Bullets = 5
		elseif self.Primary.Automatic and self.Weapon.Burst then
			self.Weapon.Bullets = 3
		else
			self.Weapon.Bullets = 1
		end
     
        self:CreateModels(self.VElements) // create viewmodels
        self:CreateModels(self.WElements) // create worldmodels
         
    end
end



function SWEP:Deploy()
	if SERVER then
		local time = CurTime()
		
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.DrawSpeed or 1)

		self.Weapon:SetNextSecondaryFire(time + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.DrawSpeed)
		self.Weapon:SetNextPrimaryFire(time + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.DrawSpeed)
		self.Weapon.ReloadDelay = time + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.DrawSpeed
		self.Weapon.MeleeDelay = time + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.DrawSpeed
	end
	
	return true
end

local initial = false

function SWEP:Holster(weapon)
	self.Weapon:SetDTInt(3, 0)
	timer.Destroy("StartCustomReloadTimer" .. self.Owner:Nick())
	timer.Destroy("StartCustomReloadTimer2" .. self.Owner:Nick())
	timer.Destroy("AmmoInc" .. self.Owner:Nick())
	timer.Destroy("ReloadLogic" .. self.Owner:Nick())
	timer.Destroy("ReloadTimer" .. self.Owner:Nick())
	
	if SERVER then
		self.Owner:SetFOV(0, 0.3)
	
		if game.SinglePlayer() then
			self.Owner:SendLua("timer.Destroy('CLATT' .. LocalPlayer():Nick())")
			return true
		end
	end
	
	if CLIENT then
		timer.Destroy("CLATT" .. self.Owner:Nick())
		self.Weapon.OffsetMeStage = 1
		self.Weapon.TimerCreated = false
		self.Weapon.LastActivity = "asd"
	end
	
	return true
end

/*---------------------------------------------------------
	Reload does nothing
---------------------------------------------------------*/
function SWEP:Reload()
	if self.Weapon.HasReleasedKey == false or CurTime() < self.Weapon.ReloadDelay then
		return
	end

	if SERVER then
		if self.Owner:KeyDown(IN_USE) then
			if self.Weapon.NoAuto != true then
				if self.Primary.Automatic == true then
					self.Primary.Automatic = false
					self.Owner:EmitSound("weapons/smg1/switch_single.wav", 70, math.random(99, 101))
					umsg.Start("FRMD", self.Owner)
						umsg.String("semi")
					umsg.End()
				else
					self.Primary.Automatic = true
					self.Owner:EmitSound("weapons/smg1/switch_burst.wav", 70, math.random(99, 101))
					umsg.Start("FRMD", self.Owner)
						umsg.String("auto")
					umsg.End()
				end
				self.Weapon.HasReleasedKey = false
				self.Weapon.ReloadDelay = CurTime() + 0.5
				return
			end
		end
	end
		
	if self.Weapon:GetDTInt(3) != 2 then
		if self.Weapon:Clip1() < self.Primary.ClipSize + 1 and self.Weapon:Clip1() < self.Primary.ClipSize then
			if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
				if CurTime() > self.Weapon.ReloadDelay then
					self.Weapon:StartCustomReload(self.Weapon.AnimPrefix .. (self.Weapon.ReloadAct or "reload"), self.Weapon.ReloadSpeed)
					self.Owner:SetAnimation(PLAYER_RELOAD)
					if SERVER then
					
						for k, v in pairs(ents.FindInSphere(self.Owner:GetShootPos(), 192)) do
							if v:IsPlayer() and v:Team() == self.Owner:Team() and v != self.Owner and v:Alive() then
								if self.Owner:Team() == TEAM_REBELS then
									if CurTime() > self.Owner.ReloadSayDelay then
										self.Owner:EmitSound("vo/npc/male01/coverwhilereload0" .. math.random(1, 2) .. ".wav", 70, math.random(99, 101))
										self.Owner.ReloadSayDelay = CurTime() + 2
									end
								end
								
								break
							end
						end
						
						if self.Owner:GetFOV() != 0 then
							self.Owner:SetFOV(0, 0.3)
							self.Owner:DrawViewModel(true)
							self.Weapon.LastMag = self.Weapon:Clip1()
							if self.Weapon:Clip1() > 1 then
								if not self.Weapon.CantChamber then
									self.Owner:SetAmmo(self.Owner:GetAmmoCount(self.Weapon:GetPrimaryAmmoType()) + self.Weapon:Clip1() - 1, self.Weapon:GetPrimaryAmmoType())
									self.Weapon:SetClip1(1)
								else
									self.Owner:SetAmmo(self.Owner:GetAmmoCount(self.Weapon:GetPrimaryAmmoType()) + self.Weapon:Clip1(), self.Weapon:GetPrimaryAmmoType())
									self.Weapon:SetClip1(0)
								end
							end
						end
					end
					self.Weapon:SetDTInt(3, 0)
				end
			end
		end
	end
end

function SWEP:StartCustomReload(anim, animspeed)
	self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
	//self.Owner:GetViewModel():ResetSequence(sequence)
	self.Owner:GetViewModel():SetPlaybackRate(animspeed)
	if self.Weapon:Clip1() == 0 then
		self.Weapon.ShouldBolt = true
	end
			
	local time = (self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) - ((self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) * self.Weapon.IncAmmoPerc)
	timer.Create("StartCustomReloadTimer" .. self.Owner:Nick(), time, 1, function()
		if not IsValid(self.Weapon) or not IsValid(self.Owner) or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
			return
		end
			
		self.Weapon:FinishCustomReload(self.Weapon.ShouldBolt)
		//timer.Destroy("StartCustomReloadTimer" .. self.Owner:Nick())
		//timer.Destroy("StartCustomReloadTimer2" .. self.Owner:Nick())
	end)
			
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed)
	self.Weapon.ReloadDelay = CurTime() + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed + 0.3
	self.Owner.AttachDelay = CurTime() + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed
	self.Weapon.MeleeDelay = CurTime() + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed
	
	if SERVER then
		self.Owner.ActionDelay = CurTime() + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed
	end
	
	self.Owner.WallRunDelay = CurTime() + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed
end
	
function SWEP:FinishCustomReload(bolt)
	local AvailableReload = math.Clamp(self.Weapon:Clip1() + self.Owner:GetAmmoCount(self.Primary.Ammo), 0, self.Primary.ClipSize)
	local AmountToReload = self.Primary.ClipSize - self.Weapon:Clip1()
	
	if self.Weapon:Clip1() == 0 then
		self.Owner:RemoveAmmo(AmountToReload, self.Primary.Ammo)
		self.Weapon:SetClip1(AvailableReload)
	else
		
		if AvailableReload > AmountToReload and self.Weapon.CantChamber != true then
			self.Owner:RemoveAmmo(AmountToReload + 1, self.Primary.Ammo)
			self.Weapon:SetClip1(AvailableReload + 1)
		else
			self.Owner:RemoveAmmo(AmountToReload, self.Primary.Ammo)
			self.Weapon:SetClip1(AvailableReload)
		end
		
		if self.Weapon.SkipIdle != true then
			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
			self.Weapon:SetNextPrimaryFire(CurTime() + 0.25)
			self.Weapon:SetNextSecondaryFire(CurTime() + 0.25)
			self.Weapon.ReloadDelay = CurTime() + 0.25
			self.Owner.AttachDelay = CurTime() + 0.25
			if SERVER then
				self.Owner.ActionDelay = CurTime() + 0.25
			end
			self.Owner.WallRunDelay = CurTime() + 0.25
		end
	end
	
	if bolt == false or self.Weapon.NoBoltAnim == true then
		self.Weapon.ShouldBolt = false
	else
		self.Weapon:BoltWeaponry()
		self.Weapon.ShouldBolt = false
	end
end

function SWEP:BoltWeaponry()
	local sequence = self.Owner:GetViewModel():LookupSequence(self.Weapon.AnimPrefix .. "draw")
	self.Owner:GetViewModel():ResetSequence(sequence)
	self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.ReloadSpeed)
	
	timer.Simple((self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) - 0.2, function()
		if not IsValid(self.Weapon) or not IsValid(self.Owner) or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
			return
		end
		
		self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	end)
end

function SWEP:Think()	
	if SERVER then
	
		self.Primary.Cone = math.Clamp(self.CurCone + self.Weapon.ConeInaccuracy + ((self.Owner:GetVelocity():Length() / 10000) * (self.Weapon:GetDTInt(3) == 1 and self.Weapon.VelocitySensivity * 0.3 or self.Weapon.VelocitySensivity)) - (self.Weapon.ConeAff1 + self.Weapon.ConeAff3), 0.002, 0.15)
		self.Weapon:SetDTFloat(0, math.Clamp(self.Primary.Cone, 0.002, 0.12 * (1 - (self.Weapon.RecoilAff1 + self.Weapon.RecoilAff2))))
		
		if CurTime() > self.Weapon.ConeInaccDelay then
			self.Weapon.ConeInaccuracy = math.Clamp(self.Weapon.ConeInaccuracy - 0.0015, 0, 0.08 * self.Weapon.ConeInaccuracyAff1)
		end
	
		if self.Owner:Crouching() and self.Owner:OnGround() then
			self.Weapon.ConeAff1 = 0.005
			self.Weapon.ConeDecAff1 = 0.0025
			self.Weapon.RecoilAff2 = 0.3
		else
			self.Weapon.ConeAff1 = 0
			self.Weapon.ConeDecAff1 = 0
			self.Weapon.RecoilAff2 = 0
		end
		
		if self.Weapon.IsSilenced then
			self.Weapon.RecoilAff3 = 0.15
		else
			self.Weapon.RecoilAff3 = 0
		end
		
		if self.Weapon:GetDTInt(3) == 1 then
			self.Weapon.ConeDecAff2 = 0.0045
			self.Weapon.RecoilAff1 = 0.3
			if self.Weapon.ScopeStatus >= 2 then
				self.Weapon.CurCone = self.Weapon.ScopeCone - ((self.Weapon.ScopeStatus == 2 and 0.007) or (self.Weapon.ScopeStatus == 3 and 0.003) or (self.Weapon.ScopeStatus == 4 and 0.002) or (self.Weapon.ScopeStatus == 9 and 0) or 0)
			else
				self.Weapon.CurCone = self.Weapon.IronsightsCone
			end	
			
			if self.Weapon.HeadbobMul == 1 then
				self.Weapon.HeadbobMul = 0.4
			end
			
			if (self.Weapon:GetClass():find("^cstm_rif_") or self.Weapon:GetClass():find("^cstm_sniper_")) and not self.Weapon.Primary.Automatic then
				self.Weapon.ConeAff3 = 0.003
			else
				self.Weapon.ConeAff3 = 0
			end
		else
			self.Weapon.ConeDecAff2 = 0
			self.Weapon.RecoilAff1 = 0
			self.Weapon.CurCone = self.Weapon.HipCone
			
			if self.Weapon.HeadbobMul == 0.4 then
				self.Weapon.HeadbobMul = 1
			end
			
			if self.Weapon:GetClass():find("^cstm_rif_") or self.Weapon:GetClass():find("^cstm_sniper_") then
				self.Weapon.ConeAff3 = 0
			end
		end
		
		if self.Weapon:GetDTInt(3) == 1 then
			if not self.Owner:KeyDown(IN_ATTACK2) then
				if tonumber(self.Owner:GetInfo("ta_hold_to_aim")) > 0 then
					self.Weapon:SetDTInt(3, 0)
					self.Owner:SetFOV(0, 0.3)
				end
			end
		end
		
	end
	
	local DTInt3 = self.Weapon:GetDTInt(3)
	
	if self.Owner:KeyDown(IN_SPEED) and self.Owner:OnGround() and DTInt3 != 6 and DTInt3 != 10 and DTInt3 != 15 then 
		if self.Owner:GetVelocity():Length() > self.Owner:GetWalkSpeed() then
			if DTInt3 != 2 and DTInt3 != 15 then
				self.Weapon:SetDTInt(3, 2)
				if SERVER then
					self.Owner:SetFOV(0, 0.3)
					self.Owner:DrawViewModel(true)
				end
			end
			
		else
			if DTInt3 != 1 or DTInt3 != 8 and DTInt3 != 10 and DTInt3 != 11 and DTInt3 != 12 and DTInt3 != 15 then
				self.Weapon:SetDTInt(3, 0)
				if SERVER then
					self.Owner:SetFOV(0, 0.3)
					self.Owner:DrawViewModel(true)
				end
			end
		end
	elseif not self.Owner:KeyDown(IN_SPEED) and DTInt3 != 1 and DTInt3 != 0 and DTInt3 != 6 and DTInt3 != 8 and DTInt3 != 10 and DTInt3 != 11 and DTInt3 != 12 and DTInt3 != 15 or not self.Owner:OnGround() and DTInt3 != 6 and DTInt3 != 0 and DTInt3 != 15 then
		self.Weapon:SetDTInt(3, 0)
		if SERVER then
			self.Owner:SetFOV(0, 0.2)
			self.Owner:DrawViewModel(true)
		end
	end
	
	if not self.Owner:KeyDown(IN_RELOAD) then
		if self.Weapon.HasReleasedKey == false then
			self.Weapon.HasReleasedKey = true
		end
	end
	
	if self.Weapon.Burst and not self.Owner:KeyDown(IN_ATTACK) then
		self.Weapon.Shots = 0
	end
	
	if CLIENT then
		self.Owner:GetViewModel().BuildBonePositions = function(self, numbon, numphysbon)
		
			if not IsValid(LocalPlayer():GetActiveWeapon()) then
				return
			end
			
			local ply = LocalPlayer()
			local vm = ply:GetViewModel()
			local wep = ply:GetActiveWeapon()
			local activity = wep:GetSequenceActivityName(wep:GetSequence())
			local seqdur = vm:SequenceDuration()
			
			if not wep.IsCustomWeapon then
				return
			end
			
			if IsValid(wep) then
				if wep.MagBone then
					if wep.VElements and wep.VElements["cmag"].color.a == 255 then 
						local bone = vm:LookupBone(wep.MagBone)
						local matrix = vm:GetBoneMatrix(bone)
							
						if matrix then
							matrix:Scale(Vector(0.01, 0.01, 0.01))
							vm:SetBoneMatrix(bone, matrix)
						end
					end
				end
				
				if wep.OtherBone then
					if wep.VElements and ((wep.VElements["eotech"] and wep.VElements["eotech"].color.a == 255) or (wep.VElements["aimpoint"] and wep.VElements["aimpoint"].color.a == 255) or (wep.VElements["acog"] and wep.VElements["acog"].color.a == 255)) then
						local bone = vm:LookupBone(wep.OtherBone)
						local matrix = vm:GetBoneMatrix(bone)
							
						if matrix then
							matrix:Scale(Vector(0.01, 0.01, 0.01))
							vm:SetBoneMatrix(bone, matrix)
						end
					end
				end

				if wep.ViewModelBonescales then
					for k, v in pairs( wep.ViewModelBonescales ) do
						local bone = vm:LookupBone(k)
						if (!bone) then continue end
						local m = vm:GetBoneMatrix(bone)
						if (!m) then continue end
						m:Scale(v)
						vm:SetBoneMatrix(bone, m)
					end
				end
			
				if self.ViewModelBonescales then
					for k, v in pairs( self.ViewModelBonescales ) do
						local bone = s:LookupBone(k)
						if (!bone) then continue end
						local m = s:GetBoneMatrix(bone)
						if (!m) then continue end
						m:Scale(v)
						s:SetBoneMatrix(bone, m)
					end
				end
			
				if wep:GetDTInt(3) == 15 then
					if wep.MeleeOffset then
						wep.TargetOffset = wep.MeleeOffset
					else
						if wep.VElements["vertgrip"] and wep.VElements["vertgrip"].color.a == 255 then
							wep.TargetOffset = wep.VertGrip_Idle
						elseif wep.VElements["cmag"] and wep.VElements["cmag"].color.a == 255 then
							wep.TargetOffset = wep.CMag_Idle
						end
					end
				else
					if wep.VElements and (wep.VElements["grenadelauncher"] or wep.VElements["vertgrip"] or wep.VElements["cmag"]) then
					
						if wep.VElements["grenadelauncher"] and wep.VElements["grenadelauncher"].color.a == 255 then
						
							if activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED" or activity == "ACT_VM_ATTACH_SILENCER" or activity == "ACT_VM_DETACH_SILENCER" or activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED" then
							
								if wep.OffsetMeStage == 1 then
									wep.TargetOffset = "none"
								elseif wep.OffsetMeStage == 2 then
									wep.TargetOffset = wep.GrenadeLauncher_Idle
								end
							else
								if wep:GetDTInt(3) == 8 then
									wep.TargetOffset = wep.GrenadeLauncher_Active
								else
									wep.TargetOffset = wep.GrenadeLauncher_Idle
								end
							end
			
						elseif wep.VElements["vertgrip"] and wep.VElements["vertgrip"].color.a == 255 then
							if activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED" or activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED" then
								if wep.VElements["cmag"] and wep.VElements["cmag"].color.a == 255 then
									if wep.OffsetMeStage == 1 then
										wep.TargetOffset = "none"
									elseif wep.OffsetMeStage == 2 then
										wep.TargetOffset = wep.CMag_Reload or "none"
									end
								else
									if wep.OffsetMeStage == 1 then
										wep.TargetOffset = "none"
									elseif wep.OffsetMeStage == 2 then
										wep.TargetOffset = wep.VertGrip_Idle
									end
								end
							elseif activity == "ACT_VM_ATTACH_SILENCER" or activity == "ACT_VM_DETACH_SILENCER" then
								if wep.OffsetMeStage == 1 then
									wep.TargetOffset = "none"
								elseif wep.OffsetMeStage == 2 then
									wep.TargetOffset = wep.VertGrip_Idle
								end
							else
								wep.TargetOffset = wep.VertGrip_Idle
							end
						else
							if wep.VElements["cmag"] and wep.VElements["cmag"].color.a == 255 then
								if activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED" or activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED" then
									if wep.OffsetMeStage == 1 then
										wep.TargetOffset = "none"
									elseif wep.OffsetMeStage == 2 then
										wep.TargetOffset = wep.CMag_Reload or "none"
									end
								elseif activity == "ACT_VM_ATTACH_SILENCER" or activity == "ACT_VM_DETACH_SILENCER" then
									if wep.OffsetMeStage == 1 then
										wep.TargetOffset = "none"
									elseif wep.OffsetMeStage == 2 then
										wep.TargetOffset = wep.CMag_Idle
									end
								else
									wep.TargetOffset = wep.CMag_Idle
								end
							else
								wep.TargetOffset = {}
							end
						end
					else
						wep.TargetOffset = "none"
					end
				end
				
				if wep.TargetOffset == "none" and wep.OffsetBones then
					for k, v in pairs(wep.OffsetBones) do
					
						wep.OffsetBones[k] = wep.OffsetBones[k] or {}
					
						if v.curoffset then	
							v.curoffset = LerpVector(wep.BoneApproachSpeed or 0.3, v.curoffset, Vector(0, 0, 0))
						end
						
						if v.currotation then
							v.currotation = LerpVector(wep.BoneApproachSpeed or 0.3, v.currotation, Vector(0, 0, 0))
						end
					
						local bone = vm:LookupBone(k)
						local matrix = self:GetBoneMatrix(bone)
								
						if matrix then
							if v.curoffset then
								matrix:Translate(wep.OffsetBones[k].curoffset)
							end
							
							if v.currotation then
								matrix:Rotate(wep.OffsetBones[k].currotation)
							end
							
							self:SetBoneMatrix(bone, matrix)
						end
					end
					
				else
			
					if wep.TargetOffset and wep.TargetOffset != "none" then
						for k, v in pairs(wep.TargetOffset) do
							
							wep.OffsetBones[k] = wep.OffsetBones[k] or {}
						
							if not wep.OffsetBones[k].curoffset and not wep.OffsetBones[k].currotation then
								wep.OffsetBones[k].curoffset = Vector(0, 0, 0)
								wep.OffsetBones[k].currotation = Vector(0, 0, 0)
							end
							
							if wep.OffsetMeStage == 1 then
								wep.OffsetBones[k].curoffset = LerpVector(wep.BoneApproachSpeed or 0.3, wep.OffsetBones[k].curoffset, v.vector or Vector(0, 0, 0))
								wep.OffsetBones[k].currotation = LerpVector(wep.BoneApproachSpeed or 0.3, wep.OffsetBones[k].currotation, v.angle or Vector(0, 0, 0))
							elseif wep.OffsetMeStage == 2 then
								wep.OffsetBones[k].curoffset = LerpVector(wep.BoneApproachSpeed or 0.3, wep.OffsetBones[k].curoffset, v.vector)
								wep.OffsetBones[k].currotation = LerpVector(wep.BoneApproachSpeed or 0.3, wep.OffsetBones[k].currotation, v.angle)
							end
							
							local bone = vm:LookupBone(k)
							local matrix = self:GetBoneMatrix(bone)
							
							if matrix then
								matrix:Translate(wep.OffsetBones[k].curoffset)
								matrix:Rotate(wep.OffsetBones[k].currotation)
								self:SetBoneMatrix(bone, matrix)
							end
								
						end
					end
				end
					
				if activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED" or activity == "ACT_VM_ATTACH_SILENCER" or activity == "ACT_VM_DETACH_SILENCER" or activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED" then
				
					if wep.LastActivity != activity then
						wep.LastActivity = activity
						wep.OffsetMeStage = 1
						wep.TimerCreated = false
					end
					
					if not wep.TimerCreated then
					
						wep.OffsetMeStage = 1
						
						local PlaybackRate = vm:GetPlaybackRate()
						local TimeRel, TimeIdle
						
						if wep:Clip1() > 0 and (activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED") and wep.SkipIdle != true then
							TimeRel = (seqdur * (1 - wep.IncAmmoPerc)) / PlaybackRate
							TimeIdle = (seqdur * (1 - wep.IncAmmoPerc)) / PlaybackRate
						elseif activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED" then
							TimeRel = seqdur * (1 - 0.4) / PlaybackRate
							TimeIdle = seqdur / PlaybackRate
						else
							TimeRel = (seqdur / PlaybackRate) - 0.5
							TimeIdle = (seqdur / PlaybackRate) - 0.01
						end
						
						timer.Simple(TimeRel, function()
							if not IsValid(wep) or wep:GetClass() != ply:GetActiveWeapon():GetClass() then
								return
							end
							
							wep.OffsetMeStage = 2
						end)
					
						timer.Simple(TimeIdle, function()
							if not IsValid(wep) or wep:GetClass() != ply:GetActiveWeapon():GetClass() then
								return
							end
							
							wep:SendWeaponAnim(ACT_VM_IDLE)
						end)
						
						wep.TimerCreated = true
					end
				else
					wep.TimerCreated = false
					wep.OffsetMeStage = 2
				end
			end
		end
	end
end

function SWEP:PrimaryAttack()

	if self.Weapon.ShouldBolt == true or self.Weapon.IsReloading == true then
		return
	end
	
	if self.Weapon:GetDTInt(3) == 2 then
		return
	end
	
	local time = CurTime()
	
	if self.Weapon.SecondaryAtt == 1 and self.Owner:KeyDown(IN_USE) and self.Weapon:GetDTInt(3) != 8 then
	
		if SERVER then
			if self.Weapon.Grenade == false then
				self.Owner:EmitSound("weapons/shotgun/shotgun_empty.wav", 65, math.random(99, 101))
				self.Weapon.Grenade = true
			else
				self.Owner:EmitSound("weapons/ClipEmpty_Rifle.wav", 65, math.random(99, 101))
				self.Weapon.Grenade = false
			end
		end
		
		self.Weapon:SetNextPrimaryFire( time + 0.25 )
		self.Weapon:SetNextSecondaryFire( time + 0.25 )
		return
	end
	
	if (self.Weapon:Clip1() == 0 or self.Owner:WaterLevel() == 3) and not self.Weapon.Grenade then
		self.Weapon:EmitSound("weapons/shotgun/shotgun_empty.wav", 65, math.random(99, 101))
		self.Weapon:SetNextSecondaryFire( time + 0.05 )
		self.Weapon:SetNextPrimaryFire( time + 0.25 )
		return
	end
	
	if CLIENT then
		if self.Owner:KeyDown(IN_USE) then
			if (self.Weapon.VElements and self.Weapon.VElements["grenadelauncher"] and self.Weapon.VElements["grenadelauncher"].color.a == 255) or self.Weapon:GetDTInt(3) == 8 then
				return
			end
		else
			if self.Weapon.VElements and self.Weapon.VElements["grenadelauncher"] and self.Weapon.VElements["grenadelauncher"].color.a == 255 and self.Weapon:GetDTInt(3) == 8 then
				return
			end
		end
	end
	
	if SERVER then
		if self.Weapon.SecondaryAtt == 1 and self.Weapon.Grenade and self.Weapon:GetDTInt(3) == 8 then
			if self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
				self.Owner:EmitSound("weapons/shotgun/shotgun_empty.wav", 65, math.random(99, 101))
				self.Weapon:SetNextPrimaryFire( time + 0.25 )
				self.Weapon:SetNextSecondaryFire( time + 0.05 )
				return
			end
		
			local prop = ents.Create(self.Weapon.GrenadeType)
			prop:SetPos(self.Owner:EyePos() + self.Owner:GetAimVector() * 24 + self.Owner:GetRight() * 4 + self.Owner:GetUp() * -6)
			prop:SetOwner(self.Owner)
			prop:SetAngless(self.Owner:EyeAngles())
			prop.BlastRadius = self.Weapon.BlastRadius
			prop.BlastDamage = self.Weapon.BlastDamage
			prop:Spawn()
			prop:GetPhysicsObject():SetVelocity(self.Owner:GetAimVector() * 3500)
			prop:SetGravity(1.8)
			prop:SetOwner(self.Owner)
			
			self.Owner:ViewPunch(Angle(-10, 0, 0))
			self.Owner:EmitSound("weapons/grenade_launcher1.wav", 85, 100)
			self.Weapon:TakeSecondaryAmmo(1)
			self.Weapon:SetDTInt(3, 0)
			self.Owner:SetFOV(0, 0.3)
			
			if self.Owner:GetAmmoCount("SMG1_Grenade") > 0 then
				self.Weapon:SetNextPrimaryFire(time + 3)
				self.Weapon:SetNextSecondaryFire(time + 3)
				self.Weapon.ReloadDelay = time + 3
				self.Owner.AttachDelay = time + 3
			else
				self.Weapon:SetNextPrimaryFire(time + 0.3)
				self.Weapon:SetNextSecondaryFire(time + 0.3)
				self.Weapon.ReloadDelay = time + 0.3
				self.Owner.AttachDelay = time + 0.3
			end
			
			timer.Simple(0.5, function()
				if (self.Weapon == nil or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass()) or self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
					return
				end
			
			self.Weapon:SetDTInt(3, 6)
			end)
				
			timer.Simple(1, function()
				if (self.Weapon == nil or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass()) or self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
					return
				end
				
				self.Owner:EmitSound("weapons/smg1/smg1_reload.wav", 50, 100)
				self.Owner:DoAnimationEvent(ACT_ITEM_GIVE)
			end)
			
			timer.Simple(2.75, function()
				if (self.Weapon == nil or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass()) or self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
					return
				end
				
				self.Weapon:SetDTInt(3, 0)
			end)
				
			if self.Owner:GetAmmoCount("SMG1_Grenade") == 0 then
				self.Weapon.Grenade = false
			end
			
			return
		end
	end
	
	self.Weapon:SetNextSecondaryFire( time + self.Primary.Delay )
	self.Weapon:SetNextPrimaryFire( time + self.Primary.Delay )
	
	if ( !self:CanPrimaryAttack() ) then return end
	
	if SERVER then
		if self.Weapon.IsSilenced == false then
			/*if self.Weapon.PrimarySound:IsPlaying() then
				self.Weapon.PrimarySound:Stop()
				self.Weapon.PrimarySound:Play()
			else
				self.Weapon.PrimarySound:Play()
			end*/
			
			self.Owner:EmitSound(self.Primary.Sound, self.Weapon.UnsilencedVolume, math.random(99, 101))
		else
			/*if self.Weapon.SecondarySound:IsPlaying() then
				self.Weapon.SecondarySound:Stop()
				self.Weapon.SecondarySound:Play()
			else
				self.Weapon.SecondarySound:Play()
			end*/
			
			self.Owner:EmitSound(self.Weapon.SilencedSound, self.Weapon.SilencedVolume, math.random(99, 101))
		end
		
		if self.Weapon:Clip1() <= 10 then
			self.Owner:EmitSound("weapons/ClipEmpty_Rifle.wav", 60 - (self.Weapon:Clip1() * 4), 100)
		end
		
		if self.Owner.CloakOn then
			self.Owner:SetDTInt(2, 0)
		end
		
		local ef = EffectData()
		ef:SetOrigin(self.Owner:GetShootPos())
		ef:SetEntity(self.Weapon)
		ef:SetAngles(self.Owner:GetAngles())
		//ef.Silenced = self.Weapon.IsSilenced
		util.Effect("ta_ef_muzzle", ef)
	end
	
	self.Weapon.ReloadDelay = time + 0.5
	self.Owner.AttachDelay = time + 0.5
	if self.Weapon:GetDTInt(3) != 1 then
		self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil * 1.2, self.Primary.NumShots, self.Weapon:GetDTFloat(0))
	else
		self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil * 0.75, self.Primary.NumShots, self.Weapon:GetDTFloat(0))
	end
	
	self:TakePrimaryAmmo( 1 )
	
	self.Weapon.ConeInaccuracy = math.Clamp(self.Weapon.ConeInaccuracy + (0.005 + self.Weapon.DefRecoil * (0.006 - (self.Weapon.ConeDecAff1 + self.Weapon.ConeDecAff2))) * self.Weapon.InaccAff1, 0, 0.12 * (self.Weapon.ConeInaccuracyAff1))
	self.Weapon.ConeInaccDelay = time + self.Primary.Delay * 1.05
	
	if ( self.Owner:IsNPC() ) then return end
	
	self.Owner:ViewPunch( Angle(-1 * (self.Primary.Recoil + self.Weapon.ConeInaccuracy * 4) * (1 - (self.Weapon.RecoilAff1 + self.Weapon.RecoilAff2 + self.Weapon.RecoilAff3 + self.Weapon.RecoilAff4)), 0, 0 ) )
	
end

local damagemod1, damagemod2

/*---------------------------------------------------------
   Name: SWEP:CSShootBullet( )
---------------------------------------------------------*/
function SWEP:CSShootBullet( dmg, recoil, numbul, cone )
	numbul 	= numbul 	or 1
	cone 	= cone 		or 0.01
		
	local bullet = {}
	bullet.Num 		= numbul
	bullet.Src 		= self.Owner:GetShootPos()			// Source
	bullet.Dir 		= ( self.Owner:EyeAngles() + self.Owner:GetPunchAngle() ):Forward()		// Dir of bullet
	bullet.Spread 	= Vector( cone, cone, 0 )			// Aim Cone
	bullet.Tracer	= 4									// Show a tracer on every x bullets 
	bullet.Force	= self.Primary.Damage									// Amount of force to give to phys objects
	if self.Weapon.IsSilenced then
		damagemod1 = 0.1
	else
		damagemod1 = 0
	end
	
	if self.Weapon:GetDTInt(2) == 1 then
		damagemod2 = 0.4
	else
		damagemod2 = 0
	end
	
	bullet.Damage = math.Round(self.Primary.Damage * (1 - (damagemod1 + damagemod2 )))
	
	self.Owner:FireBullets(bullet)
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK) 		// View model animation
	self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.PlaybackRate or 1) -- some weapons in the pack have slow recoil animation, so I've decided to slightly speed it up
	if self.Weapon.IsSilenced == false then
		self.Owner:MuzzleFlash()								// Crappy muzzle light
	end
	self.Owner:SetAnimation(PLAYER_ATTACK1)				// 3rd Person Animation
	
	if ( self.Owner:IsNPC() ) then return end
	
	local eyeang = self.Owner:EyeAngles()
	eyeang.pitch = eyeang.pitch - (recoil * 0.5)
	eyeang.yaw = eyeang.yaw - (recoil * math.random(-1, 1) * 0.25)
	self.Owner:SetEyeAngles( eyeang )
end


/*---------------------------------------------------------
	Checks the objects before any action is taken
	This is to make sure that the entities haven't been removed
---------------------------------------------------------*/
function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
	if self.Weapon.DifType then
		surface.SetDrawColor(255, 210, 0, 255)
		surface.SetTexture(self.WepSelectIcon)
		surface.DrawTexturedRect(x + 56, y, 128, 128)
	else
		draw.SimpleText( self.IconLetter, "CSSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )
	end
end

local CurMul1 = 0
local CurMul2 = 0
local CurMul3 = 0
local CurMove = -2
local AmntToMove = 0.4
local MoveCycle = 0
local Ironsights_Time = 0.1
local CurShakeA = 0.03
local CurShakeB = 0.03
local randomdir = 0
local randomdir2 = 0
local timetorandom = 0
local BlendPos = Vector(0, 0, 0)
local BlendAng = Vector(0, 0, 0)
local ApproachRate = 0.2

function SWEP:GetViewModelPosition(pos, ang)
	if !self.AimPos then
		return pos, ang
	end
	
	local FT = RealFrameTime()
	local time = CurTime()
	
	if self.Weapon:GetDTInt(3) == 2 then
		if self.Weapon:GetClass():find("^ta_pistol_") then
			TargetPos = self.RunPosPistol
			TargetAng = self.RunAngPistol
		else
			if self.ViewModelFlip == true then
				TargetPos = self.RunPos
				TargetAng = self.RunAng
			else
				TargetPos = self.RunPosNoFlip
				TargetAng = self.RunAngNoFlip
			end
		end
	elseif self.Weapon:GetDTInt(3) == 1 then
		TargetPos = self.AimPos
		TargetAng = self.AimAng
	elseif self.Weapon:GetDTInt(3) == 6 then
		TargetPos = Vector(3.934, -9.344, -16.393)
		TargetAng = Vector(0, 0, 0)
	elseif self.Weapon:GetDTInt(3) == 15 then
		if self.Weapon.ViewModelFlip then
			TargetPos = self.MeleePos or Vector(0, 0, 0)
			TargetAng = self.MeleeAng or Vector(0, 0, 0)
		else
			TargetPos = self.MeleePosNoFlip or Vector(0, 0, 0)
			TargetAng = self.MeleeAngNoFlip or Vector(0, 0, 0)
		end
	/*elseif self.Weapon:GetDTInt(3) == 10 then
		if self.Weapon.ViewModelFlip then
			TargetPos = Vector(-10, 0, 0)
		else
			TargetPos = Vector(10, 0, 0)
		end
		TargetAng = Vector(0, 0, 0)
	elseif self.Weapon:GetDTInt(3) == 11 then
		if self.Weapon.ViewModelFlip then
			TargetPos = Vector(15, 0, 0)
		else
			TargetPos = Vector(-15, 0, 0)
		end
		TargetAng = Vector(0, 0, 0)
	elseif self.Weapon:GetDTInt(3) == 12 then
		TargetPos = Vector(-0.987, -10.082, 7.313)
		TargetAng = Vector(0, 0, 0)*/
	else
		if GetConVarNumber("ta_different_origins") > 0 then
			if self.ViewModelFlip == true then
				TargetPos = self.FlipOriginsPos
				TargetAng = self.FlipOriginsAng
			else
				TargetPos = self.NoFlipOriginsPos
				TargetAng = self.NoFlipOriginsAng
			end
		else
			TargetPos = Vector(0, 0, 0)
			TargetAng = Vector(0, 0, 0)
		end
	end
	
	if self.Weapon:GetDTInt(3) == 1 then
		ApproachRate = FT * 20 
	elseif self.Weapon:GetDTInt(3) == 6 or self.Weapon:GetDTInt(3) == 7 then
		ApproachRate = FT * 4
	elseif self.Weapon:GetDTInt(3) == 15 then
		ApproachRate = FT * 40
	else
		ApproachRate = FT * 7
	end
	
	BlendPos = LerpVector(ApproachRate, BlendPos, TargetPos)
	BlendAng = LerpVector(ApproachRate, BlendAng, TargetAng)
		
	CurShakeA = math.Approach(CurShakeA, randomdir, 0.01)
	CurShakeB = math.Approach(CurShakeB, randomdir2, 0.01)
		
	if time > timetorandom then
		randomdir = math.Rand(-0.1, 0.1)
		randomdir2 = math.Rand(-0.1, 0.1)
		timetorandom = time + 0.2
	end
	
	if self.Weapon:GetDTInt(3) == 1 then 
		self.SwayScale 	= 0
		self.BobScale 	= 0.1
	elseif self.Weapon:GetDTInt(3) == 2 or self.Weapon:GetDTInt(3) == 4 then
		self.SwayScale 	= 2
		self.BobScale 	= 2
	elseif self.Weapon:GetDTInt(3) == 0 then
		self.SwayScale 	= 1
		self.BobScale 	= 1
	end

	if CurMove == -2 then
		MoveCycle = 1
	elseif CurMove == 2 then
		MoveCycle = 2
	end
	
	if MoveCycle == 1 then
		CurMove = math.Approach(CurMove, 2, 0.11 - CurMove * 0.05)
	elseif MoveCycle == 2 then
		CurMove = math.Approach(CurMove, -2, 0.11 - CurMove * 0.05)
	end

	if self.AimAng then
		ang = ang * 1
		ang:RotateAroundAxis( ang:Right(), 		BlendAng.x + CurShakeB * self.BobScale )
		ang:RotateAroundAxis( ang:Up(), 		BlendAng.y + CurShakeA * self.BobScale)
		ang:RotateAroundAxis( ang:Forward(), 	BlendAng.z + CurShakeA * self.BobScale)
	end
	
	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()	
	
	pos = pos + BlendPos.x * Right 
	pos = pos + BlendPos.y * Forward
	pos = pos + BlendPos.z * Up

	return pos, ang
end

SWEP.NextSecondaryAttack = 0

if SERVER then
	local AttSoundDelay = 0

	function SWEP:NWAlpha(alpha)
		umsg.Start("NWAlpha")
			umsg.Entity(self)
			umsg.Short(alpha)
		umsg.End()
	end
	
	function SWEP:NWATT(number)
		umsg.Start("NWATT")
			umsg.Entity(self)
			umsg.Short(number)
		umsg.End()
		
		local time = CurTime()
		
		self.Owner:SetFOV(0, 0.3)
		self.Owner:DrawViewModel(true)
		self.Weapon:SetNextPrimaryFire(time + 2.35)
		self.Weapon:SetNextSecondaryFire(time + 2.35)
		self.Weapon.ReloadDelay = time + 2.35
		self.Owner.AttachDelay = time + 2.35
		
		if self.Weapon == nil then
			return
		end
			
		if number != 6 or number != 7 then
			self.Weapon.ScopeStatus = number
		end
			
		if number == 1 then
			self.Weapon.HasRail = true
		end
		
		if number == 8 then
			self.Primary.ClipSize = 100
			self.Weapon:SetClip1(100)
			self.Weapon.ReloadSpeed = 0.8
			self.Weapon.DrawSpeed = 0.85
			
			umsg.Start("NWSPD")
				umsg.Entity(self)
			umsg.End()
		elseif number == 7 then
			self.Weapon.HipCone = self.Weapon.HipCone * 0.7
			self.Weapon.VelocitySensivity = self.Weapon.VelocitySensivity * 0.65
			self.Weapon.DefRecoil = self.Weapon.DefRecoil * 0.8
			self.Primary.Recoil = self.Weapon.DefRecoil
			self.Weapon.InstalledGrip = true
			self.Weapon.DrawSpeed = 0.85
			self.Weapon.SecondaryAtt = 0
		elseif number == 6 then
			self.Weapon.HipCone = self.Weapon.HipCone / 0.7
			self.Weapon.VelocitySensivity = self.Weapon.VelocitySensivity / 0.65
			self.Weapon.DefRecoil = self.Weapon.DefRecoil / 0.8
			self.Primary.Recoil = self.Weapon.DefRecoil
			self.Weapon.InstalledGrip = false
		end
	end
	
	function SWEP:NetworkHoldType(ht)
		self:SetWeaponHoldType(ht)
		
		umsg.Start("NWHT")
			umsg.Entity(self)
			umsg.String(ht)
		umsg.End()
	end
end

if CLIENT then
	function SWEP:DoImpactEffect(trace, dmgtype)
		if not self.Weapon.Em then
			self.Weapon.Em = ParticleEmitter(Vector(0, 0, 0))
		end
		
		if self.Weapon:GetDTInt(2) != 1 then
			return
		end
		
		local dlight = DynamicLight(self.Owner:EntIndex())
		
		dlight.Pos = trace.HitPos
		dlight.r = 255
		dlight.g = 170
		dlight.b = 0
		dlight.Brightness = 1
		dlight.Size = 128
		dlight.Decay = 512
		dlight.DieTime = CurTime() + 0.2
	end

	function SWEP:AdjustMouseSensitivity()
		if self.Weapon:GetDTInt(3) == 1 then
			return GetConVarNumber("ta_aim_sensitivity") * self.Owner:GetFOV()
		else
			return 1
		end
	end

	function SWEP:FireAnimationEvent(pos, ang, ev)
		if ev == 5001 then
			if not self.Owner:ShouldDrawLocalPlayer() then
				local vm = self.Owner:GetViewModel()
				local muz = vm:GetAttachment("1")
				
				if not self.Weapon.Em then
					self.Weapon.Em = ParticleEmitter(muz.Pos)
				end
				
				if (self.Weapon.VElements and self.Weapon.VElements["silencer"] != nil and self.Owner:GetActiveWeapon().VElements["silencer"].color.a != 255) or self.Weapon.VElements and self.Weapon.VElements["silencer"] == nil then -- I check if it's not nil and then if it's nil to ensure that weapons that don't have a silencer don't bug
					if GetConVarNumber("ta_ef_heat") > 0 then
						local par = self.Weapon.Em:Add("sprites/heatwave", muz.Pos)
						par:SetStartSize(8)
						par:SetEndSize(4)
						par:SetDieTime(0.3)
					end
				end
				
				if self.Weapon.VElements and self.Weapon.VElements["silencer"] and self.Weapon.VElements["silencer"].color.a == 255 then
					return ev == 5001
				end
			end
		end
	end

	local Current = "none"
	local function ReceiveAlpha(um)
		local wep = um:ReadEntity()
		local alpha = um:ReadShort()
		
		if IsValid(wep) then
			if wep.VElements and wep.VElements["silencer"] then
				wep.VElements["silencer"].color = Color(255, 255, 255, alpha)
			end
			
			if wep.WElements and wep.WElements["silencer"] then
				wep.WElements["silencer"].color = Color(255, 255, 255, alpha)
			end
		end
	end
	
	usermessage.Hook("NWAlpha", ReceiveAlpha)
	
	local function ReceiveAttachmentNumber(um)
		local wep = um:ReadEntity()
		local number = um:ReadShort()
		
		if IsValid(wep) and wep.VElements and wep.WElements then
			if wep.CurSightsTexture then
				Material(wep.CurSightsTexture):SetMaterialTexture("$basetexture", Material("models/weapons/transparent"):GetMaterialTexture("$basetexture"))
			end
			
			if wep.CurWSightsTexture then
				Material(wep.CurWSightsTexture):SetMaterialTexture("$basetexture", Material("models/weapons/transparent"):GetMaterialTexture("$basetexture"))
			end
		
			if number == 1 then
				Current = "rail"
			elseif number == 2 then
				Current = "acog"
			elseif number == 3 then
				Current = "aimpoint"
			elseif number == 4 then
				Current = "eotech"
				if wep.NoRail != true and wep.EoTechWithRail != true then
					wep.VElements["rail"].color = Color(255, 255, 255, 0)
					
					if wep.WElements and wep.WElements["rail"] then
						wep.WElements["rail"].color = Color(255, 255, 255, 0)
					end
				end
			elseif number == 6 then
				Current = "grenadelauncher"
			elseif number == 7 then
				Current = "vertgrip"
			elseif number == 8 then
				Current = "cmag"
			elseif number == 9 then
				Current = "aimpoint"
			end
			
			if number == 6 then
				if wep.VElements["vertgrip"] then
					wep.VElements["vertgrip"].color.a = 0
				end
			elseif number == 7 then
				if wep.VElements["grenadelauncher"] then
					wep.VElements["grenadelauncher"].color.a = 0
				end
			end
			
			if wep.VElements["rail"] then
				wep.VElements["rail"].color.a = 255
			end
			
			if wep.WElements["rail"] then
				wep.WElements["rail"].color.a = 255
			end
			
			for k, v in pairs(wep.VElements) do
				if v != wep.VElements[Current] and v != wep.VElements["silencer"] and v != wep.VElements["rail"] and v != wep.VElements["grenadelauncher"] and number != 6 and v != wep.VElements["vertgrip"] and number != 7 and v != wep.VElements["cmag"] and number != 8 then
					v.color = Color(255, 255, 255, 0)
				end
			end
			
			for k, v in pairs(wep.WElements) do
				if v != wep.WElements[Current] and v != wep.WElements["silencer"] and v != wep.WElements["rail"] and v != wep.WElements["weapon"] and v != wep.WElements["grenadelauncher"] and number != 6 and v != wep.WElements["vertgrip"] and number != 7 and v != wep.VElements["cmag"] and number != 8 then
					v.color = Color(255, 255, 255, 0)
				end
			end
			
			if number == 6 then
				if wep.WElements["vertgrip"] then
					wep.WElements["vertgrip"].color.a = 0
				end
			end
		
			if wep.VElements[Current] then
				wep.VElements[Current].color = Color(255, 255, 255, 255)
			end
			
			if wep.WElements[Current] !=  nil then
				wep.WElements[Current].color = Color(255, 255, 255, 255)
			end
			
			if number == 2 then
				wep.AimPos = wep.ACOGPos
				wep.AimAng = wep.ACOGAng
				wep.HasInstalledScope = true
			elseif number == 3 then
				wep.AimPos = wep.ScopePos
				wep.AimAng = wep.ScopeAng
				wep.HasInstalledScope = true
			elseif number == 4 or number == 9 then
				wep.AimPos = wep.ReflexPos
				wep.AimAng = wep.ReflexAng
				wep.HasInstalledScope = true
			end
			
			wep.ScaleBonesWhenAttached = true
		end
	end
	
	usermessage.Hook("NWATT", ReceiveAttachmentNumber)
	
	local function ReceiveHT(um)
		local wep = um:ReadEntity()
		
		if IsValid(wep) and wep.SetWeaponHoldType then
			wep:SetWeaponHoldType(um:ReadString())
		end
	end
	
	usermessage.Hook("NWHT", ReceiveHT)
	
	local function ReceiveNumBul(um)
		local ent = um:ReadEntity()
	
		if IsValid(ent) then
			ent.Primary.NumShots = 1
		end
	end
	
	usermessage.Hook("NBUL", ReceiveNumBul)
	
	local function ReceiveFireMode(um)
		local Mode = um:ReadString()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		
		if IsValid(ply) and IsValid(wep) then
			if Mode == "semi" then
				wep.Bullets = 1
				wep.Primary.Automatic = false
			elseif Mode == "burst" then
				wep.Bullets = 3
				wep.Primary.Automatic = true
			elseif Mode == "auto" then
				wep.Bullets = 5
				wep.Primary.Automatic = true
			end
		end
	end
	
	usermessage.Hook("FRMD", ReceiveFireMode)
	
	local gap = 5
	local gap2 = 0
	local CurAlpha_Weapon = 255
	local ScopeTexture = surface.GetTextureID("gcellmats/scope_rifle2")
	local GLTexture = surface.GetTextureID("sprites/crosshair_gl")
	local UseGoggle = false
	local Bullet = surface.GetTextureID("ta/bullet")

	function SWEP:DrawHUD()
		local FT = RealFrameTime()
		local time = CurTime()
		local Width = ScrW()
		local Height = ScrH()
		local x2 = (Width - 1024) / 2
		local y2 = (Height - 1024) / 2
		local x3 = Width - x2
		local y3 = Height - y2
		local DTInt3 = self.Weapon:GetDTInt(3)
	
		if DTInt3 == 1 and GetConVarNumber("ta_oldacog") > 0 and self.Weapon.VElements and self.Weapon.VElements["acog"] and self.Weapon.VElements["acog"].color.a == 255 then
			if UseGoggle == false then
				TimeToUseGoggle = time + 0.15
				UseGoggle = true
			end
			
			if time > TimeToUseGoggle then
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(ScopeTexture)
				surface.DrawTexturedRectUV(x2, y2, 1024, 1024, 1024, 1024)
				
				surface.SetDrawColor(0, 0, 0, 255)
				surface.DrawRect(0, 0, x2, Height)
				surface.DrawRect(x3, 0, x2, Height)
				surface.DrawRect(0, 0, Width, y2)
				surface.DrawRect(0, y3, Width, y2)
			end
		else
			UseGoggle = false
		end
		
		if self.Weapon.Bullets then
		
			local Text
		
			if self.Weapon.Bullets == 1 then
				Text = "Semi-auto"
			elseif self.Weapon.Bullets == 3 then
				Text = "Burst"
			elseif self.Weapon.Bullets == 5 then
				Text = "Full-auto"
			end
			
			draw.RoundedBox(6, Width * 0.5 - 60, Height * 0.9, 120, 30, Color(0, 0, 0, 220))
			draw.SimpleText(Text, "DefaultSmallDropShadow", Width * 0.5, Height * 0.9 + 10, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)	

			surface.SetDrawColor(255, 210, 0, 255)			
		
			if self.Weapon.Bullets == 1 then
				surface.SetTexture(Bullet)
				surface.DrawTexturedRectRotated(Width * 0.5, Height * 0.9 + 20, 16, 16, 180)
			elseif self.Weapon.Bullets == 3 then
			
				for i = 1, 3 do
					surface.SetDrawColor(255, 210, 0, 255)
					surface.SetTexture(Bullet)
					surface.DrawTexturedRectRotated(Width * 0.5 + 20 * i - 40, Height * 0.9 + 20, 16, 16, 180)
				end
				
			else
			
				for i = 1, 5 do
					surface.SetDrawColor(255, 210, 0, 255)
					surface.SetTexture(Bullet)
					surface.DrawTexturedRectRotated(Width * 0.5 + 20 * i - 60, Height * 0.9 + 20, 16, 16, 180)
				end
				
			end
			
			/*for i = 1, self.Weapon.Bullets do
				surface.SetDrawColor(255, 210, 0, 255)
				surface.SetTexture(Bullet)
				surface.DrawTexturedRectRotated(ScrW() * 0.5 + 20 * i - 60, Height * 0.9 + 20, 16, 16, 180)
			end*/
		end	
	
		if ( self.Owner == LocalPlayer() && self.Owner:ShouldDrawLocalPlayer() ) then

			local tr = util.GetPlayerTrace( self.Owner )
			tr.mask = ( CONTENTS_SOLID+CONTENTS_MOVEABLE+CONTENTS_MONSTER+CONTENTS_WINDOW+CONTENTS_DEBRIS+CONTENTS_GRATE+CONTENTS_AUX )
			local trace = util.TraceLine( tr )
			
			local coords = trace.HitPos:ToScreen()
			x, y = coords.x, coords.y

		else
			x, y = Width / 2.0, Height / 2.0
		end
		
		local scale = (10 / (self.Owner:GetFOV() / 90)) * self.Weapon:GetDTFloat(0)
		
		if DTInt3 == 2 or DTInt3 == 4 then
			CurAlpha_Weapon = math.Approach(CurAlpha_Weapon, 0, FT / 0.001)
		elseif (DTInt3 == 1 and self.Weapon.NoProperIronsights != true) or UseGoggle == true or (DTInt3 == 1 and self.Weapon.HasInstalledScope == true) then
			CurAlpha_Weapon = math.Approach(CurAlpha_Weapon, 0, FT / 0.001)
		elseif DTInt3 == 0 or DTInt3 == 3 then
			CurAlpha_Weapon = math.Approach(CurAlpha_Weapon, 255, FT / 0.001)
		end

		if self.Weapon.VElements and self.Weapon.VElements["aimpoint"] != nil then
			if self.Weapon.VElements["aimpoint"].color.a == 255 and DTInt3 == 1 then
				self.Weapon.VElements["aimpointdot"].color.a = 255 - CurAlpha_Weapon
			else
				self.Weapon.VElements["aimpointdot"].color.a = math.Approach(self.Weapon.VElements["aimpointdot"].color.a, 0, 10)
			end
		end
		
		if self.Weapon.VElements and self.Weapon.VElements["acog"] != nil then
			if self.Weapon.VElements["acog"].color.a == 255 and DTInt3 == 1 then
				self.Weapon.VElements["acogdot"].color.a = 255 - CurAlpha_Weapon
			else
				self.Weapon.VElements["acogdot"].color.a = math.Approach(self.Weapon.VElements["acogdot"].color.a, 0, 10)
			end
		end
		
		if self.Weapon.VElements and self.Weapon.VElements["eotech"] != nil then
			if self.Weapon.VElements["eotech"].color.a == 255 and DTInt3 == 1 then
				self.Weapon.VElements["eotechdot"].color.a = 255 - CurAlpha_Weapon
			else
				self.Weapon.VElements["eotechdot"].color.a = math.Approach(self.Weapon.VElements["eotechdot"].color.a, 0, 10)
			end
		end
		
		gap = Lerp(0.2, gap, 50 * scale)//math.Approach(gap, 50 * scale, 1.5 + gap * 0.1)
		
		if GetConVarNumber("cstm_dynamiccrosshair") > 0 then
			gap2 = gap
		else
			gap2 = 0
		end
	
		if DTInt3 != 8 then
			if self.Weapon.VElements and (self.Weapon.VElements["eotech"] and self.Weapon.VElements["eotech"].color.a != 0) or (self.Weapon.VElements and self.Weapon.VElements["acog"] and self.Weapon.VElements["acog"].color.a != 0) then
				return
			end
		
			surface.SetDrawColor(0, 0, 0, CurAlpha_Weapon * 2.55)
			surface.DrawRect(x - gap - 11 - (gap2 * 0.4), y - 1, 12 + (gap2 * 0.4), 3)
			surface.SetDrawColor(255, 255, 255, CurAlpha_Weapon * 2.55)
			surface.DrawRect(x - gap - 10 - (gap2 * 0.4), y, 10 + (gap2 * 0.4), 1)
			
			surface.SetDrawColor(0, 0, 0, CurAlpha_Weapon * 2.55)
			surface.DrawRect(x + gap, y - 1, 12 + (gap2 * 0.4), 3)
			surface.SetDrawColor(255, 255, 255, CurAlpha_Weapon * 2.55)
			surface.DrawRect(x + gap + 1, y, 10 + (gap2 * 0.4), 1)

			surface.SetDrawColor(0, 0, 0, CurAlpha_Weapon * 2.55)
			surface.DrawRect(x - 1, y + gap - 1, 3, 12 + (gap2 * 0.4))
			surface.SetDrawColor(255, 255, 255, CurAlpha_Weapon * 2.55)
			surface.DrawRect(x , y + gap, 1, 10 + (gap2 * 0.4))

			surface.SetDrawColor(0, 0, 0, CurAlpha_Weapon * 2.55)
			surface.DrawRect(x - 1, y - gap - 11 - (gap2 * 0.4), 3, 12 + (gap2 * 0.4))
			surface.SetDrawColor(255, 255, 255, CurAlpha_Weapon * 2.55)
			surface.DrawRect(x, y - gap - 10 - (gap2 * 0.4), 1, 10 + (gap2 * 0.4))

		else
			surface.SetDrawColor(255, 255, 255, 255)
			surface.SetTexture(GLTexture)
			surface.DrawTexturedRect(Width / 2 - 64, Height / 2, 128, 128)
		end
	end
end

local HideModel = false

function SWEP:SecondaryAttack()
	if self.Weapon:GetDTInt(3) == 2 or not self.Owner:OnGround() or self.Weapon.IsReloading == true or self.Owner:KeyDown(IN_SPEED) or self.Weapon.ShouldBolt == true then
		return
	end

	if ( self.NextSecondaryAttack > CurTime() ) then return end
	
	if self.Owner:KeyDown(IN_USE) and self.Weapon:GetDTInt(3) != 1 then
		if self.Weapon.CantSilence == true then
			return
		end
	
		if self.Weapon.IsSilenced == false then
			
			if SERVER then
				self.Weapon:SetDTInt(3, 6)
				
				timer.Simple(0.5, function()
					if self.Weapon == nil then
						return
					end
					
					self.Owner:EmitSound("weapons/usp/usp_silencer_on.wav", 50, math.random(99, 101))
					self.Owner:DoAnimationEvent(ACT_ITEM_GIVE)
				end)
				
				timer.Simple(2, function()
					if self.Weapon == nil then
						return
					end
					
					self.Weapon:NWAlpha(255)
					self.Weapon.IsSilenced = true
					self.Weapon:SetDTInt(3, 7)
				end)
			end
			
		else
			if SERVER then
				self.Weapon:SetDTInt(3, 6)
				
				timer.Simple(0.5, function()
					if self.Weapon == nil then
						return
					end
					
					self.Owner:EmitSound("weapons/usp/usp_silencer_off.wav", 50, math.random(99, 101))
					self.Owner:DoAnimationEvent(ACT_ITEM_GIVE)
				end)
				
				timer.Simple(1.8, function()
					if self.Weapon == nil then
						return
					end
					
					self.Weapon:NWAlpha(0)
					self.Weapon.IsSilenced = false
					self.Weapon:SetDTInt(3, 7)
				end)
			end
			
		end
		self.Weapon:SetNextPrimaryFire(CurTime() + 2.35)
		self.Weapon:SetNextSecondaryFire(CurTime() + 2.35)
		self.Weapon.ReloadDelay = CurTime() + 2.35
		self.Owner.AttachDelay = CurTime() + 2.35
		return
	end
	
	if (self.Weapon:GetDTInt(3) == 0 or self.Weapon:GetDTInt(3) == 3 or self.Weapon:GetDTInt(3) == 7) and self.Weapon.ScopeStatus != 1 then
	
		if SERVER then
		
			if self.Weapon.Grenade then
				self.Weapon:SetDTInt(3, 8)
			else
				self.Weapon:SetDTInt(3, 1)
			end
		
			if self.Weapon.ScopeStatus >= 2 and not self.Weapon.Grenade then
				if tonumber(self.Owner:GetInfo("ta_oldacog")) <= 0 then 
					local fov
					local ScopeStatus = self.Weapon.ScopeStatus
					
					if ScopeStatus == 0 then
						fov = 75
					elseif ScopeStatus == 3 then
						fov = 67
					elseif ScopeStatus == 9 then
						fov = 72
					elseif ScopeStatus == 4 then
						fov = 72
					else
						fov = 67
					end
				
					self.Owner:SetFOV(fov, 0.3)
				else
				
					self.Owner:SetFOV(40, 0.3)
					
					if self.Weapon.ScopeStatus == 2 then
						self.Owner:SetFOV(40, 0.3)
						
						timer.Simple(0.15, function()
							if self.Weapon != self.Owner:GetActiveWeapon() or self.Weapon:GetDTInt(3) != 1 then
								return
							end
							
							self.Owner:DrawViewModel(false)
							
						end)
					else
						local fov
						local ScopeStatus = self.Weapon.ScopeStatus
						
						if ScopeStatus == 0 then
							fov = 75
						elseif ScopeStatus == 3 then
							fov = 67
						elseif ScopeStatus == 9 then
							fov = 72
						elseif ScopeStatus == 4 then
							fov = 72
						else
							fov = 67
						end
					
						self.Owner:SetFOV(fov, 0.3)
					end
				end
				
			else
				self.Owner:SetFOV(75, 0.3)
			end
			
		end
	elseif self.Weapon:GetDTInt(3) == 1 or self.Weapon:GetDTInt(3) == 8 then
		self.Weapon:SetDTInt(3, 0)
		if SERVER then
			self.Owner:SetFOV(0, 0.3)
			self.Owner:DrawViewModel(true)
		end
	end
	
	self.Weapon:SetNextPrimaryFire(CurTime() + 0.2)
	self.NextSecondaryAttack = CurTime() + 0.3
	
end

function SWEP:OnRestore()
end

if SERVER then
	function SWEP:Melee(ply, wep)

		if CurTime() < wep.MeleeDelay or ply.CloakOn then
			return
		end
		
		wep:SetDTInt(3, 15)
		
		wep.MeleeDelay = CurTime() + 0.5
		wep.ReloadDelay = CurTime() + 0.5
		wep.AttachDelay = CurTime() + 0.5
		wep:SetNextPrimaryFire(CurTime() + 0.5)
		wep:SetNextSecondaryFire(CurTime() + 0.5)
		
		ply:EmitSound("npc/fast_zombie/claw_miss1.wav", 80, 100)
		ply:ViewPunch(Angle(-5, 10, 0))
		
		timer.Simple(0.1, function()
		
			if not wep or not ply or ply:GetActiveWeapon():GetClass() != wep:GetClass() then
				return
			end
			
			local tr = {}
			tr.start = ply:GetShootPos()
			tr.endpos = tr.start + ply:GetAimVector() * 50
			tr.filter = ply
			tr.mins = Vector(-8, -8, -8)
			tr.maxs = Vector(8, 8, 8)
			
			local trace = util.TraceHull(tr)
			
			if trace.Hit then
			
				local physobj = trace.Entity:GetPhysicsObject()
					
				if physobj:IsValid() then
					physobj:AddVelocity(ply:GetAimVector() * 250)
				end
					
				if trace.Entity:IsPlayer() or trace.Entity:IsNPC() or trace.Entity:Health() > 0 then
					local dmginfo = DamageInfo()
					dmginfo:SetDamage(math.random(wep.MeleeDamageMin, wep.MeleeDamageMax))
					dmginfo:SetDamageType(DMG_CLUB)
					dmginfo:SetAttacker(ply)
					dmginfo:SetInflictor(wep)
					trace.Entity:TakeDamageInfo(dmginfo)
					
					if trace.Entity:IsNPC() then
						trace.Entity:SetVelocity(ply:GetForward() * 2000)
					end
				end
				
				ply:EmitSound("physics/body/body_medium_impact_hard" .. math.random(1, 6) .. ".wav", 80, 100)
			end
			
		end)
		
		timer.Simple(0.25, function()
			wep:SetDTInt(3, 0)
		end)
	end

	concommand.Add("cstm_melee", function(ply)
		local wep = ply:GetActiveWeapon()
		
		if wep.IsCustomWeapon and wep:GetDTInt(3) == 0 then
			wep:Melee(ply, wep)
		end
	end)
end