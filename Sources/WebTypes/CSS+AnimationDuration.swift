extension CSS {
  public enum AnimationDuration: Sendable {
    case auto(CSS.Keyword.Auto)
    case time(CSS.Time)

    public var value: String {
      switch self {
      case .auto(let keyword):
        return keyword.rawValue
      case .time(let time):
        return time.value
      }
    }
    public init(_ time: CSS.Time) {
      self = .time(time)
    }
  }
}
