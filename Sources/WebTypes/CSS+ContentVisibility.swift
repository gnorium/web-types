extension CSS {
  /// `content-visibility`: whether an element renders its contents
  /// (CSS Containment Module Level 2).
  public enum ContentVisibility: String, Sendable {
    case visible
    /// Its contents are skipped while it is off screen.
    case auto
    case hidden
  }
}
