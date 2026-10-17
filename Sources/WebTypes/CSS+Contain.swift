extension CSS {
  /// `contain`'s keywords: what of an element the page may treat as
  /// independent of the rest.
  public enum Contain: String, Sendable {
    case none
    /// `size layout paint style`.
    case strict
    /// `layout paint style`: its layout, its painting and its counters its
    /// own; what changes inside it is laid out and painted inside it.
    case content
    case size
    case inlineSize = "inline-size"
    case layout
    case style
    case paint
  }
}
