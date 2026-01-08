#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// MARK: - Mask Related Types

// <mask-layer> =
//   <mask-reference>              ||
//   <position> [ / <bg-size> ]?   ||
//   <repeat-style>                ||
//   <geometry-box>                ||
//   [ <geometry-box> | no-clip ]  ||
//   <compositing-operator>        ||
//   <masking-mode>
public struct CSSMaskLayer: Sendable {
	public let reference: MaskReference?
	public let position: Position?
	public let size: BgSize?
	public let repeatStyle: RepeatStyle?
	public let geometryBox: CSSGeometryBox?
	public let clip: MaskClip?
	public let compositingOperator: CompositingOperator?
	public let maskingMode: MaskingMode?

	// <mask-reference> = none | <image> | <mask-source>
	public enum MaskReference: Sendable {
		case none(CSSKeyword.None)
		case url(String)
		case custom(String)

		public var value: String {
			switch self {
			case .none(let keyword):
				return keyword.rawValue
			case .url(let urlValue):
				return WebTypes.url("\(urlValue)")
			case .custom(let str):
				return str
			}
		}
	}

	// <position> = <position-one> | <position-two> | <position-four>
	public enum Position: Sendable {
		case one(PositionOne)
		case two(PositionTwo)
		case custom(String)

		public var value: String {
			switch self {
			case .one(let pos):
				return pos.value
			case .two(let pos):
				return pos.value
			case .custom(let str):
				return str
			}
		}

		// <position-one> = left | center | right | top | bottom | x-start | x-end | y-start | y-end | block-start | block-end | inline-start | inline-end | <length-percentage>
		public enum PositionOne: Sendable {
			case keyword(PositionKeyword)
			case lengthPercentage(Length)

			public var value: String {
				switch self {
				case .keyword(let kw):
					return kw.rawValue
				case .lengthPercentage(let lp):
					return lp.value
				}
			}
			
			public enum PositionKeyword: String, Sendable {
				case left = "left"
				case center = "center"
				case right = "right"
				case top = "top"
				case bottom = "bottom"
				case xStart = "x-start"
				case xEnd = "x-end"
				case yStart = "y-start"
				case yEnd = "y-end"
				case blockStart = "block-start"
				case blockEnd = "block-end"
				case inlineStart = "inline-start"
				case inlineEnd = "inline-end"
				case start = "start"
				case end = "end"
			}
		}

		// <position-two> = [ left | center | right | x-start | x-end ] && [ top | center | bottom | y-start | y-end ]
		public struct PositionTwo: Sendable {
			public let horizontal: PositionOne
			public let vertical: PositionOne

			public init(_ horizontal: PositionOne, _ vertical: PositionOne) {
				self.horizontal = horizontal
				self.vertical = vertical
			}

			public var value: String {
				"\(horizontal.value) \(vertical.value)"
			}
		}
	}

	// <bg-size> = [ <length-percentage [0,∞]> | auto ]{1,2} | cover | contain
	public enum BgSize: Sendable {
		case cover
		case contain
		case lengthPercentage(Length)
		case auto(CSSKeyword.Auto)
		case twoLengths(Length, Length)
		case custom(String)

		public var value: String {
			switch self {
			case .cover:
				return "cover"
			case .contain:
				return "contain"
			case .lengthPercentage(let lp):
				return lp.value
			case .auto(let keyword):
				return keyword.rawValue
			case .twoLengths(let lp1, let lp2):
				return "\(lp1.value) \(lp2.value)"
			case .custom(let str):
				return str
			}
		}
	}

	// <repeat-style> = repeat-x | repeat-y | repeat-block | repeat-inline | <repetition>{1,2}
	public enum RepeatStyle: Sendable {
		case repeatX
		case repeatY
		case repeatBlock
		case repeatInline
		case repetition(Repetition, Repetition?)

		public var value: String {
			switch self {
			case .repeatX:
				return "repeat-x"
			case .repeatY:
				return "repeat-y"
			case .repeatBlock:
				return "repeat-block"
			case .repeatInline:
				return "repeat-inline"
			case .repetition(let rep1, let rep2):
				if let rep2 = rep2 {
					return "\(rep1.rawValue) \(rep2.rawValue)"
				}
				return rep1.rawValue
			}
		}

		// <repetition> = repeat | space | round | no-repeat
		public enum Repetition: String, Sendable {
			case `repeat` = "repeat"
			case space = "space"
			case round = "round"
			case noRepeat = "no-repeat"
		}
	}

	// [ <geometry-box> | no-clip ]
	public enum MaskClip: Sendable {
		case geometryBox(CSSGeometryBox)
		case noClip

		public var value: String {
			switch self {
			case .geometryBox(let box):
				return box.rawValue
			case .noClip:
				return "no-clip"
			}
		}
	}

	// <compositing-operator> = add | subtract | intersect | exclude
	public enum CompositingOperator: String, Sendable {
		case add = "add"
		case subtract = "subtract"
		case intersect = "intersect"
		case exclude = "exclude"
	}

	// <masking-mode> = alpha | luminance | match-source
	public enum MaskingMode: String, Sendable {
		case alpha = "alpha"
		case luminance = "luminance"
		case matchSource = "match-source"
	}

	public init(
		reference: MaskReference? = nil,
		position: Position? = nil,
		size: BgSize? = nil,
		repeatStyle: RepeatStyle? = nil,
		geometryBox: CSSGeometryBox? = nil,
		clip: MaskClip? = nil,
		compositingOperator: CompositingOperator? = nil,
		maskingMode: MaskingMode? = nil
	) {
		self.reference = reference
		self.position = position
		self.size = size
		self.repeatStyle = repeatStyle
		self.geometryBox = geometryBox
		self.clip = clip
		self.compositingOperator = compositingOperator
		self.maskingMode = maskingMode
	}

	#if !os(WASI)
	public var value: String {
		var components: [String] = []

		if let reference = reference {
			components.append(reference.value)
		}
		if let position = position {
			var posStr = position.value
			if let size = size {
				posStr += " / \(size.value)"
			}
			components.append(posStr)
		}
		if let repeatStyle = repeatStyle {
			components.append(repeatStyle.value)
		}
		if let geometryBox = geometryBox {
			components.append(geometryBox.rawValue)
		}
		if let clip = clip {
			components.append(clip.value)
		}
		if let compositingOperator = compositingOperator {
			components.append(compositingOperator.rawValue)
		}
		if let maskingMode = maskingMode {
			components.append(maskingMode.rawValue)
		}

		return components.joined(separator: " ")
	}
	#endif

	#if os(WASI)
	public var value: String {
		var buffer: [UInt8] = []
		var hasContent = false

		if let reference = reference {
			buffer.append(contentsOf: reference.value.utf8)
			hasContent = true
		}
		if let position = position {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: position.value.utf8)
			if let size = size {
				buffer.append(32) // space
				buffer.append(47) // '/'
				buffer.append(32) // space
				buffer.append(contentsOf: size.value.utf8)
			}
			hasContent = true
		}
		if let repeatStyle = repeatStyle {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: repeatStyle.value.utf8)
			hasContent = true
		}
		if let geometryBox = geometryBox {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: geometryBox.rawValue.utf8)
			hasContent = true
		}
		if let clip = clip {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: clip.value.utf8)
			hasContent = true
		}
		if let compositingOperator = compositingOperator {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: compositingOperator.rawValue.utf8)
			hasContent = true
		}
		if let maskingMode = maskingMode {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: maskingMode.rawValue.utf8)
		}

		return String(decoding: buffer, as: UTF8.self)
	}
	#endif
}

// MARK: - Convenience helper functions

public func maskLayer(
	_ reference: CSSMaskLayer.MaskReference? = nil,
	position: CSSMaskLayer.Position? = nil,
	size: CSSMaskLayer.BgSize? = nil,
	repeatStyle: CSSMaskLayer.RepeatStyle? = nil,
	geometryBox: CSSGeometryBox? = nil,
	clip: CSSMaskLayer.MaskClip? = nil,
	compositingOperator: CSSMaskLayer.CompositingOperator? = nil,
	maskingMode: CSSMaskLayer.MaskingMode? = nil
) -> CSSMaskLayer {
	CSSMaskLayer(
		reference: reference,
		position: position,
		size: size,
		repeatStyle: repeatStyle,
		geometryBox: geometryBox,
		clip: clip,
		compositingOperator: compositingOperator,
		maskingMode: maskingMode
	)
}

public func url(_ url: String) -> CSSMaskLayer.MaskReference {
	.url(url)
}
