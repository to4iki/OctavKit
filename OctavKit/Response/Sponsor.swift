import Foundation

public struct Sponsor: Codable, CustomStringConvertible, Equatable, Hashable {
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

    public var description: String {
        return "Sponsor(id: \(id), name: \(name), logoURL: \(logoURL), " +
        "linkURL: \(linkURL), groupName: \(groupName))"
    }
}
