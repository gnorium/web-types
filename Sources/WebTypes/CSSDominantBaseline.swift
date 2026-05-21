/// Values for the SVG dominant-baseline property.
public enum CSSDominantBaseline: String, Sendable {
  /// Use the middle of the alphabetic baseline.
  case middle
  /// Align to the center of the em box.
  case central
  /// Align current text position relative to the parent's hanging baseline.
  case hanging
  /// Align current text position relative to the parent's alphabetic baseline.
  case alphabetic
  /// Align current text position relative to the parent's mathematical baseline.
  case mathematical
  /// Align current text position relative to the parent's ideographic baseline.
  case ideographic
  /// Align current text position relative to the parent's text-after-edge baseline.
  case textAfterEdge = "text-after-edge"
  /// Align current text position relative to the parent's text-before-edge baseline.
  case textBeforeEdge = "text-before-edge"

  public static var auto: CSSKeyword.Auto { .auto }
}
