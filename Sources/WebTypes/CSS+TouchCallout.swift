extension CSS {
  public enum TouchCallout: Sendable {
    case `default`

    public static var none: CSS.Keyword.None { .none }

    public var rawValue: String {
      switch self {
      case .default: return "default"
      }
    }
  }
}
