public enum CSSTextDecoration: ExpressibleByStringLiteral, Sendable {
	case none(CSSKeyword.None)
	case underline
	case overline
	case lineThrough
	case blink
    case customStatic(StaticString)
    case custom(String)

	public typealias StringLiteralType = StaticString
	public init(stringLiteral value: StaticString) {
        // Optimisation: check for known tokens by comparing pointers/length or raw bytes
        // This avoids String creation for known static tokens.
        if value.utf8CodeUnitCount == 4 && value.withUTF8Buffer({ $0.elementsEqual("none".utf8) }) {
            self = .none(.none)
        } else if value.utf8CodeUnitCount == 27 && value.withUTF8Buffer({ $0.elementsEqual("var(--text-decoration-none)".utf8) }) {
            self = .none(.none)
        } else if value.withUTF8Buffer({ $0.elementsEqual("underline".utf8) }) {
            self = .underline
        } else if value.withUTF8Buffer({ $0.elementsEqual("var(--text-decoration-underline)".utf8) }) {
             self = .underline
        } else if value.withUTF8Buffer({ $0.elementsEqual("overline".utf8) }) {
            self = .overline
        } else if value.withUTF8Buffer({ $0.elementsEqual("line-through".utf8) }) {
            self = .lineThrough
        } else if value.withUTF8Buffer({ $0.elementsEqual("var(--text-decoration-line-through)".utf8) }) {
            self = .lineThrough
        } else if value.withUTF8Buffer({ $0.elementsEqual("blink".utf8) }) {
            self = .blink
        } else {
            self = .customStatic(value)
        }
	}

	public var value: String {
		switch self {
		case .none(let keyword): return keyword.rawValue
		case .underline: return "underline"
		case .overline: return "overline"
		case .lineThrough: return "line-through"
		case .blink: return "blink"
        case .customStatic(let s): return s.withUTF8Buffer { String(decoding: $0, as: UTF8.self) }
        case .custom(let s): return s
		}
	}

    public var staticValue: StaticString? {
        switch self {
        case .none(let keyword): return keyword.staticRawValue
        case .underline: return "underline"
        case .overline: return "overline"
        case .lineThrough: return "line-through"
        case .blink: return "blink"
        case .customStatic(let s): return s
        case .custom: return nil
        }
    }

	public static var none: CSSTextDecoration {
		.none(.none)
	}
}
