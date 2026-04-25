/// Values for the SVG alignment-baseline property.
public enum CSSAlignmentBaseline: String, Sendable {
  /// Use the parent's value.
  case auto
  /// Align to the center of the em box.
  case central
  /// Use the middle of the alphabetic baseline.
  case middle
  /// Align the baseline of the element with the baseline of the parent.
  case baseline
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
}
