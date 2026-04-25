import EmbeddedSwiftUtilities

public enum CSSBackgroundSize: Sendable, CSSVariableConvertible {
  case contain
  case cover
  case length(Length)
  case percentage(Percentage)
  case custom(String)

  public static var auto: CSSKeyword.Auto { .auto }

  public static func variable(_ name: String) -> CSSBackgroundSize {
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
