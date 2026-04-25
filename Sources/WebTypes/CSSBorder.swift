import EmbeddedSwiftUtilities

public struct CSSBorder: Sendable, CSSVariableConvertible {
  public let value: String

  public static var none: CSSKeyword.None { .none }

  public init(_ value: String) {
    self.value = value
  }

  public init(_ width: Length, _ style: LineStyle, _ color: CSSColor) {
    self.value = "\(width.value) \(style.value) \(color.value)"
  }

  public static func variable(_ name: String) -> CSSBorder {
    CSSBorder("var(\(name))")
  }

  public enum LineWidth: Sendable {
    case length(Length)
    case thin
    case medium
    case thick

    public var value: String {
      switch self {
      case .length(let length): return length.value
      case .thin: return "thin"
      case .medium: return "medium"
      case .thick: return "thick"
      }
    }
  }

  public enum LineStyle: Sendable, CSSVariableConvertible {
    case hidden
    case dotted
    case dashed
    case solid
    case double
    case groove
    case ridge
    case inset
    case outset
    case variable(String)

    public static var none: CSSKeyword.None { .none }

    public var value: String {
      switch self {
      case .hidden: return "hidden"
      case .dotted: return "dotted"
      case .dashed: return "dashed"
      case .solid: return "solid"
      case .double: return "double"
      case .groove: return "groove"
      case .ridge: return "ridge"
      case .inset: return "inset"
      case .outset: return "outset"
      case .variable(let name): return "var(\(name))"
      }
    }
  }
}
