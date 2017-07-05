import Foundation
import Himotoki

public struct Speaker {
    public let id: Id<Speaker>
    public let nickname: String
    public let firstname: String?
    public let lastname: String?
    public let avatarURL: URL
    public let lang: Locale
    public let timezone: TimeZone?
}

extension Speaker: Decodable {
    public static func decode(_ e: Extractor) throws -> Speaker {
        return try Speaker(
            id: Id(value: e <| "id"),
            nickname: e <| "nickname",
            firstname: e <|? "first_name",
            lastname: e <|? "last_name",
            avatarURL: URL(string: e <| "avatar_url")!,
            lang: Locale(identifier: e <| "lang"),
            timezone: TimeZone(identifier: e <| "timezone")
        )
    }
}

extension Speaker: CustomStringConvertible {
    public var description: String {
        return "Speaker(id: \(id), nickname: \(nickname), firstname: \(firstname.debugDescription), " +
        "lastname: \(lastname.debugDescription), avatarURL: \(avatarURL), lang: \(lang), timezone: \(timezone.debugDescription))"
    }
}

extension Speaker: Equatable {
    public static func == (lhs: Speaker, rhs: Speaker) -> Bool {
        return lhs.id == rhs.id &&
            lhs.nickname == rhs.nickname &&
            lhs.firstname == rhs.firstname &&
            lhs.lastname == rhs.lastname &&
            lhs.avatarURL == rhs.avatarURL &&
            lhs.lang == rhs.lang &&
            lhs.timezone == rhs.timezone
    }
}
