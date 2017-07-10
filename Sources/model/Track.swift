import Himotoki

extension Conference {
    public struct Track {
        public let id: Id<Track>
        public let roomId: Id<Room>
        public let name: String
    }
}

extension Conference.Track: Decodable {
    public static func decode(_ e: Extractor) throws -> Conference.Track {
        return try Conference.Track(
            id: Id(value: e <| "id"),
            roomId: Id(value: e <| "room_id"),
            name: e <| "name"
        )
    }
}

extension Conference.Track: CustomStringConvertible {
    public var description: String {
        return "Track(id: \(id), roomId: \(roomId), name: \(name))"
    }
}

extension Conference.Track: Equatable {
    public static func == (lhs: Conference.Track, rhs: Conference.Track) -> Bool {
        return lhs.id == rhs.id && lhs.roomId == rhs.roomId
    }
}

extension Conference.Track: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}

extension Conference.Track {
    public struct Room {
        public let id: Id<Room>
        public let venueId: Id<Conference.Venue>
        public let name: String
        public let capacity: Int
    }
}

extension Conference.Track.Room: Decodable {
    public static func decode(_ e: Extractor) throws -> Conference.Track.Room {
        return try Conference.Track.Room(
            id: Id(value: e <| "id"),
            venueId: Id(value: e <| "venue_id"),
            name: e <| "name",
            capacity: e <| "capacity"
        )
    }
}

extension Conference.Track.Room: CustomStringConvertible {
    public var description: String {
        return "Room(id: \(id), venueId: \(venueId), name: \(name), capacity: \(capacity))"
    }
}

extension Conference.Track.Room: Equatable {
    public static func == (lhs: Conference.Track.Room, rhs: Conference.Track.Room) -> Bool {
        return lhs.id == rhs.id && lhs.venueId == rhs.venueId
    }
}

extension Conference.Track.Room: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
