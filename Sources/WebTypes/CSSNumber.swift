#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <number> - CSSContent number data type
// Represents a number, being either an integer, a number with a fractional component,
// or a base-ten exponent in scientific notation.
public struct CSSNumber: Sendable, CSSVariableConvertible {
	public let value: String


	internal init(_ value: String) {
		self.value = value
	}

	public static func variable(_ name: String) -> CSSNumber {
		CSSNumber(concat("var(", name, ")"))
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
