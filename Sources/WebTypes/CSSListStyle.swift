public enum CSSListStyle: Sendable {
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }

	case disc
	case circle
	case square
	case decimal

	public var staticRawValue: StaticString {
		switch self {
		case .none(let keyword): return keyword.staticRawValue
		case .disc: return "disc"
		case .circle: return "circle"
		case .square: return "square"
		case .decimal: return "decimal"
		}
	}

	public var rawValue: String {
		switch self {
		case .none(let keyword): return keyword.rawValue
		case .disc: return "disc"
		case .circle: return "circle"
		case .square: return "square"
		case .decimal: return "decimal"
		}
	}
}
