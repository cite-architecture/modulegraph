using TikzGraphs
using Graphs
using TikzPictures

pkglist = [
    # 1: abstractions
    "CitableBase", 


    # 2-9: CITE
    "CiteEXchange",
	"CitableObject", 
    "CitableImage",

	"CitableText",
	"CitableCorpus",
	"CitablePhysicalText",

    "CitableCollection",

    "CitableLibrary",
	
    # 10-12: MID abstractions
    "Orthography",
	"CitableTeiReaders",
    "EditionBuilders",
	

    # 13-15: Orthographies
	"PolytonicGreek",
	"AtticGreek",
	"ManuscriptOrthography",
	
    # 16-20: Text analysis
    "CitableParserBuilder",
    "Kanones",
    "CitableCorpusAnalysis",
    "Lycian",
    "Tabulae",

    # 21-22: Project repositories
    "EditorsRepo",
    "HmtArchive"

   
]
# Map index in `pkglist` to color setting for Tikz
colormods = Dict(
    # Abstractions:
    1=>"fill=yellow",
  

    # MID modules:
    10=>"fill=green!10",
    11=>"fill=green!10",
    12=>"fill=green!10",

    # Orthographies
    
    13=>"fill=orange!15",
    14=>"fill=orange!15",
    15=>"fill=orange!15",

    # Text analysis modules:
    
    16 =>"fill=cyan!10",
    17 =>"fill=cyan!10",
    18 =>"fill=cyan!10",   
    19 =>"fill=cyan!10",    
    20 =>"fill=cyan!10",

    # Project repo management:
    21 =>"fill=olive!15",
    22 =>"fill=olive!15",
)


# The package graph:
edgelist = [
    ("CitableText", "CitableBase"),

    ("CitableObject", "CitableBase"),

    ("CiteEXchange", "CitableBase"),

    ("CitableCorpus", "CitableBase"),
	("CitableCorpus", "CitableText"),
    ("CitableCorpus", "CiteEXchange"),

    ("CitableImage","CitableBase"),
	("CitableImage","CitableObject"),
    ("CitableImage","CiteEXchange"),

    ("CitablePhysicalText", "CitableBase"),
    ("CitablePhysicalText", "CitableImage"),
    ("CitablePhysicalText", "CitableObject"),
	("CitablePhysicalText", "CitableText"),
    ("CitablePhysicalText", "CiteEXchange"),

    ("CitableLibrary", "CitableBase"),
    ("CitableLibrary", "CiteEXchange"),
    ("CitableLibrary", "CitableObject"),
    ("CitableLibrary", "CitableText"),

    ("CitableCollection", "CitableBase"),
    ("CitableCollection", "CitableObject"),
    ("CitableCollection", "CitableText"),
    ("CitableCollection", "CiteEXchange"),


 

	("CitableTeiReaders", "CitableText"),
	("CitableTeiReaders", "CitableCorpus"),


    ("Orthography", "CitableCorpus"),
    ("Orthography", "CitableText"),

	("EditorsRepo", "CiteEXchange"),
    ("EditorsRepo", "CitableBase"),
	("EditorsRepo", "CitableText"),
	("EditorsRepo", "CitablePhysicalText"),
	("EditorsRepo", "CitableCorpus"),
	("EditorsRepo", "CitableObject"),
	("EditorsRepo", "CitableTeiReaders"),
	("EditorsRepo", "CitableImage"),
	("EditorsRepo", "EditionBuilders"),
    ("EditorsRepo", "Orthography"),
    ("EditorsRepo", "AtticGreek"),
    ("EditorsRepo", "ManuscriptOrthography"),
    ("EditorsRepo", "PolytonicGreek"),

	("EditionBuilders", "CitableText"),
	("EditionBuilders", "CitableCorpus"),
	
	("PolytonicGreek", "Orthography"),
	("AtticGreek", "Orthography"),
    ("ManuscriptOrthography", "Orthography"),
    ("ManuscriptOrthography", "PolytonicGreek"),
    
    ("CitableParserBuilder", "CitableBase"),
    ("CitableParserBuilder", "CitableText"),
    ("CitableParserBuilder", "CitableCorpus"),
    ("CitableParserBuilder", "CitableObject"),
    ("CitableParserBuilder", "Orthography"),

    ("Kanones", "AtticGreek"),
    ("Kanones", "CitableBase"),
    ("Kanones", "CitableObject"),
    ("Kanones", "CitableParserBuilder"),
    ("Kanones", "Orthography"),
    ("Kanones", "PolytonicGreek"),


    ("Tabulae", "CitableParserBuilder"),
    ("Tabulae", "CitableObject"),

    ("CitableCorpusAnalysis", "CitableText"),
    ("CitableCorpusAnalysis", "CitableCorpus"),
    ("CitableCorpusAnalysis", "CitableParserBuilder"),
    ("CitableCorpusAnalysis", "Orthography"),


    ("Lycian", "Orthography"),
    ("Lycian", "CitableText"),
    ("Lycian", "CitableCorpus"),
    ("Lycian", "CitableObject"),
    ("Lycian", "CitableParserBuilder"),


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

TikzPictures.save(PDF("packages"),modulesgraph)