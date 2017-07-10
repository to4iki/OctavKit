import Himotoki

public struct Track {
    public let id: Id<Track>
    public let roomId: Id<Room>
    public let name: String
}

extension Track: Decodable {
    public static func decode(_ e: Extractor) throws -> Track {
        return try Track(
            id: Id(value: e <| "id"),
            roomId: Id(value: e <| "room_id"),
            name: e <| "name"
        )
    }
}

extension Track: CustomStringConvertible {
    public var description: String {
        return "Track(id: \(id), roomId: \(roomId), name: \(name))"
    }
}

extension Track: Equatable {
    public static func == (lhs: Track, rhs: Track) -> Bool {
        return lhs.id == rhs.id && lhs.roomId == rhs.roomId
    }
}

extension Track: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
