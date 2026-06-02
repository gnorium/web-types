// <single-animation-timeline> = auto | none | <dashed-ident> | <scroll()> | <view()>
extension CSS {
  public enum SingleAnimationTimeline: Sendable {
    case dashedIdent(CSS.DashedIdent)
    case scroll(CSS.Scroll)
    case view(CSS.View)

    public static var none: CSS.Keyword.None { .none }
    public static var auto: CSS.Keyword.Auto { .auto }

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
}
