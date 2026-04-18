public enum CSSPointerEvents: Sendable {
	case auto(CSSKeyword.Auto)
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var auto: Self { .auto(.auto) }
	@_disfavoredOverload
	public static var none: Self { .none(.none) }

	case visiblePainted
	case visibleFill
	case visibleStroke
	case visible
	case painted
	case fill
	case stroke

    public var rawValue: String {
        switch self {
        case .auto(let keyword): return keyword.rawValue
        case .none(let keyword): return keyword.rawValue
        case .visiblePainted: return "visiblePainted"
        case .visibleFill: return "visibleFill"
        case .visibleStroke: return "visibleStroke"
        case .visible: return "visible"
        case .painted: return "painted"
        case .fill: return "fill"
        case .stroke: return "stroke"
        }
    }
}
