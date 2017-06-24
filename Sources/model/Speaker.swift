import Foundation
import Himotoki

public struct Speaker {
    public let id: Id<Speaker>
    public let nickname: String
    public let avatarURL: URL
    public let lang: Locale
    public let admin: Bool
    public let timezone: TimeZone?
}

extension Speaker: Decodable {
    public static func decode(_ e: Extractor) throws -> Speaker {
        return try Speaker(
            id: Id(value: e <| "id"),
            nickname: e <| "nickname",
            avatarURL: URL(string: e <| "avatar_url")!,
            lang: Locale(identifier: e <| "lang"),
            admin: e <| "is_admin",
            timezone: TimeZone(identifier: e <| "timezone")
        )
    }
}
