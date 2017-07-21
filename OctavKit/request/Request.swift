import Foundation
import Himotoki

protocol Request {
    associatedtype Response
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Any? { get }
    func response(from data: Data, urlResponse: URLResponse) throws -> Response
}

extension Request {
    var baseURL: URL {
        return URL(string: "https://api.builderscon.io/v2")!
    }

    var parameters: Any? {
        return ParamtersHolder.dictionary
    }
}

extension Request {
    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        switch method {
        case .get:
            let dictionary = parameters as? [String: Any]
            let queryItems = dictionary?.map { (key: String, value: Any) in
                URLQueryItem(name: key, value: String(describing: value))
            }
            components?.queryItems = queryItems
        default:
            fatalError("Unsupported method \(method)")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

extension Request where Response: Decodable {
    func response(from data: Data, urlResponse: URLResponse) throws -> Response {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            return try Response.decodeValue(json)
        } else {
            // TODO: decode error object
            throw OctavAPIError.apiError(NSError())
        }
    }
}
