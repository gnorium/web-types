import EmbeddedSwiftUtilities

// Concrete type for CSSContent values in embedded Swift (can't use protocol existentials)
public struct CSSValue: Sendable, CSSVariableConvertible, CustomStringConvertible {
  public let value: String

  public var description: String {
    value
  }

  public static func variable(_ name: String) -> CSSValue {
    CSSValue(value: "var(\(name))")
  }

  public init(value: String) {
    self.value = value
  }

  public static func custom(_ value: String) -> CSSValue {
    CSSValue(value: value)
  }

  @_disfavoredOverload
  public init(_ length: Length) {
    self.value = length.value
  }

  @_disfavoredOverload
  public init(_ percentage: Percentage) {
    self.value = percentage.value
  }

  @_disfavoredOverload
  public init(_ lengthPercentage: LengthPercentage) {
    self.value = lengthPercentage.value
  }

  @_disfavoredOverload
  public init<T>(_ type: T) where T: CustomStringConvertible {
    self.value = type.description
  }
}
