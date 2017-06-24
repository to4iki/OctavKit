import Himotoki

public struct Session {
    public let id: Id<Session>
    public let conference: Conference
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
            conference: Conference(id: Id(value: e <| "conference_id")),
            room: e <| "room",
            speaker: e <| "speaker",
            title: e <| "title",
            abstract: e <| "abstract",
            memo: e <| "memo"
        )
    }
}
