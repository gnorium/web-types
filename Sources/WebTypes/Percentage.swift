#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public struct Percentage: ExpressibleByStringLiteral, CustomStringConvertible, Sendable {
	public let value: String

	public init(stringLiteral value: String) {
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

private func concat(_ parts: String...) -> String {
	var buffer: [UInt8] = []
	for part in parts {
		buffer.append(contentsOf: part.utf8)
	}
	return String(decoding: buffer, as: UTF8.self)
}
