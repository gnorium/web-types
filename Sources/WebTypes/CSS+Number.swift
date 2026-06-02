import EmbeddedSwiftUtilities

extension CSS {
  public struct Number: Sendable, CSSVariableConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral
  {
    public let value: String

    public init(integerLiteral value: Int) {
      self.value = intToString(value)
    }

    public init(floatLiteral value: Double) {
      self.value = doubleToString(value)
    }

    internal init(_ value: String) {
      self.value = value
    }

    public static func variable(_ name: String) -> Number {
      Number("var(\(name))")
    }
  }
}
