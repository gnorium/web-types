import EmbeddedSwiftUtilities

extension CSS {
  public enum BackgroundPosition: Sendable, CSSVariableConvertible {
    case top
    case bottom
    case left
    case right
    case center
    case length(CSS.Length)
    case percentage(CSS.Percentage)
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
}
