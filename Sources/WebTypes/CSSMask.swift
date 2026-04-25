#if CLIENT
  import EmbeddedSwiftUtilities
#endif

// MARK: - Mask Related Types

public struct CSSMaskLayer: Sendable {
  public let reference: MaskReference?
  public let position: Position?
  public let size: BgSize?
  public let repeatStyle: RepeatStyle?
  public let geometryBox: CSSGeometryBox?
  public let clip: MaskClip?
  public let compositingOperator: CompositingOperator?
  public let maskingMode: MaskingMode?

  public enum MaskReference: Sendable {
    case url(String)
    case custom(String)

    public static var none: CSSKeyword.None { .none }

    public var value: String {
      switch self {
      case .url(let urlValue):
        return WebTypes.url("\(urlValue)")
      case .custom(let str):
        return str
      }
    }
  }

  public enum Position: Sendable {
    case one(PositionOne)
    case two(PositionTwo)
    case custom(String)

    public var value: String {
      switch self {
      case .one(let pos):
        return pos.value
      case .two(let pos):
        return pos.value
      case .custom(let str):
        return str
      }
    }

    // Convenience shortcuts
    public static var center: Position { .one(.keyword(.center)) }
    public static var top: Position { .one(.keyword(.top)) }
    public static var bottom: Position { .one(.keyword(.bottom)) }
    public static var left: Position { .one(.keyword(.left)) }
    public static var right: Position { .one(.keyword(.right)) }

    public enum PositionOne: Sendable {
      case keyword(PositionKeyword)
      case lengthPercentage(Length)

      public var value: String {
        switch self {
        case .keyword(let kw):
          return kw.rawValue
        case .lengthPercentage(let lp):
          return lp.value
        }
      }

      public enum PositionKeyword: String, Sendable {
        case left = "left"
        case center = "center"
        case right = "right"
        case top = "top"
        case bottom = "bottom"
        case xStart = "x-start"
        case xEnd = "x-end"
        case yStart = "y-start"
        case yEnd = "y-end"
        case blockStart = "block-start"
        case blockEnd = "block-end"
        case inlineStart = "inline-start"
        case inlineEnd = "inline-end"
        case start = "start"
        case end = "end"
      }
    }

    public struct PositionTwo: Sendable {
      public let horizontal: PositionOne
      public let vertical: PositionOne

      public init(_ horizontal: PositionOne, _ vertical: PositionOne) {
        self.horizontal = horizontal
        self.vertical = vertical
      }

      public var value: String {
        "\(horizontal.value) \(vertical.value)"
      }
    }
  }

  public enum BgSize: Sendable {
    case cover
    case contain
    case lengthPercentage(Length)
    case twoLengths(Length, Length)
    case custom(String)

    public static var auto: CSSKeyword.Auto { .auto }

    public var value: String {
      switch self {
      case .cover:
        return "cover"
      case .contain:
        return "contain"
      case .lengthPercentage(let lp):
        return lp.value
      case .twoLengths(let lp1, let lp2):
        return "\(lp1.value) \(lp2.value)"
      case .custom(let str):
        return str
      }
    }
  }

  public enum RepeatStyle: Sendable {
    case repeatX
    case repeatY
    case repeatBlock
    case repeatInline
    case repetition(Repetition, Repetition?)

    public var value: String {
      switch self {
      case .repeatX:
        return "repeat-x"
      case .repeatY:
        return "repeat-y"
      case .repeatBlock:
        return "repeat-block"
      case .repeatInline:
        return "repeat-inline"
      case .repetition(let rep1, let rep2):
        if let rep2 = rep2 {
          return "\(rep1.rawValue) \(rep2.rawValue)"
        }
        return rep1.rawValue
      }
    }

    public enum Repetition: String, Sendable {
      case `repeat` = "repeat"
      case space = "space"
      case round = "round"
      case noRepeat = "no-repeat"
    }
  }

  public enum MaskClip: Sendable {
    case geometryBox(CSSGeometryBox)
    case noClip

    public var value: String {
      switch self {
      case .geometryBox(let box):
        return box.rawValue
      case .noClip:
        return "no-clip"
      }
    }
  }

  public enum CompositingOperator: String, Sendable {
    case add = "add"
    case subtract = "subtract"
    case intersect = "intersect"
    case exclude = "exclude"
  }

  public enum MaskingMode: String, Sendable {
    case alpha = "alpha"
    case luminance = "luminance"
    case matchSource = "match-source"
  }

  public init(
    reference: MaskReference? = nil,
    position: Position? = nil,
    size: BgSize? = nil,
    repeatStyle: RepeatStyle? = nil,
    geometryBox: CSSGeometryBox? = nil,
    clip: MaskClip? = nil,
    compositingOperator: CompositingOperator? = nil,
    maskingMode: MaskingMode? = nil
  ) {
    self.reference = reference
    self.position = position
    self.size = size
    self.repeatStyle = repeatStyle
    self.geometryBox = geometryBox
    self.clip = clip
    self.compositingOperator = compositingOperator
    self.maskingMode = maskingMode
  }

  #if SERVER
    public var value: String {
      var components: [String] = []

      if let reference = reference {
        components.append(reference.value)
      }
      if let position = position {
        var posStr = position.value
        if let size = size {
          posStr += " / \(size.value)"
        }
        components.append(posStr)
      }
      if let repeatStyle = repeatStyle {
        components.append(repeatStyle.value)
      }
      if let geometryBox = geometryBox {
        components.append(geometryBox.rawValue)
      }
      if let clip = clip {
        components.append(clip.value)
      }
      if let compositingOperator = compositingOperator {
        components.append(compositingOperator.rawValue)
      }
      if let maskingMode = maskingMode {
        components.append(maskingMode.rawValue)
      }

      return components.joined(separator: " ")
    }
  #endif

  #if CLIENT
    public var value: String {
      var buffer: [UInt8] = []
      var hasContent = false

      if let reference = reference {
        buffer.append(contentsOf: reference.value.utf8)
        hasContent = true
      }
      if let position = position {
        if hasContent { buffer.append(32) }
        buffer.append(contentsOf: position.value.utf8)
        if let size = size {
          buffer.append(32)  // space
          buffer.append(47)  // '/'
          buffer.append(32)  // space
          buffer.append(contentsOf: size.value.utf8)
        }
        hasContent = true
      }
      if let repeatStyle = repeatStyle {
        if hasContent { buffer.append(32) }
        buffer.append(contentsOf: repeatStyle.value.utf8)
        hasContent = true
      }
      if let geometryBox = geometryBox {
        if hasContent { buffer.append(32) }
        buffer.append(contentsOf: geometryBox.rawValue.utf8)
        hasContent = true
      }
      if let clip = clip {
        if hasContent { buffer.append(32) }
        buffer.append(contentsOf: clip.value.utf8)
        hasContent = true
      }
      if let compositingOperator = compositingOperator {
        if hasContent { buffer.append(32) }
        buffer.append(contentsOf: compositingOperator.rawValue.utf8)
        hasContent = true
      }
      if let maskingMode = maskingMode {
        if hasContent { buffer.append(32) }
        buffer.append(contentsOf: maskingMode.rawValue.utf8)
      }

      return String(decoding: buffer, as: UTF8.self)
    }
  #endif
}

// MARK: - Convenience helper functions

public func maskLayer(
  _ reference: CSSMaskLayer.MaskReference? = nil,
  position: CSSMaskLayer.Position? = nil,
  size: CSSMaskLayer.BgSize? = nil,
  repeatStyle: CSSMaskLayer.RepeatStyle? = nil,
  geometryBox: CSSGeometryBox? = nil,
  clip: CSSMaskLayer.MaskClip? = nil,
  compositingOperator: CSSMaskLayer.CompositingOperator? = nil,
  maskingMode: CSSMaskLayer.MaskingMode? = nil
) -> CSSMaskLayer {
  CSSMaskLayer(
    reference: reference,
    position: position,
    size: size,
    repeatStyle: repeatStyle,
    geometryBox: geometryBox,
    clip: clip,
    compositingOperator: compositingOperator,
    maskingMode: maskingMode
  )
}
