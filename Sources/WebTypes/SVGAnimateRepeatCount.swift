public enum SVGAnimateRepeatCount: Equatable {
	case indefinite
	case count(Int)

	public var value: String {
		switch self {
		case .indefinite: return "indefinite"
		case .count(let n): return String(n)
		}
	}
}
