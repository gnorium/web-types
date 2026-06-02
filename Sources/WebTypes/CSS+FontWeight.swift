import EmbeddedSwiftUtilities

extension CSS {
  public enum FontWeight: Sendable, CSSVariableConvertible, ExpressibleByIntegerLiteral {
    case normal
    case bold
    case lighter
    case bolder
    case number(Int)
    case variable(String)

    public init(integerLiteral value: Int) {
      self = .number(value)
    }

    public var value: String {
      switch self {
      case .normal: return "normal"
      case .bold: return "bold"
      case .lighter: return "lighter"
      case .bolder: return "bolder"
      case .number(let n): return intToString(n)
      case .variable(let name): return "var(\(name))"
      }
    }

    public var staticRawValue: StaticString? {
      switch self {
      case .normal: return "normal"
      case .bold: return "bold"
      case .lighter: return "lighter"
      case .bolder: return "bolder"
      case .number, .variable: return nil
      }
    }
  }
}
