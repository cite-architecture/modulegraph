using Graphs
using TikzGraphs
using TikzPictures


colorkeygr = SimpleGraph(0)
add_vertices!(colorkeygr, 5)
colorkeydict = Dict(
    1 => "fill=yellow",
    2 => "fill=blue!20",
    3 => "fill=green!10",
    4 => "fill=orange!15",
    5 => "fill=cyan!10",
    6 => "fill=olive!15"
)
grouplabels = [
    "CITE concepts",
    "CITE implementations",
    "Abstractions from HC MID",
    "Orthographies",
    "Text analysis",
    "Project repository management"
]

tikzkey = TikzGraphs.plot(colorkeygr,grouplabels, node_style="draw, rounded corners, fill=blue!20", node_styles=colorkeydict) 

TikzPictures.save(PDF("modules-colorkey"),tikzkey)
#TikzPictures.save(SVG("testout/colorkey"),tikzkey)
