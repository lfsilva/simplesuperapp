import NetworkingInterface
import DI
import Core

struct SearchRequest: RequestProtocol {
    let title: String
    
    typealias Response = [MovieResponse]
    
    var path: String { "/shows/search/title" }
    var headers: [String: String]? {[
        "x-rapidapi-key": environment.apiKey,
        "x-rapidapi-host": environment.apiHost
    ]}
    var query: [String: String]? {[
        "country": "br",
        "title": title,
        "series_granularity": "show",
        "show_type": "movie",
        "output_language": "en"
    ]}
    
    private var environment: EnvironmentProtocol {
        guard let environment = DIContainer.shared.resolve(type: EnvironmentProtocol.self) else {
            fatalError("Critical error: URL is invalid.")
        }
        return environment
    }
}
