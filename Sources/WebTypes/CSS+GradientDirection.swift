extension CSS {
  /// Gradient direction used exclusively with the `to:` parameter label
  /// (e.g. `linearGradient(to: .bottom, ...)`), so the "to" prefix is
  /// omitted from case names — the label already provides that word.
  public enum GradientDirection: String, Sendable {
    case top = "to top"
    case right = "to right"
    case bottom = "to bottom"
    case left = "to left"
    case topRight = "to top right"
    case topLeft = "to top left"
    case bottomRight = "to bottom right"
    case bottomLeft = "to bottom left"
  }
}
