public enum CSSOrientation: Sendable {
	case portrait
	case landscape

	public var rawValue: StaticString {
		switch self {
			case .portrait: return "portrait"
			case .landscape: return "landscape"
		}
	}
}
