```
/c local surface = game.player.surface
game.player.force.cancel_charting(surface)
px = game.player.position.x/32
py = game.player.position.y/32
sx = 20
sy = 20
for chunk in surface.get_chunks() do
    if (chunk.x-px) < -sx/2 or (chunk.x-px) >= sx/2 or
            (chunk.y-py) < -sy/2 or (chunk.y-py) >= sx/2 then
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