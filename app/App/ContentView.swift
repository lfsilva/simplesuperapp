import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("apiHost: \(Environment.apiHost)")
            Text("apiKey: \(Environment.apiKey)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
