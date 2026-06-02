extension CSS {
  public enum UserSelect: Sendable {
    case text
    case contain

    public static var none: CSS.Keyword.None { .none }
    public static var auto: CSS.Keyword.Auto { .auto }

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
}
