```
/c local surface = game.player.surface
game.player.force.cancel_charting(surface)
px = game.player.position.x/32
py = game.player.position.y/32
sx = 60
sy = 40
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

```
/c
game.surfaces["bb0"].clone_area{
    source_area={{-200, -200}, {200, 200}},
    destination_area={{-200, -200}, {200, 200}},
    destination_surface="nauvis",
    
    clone_tiles=true,
    clone_entities=true,
    clone_decoratives=true,
}
```