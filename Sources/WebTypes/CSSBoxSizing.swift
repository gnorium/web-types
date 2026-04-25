import EmbeddedSwiftUtilities

public enum CSSBoxSizing: Sendable, CSSVariableConvertible {
  case contentBox
  case borderBox
  case variable(String)

  public var value: String {
    switch self {
    case .contentBox: return "content-box"
    case .borderBox: return "border-box"
    case .variable(let name): return "var(\(name))"
    }
  }

  public var staticRawValue: StaticString? {
    switch self {
    case .contentBox: return "content-box"
    case .borderBox: return "border-box"
    case .variable: return nil
    }
  }
}
