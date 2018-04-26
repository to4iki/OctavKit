extension Conference {
    public struct Track: Codable, CustomStringConvertible, Equatable, Hashable {
        private enum CodingKeys: String, CodingKey {
            case id
            case roomId = "room_id"
            case name
        }
        
        public let id: String
        public let roomId: String
        public let name: String

        public var description: String {
            return "Track(id: \(id), roomId: \(roomId), name: \(name))"
        }
    }
}

extension Conference.Track {
    public struct Room: Codable, CustomStringConvertible, Equatable, Hashable {
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

        public var description: String {
            return "Room(id: \(id), venueId: \(venueId), name: \(name), capacity: \(capacity))"
        }
    }
}
