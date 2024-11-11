import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchFilterView(selectOrder: $viewModel.selectOrder)
                SearchContentView(viewModel: viewModel)
                Spacer()
            }
            .navigationTitle("Onde está passando?")
        }
        .searchable(text: $viewModel.searchText)
        .onSubmit(of: .search) {
            Task {
                await viewModel.searchMovies()
            }
        }
    }
}

#if DEBUG
#Preview {
    SearchView(viewModel: .init(service: SearchServiceMock(mockDelay: 3_000_000_000)))
}
#endif
