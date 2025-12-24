public enum CSSColorInterpolationMethod: String, Sendable {
	case inSrgb = "srgb"
	case inSrgbLinear = "srgb-linear"
	case inDisplayP3 = "display-p3"
	case inA98Rgb = "a98-rgb"
	case inProphotoRgb = "prophoto-rgb"
	case inRec2020 = "rec2020"
	case inLab = "lab"
	case inOklab = "oklab"
	case inXyz = "xyz"
	case inXyzD50 = "xyz-d50"
	case inXyzD65 = "xyz-d65"
	case inHsl = "hsl"
	case inHwb = "hwb"
	case inLch = "lch"
	case inOklch = "oklch"

	public var value: String {
		rawValue
	}
}
