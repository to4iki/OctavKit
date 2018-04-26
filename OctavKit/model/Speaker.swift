import Foundation

extension Conference {
    public struct Speaker: Codable, CustomStringConvertible, Equatable, Hashable {
        private enum CodingKeys: String, CodingKey {
            case id
            case nickname
            case firstname = "first_name"
            case lastname = "last_name"
            case avatarURL = "avatar_url"
        }
        
        public let id: String
        public let nickname: String
        public let firstname: String?
        public let lastname: String?
        public let avatarURL: URL

        public var description: String {
            return "Speaker(id: \(id), nickname: \(nickname), firstname: \(firstname.debugDescription), " +
            "lastname: \(lastname.debugDescription), avatarURL: \(avatarURL))"
        }
        
        public static func == (lhs: Speaker, rhs: Speaker) -> Bool {
            return lhs.id == rhs.id
        }
        
        public var hashValue: Int {
            return id.hashValue
        }
    }
}