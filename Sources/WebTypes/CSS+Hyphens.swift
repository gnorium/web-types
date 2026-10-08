extension CSS {
  /// `hyphens`: whether a word may be broken with a hyphen at the end of a
  /// line—never, only at a soft hyphen (`manual`), or wherever the
  /// language's rules allow (`auto`, by the element's `lang`).
  public enum Hyphens: String, Sendable {
    case none
    case manual
    case auto
    case initial
    case inherit

    public var value: String {
      return rawValue
    }
  }
}
