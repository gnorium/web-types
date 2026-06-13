extension CSS {
  public enum ListStyle: Sendable {
    public enum `Type`: Sendable {
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

    public enum Position: String, Sendable {
      case inside = "inside"
      case outside = "outside"

      public var staticRawValue: StaticString {
        switch self {
        case .inside: return "inside"
        case .outside: return "outside"
        }
      }
    }
  }
}
