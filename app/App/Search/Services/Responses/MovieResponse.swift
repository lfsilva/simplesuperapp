struct MovieResponse: Decodable, Identifiable {
    let id: String
    let title: String
    let overview: String
    let releaseYear: Int
    let genres: [GenreResponse]
}

#if DEBUG
extension MovieResponse {
    static var sample: [Self] {
        [
            .init(id: "1", title: "Movie 1", overview: "Overview 1", releaseYear: 2005, genres: [ .init(id: "", name: "Genre") ]),
            .init(id: "2", title: "Movie 2", overview: "Overview 2", releaseYear: 2004, genres: [ .init(id: "", name: "Genre") ]),
            .init(id: "3", title: "Movie 3", overview: "Overview 2", releaseYear: 2003, genres: [ .init(id: "", name: "Genre") ]),
            .init(id: "4", title: "Movie 4", overview: "Overview 4", releaseYear: 2002, genres: [ .init(id: "", name: "Genre") ]),
            .init(id: "5", title: "Movie 5", overview: "Overview 5", releaseYear: 2001, genres: [ .init(id: "", name: "Genre") ]),
        ]
    }
}
#endif
