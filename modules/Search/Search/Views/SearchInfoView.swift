import SwiftUI

struct SearchInfoView: View {
    
    enum InfoType: String {
        case empty = "Nenhum resultado"
        case error = "Ocorreu um erro"
    }
    
    let infoType: InfoType
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray.opacity(0.2))
                .frame(width: 150)
            Text(infoType.rawValue)
                .font(.title)
                .foregroundColor(.gray)
                .padding(.top, 32)
        }
    }
}

#Preview {
    SearchInfoView(infoType: .empty)
}
