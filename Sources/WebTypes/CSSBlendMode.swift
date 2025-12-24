public enum CSSBlendMode: String, ExpressibleByStringLiteral, Sendable {
	case normal = "normal"
	case multiply = "multiply"
	case screen = "screen"
	case overlay = "overlay"
	case darken = "darken"
	case lighten = "lighten"
	case colorDodge = "color-dodge"
	case colorBurn = "color-burn"
	case hardLight = "hard-light"
	case softLight = "soft-light"
	case difference = "difference"
	case exclusion = "exclusion"
	case hue = "hue"
	case saturation = "saturation"
	case color = "color"
	case luminosity = "luminosity"

	public init(stringLiteral value: String) {
		self = CSSBlendMode(rawValue: value) ?? .normal
	}
}
