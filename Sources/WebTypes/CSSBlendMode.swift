import EmbeddedSwiftUtilities

public enum CSSBlendMode: Sendable, CSSVariableConvertible {
  case normal
  case multiply
  case screen
  case overlay
  case darken
  case lighten
  case colorDodge
  case colorBurn
  case hardLight
  case softLight
  case difference
  case exclusion
  case hue
  case saturation
  case color
  case luminosity
  case variable(String)

  public var value: String {
    switch self {
    case .normal: return "normal"
    case .multiply: return "multiply"
    case .screen: return "screen"
    case .overlay: return "overlay"
    case .darken: return "darken"
    case .lighten: return "lighten"
    case .colorDodge: return "color-dodge"
    case .colorBurn: return "color-burn"
    case .hardLight: return "hard-light"
    case .softLight: return "soft-light"
    case .difference: return "difference"
    case .exclusion: return "exclusion"
    case .hue: return "hue"
    case .saturation: return "saturation"
    case .color: return "color"
    case .luminosity: return "luminosity"
    case .variable(let name): return "var(\(name))"
    }
  }

  public var staticRawValue: StaticString? {
    switch self {
    case .normal: return "normal"
    case .multiply: return "multiply"
    case .screen: return "screen"
    case .overlay: return "overlay"
    case .darken: return "darken"
    case .lighten: return "lighten"
    case .colorDodge: return "color-dodge"
    case .colorBurn: return "color-burn"
    case .hardLight: return "hard-light"
    case .softLight: return "soft-light"
    case .difference: return "difference"
    case .exclusion: return "exclusion"
    case .hue: return "hue"
    case .saturation: return "saturation"
    case .color: return "color"
    case .luminosity: return "luminosity"
    case .variable: return nil
    }
  }
}
