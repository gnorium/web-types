#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public enum CSSTextOverflow: Sendable, CSSVariableConvertible {
	case clip
	case ellipsis
	case variable(String)

	public var value: String {
		switch self {
		case .clip: return "clip"
		case .ellipsis: return "ellipsis"
		case .variable(let name): return concat("var(", name, ")")
		}
	}

	public var staticRawValue: StaticString? {
		switch self {
		case .clip: return "clip"
		case .ellipsis: return "ellipsis"
		case .variable: return nil
		}
	}
}
