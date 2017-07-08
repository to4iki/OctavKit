import Foundation

extension Date {
    private static let ISO8601Formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        return dateFormatter
    }()

    init?(fromISO8601 string: String) {
        guard let date = Date.ISO8601Formatter.date(from: string) else { return nil }
        self = date
    }
}
