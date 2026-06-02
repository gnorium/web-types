extension CSS {
  public enum FieldSizing: String, Sendable {
    case content = "content"
    case fixed = "fixed"

    public init(stringLiteral value: String) {
      self = FieldSizing(rawValue: value) ?? .fixed
    }

    public var staticRawValue: StaticString {
      switch self {
      case .content: return "content"
      case .fixed: return "fixed"
      }
    }
  }
}
