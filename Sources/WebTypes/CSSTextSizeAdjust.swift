public enum CSSTextSizeAdjust: Sendable {
	case none(CSSKeyword.None)
	case auto(CSSKeyword.Auto)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }
	@_disfavoredOverload
	public static var auto: Self { .auto(.auto) }

    public var rawValue: String {
        switch self {
        case .none(let keyword): return keyword.rawValue
        case .auto(let keyword): return keyword.rawValue
        }
    }
}
