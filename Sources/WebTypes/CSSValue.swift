#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// Concrete type for CSSContent values in embedded Swift (can't use protocol existentials)
public struct CSSValue: Sendable {
	public let value: String

	#if !os(WASI)

	@_disfavoredOverload
	public init(_ length: Length) {
		self.value = length.value
	}

	@_disfavoredOverload
	public init<T>(_ type: T) where T: CustomStringConvertible {
		self.value = type.description
	}
	#endif
}
