extension CSS {
  public enum ListStyle: Sendable {
    case disc
    case circle
    case square
    case decimal

    public static var none: CSS.Keyword.None { .none }

    public var staticRawValue: StaticString {
      switch self {
      case .disc: return "disc"
      case .circle: return "circle"
      case .square: return "square"
      case .decimal: return "decimal"
      }
    }

    public var rawValue: String {
      switch self {
      case .disc: return "disc"
      case .circle: return "circle"
      case .square: return "square"
      case .decimal: return "decimal"
      }
    }
  }
}
