import EmbeddedSwiftUtilities

extension SVG {
  public enum Animate {
    public enum RepeatCount: Equatable, Sendable {
      case indefinite
      case count(Int)

      public var value: String {
        switch self {
        case .indefinite: return "indefinite"
        case .count(let n): return intToString(n)
        }
      }
    }

    public enum CalcMode: String, Sendable {
      case discrete
      case linear
      case paced
      case spline
    }

    public enum Begin: String, Sendable {
      case indefinite
    }

    public enum Fill: String, Sendable {
      case freeze
      case remove
    }

    public enum AttributeType: String, Sendable {
      case CSS
      case XML
      case auto
    }
  }
}
