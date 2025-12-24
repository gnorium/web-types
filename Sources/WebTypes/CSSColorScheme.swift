public enum CSSColorScheme: String, Sendable {
	case normal = "normal"
	case light = "light"
	case dark = "dark"
	case onlyLight = "only light"

	// Global values (from CSSKeyword.Global)
	case inherit = "inherit"
	case initial = "initial"
	case revert = "revert"
	case revertLayer = "revert-layer"
	case unset = "unset"

	public var staticRawValue: StaticString {
		switch self {
			case .normal: return "normal"
			case .light: return "light"
			case .dark: return "dark"
			case .onlyLight: return "only light"
			case .inherit: return "inherit"
			case .initial: return "initial"
			case .revert: return "revert"
			case .revertLayer: return "revert-layer"
			case .unset: return "unset"
		}
	}
}
