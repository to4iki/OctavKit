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
            if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
                return try JSONDecoder().decode(Response.self, from: data)
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
            if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
                return try JSONDecoder().decode(Response.self, from: data)
            } else {
                // TODO: decode error object
                throw OctavAPIError.apiError(NSError())
            }
        }
    }

    struct Lookup: Request {
        typealias Response = Conference

        var path: String {
            return "/conference/lookup"
        }

        var method: HTTPMethod {
            return .get
        }

        var parameters: Any? {
            var dic = ["id": ParamtersHolder.conferenceId]
            if let langCode = ParamtersHolder.langCode {
                dic["lang"] = langCode
            }
            return dic
        }
    }
}
