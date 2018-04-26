public enum OctavAPIError: Error {
    case connectionError(Error)
    case responseParseError(Error)
    case apiError(Error)
}
