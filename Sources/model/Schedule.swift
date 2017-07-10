import Himotoki

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
