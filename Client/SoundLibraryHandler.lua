Events.SubscribeRemote("C_PlaySound", function(iIndex, start_time)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:Play(start_time)
end)


Events.SubscribeRemote("C_StopSound", function(iIndex)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:Stop()
end)

Events.SubscribeRemote("C_FadeIn", function(iIndex, ...)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  C_FadeIn(sound, table.unpack(...))
end)

function C_FadeIn(sound, FadeInDuration, FadeVolumeLevel, Start_Time)
  sound:FadeIn(FadeInDuration, FadeVolumeLevel or 1, Start_Time or 0)
end

Events.SubscribeRemote("C_FadeOut", function(iIndex, ...)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  C_FadeOut(sound, table.unpack(...))
end)

function C_FadeOut(sound, FadeOutDuration, FadeVolumeLevel, DestroyAfterFadeout)
  sound:FadeOut(FadeOutDuration, FadeVolumeLevel or 0, DestroyAfterFadeout or false)
end

Events.SubscribeRemote("C_SetFalloffDistance", function(iIndex, fValue)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  C_SetFalloffDistance(sound, fValue)
end)

function C_SetFalloffDistance(sound, fNewFallOffDistance)
  sound:SetFalloffDistance(fNewFallOffDistance)
end

Events.SubscribeRemote("C_SetInnerRadius", function(iIndex, fValue)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  C_SetInnerRadius(sound, fValue)
end)

function C_SetInnerRadius(sound, fNewInnerRadius)
  sound:SetInnerRadius(fNewInnerRadius)
end

Events.SubscribeRemote("C_SetLowPassFilter", function(iIndex, fValue)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  C_SetLowPassFilter(sound, fValue)
end)

function C_SetLowPassFilter(sound, fFrequency)
  sound:SetLowPassFilter(fFrequency)
end

Events.SubscribeRemote("C_SetPaused", function(iIndex, bPause)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:SetPaused(bPause)
end)

Events.SubscribeRemote("C_SetPitch", function(iIndex, fPitch)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:SetPitch(fPitch)
end)

Events.SubscribeRemote("C_SetVolume", function(iIndex, fVolume)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:SetPitch(fVolume)
end)

Events.SubscribeRemote("C_SetLocation", function(iIndex, vLocation)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:SetLocation(vLocation)
end)

Events.SubscribeRemote("C_SetRotation", function(iIndex, vRotation)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:SetRotation(vRotation)
end)

Events.SubscribeRemote("C_SetRelativeLocation", function(iIndex, vLocation)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:SetRelativeLocation(vLocation)
end)

Events.SubscribeRemote("C_AttachTo", function(iIndex, ...)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  C_AttachTo(sound, ...)
end)

function C_AttachTo(sound, ...)
  sound:AttachTo(table.unpack(...))
end

Events.SubscribeRemote("C_Detach", function(iIndex)
  local sound = GetSoundByIndex(iIndex)
  if sound == nil then return end
  sound:Detach()
end)