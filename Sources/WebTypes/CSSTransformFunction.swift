#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public struct CSSTransformFunction: ExpressibleByStringLiteral, Sendable {
	public let value: String

	public init(stringLiteral value: String) {
		self.value = value
	}

	public init(_ value: String) {
		self.value = value
	}
}

// MARK: - Standard Implementation

#if !os(WASI)

public func rotate(_ angle: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction("rotate(\(angle.value))")
}

public func rotate(_ angle: String) -> CSSTransformFunction {
	CSSTransformFunction("rotate(\(angle))")
}

public func translateX(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("translateX(\(value))")
}

public func translateX(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction("translateX(\(value.value))")
}

public func translateX(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translateX(\(value.value))")
}

public func translateY(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("translateY(\(value))")
}

public func translateY(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction("translateY(\(value.value))")
}

public func translateY(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translateY(\(value.value))")
}

public func translateZ(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("translateZ(\(value))")
}

public func translateZ(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction("translateZ(\(value.value))")
}

public func translateZ(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translateZ(\(value.value))")
}

public func translate(_ x: String, _ y: String) -> CSSTransformFunction {
	CSSTransformFunction("translate(\(x), \(y))")
}

public func translate(_ x: Length, _ y: Length) -> CSSTransformFunction {
	CSSTransformFunction("translate(\(x.value), \(y.value))")
}

public func translate(_ x: Percentage, _ y: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translate(\(x.value), \(y.value))")
}

public func translate3d(_ x: String, _ y: String, _ z: String) -> CSSTransformFunction {
	CSSTransformFunction("translate3d(\(x), \(y), \(z))")
}

public func translate3d(_ x: Length, _ y: Length, _ z: Length) -> CSSTransformFunction {
	CSSTransformFunction("translate3d(\(x.value), \(y.value), \(z.value))")
}

public func translate3d(_ x: Percentage, _ y: Percentage, _ z: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translate3d(\(x.value), \(y.value), \(z.value))")
}

public func scaleX(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("scaleX(\(value))")
}

public func scaleX(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction("scaleX(\(value))")
}

public func scaleY(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("scaleY(\(value))")
}

public func scaleY(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction("scaleY(\(value))")
}

public func scaleZ(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("scaleZ(\(value))")
}

public func scaleZ(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction("scaleZ(\(value))")
}

public func scale(_ x: String, _ y: String) -> CSSTransformFunction {
	CSSTransformFunction("scale(\(x), \(y))")
}

public func scale(_ x: Double, _ y: Double) -> CSSTransformFunction {
	CSSTransformFunction("scale(\(x), \(y))")
}

public func scale(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("scale(\(value))")
}

public func scale(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction("scale(\(value))")
}

public func scale3d(_ x: String, _ y: String, _ z: String) -> CSSTransformFunction {
	CSSTransformFunction("scale3d(\(x), \(y), \(z))")
}

public func scale3d(_ x: Double, _ y: Double, _ z: Double) -> CSSTransformFunction {
	CSSTransformFunction("scale3d(\(x), \(y), \(z))")
}

public func skewX(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("skewX(\(value))")
}

public func skewY(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("skewY(\(value))")
}

public func skew(_ x: String, _ y: String) -> CSSTransformFunction {
	CSSTransformFunction("skew(\(x), \(y))")
}

public func rotateX(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("rotateX(\(value))")
}

public func rotateX(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction("rotateX(\(value.value))")
}

public func rotateY(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("rotateY(\(value))")
}

public func rotateY(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction("rotateY(\(value.value))")
}

public func rotateZ(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("rotateZ(\(value))")
}

public func rotateZ(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction("rotateZ(\(value.value))")
}

public func rotate3d(_ x: String, _ y: String, _ z: String, _ angle: String) -> CSSTransformFunction {
	CSSTransformFunction("rotate3d(\(x), \(y), \(z), \(angle))")
}

public func matrix(_ a: String, _ b: String, _ c: String, _ d: String, _ tx: String, _ ty: String) -> CSSTransformFunction {
	CSSTransformFunction("matrix(\(a), \(b), \(c), \(d), \(tx), \(ty))")
}

public func matrix3d(_ a1: String, _ b1: String, _ c1: String, _ d1: String, _ a2: String, _ b2: String, _ c2: String, _ d2: String, _ a3: String, _ b3: String, _ c3: String, _ d3: String, _ a4: String, _ b4: String, _ c4: String, _ d4: String) -> CSSTransformFunction {
	CSSTransformFunction("matrix3d(\(a1), \(b1), \(c1), \(d1), \(a2), \(b2), \(c2), \(d2), \(a3), \(b3), \(c3), \(d3), \(a4), \(b4), \(c4), \(d4))")
}

public func perspective(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction("perspective(\(value))")
}

public func perspective(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction("perspective(\(value.value))")
}

#endif

// MARK: - WASM Implementation

#if os(WASI)


public func rotate(_ angle: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotate(", angle.value, ")"))
}

public func rotate(_ angle: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotate(", angle, ")"))
}

public func translateX(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateX(", value, ")"))
}

public func translateX(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateX(", value.value, ")"))
}

public func translateX(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateX(", value.value, ")"))
}

public func translateY(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateY(", value, ")"))
}

public func translateY(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateY(", value.value, ")"))
}

public func translateY(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateY(", value.value, ")"))
}

public func translateZ(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateZ(", value, ")"))
}

public func translateZ(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateZ(", value.value, ")"))
}

public func translateZ(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateZ(", value.value, ")"))
}

public func translate(_ x: String, _ y: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate(", x, ", ", y, ")"))
}

public func translate(_ x: Length, _ y: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate(", x.value, ", ", y.value, ")"))
}

public func translate(_ x: Percentage, _ y: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate(", x.value, ", ", y.value, ")"))
}

public func translate3d(_ x: String, _ y: String, _ z: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate3d(", x, ", ", y, ", ", z, ")"))
}

public func translate3d(_ x: Length, _ y: Length, _ z: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate3d(", x.value, ", ", y.value, ", ", z.value, ")"))
}

public func translate3d(_ x: Percentage, _ y: Percentage, _ z: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate3d(", x.value, ", ", y.value, ", ", z.value, ")"))
}

public func scaleX(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleX(", value, ")"))
}

public func scaleX(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleX(", doubleToString(value), ")"))
}

public func scaleY(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleY(", value, ")"))
}

public func scaleY(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleY(", doubleToString(value), ")"))
}

public func scaleZ(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleZ(", value, ")"))
}

public func scaleZ(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleZ(", doubleToString(value), ")"))
}

public func scale(_ x: String, _ y: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale(", x, ", ", y, ")"))
}

public func scale(_ x: Double, _ y: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale(", doubleToString(x), ", ", doubleToString(y), ")"))
}

public func scale(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale(", value, ")"))
}

public func scale(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale(", doubleToString(value), ")"))
}

public func scale3d(_ x: String, _ y: String, _ z: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale3d(", x, ", ", y, ", ", z, ")"))
}

public func scale3d(_ x: Double, _ y: Double, _ z: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale3d(", doubleToString(x), ", ", doubleToString(y), ", ", doubleToString(z), ")"))
}

public func skewX(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("skewX(", value, ")"))
}

public func skewY(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("skewY(", value, ")"))
}

public func skew(_ x: String, _ y: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("skew(", x, ", ", y, ")"))
}

public func rotateX(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateX(", value, ")"))
}

public func rotateX(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateX(", value.value, ")"))
}

public func rotateY(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateY(", value, ")"))
}

public func rotateY(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateY(", value.value, ")"))
}

public func rotateZ(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateZ(", value, ")"))
}

public func rotateZ(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateZ(", value.value, ")"))
}

public func rotate3d(_ x: String, _ y: String, _ z: String, _ angle: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotate3d(", x, ", ", y, ", ", z, ", ", angle, ")"))
}

public func matrix(_ a: String, _ b: String, _ c: String, _ d: String, _ tx: String, _ ty: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("matrix(", a, ", ", b, ", ", c, ", ", d, ", ", tx, ", ", ty, ")"))
}

public func matrix3d(_ a1: String, _ b1: String, _ c1: String, _ d1: String, _ a2: String, _ b2: String, _ c2: String, _ d2: String, _ a3: String, _ b3: String, _ c3: String, _ d3: String, _ a4: String, _ b4: String, _ c4: String, _ d4: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("matrix3d(", a1, ", ", b1, ", ", c1, ", ", d1, ", ", a2, ", ", b2, ", ", c2, ", ", d2, ", ", a3, ", ", b3, ", ", c3, ", ", d3, ", ", a4, ", ", b4, ", ", c4, ", ", d4, ")"))
}

public func perspective(_ value: String) -> CSSTransformFunction {
	CSSTransformFunction(concat("perspective(", value, ")"))
}

public func perspective(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("perspective(", value.value, ")"))
}

#endif
