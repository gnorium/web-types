public enum CSSJustifyContent: String, Sendable {
  case flexStart = "flex-start"
  case flexEnd = "flex-end"
  case center = "center"
  case spaceBetween = "space-between"
  case spaceAround = "space-around"
  case spaceEvenly = "space-evenly"

  public var staticRawValue: StaticString {
    switch self {
    case .flexStart: return "flex-start"
    case .flexEnd: return "flex-end"
    case .center: return "center"
    case .spaceBetween: return "space-between"
    case .spaceAround: return "space-around"
    case .spaceEvenly: return "space-evenly"
    }
  }
}
