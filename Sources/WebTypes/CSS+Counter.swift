extension CSS {
  public struct Counter: Sendable {
    public let name: String
    public init(_ name: String) {
      self.name = name
    }
  }
}
