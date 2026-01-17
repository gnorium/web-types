#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public struct Length: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, ExpressibleByStringLiteral, Sendable, CustomStringConvertible, RangeReplaceableCollection {
	public let value: String

	// RangeReplaceableCollection conformance
	public typealias Element = Character
	public typealias Index = String.Index

	public var startIndex: String.Index { value.startIndex }
	public var endIndex: String.Index { value.endIndex }

	public func index(after i: String.Index) -> String.Index {
		value.index(after: i)
	}

	public subscript(position: String.Index) -> Character {
		value[position]
	}

	public init() {
		self.value = ""
	}

	public mutating func replaceSubrange<C>(_ subrange: Range<String.Index>, with newElements: C) where C : Collection, C.Element == Character {
		// Since value is let, we create a new instance
		var mutableValue = value
		mutableValue.replaceSubrange(subrange, with: newElements)
		self = Length(mutableValue)
	}

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

public func pt(_ int: Int) -> Length {
	Length("\(int)pt")
}

public func pt(_ double: Double) -> Length {
	Length("\(double)pt")
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


// Arithmetic operators for Length
public func + (lhs: Length, rhs: Length) -> Length {
	Length("\(lhs.value) + \(rhs.value)")
}

public func - (lhs: Length, rhs: Length) -> Length {
	Length("\(lhs.value) - \(rhs.value)")
}

// Unary negation operator
public prefix func - (value: Length) -> Length {
	Length("-\(value.value)")
}

@_disfavoredOverload
public func * (lhs: Length, rhs: Int) -> Length {
	Length("\(lhs.value) * \(rhs)")
}

@_disfavoredOverload
public func * (lhs: Int, rhs: Length) -> Length {
	Length("\(lhs) * \(rhs.value)")
}

@_disfavoredOverload
public func * (lhs: Length, rhs: Double) -> Length {
	Length("\(lhs.value) * \(rhs)")
}

@_disfavoredOverload
public func * (lhs: Double, rhs: Length) -> Length {
	Length("\(lhs) * \(rhs.value)")
}

public func / (lhs: Length, rhs: Int) -> Length {
	Length("\(lhs.value) / \(rhs)")
}

public func / (lhs: Length, rhs: Double) -> Length {
	Length("\(lhs.value) / \(rhs)")
}

public func / (lhs: Length, rhs: Length) -> Length {
	Length("(\(lhs.value)) / (\(rhs.value))")
}
