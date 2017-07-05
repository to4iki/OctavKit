import Foundation
import Result

/// OctavAPI Client
public final class OctavKit {
    private static let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()

    private init() {}

    fileprivate static func send<T: Request>(_ request: T, completion: @escaping (Result<T.Response, OctavAPIError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) { (data, response, error) -> Void in
            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
            case let (data?, response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch let error as OctavAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response combination.")
            }
        }
        task.resume()
    }
}

extension OctavKit {
    public static func setup(conferenceId: String) {
        ParamtersHolder.setConferenceId(conferenceId)
    }

    public static func setLocal(_ local: Locale) {
        ParamtersHolder.setLocal(local)
    }

    public static func sessions(completion: @escaping (Result<[Session], OctavAPIError>) -> Void) {
        let request = OctavAPI.Sessions()
        send(request, completion: completion)
    }
}
