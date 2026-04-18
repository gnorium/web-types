#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public enum CSSBackgroundPosition: Sendable, CSSVariableConvertible {
	case center
	case top
	case bottom
	case left
	case right
	case variable(String)

	public var value: String {
		switch self {
		case .center: return "center"
		case .top: return "top"
		case .bottom: return "bottom"
		case .left: return "left"
		case .right: return "right"
		case .variable(let name): return concat("var(", name, ")")
		}
	}
    
    public var staticRawValue: StaticString? {
		switch self {
		case .center: return "center"
		case .top: return "top"
		case .bottom: return "bottom"
		case .left: return "left"
		case .right: return "right"
		case .variable: return nil
		}
	}
}
