import EmbeddedSwiftUtilities

public struct CSSFontFamily: Sendable, CSSVariableConvertible, CustomStringConvertible, ExpressibleByStringLiteral, ExpressibleByStringInterpolation
{
  public var description: String { value }
  public let value: String

  public init(stringLiteral value: String) {
    self.value = value
  }

  public init(stringInterpolation: DefaultStringInterpolation) {
    self.value = "\(stringInterpolation)"
  }

  public init(_ value: String) {
    self.value = value
  }

  public static func variable(_ name: String) -> CSSFontFamily {
    CSSFontFamily("var(\(name))")
  }

  public init(_ font1: CSSFontFamily, _ font2: CSSFontFamily) {
    self.value = "\(font1.value), \(font2.value)"
  }

  public init(_ font1: CSSFontFamily, _ font2: CSSFontFamily, _ font3: CSSFontFamily) {
    self.value = "\(font1.value), \(font2.value), \(font3.value)"
  }

  public init(
    _ font1: CSSFontFamily, _ font2: CSSFontFamily, _ font3: CSSFontFamily,
    _ font4: CSSFontFamily
  ) {
    self.value = "\(font1.value), \(font2.value), \(font3.value), \(font4.value)"
  }

  // MARK: - MDN Generic Families
  public enum GenericFamily: Sendable, CustomStringConvertible {
    case complete(GenericComplete)
    case incomplete(GenericIncomplete)
    case scriptSpecific(GenericScriptSpecific)

    public var description: String {
      switch self {
      case .complete(let c): return c.rawValue
      case .incomplete(let i): return i.rawValue
      case .scriptSpecific(let s): return "generic(\(s.rawValue))"
      }
    }

    public enum GenericComplete: String, Sendable, CustomStringConvertible {
      public var description: String { rawValue }
      case serif = "serif"
      case sansSerif = "sans-serif"
      case systemUi = "system-ui"
      case cursive = "cursive"
      case fantasy = "fantasy"
      case math = "math"
      case monospace = "monospace"
    }

    public enum GenericIncomplete: String, Sendable, CustomStringConvertible {
      public var description: String { rawValue }
      case uiSerif = "ui-serif"
      case uiSansSerif = "ui-sans-serif"
      case uiMonospace = "ui-monospace"
      case uiRounded = "ui-rounded"
    }

    public enum GenericScriptSpecific: String, Sendable, CustomStringConvertible {
      public var description: String { "generic(\(rawValue))" }
      case fangsong = "fangsong"
      case kai = "kai"
      case khmerMul = "khmer-mul"
      case nastaliq = "nastaliq"
    }
  }
}
