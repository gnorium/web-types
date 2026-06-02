import EmbeddedSwiftUtilities

extension CSS {
  public enum ScrollbarWidth: Sendable, CSSVariableConvertible {
    case thin
    case variable(String)

    public static var auto: CSS.Keyword.Auto { .auto }
    public static var none: CSS.Keyword.None { .none }

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
}
