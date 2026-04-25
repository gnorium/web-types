// <single-animation-timeline> = auto | none | <dashed-ident> | <scroll()> | <view()>
public enum CSSSingleAnimationTimeline: Sendable {
  case dashedIdent(CSSDashedIdent)
  case scroll(CSSScroll)
  case view(CSSView)

  public static var none: CSSKeyword.None { .none }
  public static var auto: CSSKeyword.Auto { .auto }

  public var value: String {
    switch self {
    case .dashedIdent(let ident):
      return ident.value
    case .scroll(let scroll):
      return scroll.value
    case .view(let view):
      return view.value
    }
  }
}
