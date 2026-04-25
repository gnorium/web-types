public enum CSSUserSelect: Sendable {
  case text
  case contain

  public static var none: CSSKeyword.None { .none }
  public static var auto: CSSKeyword.Auto { .auto }

  public var staticRawValue: StaticString {
    switch self {
    case .text: return "text"
    case .contain: return "contain"
    }
  }

  public var rawValue: String {
    switch self {
    case .text: return "text"
    case .contain: return "contain"
    }
  }
}
