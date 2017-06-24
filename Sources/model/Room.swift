import Himotoki

public struct Venue {
    public let id: Id<Venue>
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
