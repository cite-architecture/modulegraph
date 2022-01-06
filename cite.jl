using TikzGraphs
using Graphs
using TikzPictures

nodelist = [
    # 1-2: identifiers
    "CtsUrn",
    "Cite2Urn",

    # 3-5: citable objects
    "CitablePassage",
    "CatalogedText",
    "DSECollection",

    # 6: object AND collection
    "CitableDocument",

    # 7-8: citable collections
    "TextCatalog",
    "CitableTextCorpus",

    # 9: library
    "CiteLibrary"
]

# Map index in `pkglist` to color setting for Tikz
colormods = Dict(
    # Identifiers:
    1=>"fill=red!30",
    2=>"fill=red!30",
  

    # 3-5: Objects:
    3 =>"fill=orange!15",
    4 =>"fill=orange!15",
    5 =>"fill=orange!15",
    

    # 6: Object AND Collections:
    6 =>"fill=yellow!10",

    # 7-8: Collections:
    7 =>"fill=green!10",
    8 =>"fill=green!10",
   

    # 9: library
    9=>"fill=cyan!20",
)


# The graph relations:
edgelist = [
    ("CitablePassage", "CtsUrn"),
    ("CatalogedText","CtsUrn"),
    ("CitableDocument","CtsUrn"),
    ("DSECollection", "Cite2Urn"),

    ("TextCatalog", "CatalogedText"),
    ("CitableTextCorpus", "CitablePassage"),
    ("CitableDocument", "CitablePassage"),
    
    ("CiteLibrary", "TextCatalog"),
    ("CiteLibrary", "CitableTextCorpus"),
    ("CiteLibrary", "CitableDocument"),
    ("CiteLibrary", "DSECollection")
]


gr = SimpleDiGraph(length(nodelist) )
for (src, target) in edgelist
    @info("Looking at ", src, target)
	srcidx = findfirst(r -> r == src, nodelist)
    @info srcidx
	targetidx = findfirst(r -> r == target, nodelist)
	add_edge!(gr, srcidx, targetidx)
end



entitygraph = TikzGraphs.plot(gr, nodelist, node_style="draw, rounded corners, fill=blue!20", node_styles=colormods)

TikzPictures.save(PDF("CITE-concepts"),entitygraph)