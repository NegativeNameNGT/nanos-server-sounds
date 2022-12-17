local all_sounds = {}

Events.Subscribe("SpawnSound", function(tSound, tShared, iIndex, bSend)
  SpawnSound(tSound, tShared, iIndex, bSend)
end)

function GetSoundByIndex(iindex)
  return all_sounds[iindex]
end

function SpawnSound(tSound, tShared, iIndex, bSend, bUpdateElapsedTime, fElapsedTime)
  local serverSound = Sound(
    tSound["location"], -- Location (if a 3D sound)
    tSound["asset"], -- Asset Path
    tSound["is_2D_sound"], -- Is 2D Sound
    tSound["auto_destroy"], -- Auto Destroy (if to destroy after finished playing)
    tSound["sound_type"],
    tSound["volume"], -- Volume
    tSound["pitch"], -- Pitch
    tSound["inner_radius"],
    tSound["falloff_distance"],
    tSound["attenuation_function"],
    tSound["keep_playing_when_silent"],
    tSound["loop_mode"]
  )
  if(bUpdateElapsedTime) then
    if(fElapsedTime ~= nil) then
      serverSound:Play((fElapsedTime / 1000))
    end
  end
  UpdateShared(serverSound, tShared)

  if(bSend == true) then
    Events.CallRemote("SetSoundDuration", iIndex, serverSound:GetDuration())
  end
  all_sounds[iIndex] = serverSound
end

function UpdateShared(Sound, tShared)
  if(tShared["FadeIn"]) then
    C_FadeIn(Sound, table.unpack(tShared["FadeIn"]))
  end

  if(tShared["FadeOut"]) then
    C_FadeOut(Sound, table.unpack(tShared["FadeOut"]))
  end

  if(tShared["lowpass_filter"]) then
    C_SetLowPassFilter(Sound, tShared["lowpass_filter"])
  end

  if(tShared["is_paused"]) then
    Sound:SetPaused(tShared["is_paused"])
  end

  if(tShared["stopped"]) then
    Sound:Stop()
  end

  if(tShared["relative_location"]) then
    Sound:SetRelativeLocation(tShared["relative_location"])
  end

  if(tShared["rotation"]) then
    Sound:SetRotation(tShared["rotation"])
  end

  if(tShared["attachment"]) then
    C_AttachTo(Sound, tShared["attachment"])
  end
end

Events.SubscribeRemote("UpdateSounds", function(all_sounds)
  Timer.SetTimeout(function()
    for k,v in pairs(all_sounds) do
      local UpdateElapsedTime = false
      if(v.updateElapsedTime == true) then
        UpdateElapsedTime = true
      end
      SpawnSound(v.Values, v.Shared, v.index, not v.hasDuration, UpdateElapsedTime, v.elapsedTime)
    end
  end, 1000)
end)


Package.Require("SoundLibraryHandler.lua")
