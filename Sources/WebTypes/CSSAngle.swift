#if os(WASI)

import Utilities

#endif

// <angle> = <number><angle-unit>
// <angle-unit> = deg | grad | rad | turn

public struct CSSAngle: Sendable {
	public let value: String

	private init(_ value: String) {
		self.value = value
	}

	#if !os(WASI)

	// Degrees
	public static func deg(_ value: Double) -> CSSAngle {
		CSSAngle("\(value)deg")
	}

	public static func deg(_ value: Int) -> CSSAngle {
		CSSAngle("\(value)deg")
	}

	// Gradians
	public static func grad(_ value: Double) -> CSSAngle {
		CSSAngle("\(value)grad")
	}

	public static func grad(_ value: Int) -> CSSAngle {
		CSSAngle("\(value)grad")
	}

	// Radians
	public static func rad(_ value: Double) -> CSSAngle {
		CSSAngle("\(value)rad")
	}

	public static func rad(_ value: Int) -> CSSAngle {
		CSSAngle("\(value)rad")
	}

	// Turns
	public static func turn(_ value: Double) -> CSSAngle {
		CSSAngle("\(value)turn")
	}

	public static func turn(_ value: Int) -> CSSAngle {
		CSSAngle("\(value)turn")
	}

	#endif

	#if os(WASI)

	// Degrees
	public static func deg(_ value: Double) -> CSSAngle {
		CSSAngle(concat(doubleToString(value), "deg"))
	}

	public static func deg(_ value: Int) -> CSSAngle {
		CSSAngle(concat(intToString(value), "deg"))
	}

	// Gradians
	public static func grad(_ value: Double) -> CSSAngle {
		CSSAngle(concat(doubleToString(value), "grad"))
	}

	public static func grad(_ value: Int) -> CSSAngle {
		CSSAngle(concat(intToString(value), "grad"))
	}

	// Radians
	public static func rad(_ value: Double) -> CSSAngle {
		CSSAngle(concat(doubleToString(value), "rad"))
	}

	public static func rad(_ value: Int) -> CSSAngle {
		CSSAngle(concat(intToString(value), "rad"))
	}

	// Turns
	public static func turn(_ value: Double) -> CSSAngle {
		CSSAngle(concat(doubleToString(value), "turn"))
	}

	public static func turn(_ value: Int) -> CSSAngle {
		CSSAngle(concat(intToString(value), "turn"))
	}

	private static func concat(_ parts: String...) -> String {
		var buffer: [UInt8] = []
		for part in parts {
			buffer.append(contentsOf: part.utf8)
		}
		return String(decoding: buffer, as: UTF8.self)
	}

	#endif
}

// Convenience global functions
public func deg(_ value: Double) -> CSSAngle {
	.deg(value)
}

public func deg(_ value: Int) -> CSSAngle {
	.deg(value)
}

public func grad(_ value: Double) -> CSSAngle {
	.grad(value)
}

public func grad(_ value: Int) -> CSSAngle {
	.grad(value)
}

public func rad(_ value: Double) -> CSSAngle {
	.rad(value)
}

public func rad(_ value: Int) -> CSSAngle {
	.rad(value)
}

public func turn(_ value: Double) -> CSSAngle {
	.turn(value)
}

public func turn(_ value: Int) -> CSSAngle {
	.turn(value)
}
