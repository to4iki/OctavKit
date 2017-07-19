import Foundation
import Himotoki

public struct Sponsor {
    public let id: Id<Sponsor>
    public let name: String
    public let logoURL: URL
    public let linkURL: URL
    public let groupName: String
}

extension Sponsor: Encodable {
    public func encodeJSON() -> [String : Any] {
        return [
            "id": id.value,
            "name": name,
            "logo_url": logoURL.absoluteString,
            "url": linkURL.absoluteString,
            "group_name": groupName
        ]
    }
}

extension Sponsor: Decodable {
    public static func decode(_ e: Extractor) throws -> Sponsor {
        return try Sponsor(
            id: Id(value: e <| "id"),
            name: e <| "name",
            logoURL: URL(string: e <| "logo_url")!,
            linkURL: URL(string: e <| "url")!,
            groupName: e <| "group_name"
        )
    }
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
