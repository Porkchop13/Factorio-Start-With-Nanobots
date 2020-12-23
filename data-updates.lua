local Recipe = require('__stdlib__/stdlib/data/recipe')

if settings.startup["nanobots-start-unlocked"].value then
    data.raw.technology["nanobots"].hidden = true
    Recipe('gun-nano-emitter'):set_enabled(true)
    Recipe('ammo-nano-constructors'):set_enabled(true)
    Recipe('ammo-nano-termites'):set_enabled(true)
end
