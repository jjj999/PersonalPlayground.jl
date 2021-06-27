using Documenter

makedocs(
    sitename="PersonalPlaygound.jl",
    pages = [
        "index.md",
    ]
)

deploydocs(
    repo = "github.com/jjj999/PersonalPlaygound.jl.git",
    push_preview = true,
)
