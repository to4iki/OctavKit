import Foundation
import Himotoki

public struct Session {
    public let id: Id<Session>
    public let room: Conference.Track.Room
    public let speaker: Conference.Speaker
    public let title: String
    public let abstract: String
    public let memo: String?
    public let startsOn: Date
    public let duration: Int
    public let materialLevel: Level
    public let sporkenLanguage: Locale
    public let slideLanguage: Locale
    public let photoRelease: Bool
    public let recordingRelease: Bool
    public let materialsRelease: Bool

    public var endsOn: Date {
        return startsOn.add(second: duration)
    }
}

extension Session {
    public enum Level: String {
        case beginner
        case intermediate
        case advanced
    }
}

extension Session: Encodable {
    public func encodeJSON() -> [String : Any] {
        return [
            "id": id.value,
            "room": room.encodeJSON(),
            "speaker": speaker.encodeJSON(),
            "title": title,
            "abstract": abstract,
            "memo": memo ?? "",
            "starts_on": startsOn.ISO8601String,
            "duration": duration,
            "material_level": materialLevel.rawValue,
            "spoken_language": sporkenLanguage.identifier,
            "slide_language": slideLanguage.identifier,
            "photo_release": photoRelease ? "allow" : "deny",
            "recording_release": recordingRelease ? "allow" : "deny",
            "materials_release": materialsRelease ? "allow" : "deny"
        ]
    }
}

extension Session: Decodable {
    public static func decode(_ e: Extractor) throws -> Session {
        func isRelease(rawValue: String) -> Bool {
            return rawValue == "allow" ? true : false
        }
        func strictString(_ value: String) -> String? {
            if value.isEmpty {
                return nil
            } else {
                return value
            }
        }

        return try Session(
            id: Id(value: e <| "id"),
            room: e <| "room",
            speaker: e <| "speaker",
            title: e <| "title",
            abstract: e <| "abstract",
            memo: strictString(e <| "memo"),
            startsOn: Date(fromISO8601: e <| "starts_on")!,
            duration: e <| "duration",
            materialLevel: Session.Level(rawValue: e <| "material_level")!,
            sporkenLanguage: Locale(identifier: e <| "spoken_language"),
            slideLanguage: Locale(identifier: e <| "slide_language"),
            photoRelease: isRelease(rawValue: e <| "photo_release"),
            recordingRelease: isRelease(rawValue: e <| "recording_release"),
            materialsRelease: isRelease(rawValue: e <| "materials_release")
        )
    }
}

extension Session: CustomStringConvertible {
    public var description: String {
        return "Session(id: \(id), room: \(room), speaker: \(speaker), title: \(title), " +
        "abstract: \(abstract), memo: \(memo.debugDescription), startsOn: \(startsOn), duration: \(duration), " +
        "materialLevel: \(materialLevel.rawValue), sporkenLanguage: \(sporkenLanguage), slideLanguage: \(slideLanguage), " +
        "photoRelease: \(photoRelease), recordingRelease: \(recordingRelease), materialsRelease: \(materialsRelease))"
    }
}

extension Session: Comparable {
    public static func < (lhs: Session, rhs: Session) -> Bool {
        return lhs.startsOn < rhs.startsOn
    }
}

extension Session: Equatable {
    public static func == (lhs: Session, rhs: Session) -> Bool {
        return lhs.id == rhs.id &&
            lhs.room == rhs.room &&
            lhs.speaker == rhs.speaker &&
            lhs.title == rhs.title &&
            lhs.abstract == rhs.abstract &&
            lhs.memo == rhs.memo &&
            lhs.startsOn == rhs.startsOn &&
            lhs.duration == rhs.duration &&
            lhs.materialLevel.rawValue == rhs.materialLevel.rawValue &&
            lhs.sporkenLanguage == rhs.sporkenLanguage &&
            lhs.slideLanguage == rhs.slideLanguage &&
            lhs.photoRelease == rhs.photoRelease &&
            lhs.recordingRelease == rhs.recordingRelease &&
            lhs.materialsRelease == rhs.materialsRelease
    }
}

extension Session: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}