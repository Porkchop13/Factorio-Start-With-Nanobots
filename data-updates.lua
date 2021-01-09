local Recipe = require('__stdlib__/stdlib/data/recipe')
local Technology = require('__stdlib__/stdlib/data/technology')

if settings.startup["nanobots-start-unlocked"].value then
    data.raw.technology["nanobots"].hidden = true
    Technology('nano-speed-1'):remove_prereq('nanobots')
    Technology('nano-range-1'):remove_prereq('nanobots')
    Recipe('gun-nano-emitter'):set_enabled(true)
    Recipe('ammo-nano-constructors'):set_enabled(true)
    Recipe('ammo-nano-termites'):set_enabled(true)
end
