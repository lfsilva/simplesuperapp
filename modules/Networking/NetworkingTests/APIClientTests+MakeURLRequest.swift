import XCTest
@testable import Networking
@testable import NetworkingInterface

extension APIClientTests {
    
    func testMakeURLRequest_whenRelativePathStartingWithSlash_thenShouldFullPath() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
            
            var path: String = "/user"
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://example.com/user")
    }
    
    func testMakeURLRequest_whenRelativePath_thenShouldFullPath() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
            
            var path: String = "user"
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://example.com/user")
    }
    
    func testMakeURLRequest_whenRelativePathEmpty_thenShouldFullPath() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
            
            var path: String = ""
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://example.com/")
    }
    
    func testMakeURLRequest_whenRelativePathRoot_thenShouldFullPath() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
            
            var path: String = "/"
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://example.com/")
    }
    
    func testMakeURLRequest_whenWithoutPath_thenShouldFullPath() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://example.com/")
    }
    
    func testMakeURLRequest_whenAbsolutePaths_thenShouldFullPath() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
            
            var path: String = "https://example.com/user"
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://example.com/user")
    }
    
    func testMakeURLRequest_whenAcceptHeadersAreSetByDefaultWithNoBody_thenShouldMakeHeadersWithoudContentType() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
            
            var path: String = "/"
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertNil(urlRequest.value(forHTTPHeaderField: "Content-Type"))
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Accept"), "application/json")
    }
    
    func testMakeURLRequest_whenAcceptHeadersAreSetByDefaultWithBody_thenShouldMakeHeadersWithContentType() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
            
            var path: String = "/"
            var method: HTTPMethod = .post
            var body: Encodable? = "body"
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Content-Type"), "application/json")
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Accept"), "application/json")
    }
    
    func testMakeURLRequest_whenOverrideAcceptAndContentTypeHeaders_thenShouldMakeCustomHeaders() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
            
            var path: String = "/"
            var method: HTTPMethod = .post
            var headers: [String: String]? = [
                "Content-Type": "application/xml",
                "Accept": "application/xml"
            ]
            var body: Encodable? = "body"
        }
        
        // when
        let urlRequest = try await sut.makeURLRequest(for: Request())
        
        // then
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Content-Type"), "application/xml")
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Accept"), "application/xml")
    }

}
