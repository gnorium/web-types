// <keyframes-name> = <custom-ident> | <string>
// Used in: [ none | <keyframes-name> ]
public enum CSSKeyframesName: Sendable, ExpressibleByStringLiteral {
	case none(CSSKeyword.None)
	case name(String)

	public init(stringLiteral value: String) {
		self = .name(value)
	}

	public var value: String {
		switch self {
		case .none(let keyword):
			return keyword.rawValue
		case .name(let name):
			return name
		}
	}
}
