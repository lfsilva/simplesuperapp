import Foundation

public protocol RequestProtocol {
    associatedtype Response

    var url: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var query: [String: String]? { get }
    var headers: [String: String]? { get }
    var body: Encodable? { get }
}

extension RequestProtocol {
    public var url: URL? {
        URL(string: path.isEmpty ? "/" : path)
    }
    public var path: String {
        ""
    }
    public var method: HTTPMethod {
        .get
    }
    public var query: [String: String]? {
        nil
    }
    public var headers: [String: String]? {
        nil
    }
    public var body: Encodable? {
        nil
    }
}
