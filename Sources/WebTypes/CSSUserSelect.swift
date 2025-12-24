public enum CSSUserSelect: String, Sendable {
	case none = "none"
	case auto = "auto"
	case text = "text"
	case contain = "contain"

	public var staticRawValue: StaticString {
		switch self {
		case .none: return "none"
		case .auto: return "auto"
		case .text: return "text"
		case .contain: return "contain"
		}
	}
}
