import EmbeddedSwiftUtilities

extension CSS {
  public indirect enum Color: Sendable, CustomStringConvertible, CSSVariableConvertible {
    case colorBase(ColorBase)
    case currentColor(CSS.Keyword.CurrentColor)
    case systemColor(String)
    case contrastColor(ContrastColor)
    case deviceCmyk(DeviceCmyk)
    case lightDark(LightDark)

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

    public var description: String { value }

    public static func variable(_ name: String) -> CSS.Color {
      .systemColor("var(\(name))")
    }
  }
}

extension String.StringInterpolation {
  public mutating func appendInterpolation(_ color: CSS.Color) {
    appendLiteral(color.value)
  }
}

public func stringEquals(_ lhs: CSS.Color, _ rhs: CSS.Color) -> Bool {
  return stringEquals(lhs.value, rhs.value)
}

public func stringEquals(_ lhs: CSS.Color, _ rhs: String) -> Bool {
  return stringEquals(lhs.value, rhs)
}

public func stringEquals(_ lhs: String, _ rhs: CSS.Color) -> Bool {
  return stringEquals(lhs, rhs.value)
}

extension CSS.Color {
  public indirect enum ColorBase: Sendable {
    case hex(String)
    case colorFunction(ColorFunction)
    case namedColor(NamedColor)
    case colorMix(ColorMix)
    case transparent(CSS.Keyword.Transparent)

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

  public struct RGB: Sendable {
    private let components: String

    public init(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components = "rgb(\(r), \(g), \(b), \(doubleToString(alpha)))"
        } else {
          self.components = "rgb(\(r), \(g), \(b))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "rgb(\(intToString(r)), \(intToString(g)), \(intToString(b)), \(doubleToString(alpha)))"
        } else {
          self.components = "rgb(\(intToString(r)), \(intToString(g)), \(intToString(b)))"
        }
      #endif
    }

    public init(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "rgb(\(doubleToString(r)), \(doubleToString(g)), \(doubleToString(b)), \(doubleToString(alpha)))"
        } else {
          self.components = "rgb(\(doubleToString(r)), \(doubleToString(g)), \(doubleToString(b)))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "rgb(\(doubleToString(r)), \(doubleToString(g)), \(doubleToString(b)), \(doubleToString(alpha)))"
        } else {
          self.components = "rgb(\(doubleToString(r)), \(doubleToString(g)), \(doubleToString(b)))"
        }
      #endif
    }

    public init(_ r: CSS.Percentage, _ g: CSS.Percentage, _ b: CSS.Percentage, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components = "rgb(\(r.value), \(g.value), \(b.value), \(doubleToString(alpha)))"
        } else {
          self.components = "rgb(\(r.value), \(g.value), \(b.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components = "rgb(\(r.value), \(g.value), \(b.value), \(doubleToString(alpha)))"
        } else {
          self.components = "rgb(\(r.value), \(g.value), \(b.value))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct RGBA: Sendable {
    private let components: String

    public init(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double) {
      #if SERVER
        self.components = "rgba(\(r), \(g), \(b), \(doubleToString(alpha)))"
      #endif
      #if CLIENT
        self.components =
          "rgba(\(intToString(r)), \(intToString(g)), \(intToString(b)), \(doubleToString(alpha)))"
      #endif
    }

    public init(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double) {
      #if SERVER
        self.components =
          "rgba(\(doubleToString(r)), \(doubleToString(g)), \(doubleToString(b)), \(doubleToString(alpha)))"
      #endif
      #if CLIENT
        self.components =
          "rgba(\(doubleToString(r)), \(doubleToString(g)), \(doubleToString(b)), \(doubleToString(alpha)))"
      #endif
    }

    public init(_ r: CSS.Percentage, _ g: CSS.Percentage, _ b: CSS.Percentage, _ alpha: Double) {
      #if SERVER
        self.components = "rgba(\(r.value), \(g.value), \(b.value), \(doubleToString(alpha)))"
      #endif
      #if CLIENT
        self.components = "rgba(\(r.value), \(g.value), \(b.value), \(doubleToString(alpha)))"
      #endif
    }

    public var value: String {
      components
    }
  }

  // MARK: - HSL Functions

  public struct HSL: Sendable {
    private let components: String

    public init(_ h: Double, _ s: CSS.Percentage, _ l: CSS.Percentage, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "hsl(\(doubleToString(h)), \(s.value), \(l.value), \(doubleToString(alpha)))"
        } else {
          self.components = "hsl(\(doubleToString(h)), \(s.value), \(l.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "hsl(\(doubleToString(h)), \(s.value), \(l.value), \(doubleToString(alpha)))"
        } else {
          self.components = "hsl(\(doubleToString(h)), \(s.value), \(l.value))"
        }
      #endif
    }

    public init(_ h: CSS.Angle, _ s: CSS.Percentage, _ l: CSS.Percentage, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components = "hsl(\(h.value), \(s.value), \(l.value), \(doubleToString(alpha)))"
        } else {
          self.components = "hsl(\(h.value), \(s.value), \(l.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components = "hsl(\(h.value), \(s.value), \(l.value), \(doubleToString(alpha)))"
        } else {
          self.components = "hsl(\(h.value), \(s.value), \(l.value))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct HSLA: Sendable {
    private let components: String

    public init(_ h: Double, _ s: CSS.Percentage, _ l: CSS.Percentage, _ alpha: Double) {
      #if SERVER
        self.components =
          "hsla(\(doubleToString(h)), \(s.value), \(l.value), \(doubleToString(alpha)))"
      #endif
      #if CLIENT
        self.components =
          "hsla(\(doubleToString(h)), \(s.value), \(l.value), \(doubleToString(alpha)))"
      #endif
    }

    public init(_ h: CSS.Angle, _ s: CSS.Percentage, _ l: CSS.Percentage, _ alpha: Double) {
      #if SERVER
        self.components = "hsla(\(h.value), \(s.value), \(l.value), \(doubleToString(alpha)))"
      #endif
      #if CLIENT
        self.components = "hsla(\(h.value), \(s.value), \(l.value), \(doubleToString(alpha)))"
      #endif
    }

    public var value: String {
      components
    }
  }

  // MARK: - Modern Color Spaces

  public struct HWB: Sendable {
    private let components: String

    public init(_ h: Double, _ w: CSS.Percentage, _ b: CSS.Percentage, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "hwb(\(doubleToString(h)) \(w.value) \(b.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "hwb(\(doubleToString(h)) \(w.value) \(b.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "hwb(\(doubleToString(h)) \(w.value) \(b.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "hwb(\(doubleToString(h)) \(w.value) \(b.value))"
        }
      #endif
    }

    public init(_ h: CSS.Angle, _ w: CSS.Percentage, _ b: CSS.Percentage, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components = "hwb(\(h.value) \(w.value) \(b.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "hwb(\(h.value) \(w.value) \(b.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components = "hwb(\(h.value) \(w.value) \(b.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "hwb(\(h.value) \(w.value) \(b.value))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct LAB: Sendable {
    private let components: String

    public init(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "lab(\(doubleToString(l)) \(doubleToString(a)) \(doubleToString(b)) / \(doubleToString(alpha)))"
        } else {
          self.components = "lab(\(doubleToString(l)) \(doubleToString(a)) \(doubleToString(b)))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "lab(\(doubleToString(l)) \(doubleToString(a)) \(doubleToString(b)) / \(doubleToString(alpha)))"
        } else {
          self.components = "lab(\(doubleToString(l)) \(doubleToString(a)) \(doubleToString(b)))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct LCH: Sendable {
    private let components: String

    public init(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "lch(\(doubleToString(l)) \(doubleToString(c)) \(doubleToString(h)) / \(doubleToString(alpha)))"
        } else {
          self.components = "lch(\(doubleToString(l)) \(doubleToString(c)) \(doubleToString(h)))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "lch(\(doubleToString(l)) \(doubleToString(c)) \(doubleToString(h)) / \(doubleToString(alpha)))"
        } else {
          self.components = "lch(\(doubleToString(l)) \(doubleToString(c)) \(doubleToString(h)))"
        }
      #endif
    }

    public init(_ l: Double, _ c: Double, _ h: CSS.Angle, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "lch(\(doubleToString(l)) \(doubleToString(c)) \(h.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "lch(\(doubleToString(l)) \(doubleToString(c)) \(h.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "lch(\(doubleToString(l)) \(doubleToString(c)) \(h.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "lch(\(doubleToString(l)) \(doubleToString(c)) \(h.value))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct OKLAB: Sendable {
    private let components: String

    public init(
      from color: CSS.Color, _ l: CSS.OKLABComponent, _ a: CSS.OKLABComponent, _ b: CSS.OKLABComponent
    ) {
      self.components = "oklab(from \(color.value) \(l.rawValue) \(a.rawValue) \(b.rawValue) / alpha)"
    }

    #if SERVER
      public init(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double? = nil) {
        if let alpha = alpha {
          self.components =
            "oklab(\(doubleToString(l)) \(doubleToString(a)) \(doubleToString(b)) / \(doubleToString(alpha)))"
        } else {
          self.components = "oklab(\(doubleToString(l)) \(doubleToString(a)) \(doubleToString(b)))"
        }
      }
    #endif
    #if CLIENT
      public init(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double? = nil) {
        if let alpha = alpha {
          self.components =
            "oklab(\(doubleToString(l)) \(doubleToString(a)) \(doubleToString(b)) / \(doubleToString(alpha)))"
        } else {
          self.components = "oklab(\(doubleToString(l)) \(doubleToString(a)) \(doubleToString(b)))"
        }
      }
    #endif

    public var value: String {
      components
    }
  }

  public struct OKLCH: Sendable {
    private let components: String

    public init(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "oklch(\(doubleToString(l)) \(doubleToString(c)) \(doubleToString(h)) / \(doubleToString(alpha)))"
        } else {
          self.components = "oklch(\(doubleToString(l)) \(doubleToString(c)) \(doubleToString(h)))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "oklch(\(doubleToString(l)) \(doubleToString(c)) \(doubleToString(h)) / \(doubleToString(alpha)))"
        } else {
          self.components = "oklch(\(doubleToString(l)) \(doubleToString(c)) \(doubleToString(h)))"
        }
      #endif
    }

    public init(_ l: Double, _ c: Double, _ h: CSS.Angle, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "oklch(\(doubleToString(l)) \(doubleToString(c)) \(h.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "oklch(\(doubleToString(l)) \(doubleToString(c)) \(h.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "oklch(\(doubleToString(l)) \(doubleToString(c)) \(h.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "oklch(\(doubleToString(l)) \(doubleToString(c)) \(h.value))"
        }
      #endif
    }

    public init(l: String, c: String, h: String) {
      self.components = "oklch(\(l) \(c) \(h))"
    }

    public init(from origin: CSS.Color, l: CSS.Value, c: CSS.Value, h: CSS.Value) {
      self.components = "oklch(from \(origin.value) \(l.value) \(c.value) \(h.value) / alpha)"
    }

    public var value: String {
      components
    }
  }

  public struct ICTCP: Sendable {
    private let components: String

    public init(_ i: Double, _ ct: Double, _ cp: Double, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "ictcp(\(doubleToString(i)) \(doubleToString(ct)) \(doubleToString(cp)) / \(doubleToString(alpha)))"
        } else {
          self.components =
            "ictcp(\(doubleToString(i)) \(doubleToString(ct)) \(doubleToString(cp)))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "ictcp(\(doubleToString(i)) \(doubleToString(ct)) \(doubleToString(cp)) / \(doubleToString(alpha)))"
        } else {
          self.components =
            "ictcp(\(doubleToString(i)) \(doubleToString(ct)) \(doubleToString(cp)))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct JZAZBZ: Sendable {
    private let components: String

    public init(_ jz: Double, _ az: Double, _ bz: Double, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "jzazbz(\(doubleToString(jz)) \(doubleToString(az)) \(doubleToString(bz)) / \(doubleToString(alpha)))"
        } else {
          self.components =
            "jzazbz(\(doubleToString(jz)) \(doubleToString(az)) \(doubleToString(bz)))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "jzazbz(\(doubleToString(jz)) \(doubleToString(az)) \(doubleToString(bz)) / \(doubleToString(alpha)))"
        } else {
          self.components =
            "jzazbz(\(doubleToString(jz)) \(doubleToString(az)) \(doubleToString(bz)))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct JZCZHZ: Sendable {
    private let components: String

    public init(_ jz: Double, _ cz: Double, _ hz: Double, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "jzczhz(\(doubleToString(jz)) \(doubleToString(cz)) \(doubleToString(hz)) / \(doubleToString(alpha)))"
        } else {
          self.components =
            "jzczhz(\(doubleToString(jz)) \(doubleToString(cz)) \(doubleToString(hz)))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "jzczhz(\(doubleToString(jz)) \(doubleToString(cz)) \(doubleToString(hz)) / \(doubleToString(alpha)))"
        } else {
          self.components =
            "jzczhz(\(doubleToString(jz)) \(doubleToString(cz)) \(doubleToString(hz)))"
        }
      #endif
    }

    public init(_ jz: Double, _ cz: Double, _ hz: CSS.Angle, _ alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "jzczhz(\(doubleToString(jz)) \(doubleToString(cz)) \(hz.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "jzczhz(\(doubleToString(jz)) \(doubleToString(cz)) \(hz.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "jzczhz(\(doubleToString(jz)) \(doubleToString(cz)) \(hz.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "jzczhz(\(doubleToString(jz)) \(doubleToString(cz)) \(hz.value))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct Alpha: Sendable {
    private let components: String

    public init(from color: CSS.Color, alpha: Double? = nil) {
      #if SERVER
        if let alpha = alpha {
          self.components = "alpha(from \(color.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "alpha(from \(color.value))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components = "alpha(from \(color.value) / \(doubleToString(alpha)))"
        } else {
          self.components = "alpha(from \(color.value))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  public struct Color: Sendable {
    private let components: String

    public init(
      _ colorSpace: String, _ c1: Double, _ c2: Double, _ c3: Double, _ alpha: Double? = nil
    ) {
      #if SERVER
        if let alpha = alpha {
          self.components =
            "color(\(colorSpace) \(doubleToString(c1)) \(doubleToString(c2)) \(doubleToString(c3)) / \(doubleToString(alpha)))"
        } else {
          self.components =
            "color(\(colorSpace) \(doubleToString(c1)) \(doubleToString(c2)) \(doubleToString(c3)))"
        }
      #endif
      #if CLIENT
        if let alpha = alpha {
          self.components =
            "color(\(colorSpace) \(doubleToString(c1)) \(doubleToString(c2)) \(doubleToString(c3)) / \(doubleToString(alpha)))"
        } else {
          self.components =
            "color(\(colorSpace) \(doubleToString(c1)) \(doubleToString(c2)) \(doubleToString(c3)))"
        }
      #endif
    }

    public var value: String {
      components
    }
  }

  // MARK: - Utility Functions

  public struct LightDark: Sendable {
    public let light: CSS.Color
    public let dark: CSS.Color

    public init(_ light: CSS.Color, _ dark: CSS.Color) {
      self.light = light
      self.dark = dark
    }

    public var value: String {
      "light-dark(\(light.value), \(dark.value))"
    }
  }

  public struct ColorMix: Sendable {
    public let interpolationMethod: String?
    public let color1: CSS.Color
    public let percentage1: CSS.Percentage?
    public let color2: CSS.Color
    public let percentage2: CSS.Percentage?

    public init(
      in interpolationMethod: String? = nil,
      _ color1: CSS.Color,
      _ percentage1: CSS.Percentage? = nil,
      _ color2: CSS.Color,
      _ percentage2: CSS.Percentage? = nil
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
        color1Str = "\(color1Str) \(pct1.value)"
      }
      components.append(color1Str)

      var color2Str = color2.value
      if let pct2 = percentage2 {
        color2Str = "\(color2Str) \(pct2.value)"
      }
      components.append(color2Str)

      var result = "color-mix("
      for (index, component) in components.enumerated() {
        if index > 0 {
          result = "\(result), \(component)"
        } else {
          result = "\(result)\(component)"
        }
      }
      return "\(result))"
    }
  }

  public struct DeviceCmyk: Sendable {
    private let components: String

    public init(_ c: Double, _ m: Double, _ y: Double, _ k: Double) {
      self.components =
        "device-cmyk(\(doubleToString(c)), \(doubleToString(m)), \(doubleToString(y)), \(doubleToString(k)))"
    }

    public init(_ c: Double, _ m: Double, _ y: Double, _ k: Double, _ alpha: Double) {
      self.components =
        "device-cmyk(\(doubleToString(c)) \(doubleToString(m)) \(doubleToString(y)) \(doubleToString(k)) / \(doubleToString(alpha)))"
    }

    public var value: String {
      components
    }
  }

  public struct ContrastColor: Sendable {
    public let color: CSS.Color?
    private let rawValue: String?

    internal init(_ value: String) {
      self.color = nil
      self.rawValue = value
    }

    public static func variable(_ name: String) -> CSS.Color {
      CSS.Color.contrastColor(ContrastColor("var(\(name))"))
    }

    public init(_ color: CSS.Color) {
      self.color = color
      self.rawValue = nil
    }

    public var value: String {
      if let rawValue = rawValue { return rawValue }
      if let color = color {
        return "contrast-color(\(color.value))"
      }
      return ""
    }
  }
}

// MARK: - Convenience Helper Functions

// MARK: - Hex Colors

public func hex(_ value: Int) -> CSS.Color {
  let hexString = int64ToString(Int64(value), radix: 16, uppercase: true)
  let paddingCount = max(0, 6 - hexString.utf8.count)
  let paddedHex = "\(stringRepeating("0", count: paddingCount))\(hexString)"
  return .colorBase(.hex("#\(paddedHex)"))
}

// MARK: - RGB/RGBA

public func rgb(_ r: Int, _ g: Int, _ b: Int) -> CSS.Color {
  .colorBase(.colorFunction(.rgb(CSS.Color.RGB(r, g, b))))
}

public func rgb(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.rgb(CSS.Color.RGB(r, g, b, alpha))))
}

public func rgb(_ r: CSS.Percentage, _ g: CSS.Percentage, _ b: CSS.Percentage) -> CSS.Color {
  .colorBase(.colorFunction(.rgb(CSS.Color.RGB(r, g, b))))
}

public func rgb(_ r: CSS.Percentage, _ g: CSS.Percentage, _ b: CSS.Percentage, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.rgb(CSS.Color.RGB(r, g, b, alpha))))
}

public func rgb(_ r: Double, _ g: Double, _ b: Double) -> CSS.Color {
  .colorBase(.colorFunction(.rgb(CSS.Color.RGB(r, g, b))))
}

public func rgb(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.rgb(CSS.Color.RGB(r, g, b, alpha))))
}

public func rgba(_ r: Int, _ g: Int, _ b: Int, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.rgba(CSS.Color.RGBA(r, g, b, alpha))))
}

public func rgba(_ components: (Int, Int, Int), _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.rgba(CSS.Color.RGBA(components.0, components.1, components.2, alpha))))
}

public func rgba(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.rgba(CSS.Color.RGBA(r, g, b, alpha))))
}

public func rgba(_ r: CSS.Percentage, _ g: CSS.Percentage, _ b: CSS.Percentage, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.rgba(CSS.Color.RGBA(r, g, b, alpha))))
}

// MARK: - HSL/HSLA

public func hsl(_ h: Double, _ s: CSS.Percentage, _ l: CSS.Percentage) -> CSS.Color {
  .colorBase(.colorFunction(.hsl(CSS.Color.HSL(h, s, l))))
}

public func hsl(_ h: Double, _ s: CSS.Percentage, _ l: CSS.Percentage, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.hsl(CSS.Color.HSL(h, s, l, alpha))))
}

public func hsl(_ h: CSS.Angle, _ s: CSS.Percentage, _ l: CSS.Percentage) -> CSS.Color {
  .colorBase(.colorFunction(.hsl(CSS.Color.HSL(h, s, l))))
}

public func hsl(_ h: CSS.Angle, _ s: CSS.Percentage, _ l: CSS.Percentage, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.hsl(CSS.Color.HSL(h, s, l, alpha))))
}

public func hsla(_ h: Double, _ s: CSS.Percentage, _ l: CSS.Percentage, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.hsla(CSS.Color.HSLA(h, s, l, alpha))))
}

public func hsla(_ h: CSS.Angle, _ s: CSS.Percentage, _ l: CSS.Percentage, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.hsla(CSS.Color.HSLA(h, s, l, alpha))))
}

// MARK: - HWB

public func hwb(_ h: Double, _ w: CSS.Percentage, _ b: CSS.Percentage) -> CSS.Color {
  .colorBase(.colorFunction(.hwb(CSS.Color.HWB(h, w, b))))
}

public func hwb(_ h: Double, _ w: CSS.Percentage, _ b: CSS.Percentage, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.hwb(CSS.Color.HWB(h, w, b, alpha))))
}

public func hwb(_ h: CSS.Angle, _ w: CSS.Percentage, _ b: CSS.Percentage) -> CSS.Color {
  .colorBase(.colorFunction(.hwb(CSS.Color.HWB(h, w, b))))
}

public func hwb(_ h: CSS.Angle, _ w: CSS.Percentage, _ b: CSS.Percentage, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.hwb(CSS.Color.HWB(h, w, b, alpha))))
}

// MARK: - LAB

public func lab(_ l: Double, _ a: Double, _ b: Double) -> CSS.Color {
  .colorBase(.colorFunction(.lab(CSS.Color.LAB(l, a, b))))
}

public func lab(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.lab(CSS.Color.LAB(l, a, b, alpha))))
}

// MARK: - LCH

public func lch(_ l: Double, _ c: Double, _ h: Double) -> CSS.Color {
  .colorBase(.colorFunction(.lch(CSS.Color.LCH(l, c, h))))
}

public func lch(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.lch(CSS.Color.LCH(l, c, h, alpha))))
}

public func lch(_ l: Double, _ c: Double, _ h: CSS.Angle) -> CSS.Color {
  .colorBase(.colorFunction(.lch(CSS.Color.LCH(l, c, h))))
}

public func lch(_ l: Double, _ c: Double, _ h: CSS.Angle, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.lch(CSS.Color.LCH(l, c, h, alpha))))
}

// MARK: - Oklab

public func oklab(_ l: Double, _ a: Double, _ b: Double) -> CSS.Color {
  .colorBase(.colorFunction(.oklab(CSS.Color.OKLAB(l, a, b))))
}

public func oklab(_ l: Double, _ a: Double, _ b: Double, _ alpha: Double) -> CSS.Color {
  return .colorBase(.colorFunction(.oklab(CSS.Color.OKLAB(l, a, b, alpha))))
}

public func oklab(
  from color: CSS.Color, _ l: CSS.OKLABComponent, _ a: CSS.OKLABComponent, _ b: CSS.OKLABComponent
) -> CSS.Color {
  return .colorBase(.colorFunction(.oklab(CSS.Color.OKLAB(from: color, l, a, b))))
}

// MARK: - Oklch

public func oklch(_ l: Double, _ c: Double, _ h: Double) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l, c, h))))
}

public func oklch(l: String, c: String, h: String) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l: l, c: c, h: h))))
}

public func oklch(l: Double, c: Double, h: Double) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l, c, h))))
}

public func oklch(l: Double, c: Double, h: String) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l: "\(l)", c: "\(c)", h: h))))
}

public func oklch(l: CSS.Value, c: CSS.Value, h: CSS.Value) -> CSS.Color {
  oklch(l: l.value, c: c.value, h: h.value)
}

public func oklch(l: CSS.Value, c: Double, h: CSS.Value) -> CSS.Color {
  oklch(l: l.value, c: "\(c)", h: h.value)
}

public func oklch(l: Double, c: Double, h: CSS.Value) -> CSS.Color {
  oklch(l: "\(l)", c: "\(c)", h: h.value)
}

public func oklch(l: String, c: String, h: CSS.Value) -> CSS.Color {
  oklch(l: l, c: c, h: h.value)
}

public func oklch(l: Double, c: CSS.Value, h: CSS.Value) -> CSS.Color {
  oklch(l: CSS.Value(l), c: c, h: h)
}

public func oklch(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l, c, h, alpha))))
}

public func oklch(l: Double, c: Double, h: CSS.Angle) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l, c, h))))
}

public func oklch(l: Double, c: Double, h: CSS.Angle, alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l, c, h, alpha))))
}

public func oklch(_ l: Double, _ c: Double, _ h: CSS.Angle) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l, c, h))))
}

public func oklch(_ l: Double, _ c: Double, _ h: CSS.Angle, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(l, c, h, alpha))))
}

public func oklch(from origin: CSS.Color, l: CSS.Value, c: CSS.Value, h: CSS.Value) -> CSS.Color {
  .colorBase(.colorFunction(.oklch(CSS.Color.OKLCH(from: origin, l: l, c: c, h: h))))
}

// MARK: - ICTCP

public func ictcp(_ i: Double, _ ct: Double, _ cp: Double) -> CSS.Color {
  .colorBase(.colorFunction(.ictcp(CSS.Color.ICTCP(i, ct, cp))))
}

public func ictcp(_ i: Double, _ ct: Double, _ cp: Double, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.ictcp(CSS.Color.ICTCP(i, ct, cp, alpha))))
}

// MARK: - Jzazbz

public func jzazbz(_ jz: Double, _ az: Double, _ bz: Double) -> CSS.Color {
  .colorBase(.colorFunction(.jzazbz(CSS.Color.JZAZBZ(jz, az, bz))))
}

public func jzazbz(_ jz: Double, _ az: Double, _ bz: Double, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.jzazbz(CSS.Color.JZAZBZ(jz, az, bz, alpha))))
}

// MARK: - Jzczhz

public func jzczhz(_ jz: Double, _ cz: Double, _ hz: Double) -> CSS.Color {
  .colorBase(.colorFunction(.jzczhz(CSS.Color.JZCZHZ(jz, cz, hz))))
}

public func jzczhz(_ jz: Double, _ cz: Double, _ hz: Double, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.jzczhz(CSS.Color.JZCZHZ(jz, cz, hz, alpha))))
}

public func jzczhz(_ jz: Double, _ cz: Double, _ hz: CSS.Angle) -> CSS.Color {
  .colorBase(.colorFunction(.jzczhz(CSS.Color.JZCZHZ(jz, cz, hz))))
}

public func jzczhz(_ jz: Double, _ cz: Double, _ hz: CSS.Angle, _ alpha: Double) -> CSS.Color {
  .colorBase(.colorFunction(.jzczhz(CSS.Color.JZCZHZ(jz, cz, hz, alpha))))
}

// MARK: - Color function

public func color(_ colorSpace: String, _ c1: Double, _ c2: Double, _ c3: Double) -> CSS.Color {
  .colorBase(.colorFunction(.color(CSS.Color.Color(colorSpace, c1, c2, c3))))
}

public func color(_ colorSpace: String, _ c1: Double, _ c2: Double, _ c3: Double, _ alpha: Double)
  -> CSS.Color
{
  .colorBase(.colorFunction(.color(CSS.Color.Color(colorSpace, c1, c2, c3, alpha))))
}

// MARK: - Utility functions

public func lightDark(_ light: CSS.Color, _ dark: CSS.Color) -> CSS.Color {
  .lightDark(CSS.Color.LightDark(light, dark))
}

public func colorMix(
  in interpolationMethod: CSS.ColorInterpolationMethod, _ color1: CSS.Color,
  _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  .colorBase(
    .colorMix(CSS.Color.ColorMix(in: interpolationMethod.value, color1, nil, color2.0, color2.1)))
}

public func colorMix(
  in interpolationMethod: CSS.ColorInterpolationMethod, _ color1: CSS.Color,
  _ color2: (CSS.Keyword.Transparent, CSS.Percentage)
) -> CSS.Color {
  .colorBase(
    .colorMix(
      CSS.Color.ColorMix(in: interpolationMethod.value, color1, nil, CSS.Color(color2.0), color2.1)))
}

public func colorMix(
  in interpolationMethod: CSS.ColorInterpolationMethod, _ color1: (CSS.Color, CSS.Percentage),
  _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  .colorBase(
    .colorMix(
      CSS.Color.ColorMix(in: interpolationMethod.value, color1.0, color1.1, color2.0, color2.1)))
}

public func colorMix(
  in interpolationMethod: CSS.ColorInterpolationMethod, _ color1: (CSS.Color, CSS.Percentage),
  _ color2: (CSS.Keyword.Transparent, CSS.Percentage)
) -> CSS.Color {
  .colorBase(
    .colorMix(
      CSS.Color.ColorMix(
        in: interpolationMethod.value, color1.0, color1.1, CSS.Color(color2.0), color2.1)))
}

public func colorMix(
  in interpolationMethod: CSS.ColorInterpolationMethod,
  _ color1: (CSS.Keyword.Transparent, CSS.Percentage), _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  .colorBase(
    .colorMix(
      CSS.Color.ColorMix(
        in: interpolationMethod.value, CSS.Color(color1.0), color1.1, color2.0, color2.1)))
}

public func colorMix(
  in interpolationMethod: CSS.ColorInterpolationMethod, _ color1: CSS.Color, _ color2: CSS.Color
) -> CSS.Color {
  .colorBase(.colorMix(CSS.Color.ColorMix(in: interpolationMethod.value, color1, nil, color2, nil)))
}

// MARK: - Rectangular colorMix overloads

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.RectangularColorSpace, _ color1: CSS.Color,
  _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.RectangularColorSpace, _ color1: CSS.Color,
  _ color2: (CSS.Keyword.Transparent, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.RectangularColorSpace,
  _ color1: (CSS.Color, CSS.Percentage), _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.RectangularColorSpace,
  _ color1: (CSS.Color, CSS.Percentage), _ color2: (CSS.Keyword.Transparent, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.RectangularColorSpace,
  _ color1: (CSS.Keyword.Transparent, CSS.Percentage), _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.RectangularColorSpace, _ color1: CSS.Color,
  _ color2: CSS.Color
) -> CSS.Color {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

// MARK: - Polar colorMix overloads

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace, _ color1: CSS.Color,
  _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace, _ color1: CSS.Color,
  _ color2: (CSS.Keyword.Transparent, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace, _ color1: (CSS.Color, CSS.Percentage),
  _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace, _ color1: (CSS.Color, CSS.Percentage),
  _ color2: (CSS.Keyword.Transparent, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace,
  _ color1: (CSS.Keyword.Transparent, CSS.Percentage), _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace, _ color1: CSS.Color, _ color2: CSS.Color
) -> CSS.Color {
  colorMix(in: .polar(colorSpace), color1, color2)
}

// MARK: - Polar colorMix with hue interpolation

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace,
  hue: CSS.ColorInterpolationMethod.HueInterpolationMethod, _ color1: CSS.Color,
  _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace,
  hue: CSS.ColorInterpolationMethod.HueInterpolationMethod, _ color1: CSS.Color,
  _ color2: (CSS.Keyword.Transparent, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace,
  hue: CSS.ColorInterpolationMethod.HueInterpolationMethod, _ color1: (CSS.Color, CSS.Percentage),
  _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace,
  hue: CSS.ColorInterpolationMethod.HueInterpolationMethod, _ color1: (CSS.Color, CSS.Percentage),
  _ color2: (CSS.Keyword.Transparent, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace,
  hue: CSS.ColorInterpolationMethod.HueInterpolationMethod,
  _ color1: (CSS.Keyword.Transparent, CSS.Percentage), _ color2: (CSS.Color, CSS.Percentage)
) -> CSS.Color {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSS.ColorInterpolationMethod.PolarColorSpace,
  hue: CSS.ColorInterpolationMethod.HueInterpolationMethod, _ color1: CSS.Color, _ color2: CSS.Color
) -> CSS.Color {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func deviceCmyk(_ c: Double, _ m: Double, _ y: Double, _ k: Double) -> CSS.Color {
  .deviceCmyk(CSS.Color.DeviceCmyk(c, m, y, k))
}

public func deviceCmyk(_ c: Double, _ m: Double, _ y: Double, _ k: Double, _ alpha: Double)
  -> CSS.Color
{
  .deviceCmyk(CSS.Color.DeviceCmyk(c, m, y, k, alpha))
}

public func contrastColor(_ color: CSS.Color) -> CSS.Color {
  .contrastColor(CSS.Color.ContrastColor(color))
}

// MARK: - Implicit conversions for NamedColor and Keywords

extension CSS.Color {
  public init(_ color: NamedColor) {
    self = .colorBase(.namedColor(color))
  }

  public init(_ keyword: CSS.Keyword.CurrentColor) {
    self = .currentColor(keyword)
  }

  public init(_ keyword: CSS.Keyword.Transparent) {
    self = .colorBase(.transparent(keyword))
  }
}

// MARK: - Static Properties

extension CSS.Color {
  public static var transparent: CSS.Keyword.Transparent { .transparent }
  public static var currentColor: CSS.Color { .currentColor(.currentColor) }
  public static var red: CSS.Color { .colorBase(.namedColor(.red)) }
  public static var blue: CSS.Color { .colorBase(.namedColor(.blue)) }
  public static var green: CSS.Color { .colorBase(.namedColor(.green)) }
  public static var yellow: CSS.Color { .colorBase(.namedColor(.yellow)) }
  public static var orange: CSS.Color { .colorBase(.namedColor(.orange)) }
  public static var purple: CSS.Color { .colorBase(.namedColor(.purple)) }
  public static var pink: CSS.Color { .colorBase(.namedColor(.pink)) }
  public static var black: CSS.Color { .colorBase(.namedColor(.black)) }
  public static var white: CSS.Color { .colorBase(.namedColor(.white)) }
  public static var gray: CSS.Color { .colorBase(.namedColor(.gray)) }
  public static var aliceBlue: CSS.Color { .colorBase(.namedColor(.aliceBlue)) }
  public static var antiqueWhite: CSS.Color { .colorBase(.namedColor(.antiqueWhite)) }
  public static var aqua: CSS.Color { .colorBase(.namedColor(.aqua)) }
  public static var aquamarine: CSS.Color { .colorBase(.namedColor(.aquamarine)) }
  public static var azure: CSS.Color { .colorBase(.namedColor(.azure)) }
  public static var beige: CSS.Color { .colorBase(.namedColor(.beige)) }
  public static var bisque: CSS.Color { .colorBase(.namedColor(.bisque)) }
  public static var blanchedAlmond: CSS.Color { .colorBase(.namedColor(.blanchedAlmond)) }
  public static var blueViolet: CSS.Color { .colorBase(.namedColor(.blueViolet)) }
  public static var brown: CSS.Color { .colorBase(.namedColor(.brown)) }
  public static var burlyWood: CSS.Color { .colorBase(.namedColor(.burlyWood)) }
  public static var cadetBlue: CSS.Color { .colorBase(.namedColor(.cadetBlue)) }
  public static var chartreuse: CSS.Color { .colorBase(.namedColor(.chartreuse)) }
  public static var chocolate: CSS.Color { .colorBase(.namedColor(.chocolate)) }
  public static var coral: CSS.Color { .colorBase(.namedColor(.coral)) }
  public static var cornflowerBlue: CSS.Color { .colorBase(.namedColor(.cornflowerBlue)) }
  public static var cornsilk: CSS.Color { .colorBase(.namedColor(.cornsilk)) }
  public static var crimson: CSS.Color { .colorBase(.namedColor(.crimson)) }
  public static var cyan: CSS.Color { .colorBase(.namedColor(.cyan)) }
  public static var darkBlue: CSS.Color { .colorBase(.namedColor(.darkBlue)) }
  public static var darkCyan: CSS.Color { .colorBase(.namedColor(.darkCyan)) }
  public static var darkGoldenrod: CSS.Color { .colorBase(.namedColor(.darkGoldenrod)) }
  public static var darkGray: CSS.Color { .colorBase(.namedColor(.darkGray)) }
  public static var darkGreen: CSS.Color { .colorBase(.namedColor(.darkGreen)) }
  public static var darkKhaki: CSS.Color { .colorBase(.namedColor(.darkKhaki)) }
  public static var darkMagenta: CSS.Color { .colorBase(.namedColor(.darkMagenta)) }
  public static var darkOliveGreen: CSS.Color { .colorBase(.namedColor(.darkOliveGreen)) }
  public static var darkOrange: CSS.Color { .colorBase(.namedColor(.darkOrange)) }
  public static var darkOrchid: CSS.Color { .colorBase(.namedColor(.darkOrchid)) }
  public static var darkRed: CSS.Color { .colorBase(.namedColor(.darkRed)) }
  public static var darkSalmon: CSS.Color { .colorBase(.namedColor(.darkSalmon)) }
  public static var darkSeaGreen: CSS.Color { .colorBase(.namedColor(.darkSeaGreen)) }
  public static var darkSlateBlue: CSS.Color { .colorBase(.namedColor(.darkSlateBlue)) }
  public static var darkSlateGray: CSS.Color { .colorBase(.namedColor(.darkSlateGray)) }
  public static var darkTurquoise: CSS.Color { .colorBase(.namedColor(.darkTurquoise)) }
  public static var darkViolet: CSS.Color { .colorBase(.namedColor(.darkViolet)) }
  public static var deepPink: CSS.Color { .colorBase(.namedColor(.deepPink)) }
  public static var deepSkyBlue: CSS.Color { .colorBase(.namedColor(.deepSkyBlue)) }
  public static var dimGray: CSS.Color { .colorBase(.namedColor(.dimGray)) }
  public static var dodgerBlue: CSS.Color { .colorBase(.namedColor(.dodgerBlue)) }
  public static var firebrick: CSS.Color { .colorBase(.namedColor(.firebrick)) }
  public static var floralWhite: CSS.Color { .colorBase(.namedColor(.floralWhite)) }
  public static var forestGreen: CSS.Color { .colorBase(.namedColor(.forestGreen)) }
  public static var fuchsia: CSS.Color { .colorBase(.namedColor(.fuchsia)) }
  public static var gainsboro: CSS.Color { .colorBase(.namedColor(.gainsboro)) }
  public static var ghostWhite: CSS.Color { .colorBase(.namedColor(.ghostWhite)) }
  public static var gold: CSS.Color { .colorBase(.namedColor(.gold)) }
  public static var goldenrod: CSS.Color { .colorBase(.namedColor(.goldenrod)) }
  public static var greenYellow: CSS.Color { .colorBase(.namedColor(.greenYellow)) }
  public static var honeydew: CSS.Color { .colorBase(.namedColor(.honeydew)) }
  public static var hotPink: CSS.Color { .colorBase(.namedColor(.hotPink)) }
  public static var indianRed: CSS.Color { .colorBase(.namedColor(.indianRed)) }
  public static var indigo: CSS.Color { .colorBase(.namedColor(.indigo)) }
  public static var ivory: CSS.Color { .colorBase(.namedColor(.ivory)) }
  public static var khaki: CSS.Color { .colorBase(.namedColor(.khaki)) }
  public static var lavender: CSS.Color { .colorBase(.namedColor(.lavender)) }
  public static var lavenderBlush: CSS.Color { .colorBase(.namedColor(.lavenderBlush)) }
  public static var lawnGreen: CSS.Color { .colorBase(.namedColor(.lawnGreen)) }
  public static var lemonChiffon: CSS.Color { .colorBase(.namedColor(.lemonChiffon)) }
  public static var lightBlue: CSS.Color { .colorBase(.namedColor(.lightBlue)) }
  public static var lightCoral: CSS.Color { .colorBase(.namedColor(.lightCoral)) }
  public static var lightCyan: CSS.Color { .colorBase(.namedColor(.lightCyan)) }
  public static var lightGoldenrodYellow: CSS.Color {
    .colorBase(.namedColor(.lightGoldenrodYellow))
  }
  public static var lightGray: CSS.Color { .colorBase(.namedColor(.lightGray)) }
  public static var lightGreen: CSS.Color { .colorBase(.namedColor(.lightGreen)) }
  public static var lightPink: CSS.Color { .colorBase(.namedColor(.lightPink)) }
  public static var lightSalmon: CSS.Color { .colorBase(.namedColor(.lightSalmon)) }
  public static var lightSeaGreen: CSS.Color { .colorBase(.namedColor(.lightSeaGreen)) }
  public static var lightSkyBlue: CSS.Color { .colorBase(.namedColor(.lightSkyBlue)) }
  public static var lightSlateGray: CSS.Color { .colorBase(.namedColor(.lightSlateGray)) }
  public static var lightSteelBlue: CSS.Color { .colorBase(.namedColor(.lightSteelBlue)) }
  public static var lightYellow: CSS.Color { .colorBase(.namedColor(.lightYellow)) }
  public static var lime: CSS.Color { .colorBase(.namedColor(.lime)) }
  public static var limeGreen: CSS.Color { .colorBase(.namedColor(.limeGreen)) }
  public static var linen: CSS.Color { .colorBase(.namedColor(.linen)) }
  public static var magenta: CSS.Color { .colorBase(.namedColor(.magenta)) }
  public static var maroon: CSS.Color { .colorBase(.namedColor(.maroon)) }
  public static var mediumAquamarine: CSS.Color { .colorBase(.namedColor(.mediumAquamarine)) }
  public static var mediumBlue: CSS.Color { .colorBase(.namedColor(.mediumBlue)) }
  public static var mediumOrchid: CSS.Color { .colorBase(.namedColor(.mediumOrchid)) }
  public static var mediumPurple: CSS.Color { .colorBase(.namedColor(.mediumPurple)) }
  public static var mediumSeaGreen: CSS.Color { .colorBase(.namedColor(.mediumSeaGreen)) }
  public static var mediumSlateBlue: CSS.Color { .colorBase(.namedColor(.mediumSlateBlue)) }
  public static var mediumSpringGreen: CSS.Color { .colorBase(.namedColor(.mediumSpringGreen)) }
  public static var mediumTurquoise: CSS.Color { .colorBase(.namedColor(.mediumTurquoise)) }
  public static var mediumVioletRed: CSS.Color { .colorBase(.namedColor(.mediumVioletRed)) }
  public static var midnightBlue: CSS.Color { .colorBase(.namedColor(.midnightBlue)) }
  public static var mintCream: CSS.Color { .colorBase(.namedColor(.mintCream)) }
  public static var mistyRose: CSS.Color { .colorBase(.namedColor(.mistyRose)) }
  public static var moccasin: CSS.Color { .colorBase(.namedColor(.moccasin)) }
  public static var navajoWhite: CSS.Color { .colorBase(.namedColor(.navajoWhite)) }
  public static var navy: CSS.Color { .colorBase(.namedColor(.navy)) }
  public static var oldLace: CSS.Color { .colorBase(.namedColor(.oldLace)) }
  public static var olive: CSS.Color { .colorBase(.namedColor(.olive)) }
  public static var oliveDrab: CSS.Color { .colorBase(.namedColor(.oliveDrab)) }
  public static var orchid: CSS.Color { .colorBase(.namedColor(.orchid)) }
  public static var paleGoldenrod: CSS.Color { .colorBase(.namedColor(.paleGoldenrod)) }
  public static var paleGreen: CSS.Color { .colorBase(.namedColor(.paleGreen)) }
  public static var paleTurquoise: CSS.Color { .colorBase(.namedColor(.paleTurquoise)) }
  public static var paleVioletRed: CSS.Color { .colorBase(.namedColor(.paleVioletRed)) }
  public static var papayaWhip: CSS.Color { .colorBase(.namedColor(.papayaWhip)) }
  public static var peachPuff: CSS.Color { .colorBase(.namedColor(.peachPuff)) }
  public static var peru: CSS.Color { .colorBase(.namedColor(.peru)) }
  public static var plum: CSS.Color { .colorBase(.namedColor(.plum)) }
  public static var powderBlue: CSS.Color { .colorBase(.namedColor(.powderBlue)) }
  public static var rebeccaPurple: CSS.Color { .colorBase(.namedColor(.rebeccaPurple)) }
  public static var rosyBrown: CSS.Color { .colorBase(.namedColor(.rosyBrown)) }
  public static var royalBlue: CSS.Color { .colorBase(.namedColor(.royalBlue)) }
  public static var saddleBrown: CSS.Color { .colorBase(.namedColor(.saddleBrown)) }
  public static var salmon: CSS.Color { .colorBase(.namedColor(.salmon)) }
  public static var sandyBrown: CSS.Color { .colorBase(.namedColor(.sandyBrown)) }
  public static var seaGreen: CSS.Color { .colorBase(.namedColor(.seaGreen)) }
  public static var seashell: CSS.Color { .colorBase(.namedColor(.seashell)) }
  public static var sienna: CSS.Color { .colorBase(.namedColor(.sienna)) }
  public static var silver: CSS.Color { .colorBase(.namedColor(.silver)) }
  public static var skyBlue: CSS.Color { .colorBase(.namedColor(.skyBlue)) }
  public static var slateBlue: CSS.Color { .colorBase(.namedColor(.slateBlue)) }
  public static var slateGray: CSS.Color { .colorBase(.namedColor(.slateGray)) }
  public static var snow: CSS.Color { .colorBase(.namedColor(.snow)) }
  public static var springGreen: CSS.Color { .colorBase(.namedColor(.springGreen)) }
  public static var steelBlue: CSS.Color { .colorBase(.namedColor(.steelBlue)) }
  public static var tan: CSS.Color { .colorBase(.namedColor(.tan)) }
  public static var teal: CSS.Color { .colorBase(.namedColor(.teal)) }
  public static var thistle: CSS.Color { .colorBase(.namedColor(.thistle)) }
  public static var tomato: CSS.Color { .colorBase(.namedColor(.tomato)) }
  public static var turquoise: CSS.Color { .colorBase(.namedColor(.turquoise)) }
  public static var violet: CSS.Color { .colorBase(.namedColor(.violet)) }
  public static var wheat: CSS.Color { .colorBase(.namedColor(.wheat)) }
  public static var whiteSmoke: CSS.Color { .colorBase(.namedColor(.whiteSmoke)) }
  public static var yellowGreen: CSS.Color { .colorBase(.namedColor(.yellowGreen)) }
}
