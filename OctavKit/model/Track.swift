extension Conference {
    public struct Track: Codable {
        private enum CodingKeys: String, CodingKey {
            case id
            case roomId = "room_id"
            case name
        }
        
        public let id: String
        public let roomId: String
        public let name: String
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
    public struct Room: Codable {
        private enum CodingKeys: String, CodingKey {
            case id
            case venueId = "venue_id"
            case name
            case capacity
        }
        
        public let id: String
        public let venueId: String
        public let name: String
        public let capacity: Int
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
