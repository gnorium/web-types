extension CSS {
  public enum FontSmoothing: Sendable {
    case antialiased
    case subpixelAntialiased
    case grayscale

    public static var auto: CSS.Keyword.Auto { .auto }
    public static var none: CSS.Keyword.None { .none }

    public var rawValue: String {
      switch self {
      case .antialiased: return "antialiased"
      case .subpixelAntialiased: return "subpixel-antialiased"
      case .grayscale: return "grayscale"
      }
    }
  }
}
