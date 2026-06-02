extension SVG {
  public enum CompositeOperator: String, Sendable {
    case over = "over"
    case `in` = "in"
    case out = "out"
    case atop = "atop"
    case xor = "xor"
    case arithmetic = "arithmetic"
  }
}
