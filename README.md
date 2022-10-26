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

## 🛠️ Spawning a sound
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
