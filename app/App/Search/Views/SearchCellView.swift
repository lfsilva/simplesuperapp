import SwiftUI

struct SearchCellView: View {
    
    let title: String
    let overview: String
    let releaseYear: Int
    let imageUrl: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "popcorn")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray.opacity(0.2))
            }
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
        releaseYear: 2024,
        imageUrl: "https://cdn.movieofthenight.com/show/414/poster/vertical/en/240.jpg?Expires=1749503410&Signature=ebV6qrQNe1~sgr2ZBGjpUIWKqCKO96RzGbfyB9otAwPvsNPN7yB846gI~8lxeMtAym0FLXqBqoFOtMSDha9QV9UEs3WkiJtw2uhSeFA8BG6xqOlqWLobdnpEbNIvctJab9hAWQuGKF2PcbUNso~pvmX~kJx3Td--THxhZnrZgwvoBxjCY46u1gcuf1DQheIOpdTwN3sFRGSi5xMqm46XONX4B9xsUZDEOmagLoHyaYaXye~2qzxdMVcZgjhduimLMzHo7dnFSm5eJpUO0v4Fvpi2ADQFG4UwmWq5sr3CwCkuJ2zfQxtj6DaR13acpCvhaElOTG5D-dV8Sprl3r4I~A__&Key-Pair-Id=KK4HN3OO4AT5R"
    )
}
