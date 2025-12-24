#if os(WASI)

import Utilities

#endif

// <number> - CSS number data type
// Represents a number, being either an integer, a number with a fractional component,
// or a base-ten exponent in scientific notation.
public struct CSSNumber: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, ExpressibleByStringLiteral, Sendable {
	public let value: String

	#if !os(WASI)

	public init(integerLiteral value: Int) {
		self.value = "\(value)"
	}

	public init(floatLiteral value: Double) {
		self.value = "\(value)"
	}

	#endif

	#if os(WASI)

	public init(integerLiteral value: Int) {
		self.value = intToString(value)
	}

	public init(floatLiteral value: Double) {
		self.value = doubleToString(value)
	}

	#endif

	public init(stringLiteral value: String) {
		self.value = value
	}

	public init(_ value: String) {
		self.value = value
	}

	#if !os(WASI)

	public init(_ value: Int) {
		self.value = "\(value)"
	}

	public init(_ value: Double) {
		self.value = "\(value)"
	}

	#endif

	#if os(WASI)

	public init(_ value: Int) {
		self.value = intToString(value)
	}

	public init(_ value: Double) {
		self.value = doubleToString(value)
	}

	#endif
}
