public enum CSSUserSelect: Sendable {
	case none(CSSKeyword.None)
	case auto(CSSKeyword.Auto)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }
	@_disfavoredOverload
	public static var auto: Self { .auto(.auto) }

	case text
	case contain

	public init(_ keyword: CSSKeyword.None) {
		self = .none(keyword)
	}

	public init(_ keyword: CSSKeyword.Auto) {
		self = .auto(keyword)
	}

	public var staticRawValue: StaticString {
		switch self {
		case .none(let keyword): return keyword.staticRawValue
		case .auto(let keyword): return keyword.staticRawValue
		case .text: return "text"
		case .contain: return "contain"
		}
	}

	public var rawValue: String {
		switch self {
		case .none(let keyword): return keyword.rawValue
		case .auto(let keyword): return keyword.rawValue
		case .text: return "text"
		case .contain: return "contain"
		}
	}
}
