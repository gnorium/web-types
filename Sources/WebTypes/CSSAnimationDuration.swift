// <animation-duration> = [ auto | <time [0s,∞]> ]
public enum CSSAnimationDuration: Sendable {
	case auto(CSSKeyword.Auto)
	case time(CSSTime)

	public var value: String {
		switch self {
		case .auto(let keyword):
			return keyword.rawValue
		case .time(let time):
			return time.value
		}
	}
	public init(_ time: CSSTime) {
		self = .time(time)
	}
}
