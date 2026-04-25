public enum CSSFieldSizing: String, Sendable {
  case content = "content"
  case fixed = "fixed"

  public init(stringLiteral value: String) {
    self = CSSFieldSizing(rawValue: value) ?? .fixed
  }

  public var staticRawValue: StaticString {
    switch self {
    case .content: return "content"
    case .fixed: return "fixed"
    }
  }
}
