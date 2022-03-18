Camera.Mode = CameraMode.Scripted
Camera.FOV = 90
Camera.Position = game["Environment"]["camera_1"].Position
function startsWith(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end
game["Players"].LocalPlayer.RespawnTime = 0

local cameras = {}
local walls = {}

for i, child in pairs(game["Environment"]:GetChildren()) do
    if (startsWith(child.Name, "camera_")) then
        print("Inserting new camera on position [" .. #cameras + 1 .. "]!")
        table.insert(cameras, child)
    elseif startsWith(child.Name, "wall_") then
        print("Inserting new wall on position [" .. #walls + 1 .. "]!")
        table.insert(walls, {
            wall = child,
            passed = false
        })
    else
        print("[Normal object " .. child.Name .. "]")
    end
end

wait(1)
for i, wall in pairs(walls) do
    print(wall.wall.Name)
    wall.wall.Touched:Connect(function(player)
        if (wall.passed == true) then
            wall.passed = false
            print("Going through wall " .. tostring(wall.wall.Name))
            print("Setting Wall " .. tostring(wall.wall.Name) .. " as not passed.")
            print("Activating camera " .. tostring(i))
            Camera.Position = cameras[i].Position
        else
            print("Setting " .. tostring(wall.wall.Name) .. " as passed.")
            print("Activating camera " .. tostring(i + 1))
            wall.passed = true
            Camera.Position = cameras[i + 1].Position
        end
    end)
end

game["Players"].LocalPlayer.Died:Connect(function(dead)
    Camera.Position = cameras[1].Position
    for i, wall in pairs(walls) do
    wall.passed = false
    end
end)