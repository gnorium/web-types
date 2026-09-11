extension CSS {
  public enum Overflow: Sendable {
    case visible
    case hidden
    case scroll
    case clip
    case overlay

    public static var auto: CSS.Keyword.Auto { .auto }

    public var rawValue: String {
      switch self {
      case .visible: return "visible"
      case .hidden: return "hidden"
      case .scroll: return "scroll"
      case .clip: return "clip"
      case .overlay: return "overlay"
      }
    }

    public var staticRawValue: StaticString {
      switch self {
      case .visible: return "visible"
      case .hidden: return "hidden"
      case .scroll: return "scroll"
      case .clip: return "clip"
      case .overlay: return "overlay"
      }
    }
  }
}
