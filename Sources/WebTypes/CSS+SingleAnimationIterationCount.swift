import EmbeddedSwiftUtilities

// <single-animation-iteration-count> = infinite | <number [0,∞]>
extension CSS {
  public enum SingleAnimationIterationCount: Sendable, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral
  {
    case infinite(CSS.Keyword.Infinite)
    case number(String)

    #if SERVER
      public init(integerLiteral value: Int) {
        self = .number("\(value)")
      }

      public init(floatLiteral value: Double) {
        self = .number("\(value)")
      }
    #endif

    #if CLIENT
      public init(integerLiteral value: Int) {
        self = .number(intToString(value))
      }

      public init(floatLiteral value: Double) {
        self = .number(doubleToString(value))
      }
    #endif

    public var value: String {
      switch self {
      case .infinite(let keyword):
        return keyword.rawValue
      case .number(let num):
        return num
      }
    }

    public static var infinite: CSS.SingleAnimationIterationCount {
      .infinite(.infinite)
    }

    #if SERVER
      public static func number(_ value: Int) -> CSS.SingleAnimationIterationCount {
        .number("\(value)")
      }

      public static func number(_ value: Double) -> CSS.SingleAnimationIterationCount {
        .number("\(value)")
      }
    #endif

    #if CLIENT
      public static func number(_ value: Int) -> CSS.SingleAnimationIterationCount {
        .number(intToString(value))
      }

      public static func number(_ value: Double) -> CSS.SingleAnimationIterationCount {
        .number(doubleToString(value))
      }
    #endif
  }
}
