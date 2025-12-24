public enum CSSPrefersColorScheme: String, Sendable {
	case light = "light"
	case dark = "dark"

	public var staticRawValue: StaticString {
		switch self {
		case .light: return "light"
		case .dark: return "dark"
		}
	}
}
