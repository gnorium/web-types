public enum CSSSingleAnimationFillMode: Sendable {
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }

	case forwards
	case backwards
	case both

    public var rawValue: String {
        switch self {
        case .none(let keyword): return keyword.rawValue
        case .forwards: return "forwards"
        case .backwards: return "backwards"
        case .both: return "both"
        }
    }
}
