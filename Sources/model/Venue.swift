import Foundation
import Himotoki

extension Conference {
    public struct Venue {
        public let id: Id<Venue>
        public let name: String
        public let address: String
        public let placeId: String
        public let url: URL
        public let location: (latitude: Double, longitude: Double)
        public let rooms: [Conference.Track.Room]
    }
}

extension Conference.Venue: Decodable {
    public static func decode(_ e: Extractor) throws -> Conference.Venue {
        return try Conference.Venue(
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

extension Conference.Venue: CustomStringConvertible {
    public var description: String {
        return "Venue(id: \(id), name: \(name), address: \(address), placeId: \(placeId), " +
        "url: \(url), location: \(location), rooms: \(rooms)"
    }
}

extension Conference.Venue: Equatable {
    public static func == (lhs: Conference.Venue, rhs: Conference.Venue) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Conference.Venue: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}

