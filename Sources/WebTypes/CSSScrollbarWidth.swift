import EmbeddedSwiftUtilities

public enum CSSScrollbarWidth: Sendable, CSSVariableConvertible {
	case auto(CSSKeyword.Auto)
	case thin
	case none(CSSKeyword.None)
	case variable(String)

	@_disfavoredOverload
	public static var auto: CSSScrollbarWidth { .auto(.auto) }
	@_disfavoredOverload
	public static var none: CSSScrollbarWidth { .none(.none) }


	public var value: String {
		switch self {
		case .auto(let keyword): return keyword.rawValue
		case .thin: return "thin"
		case .none(let keyword): return keyword.rawValue
		case .variable(let name): return concat("var(", name, ")")
		}
	}

	public var staticRawValue: StaticString? {
		switch self {
		case .auto: return "auto"
		case .thin: return "thin"
		case .none: return "none"
		case .variable: return nil
		}
	}
}
