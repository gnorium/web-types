import EmbeddedSwiftUtilities

extension CSS {
  public enum BackgroundSize: Sendable, CSSVariableConvertible {
    case contain
    case cover
    case length(CSS.Length)
    case percentage(CSS.Percentage)
    case custom(String)

    public static var auto: CSS.Keyword.Auto { .auto }

    public static func variable(_ name: String) -> CSS.BackgroundSize {
      .custom("var(\(name))")
    }

    public var value: String {
      switch self {
      case .contain: return "contain"
      case .cover: return "cover"
      case .length(let l): return l.value
      case .percentage(let p): return p.value
      case .custom(let s): return s
      }
    }
  }
}
