public struct CSSBorder: ExpressibleByStringLiteral, Sendable {
	public let value: String

	public init(stringLiteral value: String) {
		self.value = value
	}

	public init(_ value: String) {
		self.value = value
	}

	public init(width: LineWidth? = nil, style: LineStyle? = nil, color: CSSColor? = nil) {
		var buffer: [UInt8] = []
		if let width = width {
			buffer.append(contentsOf: width.value.utf8)
		}
		if let style = style {
			if !buffer.isEmpty { buffer.append(32) }
			buffer.append(contentsOf: style.value.utf8)
		}
		if let color = color {
			if !buffer.isEmpty { buffer.append(32) }
			buffer.append(contentsOf: color.value.utf8)
		}
		self.value = String(decoding: buffer, as: UTF8.self)
	}

	public static var none: CSSBorder {
		CSSBorder(style: LineStyle.none)
	}

	public enum LineWidth: ExpressibleByStringLiteral, Sendable {
		case length(Length)
		case thin
		case medium
		case thick
        case custom(String)

		public init(stringLiteral value: String) {
            #if os(WASI)
            
            self = .custom(value)
            
            #endif

            #if !os(WASI)
			
            switch value {
			case "thin": self = .thin
			case "medium": self = .medium
			case "thick": self = .thick
			default: self = .length(Length(stringLiteral: value))
			}
            
            #endif
		}

		public var value: String {
			switch self {
                case .length(let length): return length.description
                case .thin: return "thin"
                case .medium: return "medium"
                case .thick: return "thick"
                case .custom(let str): return str
			}
		}
	}

	public enum LineStyle: ExpressibleByStringLiteral, Sendable {
		case none(CSSKeyword.None)
		case hidden
		case dotted
		case dashed
		case solid
		case double
		case groove
		case ridge
		case inset
		case outset
        case custom(String)

		public init(stringLiteral value: String) {
            #if os(WASI)
            
            self = .custom(value)
            
            #endif

            #if !os(WASI)
			
            switch value {
                case "none": self = .none(.none)
                case "hidden": self = .hidden
                case "dotted": self = .dotted
                case "dashed": self = .dashed
                case "solid": self = .solid
                case "double": self = .double
                case "groove": self = .groove
                case "ridge": self = .ridge
                case "inset": self = .inset
                case "outset": self = .outset
                default: self = .solid
			}

            #endif
		}

		public var value: String {
			switch self {
			case .none(let keyword): return keyword.rawValue
			case .hidden: return "hidden"
			case .dotted: return "dotted"
			case .dashed: return "dashed"
			case .solid: return "solid"
			case .double: return "double"
			case .groove: return "groove"
			case .ridge: return "ridge"
			case .inset: return "inset"
			case .outset: return "outset"
            case .custom(let str): return str
			}
		}

		public static var none: LineStyle {
			.none(.none)
		}
	}
}
