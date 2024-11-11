import Foundation

enum Environment {
    enum Keys {
        static let apiHost = "API_HOST"
        static let apiKey = "API_KEY"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dic = Bundle.main.infoDictionary else {
            fatalError("plist not found")
        }
        return dic
    }()
}

extension Environment {
    static let apiHost: String = {
        guard let value = Environment.infoDictionary[Keys.apiHost] as? String else {
            fatalError("\(Keys.apiHost) not set in plist")
        }
        return value
    }()
    
    static let apiKey: String = {
        guard let value = Environment.infoDictionary[Keys.apiKey] as? String else {
            fatalError("\(Keys.apiKey) not set in plist")
        }
        return value
    }()
}
