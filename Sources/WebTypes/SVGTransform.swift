public struct SVGTransform: CustomStringConvertible, Sendable {
	public let value: String

	public init(_ value: String) {
		self.value = value
	}

	public var description: String {
		value
	}
}

// Transform functions
public func translate(_ x: Double, _ y: Double) -> SVGTransform {
	SVGTransform("translate(\(x),\(y))")
}

public func translate(_ x: Int, _ y: Int) -> SVGTransform {
	SVGTransform("translate(\(x),\(y))")
}

public func translate(_ x: String, _ y: String) -> SVGTransform {
	SVGTransform("translate(\(x),\(y))")
}

public func scale(_ x: Double, _ y: Double) -> SVGTransform {
	SVGTransform("scale(\(x),\(y))")
}

public func scale(_ x: Int, _ y: Int) -> SVGTransform {
	SVGTransform("scale(\(x),\(y))")
}

public func scale(_ value: Double) -> SVGTransform {
	SVGTransform("scale(\(value))")
}

public func scale(_ value: Int) -> SVGTransform {
	SVGTransform("scale(\(value))")
}

public func rotate(_ angle: Double) -> SVGTransform {
	SVGTransform("rotate(\(angle))")
}

public func rotate(_ angle: Int) -> SVGTransform {
	SVGTransform("rotate(\(angle))")
}

public func rotate(_ angle: Double, _ cx: Double, _ cy: Double) -> SVGTransform {
	SVGTransform("rotate(\(angle),\(cx),\(cy))")
}

public func skewX(_ angle: Double) -> SVGTransform {
	SVGTransform("skewX(\(angle))")
}

public func skewY(_ angle: Double) -> SVGTransform {
	SVGTransform("skewY(\(angle))")
}

public func matrix(_ a: Double, _ b: Double, _ c: Double, _ d: Double, _ e: Double, _ f: Double) -> SVGTransform {
	SVGTransform("matrix(\(a),\(b),\(c),\(d),\(e),\(f))")
}

public func matrix(_ a: Int, _ b: Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) -> SVGTransform {
	SVGTransform("matrix(\(a),\(b),\(c),\(d),\(e),\(f))")
}

public func matrix(_ a: String, _ b: String, _ c: String, _ d: String, _ e: String, _ f: String) -> SVGTransform {
	SVGTransform("matrix(\(a),\(b),\(c),\(d),\(e),\(f))")
}
