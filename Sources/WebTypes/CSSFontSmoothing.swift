public enum CSSFontSmoothing: Sendable {
	case auto(CSSKeyword.Auto)
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var auto: Self { .auto(.auto) }
	@_disfavoredOverload
	public static var none: Self { .none(.none) }
	case antialiased
	case subpixelAntialiased
	case grayscale

    public var rawValue: String {
        switch self {
        case .auto(let keyword): return keyword.rawValue
        case .none(let keyword): return keyword.rawValue
        case .antialiased: return "antialiased"
        case .subpixelAntialiased: return "subpixel-antialiased"
        case .grayscale: return "grayscale"
        }
    }
}
