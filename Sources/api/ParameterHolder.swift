import Foundation

struct ParamtersHolder {
    private enum Key: String {
        case conferenceId = "conference_id"
        case lang
    }

    private(set) static var dictionary: [String: Any] = [:]
    private init() {}
    
    static var conferenceId: String {
        get {
            return dictionary[Key.conferenceId.rawValue] as! String
        }
        set {
            dictionary[Key.conferenceId.rawValue] = newValue
        }
    }
    
    static var langCode: String? {
        return dictionary[Key.lang.rawValue] as? String
    }

    static func setLocale(_ value: Locale) {
        guard let languageCode = value.languageCode else { return }
        dictionary[Key.lang.rawValue] = languageCode
    }
}
