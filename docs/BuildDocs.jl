module BuildDocs
    using Documenter

    function makePkgDocs()
        makedocs(
            sitename="PersonalPlaygound.jl",
            pages = [
                "index.md",
            ]
        )
    end
end
