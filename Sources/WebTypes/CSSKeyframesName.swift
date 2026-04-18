// <keyframes-name> = <custom-ident> | <string>
// Used in: [ none | <keyframes-name> ]
public enum CSSKeyframesName: Sendable {
	case none(CSSKeyword.None)
	case name(String)
    
	@_disfavoredOverload
	public static var none: Self { .none(.none) }


	public var value: String {
		switch self {
		case .none(let keyword):
			return keyword.rawValue
		case .name(let name):
			return name
		}
	}
}
