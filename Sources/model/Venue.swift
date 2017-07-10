import Foundation
import Himotoki

public struct Venue {
    public let id: Id<Venue>
    public let name: String
    public let address: String
    public let placeId: String
    public let url: URL
    public let location: (latitude: Double, longitude: Double)
    public let rooms: [Room]
}

extension Venue: Decodable {
    public static func decode(_ e: Extractor) throws -> Venue {
        return try Venue(
            id: Id(value: e <| "id"),
            name: e <| "name",
            address: e <| "address",
            placeId: e <| "place_id",
            url: URL(string: e <| "url")!,
            location: (latitude: e <| "latitude", longitude: e <| "longitude"),
            rooms: e <|| "rooms"
        )
    }
}

extension Venue: CustomStringConvertible {
    public var description: String {
        return "Venue(id: \(id), name: \(name), address: \(address), placeId: \(placeId), " +
        "url: \(url), location: \(location), rooms: \(rooms)"
    }
}

extension Venue: Equatable {
    public static func == (lhs: Venue, rhs: Venue) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Venue: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}

