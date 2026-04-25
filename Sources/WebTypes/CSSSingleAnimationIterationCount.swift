#if CLIENT
  import EmbeddedSwiftUtilities
#endif

// <single-animation-iteration-count> = infinite | <number [0,∞]>
public enum CSSSingleAnimationIterationCount: Sendable, ExpressibleByIntegerLiteral,
  ExpressibleByFloatLiteral
{
  case infinite(CSSKeyword.Infinite)
  case number(String)  // For any positive number

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

  // Convenience static property for clean syntax
  public static var infinite: CSSSingleAnimationIterationCount {
    .infinite(.infinite)
  }

  // Convenience initializers for numbers
  #if SERVER
    public static func number(_ value: Int) -> CSSSingleAnimationIterationCount {
      .number("\(value)")
    }

    public static func number(_ value: Double) -> CSSSingleAnimationIterationCount {
      .number("\(value)")
    }
  #endif

  #if CLIENT
    public static func number(_ value: Int) -> CSSSingleAnimationIterationCount {
      .number(intToString(value))
    }

    public static func number(_ value: Double) -> CSSSingleAnimationIterationCount {
      .number(doubleToString(value))
    }
  #endif
}
