import SwiftUI

struct SearchContentView: View {
    
    @ObservedObject private var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if viewModel.movies.isEmpty {
            SearchEmptyView()
        } else {
            List(viewModel.movies) {
                SearchCellView(
                    title: $0.title,
                    overview: $0.overview,
                    releaseYear: $0.releaseYear,
                    cover: $0.imageSet.verticalPoster.w240,
                    streamings: $0.availableServices
                )
                .alignmentGuide(.listRowSeparatorLeading) { _ in
                    return 0
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    SearchContentView(viewModel: .init(service: SearchServiceMock()))
}
#endif