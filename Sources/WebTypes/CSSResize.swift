public enum CSSResize: Sendable {
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }

	case both
	case horizontal
	case vertical
	case block
	case inline

    public var rawValue: String {
        switch self {
        case .none(let keyword): return keyword.rawValue
        case .both: return "both"
        case .horizontal: return "horizontal"
        case .vertical: return "vertical"
        case .block: return "block"
        case .inline: return "inline"
        }
    }
}
