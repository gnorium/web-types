extension CSS {
  public struct AnimationDelay: Sendable {
    public let time: CSS.Time

    public init(_ time: CSS.Time) {
      self.time = time
    }

    public var value: String {
      time.value
    }
  }
}
