import EmbeddedSwiftUtilities

public indirect enum CSSColor: Sendable, CustomStringConvertible, CSSVariableConvertible {
  case colorBase(ColorBase)
  case currentColor(CSSKeyword.CurrentColor)
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

  public static func variable(_ name: String) -> CSSColor {
    .systemColor("var(\(name))")
  }
}

extension String.StringInterpolation {
  public mutating func appendInterpolation(_ color: CSSColor) {
    appendLiteral(color.value)
  }
}

public func stringEquals(_ lhs: CSSColor, _ rhs: CSSColor) -> Bool {
  return stringEquals(lhs.value, rhs.value)
}

public func stringEquals(_ lhs: CSSColor, _ rhs: String) -> Bool {
  return stringEquals(lhs.value, rhs)
}

public func stringEquals(_ lhs: String, _ rhs: CSSColor) -> Bool {
  return stringEquals(lhs, rhs.value)
}

extension CSSColor {
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

    public init(_ r: Percentage, _ g: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
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

    public init(_ r: Percentage, _ g: Percentage, _ b: Percentage, _ alpha: Double) {
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

    public init(_ h: Double, _ s: Percentage, _ l: Percentage, _ alpha: Double? = nil) {
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

    public init(_ h: CSSAngle, _ s: Percentage, _ l: Percentage, _ alpha: Double? = nil) {
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

    public init(_ h: Double, _ s: Percentage, _ l: Percentage, _ alpha: Double) {
      #if SERVER
        self.components =
          "hsla(\(doubleToString(h)), \(s.value), \(l.value), \(doubleToString(alpha)))"
      #endif
      #if CLIENT
        self.components =
          "hsla(\(doubleToString(h)), \(s.value), \(l.value), \(doubleToString(alpha)))"
      #endif
    }

    public init(_ h: CSSAngle, _ s: Percentage, _ l: Percentage, _ alpha: Double) {
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

    public init(_ h: Double, _ w: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
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

    public init(_ h: CSSAngle, _ w: Percentage, _ b: Percentage, _ alpha: Double? = nil) {
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

    public init(_ l: Double, _ c: Double, _ h: CSSAngle, _ alpha: Double? = nil) {
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
      from color: CSSColor, _ l: CSSOKLABComponent, _ a: CSSOKLABComponent, _ b: CSSOKLABComponent
    ) {
      self.components = "oklab(from \(color.value) \(l.rawValue) \(a.rawValue) \(b.rawValue))"
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

    public init(_ l: Double, _ c: Double, _ h: CSSAngle, _ alpha: Double? = nil) {
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

    public init(_ jz: Double, _ cz: Double, _ hz: CSSAngle, _ alpha: Double? = nil) {
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

    public init(from color: CSSColor, alpha: Double? = nil) {
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
    public let light: CSSColor
    public let dark: CSSColor

    public init(_ light: CSSColor, _ dark: CSSColor) {
      self.light = light
      self.dark = dark
    }

    public var value: String {
      "light-dark(\(light.value), \(dark.value))"
    }
  }

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
    public let color: CSSColor?
    private let rawValue: String?

    internal init(_ value: String) {
      self.color = nil
      self.rawValue = value
    }

    public static func variable(_ name: String) -> CSSColor {
      CSSColor.contrastColor(ContrastColor("var(\(name))"))
    }

    public init(_ color: CSSColor) {
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

public func hex(_ value: Int) -> CSSColor {
  let hexString = int64ToString(Int64(value), radix: 16, uppercase: true)
  let paddingCount = max(0, 6 - hexString.utf8.count)
  let paddedHex = "\(stringRepeating("0", count: paddingCount))\(hexString)"
  return .colorBase(.hex("#\(paddedHex)"))
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

public func oklab(
  from color: CSSColor, _ l: CSSOKLABComponent, _ a: CSSOKLABComponent, _ b: CSSOKLABComponent
) -> CSSColor {
  return .colorBase(.colorFunction(.oklab(CSSColor.OKLAB(from: color, l, a, b))))
}

// MARK: - Oklch

public func oklch(_ l: Double, _ c: Double, _ h: Double) -> CSSColor {
  .colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l, c, h))))
}

public func oklch(l: String, c: String, h: String) -> CSSColor {
  .colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l: l, c: c, h: h))))
}

public func oklch(l: Double, c: Double, h: Double) -> CSSColor {
  .colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l, c, h))))
}

public func oklch(l: Double, c: Double, h: String) -> CSSColor {
  .colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l: "\(l)", c: "\(c)", h: h))))
}

public func oklch(_ l: Double, _ c: Double, _ h: Double, _ alpha: Double) -> CSSColor {
  .colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l, c, h, alpha))))
}

public func oklch(l: Double, c: Double, h: CSSAngle) -> CSSColor {
  .colorBase(.colorFunction(.oklch(CSSColor.OKLCH(l, c, h))))
}

public func oklch(l: Double, c: Double, h: CSSAngle, alpha: Double) -> CSSColor {
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

public func color(_ colorSpace: String, _ c1: Double, _ c2: Double, _ c3: Double, _ alpha: Double)
  -> CSSColor
{
  .colorBase(.colorFunction(.color(CSSColor.Color(colorSpace, c1, c2, c3, alpha))))
}

// MARK: - Utility functions

public func lightDark(_ light: CSSColor, _ dark: CSSColor) -> CSSColor {
  .lightDark(CSSColor.LightDark(light, dark))
}

public func colorMix(
  in interpolationMethod: CSSColorInterpolationMethod, _ color1: CSSColor,
  _ color2: (CSSColor, Percentage)
) -> CSSColor {
  .colorBase(
    .colorMix(CSSColor.ColorMix(in: interpolationMethod.value, color1, nil, color2.0, color2.1)))
}

public func colorMix(
  in interpolationMethod: CSSColorInterpolationMethod, _ color1: CSSColor,
  _ color2: (CSSKeyword.Transparent, Percentage)
) -> CSSColor {
  .colorBase(
    .colorMix(
      CSSColor.ColorMix(in: interpolationMethod.value, color1, nil, CSSColor(color2.0), color2.1)))
}

public func colorMix(
  in interpolationMethod: CSSColorInterpolationMethod, _ color1: (CSSColor, Percentage),
  _ color2: (CSSColor, Percentage)
) -> CSSColor {
  .colorBase(
    .colorMix(
      CSSColor.ColorMix(in: interpolationMethod.value, color1.0, color1.1, color2.0, color2.1)))
}

public func colorMix(
  in interpolationMethod: CSSColorInterpolationMethod, _ color1: (CSSColor, Percentage),
  _ color2: (CSSKeyword.Transparent, Percentage)
) -> CSSColor {
  .colorBase(
    .colorMix(
      CSSColor.ColorMix(
        in: interpolationMethod.value, color1.0, color1.1, CSSColor(color2.0), color2.1)))
}

public func colorMix(
  in interpolationMethod: CSSColorInterpolationMethod,
  _ color1: (CSSKeyword.Transparent, Percentage), _ color2: (CSSColor, Percentage)
) -> CSSColor {
  .colorBase(
    .colorMix(
      CSSColor.ColorMix(
        in: interpolationMethod.value, CSSColor(color1.0), color1.1, color2.0, color2.1)))
}

public func colorMix(
  in interpolationMethod: CSSColorInterpolationMethod, _ color1: CSSColor, _ color2: CSSColor
) -> CSSColor {
  .colorBase(.colorMix(CSSColor.ColorMix(in: interpolationMethod.value, color1, nil, color2, nil)))
}

// MARK: - Rectangular colorMix overloads

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: CSSColor,
  _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: CSSColor,
  _ color2: (CSSKeyword.Transparent, Percentage)
) -> CSSColor {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace,
  _ color1: (CSSColor, Percentage), _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace,
  _ color1: (CSSColor, Percentage), _ color2: (CSSKeyword.Transparent, Percentage)
) -> CSSColor {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace,
  _ color1: (CSSKeyword.Transparent, Percentage), _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.RectangularColorSpace, _ color1: CSSColor,
  _ color2: CSSColor
) -> CSSColor {
  colorMix(in: .rectangular(colorSpace), color1, color2)
}

// MARK: - Polar colorMix overloads

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: CSSColor,
  _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: CSSColor,
  _ color2: (CSSKeyword.Transparent, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: (CSSColor, Percentage),
  _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: (CSSColor, Percentage),
  _ color2: (CSSKeyword.Transparent, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace,
  _ color1: (CSSKeyword.Transparent, Percentage), _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace, _ color1: CSSColor, _ color2: CSSColor
) -> CSSColor {
  colorMix(in: .polar(colorSpace), color1, color2)
}

// MARK: - Polar colorMix with hue interpolation

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace,
  hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: CSSColor,
  _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace,
  hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: CSSColor,
  _ color2: (CSSKeyword.Transparent, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace,
  hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: (CSSColor, Percentage),
  _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace,
  hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: (CSSColor, Percentage),
  _ color2: (CSSKeyword.Transparent, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace,
  hue: CSSColorInterpolationMethod.HueInterpolationMethod,
  _ color1: (CSSKeyword.Transparent, Percentage), _ color2: (CSSColor, Percentage)
) -> CSSColor {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func colorMix(
  in colorSpace: CSSColorInterpolationMethod.PolarColorSpace,
  hue: CSSColorInterpolationMethod.HueInterpolationMethod, _ color1: CSSColor, _ color2: CSSColor
) -> CSSColor {
  colorMix(in: .polar(colorSpace, hue), color1, color2)
}

public func deviceCmyk(_ c: Double, _ m: Double, _ y: Double, _ k: Double) -> CSSColor {
  .deviceCmyk(CSSColor.DeviceCmyk(c, m, y, k))
}

public func deviceCmyk(_ c: Double, _ m: Double, _ y: Double, _ k: Double, _ alpha: Double)
  -> CSSColor
{
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

extension CSSColor {
  public static var transparent: CSSKeyword.Transparent { .transparent }
  public static var currentColor: CSSColor { .currentColor(.currentColor) }
  public static var red: CSSColor { .colorBase(.namedColor(.red)) }
  public static var blue: CSSColor { .colorBase(.namedColor(.blue)) }
  public static var green: CSSColor { .colorBase(.namedColor(.green)) }
  public static var yellow: CSSColor { .colorBase(.namedColor(.yellow)) }
  public static var orange: CSSColor { .colorBase(.namedColor(.orange)) }
  public static var purple: CSSColor { .colorBase(.namedColor(.purple)) }
  public static var pink: CSSColor { .colorBase(.namedColor(.pink)) }
  public static var black: CSSColor { .colorBase(.namedColor(.black)) }
  public static var white: CSSColor { .colorBase(.namedColor(.white)) }
  public static var gray: CSSColor { .colorBase(.namedColor(.gray)) }
  public static var aliceBlue: CSSColor { .colorBase(.namedColor(.aliceBlue)) }
  public static var antiqueWhite: CSSColor { .colorBase(.namedColor(.antiqueWhite)) }
  public static var aqua: CSSColor { .colorBase(.namedColor(.aqua)) }
  public static var aquamarine: CSSColor { .colorBase(.namedColor(.aquamarine)) }
  public static var azure: CSSColor { .colorBase(.namedColor(.azure)) }
  public static var beige: CSSColor { .colorBase(.namedColor(.beige)) }
  public static var bisque: CSSColor { .colorBase(.namedColor(.bisque)) }
  public static var blanchedAlmond: CSSColor { .colorBase(.namedColor(.blanchedAlmond)) }
  public static var blueViolet: CSSColor { .colorBase(.namedColor(.blueViolet)) }
  public static var brown: CSSColor { .colorBase(.namedColor(.brown)) }
  public static var burlyWood: CSSColor { .colorBase(.namedColor(.burlyWood)) }
  public static var cadetBlue: CSSColor { .colorBase(.namedColor(.cadetBlue)) }
  public static var chartreuse: CSSColor { .colorBase(.namedColor(.chartreuse)) }
  public static var chocolate: CSSColor { .colorBase(.namedColor(.chocolate)) }
  public static var coral: CSSColor { .colorBase(.namedColor(.coral)) }
  public static var cornflowerBlue: CSSColor { .colorBase(.namedColor(.cornflowerBlue)) }
  public static var cornsilk: CSSColor { .colorBase(.namedColor(.cornsilk)) }
  public static var crimson: CSSColor { .colorBase(.namedColor(.crimson)) }
  public static var cyan: CSSColor { .colorBase(.namedColor(.cyan)) }
  public static var darkBlue: CSSColor { .colorBase(.namedColor(.darkBlue)) }
  public static var darkCyan: CSSColor { .colorBase(.namedColor(.darkCyan)) }
  public static var darkGoldenrod: CSSColor { .colorBase(.namedColor(.darkGoldenrod)) }
  public static var darkGray: CSSColor { .colorBase(.namedColor(.darkGray)) }
  public static var darkGreen: CSSColor { .colorBase(.namedColor(.darkGreen)) }
  public static var darkKhaki: CSSColor { .colorBase(.namedColor(.darkKhaki)) }
  public static var darkMagenta: CSSColor { .colorBase(.namedColor(.darkMagenta)) }
  public static var darkOliveGreen: CSSColor { .colorBase(.namedColor(.darkOliveGreen)) }
  public static var darkOrange: CSSColor { .colorBase(.namedColor(.darkOrange)) }
  public static var darkOrchid: CSSColor { .colorBase(.namedColor(.darkOrchid)) }
  public static var darkRed: CSSColor { .colorBase(.namedColor(.darkRed)) }
  public static var darkSalmon: CSSColor { .colorBase(.namedColor(.darkSalmon)) }
  public static var darkSeaGreen: CSSColor { .colorBase(.namedColor(.darkSeaGreen)) }
  public static var darkSlateBlue: CSSColor { .colorBase(.namedColor(.darkSlateBlue)) }
  public static var darkSlateGray: CSSColor { .colorBase(.namedColor(.darkSlateGray)) }
  public static var darkTurquoise: CSSColor { .colorBase(.namedColor(.darkTurquoise)) }
  public static var darkViolet: CSSColor { .colorBase(.namedColor(.darkViolet)) }
  public static var deepPink: CSSColor { .colorBase(.namedColor(.deepPink)) }
  public static var deepSkyBlue: CSSColor { .colorBase(.namedColor(.deepSkyBlue)) }
  public static var dimGray: CSSColor { .colorBase(.namedColor(.dimGray)) }
  public static var dodgerBlue: CSSColor { .colorBase(.namedColor(.dodgerBlue)) }
  public static var firebrick: CSSColor { .colorBase(.namedColor(.firebrick)) }
  public static var floralWhite: CSSColor { .colorBase(.namedColor(.floralWhite)) }
  public static var forestGreen: CSSColor { .colorBase(.namedColor(.forestGreen)) }
  public static var fuchsia: CSSColor { .colorBase(.namedColor(.fuchsia)) }
  public static var gainsboro: CSSColor { .colorBase(.namedColor(.gainsboro)) }
  public static var ghostWhite: CSSColor { .colorBase(.namedColor(.ghostWhite)) }
  public static var gold: CSSColor { .colorBase(.namedColor(.gold)) }
  public static var goldenrod: CSSColor { .colorBase(.namedColor(.goldenrod)) }
  public static var greenYellow: CSSColor { .colorBase(.namedColor(.greenYellow)) }
  public static var honeydew: CSSColor { .colorBase(.namedColor(.honeydew)) }
  public static var hotPink: CSSColor { .colorBase(.namedColor(.hotPink)) }
  public static var indianRed: CSSColor { .colorBase(.namedColor(.indianRed)) }
  public static var indigo: CSSColor { .colorBase(.namedColor(.indigo)) }
  public static var ivory: CSSColor { .colorBase(.namedColor(.ivory)) }
  public static var khaki: CSSColor { .colorBase(.namedColor(.khaki)) }
  public static var lavender: CSSColor { .colorBase(.namedColor(.lavender)) }
  public static var lavenderBlush: CSSColor { .colorBase(.namedColor(.lavenderBlush)) }
  public static var lawnGreen: CSSColor { .colorBase(.namedColor(.lawnGreen)) }
  public static var lemonChiffon: CSSColor { .colorBase(.namedColor(.lemonChiffon)) }
  public static var lightBlue: CSSColor { .colorBase(.namedColor(.lightBlue)) }
  public static var lightCoral: CSSColor { .colorBase(.namedColor(.lightCoral)) }
  public static var lightCyan: CSSColor { .colorBase(.namedColor(.lightCyan)) }
  public static var lightGoldenrodYellow: CSSColor {
    .colorBase(.namedColor(.lightGoldenrodYellow))
  }
  public static var lightGray: CSSColor { .colorBase(.namedColor(.lightGray)) }
  public static var lightGreen: CSSColor { .colorBase(.namedColor(.lightGreen)) }
  public static var lightPink: CSSColor { .colorBase(.namedColor(.lightPink)) }
  public static var lightSalmon: CSSColor { .colorBase(.namedColor(.lightSalmon)) }
  public static var lightSeaGreen: CSSColor { .colorBase(.namedColor(.lightSeaGreen)) }
  public static var lightSkyBlue: CSSColor { .colorBase(.namedColor(.lightSkyBlue)) }
  public static var lightSlateGray: CSSColor { .colorBase(.namedColor(.lightSlateGray)) }
  public static var lightSteelBlue: CSSColor { .colorBase(.namedColor(.lightSteelBlue)) }
  public static var lightYellow: CSSColor { .colorBase(.namedColor(.lightYellow)) }
  public static var lime: CSSColor { .colorBase(.namedColor(.lime)) }
  public static var limeGreen: CSSColor { .colorBase(.namedColor(.limeGreen)) }
  public static var linen: CSSColor { .colorBase(.namedColor(.linen)) }
  public static var magenta: CSSColor { .colorBase(.namedColor(.magenta)) }
  public static var maroon: CSSColor { .colorBase(.namedColor(.maroon)) }
  public static var mediumAquamarine: CSSColor { .colorBase(.namedColor(.mediumAquamarine)) }
  public static var mediumBlue: CSSColor { .colorBase(.namedColor(.mediumBlue)) }
  public static var mediumOrchid: CSSColor { .colorBase(.namedColor(.mediumOrchid)) }
  public static var mediumPurple: CSSColor { .colorBase(.namedColor(.mediumPurple)) }
  public static var mediumSeaGreen: CSSColor { .colorBase(.namedColor(.mediumSeaGreen)) }
  public static var mediumSlateBlue: CSSColor { .colorBase(.namedColor(.mediumSlateBlue)) }
  public static var mediumSpringGreen: CSSColor { .colorBase(.namedColor(.mediumSpringGreen)) }
  public static var mediumTurquoise: CSSColor { .colorBase(.namedColor(.mediumTurquoise)) }
  public static var mediumVioletRed: CSSColor { .colorBase(.namedColor(.mediumVioletRed)) }
  public static var midnightBlue: CSSColor { .colorBase(.namedColor(.midnightBlue)) }
  public static var mintCream: CSSColor { .colorBase(.namedColor(.mintCream)) }
  public static var mistyRose: CSSColor { .colorBase(.namedColor(.mistyRose)) }
  public static var moccasin: CSSColor { .colorBase(.namedColor(.moccasin)) }
  public static var navajoWhite: CSSColor { .colorBase(.namedColor(.navajoWhite)) }
  public static var navy: CSSColor { .colorBase(.namedColor(.navy)) }
  public static var oldLace: CSSColor { .colorBase(.namedColor(.oldLace)) }
  public static var olive: CSSColor { .colorBase(.namedColor(.olive)) }
  public static var oliveDrab: CSSColor { .colorBase(.namedColor(.oliveDrab)) }
  public static var orchid: CSSColor { .colorBase(.namedColor(.orchid)) }
  public static var paleGoldenrod: CSSColor { .colorBase(.namedColor(.paleGoldenrod)) }
  public static var paleGreen: CSSColor { .colorBase(.namedColor(.paleGreen)) }
  public static var paleTurquoise: CSSColor { .colorBase(.namedColor(.paleTurquoise)) }
  public static var paleVioletRed: CSSColor { .colorBase(.namedColor(.paleVioletRed)) }
  public static var papayaWhip: CSSColor { .colorBase(.namedColor(.papayaWhip)) }
  public static var peachPuff: CSSColor { .colorBase(.namedColor(.peachPuff)) }
  public static var peru: CSSColor { .colorBase(.namedColor(.peru)) }
  public static var plum: CSSColor { .colorBase(.namedColor(.plum)) }
  public static var powderBlue: CSSColor { .colorBase(.namedColor(.powderBlue)) }
  public static var rebeccaPurple: CSSColor { .colorBase(.namedColor(.rebeccaPurple)) }
  public static var rosyBrown: CSSColor { .colorBase(.namedColor(.rosyBrown)) }
  public static var royalBlue: CSSColor { .colorBase(.namedColor(.royalBlue)) }
  public static var saddleBrown: CSSColor { .colorBase(.namedColor(.saddleBrown)) }
  public static var salmon: CSSColor { .colorBase(.namedColor(.salmon)) }
  public static var sandyBrown: CSSColor { .colorBase(.namedColor(.sandyBrown)) }
  public static var seaGreen: CSSColor { .colorBase(.namedColor(.seaGreen)) }
  public static var seashell: CSSColor { .colorBase(.namedColor(.seashell)) }
  public static var sienna: CSSColor { .colorBase(.namedColor(.sienna)) }
  public static var silver: CSSColor { .colorBase(.namedColor(.silver)) }
  public static var skyBlue: CSSColor { .colorBase(.namedColor(.skyBlue)) }
  public static var slateBlue: CSSColor { .colorBase(.namedColor(.slateBlue)) }
  public static var slateGray: CSSColor { .colorBase(.namedColor(.slateGray)) }
  public static var snow: CSSColor { .colorBase(.namedColor(.snow)) }
  public static var springGreen: CSSColor { .colorBase(.namedColor(.springGreen)) }
  public static var steelBlue: CSSColor { .colorBase(.namedColor(.steelBlue)) }
  public static var tan: CSSColor { .colorBase(.namedColor(.tan)) }
  public static var teal: CSSColor { .colorBase(.namedColor(.teal)) }
  public static var thistle: CSSColor { .colorBase(.namedColor(.thistle)) }
  public static var tomato: CSSColor { .colorBase(.namedColor(.tomato)) }
  public static var turquoise: CSSColor { .colorBase(.namedColor(.turquoise)) }
  public static var violet: CSSColor { .colorBase(.namedColor(.violet)) }
  public static var wheat: CSSColor { .colorBase(.namedColor(.wheat)) }
  public static var whiteSmoke: CSSColor { .colorBase(.namedColor(.whiteSmoke)) }
  public static var yellowGreen: CSSColor { .colorBase(.namedColor(.yellowGreen)) }
}
