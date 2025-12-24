public enum CSSBackgroundPosition: String, ExpressibleByStringLiteral, Sendable {
	case center = "center"
	case top = "top"
	case bottom = "bottom"
	case left = "left"
	case right = "right"

	public init(stringLiteral value: String) {
		self = CSSBackgroundPosition(rawValue: value) ?? .center
	}
}
