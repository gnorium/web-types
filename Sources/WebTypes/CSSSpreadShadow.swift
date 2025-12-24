// <spread-shadow> =
//   <'box-shadow-color'>? &&
//   [ [ none | <length>{2} ] [ <'box-shadow-blur'> <'box-shadow-spread'>? ]? ] &&
//   <'box-shadow-position'>?
public struct CSSSpreadShadow: ExpressibleByStringLiteral, Sendable {
	private let colorValue: String?
	public let offsetX: Length?
	public let offsetY: Length?
	public let isNone: Bool
	public let blur: BoxShadowBlur?
	public let spread: BoxShadowSpread?
	public let position: BoxShadowPosition?

	public init(stringLiteral value: String) {
		self.colorValue = nil
		self.offsetX = nil
		self.offsetY = nil
		self.isNone = false
		self.blur = nil
		self.spread = nil
		self.position = nil
	}

	public init(
		color: BoxShadowColor,
		offsetX: Length? = nil,
		offsetY: Length? = nil,
		isNone: Bool = false,
		blur: BoxShadowBlur? = nil,
		spread: BoxShadowSpread? = nil,
		position: BoxShadowPosition? = nil
	) {
		self.colorValue = color.value
		self.offsetX = offsetX
		self.offsetY = offsetY
		self.isNone = isNone
		self.blur = blur
		self.spread = spread
		self.position = position
	}

	#if !os(WASI)
	public var value: String {
		var components: [String] = []

		if isNone {
			components.append("none")
		} else {
			if let colorValue = colorValue {
				components.append(colorValue)
			}
			if let offsetX = offsetX, let offsetY = offsetY {
				components.append(offsetX.value)
				components.append(offsetY.value)
			}
			if let blur = blur {
				components.append(blur.value)
			}
			if let spread = spread {
				components.append(spread.value)
			}
			if let position = position {
				components.append(position.rawValue)
			}
		}

		return components.joined(separator: " ")
	}
	#endif

	#if os(WASI)
	public var value: String {
		var buffer: [UInt8] = []
		var hasContent = false

		if isNone {
			buffer.append(contentsOf: "none".utf8)
		} else {
			if let colorValue = colorValue {
				buffer.append(contentsOf: colorValue.utf8)
				hasContent = true
			}
			if let offsetX = offsetX, let offsetY = offsetY {
				if hasContent { buffer.append(32) }
				buffer.append(contentsOf: offsetX.value.utf8)
				buffer.append(32)
				buffer.append(contentsOf: offsetY.value.utf8)
				hasContent = true
			}
			if let blur = blur {
				if hasContent { buffer.append(32) }
				buffer.append(contentsOf: blur.value.utf8)
				hasContent = true
			}
			if let spread = spread {
				if hasContent { buffer.append(32) }
				buffer.append(contentsOf: spread.value.utf8)
				hasContent = true
			}
			if let position = position {
				if hasContent { buffer.append(32) }
				buffer.append(contentsOf: position.rawValue.utf8)
			}
		}

		return String(decoding: buffer, as: UTF8.self)
	}
	#endif

	// <box-shadow-color> = <color>#
	public struct BoxShadowColor: Sendable {
		public let value: String

		public init(_ color: CSSColor) {
			self.value = color.value
		}
	}

	// <box-shadow-blur> = <length [0,∞]>#
	public struct BoxShadowBlur: Sendable {
		public let length: Length

		public init(_ length: Length) {
			self.length = length
		}

		public var value: String {
			length.value
		}
	}

	// <box-shadow-spread> = <length>#
	public struct BoxShadowSpread: Sendable {
		public let length: Length

		public init(_ length: Length) {
			self.length = length
		}

		public var value: String {
			length.value
		}
	}

	// <box-shadow-position> = [ outset | inset ]#
	public enum BoxShadowPosition: String, Sendable {
		case outset = "outset"
		case inset = "inset"
	}
}
