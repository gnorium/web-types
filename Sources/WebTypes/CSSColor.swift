#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <color> =
//   <color-base>        |
//   currentColor        |
//   <system-color>      |
//   <contrast-color()>  |
//   <device-cmyk()>     |
//   <light-dark()>
public indirect enum CSSColor: ExpressibleByStringLiteral, Sendable {
	case colorBase(ColorBase)
	case currentColor(CSSKeyword.CurrentColor)
	case systemColor(String) // System colors are implementation-specific
	case contrastColor(ContrastColor)
	case deviceCmyk(DeviceCmyk)
	case lightDark(LightDark)

	public init(stringLiteral value: String) {
		self = .colorBase(.hex(value))
	}

	public var value: String {
		switch self {
		case .colorBase(let color):
			return color.value
		case .currentColor(let keyword):
			return keyword.rawValue
		case .systemColor(let color):
			return color
		case .contrastColor(let fn):
			return fn.value
		case .deviceCmyk(let fn):
			return fn.value
		case .lightDark(let fn):
			return fn.value
		}
	}

	// <color-base> =
	//   <hex-color>       |
	//   <color-function>  |
	//   <named-color>     |
	//   <color-mix()>     |
	//   transparent
	public indirect enum ColorBase: Sendable {
		case hex(String)
		case colorFunction(ColorFunction)
		case namedColor(NamedColor)
		case colorMix(ColorMix)
		case transparent(CSSKeyword.Transparent)

		public var value: String {
			switch self {
			case .hex(let hex):
				return hex
			case .colorFunction(let fn):
				return fn.value
			case .namedColor(let color):
				return color.rawValue
			case .colorMix(let fn):
				return fn.value
			case .transparent(let keyword):
				return keyword.rawValue
			}
		}
	}

	// <named-color> - CSSProtocol named colors
	public enum NamedColor: String, Sendable {
		case red = "red"
		case blue = "blue"
		case green = "green"
		case yellow = "yellow"
		case orange = "orange"
		case purple = "purple"
		case pink = "pink"
		case black = "black"
		case white = "white"
		case gray = "gray"
		case aliceBlue = "aliceblue"
		case antiqueWhite = "antiquewhite"
		case aqua = "aqua"
		case aquamarine = "aquamarine"
		case azure = "azure"
		case beige = "beige"
		case bisque = "bisque"
		case blanchedAlmond = "blanchedalmond"
		case blueViolet = "blueviolet"
		case brown = "brown"
		case burlyWood = "burlywood"
		case cadetBlue = "cadetblue"
		case chartreuse = "chartreuse"
		case chocolate = "chocolate"
		case coral = "coral"
		case cornflowerBlue = "cornflowerblue"
		case cornsilk = "cornsilk"
		case crimson = "crimson"
		case cyan = "cyan"
		case darkBlue = "darkblue"
		case darkCyan = "darkcyan"
		case darkGoldenrod = "darkgoldenrod"
		case darkGray = "darkgray"
		case darkGreen = "darkgreen"
		case darkKhaki = "darkkhaki"
		case darkMagenta = "darkmagenta"
		case darkOliveGreen = "darkolivegreen"
		case darkOrange = "darkorange"
		case darkOrchid = "darkorchid"
		case darkRed = "darkred"
		case darkSalmon = "darksalmon"
		case darkSeaGreen = "darkseagreen"
		case darkSlateBlue = "darkslateblue"
		case darkSlateGray = "darkslategray"
		case darkTurquoise = "darkturquoise"
		case darkViolet = "darkviolet"
		case deepPink = "deeppink"
		case deepSkyBlue = "deepskyblue"
		case dimGray = "dimgray"
		case dodgerBlue = "dodgerblue"
		case firebrick = "firebrick"
		case floralWhite = "floralwhite"
		case forestGreen = "forestgreen"
		case fuchsia = "fuchsia"
		case gainsboro = "gainsboro"
		case ghostWhite = "ghostwhite"
		case gold = "gold"
		case goldenrod = "goldenrod"
		case greenYellow = "greenyellow"
		case honeydew = "honeydew"
		case hotPink = "hotpink"
		case indianRed = "indianred"
		case indigo = "indigo"
		case ivory = "ivory"
		case khaki = "khaki"
		case lavender = "lavender"
		case lavenderBlush = "lavenderblush"
		case lawnGreen = "lawngreen"
		case lemonChiffon = "lemonchiffon"
		case lightBlue = "lightblue"
		case lightCoral = "lightcoral"
		case lightCyan = "lightcyan"
		case lightGoldenrodYellow = "lightgoldenrodyellow"
		case lightGray = "lightgray"
		case lightGreen = "lightgreen"
		case lightPink = "lightpink"
		case lightSalmon = "lightsalmon"
		case lightSeaGreen = "lightseagreen"
		case lightSkyBlue = "lightskyblue"
		case lightSlateGray = "lightslategray"
		case lightSteelBlue = "lightsteelblue"
		case lightYellow = "lightyellow"
		case lime = "lime"
		case limeGreen = "limegreen"
		case linen = "linen"
		case magenta = "magenta"
		case maroon = "maroon"
		case mediumAquamarine = "mediumaquamarine"
		case mediumBlue = "mediumblue"
		case mediumOrchid = "mediumorchid"
		case mediumPurple = "mediumpurple"
		case mediumSeaGreen = "mediumseagreen"
		case mediumSlateBlue = "mediumslateblue"
		case mediumSpringGreen = "mediumspringgreen"
		case mediumTurquoise = "mediumturquoise"
		case mediumVioletRed = "mediumvioletred"
		case midnightBlue = "midnightblue"
		case mintCream = "mintcream"
		case mistyRose = "mistyrose"
		case moccasin = "moccasin"
		case navajoWhite = "navajowhite"
		case navy = "navy"
		case oldLace = "oldlace"
		case olive = "olive"
		case oliveDrab = "olivedrab"
		case orchid = "orchid"
		case paleGoldenrod = "palegoldenrod"
		case paleGreen = "palegreen"
		case paleTurquoise = "paleturquoise"
		case paleVioletRed = "palevioletred"
		case papayaWhip = "papayawhip"
		case peachPuff = "peachpuff"
		case peru = "peru"
		case plum = "plum"
		case powderBlue = "powderblue"
		case rebeccaPurple = "rebeccapurple"
		case rosyBrown = "rosybrown"
		case royalBlue = "royalblue"
		case saddleBrown = "saddlebrown"
		case salmon = "salmon"
		case sandyBrown = "sandybrown"
		case seaGreen = "seagreen"
		case seashell = "seashell"
		case sienna = "sienna"
		case silver = "silver"
		case skyBlue = "skyblue"
		case slateBlue = "slateblue"
		case slateGray = "slategray"
		case snow = "snow"
		case springGreen = "springgreen"
		case steelBlue = "steelblue"
		case tan = "tan"
		case teal = "teal"
		case thistle = "thistle"
		case tomato = "tomato"
		case turquoise = "turquoise"
		case violet = "violet"
		case wheat = "wheat"
		case whiteSmoke = "whitesmoke"
		case yellowGreen = "yellowgreen"
	}

	// <color-function> =
	//   <rgb()>     |
	//   <rgba()>    |
	//   <hsl()>     |
	//   <hsla()>    |
	//   <hwb()>     |
	//   <lab()>     |
	//   <lch()>     |
	//   <oklab()>   |
	//   <oklch()>   |
	//   <ictcp()>   |
	//   <jzazbz()>  |
	//   <jzczhz()>  |
	//   <alpha()>   |
	//   <color()>
	public enum ColorFunction: Sendable {
		case rgb(RGB)
		case rgba(RGBA)
		case hsl(HSL)
		case hsla(HSLA)
		case hwb(HWB)
		case lab(LAB)
		case lch(LCH)
		case oklab(OKLAB)
		case oklch(OKLCH)
		case ictcp(ICTCP)
		case jzazbz(JZAZBZ)
		case jzczhz(JZCZHZ)
		case alpha(Alpha)
		case color(Color)

		public var value: String {
			switch self {
			case .rgb(let fn):
				return fn.value
			case .rgba(let fn):
				return fn.value
			case .hsl(let fn):
				return fn.value
			case .hsla(let fn):
				return fn.value
			case .hwb(let fn):
				return fn.value
			case .lab(let fn):
				return fn.value
			case .lch(let fn):
				return fn.value
			case .oklab(let fn):
				return fn.value
			case .oklch(let fn):
				return fn.value
			case .ictcp(let fn):
				return fn.value
			case .jzazbz(let fn):
				return fn.value
			case .jzczhz(let fn):
				return fn.value
			case .alpha(let fn):
				return fn.value
			case .color(let fn):
				return fn.value
			}
		}
	}

	// MARK: - RGB Functions

	// <rgb()> = <legacy-rgb-syntax> | <modern-rgb-syntax>
	// Legacy: rgb( <percentage>#{3} , <alpha-value>? ) | rgb( <number>#{3} , <alpha-value>? )
	// Modern: rgb( [ from <color> ]? [ <number> | <percentage> | none ]{3} [ / [ <alpha-value> | none ] ]? )
	public struct RGB: Sendable {
		private let components: String

	#if !os(WASI)

		// Legacy syntax with integer values
		public init(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "rgb(\(r), \(g), \(b), \(alpha))"
			} else {
				self.components = "rgb(\(r), \(g), \(b))"
			}
		}

		// Legacy syntax with floating-point values
		public init(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "rgb(\(r), \(g), \(b), \(alpha))"
			} else {
				self.components = "rgb(\(r), \(g), \(b))"
			}
		}

	#endif

	#if os(WASI)

		// Legacy syntax with integer values
		public init(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "rgb(\(r), \(g), \(b), \(doubleToString(alpha)))"
			} else {
				self.components = "rgb(\(r), \(g), \(b))"
			}
		}

		// Legacy syntax with floating-point values
		public init(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "rgb(\(r), \(g), \(b), \(doubleToString(alpha)))"
			} else {
				self.components = "rgb(\(r), \(g), \(b))"
			}
		}

	#endif

	#if !os(WASI)

		// Legacy syntax with percentages
		public init(_ r: Percentage, _ g: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "rgb(\(r.value), \(g.value), \(b.value), \(alpha))"
			} else {
				self.components = "rgb(\(r.value), \(g.value), \(b.value))"
			}
		}

	#endif

	#if os(WASI)

		// Legacy syntax with percentages
		public init(_ r: Percentage, _ g: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "rgb(\(r.value), \(g.value), \(b.value), \(doubleToString(alpha)))"
			} else {
				self.components = "rgb(\(r.value), \(g.value), \(b.value))"
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <rgba()> = <legacy-rgba-syntax> | <modern-rgba-syntax>
	public struct RGBA: Sendable {
		private let components: String

	#if !os(WASI)

		// Legacy syntax with integer values
		public init(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double) {
			self.components = "rgba(\(r), \(g), \(b), \(alpha))"
		}

		// Legacy syntax with floating-point values
		public init(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double) {
			self.components = "rgba(\(r), \(g), \(b), \(alpha))"
		}

		// Legacy syntax with percentages
		public init(_ r: Percentage, _ g: Percentage, _ b: Percentage, _ alpha: Double) {
			self.components = "rgba(\(r.value), \(g.value), \(b.value), \(alpha))"
		}

	#endif

	#if os(WASI)

		// Legacy syntax with integer values
		public init(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double) {
			self.components = "rgba(\(r), \(g), \(b), \(doubleToString(alpha)))"
		}

		// Legacy syntax with floating-point values
		public init(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double) {
			self.components = "rgba(\(r), \(g), \(b), \(doubleToString(alpha)))"
		}

		// Legacy syntax with percentages
		public init(_ r: Percentage, _ g: Percentage, _ b: Percentage, _ alpha: Double) {
			self.components = "rgba(\(r.value), \(g.value), \(b.value), \(doubleToString(alpha)))"
		}

	#endif

		public var value: String {
			components
		}
	}

	// MARK: - HSL Functions

	// <hsl()> = <legacy-hsl-syntax> | <modern-hsl-syntax>
	// Legacy: hsl( <hue> , <percentage> , <percentage> , <alpha-value>? )
	public struct HSL: Sendable {
		private let components: String

	#if !os(WASI)

		// Hue as number (degrees)
		public init(_ h: Double, _ s: Percentage, _ l: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "hsl(\(h), \(s.value), \(l.value), \(alpha))"
			} else {
				self.components = "hsl(\(h), \(s.value), \(l.value))"
			}
		}

		// Hue as angle
		public init(_ h: CSSAngle, _ s: Percentage, _ l: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "hsl(\(h.value), \(s.value), \(l.value), \(alpha))"
			} else {
				self.components = "hsl(\(h.value), \(s.value), \(l.value))"
			}
		}

	#endif

	#if os(WASI)

		// Hue as number (degrees)
		public init(_ h: Double, _ s: Percentage, _ l: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "hsl(\(doubleToString(h)), \(s.value), \(l.value), \(doubleToString(alpha)))"
			} else {
				self.components = "hsl(\(doubleToString(h)), \(s.value), \(l.value))"
			}
		}

		// Hue as angle
		public init(_ h: CSSAngle, _ s: Percentage, _ l: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = "hsl(\(h.value), \(s.value), \(l.value), \(doubleToString(alpha)))"
			} else {
				self.components = "hsl(\(h.value), \(s.value), \(l.value))"
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <hsla()> = <legacy-hsla-syntax> | <modern-hsla-syntax>
	public struct HSLA: Sendable {
		private let components: String

	#if !os(WASI)

		// Hue as number (degrees)
		public init(_ h: Double, _ s: Percentage, _ l: Percentage, _ alpha: Double) {
			self.components = "hsla(\(h), \(s.value), \(l.value), \(alpha))"
		}

		// Hue as angle
		public init(_ h: CSSAngle, _ s: Percentage, _ l: Percentage, _ alpha: Double) {
			self.components = "hsla(\(h.value), \(s.value), \(l.value), \(alpha))"
		}

	#endif

	#if os(WASI)

		// Hue as number (degrees)
		public init(_ h: Double, _ s: Percentage, _ l: Percentage, _ alpha: Double) {
			self.components = "hsla(\(doubleToString(h)), \(s.value), \(l.value), \(doubleToString(alpha)))"
		}

		// Hue as angle
		public init(_ h: CSSAngle, _ s: Percentage, _ l: Percentage, _ alpha: Double) {
			self.components = "hsla(\(h.value), \(s.value), \(l.value), \(doubleToString(alpha)))"
		}

	#endif

		public var value: String {
			components
		}
	}

	// MARK: - Modern Color Spaces

	// <hwb()> = hwb( [ from <color> ]? [ <hue> | none ] [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ / [ <alpha-value> | none ] ]? )
	public struct HWB: Sendable {
		private let components: String

	#if !os(WASI)

		// Basic syntax with hue as number
		public init(_ h: Double, _ w: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("hwb(", "\(h)", " ", w.value, " ", b.value, " / ", "\(alpha)", ")")
			} else {
				self.components = concat("hwb(", "\(h)", " ", w.value, " ", b.value, ")")
			}
		}

		// With hue as angle
		public init(_ h: CSSAngle, _ w: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("hwb(", h.value, " ", w.value, " ", b.value, " / ", "\(alpha)", ")")
			} else {
				self.components = concat("hwb(", h.value, " ", w.value, " ", b.value, ")")
			}
		}

	#endif

	#if os(WASI)

		// Basic syntax with hue as number
		public init(_ h: Double, _ w: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("hwb(", doubleToString(h), " ", w.value, " ", b.value, " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("hwb(", doubleToString(h), " ", w.value, " ", b.value, ")")
			}
		}

		// With hue as angle
		public init(_ h: CSSAngle, _ w: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("hwb(", h.value, " ", w.value, " ", b.value, " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("hwb(", h.value, " ", w.value, " ", b.value, ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <lab()> = lab( [ from <color> ]? [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ / [ <alpha-value> | none ] ]? )
	public struct LAB: Sendable {
		private let components: String

	#if !os(WASI)

		public init(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("lab(", "\(l)", " ", "\(a)", " ", "\(b)", " / ", "\(alpha)", ")")
			} else {
				self.components = concat("lab(", "\(l)", " ", "\(a)", " ", "\(b)", ")")
			}
		}

	#endif

	#if os(WASI)

		public init(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("lab(", doubleToString(l), " ", doubleToString(a), " ", doubleToString(b), " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("lab(", doubleToString(l), " ", doubleToString(a), " ", doubleToString(b), ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <lch()> = lch( [ from <color> ]? [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ <hue> | none ] [ / [ <alpha-value> | none ] ]? )
	public struct LCH: Sendable {
		private let components: String

	#if !os(WASI)

		// Hue as number
		public init(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("lch(", "\(l)", " ", "\(c)", " ", "\(h)", " / ", "\(alpha)", ")")
			} else {
				self.components = concat("lch(", "\(l)", " ", "\(c)", " ", "\(h)", ")")
			}
		}

		// Hue as angle
		public init(_ l: Double, _ c: Double, _ h: CSSAngle, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("lch(", "\(l)", " ", "\(c)", " ", h.value, " / ", "\(alpha)", ")")
			} else {
				self.components = concat("lch(", "\(l)", " ", "\(c)", " ", h.value, ")")
			}
		}

	#endif

	#if os(WASI)

		// Hue as number
		public init(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("lch(", doubleToString(l), " ", doubleToString(c), " ", doubleToString(h), " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("lch(", doubleToString(l), " ", doubleToString(c), " ", doubleToString(h), ")")
			}
		}

		// Hue as angle
		public init(_ l: Double, _ c: Double, _ h: CSSAngle, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("lch(", doubleToString(l), " ", doubleToString(c), " ", h.value, " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("lch(", doubleToString(l), " ", doubleToString(c), " ", h.value, ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <oklab()> = oklab( [ from <color> ]? [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ / [ <alpha-value> | none ] ]? )
	public struct OKLAB: Sendable {
		private let components: String

		public init(from color: CSSColor, _ l: CSSOKLABComponent, _ a: CSSOKLABComponent, _ b: CSSOKLABComponent) {
			self.components = concat("oklab(from ", color.value, " ", l.rawValue, " ", a.rawValue, " ", b.rawValue, ")")
		}

	#if !os(WASI)

		public init(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("oklab(", "\(l)", " ", "\(a)", " ", "\(b)", " / ", "\(alpha)", ")")
			} else {
				self.components = concat("oklab(", "\(l)", " ", "\(a)", " ", "\(b)", ")")
			}
		}

	#endif

	#if os(WASI)

		public init(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("oklab(", doubleToString(l), " ", doubleToString(a), " ", doubleToString(b), " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("oklab(", doubleToString(l), " ", doubleToString(a), " ", doubleToString(b), ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <oklch()> = oklch( [ from <color> ]? [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ <hue> | none ] [ / [ <alpha-value> | none ] ]? )
	public struct OKLCH: Sendable {
		private let components: String

	#if !os(WASI)

		// Hue as number
		public init(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("oklch(", "\(l)", " ", "\(c)", " ", "\(h)", " / ", "\(alpha)", ")")
			} else {
				self.components = concat("oklch(", "\(l)", " ", "\(c)", " ", "\(h)", ")")
			}
		}

		// Hue as angle
		public init(_ l: Double, _ c: Double, _ h: CSSAngle, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("oklch(", "\(l)", " ", "\(c)", " ", h.value, " / ", "\(alpha)", ")")
			} else {
				self.components = concat("oklch(", "\(l)", " ", "\(c)", " ", h.value, ")")
			}
		}

	#endif

	#if os(WASI)

		// Hue as number
		public init(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("oklch(", doubleToString(l), " ", doubleToString(c), " ", doubleToString(h), " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("oklch(", doubleToString(l), " ", doubleToString(c), " ", doubleToString(h), ")")
			}
		}

		// Hue as angle
		public init(_ l: Double, _ c: Double, _ h: CSSAngle, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("oklch(", doubleToString(l), " ", doubleToString(c), " ", h.value, " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("oklch(", doubleToString(l), " ", doubleToString(c), " ", h.value, ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <ictcp()> = ictcp( [ from <color> ]? [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ / [ <alpha-value> | none ] ]? )
	public struct ICTCP: Sendable {
		private let components: String

	#if !os(WASI)

		public init(_ i: Double, _ ct: Double, _ cp: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("ictcp(", "\(i)", " ", "\(ct)", " ", "\(cp)", " / ", "\(alpha)", ")")
			} else {
				self.components = concat("ictcp(", "\(i)", " ", "\(ct)", " ", "\(cp)", ")")
			}
		}

	#endif

	#if os(WASI)

		public init(_ i: Double, _ ct: Double, _ cp: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("ictcp(", doubleToString(i), " ", doubleToString(ct), " ", doubleToString(cp), " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("ictcp(", doubleToString(i), " ", doubleToString(ct), " ", doubleToString(cp), ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <jzazbz()> = jzazbz( [ from <color> ]? [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ / [ <alpha-value> | none ] ]? )
	public struct JZAZBZ: Sendable {
		private let components: String

	#if !os(WASI)

		public init(_ jz: Double, _ az: Double, _ bz: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("jzazbz(", "\(jz)", " ", "\(az)", " ", "\(bz)", " / ", "\(alpha)", ")")
			} else {
				self.components = concat("jzazbz(", "\(jz)", " ", "\(az)", " ", "\(bz)", ")")
			}
		}

	#endif

	#if os(WASI)

		public init(_ jz: Double, _ az: Double, _ bz: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("jzazbz(", doubleToString(jz), " ", doubleToString(az), " ", doubleToString(bz), " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("jzazbz(", doubleToString(jz), " ", doubleToString(az), " ", doubleToString(bz), ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <jzczhz()> = jzczhz( [ from <color> ]? [ <percentage> | <number> | none ] [ <percentage> | <number> | none ] [ <hue> | none ] [ / [ <alpha-value> | none ] ]? )
	public struct JZCZHZ: Sendable {
		private let components: String

	#if !os(WASI)

		// Hue as number
		public init(_ jz: Double, _ cz: Double, _ hz: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("jzczhz(", "\(jz)", " ", "\(cz)", " ", "\(hz)", " / ", "\(alpha)", ")")
			} else {
				self.components = concat("jzczhz(", "\(jz)", " ", "\(cz)", " ", "\(hz)", ")")
			}
		}

		// Hue as angle
		public init(_ jz: Double, _ cz: Double, _ hz: CSSAngle, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("jzczhz(", "\(jz)", " ", "\(cz)", " ", hz.value, " / ", "\(alpha)", ")")
			} else {
				self.components = concat("jzczhz(", "\(jz)", " ", "\(cz)", " ", hz.value, ")")
			}
		}

	#endif

	#if os(WASI)

		// Hue as number
		public init(_ jz: Double, _ cz: Double, _ hz: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("jzczhz(", doubleToString(jz), " ", doubleToString(cz), " ", doubleToString(hz), " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("jzczhz(", doubleToString(jz), " ", doubleToString(cz), " ", doubleToString(hz), ")")
			}
		}

		// Hue as angle
		public init(_ jz: Double, _ cz: Double, _ hz: CSSAngle, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("jzczhz(", doubleToString(jz), " ", doubleToString(cz), " ", hz.value, " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("jzczhz(", doubleToString(jz), " ", doubleToString(cz), " ", hz.value, ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <alpha()> = alpha( [ from <color> ] [ / [ <alpha-value> | none ] ]? )
	public struct Alpha: Sendable {
		private let components: String

	#if !os(WASI)

		public init(from color: CSSColor, alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("alpha(from ", color.value, " / ", "\(alpha)", ")")
			} else {
				self.components = concat("alpha(from ", color.value, ")")
			}
		}

	#endif

	#if os(WASI)

		public init(from color: CSSColor, alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("alpha(from ", color.value, " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("alpha(from ", color.value, ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// <color()> = color( [ from <color> ]? <colorspace-params> [ / [ <alpha-value> | none ] ]? )
	public struct Color: Sendable {
		private let components: String

	#if !os(WASI)

		// Predefined RGB color spaces
		public init(_ colorSpace: String, _ c1: Double, _ c2: Double, _ c3: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("color(", colorSpace, " ", "\(c1)", " ", "\(c2)", " ", "\(c3)", " / ", "\(alpha)", ")")
			} else {
				self.components = concat("color(", colorSpace, " ", "\(c1)", " ", "\(c2)", " ", "\(c3)", ")")
			}
		}

	#endif

	#if os(WASI)

		// Predefined RGB color spaces
		public init(_ colorSpace: String, _ c1: Double, _ c2: Double, _ c3: Double, _ alpha: Double? = nil) {
			if let alpha = alpha {
				self.components = concat("color(", colorSpace, " ", doubleToString(c1), " ", doubleToString(c2), " ", doubleToString(c3), " / ", doubleToString(alpha), ")")
			} else {
				self.components = concat("color(", colorSpace, " ", doubleToString(c1), " ", doubleToString(c2), " ", doubleToString(c3), ")")
			}
		}

	#endif

		public var value: String {
			components
		}
	}

	// MARK: - Utility Functions

	// <light-dark()> = light-dark( <color> , <color> )
	public struct LightDark: Sendable {
		public let light: CSSColor
		public let dark: CSSColor

		public init(_ light: CSSColor, _ dark: CSSColor) {
			self.light = light
			self.dark = dark
		}

		public var value: String {
			concat("light-dark(", light.value, ", ", dark.value, ")")
		}
	}

	// <color-mix()> = color-mix( <color-interpolation-method>? , [ <color> && <percentage [0,100]>? ]# )
	public struct ColorMix: Sendable {
		public let interpolationMethod: String?
		public let color1: CSSColor
		public let percentage1: Percentage?
		public let color2: CSSColor
		public let percentage2: Percentage?

		public init(
			in interpolationMethod: String? = nil,
			_ color1: CSSColor,
			_ percentage1: Percentage? = nil,
			_ color2: CSSColor,
			_ percentage2: Percentage? = nil
		) {
			self.interpolationMethod = interpolationMethod
			self.color1 = color1
			self.percentage1 = percentage1
			self.color2 = color2
			self.percentage2 = percentage2
		}

		public var value: String {
			var components: [String] = []

			if let method = interpolationMethod {
				components.append(method)
			}

			var color1Str = color1.value
			if let pct1 = percentage1 {
				color1Str = concat(color1Str, " ", pct1.value)
			}
			components.append(color1Str)

			var color2Str = color2.value
			if let pct2 = percentage2 {
				color2Str = concat(color2Str, " ", pct2.value)
			}
			components.append(color2Str)

			// Manual join of components with ", "
			var result = "color-mix("
			for (index, component) in components.enumerated() {
				if index > 0 {
					result = concat(result, ", ", component)
				} else {
					result = concat(result, component)
				}
			}
			return concat(result, ")")
		}
	}

	// <device-cmyk()> = <legacy-device-cmyk-syntax> | <modern-device-cmyk-syntax>
	public struct DeviceCmyk: Sendable {
		private let components: String

	#if !os(WASI)

		// Legacy syntax: device-cmyk( <number>#{4} )
		public init(_ c: Double, _ m: Double, _ y: Double, _ k: Double) {
			self.components = concat("device-cmyk(", "\(c)", ", ", "\(m)", ", ", "\(y)", ", ", "\(k)", ")")
		}

		// Modern syntax with alpha: device-cmyk( <cmyk-component>{4} [ / [ <alpha-value> | none ] ]? )
		public init(_ c: Double, _ m: Double, _ y: Double, _ k: Double, _ alpha: Double) {
			self.components = concat("device-cmyk(", "\(c)", " ", "\(m)", " ", "\(y)", " ", "\(k)", " / ", "\(alpha)", ")")
		}

	#endif

	#if os(WASI)

		// Legacy syntax: device-cmyk( <number>#{4} )
		public init(_ c: Double, _ m: Double, _ y: Double, _ k: Double) {
			self.components = concat("device-cmyk(", doubleToString(c), ", ", doubleToString(m), ", ", doubleToString(y), ", ", doubleToString(k), ")")
		}

		// Modern syntax with alpha: device-cmyk( <cmyk-component>{4} [ / [ <alpha-value> | none ] ]? )
		public init(_ c: Double, _ m: Double, _ y: Double, _ k: Double, _ alpha: Double) {
			self.components = concat("device-cmyk(", doubleToString(c), " ", doubleToString(m), " ", doubleToString(y), " ", doubleToString(k), " / ", doubleToString(alpha), ")")
		}

	#endif

		public var value: String {
			components
		}
	}

	// <contrast-color()> - Simplified implementation
	public struct ContrastColor: Sendable {
		public let color: CSSColor

		public init(_ color: CSSColor) {
			self.color = color
		}

		public var value: String {
			concat("contrast-color(", color.value, ")")
		}
	}
}

// MARK: - Convenience Helper Functions

// MARK: - Hex Colors
public func hex(_ value: String) -> CSSColor {
	.colorBase(.hex(value))
}

public func hex(_ value: Int) -> CSSColor {
	let hexString = String(value, radix: 16, uppercase: true)
	let paddedHex = String(repeating: "0", count: max(0, 6 - hexString.count)) + hexString
	return .colorBase(.hex("#" + paddedHex))
}

// MARK: - RGB/RGBA
public func rgb(_ r: Int, _ g: Int, _ b: Int) -> CSSColor {
	.colorBase(.colorFunction(.rgb(CSSColor.RGB(r, g, b))))
}

public func rgb(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.rgb(CSSColor.RGB(r, g, b, alpha))))
}

public func rgb(_ r: Percentage, _ g: Percentage, _ b: Percentage) -> CSSColor {
	.colorBase(.colorFunction(.rgb(CSSColor.RGB(r, g, b))))
}

public func rgb(_ r: Percentage, _ g: Percentage, _ b: Percentage, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.rgb(CSSColor.RGB(r, g, b, alpha))))
}

public func rgb(_ r: Double, _ g: Double, _ b: Double) -> CSSColor {
	.colorBase(.colorFunction(.rgb(CSSColor.RGB(r, g, b))))
}

public func rgb(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.rgb(CSSColor.RGB(r, g, b, alpha))))
}

public func rgba(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.rgba(CSSColor.RGBA(r, g, b, alpha))))
}

public func rgba(_ components: (Int, Int, Int), _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.rgba(CSSColor.RGBA(components.0, components.1, components.2, alpha))))
}

public func rgba(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.rgba(CSSColor.RGBA(r, g, b, alpha))))
}

public func rgba(_ r: Percentage, _ g: Percentage, _ b: Percentage, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.rgba(CSSColor.RGBA(r, g, b, alpha))))
}

// MARK: - HSL/HSLA
public func hsl(_ h: Double, _ s: Percentage, _ l: Percentage) -> CSSColor {
	.colorBase(.colorFunction(.hsl(CSSColor.HSL(h, s, l))))
}

public func hsl(_ h: Double, _ s: Percentage, _ l: Percentage, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.hsl(CSSColor.HSL(h, s, l, alpha))))
}

public func hsl(_ h: CSSAngle, _ s: Percentage, _ l: Percentage) -> CSSColor {
	.colorBase(.colorFunction(.hsl(CSSColor.HSL(h, s, l))))
}

public func hsl(_ h: CSSAngle, _ s: Percentage, _ l: Percentage, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.hsl(CSSColor.HSL(h, s, l, alpha))))
}

public func hsla(_ h: Double, _ s: Percentage, _ l: Percentage, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.hsla(CSSColor.HSLA(h, s, l, alpha))))
}

public func hsla(_ h: CSSAngle, _ s: Percentage, _ l: Percentage, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.hsla(CSSColor.HSLA(h, s, l, alpha))))
}

// MARK: - HWB
public func hwb(_ h: Double, _ w: Percentage, _ b: Percentage) -> CSSColor {
	.colorBase(.colorFunction(.hwb(CSSColor.HWB(h, w, b))))
}

public func hwb(_ h: Double, _ w: Percentage, _ b: Percentage, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.hwb(CSSColor.HWB(h, w, b, alpha))))
}

public func hwb(_ h: CSSAngle, _ w: Percentage, _ b: Percentage) -> CSSColor {
	.colorBase(.colorFunction(.hwb(CSSColor.HWB(h, w, b))))
}

public func hwb(_ h: CSSAngle, _ w: Percentage, _ b: Percentage, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.hwb(CSSColor.HWB(h, w, b, alpha))))
}

// MARK: - LAB
public func lab(_ l: Double, _ a: Double, _ b: Double) -> CSSColor {
	.colorBase(.colorFunction(.lab(CSSColor.LAB(l, a, b))))
}

public func lab(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.lab(CSSColor.LAB(l, a, b, alpha))))
}

// MARK: - LCH
public func lch(_ l: Double, _ c: Double, _ h: Double) -> CSSColor {
	.colorBase(.colorFunction(.lch(CSSColor.LCH(l, c, h))))
}

public func lch(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.lch(CSSColor.LCH(l, c, h, alpha))))
}

public func lch(_ l: Double, _ c: Double, _ h: CSSAngle) -> CSSColor {
	.colorBase(.colorFunction(.lch(CSSColor.LCH(l, c, h))))
}

public func lch(_ l: Double, _ c: Double, _ h: CSSAngle, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.lch(CSSColor.LCH(l, c, h, alpha))))
}

// MARK: - Oklab
public func oklab(_ l: Double, _ a: Double, _ b: Double) -> CSSColor {
	.colorBase(.colorFunction(.oklab(CSSColor.OKLAB(l, a, b))))
}

public func oklab(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double) -> CSSColor {
	return .colorBase(.colorFunction(.oklab(CSSColor.OKLAB(l, a, b, alpha))))
}

public func oklab(from color: CSSColor, _ l: CSSOKLABComponent, _ a: CSSOKLABComponent, _ b: CSSOKLABComponent) -> CSSColor {
	return .colorBase(.colorFunction(.oklab(CSSColor.OKLAB(from: color, l, a, b))))
}

// MARK: - Oklch
public func oklch(_ l: Double, _ c: Double, _ h: Double) -> CSSColor {
	.colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l, c, h))))
}

public func oklch(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l, c, h, alpha))))
}

public func oklch(_ l: Double, _ c: Double, _ h: CSSAngle) -> CSSColor {
	.colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l, c, h))))
}

public func oklch(_ l: Double, _ c: Double, _ h: CSSAngle, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l, c, h, alpha))))
}

// MARK: - ICTCP
public func ictcp(_ i: Double, _ ct: Double, _ cp: Double) -> CSSColor {
	.colorBase(.colorFunction(.ictcp(CSSColor.ICTCP(i, ct, cp))))
}

public func ictcp(_ i: Double, _ ct: Double, _ cp: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.ictcp(CSSColor.ICTCP(i, ct, cp, alpha))))
}

// MARK: - Jzazbz
public func jzazbz(_ jz: Double, _ az: Double, _ bz: Double) -> CSSColor {
	.colorBase(.colorFunction(.jzazbz(CSSColor.JZAZBZ(jz, az, bz))))
}

public func jzazbz(_ jz: Double, _ az: Double, _ bz: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.jzazbz(CSSColor.JZAZBZ(jz, az, bz, alpha))))
}

// MARK: - Jzczhz
public func jzczhz(_ jz: Double, _ cz: Double, _ hz: Double) -> CSSColor {
	.colorBase(.colorFunction(.jzczhz(CSSColor.JZCZHZ(jz, cz, hz))))
}

public func jzczhz(_ jz: Double, _ cz: Double, _ hz: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.jzczhz(CSSColor.JZCZHZ(jz, cz, hz, alpha))))
}

public func jzczhz(_ jz: Double, _ cz: Double, _ hz: CSSAngle) -> CSSColor {
	.colorBase(.colorFunction(.jzczhz(CSSColor.JZCZHZ(jz, cz, hz))))
}

public func jzczhz(_ jz: Double, _ cz: Double, _ hz: CSSAngle, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.jzczhz(CSSColor.JZCZHZ(jz, cz, hz, alpha))))
}

// MARK: - Color function
public func color(_ colorSpace: String, _ c1: Double, _ c2: Double, _ c3: Double) -> CSSColor {
	.colorBase(.colorFunction(.color(CSSColor.Color(colorSpace, c1, c2, c3))))
}

public func color(_ colorSpace: String, _ c1: Double, _ c2: Double, _ c3: Double, _ alpha: Double) -> CSSColor {
	.colorBase(.colorFunction(.color(CSSColor.Color(colorSpace, c1, c2, c3, alpha))))
}

// MARK: - Utility functions
public func lightDark(_ light: CSSColor, _ dark: CSSColor) -> CSSColor {
	.lightDark(CSSColor.LightDark(light, dark))
}

// colorMix syntax: colorMix(in: .oklab, .red, (.blue, perc(50)))
public func colorMix(in interpolationMethod: CSSColorInterpolationMethod, _ color1: CSSColor, _ color2: (CSSColor, Percentage)) -> CSSColor {
	.colorBase(.colorMix(CSSColor.ColorMix(in: interpolationMethod.value, color1, nil, color2.0, color2.1)))
}

// colorMix with transparent keyword in tuple
public func colorMix(in interpolationMethod: CSSColorInterpolationMethod, _ color1: CSSColor, _ color2: (CSSKeyword.Transparent, Percentage)) -> CSSColor {
	.colorBase(.colorMix(CSSColor.ColorMix(in: interpolationMethod.value, color1, nil, CSSColor(color2.0), color2.1)))
}

// colorMix with both percentages
public func colorMix(in interpolationMethod: CSSColorInterpolationMethod, _ color1: (CSSColor, Percentage), _ color2: (CSSColor, Percentage)) -> CSSColor {
	.colorBase(.colorMix(CSSColor.ColorMix(in: interpolationMethod.value, color1.0, color1.1, color2.0, color2.1)))
}

// colorMix with transparent in second tuple
public func colorMix(in interpolationMethod: CSSColorInterpolationMethod, _ color1: (CSSColor, Percentage), _ color2: (CSSKeyword.Transparent, Percentage)) -> CSSColor {
	.colorBase(.colorMix(CSSColor.ColorMix(in: interpolationMethod.value, color1.0, color1.1, CSSColor(color2.0), color2.1)))
}

// colorMix with transparent in first tuple
public func colorMix(in interpolationMethod: CSSColorInterpolationMethod, _ color1: (CSSKeyword.Transparent, Percentage), _ color2: (CSSColor, Percentage)) -> CSSColor {
	.colorBase(.colorMix(CSSColor.ColorMix(in: interpolationMethod.value, CSSColor(color1.0), color1.1, color2.0, color2.1)))
}

// colorMix without percentages
public func colorMix(in interpolationMethod: CSSColorInterpolationMethod, _ color1: CSSColor, _ color2: CSSColor) -> CSSColor {
	.colorBase(.colorMix(CSSColor.ColorMix(in: interpolationMethod.value, color1, nil, color2, nil)))
}

// MARK: - Rectangular colorMix overloads

public func colorMix(in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: CSSColor, _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: CSSColor, _ color2: (CSSKeyword.Transparent, Percentage)) -> CSSColor {
	colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: (CSSColor, Percentage), _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: (CSSColor, Percentage), _ color2: (CSSKeyword.Transparent, Percentage)) -> CSSColor {
	colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: (CSSKeyword.Transparent, Percentage), _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: CSSColor, _ color2: CSSColor) -> CSSColor {
	colorMix(in: .rectangular(colorSpace), color1, color2)
}

// MARK: - Polar colorMix overloads

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: CSSColor, _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: CSSColor, _ color2: (CSSKeyword.Transparent, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: (CSSColor, Percentage), _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: (CSSColor, Percentage), _ color2: (CSSKeyword.Transparent, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: (CSSKeyword.Transparent, Percentage), _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: CSSColor, _ color2: CSSColor) -> CSSColor {
	colorMix(in: .polar(colorSpace), color1, color2)
}

// MARK: - Polar colorMix with hue interpolation

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: CSSColor, _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: CSSColor, _ color2: (CSSKeyword.Transparent, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: (CSSColor, Percentage), _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: (CSSColor, Percentage), _ color2: (CSSKeyword.Transparent, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: (CSSKeyword.Transparent, Percentage), _ color2: (CSSColor, Percentage)) -> CSSColor {
	colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: CSSColor, _ color2: CSSColor) -> CSSColor {
	colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func deviceCmyk(_ c: Double, _ m: Double, _ y: Double, _ k: Double) -> CSSColor {
	.deviceCmyk(CSSColor.DeviceCmyk(c, m, y, k))
}

public func deviceCmyk(_ c: Double, _ m: Double, _ y: Double, _ k: Double, _ alpha: Double) -> CSSColor {
	.deviceCmyk(CSSColor.DeviceCmyk(c, m, y, k, alpha))
}

public func contrastColor(_ color: CSSColor) -> CSSColor {
	.contrastColor(CSSColor.ContrastColor(color))
}

// MARK: - Implicit conversions for NamedColor and Keywords
extension CSSColor {
	public init(_ color: NamedColor) {
		self = .colorBase(.namedColor(color))
	}

	public init(_ keyword: CSSKeyword.CurrentColor) {
		self = .currentColor(keyword)
	}

	public init(_ keyword: CSSKeyword.Transparent) {
		self = .colorBase(.transparent(keyword))
	}
}

// MARK: - Static Properties
public extension CSSColor {
	static var currentColor: CSSColor { .currentColor(.currentColor) }
	static var red: CSSColor { .colorBase(.namedColor(.red)) }
	static var blue: CSSColor { .colorBase(.namedColor(.blue)) }
	static var green: CSSColor { .colorBase(.namedColor(.green)) }
	static var yellow: CSSColor { .colorBase(.namedColor(.yellow)) }
	static var orange: CSSColor { .colorBase(.namedColor(.orange)) }
	static var purple: CSSColor { .colorBase(.namedColor(.purple)) }
	static var pink: CSSColor { .colorBase(.namedColor(.pink)) }
	static var black: CSSColor { .colorBase(.namedColor(.black)) }
	static var white: CSSColor { .colorBase(.namedColor(.white)) }
	static var gray: CSSColor { .colorBase(.namedColor(.gray)) }
	static var aliceBlue: CSSColor { .colorBase(.namedColor(.aliceBlue)) }
	static var antiqueWhite: CSSColor { .colorBase(.namedColor(.antiqueWhite)) }
	static var aqua: CSSColor { .colorBase(.namedColor(.aqua)) }
	static var aquamarine: CSSColor { .colorBase(.namedColor(.aquamarine)) }
	static var azure: CSSColor { .colorBase(.namedColor(.azure)) }
	static var beige: CSSColor { .colorBase(.namedColor(.beige)) }
	static var bisque: CSSColor { .colorBase(.namedColor(.bisque)) }
	static var blanchedAlmond: CSSColor { .colorBase(.namedColor(.blanchedAlmond)) }
	static var blueViolet: CSSColor { .colorBase(.namedColor(.blueViolet)) }
	static var brown: CSSColor { .colorBase(.namedColor(.brown)) }
	static var burlyWood: CSSColor { .colorBase(.namedColor(.burlyWood)) }
	static var cadetBlue: CSSColor { .colorBase(.namedColor(.cadetBlue)) }
	static var chartreuse: CSSColor { .colorBase(.namedColor(.chartreuse)) }
	static var chocolate: CSSColor { .colorBase(.namedColor(.chocolate)) }
	static var coral: CSSColor { .colorBase(.namedColor(.coral)) }
	static var cornflowerBlue: CSSColor { .colorBase(.namedColor(.cornflowerBlue)) }
	static var cornsilk: CSSColor { .colorBase(.namedColor(.cornsilk)) }
	static var crimson: CSSColor { .colorBase(.namedColor(.crimson)) }
	static var cyan: CSSColor { .colorBase(.namedColor(.cyan)) }
	static var darkBlue: CSSColor { .colorBase(.namedColor(.darkBlue)) }
	static var darkCyan: CSSColor { .colorBase(.namedColor(.darkCyan)) }
	static var darkGoldenrod: CSSColor { .colorBase(.namedColor(.darkGoldenrod)) }
	static var darkGray: CSSColor { .colorBase(.namedColor(.darkGray)) }
	static var darkGreen: CSSColor { .colorBase(.namedColor(.darkGreen)) }
	static var darkKhaki: CSSColor { .colorBase(.namedColor(.darkKhaki)) }
	static var darkMagenta: CSSColor { .colorBase(.namedColor(.darkMagenta)) }
	static var darkOliveGreen: CSSColor { .colorBase(.namedColor(.darkOliveGreen)) }
	static var darkOrange: CSSColor { .colorBase(.namedColor(.darkOrange)) }
	static var darkOrchid: CSSColor { .colorBase(.namedColor(.darkOrchid)) }
	static var darkRed: CSSColor { .colorBase(.namedColor(.darkRed)) }
	static var darkSalmon: CSSColor { .colorBase(.namedColor(.darkSalmon)) }
	static var darkSeaGreen: CSSColor { .colorBase(.namedColor(.darkSeaGreen)) }
	static var darkSlateBlue: CSSColor { .colorBase(.namedColor(.darkSlateBlue)) }
	static var darkSlateGray: CSSColor { .colorBase(.namedColor(.darkSlateGray)) }
	static var darkTurquoise: CSSColor { .colorBase(.namedColor(.darkTurquoise)) }
	static var darkViolet: CSSColor { .colorBase(.namedColor(.darkViolet)) }
	static var deepPink: CSSColor { .colorBase(.namedColor(.deepPink)) }
	static var deepSkyBlue: CSSColor { .colorBase(.namedColor(.deepSkyBlue)) }
	static var dimGray: CSSColor { .colorBase(.namedColor(.dimGray)) }
	static var dodgerBlue: CSSColor { .colorBase(.namedColor(.dodgerBlue)) }
	static var firebrick: CSSColor { .colorBase(.namedColor(.firebrick)) }
	static var floralWhite: CSSColor { .colorBase(.namedColor(.floralWhite)) }
	static var forestGreen: CSSColor { .colorBase(.namedColor(.forestGreen)) }
	static var fuchsia: CSSColor { .colorBase(.namedColor(.fuchsia)) }
	static var gainsboro: CSSColor { .colorBase(.namedColor(.gainsboro)) }
	static var ghostWhite: CSSColor { .colorBase(.namedColor(.ghostWhite)) }
	static var gold: CSSColor { .colorBase(.namedColor(.gold)) }
	static var goldenrod: CSSColor { .colorBase(.namedColor(.goldenrod)) }
	static var greenYellow: CSSColor { .colorBase(.namedColor(.greenYellow)) }
	static var honeydew: CSSColor { .colorBase(.namedColor(.honeydew)) }
	static var hotPink: CSSColor { .colorBase(.namedColor(.hotPink)) }
	static var indianRed: CSSColor { .colorBase(.namedColor(.indianRed)) }
	static var indigo: CSSColor { .colorBase(.namedColor(.indigo)) }
	static var ivory: CSSColor { .colorBase(.namedColor(.ivory)) }
	static var khaki: CSSColor { .colorBase(.namedColor(.khaki)) }
	static var lavender: CSSColor { .colorBase(.namedColor(.lavender)) }
	static var lavenderBlush: CSSColor { .colorBase(.namedColor(.lavenderBlush)) }
	static var lawnGreen: CSSColor { .colorBase(.namedColor(.lawnGreen)) }
	static var lemonChiffon: CSSColor { .colorBase(.namedColor(.lemonChiffon)) }
	static var lightBlue: CSSColor { .colorBase(.namedColor(.lightBlue)) }
	static var lightCoral: CSSColor { .colorBase(.namedColor(.lightCoral)) }
	static var lightCyan: CSSColor { .colorBase(.namedColor(.lightCyan)) }
	static var lightGoldenrodYellow: CSSColor { .colorBase(.namedColor(.lightGoldenrodYellow)) }
	static var lightGray: CSSColor { .colorBase(.namedColor(.lightGray)) }
	static var lightGreen: CSSColor { .colorBase(.namedColor(.lightGreen)) }
	static var lightPink: CSSColor { .colorBase(.namedColor(.lightPink)) }
	static var lightSalmon: CSSColor { .colorBase(.namedColor(.lightSalmon)) }
	static var lightSeaGreen: CSSColor { .colorBase(.namedColor(.lightSeaGreen)) }
	static var lightSkyBlue: CSSColor { .colorBase(.namedColor(.lightSkyBlue)) }
	static var lightSlateGray: CSSColor { .colorBase(.namedColor(.lightSlateGray)) }
	static var lightSteelBlue: CSSColor { .colorBase(.namedColor(.lightSteelBlue)) }
	static var lightYellow: CSSColor { .colorBase(.namedColor(.lightYellow)) }
	static var lime: CSSColor { .colorBase(.namedColor(.lime)) }
	static var limeGreen: CSSColor { .colorBase(.namedColor(.limeGreen)) }
	static var linen: CSSColor { .colorBase(.namedColor(.linen)) }
	static var magenta: CSSColor { .colorBase(.namedColor(.magenta)) }
	static var maroon: CSSColor { .colorBase(.namedColor(.maroon)) }
	static var mediumAquamarine: CSSColor { .colorBase(.namedColor(.mediumAquamarine)) }
	static var mediumBlue: CSSColor { .colorBase(.namedColor(.mediumBlue)) }
	static var mediumOrchid: CSSColor { .colorBase(.namedColor(.mediumOrchid)) }
	static var mediumPurple: CSSColor { .colorBase(.namedColor(.mediumPurple)) }
	static var mediumSeaGreen: CSSColor { .colorBase(.namedColor(.mediumSeaGreen)) }
	static var mediumSlateBlue: CSSColor { .colorBase(.namedColor(.mediumSlateBlue)) }
	static var mediumSpringGreen: CSSColor { .colorBase(.namedColor(.mediumSpringGreen)) }
	static var mediumTurquoise: CSSColor { .colorBase(.namedColor(.mediumTurquoise)) }
	static var mediumVioletRed: CSSColor { .colorBase(.namedColor(.mediumVioletRed)) }
	static var midnightBlue: CSSColor { .colorBase(.namedColor(.midnightBlue)) }
	static var mintCream: CSSColor { .colorBase(.namedColor(.mintCream)) }
	static var mistyRose: CSSColor { .colorBase(.namedColor(.mistyRose)) }
	static var moccasin: CSSColor { .colorBase(.namedColor(.moccasin)) }
	static var navajoWhite: CSSColor { .colorBase(.namedColor(.navajoWhite)) }
	static var navy: CSSColor { .colorBase(.namedColor(.navy)) }
	static var oldLace: CSSColor { .colorBase(.namedColor(.oldLace)) }
	static var olive: CSSColor { .colorBase(.namedColor(.olive)) }
	static var oliveDrab: CSSColor { .colorBase(.namedColor(.oliveDrab)) }
	static var orchid: CSSColor { .colorBase(.namedColor(.orchid)) }
	static var paleGoldenrod: CSSColor { .colorBase(.namedColor(.paleGoldenrod)) }
	static var paleGreen: CSSColor { .colorBase(.namedColor(.paleGreen)) }
	static var paleTurquoise: CSSColor { .colorBase(.namedColor(.paleTurquoise)) }
	static var paleVioletRed: CSSColor { .colorBase(.namedColor(.paleVioletRed)) }
	static var papayaWhip: CSSColor { .colorBase(.namedColor(.papayaWhip)) }
	static var peachPuff: CSSColor { .colorBase(.namedColor(.peachPuff)) }
	static var peru: CSSColor { .colorBase(.namedColor(.peru)) }
	static var plum: CSSColor { .colorBase(.namedColor(.plum)) }
	static var powderBlue: CSSColor { .colorBase(.namedColor(.powderBlue)) }
	static var rebeccaPurple: CSSColor { .colorBase(.namedColor(.rebeccaPurple)) }
	static var rosyBrown: CSSColor { .colorBase(.namedColor(.rosyBrown)) }
	static var royalBlue: CSSColor { .colorBase(.namedColor(.royalBlue)) }
	static var saddleBrown: CSSColor { .colorBase(.namedColor(.saddleBrown)) }
	static var salmon: CSSColor { .colorBase(.namedColor(.salmon)) }
	static var sandyBrown: CSSColor { .colorBase(.namedColor(.sandyBrown)) }
	static var seaGreen: CSSColor { .colorBase(.namedColor(.seaGreen)) }
	static var seashell: CSSColor { .colorBase(.namedColor(.seashell)) }
	static var sienna: CSSColor { .colorBase(.namedColor(.sienna)) }
	static var silver: CSSColor { .colorBase(.namedColor(.silver)) }
	static var skyBlue: CSSColor { .colorBase(.namedColor(.skyBlue)) }
	static var slateBlue: CSSColor { .colorBase(.namedColor(.slateBlue)) }
	static var slateGray: CSSColor { .colorBase(.namedColor(.slateGray)) }
	static var snow: CSSColor { .colorBase(.namedColor(.snow)) }
	static var springGreen: CSSColor { .colorBase(.namedColor(.springGreen)) }
	static var steelBlue: CSSColor { .colorBase(.namedColor(.steelBlue)) }
	static var tan: CSSColor { .colorBase(.namedColor(.tan)) }
	static var teal: CSSColor { .colorBase(.namedColor(.teal)) }
	static var thistle: CSSColor { .colorBase(.namedColor(.thistle)) }
	static var tomato: CSSColor { .colorBase(.namedColor(.tomato)) }
	static var turquoise: CSSColor { .colorBase(.namedColor(.turquoise)) }
	static var violet: CSSColor { .colorBase(.namedColor(.violet)) }
	static var wheat: CSSColor { .colorBase(.namedColor(.wheat)) }
	static var whiteSmoke: CSSColor { .colorBase(.namedColor(.whiteSmoke)) }
	static var yellowGreen: CSSColor { .colorBase(.namedColor(.yellowGreen)) }
}
