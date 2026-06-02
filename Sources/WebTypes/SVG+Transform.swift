#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension SVG {
  public struct Transform: CustomStringConvertible, Sendable {
    public let value: String

    public init(_ value: String) {
      self.value = value
    }

    public var description: String { value }
  }
}

public func translate(_ x: Double, _ y: Double) -> SVG.Transform {
  SVG.Transform("translate(\(x),\(y))")
}

public func translate(_ x: Int, _ y: Int) -> SVG.Transform {
  SVG.Transform("translate(\(x),\(y))")
}

public func translate(_ x: String, _ y: String) -> SVG.Transform {
  SVG.Transform("translate(\(x),\(y))")
}

public func scale(_ x: Double, _ y: Double) -> SVG.Transform {
  SVG.Transform("scale(\(x),\(y))")
}

public func scale(_ x: Int, _ y: Int) -> SVG.Transform {
  SVG.Transform("scale(\(x),\(y))")
}

public func scale(_ value: Double) -> SVG.Transform {
  SVG.Transform("scale(\(value))")
}

public func scale(_ value: Int) -> SVG.Transform {
  SVG.Transform("scale(\(value))")
}

public func rotate(_ angle: Double) -> SVG.Transform {
  SVG.Transform("rotate(\(angle))")
}

public func rotate(_ angle: Int) -> SVG.Transform {
  SVG.Transform("rotate(\(angle))")
}

public func rotate(_ angle: Double, _ cx: Double, _ cy: Double) -> SVG.Transform {
  SVG.Transform("rotate(\(angle),\(cx),\(cy))")
}

public func skewX(_ angle: Double) -> SVG.Transform {
  SVG.Transform("skewX(\(angle))")
}

public func skewY(_ angle: Double) -> SVG.Transform {
  SVG.Transform("skewY(\(angle))")
}

public func matrix(_ a: Double, _ b: Double, _ c: Double, _ d: Double, _ e: Double, _ f: Double) -> SVG.Transform {
  SVG.Transform("matrix(\(a),\(b),\(c),\(d),\(e),\(f))")
}

public func matrix(_ a: Int, _ b: Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) -> SVG.Transform {
  SVG.Transform("matrix(\(a),\(b),\(c),\(d),\(e),\(f))")
}

public func matrix(_ a: String, _ b: String, _ c: String, _ d: String, _ e: String, _ f: String) -> SVG.Transform {
  SVG.Transform("matrix(\(a),\(b),\(c),\(d),\(e),\(f))")
}
