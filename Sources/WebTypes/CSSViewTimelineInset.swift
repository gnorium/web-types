#if os(WASI)

import Utilities

#endif

// <view-timeline-inset> = [ [ auto | <length-percentage> ]{1,2} ]#
public enum CSSViewTimelineInset: Sendable {
	case auto(CSSKeyword.Auto)
	case lengthPercentage(Length)
	case pair(Length, Length)
	case autoPair(CSSKeyword.Auto, CSSKeyword.Auto)
	case mixedPair(CSSKeyword.Auto, Length)
	case mixedPair2(Length, CSSKeyword.Auto)

	public var value: String {
		switch self {
		case .auto(let keyword):
			return keyword.rawValue
		case .lengthPercentage(let lp):
			return lp.value
		case .pair(let lp1, let lp2):
			return "\(lp1.value) \(lp2.value)"
		case .autoPair(let a1, let a2):
			return "\(a1.rawValue) \(a2.rawValue)"
		case .mixedPair(let auto, let lp):
			return "\(auto.rawValue) \(lp.value)"
		case .mixedPair2(let lp, let auto):
			return "\(lp.value) \(auto.rawValue)"
		}
	}
}
