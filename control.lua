local emitter = "gun-nano-emitter"
local constructionAmmo = "ammo-nano-constructors"
local termiteAmmo = "ammo-nano-termites"
local constructionStacks = "nanobots-start-construction"
local termiteStacks = "nanobots-start-termite"

-- Add robots to a player's inventory
local function addBots(event)
    local player = game.players[event.player_index]
    if not player.get_main_inventory() then return end

    local itemPrototypes = game.item_prototypes
    if not itemPrototypes[emitter] then return end

    local constructionStacks = settings.global[constructionStacks].value
    if constructionStacks > 0 and itemPrototypes[constructionAmmo] then
        player.insert {name = emitter, 1}
        player.insert {
            name = constructionAmmo,
            count = itemPrototypes[constructionAmmo].stack_size *
                constructionStacks
        }
    end
    local termiteStacks = settings.global[termiteStacks].value
    if termiteStacks > 0 and itemPrototypes[termiteAmmo] then
        player.insert {name = emitter, 1}
        player.insert {
            name = termiteAmmo,
            count = itemPrototypes[termiteAmmo].stack_size * termiteStacks
        }
    end
end

-- When a new player is created
local function on_player_created(event) addBots(event) end

-- When the cutscene is cancelled
local function on_cutscene_cancelled(event)
    if remote.interfaces["freeplay"] then -- Handle freeplay cutscene
        addBots(event)
    end
end

-- Hook up to the Factorio events
script.on_event(defines.events.on_player_created, on_player_created)
script.on_event(defines.events.on_cutscene_cancelled, on_cutscene_cancelled)
