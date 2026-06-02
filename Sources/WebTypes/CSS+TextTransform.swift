extension CSS {
  public enum TextTransform: Sendable {
    case capitalize
    case uppercase
    case lowercase
    case fullWidth
    case fullSizeKana

    public static var none: CSS.Keyword.None { .none }

    public var rawValue: String {
      switch self {
      case .capitalize: return "capitalize"
      case .uppercase: return "uppercase"
      case .lowercase: return "lowercase"
      case .fullWidth: return "full-width"
      case .fullSizeKana: return "full-size-kana"
      }
    }

    public var staticRawValue: StaticString {
      switch self {
      case .capitalize: return "capitalize"
      case .uppercase: return "uppercase"
      case .lowercase: return "lowercase"
      case .fullWidth: return "full-width"
      case .fullSizeKana: return "full-size-kana"
      }
    }
  }
}
