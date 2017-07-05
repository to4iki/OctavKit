import Himotoki

public struct Session {
    public let id: Id<Session>
    public let room: Room
    public let speaker: Speaker
    public let title: String
    public let abstract: String
    public let memo: String
}

extension Session {
    public enum Level {
        case beginner
        case intermediate
        case advanced
    }
}

extension Session: Decodable {
    public static func decode(_ e: Extractor) throws -> Session {
        return try Session(
            id: Id(value: e <| "id"),
            room: e <| "room",
            speaker: e <| "speaker",
            title: e <| "title",
            abstract: e <| "abstract",
            memo: e <| "memo"
        )
    }
}

extension Session: CustomStringConvertible {
    public var description: String {
        return "Session(id: \(id), room: \(room), speaker: \(speaker), title: \(title), abstract: \(abstract), memo: \(memo))"
    }
}

extension Session: Equatable {
    public static func == (lhs: Session, rhs: Session) -> Bool {
        return lhs.id == rhs.id &&
            lhs.room == rhs.room &&
            lhs.speaker == rhs.speaker &&
            lhs.title == rhs.title &&
            lhs.abstract == rhs.abstract &&
            lhs.memo == rhs.memo
    }
}
