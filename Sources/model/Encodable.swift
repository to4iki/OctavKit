import Foundation

public protocol Encodable {
    func encodeJSON() -> [String: Any]
    func encodeData() -> Data?
}

extension Encodable {
    public func encodeData() -> Data? {
        return try? JSONSerialization.data(withJSONObject: encodeJSON(), options: JSONSerialization.WritingOptions())
    }
}
