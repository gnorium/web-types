public enum CSSTextTransform: Sendable {
  case capitalize
  case uppercase
  case lowercase
  case fullWidth
  case fullSizeKana

  public static var none: CSSKeyword.None { .none }

  public var rawValue: String {
    switch self {
    case .capitalize: return "capitalize"
    case .uppercase: return "uppercase"
    case .lowercase: return "lowercase"
    case .fullWidth: return "full-width"
    case .fullSizeKana: return "full-size-kana"
    }
  }
}
