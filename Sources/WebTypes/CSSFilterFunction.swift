#if CLIENT
  import EmbeddedSwiftUtilities
#endif

public enum CSSFilterFunction: Sendable {
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
    public let length: Length?

    public init(_ length: Length? = nil) {
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

    public init(_ value: CSSNumber? = nil) {
      self.numPerc = value?.value
    }

    public init(_ value: Percentage) {
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

    public init(_ value: CSSNumber? = nil) {
      self.numPerc = value?.value
    }

    public init(_ value: Percentage) {
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

    public init(_ value: CSSNumber? = nil) {
      self.numPerc = value?.value
    }

    public init(_ value: Percentage) {
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

    public init(_ value: CSSNumber? = nil) {
      self.numPerc = value?.value
    }

    public init(_ value: Percentage) {
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

    public init(_ value: CSSNumber? = nil) {
      self.numPerc = value?.value
    }

    public init(_ value: Percentage) {
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

    public init(_ value: CSSNumber? = nil) {
      self.numPerc = value?.value
    }

    public init(_ value: Percentage) {
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

    public init(_ value: CSSNumber? = nil) {
      self.numPerc = value?.value
    }

    public init(_ value: Percentage) {
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
    public let angle: CSSAngle?

    public init(_ angle: CSSAngle? = nil) {
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
    public let offsetX: Length
    public let offsetY: Length
    public let blurRadius: Length?

    public init(
      color: CSSColor,
      offsetX: Length,
      offsetY: Length,
      blurRadius: Length? = nil
    ) {
      self.colorValue = color.value
      self.offsetX = offsetX
      self.offsetY = offsetY
      self.blurRadius = blurRadius
    }

    public init(
      offsetX: Length,
      offsetY: Length,
      blurRadius: Length? = nil
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

// Convenience helper functions
public func blur(_ length: Length? = nil) -> CSSFilterFunction {
  .blur(CSSFilterFunction.Blur(length))
}

public func brightness(_ value: CSSNumber? = nil) -> CSSFilterFunction {
  .brightness(CSSFilterFunction.Brightness(value))
}

public func brightness(_ value: Percentage) -> CSSFilterFunction {
  .brightness(CSSFilterFunction.Brightness(value))
}

public func brightness(_ value: Int) -> CSSFilterFunction {
  .brightness(CSSFilterFunction.Brightness(value))
}

public func brightness(_ value: Double) -> CSSFilterFunction {
  .brightness(CSSFilterFunction.Brightness(value))
}

public func contrast(_ value: CSSNumber? = nil) -> CSSFilterFunction {
  .contrast(CSSFilterFunction.Contrast(value))
}

public func contrast(_ value: Percentage) -> CSSFilterFunction {
  .contrast(CSSFilterFunction.Contrast(value))
}

public func contrast(_ value: Int) -> CSSFilterFunction {
  .contrast(CSSFilterFunction.Contrast(value))
}

public func contrast(_ value: Double) -> CSSFilterFunction {
  .contrast(CSSFilterFunction.Contrast(value))
}

public func grayscale(_ value: CSSNumber? = nil) -> CSSFilterFunction {
  .grayscale(CSSFilterFunction.Grayscale(value))
}

public func grayscale(_ value: Percentage) -> CSSFilterFunction {
  .grayscale(CSSFilterFunction.Grayscale(value))
}

public func grayscale(_ value: Int) -> CSSFilterFunction {
  .grayscale(CSSFilterFunction.Grayscale(value))
}

public func grayscale(_ value: Double) -> CSSFilterFunction {
  .grayscale(CSSFilterFunction.Grayscale(value))
}

public func hueRotate(_ angle: CSSAngle? = nil) -> CSSFilterFunction {
  .hueRotate(CSSFilterFunction.HueRotate(angle))
}

public func invert(_ value: CSSNumber? = nil) -> CSSFilterFunction {
  .invert(CSSFilterFunction.Invert(value))
}

public func invert(_ value: Percentage) -> CSSFilterFunction {
  .invert(CSSFilterFunction.Invert(value))
}

public func invert(_ value: Int) -> CSSFilterFunction {
  .invert(CSSFilterFunction.Invert(value))
}

public func invert(_ value: Double) -> CSSFilterFunction {
  .invert(CSSFilterFunction.Invert(value))
}

public func opacity(_ value: CSSNumber? = nil) -> CSSFilterFunction {
  .opacity(CSSFilterFunction.Opacity(value))
}

public func opacity(_ value: Percentage) -> CSSFilterFunction {
  .opacity(CSSFilterFunction.Opacity(value))
}

public func opacity(_ value: Int) -> CSSFilterFunction {
  .opacity(CSSFilterFunction.Opacity(value))
}

public func opacity(_ value: Double) -> CSSFilterFunction {
  .opacity(CSSFilterFunction.Opacity(value))
}

public func sepia(_ value: CSSNumber? = nil) -> CSSFilterFunction {
  .sepia(CSSFilterFunction.Sepia(value))
}

public func sepia(_ value: Percentage) -> CSSFilterFunction {
  .sepia(CSSFilterFunction.Sepia(value))
}

public func sepia(_ value: Int) -> CSSFilterFunction {
  .sepia(CSSFilterFunction.Sepia(value))
}

public func sepia(_ value: Double) -> CSSFilterFunction {
  .sepia(CSSFilterFunction.Sepia(value))
}

public func saturate(_ value: CSSNumber? = nil) -> CSSFilterFunction {
  .saturate(CSSFilterFunction.Saturate(value))
}

public func saturate(_ value: Percentage) -> CSSFilterFunction {
  .saturate(CSSFilterFunction.Saturate(value))
}

public func saturate(_ value: Int) -> CSSFilterFunction {
  .saturate(CSSFilterFunction.Saturate(value))
}

public func saturate(_ value: Double) -> CSSFilterFunction {
  .saturate(CSSFilterFunction.Saturate(value))
}

public func dropShadow(
  _ color: CSSColor, _ offsetX: Length, _ offsetY: Length, _ blurRadius: Length? = nil
) -> CSSFilterFunction {
  .dropShadow(
    CSSFilterFunction.DropShadow(
      color: color, offsetX: offsetX, offsetY: offsetY, blurRadius: blurRadius))
}

public func dropShadow(_ offsetX: Length, _ offsetY: Length, _ blurRadius: Length? = nil)
  -> CSSFilterFunction
{
  .dropShadow(
    CSSFilterFunction.DropShadow(offsetX: offsetX, offsetY: offsetY, blurRadius: blurRadius))
}
