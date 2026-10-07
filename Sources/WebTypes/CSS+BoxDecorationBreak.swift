extension CSS {
  /// How a box broken across lines, columns or pages draws its background,
  /// border, padding and corners: as one box cut (`slice`), or each piece
  /// drawn whole (`clone`).
  public enum BoxDecorationBreak: Sendable {
    case slice
    case clone

    public var staticRawValue: StaticString {
      switch self {
      case .slice: return "slice"
      case .clone: return "clone"
      }
    }

    public var rawValue: String {
      switch self {
      case .slice: return "slice"
      case .clone: return "clone"
      }
    }
  }
}
