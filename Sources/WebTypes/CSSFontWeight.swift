#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <font-weight> = normal | bold | bolder | lighter | <number [1,1000]>
public enum CSSFontWeight: ExpressibleByIntegerLiteral, ExpressibleByStringLiteral, CustomStringConvertible, Sendable {
	case normal
	case bold
	case bolder
	case lighter
	case number(Int)
	case variable(String)

	public init(integerLiteral value: Int) {
		self = .number(value)
	}

	public init(stringLiteral value: String) {
		// Support CSSProtocol variables and custom values
		self = .variable(value)
	}

	#if !os(WASI)

	public var value: String {
		switch self {
		case .normal:
			return "normal"
		case .bold:
			return "bold"
		case .bolder:
			return "bolder"
		case .lighter:
			return "lighter"
		case .number(let weight):
			return "\(weight)"
		case .variable(let value):
			return value
		}
	}

	#endif

	#if os(WASI)

	public var value: String {
		switch self {
		case .normal:
			return "normal"
		case .bold:
			return "bold"
		case .bolder:
			return "bolder"
		case .lighter:
			return "lighter"
		case .number(let weight):
			return intToString(weight)
		case .variable(let value):
			return value
		}
	}

	#endif

	// Convenience static properties for common weights
	public static let semiBold: CSSFontWeight = .number(600)

	public var description: String { value }
}
