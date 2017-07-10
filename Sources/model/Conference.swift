import Himotoki

public struct Conference {
    public let id: Id<Conference>
    public let schedules: [Schedule]
    public let staffs: [Staff]
    public let venues: [Venue]
    public let sponsors: [Sponsor]
    public let tracks: [Track]
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

// MARK: - Conference.Schedule

extension Conference {
    public struct Schedule {
        public let id: Id<Schedule>
        public let open: Date
        public let close: Date

        public var duration: TimeInterval {
            return close.timeIntervalSince(open)
        }
    }
}

extension Conference.Schedule: Decodable {
    public static func decode(_ e: Extractor) throws -> Conference.Schedule {
        return try Conference.Schedule(
            id: Id(value: e <| "id"),
            open: Date(fromISO8601: e <| "open")!,
            close: Date(fromISO8601: e <| "close")!
        )
    }
}

extension Conference.Schedule: CustomStringConvertible {
    public var description: String {
        return "Schedule(id: \(id), open: \(open), close: \(close))"
    }
}

extension Conference.Schedule: Comparable {
    public static func < (lhs: Conference.Schedule, rhs: Conference.Schedule) -> Bool {
        return lhs.open < rhs.open
    }

    public static func > (lhs: Conference.Schedule, rhs: Conference.Schedule) -> Bool {
        return lhs.close > rhs.close
    }
}

extension Conference.Schedule: Equatable {
    public static func == (lhs: Conference.Schedule, rhs: Conference.Schedule) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Conference.Schedule: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
