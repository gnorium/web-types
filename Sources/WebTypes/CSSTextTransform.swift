public enum CSSTextTransform: Sendable {
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }

	case capitalize
	case uppercase
	case lowercase
	case fullWidth
	case fullSizeKana

    public var rawValue: String {
        switch self {
        case .none(let keyword): return keyword.rawValue
        case .capitalize: return "capitalize"
        case .uppercase: return "uppercase"
        case .lowercase: return "lowercase"
        case .fullWidth: return "full-width"
        case .fullSizeKana: return "full-size-kana"
        }
    }
}
