import EmbeddedSwiftUtilities

public enum CSSBackgroundPosition: Sendable, CSSVariableConvertible {
  case top
  case bottom
  case left
  case right
  case center
  case length(Length)
  case percentage(Percentage)
  case variable(String)

  public var value: String {
    switch self {
    case .top: return "top"
    case .bottom: return "bottom"
    case .left: return "left"
    case .right: return "right"
    case .center: return "center"
    case .length(let l): return l.value
    case .percentage(let p): return p.value
    case .variable(let name): return "var(\(name))"
    }
  }

  public var staticRawValue: StaticString? {
    switch self {
    case .top: return "top"
    case .bottom: return "bottom"
    case .left: return "left"
    case .right: return "right"
    case .center: return "center"
    case .length, .percentage, .variable: return nil
    }
  }
}
