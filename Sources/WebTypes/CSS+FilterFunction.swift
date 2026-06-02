#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  public enum FilterFunction: Sendable {
    case blur(Blur)
    case brightness(Brightness)
    case contrast(Contrast)
    case dropShadow(DropShadow)
    case grayscale(Grayscale)
    case hueRotate(HueRotate)
    case invert(Invert)
    case opacity(Opacity)
    case sepia(Sepia)
    case saturate(Saturate)
    case url(String)

    public var value: String {
      switch self {
      case .blur(let filter):
        return filter.value
      case .brightness(let filter):
        return filter.value
      case .contrast(let filter):
        return filter.value
      case .dropShadow(let filter):
        return filter.value
      case .grayscale(let filter):
        return filter.value
      case .hueRotate(let filter):
        return filter.value
      case .invert(let filter):
        return filter.value
      case .opacity(let filter):
        return filter.value
      case .sepia(let filter):
        return filter.value
      case .saturate(let filter):
        return filter.value
      case .url(let value):
        return "url(\(value))"
      }
    }

    public struct Blur: Sendable {
      public let length: CSS.Length?

      public init(_ length: CSS.Length? = nil) {
        self.length = length
      }

      public var value: String {
        if let length = length {
          return "blur(\(length.value))"
        }
        return "blur()"
      }
    }

    public struct Brightness: Sendable {
      private let numPerc: String?

      public init(_ value: CSS.Number? = nil) {
        self.numPerc = value?.value
      }

      public init(_ value: CSS.Percentage) {
        self.numPerc = value.value
      }

      public init(_ value: Int) {
        self.numPerc = "\(value)"
      }

      public init(_ value: Double) {
        self.numPerc = "\(value)"
      }

      public var value: String {
        if let numPerc = numPerc {
          return "brightness(\(numPerc))"
        }
        return "brightness()"
      }
    }

    public struct Contrast: Sendable {
      private let numPerc: String?

      public init(_ value: CSS.Number? = nil) {
        self.numPerc = value?.value
      }

      public init(_ value: CSS.Percentage) {
        self.numPerc = value.value
      }

      public init(_ value: Int) {
        self.numPerc = "\(value)"
      }

      public init(_ value: Double) {
        self.numPerc = "\(value)"
      }

      public var value: String {
        if let numPerc = numPerc {
          return "contrast(\(numPerc))"
        }
        return "contrast()"
      }
    }

    public struct Grayscale: Sendable {
      private let numPerc: String?

      public init(_ value: CSS.Number? = nil) {
        self.numPerc = value?.value
      }

      public init(_ value: CSS.Percentage) {
        self.numPerc = value.value
      }

      public init(_ value: Int) {
        self.numPerc = "\(value)"
      }

      public init(_ value: Double) {
        self.numPerc = "\(value)"
      }

      public var value: String {
        if let numPerc = numPerc {
          return "grayscale(\(numPerc))"
        }
        return "grayscale()"
      }
    }

    public struct Invert: Sendable {
      private let numPerc: String?

      public init(_ value: CSS.Number? = nil) {
        self.numPerc = value?.value
      }

      public init(_ value: CSS.Percentage) {
        self.numPerc = value.value
      }

      public init(_ value: Int) {
        self.numPerc = "\(value)"
      }

      public init(_ value: Double) {
        self.numPerc = "\(value)"
      }

      public var value: String {
        if let numPerc = numPerc {
          return "invert(\(numPerc))"
        }
        return "invert()"
      }
    }

    public struct Opacity: Sendable {
      private let numPerc: String?

      public init(_ value: CSS.Number? = nil) {
        self.numPerc = value?.value
      }

      public init(_ value: CSS.Percentage) {
        self.numPerc = value.value
      }

      public init(_ value: Int) {
        self.numPerc = "\(value)"
      }

      public init(_ value: Double) {
        self.numPerc = "\(value)"
      }

      public var value: String {
        if let numPerc = numPerc {
          return "opacity(\(numPerc))"
        }
        return "opacity()"
      }
    }

    public struct Sepia: Sendable {
      private let numPerc: String?

      public init(_ value: CSS.Number? = nil) {
        self.numPerc = value?.value
      }

      public init(_ value: CSS.Percentage) {
        self.numPerc = value.value
      }

      public init(_ value: Int) {
        self.numPerc = "\(value)"
      }

      public init(_ value: Double) {
        self.numPerc = "\(value)"
      }

      public var value: String {
        if let numPerc = numPerc {
          return "sepia(\(numPerc))"
        }
        return "sepia()"
      }
    }

    public struct Saturate: Sendable {
      private let numPerc: String?

      public init(_ value: CSS.Number? = nil) {
        self.numPerc = value?.value
      }

      public init(_ value: CSS.Percentage) {
        self.numPerc = value.value
      }

      public init(_ value: Int) {
        self.numPerc = "\(value)"
      }

      public init(_ value: Double) {
        self.numPerc = "\(value)"
      }

      public var value: String {
        if let numPerc = numPerc {
          return "saturate(\(numPerc))"
        }
        return "saturate()"
      }
    }

    public struct HueRotate: Sendable {
      public let angle: CSS.Angle?

      public init(_ angle: CSS.Angle? = nil) {
        self.angle = angle
      }

      public var value: String {
        if let angle = angle {
          return "hue-rotate(\(angle.value))"
        }
        return "hue-rotate()"
      }
    }

    public struct DropShadow: Sendable {
      private let colorValue: String?
      public let offsetX: CSS.Length
      public let offsetY: CSS.Length
      public let blurRadius: CSS.Length?

      public init(
        color: CSS.Color,
        offsetX: CSS.Length,
        offsetY: CSS.Length,
        blurRadius: CSS.Length? = nil
      ) {
        self.colorValue = color.value
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
      }

      public init(
        offsetX: CSS.Length,
        offsetY: CSS.Length,
        blurRadius: CSS.Length? = nil
      ) {
        self.colorValue = nil
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
      }

      #if SERVER
        public var value: String {
          var components: [String] = []
          if let colorValue = colorValue {
            components.append(colorValue)
          }
          components.append(offsetX.value)
          components.append(offsetY.value)
          if let blurRadius = blurRadius {
            components.append(blurRadius.value)
          }
          return "drop-shadow(\(components.joined(separator: " ")))"
        }
      #endif

      #if CLIENT
        public var value: String {
          var buffer: [UInt8] = []
          buffer.append(contentsOf: "drop-shadow(".utf8)
          var hasContent = false
          if let colorValue = colorValue {
            buffer.append(contentsOf: colorValue.utf8)
            hasContent = true
          }
          if hasContent { buffer.append(32) }
          buffer.append(contentsOf: offsetX.value.utf8)
          buffer.append(32)
          buffer.append(contentsOf: offsetY.value.utf8)
          if let blurRadius = blurRadius {
            buffer.append(32)
            buffer.append(contentsOf: blurRadius.value.utf8)
          }
          buffer.append(41)  // ')'
          return String(decoding: buffer, as: UTF8.self)
        }
      #endif
    }
  }
}

// Convenience helper functions
public func blur(_ length: CSS.Length? = nil) -> CSS.FilterFunction {
  .blur(CSS.FilterFunction.Blur(length))
}

public func brightness(_ value: CSS.Number? = nil) -> CSS.FilterFunction {
  .brightness(CSS.FilterFunction.Brightness(value))
}

public func brightness(_ value: CSS.Percentage) -> CSS.FilterFunction {
  .brightness(CSS.FilterFunction.Brightness(value))
}

public func brightness(_ value: Int) -> CSS.FilterFunction {
  .brightness(CSS.FilterFunction.Brightness(value))
}

public func brightness(_ value: Double) -> CSS.FilterFunction {
  .brightness(CSS.FilterFunction.Brightness(value))
}

public func contrast(_ value: CSS.Number? = nil) -> CSS.FilterFunction {
  .contrast(CSS.FilterFunction.Contrast(value))
}

public func contrast(_ value: CSS.Percentage) -> CSS.FilterFunction {
  .contrast(CSS.FilterFunction.Contrast(value))
}

public func contrast(_ value: Int) -> CSS.FilterFunction {
  .contrast(CSS.FilterFunction.Contrast(value))
}

public func contrast(_ value: Double) -> CSS.FilterFunction {
  .contrast(CSS.FilterFunction.Contrast(value))
}

public func grayscale(_ value: CSS.Number? = nil) -> CSS.FilterFunction {
  .grayscale(CSS.FilterFunction.Grayscale(value))
}

public func grayscale(_ value: CSS.Percentage) -> CSS.FilterFunction {
  .grayscale(CSS.FilterFunction.Grayscale(value))
}

public func grayscale(_ value: Int) -> CSS.FilterFunction {
  .grayscale(CSS.FilterFunction.Grayscale(value))
}

public func grayscale(_ value: Double) -> CSS.FilterFunction {
  .grayscale(CSS.FilterFunction.Grayscale(value))
}

public func hueRotate(_ angle: CSS.Angle? = nil) -> CSS.FilterFunction {
  .hueRotate(CSS.FilterFunction.HueRotate(angle))
}

public func invert(_ value: CSS.Number? = nil) -> CSS.FilterFunction {
  .invert(CSS.FilterFunction.Invert(value))
}

public func invert(_ value: CSS.Percentage) -> CSS.FilterFunction {
  .invert(CSS.FilterFunction.Invert(value))
}

public func invert(_ value: Int) -> CSS.FilterFunction {
  .invert(CSS.FilterFunction.Invert(value))
}

public func invert(_ value: Double) -> CSS.FilterFunction {
  .invert(CSS.FilterFunction.Invert(value))
}

public func opacity(_ value: CSS.Number? = nil) -> CSS.FilterFunction {
  .opacity(CSS.FilterFunction.Opacity(value))
}

public func opacity(_ value: CSS.Percentage) -> CSS.FilterFunction {
  .opacity(CSS.FilterFunction.Opacity(value))
}

public func opacity(_ value: Int) -> CSS.FilterFunction {
  .opacity(CSS.FilterFunction.Opacity(value))
}

public func opacity(_ value: Double) -> CSS.FilterFunction {
  .opacity(CSS.FilterFunction.Opacity(value))
}

public func sepia(_ value: CSS.Number? = nil) -> CSS.FilterFunction {
  .sepia(CSS.FilterFunction.Sepia(value))
}

public func sepia(_ value: CSS.Percentage) -> CSS.FilterFunction {
  .sepia(CSS.FilterFunction.Sepia(value))
}

public func sepia(_ value: Int) -> CSS.FilterFunction {
  .sepia(CSS.FilterFunction.Sepia(value))
}

public func sepia(_ value: Double) -> CSS.FilterFunction {
  .sepia(CSS.FilterFunction.Sepia(value))
}

public func saturate(_ value: CSS.Number? = nil) -> CSS.FilterFunction {
  .saturate(CSS.FilterFunction.Saturate(value))
}

public func saturate(_ value: CSS.Percentage) -> CSS.FilterFunction {
  .saturate(CSS.FilterFunction.Saturate(value))
}

public func saturate(_ value: Int) -> CSS.FilterFunction {
  .saturate(CSS.FilterFunction.Saturate(value))
}

public func saturate(_ value: Double) -> CSS.FilterFunction {
  .saturate(CSS.FilterFunction.Saturate(value))
}

public func dropShadow(
  _ color: CSS.Color, _ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blurRadius: CSS.Length? = nil
) -> CSS.FilterFunction {
  .dropShadow(
    CSS.FilterFunction.DropShadow(
      color: color, offsetX: offsetX, offsetY: offsetY, blurRadius: blurRadius))
}

public func dropShadow(_ offsetX: CSS.Length, _ offsetY: CSS.Length, _ blurRadius: CSS.Length? = nil)
  -> CSS.FilterFunction
{
  .dropShadow(
    CSS.FilterFunction.DropShadow(offsetX: offsetX, offsetY: offsetY, blurRadius: blurRadius))
}
