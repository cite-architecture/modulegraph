using Graphs
using TikzGraphs
using TikzPictures

colorkeygr = SimpleGraph(0)
add_vertices!(colorkeygr, 5)
colorkeydict = Dict(
    1 => "fill=red!30",
    2 => "fill=orange!15",
    3 => "fill=yellow!10",
    4 => "fill=green!10",
    5 => "fill=cyan!20"
 
)
grouplabels = [
    "Identifiers",
    "Objects",
    "Object+Collection",
    "Collections",
    "Library"
]

tikzkey = TikzGraphs.plot(colorkeygr,grouplabels, node_style="draw, rounded corners, fill=blue!20", node_styles=colorkeydict) 

TikzPictures.save(PDF("concepts-colorkey"),tikzkey)
