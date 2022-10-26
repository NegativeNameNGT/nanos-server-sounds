# 🔊 Nanos World Serverside Sounds
Spawn sounds server side to have them synchronized across all players!

## ⏭️ Future updates
- Dimension support
- Synchronized sound elapsed time

## 📦 Installing the package
- Download it, extract it and add it in your server Packages file : YourServer/Packages/
- Open your server config file (Config.Toml) and reference the package in "packages" field.
```toml
    packages = [
        "nanos-serversidesounds",
    ]
```

## 🛠️ Sound Constructor
```lua
local mySound = CreateSound(location, asset, duration, bSynchronizeElapsedTime, is_2D_sound?, auto_destroy?, sound_type?, volume?, pitch?, inner_radius?, falloff_distance?, attenuation_function?, keep_playing_when_silent?, loop_mode?)
```
| Constructor Name  | Type |
| ------------- | ------------- |
| location | Vector  |
| asset  | string  |
| duration  | number / nil  |
| bSynchronizeElapsedTime  | boolean  |
| is_2D_sound?  | boolean  |
| auto_destroy?  | boolean |
| sound_type?  | SoundType  |
| volume?  | number  |
| pitch?  | number  |
| inner_radius?  | number  |
| falloff_distance?  | number  |
| attenuation_function?  | AttenuationFunction  |
| keep_playing_when_silent?  | boolean  |
| loop_mode?  | SoundLoopMode  |

# 🔧 Scripting functions

### `sound:Play`
#### Starts the sound (the sound automatically plays when constructed)
```lua
sound:Play(start_time?)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number              | 

### `sound:Stop`
#### Stops the sound
```lua
sound:Stop()
```

### `sound:StopDelayed`
#### Stops the sound after the provided delay
```lua
sound:StopDelayed(delay)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number              | 

### `sound:Destroy`
#### Destroys this sound
```lua
sound:Destroy()
```

### `sound:FadeIn`
#### Plays the sound with a fade effect
```lua
sound:FadeIn(FadeInDuration, FadeVolumeLevel?, Start_Time?)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number              | 
| number              | 
| number              | 

### `sound:FadeOut`
#### Stops the sound with a fade effect
```lua
sound:FadeOut(FadeOutDuration, FadeVolumeLevel?, DestroyAfterFadeout?)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number              | 
| number              | 
| boolean              | 

### `sound:SetFalloffDistance`
#### If a 3D Sound, sets the distance which the sound is inaudible
```lua
sound:SetFalloffDistance(FalloffDistance)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number              | 

### `sound:SetInnerRadius`
#### If a 3D Sound, sets the distance within the volume is 100%
```lua
sound:SetInnerRadius(InnerRadius)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number              | 

### `sound:SetLowPassFilter`
#### Sets lowpass filter frequency. Sets 0 to disable it.
```lua
sound:SetLowPassFilter(frequency)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number              | 

### `sound:SetPaused`
#### Pauses or resumes the sound
```lua
sound:SetPaused(pause)
```
| Type                  | Description  |
| --------------------  |:------------- 
| boolean              | 

### `sound:SetPitch`
#### Sets the Sound's pitch
```lua
sound:SetPitch(new_pitch)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             | 

### `sound:SetVolume`
#### Sets the Sound's volume
```lua
sound:SetVolume(new_volume)
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             | 0-1

### `sound:SetLocation`
#### Sets this Sound's location in the game world
```lua
sound:SetLocation(new_location)
```
| Type                  | Description  |
| --------------------  |:------------- 
| Vector             | the new location

### `sound:GetLocation`
#### Gets this Sound's location in the game world
```lua
local location = sound:GetLocation()
```
| Type                  | Description  |
| --------------------  |:------------- 
| Vector             | the location of the sound

### `sound:SetRotation`
#### Sets this Sound's rotation in the game world
```lua
sound:SetRotation(new_rotation)
```
| Type                  | Description  |
| --------------------  |:------------- 
| Rotator             | the new rotation

### `sound:GetRotation`
#### Gets this Sound's rotation in the game world
```lua
local rotation = sound:GetRotation()
```
| Type                  | Description  |
| --------------------  |:------------- 
| Rotator             | the rotation of the sound

### `sound:SetRelativeLocation`
#### Sets this Sound's relative location (only if this sound is attached)
```lua
sound:SetRelativeLocation(new_relative_location)
```
| Type                  | Description  |
| --------------------  |:------------- 
| Vector             | the new relative location

### `sound:GetRelativeLocation`
#### Gets this Sound's relative location (only if this sound is attached)
```lua
local relative_location = sound:GetRelativeLocation()
```
| Type                  | Description  |
| --------------------  |:------------- 
| Vector             | the relative location of the sound

### `sound:AttachTo`
#### Attaches this Sound to any other Actor, optionally at a specific bone
```lua
sound:AttachTo(other, attachment_rule, bone_name, lifespan_when_detached, use_absolute_rotation)
```
| Type                  | Description  |
| --------------------  |:------------- 
| Actor             | 
| AttachmentRule             | 
| string             | 
| number             | 
| boolean             | 

### `sound:Detach`
#### Detaches this Sound from AttachedTo Actor
```lua
sound:Detach()
```

### `sound:GetAttachedTo`
#### Gets the Actor this Sound is attached to
```lua
local ret = sound:GetAttachedTo()
```
| Type                  | Description  |
| --------------------  |:------------- 
| Actor / nil             | 

### `sound:GetID`
#### Gets the universal network ID of this Sound (same on both client and server)
```lua
local id = sound:GetID()
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             | 

### `sound:SetValue`
#### Sets a value in this sound
```lua
sound:SetValue(key, value)
```
| Type                  | Description  |
| --------------------  |:------------- 
| string             | 
| any             | 

### `sound:GetValue`
#### Gets a value in this sound
```lua
local value = sound:GetValue(key)
```
| Type                  | Description  |
| --------------------  |:------------- 
| any             |

### `sound:GetAllValuesKeys`
#### Gets all values keys of this sound
```lua
local value = sound:GetAllValuesKeys()
```
| Type                  | Description  |
| --------------------  |:------------- 
| table of strings             |


### `sound:GetPitch`
#### Gets the pitch of the sound
```lua
local pitch = sound:GetPitch()
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             |

### `sound:GetVolume`
#### Gets the volume of the sound
```lua
local volume = sound:GetVolume()
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             |

### `sound:Is2D`
#### Gets if the sound is 2D
```lua
local ret = sound:Is2D()
```
| Type                  | Description  |
| --------------------  |:------------- 
| boolean             |

### `sound:IsPlaying`
#### Gets if the sound is playing
```lua
local ret = sound:IsPlaying()
```
| Type                  | Description  |
| --------------------  |:------------- 
| boolean             |

### `sound:GetDuration`
#### Gets the duration of the sound
```lua
local duration = sound:GetDuration()
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             |

### `sound:GetLowPassFilter`
#### Gets the low pass filter of the sound
```lua
local filter = sound:GetLowPassFilter()
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             |

### `sound:GetInnerRadius`
#### Gets the inner radius of the sound
```lua
local inner_radius = sound:GetInnerRadius()
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             |

### `sound:GetFalloffDistance`
#### Gets the falloff distance of the sound
```lua
local falloff_distance = sound:GetFalloffDistance()
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             |

### `sound:GetSoundType`
#### Gets the type of the sound
```lua
local sound_type = sound:GetSoundType()
```
| Type                  | Description  |
| --------------------  |:------------- 
| number             |



# 📢 Scripting events

### `sound:Spawn`
#### Triggered when a Sound is spawned/created
```lua
Sound.Subscribe("Spawn", function(self)

end)
```
| Type                  | Description  |
| --------------------  |:------------- 
| sound              | The sound that was spawned

### `sound:Destroy`
#### Triggered when a Sound is destroyed
```lua
Sound.Subscribe("Destroy", function(self)

end)
```
| Type                  | Description  |
| --------------------  |:------------- 
| sound              | The sound that was destroyed

### `sound:ValueChange`
#### Triggered when a Sound has a value changed with :SetValue()
```lua
Sound.Subscribe("ValueChange", function(self, key, value)

end)
```
| Type                  | Description  |
| --------------------  |:------------- 
| sound             | The Sound that just had a value changed
| string             | 	The key used
| any             | 	The value that was set

### `sound:Play`
#### Triggered when a Sound plays a sound with :Play()
```lua
Sound.Subscribe("Play", function(self)

end)
```
| Type                  | Description  |
| --------------------  |:------------- 
| sound             | The Sound that was played

### `sound:End`
#### Triggered when a Sound reaches the end
```lua
Sound.Subscribe("End", function(self)

end)
```
| Type                  | Description  |
| --------------------  |:------------- 
| sound             | The Sound that reached its end
