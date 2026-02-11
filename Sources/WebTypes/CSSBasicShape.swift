#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <basic-shape> - Basic shape functions
public enum CSSBasicShape: Sendable {
	case circle(Circle)
	case ellipse(Ellipse)
	case polygon(Polygon)
	case inset(Inset)
	case path(Path)
	case rect(Rect)
	case xywh(XYWH)

	public var value: String {
		switch self {
			case .circle(let shape):
				return shape.value
			case .ellipse(let shape):
				return shape.value
			case .polygon(let shape):
				return shape.value
			case .inset(let shape):
				return shape.value
			case .path(let shape):
				return shape.value
			case .rect(let shape):
				return shape.value
			case .xywh(let shape):
				return shape.value
		}
	}

	// circle( [ <shape-radius> ]? [ at <position> ]? )
	public struct Circle: Sendable {
		public init(radius: Length?) {
			self.radius = radius
		}
		public let radius: Length?
		public var value: String {
			if let radius = radius {
				return "circle(\(radius.value))"
			}
			return "circle()"
		}
	}

	// ellipse( [ <shape-radius>{2} ]? [ at <position> ]? )
	public struct Ellipse: Sendable {
		public init(radiusX: Length?, radiusY: Length?) {
			self.radiusX = radiusX
			self.radiusY = radiusY
		}
		public let radiusX: Length?
		public let radiusY: Length?

		public var value: String {
			if let rx = radiusX, let ry = radiusY {
				return "ellipse(\(rx.value) \(ry.value))"
			} else if let rx = radiusX {
				return "ellipse(\(rx.value))"
			}
			return "ellipse()"
		}
	}

	// polygon( [ <fill-rule>, ]? [ <length-percentage> <length-percentage> ]# )
	public struct Polygon: Sendable {
		public init(points: [(Length, Length)]) {
			self.points = points
		}
		public let points: [(Length, Length)]

		#if !os(WASI)
		public var value: String {
			let pointsStr = points.map { "\($0.0.value) \($0.1.value)" }.joined(separator: ", ")
			return "polygon(\(pointsStr))"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "polygon(".utf8)
			for (index, point) in points.enumerated() {
				if index > 0 {
					buffer.append(contentsOf: ", ".utf8)
				}
				buffer.append(contentsOf: point.0.value.utf8)
				buffer.append(32) // space
				buffer.append(contentsOf: point.1.value.utf8)
			}
			buffer.append(41) // ')'
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	// inset( <length-percentage>{1,4} [ round <border-radius> ]? )
	public struct Inset: Sendable {
		public init(top: Length, right: Length?, bottom: Length?, left: Length?) {
			self.top = top
			self.right = right
			self.bottom = bottom
			self.left = left
		}
		public let top: Length
		public let right: Length?
		public let bottom: Length?
		public let left: Length?

		public var value: String {
			if let left = left, let bottom = bottom, let right = right {
				return "inset(\(top.value) \(right.value) \(bottom.value) \(left.value))"
			} else if let bottom = bottom, let right = right {
				return "inset(\(top.value) \(right.value) \(bottom.value))"
			} else if let right = right {
				return "inset(\(top.value) \(right.value))"
			}
			return "inset(\(top.value))"
		}
	}

	// path( [ <fill-rule>, ]? <string> )
	public struct Path: Sendable {
		public let commands: [SVGPath.Definition.Command]

		#if !os(WASI)
		public var value: String {
			let pathStr = commands.map { $0.pathString }.joined(separator: " ")
			return "path('\(pathStr)')"
		}
		#endif

		#if os(WASI)
		public var value: String {
			var buffer: [UInt8] = []
			buffer.append(contentsOf: "path('".utf8)
			for (index, command) in commands.enumerated() {
				if index > 0 {
					buffer.append(32) // space
				}
				buffer.append(contentsOf: command.pathString.utf8)
			}
			buffer.append(contentsOf: "')".utf8)
			return String(decoding: buffer, as: UTF8.self)
		}
		#endif
	}

	// rect( [ <length-percentage> | auto ]{4} [ round <border-radius> ]? )
	public struct Rect: Sendable {
		public init(params: String) {
			self.params = params
		}
		public let params: String
		public var value: String {
			"rect(\(params))"
		}
	}

	// xywh( <length-percentage>{2} <length-percentage [0,∞]>{2} [ round <border-radius> ]? )
	public struct XYWH: Sendable {
		public init(x: Length, y: Length, width: Length, height: Length) {
			self.x = x
			self.y = y
			self.width = width
			self.height = height
		}
		public let x: Length
		public let y: Length
		public let width: Length
		public let height: Length
		public var value: String {
			"xywh(\(x.value) \(y.value) \(width.value) \(height.value))"
		}
	}

	// MARK: - Namespace for dot-prefix syntax

	/// Namespace struct to enable `.path()` syntax without shadowing SVGProtocol path()
	public struct Shapes: Sendable {}

	/// Static property to enable `.path()` syntax: e.g., `clipPath(.path(M(0, 0)))`
	public static let shape = Shapes()

	// MARK: - Convenience Static Methods

	public static func path(_ commands: SVGPath.Definition.Command...) -> CSSBasicShape {
		.path(Path(commands: commands))
	}

	public static func xywh(_ x: Length, _ y: Length, _ width: Length, _ height: Length) -> CSSBasicShape {
		.xywh(XYWH(x: x, y: y, width: width, height: height))
	}
}
