// <color-interpolation-method> =
//   in [ <rectangular-color-space> | <polar-color-space> <hue-interpolation-method>? | <custom-color-space> ]

public enum CSSColorInterpolationMethod: Sendable {
	case rectangular(RectangularColorSpace)
	case polar(PolarColorSpace, HueInterpolationMethod? = nil)
	case custom(CSSDashedIdent)

	// <rectangular-color-space> =
	//   srgb | srgb-linear | display-p3 | display-p3-linear | a98-rgb | prophoto-rgb | rec2020 | lab | oklab | <xyz-space>
	public enum RectangularColorSpace: String, Sendable {
		case srgb = "srgb"
		case srgbLinear = "srgb-linear"
		case displayP3 = "display-p3"
		case displayP3Linear = "display-p3-linear"
		case a98Rgb = "a98-rgb"
		case prophotoRgb = "prophoto-rgb"
		case rec2020 = "rec2020"
		case lab = "lab"
		case oklab = "oklab"
		case xyz = "xyz"
		case xyzD50 = "xyz-d50"
		case xyzD65 = "xyz-d65"
	}

	// <polar-color-space> = hsl | hwb | lch | oklch
	public enum PolarColorSpace: String, Sendable {
		case hsl = "hsl"
		case hwb = "hwb"
		case lch = "lch"
		case oklch = "oklch"
	}

	// <hue-interpolation-method> = [ shorter | longer | increasing | decreasing ] hue
	public enum HueInterpolationMethod: String, Sendable {
		case shorter = "shorter hue"
		case longer = "longer hue"
		case increasing = "increasing hue"
		case decreasing = "decreasing hue"
	}

	public var value: String {
		switch self {
		case .rectangular(let space):
			return "in \(space.rawValue)"
		case .polar(let space, let hue):
			if let hue = hue {
				return "in \(space.rawValue) \(hue.rawValue)"
			}
			return "in \(space.rawValue)"
		case .custom(let ident):
			return "in \(ident.value)"
		}
	}
}
