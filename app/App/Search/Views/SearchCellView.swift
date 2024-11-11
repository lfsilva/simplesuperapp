import SwiftUI

struct SearchCellView: View {
    
    let title: String
    let overview: String
    let releaseYear: Int
    let cover: String
    let streamings: [String]
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: URL(string: cover)) { image in
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
                
                Text(String(releaseYear))
                    .font(.footnote)

                Text(overview)
                    .font(.callout)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 8) {
                    
                    if streamings.isEmpty {
                        Text("Streaming indisponível")
                            .font(.footnote)
                    } else {
                        availableStreamings
                    }
                    
                }
            }
            
            Spacer()
        }
        .frame(height: 155)
    }
    
    var availableStreamings: some View {
        ForEach(streamings, id: \.self) {
            AsyncSVGImage(url: URL(string: $0)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 35)
        }
    }
}

#Preview {
    SearchCellView(
        title: "Nome do filme",
        overview: "Descrição do filme",
        releaseYear: 2024,
        cover: "https://cdn.movieofthenight.com/show/414/poster/vertical/en/240.jpg?Expires=1749503410&Signature=ebV6qrQNe1~sgr2ZBGjpUIWKqCKO96RzGbfyB9otAwPvsNPN7yB846gI~8lxeMtAym0FLXqBqoFOtMSDha9QV9UEs3WkiJtw2uhSeFA8BG6xqOlqWLobdnpEbNIvctJab9hAWQuGKF2PcbUNso~pvmX~kJx3Td--THxhZnrZgwvoBxjCY46u1gcuf1DQheIOpdTwN3sFRGSi5xMqm46XONX4B9xsUZDEOmagLoHyaYaXye~2qzxdMVcZgjhduimLMzHo7dnFSm5eJpUO0v4Fvpi2ADQFG4UwmWq5sr3CwCkuJ2zfQxtj6DaR13acpCvhaElOTG5D-dV8Sprl3r4I~A__&Key-Pair-Id=KK4HN3OO4AT5R",
        streamings: [
            "https://media.movieofthenight.com/services/apple/logo-light-theme.svg",
            "https://media.movieofthenight.com/services/prime/logo-light-theme.svg",
            "https://media.movieofthenight.com/services/hbo/logo-light-theme.svg"
        ]
    )
}
