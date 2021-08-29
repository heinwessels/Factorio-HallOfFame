```
/c local surface = game.player.surface
game.player.force.cancel_charting(surface)
px = game.player.position.x/32
py = game.player.position.y/32
sx = 10
sy = 8
for chunk in surface.get_chunks() do
    if (chunk.x-px) < -sx/2 or (chunk.x-px) >= sx/2 or
            (chunk.y-py) < -sy/2 or (chunk.y-py) >= sy/2 then
        surface.delete_chunk(chunk)
    end
end
```


```
/delete-blueprint-library everybody confirm
```


This does a lot:
```
/c game.player.force.reset()
/c game.player.force.research_all_technologies()
/c game.player.force.technologies["worker-robots-speed-6"].researched = true
```

```
/c for i=1,200 do
    game.player.force.technologies["mining-productivity-4"].researched = true
end
```