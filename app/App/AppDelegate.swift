import UIKit
import DI
import NetworkingInterface
import Networking
import SearchInterface
import Search

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        registerContainer()
        return true
    }
    
    private func registerContainer() {
        let container = DIContainer.shared
        
        container.register(type: APIClientProtocol.self) { _ in
            guard let baseURL = URL(string: "https://\(Environment.apiHost)") else {
                fatalError("Critical error: URL is invalid.")
            }
            let session = URLSession(configuration: .default)
            return APIClient(baseURL: baseURL, session: session)
        }
        
        container.register(type: SearchFactoryProtocol.self) { _ in
            SearchFactory()
        }
    }
}
