extension CSS {
  /// `scrollbar-gutter`: whether a scroll container keeps room for its
  /// scrollbar before it has one. `stable` reserves it, so a page that grows
  /// tall enough to scroll does not shift sideways when the bar appears.
  public enum ScrollbarGutter: Sendable {
    case stable
    case stableBothEdges

    public static var auto: CSS.Keyword.Auto { .auto }

    public var rawValue: String {
      switch self {
      case .stable: return "stable"
      case .stableBothEdges: return "stable both-edges"
      }
    }
  }
}
