extension CSS {
  /// `text-box-trim` (CSS Inline Layout 3): which sides of a block's first
  /// and last line boxes drop their half-leading and the font's extra
  /// ascent and descent, down to the edges `text-box-edge` names.
  public enum TextBoxTrim: String, Sendable {
    case none
    case trimStart = "trim-start"
    case trimEnd = "trim-end"
    case trimBoth = "trim-both"

    public var value: String {
      return rawValue
    }
  }

  /// `text-box-edge` (CSS Inline Layout 3): the metrics a trimmed line box
  /// is cut to—`auto`, or an over edge and an under edge (`cap alphabetic`
  /// keeps exactly the capitals and digits, from cap height to baseline).
  public enum TextBoxEdge: Sendable {
    case auto
    case edges(Over, Under)

    /// The over (start) edge.
    public enum Over: String, Sendable {
      case text
      case cap
      case ex
      case ideographic
      case ideographicInk = "ideographic-ink"
    }

    /// The under (end) edge.
    public enum Under: String, Sendable {
      case text
      case alphabetic
      case ideographic
      case ideographicInk = "ideographic-ink"
    }

    public var value: String {
      switch self {
      case .auto: return "auto"
      case .edges(let over, let under): return over.rawValue + " " + under.rawValue
      }
    }
  }
}
