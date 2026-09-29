extension CSS {
  /// Values of the `float` property (CSS 2.2 §9.5.1; CSS Logical Properties
  /// Level 1 §2.1 adds the flow-relative `inline-start` and `inline-end`).
  /// Prefer the logical values: they follow the writing mode and direction.
  public enum Float: String, Sendable {
    case left = "left"
    case right = "right"
    case none = "none"
    case inlineStart = "inline-start"
    case inlineEnd = "inline-end"

    public var staticRawValue: StaticString {
      switch self {
      case .left: return "left"
      case .right: return "right"
      case .none: return "none"
      case .inlineStart: return "inline-start"
      case .inlineEnd: return "inline-end"
      }
    }
  }
}
