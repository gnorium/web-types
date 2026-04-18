#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public struct CSSTransformFunction: Sendable, CSSVariableConvertible {
	public let value: String

	internal init(_ value: String) {
		self.value = value
	}

	public static func variable(_ name: String) -> CSSTransformFunction {
		CSSTransformFunction(concat("var(", name, ")"))
	}
}

// MARK: - Standard Implementation

#if !os(WASI)

public func rotate(_ angle: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction("rotate(\(angle.value))")
}


public func translateX(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction("translateX(\(value.value))")
}

public func translateX(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translateX(\(value.value))")
}

@_disfavoredOverload
public func translateX(_ value: LengthPercentage) -> CSSTransformFunction {
	CSSTransformFunction("translateX(\(value.value))")
}


public func translateY(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction("translateY(\(value.value))")
}

public func translateY(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translateY(\(value.value))")
}

@_disfavoredOverload
public func translateY(_ value: LengthPercentage) -> CSSTransformFunction {
	CSSTransformFunction("translateY(\(value.value))")
}


public func translateZ(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction("translateZ(\(value.value))")
}

public func translateZ(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translateZ(\(value.value))")
}

@_disfavoredOverload
public func translateZ(_ value: LengthPercentage) -> CSSTransformFunction {
	CSSTransformFunction("translateZ(\(value.value))")
}


public func translate(_ x: Length, _ y: Length) -> CSSTransformFunction {
	CSSTransformFunction("translate(\(x.value), \(y.value))")
}

public func translate(_ x: Percentage, _ y: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translate(\(x.value), \(y.value))")
}


public func translate(_ x: Percentage, _ y: Length) -> CSSTransformFunction {
	CSSTransformFunction("translate(\(x.value), \(y.value))")
}

public func translate(_ x: Length, _ y: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translate(\(x.value), \(y.value))")
}


public func translate3d(_ x: Length, _ y: Length, _ z: Length) -> CSSTransformFunction {
	CSSTransformFunction("translate3d(\(x.value), \(y.value), \(z.value))")
}

public func translate3d(_ x: Percentage, _ y: Percentage, _ z: Percentage) -> CSSTransformFunction {
	CSSTransformFunction("translate3d(\(x.value), \(y.value), \(z.value))")
}


public func scaleX(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction("scaleX(\(value))")
}


public func scaleY(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction("scaleY(\(value))")
}


public func scaleZ(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction("scaleZ(\(value))")
}


public func scale(_ x: Double, _ y: Double) -> CSSTransformFunction {
	CSSTransformFunction("scale(\(x), \(y))")
}


public func scale(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction("scale(\(value))")
}


public func scale3d(_ x: Double, _ y: Double, _ z: Double) -> CSSTransformFunction {
	CSSTransformFunction("scale3d(\(x), \(y), \(z))")
}



public func rotateX(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction("rotateX(\(value.value))")
}


public func rotateY(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction("rotateY(\(value.value))")
}


public func rotateZ(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction("rotateZ(\(value.value))")
}




public func perspective(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction("perspective(\(value.value))")
}

@_disfavoredOverload
public func perspective(_ value: LengthPercentage) -> CSSTransformFunction {
	CSSTransformFunction("perspective(\(value.value))")
}

#endif

// MARK: - WASM Implementation

#if os(WASI)


public func rotate(_ angle: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotate(", angle.value, ")"))
}

public func translateX(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateX(", value.value, ")"))
}

public func translateX(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateX(", value.value, ")"))
}

@_disfavoredOverload
public func translateX(_ value: LengthPercentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateX(", value.value, ")"))
}

public func translateY(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateY(", value.value, ")"))
}

public func translateY(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateY(", value.value, ")"))
}

@_disfavoredOverload
public func translateY(_ value: LengthPercentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateY(", value.value, ")"))
}

public func translateZ(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateZ(", value.value, ")"))
}

public func translateZ(_ value: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateZ(", value.value, ")"))
}

@_disfavoredOverload
public func translateZ(_ value: LengthPercentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translateZ(", value.value, ")"))
}

public func translate(_ x: Length, _ y: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate(", x.value, ", ", y.value, ")"))
}

public func translate(_ x: Percentage, _ y: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate(", x.value, ", ", y.value, ")"))
}

public func translate(_ x: Percentage, _ y: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate(", x.value, ", ", y.value, ")"))
}

public func translate(_ x: Length, _ y: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate(", x.value, ", ", y.value, ")"))
}

public func translate3d(_ x: Length, _ y: Length, _ z: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate3d(", x.value, ", ", y.value, ", ", z.value, ")"))
}

public func translate3d(_ x: Percentage, _ y: Percentage, _ z: Percentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("translate3d(", x.value, ", ", y.value, ", ", z.value, ")"))
}

public func scaleX(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleX(", doubleToString(value), ")"))
}

public func scaleY(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleY(", doubleToString(value), ")"))
}

public func scaleZ(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scaleZ(", doubleToString(value), ")"))
}

public func scale(_ x: Double, _ y: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale(", doubleToString(x), ", ", doubleToString(y), ")"))
}

public func scale(_ value: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale(", doubleToString(value), ")"))
}

public func scale3d(_ x: Double, _ y: Double, _ z: Double) -> CSSTransformFunction {
	CSSTransformFunction(concat("scale3d(", doubleToString(x), ", ", doubleToString(y), ", ", doubleToString(z), ")"))
}

public func rotateX(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateX(", value.value, ")"))
}

public func rotateY(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateY(", value.value, ")"))
}

public func rotateZ(_ value: CSSAngle) -> CSSTransformFunction {
	CSSTransformFunction(concat("rotateZ(", value.value, ")"))
}

public func perspective(_ value: Length) -> CSSTransformFunction {
	CSSTransformFunction(concat("perspective(", value.value, ")"))
}

@_disfavoredOverload
public func perspective(_ value: LengthPercentage) -> CSSTransformFunction {
	CSSTransformFunction(concat("perspective(", value.value, ")"))
}

#endif
