local Sounds = {}

sound = {}
sound.__index = sound

-- Class for playing in-game 2D and 3D sounds.
---@param location Vector
---@param asset string
---@param duration number | nil
---@param UpdateElapsedTime boolean
---@param is_2D_sound? boolean
---@param auto_destroy? boolean
---@param sound_type? SoundType
---@param volume? number
---@param pitch? number
---@param inner_radius? number
---@param falloff_distance? number
---@param attenuation_function? AttenuationFunction
---@param keep_playing_when_silent? boolean
---@param loop_mode? SoundLoopMode
---@return Sound
function CreateSound(location, asset, duration, UpdateElapsedTime, is_2D_sound, auto_destroy, sound_type, volume, pitch, inner_radius, falloff_distance, attenuation_function, keep_playing_when_silent, loop_mode)
  local newSound = {}

  newSound.Values = {
    ["location"] = location or Vector(0,0,0),
    ["asset"] = asset or "",
    ["is_2D_sound"] = is_2D_sound or false,
    ["auto_destroy"] = auto_destroy or true,
    ["sound_type"] = sound_type or SoundType.SFX,
    ["volume"] = volume or 1,
    ["pitch"] = pitch or 1,
    ["inner_radius"] = inner_radius or 400,
    ["falloff_distance"] = falloff_distance or 3600,
    ["attenuation_function"] = attenuation_function or AttenuationFunction.Linear,
    ["keep_playing_when_silent"] = keep_playing_when_silent or false,
    ["loop_mode"] = loop_mode or SoundLoopMode.Default
    }
    newSound.duration = duration
    newSound.updateElapsedTime = UpdateElapsedTime

    if duration ~= nil then
      newSound.hasDuration = true
      newSound.nDur = 0
      SetupTimer(newSound, duration)
    else
      newSound.nDur = os.time(os.date("*t"))
      newSound.hasDuration = false
    end

    Sounds[#Sounds + 1] = newSound
    newSound.index = #Sounds

    newSound.Shared = {}
    newSound.ScriptingValues = {}
    BroadcastSound(newSound)
    InternalEventCall("Spawn", "Global", {newSound})

    return setmetatable(newSound, sound)
end
Package.Export("CreateSound", CreateSound)

function sound:Remove()
  Sounds[self.index] = nil
end


Player.Subscribe("Ready", function(pPlayer)
  if #Sounds == 0 then return end
  for k,v in pairs(Sounds) do
    if(v.updateElapsedTime == true) then
      if(v.timer ~= nil) then
        v.elapsedTime = Timer.GetElapsedTime(v.timer)
      end
    end
  end
  Events.CallRemote("UpdateSounds", pPlayer, Sounds)
end)

function UpdateSound(pPlayer, tSound)
  Events.CallRemote("SpawnSound", pPlayer, tSound.Values, tSound.Shared)
end

function BroadcastSound(tSound)
  if tSound.hasDuration == true or tSound.Values["loop_mode"] == SoundLoopMode.Forever then
    Events.BroadcastRemote("SpawnSound", tSound.Values, tSound.Shared)
    return
  end

  local players = Player.GetAll()
  if(#players ~= 0) then
    local player = players[1]
    players[1] = nil

    for k,v in pairs(players) do
      Events.CallRemote("SpawnSound", v, tSound.Values, tSound.Shared)
    end

    Events.CallRemote("SpawnSound", player, tSound.Values, tSound.Shared, tSound.index, true)
  end

end

Events.Subscribe("SetSoundDuration", function(pPlayer, iSoundIndex, fDuration)
  local sound = Sounds[iSoundIndex]
  if sound ~= nil then
    if sound.hasDuration == false then
      SetupTimer(sound, (fDuration * 1000) - (sound.fadeInDuration or 0))
      sound.duration = fDuration
      sound.hasDuration = true

      local now = os.time(os.date("*t"))
      sound.nDur = os.difftime(now, sound.nDur)
    end
  end
end)
-- DURATION

function SetupTimer(tSound, fDuration)
  local timer
  timer = Timer.SetTimeout(function()
    Sounds[tSound.index] = nil
    InternalEventCall("End", "Global", {tSound})
    InternalEventCall("End", tSound.index, {tSound})
  end, fDuration)
  tSound.timer = timer
end

Package.Require("SoundLibrary.lua")
Package.Require("SoundEvents.lua")
