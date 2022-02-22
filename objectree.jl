using TikzGraphs
using Graphs
using TikzPictures

pkglist = [
    # 1: abstractions
    "CitableBase", 


    # 2-6: CITE
	"CitableObject", 
    "CitableImage",

	"CitablePhysicalText",

    "CitableCollection",

    "CitableLibrary",
	

    # 7-8: Project repositories
    "EditorsRepo",
    "HmtArchive"

   
]
# Map index in `pkglist` to color setting for Tikz
colormods = Dict(
    # Abstractions:
    1=>"fill=yellow",
  

    # Project repo management:
    7 =>"fill=olive!15",
    8 =>"fill=olive!15",
)


# The package graph:
edgelist = [
    

    ("CitableObject", "CitableBase"),

 

    ("CitableImage","CitableBase"),
	("CitableImage","CitableObject"),
    

    ("CitablePhysicalText", "CitableBase"),
    ("CitablePhysicalText", "CitableImage"),
    ("CitablePhysicalText", "CitableObject"),

    ("CitableLibrary", "CitableBase"),

    ("CitableLibrary", "CitableObject"),
 

    ("CitableCollection", "CitableBase"),
    ("CitableCollection", "CitableObject"),


	("EditorsRepo", "CitablePhysicalText"),

	("EditorsRepo", "CitableObject"),
	("EditorsRepo", "CitableImage"),
       



    ("HmtArchive", "EditorsRepo"),

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

TikzPictures.save(PDF("objecttree"),modulesgraph)