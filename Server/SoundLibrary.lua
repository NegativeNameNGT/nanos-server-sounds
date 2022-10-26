-- Starts the sound
---@param start_time? number
function sound:Play(start_time)
  self.Shared["stopped"] = false
  Events.BroadcastRemote("C_PlaySound", self.index, start_time)

  InternalEventCall("Play", "Global", {self})
  InternalEventCall("Play", self.index, {self})
end

--Plays the sound with a fade effect
---@param FadeInDuration number
---@param FadeVolumeLevel? number
---@param Start_Time? number
function sound:FadeIn(FadeInDuration, FadeVolumeLevel, Start_Time)
  self.Shared["FadeIn"] = {FadeInDuration, FadeVolumeLevel, Start_Time}
  Events.BroadcastRemote("C_FadeIn", self.index, {FadeInDuration, FadeVolumeLevel, Start_Time})
  
  if(Start_Time) then
    if(self.hasDuration) then
      if(self.timer) then
        Timer.ClearTimeout(self.timer)
        SetupTimer(self, self.duration - Start_Time)
      end
    else
      self.fadeInDuration = Start_Time
    end
  end
end

--Stops the sound with a fade effect
---@param FadeOutDuration number
---@param FadeVolumeLevel? number
---@param DestroyAfterFadeout? boolean
function sound:FadeOut( FadeOutDuration, FadeVolumeLevel, DestroyAfterFadeout)
  self.Shared["FadeOut"] = {FadeOutDuration, FadeVolumeLevel, DestroyAfterFadeout}
  Events.BroadcastRemote("C_FadeOut", self.index, {FadeOutDuration, FadeVolumeLevel, DestroyAfterFadeout})
  if(DestroyAfterFadeout) then
    Timer.SetTimeout(function()
      self:Remove()
    end, FadeOutDuration)
  end
end

--If a 3D Sound, sets the distance which the sound is inaudible
---@param FalloffDistance number
function sound:SetFalloffDistance(FalloffDistance)
  if(self.Values["is_2D_sound"] == false) then
    self.Values["falloff_distance"] = FalloffDistance
    Events.BroadcastRemote("C_SetFalloffDistance", self.index, FalloffDistance)
  end
end

--If a 3D Sound, sets the distance within the volume is 100%
---@param InnerRadius number
function sound:SetInnerRadius(InnerRadius)
  if(self.Values["is_2D_sound"] == false) then
    self.Values["inner_radius"] = InnerRadius
    Events.BroadcastRemote("C_SetInnerRadius", self.index, InnerRadius)
  end
end

-- Sets lowpass filter frequency. Sets 0 to disable it.
---@param frequency number
function sound:SetLowPassFilter(frequency)
  self.Shared["lowpass_filter"] = frequency
  Events.BroadcastRemote("C_SetLowPassFilter", self.index, frequency)
end

--Pauses the sound
---@param pause boolean
function sound:SetPaused(pause)
  self.Shared["is_paused"] = pause
  Events.BroadcastRemote("C_SetPaused", self.index, pause)

  if(self.timer == nil) then return end
  if(pause) then
   Timer.Pause(self.timer)
  else
   Timer.Resume(self.timer)
  end
end

--Sets the Sound's pitch
---@param new_pitch number
function sound:SetPitch(new_pitch)
  self.Values["pitch"] = new_pitch
  Events.BroadcastRemote("C_SetPitch", self.index, new_pitch)
end


--Sets the Sound's volume
---@param new_volume number
function sound:SetVolume(new_volume)
  self.Values["volume"] = new_volume
  Events.BroadcastRemote("C_SetVolume", self.index, new_volume)
end

--Stops the sound
function sound:Stop()
  self.Shared["stopped"] = true
  Events.BroadcastRemote("C_StopSound", self.index)
end

--Stops the sound after the provided delay
---@param delay number
function sound:StopDelayed(delay)
  Timer.SetTimeout(function()
    self.Shared["stopped"] = true
    Events.BroadcastRemote("C_StopSound", self.index)
  end, delay)
end

--Destroys this sound
function sound:Destroy()
  sound:Remove()
  Events.BroadcastRemote("C_StopSound", self.index)

  InternalEventCall("Destroy", "Global", {self})
  InternalEventCall("Destroy", self.index, {self})
end

--[[
GETTERS FUNCTIONS
--]]

--Gets if the sound is 2D
---@return boolean
function sound:Is2D()
  return self.Values["is_2D_sound"]
end

--Gets if the sound is playing
---@return boolean
function sound:IsPlaying()
  if(self.Shared["stopped"] or self.Shared["is_paused"]) then return false else return true end
end

--Gets the duration of the sound
---@return number | nil
function sound:GetDuration()
  return self.duration
end

--Gets the pitch of the sound
---@return number
function sound:GetPitch()
  return self.Values["pitch"]
end

--Gets the volume of the sound
---@return number
function sound:GetVolume()
  return self.Values["volume"]
end

--Gets the low pass filter of the sound
---@return number
function sound:GetLowPassFilter()
  return self.Shared["lowpass_filter"]
end

--Gets the inner radius of the sound
---@return number
function sound:GetInnerRadius()
  return self.Values["inner_radius"]
end

--Gets the falloff distance of the sound
---@return number
function sound:GetFalloffDistance()
  return self.Values["falloff_distance"]
end

-- Gets the type of the sound
---@return number
function sound:GetSoundType()
  return self.Values["sound_type"]
end

--[[
ENTITY FUNCTIONS
--]]

-- Sets a value in this sound
---@param key string
---@param value any
function sound:SetValue(key, value)
  self.ScriptingValues[key] = value

  InternalEventCall("ValueChange", "Global", {self, key, value})
  InternalEventCall("ValueChange", self.index, {self, key, value})
  return self
end

-- Gets a value in this sound
---@return any
function sound:GetValue(key)
  return self.ScriptingValues[key]
end

-- Gets all values keys of this sound
---@return table
function sound:GetAllValuesKeys()
  local keys = {}
  for k,v in pairs(self.ScriptingValues) do
    keys[#keys+1] = k
  end
  return keys
end

--Sets this Sound's location in the game world
---@param new_location Vector
function sound:SetLocation(new_location)
  self.Values["location"] = new_location
  Events.BroadcastRemote("C_SetLocation", self.index, new_location)
end

--Gets this Sound's location in the game world
---@return Vector location
function sound:GetLocation()
  return self.Values["location"]
end

--Sets this Sound's rotation in the game world
---@param new_location Vector
function sound:SetRotation(new_location)
  self.Shared["rotation"] = new_location
  Events.BroadcastRemote("C_SetRotation", self.index, new_location)
end

--Gets this Sound's rotation in the game world
---@return Vector rotation
function sound:GetRotation()
  return self.Shared["rotation"] or Rotator()
end

--Sets this Sound's relative location (only if this sound is attached)
---@param new_location Vector
function sound:SetRelativeLocation(new_location)
  self.Shared["relative_location"] = new_location
  Events.BroadcastRemote("C_SetRelativeLocation", self.index, new_location)
end

--Gets this Sound's relative location (only if this sound is attached)
---@return Vector location
function sound:GetRelativeLocation()
  return self.Shared["relative_location"] or Vector()
end

--Attaches this Sound to any other Actor, optionally at a specific bone
---@param other Actor
---@param attachment_rule? AttachmentRule
---@param bone_name? string
---@param lifespan_when_detached? number
---@param use_absolute_rotation? boolean
function sound:AttachTo(other, attachment_rule, bone_name, lifespan_when_detached, use_absolute_rotation)
  local inTable = {other, attachment_rule, bone_name, lifespan_when_detached, use_absolute_rotation}
  self.Shared["attachment"] = inTable
  Events.BroadcastRemote("C_AttachTo", self.index, inTable)
end

--Detaches this Sound from AttachedTo Actor
function sound:Detach()
  self.Shared["attachment"] = nil
  Events.BroadcastRemote("C_Detach", self.index)
end

--Gets the Actor this Sound is attached to
---@return Actor | nil
function sound:GetAttachedTo()
  if(self.Shared["attachment"]) then
    return self.Shared["attachment"][1]
  end
end

--Gets the universal network ID of this Sound (same on both client and server)
---@return number
function sound:GetID()
  return self.index
end