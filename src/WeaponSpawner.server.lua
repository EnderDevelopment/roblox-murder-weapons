-- WeaponSpawner.server.lua

-- This script allows spawning weapons visible to all players in a Roblox Murder vs Sheriff game.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Function to spawn a weapon
local function spawnWeapon(weaponName, position)
    -- Create a new weapon instance
    local weapon = Instance.new("Model")
    weapon.Name = weaponName
    weapon.PrimaryPart = Instance.new("Part")
    weapon.PrimaryPart.Size = Vector3.new(1, 1, 1)
    weapon.PrimaryPart.Anchored = true
    weapon.PrimaryPart.Position = position
    
    -- Add a mesh and other properties to make it visible
    local mesh = Instance.new("SpecialMesh", weapon.PrimaryPart)
    mesh.MeshType = Enum.MeshType.FileMesh
    mesh.MeshId = "rbxassetid://" -- Replace with actual mesh ID
    mesh.TextureId = "rbxassetid://" -- Replace with actual texture ID
    
    -- Add a click detector to make it interactable
    local clickDetector = Instance.new("ClickDetector", weapon.PrimaryPart)
    clickDetector.MouseClick:Connect(function(player)
        -- Give the weapon to the player who clicked on it
        local character = player.Character
        if character then
            weapon.Parent = character
        end
    end)
    
    -- Make the weapon visible to all players
    weapon.Parent = workspace
end

-- Example usage: spawn a weapon at a specific position
spawnWeapon("Pistol", Vector3.new(0, 5, 0))

-- Function to handle player joining
local function onPlayerAdded(player)
    -- You can add player-specific logic here if needed
end

-- Connect the player added event
Players.PlayerAdded:Connect(onPlayerAdded)

-- Function to handle player removal
local function onPlayerRemoving(player)
    -- Clean up any player-specific resources if needed
end

-- Connect the player removing event
Players.PlayerRemoving:Connect(onPlayerRemoving)