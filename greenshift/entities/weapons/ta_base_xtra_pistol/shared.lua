
if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
	SWEP.ScopeStatus = 0

end

if ( CLIENT ) then

	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 70
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true
	SWEP.DrawWeaponInfoBox  = true
	SWEP.HasInstalledScope  = false
	SWEP.Silenced = 0
	SWEP.PitchMod = 1
	SWEP.RollMod = 1
	
	language.Add("striderminigun_ammo", "7.62x39MM Ammo")
	language.Add("combinecannon_ammo", ".50AE Ammo")
	language.Add("airboatgun_ammo", "5.56x45MM NATO Ammo")
	language.Add("sniperround_ammo", ".338 Lapua Magnum Ammo")
	language.Add("sniperpenetratedround_ammo", "7.62x51MM NATO Ammo")
	language.Add("alyxgun_ammo", "5.7x28MM Ammo")
	language.Add("helicoptergun_ammo", ".45 ACP Ammo")
	language.Add("gaussenergy_ammo", "9x39MM Ammo")
	language.Add("gravity_ammo", "9x18MM Ammo")

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
SWEP.Base = "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

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

SWEP.ConeAff3 = 0
SWEP.ConeInaccuracy = 0
SWEP.ConeInaccuracyDec = 0
SWEP.SilencedSound = Sound("weapons/usp/usp1.wav")
SWEP.SilencedVolume = 70
SWEP.HoldType = "pistol"
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
         
        // init view model bone build function
	end
end

function SWEP:Deploy()
	if SERVER then
		local time = CurTime()
		
		if self.Weapon.IsSilenced then
			self.Weapon:SendWeaponAnim(ACT_VM_DRAW_SILENCED)
		else
			self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		end
		
		self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.DrawSpeed)

		self.Weapon:SetNextSecondaryFire(time + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.DrawSpeed)
		self.Weapon:SetNextPrimaryFire(time + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.DrawSpeed)
		self.Weapon.ReloadDelay = time + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.DrawSpeed
		self.Weapon.MeleeDelay = time + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.DrawSpeed
	end
	
	return true
end

function SWEP:Think()	
	if SERVER then
	
		self.Primary.Cone = math.Clamp(self.CurCone + self.Weapon.ConeInaccuracy + ((self.Owner:GetVelocity():Length() / 10000) * (self.Weapon:GetDTInt(3) == 1 and self.Weapon.VelocitySensivity * 0.3 or self.Weapon.VelocitySensivity)) - (self.Weapon.ConeAff1 + self.Weapon.ConeAff3), 0.002, 0.15)
		self.Weapon:SetDTFloat(0, math.Clamp(self.Primary.Cone, 0.002, 0.12 * (1 - (self.Weapon.RecoilAff1 + self.Weapon.RecoilAff2))))
		
		if CurTime() > self.Weapon.ConeInaccDelay then
			self.Weapon.ConeInaccuracy = math.Clamp(self.Weapon.ConeInaccuracy - 0.0015, 0, 0.12 * self.Weapon.ConeInaccuracyAff1)
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
					self.Owner:DrawViewModel(true)
				end
			end
		end
		
	end
	
	if not self.Owner:KeyDown(IN_ATTACK) and self.Weapon.NumShots != 0 and self.Weapon.Burst then
		self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay * 2)
		self.Weapon.NumShots = 0
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
						
							if activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED" or activity == "ACT_VM_DETACH_SILENCER" or activity == "ACT_VM_ATTACH_SILENCER" or activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED" then
							
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
						
						if wep:Clip1() > 0 and (activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED" ) and wep.SkipIdle != true then
							TimeRel = (seqdur * (1 - wep.IncAmmoPerc)) / PlaybackRate
							TimeIdle = (seqdur * (1 - wep.IncAmmoPerc)) / PlaybackRate
						elseif activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED" then
							TimeRel = seqdur * (1 - 0.4) / PlaybackRate
							TimeIdle = seqdur / PlaybackRate
						else
							TimeRel = (seqdur - (0.5 / PlaybackRate)) / PlaybackRate
							TimeIdle = (seqdur / PlaybackRate) - (0.01 / PlaybackRate)
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
						
							if wep.Silenced == 1 then
								wep:SendWeaponAnim(ACT_VM_IDLE_SILENCED)
							else
								wep:SendWeaponAnim(ACT_VM_IDLE)
							end
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

if CLIENT then
    function SWEP:ViewModelDrawn()
         
        local vm = self.Owner:GetViewModel()
        if !IsValid(vm) then return end
         
        if (!self.VElements) then return end
         
        if vm.BuildBonePositions ~= self.BuildViewModelBones then
            vm.BuildBonePositions = self.BuildViewModelBones
        end
 
        if (self.ShowViewModel == nil or self.ShowViewModel) then
            vm:SetColor(Color(255,255,255,255))
        else
            // we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
            vm:SetColor(Color(255,255,255,1))
        end
         
        if (!self.vRenderOrder) then
             
            // we build a render order because sprites need to be drawn after models
            self.vRenderOrder = {}
 
            for k, v in pairs( self.VElements ) do
                if (v.type == "Model") then
                    table.insert(self.vRenderOrder, 1, k)
                elseif (v.type == "Sprite" or v.type == "Quad") then
                    table.insert(self.vRenderOrder, k)
                end
            end
             
        end
 
        for k, name in ipairs( self.vRenderOrder ) do
         
            local v = self.VElements[name]
            if (!v) then self.vRenderOrder = nil break end
         
            local model = v.modelEnt
            local sprite = v.spriteMaterial
             
            if (!v.bone) then continue end
             
            local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
             
            if (!pos) then continue end
             
            if (v.type == "Model" and ValidEntity(model)) then
 
                model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
                ang:RotateAroundAxis(ang:Up(), v.angle.y)
                ang:RotateAroundAxis(ang:Right(), v.angle.p)
                ang:RotateAroundAxis(ang:Forward(), v.angle.r)
 
                model:SetAngles(ang)
                model:SetModelScale(v.size)
                 
                if (v.material == "") then
                    model:SetMaterial("")
                elseif (model:GetMaterial() != v.material) then
                    model:SetMaterial( v.material )
                end
                 
                if (v.skin and v.skin != model:GetSkin()) then
                    model:SetSkin(v.skin)
                end
                 
                if (v.bodygroup) then
                    for k, v in pairs( v.bodygroup ) do
                        if (model:GetBodygroup(k) != v) then
                            model:SetBodygroup(k, v)
                        end
                    end
                end
                 
                if (v.surpresslightning) then
                    render.SuppressEngineLighting(true)
                end
                 
                render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
                render.SetBlend(v.color.a/255)
                model:DrawModel()
                render.SetBlend(1)
                render.SetColorModulation(1, 1, 1)
                 
                if (v.surpresslightning) then
                    render.SuppressEngineLighting(false)
                end
                 
            elseif (v.type == "Sprite" and sprite) then
                 
                local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
                render.SetMaterial(sprite)
                render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
                 
            elseif (v.type == "Quad" and v.draw_func) then
                 
                local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
                ang:RotateAroundAxis(ang:Up(), v.angle.y)
                ang:RotateAroundAxis(ang:Right(), v.angle.p)
                ang:RotateAroundAxis(ang:Forward(), v.angle.r)
                 
                cam.Start3D2D(drawpos, ang, v.size)
                    v.draw_func( self )
                cam.End3D2D()
 
            end
             
        end
		
        local old
       
	   	if self.Weapon.VElements and self.Weapon.VElements["acog"] and self.Weapon.VElements["acog"].color.a == 255 and GetConVarNumber("ta_oldacog") <= 0 then
			cam.Start2D( )
				old = render.GetRenderTarget( )
				
				local CamData = {}
				CamData.angles = LocalPlayer():EyeAngles() + LocalPlayer():GetPunchAngle()
				CamData.origin = LocalPlayer():GetShootPos()
				CamData.x = 0
				CamData.y = 0
				CamData.w = 512
				CamData.h = 512
				CamData.fov = 5
				CamData.drawviewmodel = false
				CamData.drawhud = false
			
				render.SetRenderTarget( self.AcogRT )
				render.SetViewPort( 0, 0, 512, 512 )
				//render.Clear( 255, 000, 000, 255 )
				render.RenderView( CamData )
				render.SetViewPort( 0, 0, ScrW( ), ScrH( ) )
				render.SetRenderTarget( old )
			cam.End2D( )
		end
         
    end
end

function SWEP:StartCustomReload(anim, animspeed)
	if SERVER then
		if self.Weapon.IsSilenced then
			self.Weapon:SendWeaponAnim(ACT_VM_RELOAD_SILENCED)
		else
			self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
		end
	end
	
	self.Owner:GetViewModel():SetPlaybackRate(animspeed)
	if self.Weapon:Clip1() == 0 then
		self.Weapon.ShouldBolt = true
	end
		
	local time = (self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) - ((self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) * self.Weapon.IncAmmoPerc)
	timer.Create("StartCustomReloadTimer" .. self.Owner:Nick(), time, 1, function()
		if self.Weapon == nil or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
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
	self.Owner.ActionDelay = CurTime() + self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed
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
		
		if SERVER then
			if self.Weapon.SkipIdle != true then
				if self.Weapon.IsSilenced then
					self.Weapon:SendWeaponAnim(ACT_VM_IDLE_SILENCED)
				else
					self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
				end
				self.Weapon:SetNextPrimaryFire(CurTime() + 0.25)
				self.Weapon:SetNextSecondaryFire(CurTime() + 0.25)
				self.Weapon.ReloadDelay = CurTime() + 0.25
				self.Owner.AttachDelay = CurTime() + 0.25
				self.Owner.ActionDelay = CurTime() + 0.25
				self.Owner.WallRunDelay = CurTime() + 0.25
				self.Weapon.MeleeDelay = CurTime() + 0.25
			end
		end
	end
	
	if bolt == false or self.Weapon.NoBoltAnim == true then
		self.Weapon.ShouldBolt = false
	else
		self.Weapon:BoltWeaponry()
		self.Weapon.ShouldBolt = false
	end
end

local damagemod1, damagemod2 = 0

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
	
	self.Owner:FireBullets( bullet )
	
	if SERVER then
		if self.Weapon.IsSilenced then
			self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED) 		// View model animation
		else
			self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
			self.Owner:MuzzleFlash()	
		end
		self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.PlaybackRate or 1)
	end
	
	self.Owner:SetAnimation( PLAYER_ATTACK1 )				// 3rd Person Animation
	
	if ( self.Owner:IsNPC() ) then return end
	
	// CUSTOM RECOIL !
	if ( (game.SinglePlayer() && SERVER) || ( !game.SinglePlayer() && CLIENT && IsFirstTimePredicted() ) ) then
	
		local eyeang = self.Owner:EyeAngles()
		eyeang.pitch = eyeang.pitch - (recoil * 1 * 0.5)
		eyeang.yaw = eyeang.yaw - (recoil * math.random(-1, 1) * 0.25)
		self.Owner:SetEyeAngles( eyeang )
	
	end
end


if CLIENT then
	function SWEP:FireAnimationEvent(pos, ang, ev)
		if ev == 5001 then
			if not self.Owner:ShouldDrawLocalPlayer() then
				local vm = self.Owner:GetViewModel()
				local muz = vm:GetAttachment("1")
				
				if not self.Weapon.Em then
					self.Weapon.Em = ParticleEmitter(muz.Pos)
				end
				
				if GetConVarNumber("ta_ef_smoke") > 0 then
					ParticleEffect(self.Weapon.SmokeEffect or "cstm_child_smoke_small", muz.Pos, self.Owner:EyeAngles(), muz)
				end
				
				if self.Weapon.Silenced == 0 then -- I check if it's not nil and then if it's nil to ensure that weapons that don't have a silencer don't bug
					if GetConVarNumber("ta_ef_heat") > 0 then
						local par = self.Weapon.Em:Add("sprites/heatwave", muz.Pos)
						par:SetStartSize(8)
						par:SetEndSize(4)
						par:SetDieTime(0.3)
					end
					
					if GetConVarNumber("ta_ef_extramuzzle") > 0 then
						ParticleEffectAttach(self.Weapon.Muzzle or "cstm_muzzle_pistol", PATTACH_POINT_FOLLOW, vm, vm:LookupAttachment("1"))
					end
					
					if GetConVarNumber("ta_ef_sparks") > 0 then
						ParticleEffectAttach(self.Weapon.SparkEffect or "cstm_child_sparks_small", PATTACH_POINT_FOLLOW, vm, vm:LookupAttachment("1"))
					end
				end
				
				if self.Weapon.Silenced == 1 then
					return ev == 5001
				end
			end
		end
	end

	local function SilenceWeapon(um)
		local wep = um:ReadEntity()
		
		if IsValid(wep) then
			wep.Silenced = um:ReadShort()
		end
	end
	
	usermessage.Hook("SILWEP", SilenceWeapon)
	
	function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
		surface.SetDrawColor(255, 210, 0, 255)
		surface.SetTexture(self.WepSelectIcon)
		surface.DrawTexturedRect(x + 56, y, 128, 128)
		//draw.SimpleText( self.WepSelectIcon, "CSSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )
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
				self.Weapon:SendWeaponAnim(ACT_VM_ATTACH_SILENCER)
				self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration() - 0.2)
				self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration() - 0.2)
				
				timer.Simple(1, function()
					if self.Weapon == nil then
						return
					end
					
					self.Weapon.IsSilenced = true
					self.Weapon.IdleAnim = ACT_VM_IDLE_SILENCED
					umsg.Start("SILWEP")
						umsg.Entity(self)
						umsg.Short(1)
					umsg.End()
				end)
				
			end
			
		else
			if SERVER then
				self.Weapon:SendWeaponAnim(ACT_VM_DETACH_SILENCER)
				self.Weapon:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration() - 0.2)
				self.Weapon:SetNextSecondaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration() - 0.2)
				
				timer.Simple(1, function()
					if self.Weapon == nil then
						return
					end
					
					self.Weapon.IsSilenced = false
					self.Weapon.IdleAnim = ACT_VM_IDLE
					umsg.Start("SILWEP")
						umsg.Entity(self)
						umsg.Short(0)
					umsg.End()
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
