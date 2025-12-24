public enum CSSBackgroundSize: String, ExpressibleByStringLiteral, Sendable {
	case cover = "cover"
	case contain = "contain"

	public init(stringLiteral value: String) {
		self = CSSBackgroundSize(rawValue: value) ?? .cover
	}
}
