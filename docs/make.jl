include("./BuildDocs.jl")

using Documenter
using .BuildDocs

makePkgDocs()

deploydocs(
    repo = "github.com/jjj999/PersonalPlayground.jl.git",
    devbranch = "develop",
    push_preview = true,
)
