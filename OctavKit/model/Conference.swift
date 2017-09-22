public struct Conference: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case about = "description"
        case contact = "contact_information"
        case schedules = "dates"
        case staffs = "administrators"
        case venues
        case sponsors
        case tracks
    }
    
    public let id: String
    public let title: String
    public let about: String
    public let contact: String
    public let schedules: [Schedule]
    public let staffs: [Staff]
    public let venues: [Venue]
    public let sponsors: [Sponsor]
    public let tracks: [Track]
}

extension Conference: CustomStringConvertible {
    public var description: String {
        return "Conference(id: \(id), title: \(title), about: \(about), contact: \(contact), schedules: \(schedules), " +
        "staffs: \(staffs), venues: \(venues), sponsors: \(sponsors), tracks: \(tracks))"
    }
}

extension Conference: Equatable {
    public static func == (lhs: Conference, rhs: Conference) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Conference: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
