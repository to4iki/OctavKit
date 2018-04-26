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

    private static func send<T: Request>(_ request: T, completion: @escaping (T.Response?, OctavAPIError?) -> Void) {
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
        ParamtersHolder.conferenceId = conferenceId
    }

    public static func setLocale(_ locale: Locale) {
        ParamtersHolder.setLocale(locale)
    }

    public static func sessions(completion: @escaping (Result<[Session], OctavAPIError>) -> Void) {
        let request = OctavAPI.Sessions()
        send(request, completion: completion)
    }
    
    public static func sponsors(completion: @escaping (Result<[Sponsor], OctavAPIError>) -> Void) {
        let request = OctavAPI.Sponsors()
        send(request, completion: completion)
    }
    
    public static func conference(completion: @escaping (Result<Conference, OctavAPIError>) -> Void) {
        let request = OctavAPI.Lookup()
        send(request, completion: completion)
    }
}
