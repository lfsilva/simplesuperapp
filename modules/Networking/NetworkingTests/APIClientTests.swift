import XCTest
@testable import Networking

final class APIClientTests: XCTestCase {
    
    var sut: APIClient!
    
    override func setUp() {
        super.setUp()
        
        let baseURL = URL(string: "https://example.com")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        sut = .init(baseURL: baseURL, session: session)
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
}
