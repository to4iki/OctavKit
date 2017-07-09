import Foundation
import Himotoki

final class OctavAPI {
    struct Sessions: Request {
        typealias Response = [Session]

        var path: String {
            return "/session/list"
        }

        var method: HTTPMethod {
            return .get
        }

        func response(from data: Data, urlResponse: URLResponse) throws -> Response {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
                return try decodeArray(json)
            } else {
                // TODO: decode error object
                throw OctavAPIError.apiError(NSError())
            }
        }
    }
    struct Sponsors: Request {
        typealias Response = [Sponsor]

        var path: String {
            return "/sponsor/list"
        }

        var method: HTTPMethod {
            return .get
        }

        func response(from data: Data, urlResponse: URLResponse) throws -> Response {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
                return try decodeArray(json)
            } else {
                // TODO: decode error object
                throw OctavAPIError.apiError(NSError())
            }
        }
    }
}
