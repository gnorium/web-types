import EmbeddedSwiftUtilities

extension SVG {
  public enum Path {
    public enum Definition {
      public enum Command: Sendable {
        case move(x: Double, y: Double, relative: Bool)
        case line(x: Double, y: Double, relative: Bool)
        case horizontal(x: Double, relative: Bool)
        case vertical(y: Double, relative: Bool)
        case cubicBezier(x1: Double, y1: Double, x2: Double, y2: Double, x: Double, y: Double, relative: Bool)
        case smoothCubicBezier(x2: Double, y2: Double, x: Double, y: Double, relative: Bool)
        case quadraticBezier(x1: Double, y1: Double, x: Double, y: Double, relative: Bool)
        case smoothQuadraticBezier(x: Double, y: Double, relative: Bool)
        case arc(rx: Double, ry: Double, rotation: Double, largeArc: Int, sweep: Int, x: Double, y: Double, relative: Bool)
        case close

        public var pathString: String {
          switch self {
          case .move(let x, let y, let relative):
            return relative
              ? "m \(doubleToString(x)),\(doubleToString(y))"
              : "M \(doubleToString(x)),\(doubleToString(y))"
          case .line(let x, let y, let relative):
            return relative
              ? "l \(doubleToString(x)),\(doubleToString(y))"
              : "L \(doubleToString(x)),\(doubleToString(y))"
          case .horizontal(let x, let relative):
            return relative ? "h \(doubleToString(x))" : "H \(doubleToString(x))"
          case .vertical(let y, let relative):
            return relative ? "v \(doubleToString(y))" : "V \(doubleToString(y))"
          case .cubicBezier(let x1, let y1, let x2, let y2, let x, let y, let relative):
            return relative
              ? "c \(doubleToString(x1)),\(doubleToString(y1)) \(doubleToString(x2)),\(doubleToString(y2)) \(doubleToString(x)),\(doubleToString(y))"
              : "C \(doubleToString(x1)),\(doubleToString(y1)) \(doubleToString(x2)),\(doubleToString(y2)) \(doubleToString(x)),\(doubleToString(y))"
          case .smoothCubicBezier(let x2, let y2, let x, let y, let relative):
            return relative
              ? "s \(doubleToString(x2)),\(doubleToString(y2)) \(doubleToString(x)),\(doubleToString(y))"
              : "S \(doubleToString(x2)),\(doubleToString(y2)) \(doubleToString(x)),\(doubleToString(y))"
          case .quadraticBezier(let x1, let y1, let x, let y, let relative):
            return relative
              ? "q \(doubleToString(x1)),\(doubleToString(y1)) \(doubleToString(x)),\(doubleToString(y))"
              : "Q \(doubleToString(x1)),\(doubleToString(y1)) \(doubleToString(x)),\(doubleToString(y))"
          case .smoothQuadraticBezier(let x, let y, let relative):
            return relative
              ? "t \(doubleToString(x)),\(doubleToString(y))"
              : "T \(doubleToString(x)),\(doubleToString(y))"
          case .arc(let rx, let ry, let rotation, let largeArc, let sweep, let x, let y, let relative):
            let cmd = relative ? "a" : "A"
            return "\(cmd) \(doubleToString(rx)),\(doubleToString(ry)) \(doubleToString(rotation)) \(largeArc) \(sweep) \(doubleToString(x)),\(doubleToString(y))"
          case .close:
            return "Z"
          }
        }
      }
    }
  }
}

public func M(_ x: Double, _ y: Double) -> SVG.Path.Definition.Command { .move(x: x, y: y, relative: false) }
public func m(_ x: Double, _ y: Double) -> SVG.Path.Definition.Command { .move(x: x, y: y, relative: true) }
public func L(_ x: Double, _ y: Double) -> SVG.Path.Definition.Command { .line(x: x, y: y, relative: false) }
public func l(_ x: Double, _ y: Double) -> SVG.Path.Definition.Command { .line(x: x, y: y, relative: true) }
public func H(_ x: Double) -> SVG.Path.Definition.Command { .horizontal(x: x, relative: false) }
public func h(_ x: Double) -> SVG.Path.Definition.Command { .horizontal(x: x, relative: true) }
public func V(_ y: Double) -> SVG.Path.Definition.Command { .vertical(y: y, relative: false) }
public func v(_ y: Double) -> SVG.Path.Definition.Command { .vertical(y: y, relative: true) }
public func C(_ x1: Double, _ y1: Double, _ x2: Double, _ y2: Double, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .cubicBezier(x1: x1, y1: y1, x2: x2, y2: y2, x: x, y: y, relative: false)
}
public func c(_ x1: Double, _ y1: Double, _ x2: Double, _ y2: Double, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .cubicBezier(x1: x1, y1: y1, x2: x2, y2: y2, x: x, y: y, relative: true)
}
public func S(_ x2: Double, _ y2: Double, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .smoothCubicBezier(x2: x2, y2: y2, x: x, y: y, relative: false)
}
public func s(_ x2: Double, _ y2: Double, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .smoothCubicBezier(x2: x2, y2: y2, x: x, y: y, relative: true)
}
public func Q(_ x1: Double, _ y1: Double, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .quadraticBezier(x1: x1, y1: y1, x: x, y: y, relative: false)
}
public func q(_ x1: Double, _ y1: Double, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .quadraticBezier(x1: x1, y1: y1, x: x, y: y, relative: true)
}
public func T(_ x: Double, _ y: Double) -> SVG.Path.Definition.Command { .smoothQuadraticBezier(x: x, y: y, relative: false) }
public func t(_ x: Double, _ y: Double) -> SVG.Path.Definition.Command { .smoothQuadraticBezier(x: x, y: y, relative: true) }
public func A(_ rx: Double, _ ry: Double, _ rotation: Double, _ largeArc: Int, _ sweep: Int, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .arc(rx: rx, ry: ry, rotation: rotation, largeArc: largeArc, sweep: sweep, x: x, y: y, relative: false)
}
public func A(_ rx: Double, _ ry: Double, _ rotation: Double, _ largeArc: Bool, _ sweep: Bool, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .arc(rx: rx, ry: ry, rotation: rotation, largeArc: largeArc ? 1 : 0, sweep: sweep ? 1 : 0, x: x, y: y, relative: false)
}
public func a(_ rx: Double, _ ry: Double, _ rotation: Double, _ largeArc: Int, _ sweep: Int, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .arc(rx: rx, ry: ry, rotation: rotation, largeArc: largeArc, sweep: sweep, x: x, y: y, relative: true)
}
public func a(_ rx: Double, _ ry: Double, _ rotation: Double, _ largeArc: Bool, _ sweep: Bool, _ x: Double, _ y: Double) -> SVG.Path.Definition.Command {
  .arc(rx: rx, ry: ry, rotation: rotation, largeArc: largeArc ? 1 : 0, sweep: sweep ? 1 : 0, x: x, y: y, relative: true)
}
public func Z() -> SVG.Path.Definition.Command { .close }
public func z() -> SVG.Path.Definition.Command { .close }
