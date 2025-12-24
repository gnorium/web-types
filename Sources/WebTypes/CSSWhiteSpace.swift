public enum CSSWhiteSpace: String, Sendable {
	case normal = "normal"
	case nowrap = "nowrap"
	case pre = "pre"
	case preWrap = "pre-wrap"
	case preLine = "pre-line"
	case breakSpaces = "break-spaces"

	public var staticRawValue: StaticString {
		switch self {
		case .normal: return "normal"
		case .nowrap: return "nowrap"
		case .pre: return "pre"
		case .preWrap: return "pre-wrap"
		case .preLine: return "pre-line"
		case .breakSpaces: return "break-spaces"
		}
	}
}
