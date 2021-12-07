using LightGraphs
using TikzGraphs
using TikzPictures

pkglist = [
    # 1-2: abstractions
    "CitableBase", 
    "CitableLibrary"
]

# Map index in `pkglist` to color setting for Tikz
colormods = Dict(
    # Abstractions:
    1=>"fill=yellow",
    2=>"fill=yellow"
)

# The package graph:
edgelist = [
    ("CitableLibrary", "CitableBase")
]

gr = SimpleDiGraph(length(pkglist) )

for (src, target) in edgelist
    @info("Looking at ", src, target)
	srcidx = findfirst(r -> r == src, pkglist)
    @info srcidx
	targetidx = findfirst(r -> r == target, pkglist)
	add_edge!(gr, srcidx, targetidx)
end

modulesgraph = TikzGraphs.plot(gr, pkglist, node_style="draw, rounded corners, fill=blue!20", node_styles=colormods)