import EmbeddedSwiftUtilities

#if SERVER
  public enum SVGAttributeName: String, Sendable {
    case d = "d"
    case transform = "transform"
    case fill = "fill"
    case fillOpacity = "fill-opacity"
    case stroke = "stroke"
    case strokeWidth = "stroke-width"
    case x = "x"
    case y = "y"
    case x1 = "x1"
    case y1 = "y1"
    case x2 = "x2"
    case y2 = "y2"
    case width = "width"
    case height = "height"
    case opacity = "opacity"
    case rx = "rx"
    case ry = "ry"
    case cx = "cx"
    case cy = "cy"
    case r = "r"
    case points = "points"
    case visibility = "visibility"
    case offset = "offset"
    case xlinkHref = "xlink:href"
    case from = "from"
    case to = "to"
    case begin = "begin"
    case dur = "dur"
    case repeatCount = "repeatCount"
    case attributeName = "attributeName"
    case values = "values"
    case keyTimes = "keyTimes"
    case calcMode = "calcMode"
    case additive = "additive"
    case accumulate = "accumulate"
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  public enum SVGAttributeName: Sendable, RawRepresentable {
    case d
    case transform
    case fill
    case fillOpacity
    case stroke
    case strokeWidth
    case x
    case y
    case x1
    case y1
    case x2
    case y2
    case width
    case height
    case opacity
    case rx
    case ry
    case cx
    case cy
    case r
    case points
    case visibility
    case offset
    case xlinkHref
    case from
    case to
    case begin
    case dur
    case repeatCount
    case attributeName
    case values
    case keyTimes
    case calcMode
    case additive
    case accumulate

    public var rawValue: String {
      switch self {
      case .d: return "d"
      case .transform: return "transform"
      case .fill: return "fill"
      case .fillOpacity: return "fill-opacity"
      case .stroke: return "stroke"
      case .strokeWidth: return "stroke-width"
      case .x: return "x"
      case .y: return "y"
      case .x1: return "x1"
      case .y1: return "y1"
      case .x2: return "x2"
      case .y2: return "y2"
      case .width: return "width"
      case .height: return "height"
      case .opacity: return "opacity"
      case .rx: return "rx"
      case .ry: return "ry"
      case .cx: return "cx"
      case .cy: return "cy"
      case .r: return "r"
      case .points: return "points"
      case .visibility: return "visibility"
      case .offset: return "offset"
      case .xlinkHref: return "xlink:href"
      case .from: return "from"
      case .to: return "to"
      case .begin: return "begin"
      case .dur: return "dur"
      case .repeatCount: return "repeatCount"
      case .attributeName: return "attributeName"
      case .values: return "values"
      case .keyTimes: return "keyTimes"
      case .calcMode: return "calcMode"
      case .additive: return "additive"
      case .accumulate: return "accumulate"
      }
    }

    public init?(rawValue: String) {
      if stringEquals(rawValue, "d") {
        self = .d
      } else if stringEquals(rawValue, "transform") {
        self = .transform
      } else if stringEquals(rawValue, "fill") {
        self = .fill
      } else if stringEquals(rawValue, "fill-opacity") {
        self = .fillOpacity
      } else if stringEquals(rawValue, "stroke") {
        self = .stroke
      } else if stringEquals(rawValue, "stroke-width") {
        self = .strokeWidth
      } else if stringEquals(rawValue, "x") {
        self = .x
      } else if stringEquals(rawValue, "y") {
        self = .y
      } else if stringEquals(rawValue, "x1") {
        self = .x1
      } else if stringEquals(rawValue, "y1") {
        self = .y1
      } else if stringEquals(rawValue, "x2") {
        self = .x2
      } else if stringEquals(rawValue, "y2") {
        self = .y2
      } else if stringEquals(rawValue, "width") {
        self = .width
      } else if stringEquals(rawValue, "height") {
        self = .height
      } else if stringEquals(rawValue, "opacity") {
        self = .opacity
      } else if stringEquals(rawValue, "rx") {
        self = .rx
      } else if stringEquals(rawValue, "ry") {
        self = .ry
      } else if stringEquals(rawValue, "cx") {
        self = .cx
      } else if stringEquals(rawValue, "cy") {
        self = .cy
      } else if stringEquals(rawValue, "r") {
        self = .r
      } else if stringEquals(rawValue, "points") {
        self = .points
      } else if stringEquals(rawValue, "visibility") {
        self = .visibility
      } else if stringEquals(rawValue, "offset") {
        self = .offset
      } else if stringEquals(rawValue, "xlink:href") {
        self = .xlinkHref
      } else if stringEquals(rawValue, "from") {
        self = .from
      } else if stringEquals(rawValue, "to") {
        self = .to
      } else if stringEquals(rawValue, "begin") {
        self = .begin
      } else if stringEquals(rawValue, "dur") {
        self = .dur
      } else if stringEquals(rawValue, "repeatCount") {
        self = .repeatCount
      } else if stringEquals(rawValue, "attributeName") {
        self = .attributeName
      } else if stringEquals(rawValue, "values") {
        self = .values
      } else if stringEquals(rawValue, "keyTimes") {
        self = .keyTimes
      } else if stringEquals(rawValue, "calcMode") {
        self = .calcMode
      } else if stringEquals(rawValue, "additive") {
        self = .additive
      } else if stringEquals(rawValue, "accumulate") {
        self = .accumulate
      } else {
        return nil
      }
    }
  }
#endif
