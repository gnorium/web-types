public enum CSSTextOverflow: String, ExpressibleByStringLiteral, Sendable {
	case clip = "clip"
	case ellipsis = "ellipsis"

	public init(stringLiteral value: String) {
		self = CSSTextOverflow(rawValue: value) ?? .clip
	}

	public var staticRawValue: StaticString {
		switch self {
		case .clip: return "clip"
		case .ellipsis: return "ellipsis"
		}
	}
}
