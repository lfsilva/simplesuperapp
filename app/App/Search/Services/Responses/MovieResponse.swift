struct MovieResponse: Decodable, Identifiable {
    let id: String
    let title: String
    let overview: String
    let releaseYear: Int
    let genres: [GenreResponse]
    let imageSet: ImageSetResponse
    let streamingOptions: StreamingOptionsResponse
    
    var availableServices: [String] {
        Array(Set(streamingOptions.br?.compactMap { $0.service.imageSet.lightThemeImage } ?? []))
    }
}
