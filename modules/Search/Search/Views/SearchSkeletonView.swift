import SwiftUI
import Core

struct SearchSkeletonView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(0..<4) { _ in
                    SearchCellSkeletonView()
                }
            }
            .blinking()
            .padding(.horizontal, 16)
        }
    }
}

struct SearchCellSkeletonView: View {
    let color  = Color(.init(gray: 0.9, alpha: 1.0))
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            color
                .frame(width: 116, height: 135)

            VStack(alignment: .leading, spacing: 8) {
                color
                    .frame(height: 20)
                
                color
                    .frame(width: 60, height: 15)

                color
                    .frame(height: 84)
            }
        }
    }

}

#Preview {
    SearchSkeletonView()
}
