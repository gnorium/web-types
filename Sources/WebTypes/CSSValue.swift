#if os(WASI)

import Utilities

#endif

// Concrete type for CSS values in embedded Swift (can't use protocol existentials)
public struct CSSValue: Sendable, ExpressibleByStringLiteral, ExpressibleByIntegerLiteral {
	public let value: String

	@_disfavoredOverload
	public init(_ length: Length) {
		self.value = length.value
	}

	@_disfavoredOverload
	public init(_ string: String) {
		self.value = string
	}

	#if !os(WASI)
	@_disfavoredOverload
	public init(_ int: Int) {
		self.value = "\(int)"
	}

	@_disfavoredOverload
	public init(_ double: Double) {
		self.value = "\(double)"
	}
	#endif

	#if os(WASI)
	@_disfavoredOverload
	public init(_ int: Int) {
		self.value = intToString(int)
	}

	@_disfavoredOverload
	public init(_ double: Double) {
		self.value = doubleToString(double)
	}
	#endif

	// ExpressibleByStringLiteral
	public init(stringLiteral value: String) {
		self.value = value
	}

	#if !os(WASI)
	// ExpressibleByIntegerLiteral
	public init(integerLiteral value: Int) {
		self.value = "\(value)"
	}
	#endif

	#if os(WASI)
	// ExpressibleByIntegerLiteral
	public init(integerLiteral value: Int) {
		self.value = intToString(value)
	}
	#endif
}
