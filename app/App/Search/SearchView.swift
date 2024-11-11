import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var viewModel: SearchViewModel    
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        SearchFilterView(selectOrder: $viewModel.selectOrder)
        SearchContentView(viewModel: viewModel)
    }
}

#if DEBUG
#Preview {
    SearchView(viewModel: .init(service: SearchServiceMock(mockDelay: 3_000_000_000)))
}
#endif
