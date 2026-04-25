// <keyframes-name> = <custom-ident> | <string>
// Used in: [ none | <keyframes-name> ]
public enum CSSKeyframesName: Sendable {
  case name(String)

  public static var none: CSSKeyword.None { .none }

  public var value: String {
    switch self {
    case .name(let name):
      return name
    }
  }
}
