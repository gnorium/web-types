extension CSS {
  public enum ObjectFit: Sendable {
    case fill
    case contain
    case cover
    case scaleDown

    public static var none: CSS.Keyword.None { .none }

    public var rawValue: String {
      switch self {
      case .fill: return "fill"
      case .contain: return "contain"
      case .cover: return "cover"
      case .scaleDown: return "scale-down"
      }
    }
  }
}
