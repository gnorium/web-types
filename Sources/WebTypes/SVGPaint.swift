#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <paint> = none | <color> | <url> [none | <color>]? | context-fill | context-stroke
public enum SVGPaint: Sendable {
	case none(CSSKeyword.None)
	case color(CSSColor)
	case url(String, fallback: SVGPaintFallback? = nil)
	case contextFill
	case contextStroke

	@_disfavoredOverload
	public static var none: Self { .none(.none) }


	public init(_ color: CSSColor) {
		self = .color(color)
	}

	public var value: String {
		switch self {
		case .none(let keyword):
			return keyword.rawValue
		case .color(let color):
			return color.value
		case .url(let urlValue, let fallback):
			if let fallback = fallback {
				return "\(WebTypes.url("\(urlValue)")) \(fallback.value)"
			}
			return WebTypes.url("\(urlValue)")
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

		@_disfavoredOverload
		public static var none: SVGPaintFallback { .none(.none) }

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
	static var currentColor: SVGPaint { .color(.currentColor) }
	static var white: SVGPaint { .color(.white) }
	static var black: SVGPaint { .color(.black) }
}
