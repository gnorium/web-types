extension SVG {
  public enum VectorEffect: String, Sendable {
    case none = "none"
    case nonScalingStroke = "non-scaling-stroke"
    case nonScalingSize = "non-scaling-size"
    case nonRotation = "non-rotation"
    case fixedPosition = "fixed-position"
  }
}
