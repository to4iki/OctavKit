import Himotoki

public struct Room {
    public let id: Id<Room>
    public let venueId: Id<Venue>
    public let name: String
    public let capacity: Int
}

extension Room: Decodable {
    public static func decode(_ e: Extractor) throws -> Room {
        return try Room(
            id: Id(value: e <| "id"),
            venueId: Id(value: e <| "venue_id"),
            name: e <| "name",
            capacity: e <| "capacity"
        )
    }
}

extension Room: CustomStringConvertible {
    public var description: String {
        return "Room(id: \(id), venueId: \(venueId), name: \(name), capacity: \(capacity))"
    }
}

extension Room: Equatable {
    public static func == (lhs: Room, rhs: Room) -> Bool {
        return lhs.id == rhs.id && lhs.venueId == rhs.venueId
    }
}

extension Room: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
