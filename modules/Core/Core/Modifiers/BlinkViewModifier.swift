import SwiftUI

public struct BlinkViewModifier: ViewModifier {
    
    let duration: Double
    
    public init(duration: Double) {
        self.duration = duration
    }
    
    @State private var blinking: Bool = false
    
    public func body(content: Content) -> some View {
        content
            .opacity(blinking ? 0.3 : 1)
            .animation(.easeInOut(duration: duration).repeatForever(), value: blinking)
            .onAppear {
                blinking.toggle()
            }
    }
}

extension View {
    public func blinking(duration: Double = 0.75) -> some View {
        modifier(BlinkViewModifier(duration: duration))
    }
}
