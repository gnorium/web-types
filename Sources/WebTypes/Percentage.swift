#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public struct Percentage: CustomStringConvertible, Sendable, CSSVariableConvertible {
	public let value: String

	public static func variable(_ name: String) -> Percentage {
		Percentage(concat("var(", name, ")"))
	}

	internal init(_ value: String) {
		self.value = value
	}

	#if !os(WASI)

	public init(_ value: Double) {
		self.value = "\(value)%"
	}

	public init(_ value: Int) {
		self.value = "\(value)%"
	}

	#endif

	#if os(WASI)

	public init(_ value: Double) {
		self.value = concat(doubleToString(value), "%")
	}

	public init(_ value: Int) {
		self.value = concat(intToString(value), "%")
	}

	#endif

	public var description: String {
		value
	}
}

public func perc(_ value: Double) -> Percentage {
	Percentage(value)
}

public func perc(_ value: Int) -> Percentage {
	Percentage(value)
}
