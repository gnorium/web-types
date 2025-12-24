// <single-animation-timeline> = auto | none | <dashed-ident> | <scroll()> | <view()>
public enum CSSSingleAnimationTimeline: Sendable {
	case auto(CSSKeyword.Auto)
	case none(CSSKeyword.None)
	case dashedIdent(CSSDashedIdent)
	case scroll(CSSScroll)
	case view(CSSView)

	public var value: String {
		switch self {
		case .auto(let keyword):
			return keyword.rawValue
		case .none(let keyword):
			return keyword.rawValue
		case .dashedIdent(let ident):
			return ident.value
		case .scroll(let scroll):
			return scroll.value
		case .view(let view):
			return view.value
		}
	}
}

