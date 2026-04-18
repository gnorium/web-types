public struct CSSBorder: Sendable, CSSVariableConvertible {
	public let value: String

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

	internal init(_ value: String) {
		self.value = value
	}

	public static func variable(_ name: String) -> CSSBorder {
		CSSBorder(concat("var(", name, ")"))
	}

	public static var none: CSSBorder {
		CSSBorder(CSSKeyword.None.none.rawValue)
	}


	public enum LineWidth: Sendable {
		case length(Length)
		case thin
		case medium
		case thick

		public var value: String {
			switch self {
                case .length(let length): return length.description
                case .thin: return "thin"
                case .medium: return "medium"
                case .thick: return "thick"
			}
		}
	}

	public enum LineStyle: Sendable, CSSVariableConvertible {
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
		case variable(String)

		@_disfavoredOverload
		public static var none: LineStyle { .none(.none) }

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
			case .variable(let name): return concat("var(", name, ")")
			}
		}

	}
}
