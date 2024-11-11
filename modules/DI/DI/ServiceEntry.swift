import DIInterface

//typealias Factory = (DIContainerProtocol) -> Any
typealias Factory = (DIContainer) -> Any

protocol ServiceEntryProtocol: AnyObject {
    var factory: Factory { get }
    var instance: Any? { get set }
}

final class ServiceEntry: ServiceEntryProtocol {
    var instance: Any?
    
    var factory: Factory
    weak var container: DIContainer?
    
    init(factory: @escaping Factory) {
        self.factory = factory
    }
}
