public enum CSSListStyle: String, Sendable {
	case none = "none"
	case disc = "disc"
	case circle = "circle"
	case square = "square"
	case decimal = "decimal"

	public var staticRawValue: StaticString {
		switch self {
		case .none: return "none"
		case .disc: return "disc"
		case .circle: return "circle"
		case .square: return "square"
		case .decimal: return "decimal"
		}
	}
}
