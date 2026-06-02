// <keyframes-name> = <custom-ident> | <string>
// Used in: [ none | <keyframes-name> ]
extension CSS {
  public enum KeyframesName: Sendable {
    case name(String)

    public static var none: CSS.Keyword.None { .none }

    public var value: String {
      switch self {
      case .name(let name):
        return name
      }
    }
  }
}
