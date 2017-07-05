import Himotoki

public struct Venue {
    public let id: Id<Venue>
}

extension Venue: CustomStringConvertible {
    public var description: String {
        return "Venue(id: \(id))"
    }
}

extension Venue: Equatable {
    public static func == (lhs: Venue, rhs: Venue) -> Bool {
        return lhs.id == rhs.id
    }
}

public struct Room {
    public let id: Id<Room>
    public let venue: Venue
    public let name: String
    public let capacity: UInt
}

extension Room: Decodable {
    public static func decode(_ e: Extractor) throws -> Room {
        return try Room(
            id: Id(value: e <| "id"),
            venue: Venue(id: Id(value: e <| "venue_id")),
            name: e <| "name",
            capacity: e <| "capacity"
        )
    }
}

extension Room: CustomStringConvertible {
    public var description: String {
        return "Room(id: \(id), venue: \(venue), name: \(name), capacity: \(capacity))"
    }
}

extension Room: Equatable {
    public static func == (lhs: Room, rhs: Room) -> Bool {
        return lhs.id == rhs.id &&
            lhs.venue == rhs.venue &&
            lhs.name == rhs.name &&
            lhs.capacity == rhs.capacity
    }
}
