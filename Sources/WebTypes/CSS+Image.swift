#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  public enum Image: Sendable {
    case url(String)
    case imageFunc(ImageFunc)
    case imageSet(ImageSet)
    case crossFade(CrossFade)
    case element(Element)
    case gradient(Gradient)

    public var value: String {
      switch self {
      case .url(let urlValue):
        return WebTypes.url("\(urlValue)")
      case .imageFunc(let fn):
        return fn.value
      case .imageSet(let fn):
        return fn.value
      case .crossFade(let fn):
        return fn.value
      case .element(let fn):
        return fn.value
      case .gradient(let gradient):
        return gradient.value
      }
    }

    public struct ImageFunc: Sendable {
      public let tags: ImageTags?
      public let src: String?
      public let color: CSS.Color?

      public init(tags: ImageTags? = nil, src: String? = nil, color: CSS.Color? = nil) {
        self.tags = tags
        self.src = src
        self.color = color
      }

      #if SERVER
        public var value: String {
          var components: [String] = []
          if let tags = tags {
            components.append(tags.rawValue)
          }
          if let src = src {
            components.append(src)
          }
          if let color = color {
            components.append(color.value)
          }
          return "image(\(components.joined(separator: ", ")))"
        }
      #endif

      #if CLIENT
        public var value: String {
          var buffer: [UInt8] = []
          buffer.append(contentsOf: "image(".utf8)

          var hasContent = false
          if let tags = tags {
            buffer.append(contentsOf: tags.rawValue.utf8)
            hasContent = true
          }
          if let src = src {
            if hasContent { buffer.append(contentsOf: ", ".utf8) }
            buffer.append(contentsOf: src.utf8)
            hasContent = true
          }
          if let color = color {
            if hasContent { buffer.append(contentsOf: ", ".utf8) }
            buffer.append(contentsOf: color.value.utf8)
          }

          buffer.append(41)  // ')'
          return String(decoding: buffer, as: UTF8.self)
        }
      #endif
    }

    public enum ImageTags: String, Sendable {
      case ltr = "ltr"
      case rtl = "rtl"
    }

    public struct ImageSet: Sendable {
      public let options: [ImageSetOption]

      public init(_ options: [ImageSetOption]) {
        self.options = options
      }

      #if SERVER
        public var value: String {
          let opts = options.map { $0.value }.joined(separator: ", ")
          return "image-set(\(opts))"
        }
      #endif

      #if CLIENT
        public var value: String {
          var buffer: [UInt8] = []
          buffer.append(contentsOf: "image-set(".utf8)
          for (index, option) in options.enumerated() {
            if index > 0 {
              buffer.append(contentsOf: ", ".utf8)
            }
            buffer.append(contentsOf: option.value.utf8)
          }
          buffer.append(41)  // ')'
          return String(decoding: buffer, as: UTF8.self)
        }
      #endif
    }

    public struct ImageSetOption: Sendable {
      public let source: String  // Can be url or string
      public let resolution: String?
      public let type: String?

      public init(_ source: String, resolution: String? = nil, type: String? = nil) {
        self.source = source
        self.resolution = resolution
        self.type = type
      }

      public var value: String {
        var buffer: [UInt8] = []
        buffer.append(contentsOf: source.utf8)
        if let resolution = resolution {
          buffer.append(32)  // space
          buffer.append(contentsOf: resolution.utf8)
        }
        if let type = type {
          buffer.append(32)  // space
          buffer.append(contentsOf: "type(".utf8)
          buffer.append(contentsOf: type.utf8)
          buffer.append(41)  // ')'
        }
        return String(decoding: buffer, as: UTF8.self)
      }
    }

    public struct CrossFade: Sendable {
      public let images: [CrossFadeImage]

      public init(_ images: [CrossFadeImage]) {
        self.images = images
      }

      #if SERVER
        public var value: String {
          let imgs = images.map { $0.value }.joined(separator: ", ")
          return "cross-fade(\(imgs))"
        }
      #endif

      #if CLIENT
        public var value: String {
          var buffer: [UInt8] = []
          buffer.append(contentsOf: "cross-fade(".utf8)
          for (index, image) in images.enumerated() {
            if index > 0 {
              buffer.append(contentsOf: ", ".utf8)
            }
            buffer.append(contentsOf: image.value.utf8)
          }
          buffer.append(41)  // ')'
          return String(decoding: buffer, as: UTF8.self)
        }
      #endif
    }

    public struct CrossFadeImage: Sendable {
      public let imageOrColor: String  // Can be image or color
      public let percentage: CSS.Percentage?

      public init(_ imageOrColor: String, _ percentage: CSS.Percentage? = nil) {
        self.imageOrColor = imageOrColor
        self.percentage = percentage
      }

      public var value: String {
        if let percentage = percentage {
          return "\(imageOrColor) \(percentage.value)"
        }
        return imageOrColor
      }
    }

    public struct Element: Sendable {
      public let id: String

      public init(_ id: String) {
        self.id = id
      }

      public var value: String {
        "element(#\(id))"
      }
    }

    public enum Gradient: Sendable {
      case linear(LinearGradient)
      case repeatingLinear(RepeatingLinearGradient)
      case radial(RadialGradient)
      case repeatingRadial(RepeatingRadialGradient)
      case conic(ConicGradient)
      case repeatingConic(RepeatingConicGradient)

      public var value: String {
        switch self {
        case .linear(let gradient):
          return gradient.value
        case .repeatingLinear(let gradient):
          return gradient.value
        case .radial(let gradient):
          return gradient.value
        case .repeatingRadial(let gradient):
          return gradient.value
        case .conic(let gradient):
          return gradient.value
        case .repeatingConic(let gradient):
          return gradient.value
        }
      }

      public struct LinearGradient: Sendable {
        public let direction: GradientDirection?
        public let colorStops: [ColorStop]

        public init(direction: GradientDirection? = nil, colorStops: [ColorStop]) {
          self.direction = direction
          self.colorStops = colorStops
        }

        #if SERVER
          public var value: String {
            var components: [String] = []
            if let direction = direction {
              components.append(direction.value)
            }
            components.append(contentsOf: colorStops.map { $0.value })
            return "linear-gradient(\(components.joined(separator: ", ")))"
          }
        #endif

        #if CLIENT
          public var value: String {
            var buffer: [UInt8] = []
            buffer.append(contentsOf: "linear-gradient(".utf8)
            var first = true
            if let direction = direction {
              buffer.append(contentsOf: direction.value.utf8)
              first = false
            }
            for stop in colorStops {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: stop.value.utf8)
              first = false
            }
            buffer.append(41)  // ')'
            return String(decoding: buffer, as: UTF8.self)
          }
        #endif
      }

      public struct RepeatingLinearGradient: Sendable {
        public let direction: GradientDirection?
        public let colorStops: [ColorStop]

        public init(direction: GradientDirection? = nil, colorStops: [ColorStop]) {
          self.direction = direction
          self.colorStops = colorStops
        }

        #if SERVER
          public var value: String {
            var components: [String] = []
            if let direction = direction {
              components.append(direction.value)
            }
            components.append(contentsOf: colorStops.map { $0.value })
            return "repeating-linear-gradient(\(components.joined(separator: ", ")))"
          }
        #endif

        #if CLIENT
          public var value: String {
            var buffer: [UInt8] = []
            buffer.append(contentsOf: "repeating-linear-gradient(".utf8)
            var first = true
            if let direction = direction {
              buffer.append(contentsOf: direction.value.utf8)
              first = false
            }
            for stop in colorStops {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: stop.value.utf8)
              first = false
            }
            buffer.append(41)  // ')'
            return String(decoding: buffer, as: UTF8.self)
          }
        #endif
      }

      public struct RadialGradient: Sendable {
        public let shape: RadialShape?
        public let size: RadialSize?
        public let position: CSS.MaskLayer.Position?
        public let colorStops: [ColorStop]

        public init(
          shape: RadialShape? = nil, size: RadialSize? = nil, position: CSS.MaskLayer.Position? = nil,
          colorStops: [ColorStop]
        ) {
          self.shape = shape
          self.size = size
          self.position = position
          self.colorStops = colorStops
        }

        #if SERVER
          public var value: String {
            var components: [String] = []
            var shapeAndSize: [String] = []
            if let shape = shape {
              shapeAndSize.append(shape.rawValue)
            }
            if let size = size {
              shapeAndSize.append(size.value)
            }
            if !shapeAndSize.isEmpty {
              components.append(shapeAndSize.joined(separator: " "))
            }
            if let position = position {
              components.append("at \(position.value)")
            }
            components.append(contentsOf: colorStops.map { $0.value })
            return "radial-gradient(\(components.joined(separator: ", ")))"
          }
        #endif

        #if CLIENT
          public var value: String {
            var buffer: [UInt8] = []
            buffer.append(contentsOf: "radial-gradient(".utf8)
            var first = true

            // Handle shape and size
            if let shape = shape {
              buffer.append(contentsOf: shape.rawValue.utf8)
              first = false
            }
            if let size = size {
              if !first {
                buffer.append(32)  // space
              }
              buffer.append(contentsOf: size.value.utf8)
              first = false
            }

            // Handle position
            if let position = position {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: "at ".utf8)
              buffer.append(contentsOf: position.value.utf8)
              first = false
            }

            // Handle color stops
            for stop in colorStops {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: stop.value.utf8)
              first = false
            }

            buffer.append(41)  // ')'
            return String(decoding: buffer, as: UTF8.self)
          }
        #endif
      }

      public struct RepeatingRadialGradient: Sendable {
        public let shape: RadialShape?
        public let size: RadialSize?
        public let position: CSS.MaskLayer.Position?
        public let colorStops: [ColorStop]

        public init(
          shape: RadialShape? = nil, size: RadialSize? = nil, position: CSS.MaskLayer.Position? = nil,
          colorStops: [ColorStop]
        ) {
          self.shape = shape
          self.size = size
          self.position = position
          self.colorStops = colorStops
        }

        #if SERVER
          public var value: String {
            var components: [String] = []
            var shapeAndSize: [String] = []
            if let shape = shape {
              shapeAndSize.append(shape.rawValue)
            }
            if let size = size {
              shapeAndSize.append(size.value)
            }
            if !shapeAndSize.isEmpty {
              components.append(shapeAndSize.joined(separator: " "))
            }
            if let position = position {
              components.append("at \(position.value)")
            }
            components.append(contentsOf: colorStops.map { $0.value })
            return "repeating-radial-gradient(\(components.joined(separator: ", ")))"
          }
        #endif

        #if CLIENT
          public var value: String {
            var buffer: [UInt8] = []
            buffer.append(contentsOf: "repeating-radial-gradient(".utf8)
            var first = true

            // Handle shape and size
            if let shape = shape {
              buffer.append(contentsOf: shape.rawValue.utf8)
              first = false
            }
            if let size = size {
              if !first {
                buffer.append(32)  // space
              }
              buffer.append(contentsOf: size.value.utf8)
              first = false
            }

            // Handle position
            if let position = position {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: "at ".utf8)
              buffer.append(contentsOf: position.value.utf8)
              first = false
            }

            // Handle color stops
            for stop in colorStops {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: stop.value.utf8)
              first = false
            }

            buffer.append(41)  // ')'
            return String(decoding: buffer, as: UTF8.self)
          }
        #endif
      }

      public struct ConicGradient: Sendable {
        public let angle: CSS.Angle?
        public let position: CSS.MaskLayer.Position?
        public let colorStops: [ColorStop]

        public init(
          from angle: CSS.Angle? = nil, at position: CSS.MaskLayer.Position? = nil,
          colorStops: [ColorStop]
        ) {
          self.angle = angle
          self.position = position
          self.colorStops = colorStops
        }

        #if SERVER
          public var value: String {
            var components: [String] = []
            if let angle = angle {
              components.append("from \(angle.value)")
            }
            if let position = position {
              components.append("at \(position.value)")
            }
            components.append(contentsOf: colorStops.map { $0.value })
            return "conic-gradient(\(components.joined(separator: ", ")))"
          }
        #endif

        #if CLIENT
          public var value: String {
            var buffer: [UInt8] = []
            buffer.append(contentsOf: "conic-gradient(".utf8)
            var first = true

            if let angle = angle {
              buffer.append(contentsOf: "from ".utf8)
              buffer.append(contentsOf: angle.value.utf8)
              first = false
            }

            if let position = position {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: "at ".utf8)
              buffer.append(contentsOf: position.value.utf8)
              first = false
            }

            for stop in colorStops {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: stop.value.utf8)
              first = false
            }

            buffer.append(41)  // ')'
            return String(decoding: buffer, as: UTF8.self)
          }
        #endif
      }

      public struct RepeatingConicGradient: Sendable {
        public let angle: CSS.Angle?
        public let position: CSS.MaskLayer.Position?
        public let colorStops: [ColorStop]

        public init(
          from angle: CSS.Angle? = nil, at position: CSS.MaskLayer.Position? = nil,
          colorStops: [ColorStop]
        ) {
          self.angle = angle
          self.position = position
          self.colorStops = colorStops
        }

        #if SERVER
          public var value: String {
            var components: [String] = []
            if let angle = angle {
              components.append("from \(angle.value)")
            }
            if let position = position {
              components.append("at \(position.value)")
            }
            components.append(contentsOf: colorStops.map { $0.value })
            return "repeating-conic-gradient(\(components.joined(separator: ", ")))"
          }
        #endif

        #if CLIENT
          public var value: String {
            var buffer: [UInt8] = []
            buffer.append(contentsOf: "repeating-conic-gradient(".utf8)
            var first = true

            if let angle = angle {
              buffer.append(contentsOf: "from ".utf8)
              buffer.append(contentsOf: angle.value.utf8)
              first = false
            }

            if let position = position {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: "at ".utf8)
              buffer.append(contentsOf: position.value.utf8)
              first = false
            }

            for stop in colorStops {
              if !first {
                buffer.append(contentsOf: ", ".utf8)
              }
              buffer.append(contentsOf: stop.value.utf8)
              first = false
            }

            buffer.append(41)  // ')'
            return String(decoding: buffer, as: UTF8.self)
          }
        #endif
      }

      // Gradient direction for linear gradients
      public enum GradientDirection: Sendable {
        case angle(CSS.Angle)
        case toSide(CSS.GradientDirection)

        public var value: String {
          switch self {
          case .angle(let angle):
            return angle.value
          case .toSide(let side):
            return side.rawValue
          }
        }
      }

      // Radial gradient shape
      public enum RadialShape: String, Sendable {
        case circle = "circle"
        case ellipse = "ellipse"
      }

      // Radial gradient size
      public enum RadialSize: Sendable {
        case closestSide
        case closestCorner
        case farthestSide
        case farthestCorner
        case length(CSS.Length)
        case twoLengths(CSS.Length, CSS.Length)

        public var value: String {
          switch self {
          case .closestSide:
            return "closest-side"
          case .closestCorner:
            return "closest-corner"
          case .farthestSide:
            return "farthest-side"
          case .farthestCorner:
            return "farthest-corner"
          case .length(let length):
            return length.value
          case .twoLengths(let l1, let l2):
            return "\(l1.value) \(l2.value)"
          }
        }
      }

      // Color stop for gradients
      public struct ColorStop: Sendable {
        public let color: CSS.Color
        public let position: CSS.Length?

        public init(_ color: CSS.Color, _ position: CSS.Length? = nil) {
          self.color = color
          self.position = position
        }

        public init(_ color: CSS.Color, _ position: CSS.Percentage?) {
          self.color = color
          self.position = position.map { CSS.Length($0.value) }
        }

        public var value: String {
          if let position = position {
            return "\(color.value) \(position.value)"
          }
          return color.value
        }
      }
    }
  }
}

// MARK: - Convenience helper functions

// Linear gradient
public func linearGradient(
  to direction: CSS.GradientDirection, _ first: (CSS.Color, CSS.Percentage),
  _ rest: (CSS.Color, CSS.Percentage)...
) -> CSS.Image.Gradient {
  var stops = [CSS.Image.Gradient.ColorStop(first.0, first.1)]
  stops.append(contentsOf: rest.map { CSS.Image.Gradient.ColorStop($0.0, $0.1) })
  return .linear(CSS.Image.Gradient.LinearGradient(direction: .toSide(direction), colorStops: stops))
}

// Linear gradient
public func linearGradient(
  to direction: CSS.GradientDirection, _ first: CSS.Color, _ rest: CSS.Color...
) -> CSS.Image.Gradient {
  var stops = [CSS.Image.Gradient.ColorStop(first)]
  stops.append(contentsOf: rest.map { CSS.Image.Gradient.ColorStop($0) })
  return .linear(CSS.Image.Gradient.LinearGradient(direction: .toSide(direction), colorStops: stops))
}

// Linear gradient with angle
public func linearGradient(
  _ angle: CSS.Angle, _ first: (CSS.Color, CSS.Percentage), _ rest: (CSS.Color, CSS.Percentage)...
) -> CSS.Image.Gradient {
  var stops = [CSS.Image.Gradient.ColorStop(first.0, first.1)]
  stops.append(contentsOf: rest.map { CSS.Image.Gradient.ColorStop($0.0, $0.1) })
  return .linear(CSS.Image.Gradient.LinearGradient(direction: .angle(angle), colorStops: stops))
}

// Linear gradient with angle
public func linearGradient(_ angle: CSS.Angle, _ first: CSS.Color, _ rest: CSS.Color...)
  -> CSS.Image.Gradient
{
  var stops = [CSS.Image.Gradient.ColorStop(first)]
  stops.append(contentsOf: rest.map { CSS.Image.Gradient.ColorStop($0) })
  return .linear(CSS.Image.Gradient.LinearGradient(direction: .angle(angle), colorStops: stops))
}

// Radial gradient
public func radialGradient(
  _ shape: CSS.Image.Gradient.RadialShape, at position: CSS.MaskLayer.Position? = nil,
  _ first: (CSS.Color, CSS.Percentage), _ rest: (CSS.Color, CSS.Percentage)...
) -> CSS.Image.Gradient {
  var stops = [CSS.Image.Gradient.ColorStop(first.0, first.1)]
  stops.append(contentsOf: rest.map { CSS.Image.Gradient.ColorStop($0.0, $0.1) })
  return .radial(
    CSS.Image.Gradient.RadialGradient(shape: shape, size: nil, position: position, colorStops: stops)
  )
}

// Radial gradient
public func radialGradient(
  _ shape: CSS.Image.Gradient.RadialShape, at position: CSS.MaskLayer.Position? = nil,
  _ first: CSS.Color, _ rest: CSS.Color...
) -> CSS.Image.Gradient {
  var stops = [CSS.Image.Gradient.ColorStop(first)]
  stops.append(contentsOf: rest.map { CSS.Image.Gradient.ColorStop($0) })
  return .radial(
    CSS.Image.Gradient.RadialGradient(shape: shape, size: nil, position: position, colorStops: stops)
  )
}

// Conic gradient - 2 stops
public func conicGradient(
  from angle: CSS.Angle? = nil, at position: CSS.MaskLayer.Position? = nil,
  _ stops: (CSS.Color, CSS.Color)
) -> CSS.Image.Gradient {
  .conic(
    CSS.Image.Gradient.ConicGradient(
      from: angle, at: position,
      colorStops: [
        CSS.Image.Gradient.ColorStop(stops.0),
        CSS.Image.Gradient.ColorStop(stops.1),
      ]))
}

// Conic gradient - 3 stops
public func conicGradient(
  from angle: CSS.Angle? = nil, at position: CSS.MaskLayer.Position? = nil,
  _ stops: (CSS.Color, CSS.Color, CSS.Color)
) -> CSS.Image.Gradient {
  .conic(
    CSS.Image.Gradient.ConicGradient(
      from: angle, at: position,
      colorStops: [
        CSS.Image.Gradient.ColorStop(stops.0),
        CSS.Image.Gradient.ColorStop(stops.1),
        CSS.Image.Gradient.ColorStop(stops.2),
      ]))
}

// Conic gradient - 4 stops
public func conicGradient(
  from angle: CSS.Angle? = nil, at position: CSS.MaskLayer.Position? = nil,
  _ stops: (CSS.Color, CSS.Color, CSS.Color, CSS.Color)
) -> CSS.Image.Gradient {
  .conic(
    CSS.Image.Gradient.ConicGradient(
      from: angle, at: position,
      colorStops: [
        CSS.Image.Gradient.ColorStop(stops.0),
        CSS.Image.Gradient.ColorStop(stops.1),
        CSS.Image.Gradient.ColorStop(stops.2),
        CSS.Image.Gradient.ColorStop(stops.3),
      ]))
}

// Conic gradient - with positioned stops (color, angle pairs)
public func conicGradient(
  from angle: CSS.Angle? = nil, at position: CSS.MaskLayer.Position? = nil,
  _ stops: (CSS.Color, CSS.Angle)...
) -> CSS.Image.Gradient {
  .conic(
    CSS.Image.Gradient.ConicGradient(
      from: angle, at: position,
      colorStops: stops.map {
        CSS.Image.Gradient.ColorStop($0.0, CSS.Length($0.1.value))
      }))
}
