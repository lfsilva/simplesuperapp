import Combine

enum OrderType: String, CaseIterable {
    case title = "Título"
    case releaseYear = "Ano"
}

@MainActor
final class SearchViewModel: ObservableObject {
    
    private let service: SearchServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var movies: [MovieResponse] = []
    @Published var selectOrder: OrderType?
    
    init(service: SearchServiceProtocol) {
        self.service = service
        
        $selectOrder
            .compactMap { $0 }
            .sink { [weak self] newOrder in
                self?.orderMovies(by: newOrder)
            }
            .store(in: &cancellables)
    }
    
    func searchMovies() async {
        do {
            movies = try await service.fatchMoview(title: "Batman")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func orderMovies(by orderType: OrderType) {
        switch orderType {
        case .releaseYear:
            movies = movies.sorted { $0.releaseYear < $1.releaseYear }
        case .title:
            movies = movies.sorted { $0.title < $1.title }
        }
    }
    
}
