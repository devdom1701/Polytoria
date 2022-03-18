local allowedUsers = {
    "Player",
    "CyA",
    --add more
}

script.Parent.Touched:Connect(function(hit)
    if hit:IsA("Player") then
        for i, allowedUser in pairs(allowedUsers) do
            if hit.Name == allowedUser then
                script.Parent.CanCollide = false
                script.Parent.Color = Color.New(script.Parent.Color.r, script.Parent.Color.g, script.Parent.Color.b, 0.5)
                wait(1)
                script.Parent.CanCollide = true
                script.Parent.Color = Color.New(script.Parent.Color.r, script.Parent.Color.g, script.Parent.Color.b, 1)
            end
        end
    end
end)