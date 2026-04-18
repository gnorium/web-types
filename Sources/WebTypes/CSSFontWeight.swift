#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public enum CSSFontWeight: Sendable, CSSVariableConvertible, ExpressibleByIntegerLiteral {
	public init(integerLiteral value: Int) {
		self = .number(value)
	}
	case normal
	case bold
	case semiBold
	case lighter
	case bolder
	case number(Int)
	case variable(String)

	public var value: String {
		#if !os(WASI)

		switch self {
		case .normal: return "normal"
		case .bold: return "bold"
		case .semiBold: return "600"
		case .lighter: return "lighter"
		case .bolder: return "bolder"
		case .number(let int): return "\(int)"
		case .variable(let name): return "var(\(name))"
		}
		#endif

		#if os(WASI)

		switch self {
		case .normal: return "normal"
		case .bold: return "bold"
		case .semiBold: return "600"
		case .lighter: return "lighter"
		case .bolder: return "bolder"
		case .number(let int): return intToString(int)
		case .variable(let name): return concat("var(", name, ")")
		}

		#endif
	}

	public var staticRawValue: StaticString? {
		switch self {
		case .normal: return "normal"
		case .bold: return "bold"
		case .semiBold: return "600"
		case .lighter: return "lighter"
		case .bolder: return "bolder"
		case .number, .variable: return nil
		}
	}
}
