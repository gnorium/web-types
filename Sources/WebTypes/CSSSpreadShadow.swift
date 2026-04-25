import EmbeddedSwiftUtilities

public struct CSSSpreadShadow: Sendable, CSSVariableConvertible {
  public let value: String

  public static var none: CSSKeyword.None { .none }

  public init(_ value: String) {
    self.value = value
  }

  public init(
    inset: Bool = false,
    offsetX: Length,
    offsetY: Length,
    blurRadius: Length? = nil,
    spreadRadius: Length? = nil,
    color: CSSColor? = nil
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
    offsetX: Length,
    offsetY: Length,
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

  public static func variable(_ name: String) -> CSSSpreadShadow {
    CSSSpreadShadow("var(\(name))")
  }

  public struct BoxShadowColor: Sendable, CSSVariableConvertible {
    public let value: String
    public init(_ color: CSSColor) { self.value = color.value }
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
    public init(_ length: Length) { self.value = length.value }
    public static func variable(_ name: String) -> BoxShadowBlur {
      BoxShadowBlur(value: "var(\(name))")
    }
    internal init(value: String) { self.value = value }
  }

  public struct BoxShadowSpread: Sendable, CSSVariableConvertible {
    public let value: String
    public init(_ length: Length) { self.value = length.value }
    public static func variable(_ name: String) -> BoxShadowSpread {
      BoxShadowSpread(value: "var(\(name))")
    }
    internal init(value: String) { self.value = value }
  }
}
