public enum CSSObjectFit: Sendable {
	case fill
	case contain
	case cover
	case none(CSSKeyword.None)
    
	@_disfavoredOverload
	public static var none: Self { .none(.none) }

	case scaleDown

    public var rawValue: String {
        switch self {
        case .fill: return "fill"
        case .contain: return "contain"
        case .cover: return "cover"
        case .none(let keyword): return keyword.rawValue
        case .scaleDown: return "scale-down"
        }
    }
}
