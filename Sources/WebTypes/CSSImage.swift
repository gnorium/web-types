#if os(WASI)

import Utilities

#endif

// <image> =
//   <url>           |
//   <image()>       |
//   <image-set()>   |
//   <cross-fade()>  |
//   <element()>     |
//   <gradient>

public enum CSSImage: Sendable {
	case url(String)
	case imageFunc(ImageFunc)
	case imageSet(ImageSet)
	case crossFade(CrossFade)
	case element(Element)
	case gradient(CSSGradient)

	public var value: String {
		switch self {
		case .url(let url):
			return "url(\(url))"
		case .imageFunc(let fn):
			return fn.value
		case .imageSet(let fn):
			return fn.value
		case .crossFade(let fn):
			return fn.value
		case .element(let fn):
			return fn.value
		case .gradient(let gradient):
			return gradient.value
		}
	}

	// <image()> = image( <image-tags>? [ <image-src>? , <color>? ]! )
	public struct ImageFunc: Sendable {
		public let tags: ImageTags?
		public let src: String?
		public let color: CSSColor?

		public init(tags: ImageTags? = nil, src: String? = nil, color: CSSColor? = nil) {
			self.tags = tags
			self.src = src
			self.color = color
		}

		#if !os(WASI)
		public var value: String {
			var components: [String] = []
			if let tags = tags {
				components.append(tags.rawValue)
			}
			if let src = src {
				components.append(src)
			}
			if let color = color {
				components.append(color.value)
			}
			return "image(\(components.joined(separator: ", ")))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "image(".utf8)

			var hasContent = false
			if let tags = tags {
				buffer.append(contentsOf: tags.rawValue.utf8)
				hasContent = true
			}
			if let src = src {
				if hasContent { buffer.append(contentsOf: ", ".utf8) }
				buffer.append(contentsOf: src.utf8)
				hasContent = true
			}
			if let color = color {
				if hasContent { buffer.append(contentsOf: ", ".utf8) }
				buffer.append(contentsOf: color.value.utf8)
			}

			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	// <image-tags> = ltr | rtl
	public enum ImageTags: String, Sendable {
		case ltr = "ltr"
		case rtl = "rtl"
	}

	// <image-set()> = image-set( <image-set-option># )
	public struct ImageSet: Sendable {
		public let options: [ImageSetOption]

		public init(_ options: [ImageSetOption]) {
			self.options = options
		}

		#if !os(WASI)
		public var value: String {
			let opts = options.map { $0.value }.joined(separator: ", ")
			return "image-set(\(opts))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "image-set(".utf8)
			for (index, option) in options.enumerated() {
				if index > 0 {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: option.value.utf8)
			}
			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	// <image-set-option> = [ <image> | <string> ] [ <resolution> || type( <string> ) ]?
	public struct ImageSetOption: Sendable {
		public let source: String // Can be url or string
		public let resolution: String?
		public let type: String?

		public init(_ source: String, resolution: String? = nil, type: String? = nil) {
			self.source = source
			self.resolution = resolution
			self.type = type
		}

		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: source.utf8)
			if let resolution = resolution {
				buffer.append(32) // space
				buffer.append(contentsOf: resolution.utf8)
			}
			if let type = type {
				buffer.append(32) // space
				buffer.append(contentsOf: "type(".utf8)
				buffer.append(contentsOf: type.utf8)
				buffer.append(41) // ')'
			}
			return String(decoding: buffer, as: UTF8.self)
		}
	}

	// <cross-fade()> = cross-fade( <cf-image># )
	public struct CrossFade: Sendable {
		public let images: [CrossFadeImage]

		public init(_ images: [CrossFadeImage]) {
			self.images = images
		}

		#if !os(WASI)
		public var value: String {
			let imgs = images.map { $0.value }.joined(separator: ", ")
			return "cross-fade(\(imgs))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "cross-fade(".utf8)
			for (index, image) in images.enumerated() {
				if index > 0 {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: image.value.utf8)
			}
			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	// <cf-image> = [ <image> | <color> ] && <percentage [0,100]>?
	public struct CrossFadeImage: Sendable {
		public let imageOrColor: String // Can be image or color
		public let percentage: Percentage?

		public init(_ imageOrColor: String, _ percentage: Percentage? = nil) {
			self.imageOrColor = imageOrColor
			self.percentage = percentage
		}

		public var value: String {
			if let percentage = percentage {
				return "\(imageOrColor) \(percentage.value)"
			}
			return imageOrColor
		}
	}

	// <element()> = element( <id-selector> )
	public struct Element: Sendable {
		public let id: String

		public init(_ id: String) {
			self.id = id
		}

		public var value: String {
			"element(#\(id))"
		}
	}
}

// <gradient> =
//   <linear-gradient()>        |
//   <repeating-linear-gradient()>  |
//   <radial-gradient()>        |
//   <repeating-radial-gradient()>  |
//   <conic-gradient()>         |
//   <repeating-conic-gradient()>

public enum CSSGradient: Sendable {
	case linear(LinearGradient)
	case repeatingLinear(RepeatingLinearGradient)
	case radial(RadialGradient)
	case repeatingRadial(RepeatingRadialGradient)
	case conic(ConicGradient)
	case repeatingConic(RepeatingConicGradient)

	public var value: String {
		switch self {
		case .linear(let gradient):
			return gradient.value
		case .repeatingLinear(let gradient):
			return gradient.value
		case .radial(let gradient):
			return gradient.value
		case .repeatingRadial(let gradient):
			return gradient.value
		case .conic(let gradient):
			return gradient.value
		case .repeatingConic(let gradient):
			return gradient.value
		}
	}

	// linear-gradient( [ <angle> | to <side-or-corner> ]? , <color-stop-list> )
	public struct LinearGradient: Sendable {
		public let direction: GradientDirection?
		public let colorStops: [ColorStop]

		public init(direction: GradientDirection? = nil, colorStops: [ColorStop]) {
			self.direction = direction
			self.colorStops = colorStops
		}

		#if !os(WASI)
		public var value: String {
			var components: [String] = []
			if let direction = direction {
				components.append(direction.value)
			}
			components.append(contentsOf: colorStops.map { $0.value })
			return "linear-gradient(\(components.joined(separator: ", ")))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "linear-gradient(".utf8)
			var first = true
			if let direction = direction {
				buffer.append(contentsOf: direction.value.utf8)
				first = false
			}
			for stop in colorStops {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: stop.value.utf8)
				first = false
			}
			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	public struct RepeatingLinearGradient: Sendable {
		public let direction: GradientDirection?
		public let colorStops: [ColorStop]

		public init(direction: GradientDirection? = nil, colorStops: [ColorStop]) {
			self.direction = direction
			self.colorStops = colorStops
		}

		#if !os(WASI)
		public var value: String {
			var components: [String] = []
			if let direction = direction {
				components.append(direction.value)
			}
			components.append(contentsOf: colorStops.map { $0.value })
			return "repeating-linear-gradient(\(components.joined(separator: ", ")))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "repeating-linear-gradient(".utf8)
			var first = true
			if let direction = direction {
				buffer.append(contentsOf: direction.value.utf8)
				first = false
			}
			for stop in colorStops {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: stop.value.utf8)
				first = false
			}
			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	// radial-gradient( [ <ending-shape> || <size> ]? [ at <position> ]? , <color-stop-list> )
	public struct RadialGradient: Sendable {
		public let shape: RadialShape?
		public let size: RadialSize?
		public let position: CSSMaskLayer.Position?
		public let colorStops: [ColorStop]

		public init(shape: RadialShape? = nil, size: RadialSize? = nil, position: CSSMaskLayer.Position? = nil, colorStops: [ColorStop]) {
			self.shape = shape
			self.size = size
			self.position = position
			self.colorStops = colorStops
		}

		#if !os(WASI)
		public var value: String {
			var components: [String] = []
			var shapeAndSize: [String] = []
			if let shape = shape {
				shapeAndSize.append(shape.rawValue)
			}
			if let size = size {
				shapeAndSize.append(size.value)
			}
			if !shapeAndSize.isEmpty {
				components.append(shapeAndSize.joined(separator: " "))
			}
			if let position = position {
				components.append("at \(position.value)")
			}
			components.append(contentsOf: colorStops.map { $0.value })
			return "radial-gradient(\(components.joined(separator: ", ")))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "radial-gradient(".utf8)
			var first = true

			// Handle shape and size
			if let shape = shape {
				buffer.append(contentsOf: shape.rawValue.utf8)
				first = false
			}
			if let size = size {
				if !first {
					buffer.append(32) // space
				}
				buffer.append(contentsOf: size.value.utf8)
				first = false
			}

			// Handle position
			if let position = position {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: "at ".utf8)
				buffer.append(contentsOf: position.value.utf8)
				first = false
			}

			// Handle color stops
			for stop in colorStops {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: stop.value.utf8)
				first = false
			}

			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	public struct RepeatingRadialGradient: Sendable {
		public let shape: RadialShape?
		public let size: RadialSize?
		public let position: CSSMaskLayer.Position?
		public let colorStops: [ColorStop]

		public init(shape: RadialShape? = nil, size: RadialSize? = nil, position: CSSMaskLayer.Position? = nil, colorStops: [ColorStop]) {
			self.shape = shape
			self.size = size
			self.position = position
			self.colorStops = colorStops
		}

		#if !os(WASI)
		public var value: String {
			var components: [String] = []
			var shapeAndSize: [String] = []
			if let shape = shape {
				shapeAndSize.append(shape.rawValue)
			}
			if let size = size {
				shapeAndSize.append(size.value)
			}
			if !shapeAndSize.isEmpty {
				components.append(shapeAndSize.joined(separator: " "))
			}
			if let position = position {
				components.append("at \(position.value)")
			}
			components.append(contentsOf: colorStops.map { $0.value })
			return "repeating-radial-gradient(\(components.joined(separator: ", ")))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "repeating-radial-gradient(".utf8)
			var first = true

			// Handle shape and size
			if let shape = shape {
				buffer.append(contentsOf: shape.rawValue.utf8)
				first = false
			}
			if let size = size {
				if !first {
					buffer.append(32) // space
				}
				buffer.append(contentsOf: size.value.utf8)
				first = false
			}

			// Handle position
			if let position = position {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: "at ".utf8)
				buffer.append(contentsOf: position.value.utf8)
				first = false
			}

			// Handle color stops
			for stop in colorStops {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: stop.value.utf8)
				first = false
			}

			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	// conic-gradient( [ from <angle> ]? [ at <position> ]? , <angular-color-stop-list> )
	public struct ConicGradient: Sendable {
		public let angle: CSSAngle?
		public let position: CSSMaskLayer.Position?
		public let colorStops: [ColorStop]

		public init(from angle: CSSAngle? = nil, at position: CSSMaskLayer.Position? = nil, colorStops: [ColorStop]) {
			self.angle = angle
			self.position = position
			self.colorStops = colorStops
		}

		#if !os(WASI)
		public var value: String {
			var components: [String] = []
			if let angle = angle {
				components.append("from \(angle.value)")
			}
			if let position = position {
				components.append("at \(position.value)")
			}
			components.append(contentsOf: colorStops.map { $0.value })
			return "conic-gradient(\(components.joined(separator: ", ")))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "conic-gradient(".utf8)
			var first = true

			if let angle = angle {
				buffer.append(contentsOf: "from ".utf8)
				buffer.append(contentsOf: angle.value.utf8)
				first = false
			}

			if let position = position {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: "at ".utf8)
				buffer.append(contentsOf: position.value.utf8)
				first = false
			}

			for stop in colorStops {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: stop.value.utf8)
				first = false
			}

			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	public struct RepeatingConicGradient: Sendable {
		public let angle: CSSAngle?
		public let position: CSSMaskLayer.Position?
		public let colorStops: [ColorStop]

		public init(from angle: CSSAngle? = nil, at position: CSSMaskLayer.Position? = nil, colorStops: [ColorStop]) {
			self.angle = angle
			self.position = position
			self.colorStops = colorStops
		}

		#if !os(WASI)
		public var value: String {
			var components: [String] = []
			if let angle = angle {
				components.append("from \(angle.value)")
			}
			if let position = position {
				components.append("at \(position.value)")
			}
			components.append(contentsOf: colorStops.map { $0.value })
			return "repeating-conic-gradient(\(components.joined(separator: ", ")))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "repeating-conic-gradient(".utf8)
			var first = true

			if let angle = angle {
				buffer.append(contentsOf: "from ".utf8)
				buffer.append(contentsOf: angle.value.utf8)
				first = false
			}

			if let position = position {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: "at ".utf8)
				buffer.append(contentsOf: position.value.utf8)
				first = false
			}

			for stop in colorStops {
				if !first {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: stop.value.utf8)
				first = false
			}

			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	// Gradient direction for linear gradients
	public enum GradientDirection: Sendable {
		case angle(CSSAngle)
		case toSide(CSSGradientDirection)

		public var value: String {
			switch self {
			case .angle(let angle):
				return angle.value
			case .toSide(let side):
				return side.rawValue
			}
		}
	}

	// Radial gradient shape
	public enum RadialShape: String, Sendable {
		case circle = "circle"
		case ellipse = "ellipse"
	}

	// Radial gradient size
	public enum RadialSize: Sendable {
		case closestSide
		case closestCorner
		case farthestSide
		case farthestCorner
		case length(Length)
		case twoLengths(Length, Length)

		public var value: String {
			switch self {
			case .closestSide:
				return "closest-side"
			case .closestCorner:
				return "closest-corner"
			case .farthestSide:
				return "farthest-side"
			case .farthestCorner:
				return "farthest-corner"
			case .length(let length):
				return length.value
			case .twoLengths(let l1, let l2):
				return "\(l1.value) \(l2.value)"
			}
		}		
	}

	// Color stop for gradients
	public struct ColorStop: Sendable {
		public let color: CSSColor
		public let position: Length?

		public init(_ color: CSSColor, _ position: Length? = nil) {
			self.color = color
			self.position = position
		}

		public init(_ color: CSSColor, _ position: Percentage?) {
			self.color = color
			self.position = position.map { Length($0.value) }
		}

		public var value: String {
			if let position = position {
				return "\(color.value) \(position.value)"
			}
			return color.value
		}
	}
}

// MARK: - Convenience helper functions

// Linear gradient




// Radial gradient



// Conic gradient



// Color stop helper



// Gradient direction helpers

