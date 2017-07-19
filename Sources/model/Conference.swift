import Himotoki

public struct Conference {
    public let id: Id<Conference>
    public let schedules: [Schedule]
    public let staffs: [Staff]
    public let venues: [Venue]
    public let sponsors: [Sponsor]
    public let tracks: [Track]
}

extension Conference: Encodable {
    public func encodeJSON() -> [String : Any] {
        return [
            "id": id.value,
            "dates": schedules.map({ $0.encodeJSON() }),
            "administrators": staffs.map({ $0.encodeJSON() }),
            "venues": venues.map({ $0.encodeJSON() }),
            "sponsors": sponsors.map({ $0.encodeJSON() }),
            "tracks": tracks.map({ $0.encodeJSON() })
        ]
    }
}

extension Conference: Decodable {
    public static func decode(_ e: Extractor) throws -> Conference {
        return try Conference(
            id: Id(value: e <| "id"),
            schedules: e <|| "dates",
            staffs: e <|| "administrators",
            venues: e <|| "venues",
            sponsors: e <|| "sponsors",
            tracks: e <|| "tracks"
        )
    }
}

extension Conference: CustomStringConvertible {
    public var description: String {
        return "Conference(id: \(id), schedules: \(schedules), staffs: \(staffs), " +
        "venues: \(venues), sponsors: \(sponsors), tracks: \(tracks))"
    }
}

extension Conference: Equatable {
    public static func == (lhs: Conference, rhs: Conference) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Conference: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
