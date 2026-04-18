public enum CSSOutline: Sendable {
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }

	case inherit
	case initial

    public var rawValue: String {
        switch self {
        case .none(let keyword): return keyword.rawValue
        case .inherit: return "inherit"
        case .initial: return "initial"
        }
    }
}
