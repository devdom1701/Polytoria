game["Players"].PlayerAdded:Connect(function(plr)
    for count = 1, 10 do
        local Sound = Instance.new('Sound')
            Sound.SoundID = 11652 --bod demo song
            Sound.Volume = 100 --volume
            Sound.Loop = false
            Sound.PlayInWorld = false --doesnt play in world because it has a weird efffect :joy:
        Sound:Play() -- plays dah sound
        wait(audio.Length)  -- replace this with the runtime of the song (in seconds)
        local Sound = Instance.new('Sound')
            Sound.SoundID = 13816 --key's battlefields song
            Sound.Volume = 100
            Sound.Loop = false
            Sound.PlayInWorld = false
        Sound:Play()
        wait(audio.Length)
        local Sound = Instance.new('Sound')
            Sound.SoundID = 11646 --yoem amamam
            Sound.Volume = 100
            Sound.Loop = false
            Sound.PlayInWorld = false
        Sound:Play()
        wait(audio.Length)
    end
end)
