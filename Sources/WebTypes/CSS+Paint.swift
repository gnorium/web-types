import EmbeddedSwiftUtilities

extension CSS {
  public enum Paint: Sendable {
    case currentColor
    case color(CSS.Color)
    case url(String)
    case urlWithFallback(String, CSS.Color)
    case contextFill
    case contextStroke

    public init(_ color: CSS.Color) {
      self = .color(color)
    }

    public static var auto: CSS.Keyword.Auto { .auto }
    public static var none: CSS.Keyword.None { .none }

    public var value: String {
      switch self {
      case .currentColor:
        return "currentColor"
      case .color(let color):
        return color.value
      case .url(let urlValue):
        return WebTypes.url(urlValue)
      case .urlWithFallback(let urlValue, let fallback):
        return "\(WebTypes.url(urlValue)) \(fallback.value)"
      case .contextFill:
        return "context-fill"
      case .contextStroke:
        return "context-stroke"
      }
    }
  }
}
