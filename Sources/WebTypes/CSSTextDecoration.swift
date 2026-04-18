#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public enum CSSTextDecoration: Sendable, CSSVariableConvertible {
	case none(CSSKeyword.None)
	case underline
	case overline
	case lineThrough
	case blink
	case variable(String)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }


	public var value: String {
		switch self {
		case .none(let keyword): return keyword.rawValue
		case .underline: return "underline"
		case .overline: return "overline"
		case .lineThrough: return "line-through"
		case .blink: return "blink"
		case .variable(let name): return concat("var(", name, ")")
		}
	}

	public var staticRawValue: StaticString? {
		switch self {
		case .none: return "none"
		case .underline: return "underline"
		case .overline: return "overline"
		case .lineThrough: return "line-through"
		case .blink: return "blink"
		case .variable: return nil
		}
	}
}
