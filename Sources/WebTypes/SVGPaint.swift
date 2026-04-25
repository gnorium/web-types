import EmbeddedSwiftUtilities

public enum SVGPaint: Sendable {
  case currentColor
  case color(CSSColor)
  case url(String)
  case urlWithFallback(String, CSSColor)
  case contextFill
  case contextStroke

  public init(_ color: CSSColor) {
    self = .color(color)
  }

  public static var auto: CSSKeyword.Auto { .auto }
  public static var none: CSSKeyword.None { .none }

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
