import Foundation
import SwiftUI
import DI
import NetworkingInterface

final class SearchFactory {

    @MainActor
    func make() -> some View {
        guard let client = DIContainer.shared.resolve(type: APIClientProtocol.self) else {
            fatalError("Critical error: URL is invalid.")
        }
        let service = SearchService(client: client)
        let viewModel = SearchViewModel(service: service)
        let view = SearchView(viewModel: viewModel)
        return view
    }

}
