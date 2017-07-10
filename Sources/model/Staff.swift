import Himotoki

public struct Staff {
    public let id: Id<Track>
    public let name: String
}

extension Track: Decodable {
    public static func decode(_ e: Extractor) throws -> Track {
        return try Track(
            id: Id(value: e <| "id"),
            name: e <| "name"
        )
    }
}
