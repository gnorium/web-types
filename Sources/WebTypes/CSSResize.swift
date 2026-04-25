public enum CSSResize: Sendable {
  case both
  case horizontal
  case vertical
  case block
  case inline

  public static var none: CSSKeyword.None { .none }

  public var rawValue: String {
    switch self {
    case .both: return "both"
    case .horizontal: return "horizontal"
    case .vertical: return "vertical"
    case .block: return "block"
    case .inline: return "inline"
    }
  }
}
