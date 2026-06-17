// <keyframes-name> = <custom-ident> | <string>
// Used in: [ none | <keyframes-name> ]
extension CSS {
  public enum KeyframesName: Sendable, ExpressibleByStringLiteral {
    case name(String)

    public init(stringLiteral value: String) {
      self = .name(value)
    }

    public static var none: CSS.Keyword.None { .none }

    public var value: String {
      switch self {
      case .name(let name):
        return name
      }
    }
  }
}
