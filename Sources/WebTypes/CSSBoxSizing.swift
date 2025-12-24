public enum CSSBoxSizing: String, ExpressibleByStringLiteral, Sendable {
	case contentBox = "content-box"
	case borderBox = "border-box"

	public init(stringLiteral value: String) {
		self = CSSBoxSizing(rawValue: value) ?? .borderBox
	}
    
    public var staticRawValue: StaticString {
        switch self {
        case .contentBox: return "content-box"
        case .borderBox: return "border-box"
        }
    }
}
