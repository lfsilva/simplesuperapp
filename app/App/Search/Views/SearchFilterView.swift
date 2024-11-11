import SwiftUI

struct SearchFilterView: View {
    
    @Binding var selectOrder: OrderType?
    
    var body: some View {
        Picker("Filter", selection: $selectOrder) {
            ForEach(OrderType.allCases, id: \.self) {
                Text($0.rawValue).tag(Optional($0))
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    SearchFilterView(selectOrder: .constant(.title))
}
