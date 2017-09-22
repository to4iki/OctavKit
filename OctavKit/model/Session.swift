import Foundation

public struct Session: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case room
        case speaker
        case title
        case abstract
        case memo
        case startsOn = "starts_on"
        case duration
        case materialLevel = "material_level"
    }
    
    public enum Level: String, Codable {
        case beginner
        case intermediate
        case advanced
    }

    public let id: String
    public let room: Conference.Track.Room
    public let speaker: Conference.Speaker
    public let title: String
    public let abstract: String
    public let memo: String?
    public let startsOn: Date
    public let duration: Int
    public let materialLevel: Level

    public var endsOn: Date {
        return startsOn.add(second: duration)
    }
    
    public init(from decoder: Decoder) throws {
        func strictString(_ value: String) -> String? {
            if value.isEmpty {
                return nil
            } else {
                return value
            }
        }
        
        let container = try decoder.container(keyedBy: Session.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.room = try container.decode(Conference.Track.Room.self, forKey: .room)
        self.speaker = try container.decode(Conference.Speaker.self, forKey: .speaker)
        self.title = try container.decode(String.self, forKey: .title)
        self.abstract = try container.decode(String.self, forKey: .abstract)
        self.memo = strictString(try container.decode(String.self, forKey: .memo))
        self.startsOn = Date(fromISO8601: try container.decode(String.self, forKey: .startsOn))!
        self.duration = try container.decode(Int.self, forKey: .duration)
        self.materialLevel = try container.decode(Level.self, forKey: .materialLevel)
    }
}

extension Session: CustomStringConvertible {
    public var description: String {
        return "Session(id: \(id), room: \(room), speaker: \(speaker), title: \(title), " +
        "abstract: \(abstract), memo: \(memo.debugDescription), startsOn: \(startsOn), duration: \(duration), " +
        "materialLevel: \(materialLevel.rawValue))"
    }
}

extension Session: Comparable {
    public static func < (lhs: Session, rhs: Session) -> Bool {
        return lhs.startsOn < rhs.startsOn
    }
}

extension Session: Equatable {
    public static func == (lhs: Session, rhs: Session) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Session: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
