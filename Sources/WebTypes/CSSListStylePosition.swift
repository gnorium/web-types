public enum CSSListStylePosition: String, Sendable {
  case inside = "inside"
  case outside = "outside"

  public var staticRawValue: StaticString {
    switch self {
    case .inside: return "inside"
    case .outside: return "outside"
    }
  }
}
