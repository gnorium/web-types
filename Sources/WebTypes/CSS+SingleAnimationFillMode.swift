extension CSS {
  public enum SingleAnimationFillMode: Sendable {
    case forwards
    case backwards
    case both

    public static var none: CSS.Keyword.None { .none }

    public var rawValue: String {
      switch self {
      case .forwards: return "forwards"
      case .backwards: return "backwards"
      case .both: return "both"
      }
    }
  }
}
