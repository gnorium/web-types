import EmbeddedSwiftUtilities

public enum CSSClipPath: Sendable {
  case shape(CSSBasicShape)
  case geometryBox(CSSGeometryBox)
  case shapeBox(CSSBasicShape, CSSGeometryBox)

  public static var none: CSSKeyword.None { .none }

  public var value: String {
    switch self {
    case .shape(let shape):
      return shape.value
    case .geometryBox(let box):
      return box.rawValue
    case .shapeBox(let shape, let box):
      return "\(shape.value) \(box.rawValue)"
    }
  }
}
