import EmbeddedSwiftUtilities

extension CSS {
  public struct TransformFunction: Sendable, CSSVariableConvertible {
    public let value: String

    internal init(_ value: String) {
      self.value = value
    }

    public static func variable(_ name: String) -> CSS.TransformFunction {
      CSS.TransformFunction("var(\(name))")
    }
  }
}

#if SERVER
  public func rotate(_ angle: CSS.Angle) -> CSS.TransformFunction {
    CSS.TransformFunction("rotate(\(angle.value))")
  }

  public func translateX(_ value: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translateX(\(value.value))")
  }

  public func translateX(_ value: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateX(\(value.value))")
  }

  @_disfavoredOverload
  public func translateX(_ value: CSS.LengthPercentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateX(\(value.value))")
  }

  public func translateY(_ value: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translateY(\(value.value))")
  }

  public func translateY(_ value: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateY(\(value.value))")
  }

  @_disfavoredOverload
  public func translateY(_ value: CSS.LengthPercentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateY(\(value.value))")
  }

  public func translateZ(_ value: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translateZ(\(value.value))")
  }

  public func translateZ(_ value: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateZ(\(value.value))")
  }

  @_disfavoredOverload
  public func translateZ(_ value: CSS.LengthPercentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateZ(\(value.value))")
  }

  public func translate(_ x: CSS.Length, _ y: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translate(\(x.value), \(y.value))")
  }

  public func translate(_ x: CSS.Percentage, _ y: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translate(\(x.value), \(y.value))")
  }

  public func translate(_ x: CSS.Percentage, _ y: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translate(\(x.value), \(y.value))")
  }

  public func translate(_ x: CSS.Length, _ y: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translate(\(x.value), \(y.value))")
  }

  public func translate3d(_ x: CSS.Length, _ y: CSS.Length, _ z: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translate3d(\(x.value), \(y.value), \(z.value))")
  }

  public func translate3d(_ x: CSS.Percentage, _ y: CSS.Percentage, _ z: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translate3d(\(x.value), \(y.value), \(z.value))")
  }

  public func scaleX(_ value: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scaleX(\(value))")
  }

  public func scaleY(_ value: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scaleY(\(value))")
  }

  public func scaleZ(_ value: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scaleZ(\(value))")
  }

  public func scale(_ x: Double, _ y: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scale(\(x), \(y))")
  }

  public func scale(_ value: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scale(\(value))")
  }

  public func scale3d(_ x: Double, _ y: Double, _ z: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scale3d(\(x), \(y), \(z))")
  }

  public func rotateX(_ value: CSS.Angle) -> CSS.TransformFunction {
    CSS.TransformFunction("rotateX(\(value.value))")
  }

  public func rotateY(_ value: CSS.Angle) -> CSS.TransformFunction {
    CSS.TransformFunction("rotateY(\(value.value))")
  }

  public func rotateZ(_ value: CSS.Angle) -> CSS.TransformFunction {
    CSS.TransformFunction("rotateZ(\(value.value))")
  }

  public func perspective(_ value: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("perspective(\(value.value))")
  }

  @_disfavoredOverload
  public func perspective(_ value: CSS.LengthPercentage) -> CSS.TransformFunction {
    CSS.TransformFunction("perspective(\(value.value))")
  }
#endif

#if CLIENT
  public func rotate(_ angle: CSS.Angle) -> CSS.TransformFunction {
    CSS.TransformFunction("rotate(\(angle.value))")
  }

  public func translateX(_ value: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translateX(\(value.value))")
  }

  public func translateX(_ value: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateX(\(value.value))")
  }

  @_disfavoredOverload
  public func translateX(_ value: CSS.LengthPercentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateX(\(value.value))")
  }

  public func translateY(_ value: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translateY(\(value.value))")
  }

  public func translateY(_ value: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateY(\(value.value))")
  }

  @_disfavoredOverload
  public func translateY(_ value: CSS.LengthPercentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateY(\(value.value))")
  }

  public func translateZ(_ value: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translateZ(\(value.value))")
  }

  public func translateZ(_ value: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateZ(\(value.value))")
  }

  @_disfavoredOverload
  public func translateZ(_ value: CSS.LengthPercentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translateZ(\(value.value))")
  }

  public func translate(_ x: CSS.Length, _ y: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translate(\(x.value), \(y.value))")
  }

  public func translate(_ x: CSS.Percentage, _ y: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translate(\(x.value), \(y.value))")
  }

  public func translate(_ x: CSS.Percentage, _ y: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translate(\(x.value), \(y.value))")
  }

  public func translate(_ x: CSS.Length, _ y: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translate(\(x.value), \(y.value))")
  }

  public func translate3d(_ x: CSS.Length, _ y: CSS.Length, _ z: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("translate3d(\(x.value), \(y.value), \(z.value))")
  }

  public func translate3d(_ x: CSS.Percentage, _ y: CSS.Percentage, _ z: CSS.Percentage) -> CSS.TransformFunction {
    CSS.TransformFunction("translate3d(\(x.value), \(y.value), \(z.value))")
  }

  public func scaleX(_ value: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scaleX(\(doubleToString(value)))")
  }

  public func scaleY(_ value: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scaleY(\(doubleToString(value)))")
  }

  public func scaleZ(_ value: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scaleZ(\(doubleToString(value)))")
  }

  public func scale(_ x: Double, _ y: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scale(\(doubleToString(x)), \(doubleToString(y)))")
  }

  public func scale(_ value: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scale(\(doubleToString(value)))")
  }

  public func scale3d(_ x: Double, _ y: Double, _ z: Double) -> CSS.TransformFunction {
    CSS.TransformFunction("scale3d(\(doubleToString(x)), \(doubleToString(y)), \(doubleToString(z)))")
  }

  public func rotateX(_ value: CSS.Angle) -> CSS.TransformFunction {
    CSS.TransformFunction("rotateX(\(value.value))")
  }

  public func rotateY(_ value: CSS.Angle) -> CSS.TransformFunction {
    CSS.TransformFunction("rotateY(\(value.value))")
  }

  public func rotateZ(_ value: CSS.Angle) -> CSS.TransformFunction {
    CSS.TransformFunction("rotateZ(\(value.value))")
  }

  public func perspective(_ value: CSS.Length) -> CSS.TransformFunction {
    CSS.TransformFunction("perspective(\(value.value))")
  }

  @_disfavoredOverload
  public func perspective(_ value: CSS.LengthPercentage) -> CSS.TransformFunction {
    CSS.TransformFunction("perspective(\(value.value))")
  }
#endif
