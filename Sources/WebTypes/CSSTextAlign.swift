public enum CSSTextAlign: String, Sendable {
  case left = "left"
  case right = "right"
  case center = "center"
  case justify = "justify"
  case start = "start"
  case end = "end"

  public var staticRawValue: StaticString {
    switch self {
    case .left: return "left"
    case .right: return "right"
    case .center: return "center"
    case .justify: return "justify"
    case .start: return "start"
    case .end: return "end"
    }
  }
}
