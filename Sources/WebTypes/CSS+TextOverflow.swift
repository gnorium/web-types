#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  public enum TextOverflow: Sendable, CSSVariableConvertible {
    case clip
    case ellipsis
    case variable(String)

    public var value: String {
      switch self {
      case .clip: return "clip"
      case .ellipsis: return "ellipsis"
      case .variable(let name): return "var(\(name))"
      }
    }

    public var staticRawValue: StaticString? {
      switch self {
      case .clip: return "clip"
      case .ellipsis: return "ellipsis"
      case .variable: return nil
      }
    }
  }
}
