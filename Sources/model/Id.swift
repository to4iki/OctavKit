public struct Id<T> {
    public let value: String
}

extension Id: CustomStringConvertible {
    public var description: String {
        return "Id(value: \(value))"
    }
}

extension Id: Equatable {
    public static func == (lhs: Id, rhs: Id) -> Bool {
        return lhs.value == rhs.value
    }
}
