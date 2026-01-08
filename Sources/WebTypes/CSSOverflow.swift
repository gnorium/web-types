public enum CSSOverflow: String, Sendable {
	case visible = "visible"
	case hidden = "hidden"
	case scroll = "scroll"
	case auto = "auto"
	case clip = "clip"

	public init(_ keyword: CSSKeyword.Auto) {
		self = .auto
	}

	public var staticRawValue: StaticString {
		switch self {
		case .visible: return "visible"
		case .hidden: return "hidden"
		case .scroll: return "scroll"
		case .auto: return "auto"
		case .clip: return "clip"
		}
	}
}
