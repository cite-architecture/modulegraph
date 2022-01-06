# Visualizing CITE in Julia

> Generate graph visualizations of Julia types representing key concepts of the CITE architecture and Julia packages related to the CITE architecture.


## Generate PDFs

Requires Julia 1.7.  Set `project` parameter to point to the root directory of this repository.


Generate graph of Julia types for key CITE concepts and color key:

```
julia --project=. cite.jl
julia --project=. citecolorkey.jl
```


Generate graph of Julia modules and color key:

```
julia --project=. modules.jl
julia --project=. modulescolorkey.jl
```

## Output (converted to PNG format)

Images on this page are linked to full-size PNGs.

### Julia types for CITE concepts

[![CITE concepts](graphs/cite-concepts.png)](graphs/cite-concepts.png)

> color key:
>
> [![concepts: color key](graphs/concepts-colorkey.png)](graphs/concepts-colorkey.png)


### Julia packages


[![Julia packages](graphs/packages.png)](graphs/packages.png)

> color key:
>
> [![packages: color key](graphs/packages-colorkey.png)](graphs/packages-colorkey)

