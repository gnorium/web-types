extension CSS {
  public enum TouchAction: Sendable {
    case auto
    case manipulation
    case panX
    case panY
    case pinchZoom

    public static var none: CSS.Keyword.None { .none }

    public var rawValue: String {
      switch self {
      case .auto: return "auto"
      case .manipulation: return "manipulation"
      case .panX: return "pan-x"
      case .panY: return "pan-y"
      case .pinchZoom: return "pinch-zoom"
      }
    }
  }
}
