import EmbeddedSwiftUtilities

extension CSS {
  public enum BackgroundClip: Sendable, CSSVariableConvertible {
    case borderBox
    case paddingBox
    case contentBox
    case text
    case variable(String)

    public var value: String {
      switch self {
      case .borderBox: return "border-box"
      case .paddingBox: return "padding-box"
      case .contentBox: return "content-box"
      case .text: return "text"
      case .variable(let name): return "var(\(name))"
      }
    }

    public var staticRawValue: StaticString? {
      switch self {
      case .borderBox: return "border-box"
      case .paddingBox: return "padding-box"
      case .contentBox: return "content-box"
      case .text: return "text"
      case .variable: return nil
      }
    }
  }
}
