import SwiftUI

struct SearchContentView: View {
    
    @ObservedObject private var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.movies) {
            SearchCellView(
                title: $0.title,
                overview: $0.overview,
                releaseYear: $0.releaseYear,
                imageUrl: $0.imageSet.verticalPoster.w240
            )
            .alignmentGuide(.listRowSeparatorLeading) { _ in
                return 0
            }
        }
        .task {
            await viewModel.searchMovies()
        }
    }
}

#if DEBUG
#Preview {
    SearchContentView(viewModel: .init(service: SearchServiceMock()))
}
#endif
