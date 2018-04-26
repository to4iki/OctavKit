import Foundation

extension Conference {
    public struct Venue: Codable {
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case address
            case placeId = "place_id"
            case url
            case rooms
            case latitude
            case longitude
        }
        
        public let id: String
        public let name: String
        public let address: String
        public let placeId: String
        public let url: URL
        public let rooms: [Conference.Track.Room]
        private let latitude: Double
        private let longitude: Double
        
        public var location: (latitude: Double, longitude: Double) {
            return (latitude: latitude, longitude: longitude)
        }
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
