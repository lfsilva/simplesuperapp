import SwiftUI

@main
struct AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SearchFactory().make()
        }
    }
    
}
