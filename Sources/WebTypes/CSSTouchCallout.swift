public enum CSSTouchCallout: Sendable {
  case `default`

  public static var none: CSSKeyword.None { .none }

  public var rawValue: String {
    switch self {
    case .default: return "default"
    }
  }
}
