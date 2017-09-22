import Foundation

public struct Sponsor: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoURL = "logo_url"
        case linkURL = "url"
        case groupName = "group_name"
    }
    
    public let id: String
    public let name: String
    public let logoURL: URL
    public let linkURL: URL
    public let groupName: String
}

extension Sponsor: CustomStringConvertible {
    public var description: String {
        return "Sponsor(id: \(id), name: \(name), logoURL: \(logoURL), " +
        "linkURL: \(linkURL), groupName: \(groupName))"
    }
}

extension Sponsor: Equatable {
    public static func == (lhs: Sponsor, rhs: Sponsor) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Sponsor: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
