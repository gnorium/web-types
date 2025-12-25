#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <paint> = none | <color> | <url> [none | <color>]? | context-fill | context-stroke
public enum SVGPaint: ExpressibleByStringLiteral, Sendable {
	case none(CSSKeyword.None)
	case color(CSSColor)
	case url(String, fallback: SVGPaintFallback? = nil)
	case contextFill
	case contextStroke

	public init(stringLiteral value: String) {
		// Default to color with hex
		self = .color(.colorBase(.hex(value)))
	}

	public init(_ color: CSSColor) {
		self = .color(color)
	}

	public var value: String {
		switch self {
		case .none(let keyword):
			return keyword.rawValue
		case .color(let color):
			return color.value
		case .url(let url, let fallback):
			if let fallback = fallback {
				return "url(\(url)) \(fallback.value)"
			}
			return "url(\(url))"
		case .contextFill:
			return "context-fill"
		case .contextStroke:
			return "context-stroke"
		}
	}

	// Fallback for url() paint
	public enum SVGPaintFallback: Sendable {
		case none(CSSKeyword.None)
		case color(CSSColor)

		public var value: String {
			switch self {
			case .none(let keyword): return keyword.rawValue
			case .color(let color): return color.value
			}
		}
	}
}

// MARK: - Convenience initializers
public extension SVGPaint {
	static var none: SVGPaint { .none(.none) }
	static var currentColor: SVGPaint { .color(.currentColor) }
	static var white: SVGPaint { .color(.white) }
	static var black: SVGPaint { .color(.black) }
}
