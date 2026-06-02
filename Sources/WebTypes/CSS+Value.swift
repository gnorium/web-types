#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  // Concrete type for CSSContent values in embedded Swift (can't use protocol existentials)
  public struct Value: Sendable, CSSVariableConvertible, CustomStringConvertible {
    public let value: String

    public var description: String {
      value
    }

    public static func variable(_ name: String) -> Value {
      Value(value: "var(\(name))")
    }

    public init(value: String) {
      self.value = value
    }

    public static func custom(_ value: String) -> Value {
      Value(value: value)
    }

    @_disfavoredOverload
    public init(_ length: CSS.Length) {
      self.value = length.value
    }

    @_disfavoredOverload
    public init(_ percentage: CSS.Percentage) {
      self.value = percentage.value
    }

    @_disfavoredOverload
    public init(_ lengthPercentage: CSS.LengthPercentage) {
      self.value = lengthPercentage.value
    }

    @_disfavoredOverload
    public init<T>(_ type: T) where T: CustomStringConvertible {
      self.value = type.description
    }
  }
}
