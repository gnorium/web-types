import EmbeddedSwiftUtilities

public enum CSSScrollbarWidth: Sendable, CSSVariableConvertible {
  case thin
  case variable(String)

  public static var auto: CSSKeyword.Auto { .auto }
  public static var none: CSSKeyword.None { .none }

  public var value: String {
    switch self {
    case .thin: return "thin"
    case .variable(let name): return "var(\(name))"
    }
  }

  public var staticRawValue: StaticString? {
    switch self {
    case .thin: return "thin"
    case .variable: return nil
    }
  }
}
