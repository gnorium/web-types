#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  public enum ClipPath: Sendable {
    case shape(CSS.BasicShape)
    case geometryBox(CSS.GeometryBox)
    case shapeBox(CSS.BasicShape, CSS.GeometryBox)

    public static var none: CSS.Keyword.None { .none }

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
}
