import EmbeddedSwiftUtilities

extension CSS {
  public struct SpreadShadow: Sendable, CSSVariableConvertible {
    public let value: String

    public static var none: CSS.Keyword.None { .none }

    public init(_ value: String) {
      self.value = value
    }

    public init(
      inset: Bool = false,
      offsetX: CSS.Length,
      offsetY: CSS.Length,
      blurRadius: CSS.Length? = nil,
      spreadRadius: CSS.Length? = nil,
      color: CSS.Color? = nil
    ) {
      var res = inset ? "inset " : ""
      res = "\(res)\(offsetX.value) \(offsetY.value)"
      if let blur = blurRadius {
        res = "\(res) \(blur.value)"
      }
      if let spread = spreadRadius {
        res = "\(res) \(spread.value)"
      }
      if let c = color {
        res = "\(res) \(c.value)"
      }
      self.value = res
    }

    public init(
      color: BoxShadowColor? = nil,
      offsetX: CSS.Length,
      offsetY: CSS.Length,
      blur: BoxShadowBlur? = nil,
      spread: BoxShadowSpread? = nil,
      position: BoxShadowPosition? = nil
    ) {
      var res = ""
      if let pos = position, pos == .inset {
        res += "inset "
      }
      res += "\(offsetX.value) \(offsetY.value)"
      if let b = blur {
        res += " \(b.value)"
      }
      if let s = spread {
        res += " \(s.value)"
      }
      if let c = color {
        res += " \(c.value)"
      }
      self.value = res
    }

    public static func variable(_ name: String) -> SpreadShadow {
      SpreadShadow("var(\(name))")
    }

    public struct BoxShadowColor: Sendable, CSSVariableConvertible {
      public let value: String
      public init(_ color: CSS.Color) { self.value = color.value }
      public init(_ value: String) { self.value = value }
      public static func variable(_ name: String) -> BoxShadowColor {
        BoxShadowColor("var(\(name))")
      }
    }

    public enum BoxShadowPosition: String, Sendable {
      case inset = "inset"
    }

    public struct BoxShadowBlur: Sendable, CSSVariableConvertible {
      public let value: String
      public init(_ length: CSS.Length) { self.value = length.value }
      public static func variable(_ name: String) -> BoxShadowBlur {
        BoxShadowBlur(value: "var(\(name))")
      }
      internal init(value: String) { self.value = value }
    }

    public struct BoxShadowSpread: Sendable, CSSVariableConvertible {
      public let value: String
      public init(_ length: CSS.Length) { self.value = length.value }
      public static func variable(_ name: String) -> BoxShadowSpread {
        BoxShadowSpread(value: "var(\(name))")
      }
      internal init(value: String) { self.value = value }
    }
  }
}
