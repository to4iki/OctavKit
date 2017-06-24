struct TokenHolder {
    private(set) static var value: String = ""

    private init() {}

    static func set(_ value: String) {
        TokenHolder.value = value
    }
}
