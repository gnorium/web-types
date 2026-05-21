public enum CSSPointerEvents: Sendable {
  case visiblePainted
  case visibleFill
  case visibleStroke
  case visible
  case painted
  case fill
  case stroke

  public static var none: CSSKeyword.None { .none }
  public static var auto: CSSKeyword.Auto { .auto }
  public static var all: CSSKeyword.All { .all }

  public var rawValue: String {
    switch self {
    case .visiblePainted: return "visiblePainted"
    case .visibleFill: return "visibleFill"
    case .visibleStroke: return "visibleStroke"
    case .visible: return "visible"
    case .painted: return "painted"
    case .fill: return "fill"
    case .stroke: return "stroke"
    }
  }
}
