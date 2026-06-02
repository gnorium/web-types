import EmbeddedSwiftUtilities

extension CSS {
  public struct TextDecoration: Sendable, CSSVariableConvertible {
    public let value: String

    public init(_ line: Line) {
      self.value = line.value
    }

    public init(_ line: Line, _ style: Style) {
      self.value = "\(line.value) \(style.rawValue)"
    }

    public init(_ line: Line, _ style: Style, _ color: CSS.Color) {
      self.value = "\(line.value) \(style.rawValue) \(color.value)"
    }

    public init(_ line: Line, _ style: Style, _ color: CSS.Color, _ thickness: Thickness) {
      self.value = "\(line.value) \(style.rawValue) \(color.value) \(thickness.value)"
    }

    public init(_ value: String) {
      self.value = value
    }

    public static func variable(_ name: String) -> TextDecoration {
      TextDecoration("var(\(name))")
    }

    public var staticRawValue: StaticString? {
      return nil
    }

    public enum Line: Sendable, CSSVariableConvertible {
      case underline
      case overline
      case lineThrough
      case blink
      case variable(String)

      public static var none: CSS.Keyword.None { .none }

      public var value: String {
        switch self {
        case .underline: return "underline"
        case .overline: return "overline"
        case .lineThrough: return "line-through"
        case .blink: return "blink"
        case .variable(let name): return "var(\(name))"
        }
      }

      public var staticRawValue: StaticString? {
        switch self {
        case .underline: return "underline"
        case .overline: return "overline"
        case .lineThrough: return "line-through"
        case .blink: return "blink"
        case .variable: return nil
        }
      }
    }

    public enum Style: String, Sendable {
      case solid = "solid"
      case double = "double"
      case dotted = "dotted"
      case dashed = "dashed"
      case wavy = "wavy"

      public var staticRawValue: StaticString {
        switch self {
        case .solid: return "solid"
        case .double: return "double"
        case .dotted: return "dotted"
        case .dashed: return "dashed"
        case .wavy: return "wavy"
        }
      }
    }

    public struct Thickness: Sendable, CSSVariableConvertible {
      public let value: String

      public static var inherit: CSS.Keyword.Inherit { .inherit }
      public static var initial: CSS.Keyword.Initial { .initial }
      public static var revert: CSS.Keyword.Revert { .revert }
      public static var revertLayer: CSS.Keyword.RevertLayer { .revertLayer }
      public static var unset: CSS.Keyword.Unset { .unset }

      public init(_ length: CSS.Length) {
        self.value = length.value
      }

      public init(_ percentage: CSS.Percentage) {
        self.value = percentage.value
      }

      public init(_ value: String) {
        self.value = value
      }

      public static var auto: CSS.Keyword.Auto { .auto }

      public static var fromFont: Thickness {
        Thickness("from-font")
      }

      public static func variable(_ name: String) -> Thickness {
        Thickness("var(\(name))")
      }

      public var staticRawValue: StaticString? {
        if stringEquals(value, "from-font") {
          return "from-font"
        }
        return nil
      }
    }
  }
}
