extension CSS {
  public enum FlexDirection: String, Sendable {
    case row = "row"
    case rowReverse = "row-reverse"
    case column = "column"
    case columnReverse = "column-reverse"

    public var staticRawValue: StaticString {
      switch self {
      case .row: return "row"
      case .rowReverse: return "row-reverse"
      case .column: return "column"
      case .columnReverse: return "column-reverse"
      }
    }
  }
}
