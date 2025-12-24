public enum CSSPrefersContrast: String, Sendable {
	case noPreference = "no-preference"
	case more = "more"
	case less = "less"

	public var staticRawValue: StaticString {
		switch self {
		case .noPreference: return "no-preference"
		case .more: return "more"
		case .less: return "less"
		}
	}
}
