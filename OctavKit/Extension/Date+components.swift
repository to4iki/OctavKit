import Foundation

extension Date {
    var year: Int {
        return components.year!
    }

    var month: Int {
        return components.month!
    }

    var weekday: Int {
        return components.weekday!
    }

    var day: Int {
        return components.day!
    }

    var hour: Int {
        return components.hour!
    }

    var minute: Int {
        return components.minute!
    }

    var second: Int {
        return components.second!
    }

    func add(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date! {
        var components = self.components
        components.year = year ?? self.year
        components.month = month ?? self.month
        components.day = day ?? self.day
        components.hour = hour ?? self.hour
        components.minute = minute ?? self.minute
        components.second = second ?? self.second
        return calendar.date(from: components)
    }

    static func date(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) -> Date {
        let now = Date()
        return now.add(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }
}

extension Date {
    private var components: DateComponents {
        return calendar.dateComponents([.year, .month, .weekday, .day, .hour, .minute, .second], from: self)
    }

    private var calendar: Calendar {
        return Calendar(identifier: Calendar.Identifier.gregorian)
    }
}
