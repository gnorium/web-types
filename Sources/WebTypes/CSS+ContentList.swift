extension CSS {
  /// Models items that can appear in a CSS `<content-list>` value.
  /// https://drafts.csswg.org/css-content/#typedef-content-list
  public enum ContentList: Sendable, ExpressibleByStringLiteral {
    case string(String)
    case counter(CSS.Counter)
    case counters(CSS.Counters)

    public init(stringLiteral value: String) {
      self = .string(value)
    }
  }
}
