import EmbeddedSwiftUtilities

public struct LengthPercentage: Sendable, CSSVariableConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, CustomStringConvertible
{
  public let value: String

  public var description: String {
    value
  }

  public init(integerLiteral value: Int) {
    #if SERVER
      self.value = "\(value)px"
    #endif
    #if CLIENT
      self.value = "\(intToString(value))px"
    #endif
  }

  public init(floatLiteral value: Double) {
    self.value = "\(doubleToString(value))px"
  }

  internal init(_ value: String) {
    self.value = value
  }

  public init(_ length: Length) {
    self.value = length.value
  }

  public init(_ percentage: Percentage) {
    self.value = percentage.value
  }

  public static func variable(_ name: String) -> LengthPercentage {
    LengthPercentage("var(\(name))")
  }
}
