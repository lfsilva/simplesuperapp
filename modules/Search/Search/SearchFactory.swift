import SwiftUI
import DI
import SearchInterface
import NetworkingInterface

public final class SearchFactory: @preconcurrency SearchFactoryProtocol {
    
    public init() { }

    @MainActor public func make() -> AnyView {
        guard let client = DIContainer.shared.resolve(type: APIClientProtocol.self) else {
            fatalError("Critical error: URL is invalid.")
        }
        let service = SearchService(client: client)
        let viewModel = SearchViewModel(service: service)
        let view = SearchView(viewModel: viewModel)
        return AnyView(view)
    }

}
