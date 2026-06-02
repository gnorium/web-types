#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  public enum BasicShape: Sendable {
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

    public struct Circle: Sendable {
      public init(radius: CSS.Length?) {
        self.radius = radius
      }
      public let radius: CSS.Length?
      public var value: String {
        if let radius = radius {
          return "circle(\(radius.value))"
        }
        return "circle()"
      }
    }

    public struct Ellipse: Sendable {
      public init(radiusX: CSS.Length?, radiusY: CSS.Length?) {
        self.radiusX = radiusX
        self.radiusY = radiusY
      }
      public let radiusX: CSS.Length?
      public let radiusY: CSS.Length?

      public var value: String {
        if let rx = radiusX, let ry = radiusY {
          return "ellipse(\(rx.value) \(ry.value))"
        } else if let rx = radiusX {
          return "ellipse(\(rx.value))"
        }
        return "ellipse()"
      }
    }

    public struct Polygon: Sendable {
      public init(points: [(CSS.Length, CSS.Length)]) {
        self.points = points
      }
      public let points: [(CSS.Length, CSS.Length)]

      #if SERVER
        public var value: String {
          let pointsStr = points.map { "\($0.0.value) \($0.1.value)" }.joined(separator: ", ")
          return "polygon(\(pointsStr))"
        }
      #endif

      #if CLIENT
        public var value: String {
          var buffer: [UInt8] = []
          buffer.append(contentsOf: "polygon(".utf8)
          for (index, point) in points.enumerated() {
            if index > 0 {
              buffer.append(contentsOf: ", ".utf8)
            }
            buffer.append(contentsOf: point.0.value.utf8)
            buffer.append(32)  // space
            buffer.append(contentsOf: point.1.value.utf8)
          }
          buffer.append(41)  // ')'
          return String(decoding: buffer, as: UTF8.self)
        }
      #endif
    }

    public struct Inset: Sendable {
      public init(top: CSS.Length, right: CSS.Length?, bottom: CSS.Length?, left: CSS.Length?) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
      }
      public let top: CSS.Length
      public let right: CSS.Length?
      public let bottom: CSS.Length?
      public let left: CSS.Length?

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

    public struct Path: Sendable {
      public let commands: [SVG.Path.Definition.Command]

      #if SERVER
        public var value: String {
          let pathStr = commands.map { $0.pathString }.joined(separator: " ")
          return "path('\(pathStr)')"
        }
      #endif

      #if CLIENT
        public var value: String {
          var buffer: [UInt8] = []
          buffer.append(contentsOf: "path('".utf8)
          for (index, command) in commands.enumerated() {
            if index > 0 {
              buffer.append(32)  // space
            }
            buffer.append(contentsOf: command.pathString.utf8)
          }
          buffer.append(contentsOf: "')".utf8)
          return String(decoding: buffer, as: UTF8.self)
        }
      #endif
    }

    public struct Rect: Sendable {
      public init(params: String) {
        self.params = params
      }
      public let params: String
      public var value: String {
        "rect(\(params))"
      }
    }

    public struct XYWH: Sendable {
      public init(x: CSS.Length, y: CSS.Length, width: CSS.Length, height: CSS.Length) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
      }
      public let x: CSS.Length
      public let y: CSS.Length
      public let width: CSS.Length
      public let height: CSS.Length
      public var value: String {
        "xywh(\(x.value) \(y.value) \(width.value) \(height.value))"
      }
    }

    // MARK: - Namespace for dot-prefix syntax

    /// Namespace struct to enable `.path()` syntax without shadowing SVGContent path()
    public struct Shapes: Sendable {}

    /// Static property to enable `.path()` syntax: e.g., `clipPath(.path(M(0, 0)))`
    public static let shape = Shapes()

    // MARK: - Convenience Static Methods

    public static func path(_ commands: SVG.Path.Definition.Command...) -> CSS.BasicShape {
      .path(Path(commands: commands))
    }

    public static func xywh(_ x: CSS.Length, _ y: CSS.Length, _ width: CSS.Length, _ height: CSS.Length) -> CSS.BasicShape
    {
      .xywh(XYWH(x: x, y: y, width: width, height: height))
    }
  }
}
