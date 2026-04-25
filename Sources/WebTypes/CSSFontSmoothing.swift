public enum CSSFontSmoothing: Sendable {
  case antialiased
  case subpixelAntialiased
  case grayscale

  public static var auto: CSSKeyword.Auto { .auto }
  public static var none: CSSKeyword.None { .none }

  public var rawValue: String {
    switch self {
    case .antialiased: return "antialiased"
    case .subpixelAntialiased: return "subpixel-antialiased"
    case .grayscale: return "grayscale"
    }
  }
}
