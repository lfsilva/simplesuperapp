import Combine
import NetworkingInterface

enum OrderType: String, CaseIterable {
    case title = "Título"
    case releaseYear = "Ano"
}

@MainActor
final class SearchViewModel: ObservableObject {
    
    enum State {
        case loading
        case loaded
        case failed
    }
    
    private let service: SearchServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var state: State = .loaded
    @Published var movies: [MovieResponse] = []
    @Published var selectOrder: OrderType?
    @Published var searchText = ""
    
    init(service: SearchServiceProtocol) {
        self.service = service
        
        $selectOrder
            .compactMap { $0 }
            .sink { [weak self] newOrder in
                self?.orderMovies(by: newOrder)
            }
            .store(in: &cancellables)
        
        User().doSomething()
    }
    
    func searchMovies() async {
        if searchText.isEmpty {
            movies = []
        } else {
            state = .loading
            do {
                movies = try await service.fatchMoview(title: searchText)
                state = .loaded
            } catch {
                print(error.localizedDescription)
                state = .failed
            }
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
