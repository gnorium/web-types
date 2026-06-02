/// Values for the SVG text-anchor property.
extension CSS {
  public enum TextAnchor: String, Sendable {
    /// The text is aligned such that its start is at the point specified.
    case start
    /// The text is aligned such that its middle is at the point specified.
    case middle
    /// The text is aligned such that its end is at the point specified.
    case end
  }
}
