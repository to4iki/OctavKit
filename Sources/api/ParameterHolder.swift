import Foundation

struct ParamtersHolder {
    private enum Key: String {
        case conferenceId = "conference_id"
        case lang
    }

    private(set) static var dictionary: [String: Any] = [:]
    private init() {}

    static var settedConferenceId: Bool {
        return dictionary[Key.conferenceId.rawValue] != nil
    }

    static func setConferenceId(_ value: String) {
        dictionary[Key.conferenceId.rawValue] = value
    }

    static func setLocale(_ value: Locale) {
        guard let languageCode = value.languageCode else { return }
        dictionary[Key.lang.rawValue] = languageCode
    }
}
