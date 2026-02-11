#if os(WASI)

import EmbeddedSwiftUtilities

#endif

/// SVGProtocol Path container
public enum SVGPath {
	/// SVGProtocol Path Definition (d attribute)
	public enum Definition {
		/// Command enum
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
				case let .move(x, y, relative):
					return relative ? "m \(x),\(y)" : "M \(x),\(y)"
				case let .line(x, y, relative):
					return relative ? "l \(x),\(y)" : "L \(x),\(y)"
				case let .horizontal(x, relative):
					return relative ? "h \(x)" : "H \(x)"
				case let .vertical(y, relative):
					return relative ? "v \(y)" : "V \(y)"
				case let .cubicBezier(x1, y1, x2, y2, x, y, relative):
					return relative ? "c \(x1),\(y1) \(x2),\(y2) \(x),\(y)" : "C \(x1),\(y1) \(x2),\(y2) \(x),\(y)"
				case let .smoothCubicBezier(x2, y2, x, y, relative):
					return relative ? "s \(x2),\(y2) \(x),\(y)" : "S \(x2),\(y2) \(x),\(y)"
				case let .quadraticBezier(x1, y1, x, y, relative):
					return relative ? "q \(x1),\(y1) \(x),\(y)" : "Q \(x1),\(y1) \(x),\(y)"
				case let .smoothQuadraticBezier(x, y, relative):
					return relative ? "t \(x),\(y)" : "T \(x),\(y)"
				case let .arc(rx, ry, rotation, largeArc, sweep, x, y, relative):
					let cmd = relative ? "a" : "A"
					return "\(cmd) \(rx),\(ry) \(rotation) \(largeArc) \(sweep) \(x),\(y)"
				case .close:
					return "Z"
				}
			}
		}
	}
}

// MARK: - Convenience Functions

/// M x,y - Move to absolute
public func M(_ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.move(x: x, y: y, relative: false)
}

/// m x,y - Move to relative
public func m(_ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.move(x: x, y: y, relative: true)
}

/// L x,y - Line to absolute
public func L(_ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.line(x: x, y: y, relative: false)
}

/// l x,y - Line to relative
public func l(_ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.line(x: x, y: y, relative: true)
}

/// H x - Horizontal line to absolute
public func H(_ x: Double) -> SVGPath.Definition.Command {
	.horizontal(x: x, relative: false)
}

/// h x - Horizontal line to relative
public func h(_ x: Double) -> SVGPath.Definition.Command {
	.horizontal(x: x, relative: true)
}

/// V y - Vertical line to absolute
public func V(_ y: Double) -> SVGPath.Definition.Command {
	.vertical(y: y, relative: false)
}

/// v y - Vertical line to relative
public func v(_ y: Double) -> SVGPath.Definition.Command {
	.vertical(y: y, relative: true)
}

/// C x1,y1 x2,y2 x,y - Cubic Bezier absolute
public func C(_ x1: Double, _ y1: Double, _ x2: Double, _ y2: Double, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.cubicBezier(x1: x1, y1: y1, x2: x2, y2: y2, x: x, y: y, relative: false)
}

/// c x1,y1 x2,y2 x,y - Cubic Bezier relative
public func c(_ x1: Double, _ y1: Double, _ x2: Double, _ y2: Double, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.cubicBezier(x1: x1, y1: y1, x2: x2, y2: y2, x: x, y: y, relative: true)
}

/// S x2,y2 x,y - Smooth cubic Bezier absolute
public func S(_ x2: Double, _ y2: Double, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.smoothCubicBezier(x2: x2, y2: y2, x: x, y: y, relative: false)
}

/// s x2,y2 x,y - Smooth cubic Bezier relative
public func s(_ x2: Double, _ y2: Double, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.smoothCubicBezier(x2: x2, y2: y2, x: x, y: y, relative: true)
}

/// Q x1,y1 x,y - Quadratic Bezier absolute
public func Q(_ x1: Double, _ y1: Double, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.quadraticBezier(x1: x1, y1: y1, x: x, y: y, relative: false)
}

/// q x1,y1 x,y - Quadratic Bezier relative
public func q(_ x1: Double, _ y1: Double, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.quadraticBezier(x1: x1, y1: y1, x: x, y: y, relative: true)
}

/// T x,y - Smooth quadratic Bezier absolute
public func T(_ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.smoothQuadraticBezier(x: x, y: y, relative: false)
}

/// t x,y - Smooth quadratic Bezier relative
public func t(_ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.smoothQuadraticBezier(x: x, y: y, relative: true)
}

/// A rx,ry rotation large-arc sweep x,y - Arc absolute
public func A(_ rx: Double, _ ry: Double, _ rotation: Double, _ largeArc: Int, _ sweep: Int, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.arc(rx: rx, ry: ry, rotation: rotation, largeArc: largeArc, sweep: sweep, x: x, y: y, relative: false)
}

public func A(_ rx: Double, _ ry: Double, _ rotation: Double, _ largeArc: Bool, _ sweep: Bool, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.arc(rx: rx, ry: ry, rotation: rotation, largeArc: largeArc ? 1 : 0, sweep: sweep ? 1 : 0, x: x, y: y, relative: false)
}

/// a rx,ry rotation large-arc sweep x,y - Arc relative
public func a(_ rx: Double, _ ry: Double, _ rotation: Double, _ largeArc: Int, _ sweep: Int, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.arc(rx: rx, ry: ry, rotation: rotation, largeArc: largeArc, sweep: sweep, x: x, y: y, relative: true)
}

public func a(_ rx: Double, _ ry: Double, _ rotation: Double, _ largeArc: Bool, _ sweep: Bool, _ x: Double, _ y: Double) -> SVGPath.Definition.Command {
	.arc(rx: rx, ry: ry, rotation: rotation, largeArc: largeArc ? 1 : 0, sweep: sweep ? 1 : 0, x: x, y: y, relative: true)
}

/// Z - Close path
public func Z() -> SVGPath.Definition.Command {
	.close
}

/// z - Close path
public func z() -> SVGPath.Definition.Command {
	.close
}
