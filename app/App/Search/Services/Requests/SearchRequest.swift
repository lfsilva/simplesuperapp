import NetworkingInterface

struct SearchRequest: RequestProtocol {
    let title: String
    
    typealias Response = [MovieResponse]
    
    var path: String { "/shows/search/title" }
    var headers: [String: String]? {[
        "x-rapidapi-key": Environment.apiKey,
        "x-rapidapi-host": Environment.apiHost
    ]}
    var query: [String: String]? {[
        "country": "br",
        "title": title,
        "series_granularity": "show",
        "show_type": "movie",
        "output_language": "en"
    ]}
}
