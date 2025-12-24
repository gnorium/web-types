public enum CSSVisibility: String, Sendable {
	case visible = "visible"
	case hidden = "hidden"
	case collapse = "collapse"
	case inherit = "inherit"
	case initial = "initial"
	case revert = "revert"
	case revertLayer = "revert-layer"
	case unset = "unset"

	public var staticRawValue: StaticString {
		switch self {
		case .visible: return "visible"
		case .hidden: return "hidden"
		case .collapse: return "collapse"
		case .inherit: return "inherit"
		case .initial: return "initial"
		case .revert: return "revert"
		case .revertLayer: return "revert-layer"
		case .unset: return "unset"
		}
	}
}
