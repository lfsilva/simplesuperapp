import SwiftUI
import DI
import SearchInterface

final class AppFactory {
    
    func make() -> AnyView {
        guard let searchFactory = DIContainer.shared.resolve(type: SearchFactoryProtocol.self) else {
            fatalError("Critical error: URL is invalid.")
        }
        return searchFactory.make()
    }

}
