public struct CSSCounters: Sendable {
  public let name: String
  public let delimiter: String
  public init(_ name: String, _ delimiter: String) {
    self.name = name
    self.delimiter = delimiter
  }
}
