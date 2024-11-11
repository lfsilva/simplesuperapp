import Foundation

protocol RequestProtocol {
    associatedtype Response

    var url: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var query: [String: String]? { get }
    var headers: [String: String]? { get }
    var body: Encodable? { get }
}

extension RequestProtocol {
    var url: URL? {
        URL(string: path.isEmpty ? "/" : path)
    }
    var path: String {
        ""
    }
    var method: HTTPMethod {
        .get
    }
    var query: [String: String]? {
        nil
    }
    var headers: [String: String]? {
        nil
    }
    var body: Encodable? {
        nil
    }
}
