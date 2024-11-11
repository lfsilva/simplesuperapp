import SwiftUI

struct SearchCellView: View {
    
    let title: String
    let overview: String
    let releaseYear: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "popcorn")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray.opacity(0.2))
                .frame(width: 116)

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.title3)

                Text(overview)
                    .font(.callout)
                
                Spacer()

                Text(String(releaseYear))
                    .font(.footnote)
            }
            
            Spacer()
        }
        .frame(height: 135)
    }
}

#Preview {
    SearchCellView(
        title: "Nome do filme",
        overview: "Descrição do file",
        releaseYear: 2024
    )
}
