public enum CSSSingleAnimationFillMode: Sendable {
  case forwards
  case backwards
  case both

  public static var none: CSSKeyword.None { .none }

  public var rawValue: String {
    switch self {
    case .forwards: return "forwards"
    case .backwards: return "backwards"
    case .both: return "both"
    }
  }
}
