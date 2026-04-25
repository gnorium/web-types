public enum CSSAlignItems: String {
  case flexStart = "flex-start"
  case flexEnd = "flex-end"
  case center = "center"
  case baseline = "baseline"
  case stretch = "stretch"

  public var staticRawValue: StaticString {
    switch self {
    case .flexStart: return "flex-start"
    case .flexEnd: return "flex-end"
    case .center: return "center"
    case .baseline: return "baseline"
    case .stretch: return "stretch"
    }
  }
}
