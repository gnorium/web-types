extension CSS {
  public enum Orientation: Sendable {
    case portrait
    case landscape

    public var rawValue: StaticString {
      switch self {
      case .portrait: return "portrait"
      case .landscape: return "landscape"
      }
    }
  }
}
