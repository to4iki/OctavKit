extension Conference {
    public struct Schedule: Codable, CustomStringConvertible, Equatable, Hashable {
        public let id: String
        public let open: Date
        public let close: Date

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: Conference.Schedule.CodingKeys.self)
            self.id = try container.decode(String.self, forKey: .id)
            self.open = Date(fromISO8601: try container.decode(String.self, forKey: .open))!
            self.close = Date(fromISO8601: try container.decode(String.self, forKey: .close))!
        }
        
        public var duration: TimeInterval {
            return close.timeIntervalSince(open)
        }

        public var description: String {
            return "Schedule(id: \(id), open: \(open), close: \(close))"
        }
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
