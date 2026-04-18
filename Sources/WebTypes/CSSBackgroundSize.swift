public enum CSSBackgroundSize: Sendable, CSSVariableConvertible {
	case cover
	case contain
	case custom(String)

	public var value: String {
		switch self {
		case .cover: return "cover"
		case .contain: return "contain"
		case .custom(let str): return str
		}
	}

	public static func variable(_ name: String) -> CSSBackgroundSize {
		.custom(concat("var(", name, ")"))
	}
}
