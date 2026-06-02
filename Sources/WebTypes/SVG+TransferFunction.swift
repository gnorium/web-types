extension SVG {
  public enum TransferFunction: String, Sendable {
    case identity
    case table
    case discrete
    case linear
    case gamma
  }
}
