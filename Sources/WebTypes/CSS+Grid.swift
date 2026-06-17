#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  public enum Grid {
    public struct Repeat: Sendable {
      public let value: String

      public enum Keyword: String, Sendable {
        case autoFit = "auto-fit"
        case autoFill = "auto-fill"
      }
    }
  }
}

public func `repeat`(_ count: Int, _ track: CSS.Length) -> CSS.Grid.Repeat {
  CSS.Grid.Repeat(value: "repeat(\(count), \(track.value))")
}

public func `repeat`(_ keyword: CSS.Grid.Repeat.Keyword, _ track: CSS.Length) -> CSS.Grid.Repeat {
  CSS.Grid.Repeat(value: "repeat(\(keyword.rawValue), \(track.value))")
}
