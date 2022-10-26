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
local mySound = CreateSound(location, asset, duration, is_2D_sound?, auto_destroy?, sound_type?, volume?, pitch?, inner_radius?, falloff_distance?, attenuation_function?, keep_playing_when_silent?, loop_mode?)
```
| Constructor Name  | Type |
| ------------- | ------------- |
| location | Vector  |
| asset  | string  |
| duration  | number / nil  |
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

## 🔧 Scripting functions

## 📢 Scripting events

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
