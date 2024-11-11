import XCTest
@testable import Networking
@testable import NetworkingInterface

extension APIClientTests {
    
    func testSend_whenSendRequest_thenShouldSuccess() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
        }
        
        let expectedData = "result".data(using: .utf8)
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString, "https://example.com/")
            
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            
            return (response!, expectedData!)
        }
        
        // when
        let response = try await sut.send(Request())
        
        // then
        XCTAssertEqual(response, "result")
    }
    
    func testSend_whenFailingRequest_thenShouldFail() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
        }
        
        let expectedData = "result".data(using: .utf8)
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString, "https://example.com/")
            
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 500,
                httpVersion: nil,
                headerFields: nil
            )
            
            return (response!, expectedData!)
        }
        
        // when
        do {
            let _ = try await sut.send(Request())
        } catch {
            
            // then
            let error = try XCTUnwrap(error as? APIError)
            if case .errorStatusCode(let code) = error {
                XCTAssertEqual(code, 500)
            }
            
        }
    }
    
    func testSend_whenResponseDecodableToInt_thenShouldSuccess() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = Int
        }
        
        let expectedData = "123".data(using: .utf8)
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString, "https://example.com/")
            
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            
            return (response!, expectedData!)
        }
        
        // when
        let response = try await sut.send(Request())
        
        // then
        XCTAssertEqual(response, 123)
    }
    
    func testSend_whenResponseEmpty_thenShouldSuccess() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = String
        }
        
        let expectedData = Data()
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString, "https://example.com/")
            
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            
            return (response!, expectedData)
        }
        
        // when
        let response = try await sut.send(Request())
        
        // then
        XCTAssertEqual(response, "")
    }
    
    func testSend_whenDecodingWithVoidResponse_thenShouldNotThrowsError() async throws {
        // given
        struct Request: RequestProtocol {
            typealias Response = Void
        }
        
        let expectedData = "result".data(using: .utf8)
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString, "https://example.com/")
            
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            
            return (response!, expectedData!)
        }
        
        // when
        try await sut.send(Request())
    }

}
