/// https://tc39.es/ecma402/#locale-objects
extension Intl {
  public struct Locale: CustomStringConvertible, Sendable {
    public let value: String

    public init(_ value: String) {
      self.value = value
    }

    public var description: String {
      value
    }

    public static let enUS = Locale("en_US")
    public static let enGB = Locale("en_GB")
  }
}
