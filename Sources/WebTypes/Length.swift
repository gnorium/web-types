#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public struct Length: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, ExpressibleByStringLiteral, Sendable, CustomStringConvertible {
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

	public var description: String {
		value
	}
}

#if !os(WASI)

public func px(_ int: Int) -> Length {
	Length("\(int)px")
}

public func px(_ double: Double) -> Length {
	Length("\(double)px")
}

public func em(_ int: Int) -> Length {
	Length("\(int)em")
}

public func em(_ double: Double) -> Length {
	Length("\(double)em")
}

public func rem(_ int: Int) -> Length {
	Length("\(int)rem")
}

public func rem(_ double: Double) -> Length {
	Length("\(double)rem")
}

public func vw(_ int: Int) -> Length {
	Length("\(int)vw")
}

public func vw(_ double: Double) -> Length {
	Length("\(double)vw")
}

public func vh(_ int: Int) -> Length {
	Length("\(int)vh")
}

public func vh(_ double: Double) -> Length {
	Length("\(double)vh")
}

public func fr(_ int: Int) -> Length {
	Length("\(int)fr")
}

public func fr(_ double: Double) -> Length {
	Length("\(double)fr")
}

#endif

#if os(WASI)

public func px(_ int: Int) -> Length {
	Length(concat(intToString(int), "px"))
}

public func px(_ double: Double) -> Length {
	Length(concat(doubleToString(double), "px"))
}

public func em(_ int: Int) -> Length {
	Length(concat(intToString(int), "em"))
}

public func em(_ double: Double) -> Length {
	Length(concat(doubleToString(double), "em"))
}

public func rem(_ int: Int) -> Length {
	Length(concat(intToString(int), "rem"))
}

public func rem(_ double: Double) -> Length {
	Length(concat(doubleToString(double), "rem"))
}

public func vw(_ int: Int) -> Length {
	Length(concat(intToString(int), "vw"))
}

public func vw(_ double: Double) -> Length {
	Length(concat(doubleToString(double), "vw"))
}

public func vh(_ int: Int) -> Length {
	Length(concat(intToString(int), "vh"))
}

public func vh(_ double: Double) -> Length {
	Length(concat(doubleToString(double), "vh"))
}

public func fr(_ int: Int) -> Length {
	Length(concat(intToString(int), "fr"))
}

public func fr(_ double: Double) -> Length {
	Length(concat(doubleToString(double), "fr"))
}

#endif

#if !os(WASI)

public func minmax(_ min: Length, _ max: Length) -> Length {
	Length("minmax(\(min.value), \(max.value))")
}

public func `repeat`(_ count: GridRepeat, _ value: Length) -> Length {
	Length("repeat(\(count.rawValue), \(value.value))")
}

public func `repeat`(_ count: Int, _ value: Length) -> Length {
	Length("repeat(\(count), \(value.value))")
}

#endif

#if os(WASI)

public func minmax(_ min: Length, _ max: Length) -> Length {
	Length(concat("minmax(", min.value, ", ", max.value, ")"))
}

public func `repeat`(_ count: GridRepeat, _ value: Length) -> Length {
	Length(concat("repeat(", count.rawValue, ", ", value.value, ")"))
}

public func `repeat`(_ count: Int, _ value: Length) -> Length {
	Length(concat("repeat(", intToString(count), ", ", value.value, ")"))
}

#endif

private func concat(_ parts: String...) -> String {
	var buffer: [UInt8] = []
	for part in parts {
		buffer.append(contentsOf: part.utf8)
	}
	return String(decoding: buffer, as: UTF8.self)
}
