local api = {}
api.Client = require(game:GetService"ReplicatedStorage".TS.remotes).default.Client
api.KnitClient = debug.getupvalue(require(game.Players.LocalPlayer.PlayerScripts.TS.knit).setup, 6)
api.self = game.Players.LocalPlayer
api.TweenService = game:GetService"TweenService"

api.Modules = {
    Sprint = require(
        game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers["global"].sprint["sprint-controller"]
    ).SprintController,
    ItemHandle = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1),
    BlockController2 = require(
        game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement[
            "block-placer"
        ]
    ).BlockPlacer,
    BlockController = require(
        game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out
    ).BlockEngine,
    BlockEngine = require(game.Players.LocalPlayer.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
    Shop = debug.getupvalue(
        debug.getupvalue(
            require(game.ReplicatedStorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem,
            1
        ),
        2
    ),
    Balloon = api.KnitClient.Controllers.BalloonController,
    Viewmodel = api.KnitClient.Controllers.ViewmodelController,
    ReachRequire = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant,
    InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil,
    ItemTable = debug.getupvalue(require(game.ReplicatedStorage.TS.item["item-meta"]).getItemMeta, 1),
    Knockback = debug.getupvalue(
        require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity,
        1
    )
}

api.Remotes = {
    AttackPacket = game:GetService"ReplicatedStorage".rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.SwordHit
}

function api:GetAliveState(who)
    if who.Character and who.Character:FindFirstChild "Humanoid" then
        if who.Character.Humanoid.Health > 0 and who.Character:FindFirstChild "HumanoidRootPart" then
            return true
        end
    end
end

function api:GetInventory(who)
    who = who or game.Players.LocalPlayer
    return api.Modules.InventoryUtil.getInventory(who).items
end

function api:FetchBeds()
    local beds = {} -- create array

    for _, v in next, workspace:GetChildren() do -- use next, instead of fucking pairs, skids.
        if
            string.lower(v.Name) == "bed" and v:FindFirstChild("Covers") ~= nil and
                v:FindFirstChild("Covers").BrickColor ~= game.Players.LocalPlayer.Team.TeamColor
         then
            table.insert(beds, v)
        end
    end

    return beds -- return array
end

function api:GetSword()
    local dmg = 0
    local sword = nil
    for i, v in next, api:GetInventory() do
        if
            v.itemType:lower():find("sword") or v.itemType:lower():find("scythe") or v.itemType:lower():find("blade") or
                v.itemType:lower():find("dagger") or
                v.itemType:lower():find("hammer")
         then
            if api.Modules.ItemTable[v.itemType].sword.damage > dmg then
                sword = v.tool
            end
        end
    end
    return sword
end

function api:Tween(part, cf, time)
    api.TweenService:Create(part, TweenInfo.new(time), {CFrame = cf}):Play()
end

function api:CreateBlur(frame, tag)
    if not blurUtility then return warn("[MOON]: Moon was not loaded correctly") end

    return blurUtility.new(frame, tag) -- do local bl = api:CreateBlur(f,"hi") bl:Destroy() if you want to remove the blur
end

function api:GetAvatar(player)
    return "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
        player.UserId .. "&width=420&height=420&format=png"
end

function api:GetMoonAsset(asset)
    return ((syn and getsynasset) or getcustomasset)(asset)
end

function api:GetCurrentMap()
    for _, v in next, workspace:GetChildren() do
        if (v.Name == "Map") then
            if v:FindFirstChild"Worlds" then
                for __, vee in next, v.Worlds:GetChildren() do
                    if vee.Name ~= "Void_World" then
                        return vee.Name
                    end
                end
            end
        end
    end
end

getgenv().MoonAPI = api

return api;