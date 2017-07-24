import Foundation
import Himotoki

public protocol Participant: CustomStringConvertible, Encodable, Decodable, Equatable, Hashable {
    var id: Id<Self> { get }
    var nickname: String { get }
    var firstname: String? { get }
    var lastname: String? { get }
    var avatarURL: URL { get }
    var lang: Locale { get }
    var timezone: String? { get }
    init(id: Id<Self>, nickname: String, firstname: String?, lastname: String?, avatarURL: URL, lang: Locale, timezone: String?)
}

extension Participant {
    public var description: String {
        let className = String(describing: Self.self)
        return "\(className)(id: \(id), nickname: \(nickname), firstname: \(firstname.debugDescription), " +
        "lastname: \(lastname.debugDescription), avatarURL: \(avatarURL), lang: \(lang), timezone: \(timezone.debugDescription))"
    }

    public func encodeJSON() -> [String : Any] {
        var dictionary = [
            "id": id.value,
            "nickname": nickname,
            "avatar_url": avatarURL.absoluteString,
            "lang": lang.identifier
        ]
        if let firstname = firstname {
            dictionary["first_name"] = firstname
        }
        if let lastname = lastname {
            dictionary["last_name"] = lastname
        }
        if let timezone = timezone {
            dictionary["timezone"] = timezone
        }
        return dictionary
    }

    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            id: Id(value: e <| "id"),
            nickname: e <| "nickname",
            firstname: e <|? "first_name",
            lastname: e <|? "last_name",
            avatarURL: URL(string: e <| "avatar_url")!,
            lang: Locale(identifier: e <| "lang"),
            timezone: e <|? "timezone"
        )
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }

    public var hashValue: Int {
        return id.hashValue
    }
}

extension Conference {
    public struct Speaker: Participant {
        public let id: Id<Speaker>
        public let nickname: String
        public let firstname: String?
        public let lastname: String?
        public let avatarURL: URL
        public let lang: Locale
        public let timezone: String?

        public init(id: Id<Speaker>, nickname: String, firstname: String?, lastname: String?, avatarURL: URL, lang: Locale, timezone: String?) {
            self.id = id
            self.nickname = nickname
            self.firstname = firstname
            self.lastname = lastname
            self.avatarURL = avatarURL
            self.lang = lang
            self.timezone = timezone
        }
    }

    public struct Staff: Participant {
        public let id: Id<Staff>
        public let nickname: String
        public let firstname: String?
        public let lastname: String?
        public let avatarURL: URL
        public let lang: Locale
        public let timezone: String?

        public init(id: Id<Staff>, nickname: String, firstname: String?, lastname: String?, avatarURL: URL, lang: Locale, timezone: String?) {
            self.id = id
            self.nickname = nickname
            self.firstname = firstname
            self.lastname = lastname
            self.avatarURL = avatarURL
            self.lang = lang
            self.timezone = timezone
        }
    }
}