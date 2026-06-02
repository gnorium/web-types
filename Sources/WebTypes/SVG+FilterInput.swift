extension SVG {
  public struct FilterInput: Sendable {
    public let value: String

    internal init(_ value: String) {
      self.value = value
    }

    public static let sourceGraphic = SVG.FilterInput("SourceGraphic")
    public static let sourceAlpha = SVG.FilterInput("SourceAlpha")
    public static let backgroundImage = SVG.FilterInput("BackgroundImage")
    public static let backgroundAlpha = SVG.FilterInput("BackgroundAlpha")
    public static let fillPaint = SVG.FilterInput("FillPaint")
    public static let strokePaint = SVG.FilterInput("StrokePaint")
  }
}
