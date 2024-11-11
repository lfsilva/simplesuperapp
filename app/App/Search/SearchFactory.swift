import SwiftUI

final class SearchFactory {

    @MainActor
    func make() -> some View {
        guard let url = URL(string: "https://streaming-availability.p.rapidapi.com") else {
            fatalError("Critical error: URL is invalid.")
        }
        let session = URLSession(configuration: .default)
        let client = APIClient(baseURL: url, session: session)
        let service = SearchService(client: client)
        let viewModel = SearchViewModel(service: service)
        let view = SearchView(viewModel: viewModel)
        return view
    }

}
