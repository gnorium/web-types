public enum CSSTouchCallout: Sendable {
	case `default`
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }

    public var rawValue: String {
        switch self {
        case .default: return "default"
        case .none(let keyword): return keyword.rawValue
        }
    }
}
