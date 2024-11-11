public protocol DIContainerProtocol {
    func register<Service>(type: Service.Type, name: String?, factory: @escaping (DIContainerProtocol) -> Service)
    func resolve<Service>(type: Service.Type, name: String?) -> Service?
}

extension DIContainerProtocol {
    public func register<Service>(type: Service.Type, name: String? = nil, factory: @escaping (DIContainerProtocol) -> Service) {
        register(type: type, name: name, factory: factory)
    }
    public func resolve<Service>(type: Service.Type, name: String? = nil) -> Service? {
        resolve(type: type, name: name)
    }
}
