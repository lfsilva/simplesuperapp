import SwiftUI

struct SearchEmptyView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray.opacity(0.2))
                .frame(width: 150)
            Text("Nenhum resultado")
                .font(.title)
                .foregroundColor(.gray)
                .padding(.top, 32)
        }
    }
}

#Preview {
    SearchEmptyView()
}
