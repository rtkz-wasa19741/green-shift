if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
    SWEP.AcogGlass = Material( "models/wystan/attachments/acog/lense" )
    --SWEP.AcogRT = GetRenderTarget( "acog_glass_rt", 512, 512, false )
    --SWEP.AcogGlass:SetMaterialTexture( "$basetexture", SWEP.AcogRT )
end

function SWEP:Initialize()
 
    // other initialize code goes here
 
    if CLIENT then
     
        self:CreateModels(self.VElements) // create viewmodels
        self:CreateModels(self.WElements) // create worldmodels
         
    end
 
end
 
 
function SWEP:OnRemove()
     
    // other onremove code goes here
     
    if CLIENT then
        self:RemoveModels()
    end
     
end
     
 
if CLIENT then
 
    SWEP.vRenderOrder = nil
    function SWEP:ViewModelDrawn()
         
        local vm = self.Owner:GetViewModel()
        if !IsValid(vm) then return end
         
        if (!self.VElements) then return end
         
        if vm.BuildBonePositions ~= self.BuildViewModelBones then
            vm.BuildBonePositions = self.BuildViewModelBones
        end
 
        if (self.ShowViewModel == nil or self.ShowViewModel) then
            vm:SetColor( Color(255,255,255,255) )
        else
            // we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
            vm:SetColor( Color(255,255,255,1) )
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
             
            if (v.type == "Model" and IsValid(model)) then
 
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
       
	   	if self.Weapon.VElements and self.Weapon.VElements["acog"] and self.Weapon.VElements["acog"].color.a == 255 and GetConVarNumber("cstm_oldacog") <= 0 then
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
 
    SWEP.wRenderOrder = nil
    function SWEP:DrawWorldModel()
         
        if (self.ShowWorldModel == nil or self.ShowWorldModel) then
            self:DrawModel()
        end
         
        if (!self.WElements) then return end
         
        if (!self.wRenderOrder) then
 
            self.wRenderOrder = {}
 
            for k, v in pairs( self.WElements ) do
                if (v.type == "Model") then
                    table.insert(self.wRenderOrder, 1, k)
                elseif (v.type == "Sprite" or v.type == "Quad") then
                    table.insert(self.wRenderOrder, k)
                end
            end
 
        end
         
        if (IsValid(self.Owner)) then
            bone_ent = self.Owner
        else
            // when the weapon is dropped
            bone_ent = self
        end
         
        for k, name in pairs( self.wRenderOrder ) do
         
            local v = self.WElements[name]
            if (!v) then self.wRenderOrder = nil break end
             
            local pos, ang
             
            if (v.bone) then
                pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
            else
                pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
            end
             
            if (!pos) then continue end
             
            local model = v.modelEnt
            local sprite = v.spriteMaterial
             
            if (v.type == "Model" and IsValid(model)) then
 
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
         
    end
 
    function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
         
        local bone, pos, ang
        if (tab.rel and tab.rel != "") then
             
            local v = basetab[tab.rel]
             
            if (!v) then return end
             
            // Technically, if there exists an element with the same name as a bone
            // you can get in an infinite loop. Let's just hope nobody's that stupid.
            pos, ang = self:GetBoneOrientation( basetab, v, ent )
             
            if (!pos) then return end
             
            pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
            ang:RotateAroundAxis(ang:Up(), v.angle.y)
            ang:RotateAroundAxis(ang:Right(), v.angle.p)
            ang:RotateAroundAxis(ang:Forward(), v.angle.r)
                 
        else
         
            bone = ent:LookupBone(bone_override or tab.bone)
 
            if (!bone) then return end
             
            pos, ang = Vector(0,0,0), Angle(0,0,0)
            local m = ent:GetBoneMatrix(bone)
            if (m) then
                pos, ang = m:GetTranslation(), m:GetAngles()
            end
             
            if (IsValid(self.Owner) and self.Owner:IsPlayer() and
                ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
                ang.r = -ang.r // Fixes mirrored models
            end
         
        end
         
        return pos, ang
    end
 
    function SWEP:CreateModels( tab )
 
        if (!tab) then return end
 
        // Create the clientside models here because Garry says we can't do it in the render hook
        for k, v in pairs( tab ) do
            if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and
                    string.find(v.model, ".mdl") and file.Exists("GAME", v.model) ) then
                 
                v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
                if (IsValid(v.modelEnt)) then
                    v.modelEnt:SetPos(self:GetPos())
                    v.modelEnt:SetAngles(self:GetAnglesss())
                    v.modelEnt:SetParent(self)
                    v.modelEnt:SetNoDraw(true)
                    v.createdModel = v.model
                else
                    v.modelEnt = nil
                end
                 
            elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite)
                and file.Exists("GAME", "materials/"..v.sprite..".vmt")) then
                 
                local name = v.sprite.."-"
                local params = { ["$basetexture"] = v.sprite }
                // make sure we create a unique name based on the selected options
                local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
                for i, j in pairs( tocheck ) do
                    if (v[j]) then
                        params["$"..j] = 1
                        name = name.."1"
                    else
                        name = name.."0"
                    end
                end
 
                v.createdSprite = v.sprite
                v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
                 
            end
        end
         
    end
 
    function SWEP:OnRemove()
        self:RemoveModels()
    end
 
    function SWEP:RemoveModels()
        if (self.VElements) then
            for k, v in pairs( self.VElements ) do
                if (IsValid( v.modelEnt )) then v.modelEnt:Remove() end
            end
        end
        if (self.WElements) then
            for k, v in pairs( self.WElements ) do
                if (IsValid( v.modelEnt )) then v.modelEnt:Remove() end
            end
        end
        self.VElements = nil
        self.WElements = nil
    end
 
end

local ActIndex = {
	[ "pistol" ] 		= ACT_HL2MP_IDLE_PISTOL,
	[ "smg" ] 			= ACT_HL2MP_IDLE_SMG1,
	[ "grenade" ] 		= ACT_HL2MP_IDLE_GRENADE,
	[ "ar2" ] 			= ACT_HL2MP_IDLE_AR2,
	[ "shotgun" ] 		= ACT_HL2MP_IDLE_SHOTGUN,
	[ "rpg" ]	 		= ACT_HL2MP_IDLE_RPG,
	[ "physgun" ] 		= ACT_HL2MP_IDLE_PHYSGUN,
	[ "crossbow" ] 		= ACT_HL2MP_IDLE_CROSSBOW,
	[ "melee" ] 		= ACT_HL2MP_IDLE_MELEE,
	[ "slam" ] 			= ACT_HL2MP_IDLE_SLAM,
	[ "normal" ]		= ACT_HL2MP_IDLE,
	[ "fist" ]			= ACT_HL2MP_IDLE_FIST,
	[ "melee2" ]		= ACT_HL2MP_IDLE_MELEE2,
	[ "passive" ]		= ACT_HL2MP_IDLE_PASSIVE,
	[ "knife" ]			= ACT_HL2MP_IDLE_KNIFE,
	[ "duel" ]      	= ACT_HL2MP_IDLE_DUEL,
	[ "revolver" ]		= ACT_HL2MP_IDLE_REVOLVER,
	[ "camera" ]		= ACT_HL2MP_IDLE_CAMERA
}
function SWEP:SetWeaponHoldType( t )

	t = string.lower( t )
	local index = ActIndex[ t ]

	if ( index == nil ) then
		Msg( "SWEP:SetWeaponHoldType - ActIndex[ \""..t.."\" ] isn't set! (defaulting to normal) (from "..self:GetClass()..")\n" )
		t = "normal"
		index = ActIndex[ t ]
	end

	self.ActivityTranslate = {}
	self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= index
	self.ActivityTranslate [ ACT_MP_WALK ] 						= index+1
	self.ActivityTranslate [ ACT_MP_RUN ] 						= index+2
	self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= index+3
	self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= index+4
	self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= index+5
	self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = index+5
	self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= index+6
	self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= index+6
	self.ActivityTranslate [ ACT_MP_JUMP ] 						= index+7
	self.ActivityTranslate [ ACT_RANGE_ATTACK1 ] 				= index+8
	self.ActivityTranslate [ ACT_MP_SWIM_IDLE ] 				= index+8
	self.ActivityTranslate [ ACT_MP_SWIM ] 						= index+9

	-- "normal" jump animation doesn't exist
	if t == "normal" then
		self.ActivityTranslate [ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM
	end

	-- these two aren't defined in ACTs for whatever reason
	if t == "knife" or t == "melee2" then
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] = nil
	end
end
--SWEP:SetWeaponHoldType("pistol")
function SWEP:TranslateActivity(act)
	return self.ActivityTranslate and self.ActivityTranslate[act] or -1
end