final public class DIContainer: DIContainerProtocol {
    
    public static let shared = DIContainer()
    
    private var services: [String: ServiceEntryProtocol] = [:]
    
    private init() {}
    
    public func register<Service>(type: Service.Type, name: String?, factory: @escaping (DIContainerProtocol) -> Service) {
        let entry = ServiceEntry(factory: factory)
        entry.container = self
        let key = "\(type)\(name ?? "")"
        services[key] = entry
    }
    
    public func resolve<Service>(type: Service.Type, name: String?) -> Service? {
        let key = "\(type)\(name ?? "")"
        if let entry = services[key] {
            var resolvedService: Service?
            if let instance = entry.instance {
                resolvedService = instance as? Service
            } else {
                resolvedService = entry.factory(self) as? Service
                entry.instance = resolvedService
            }
            return resolvedService
        }
        return nil
    }
}
