extension CSS {
  public enum GeometryBox: String, Sendable {
    case contentBox = "content-box"
    case paddingBox = "padding-box"
    case borderBox = "border-box"
    case marginBox = "margin-box"
    case halfBorderBox = "half-border-box"
    // Additional geometry boxes
    case fillBox = "fill-box"
    case strokeBox = "stroke-box"
    case viewBox = "view-box"
  }
}
