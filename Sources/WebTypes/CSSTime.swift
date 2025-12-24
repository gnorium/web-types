#if os(WASI)

import Utilities

#endif

// CSSTime - CSS time values
public struct CSSTime: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, ExpressibleByStringLiteral, Sendable {
	private enum Storage: Sendable {
		case dynamic(String)
		case `static`(StaticString)
	}

	private let storage: Storage

	public var value: String {
		switch storage {
		case .dynamic(let str): return str
		case .static(let str): return str.withUTF8Buffer { String(decoding: $0, as: UTF8.self) }
		}
	}
    
    public var staticValue: StaticString? {
        switch storage {
        case .static(let str): return str
        default: return nil
        }
    }

	#if !os(WASI)
	public init(integerLiteral value: Int) {
		self.storage = .dynamic("\(value)")
	}

	public init(floatLiteral value: Double) {
		self.storage = .dynamic("\(value)")
	}
	#endif

	#if os(WASI)
	public init(integerLiteral value: Int) {
		self.storage = .dynamic(intToString(value))
	}

	public init(floatLiteral value: Double) {
		self.storage = .dynamic(doubleToString(value))
	}
	#endif

    public typealias StringLiteralType = StaticString
	public init(stringLiteral value: StaticString) {
		self.storage = .static(value)
	}

	public init(_ value: String) {
		self.storage = .dynamic(value)
	}
}

// Convenience functions
#if !os(WASI)

public func s(_ int: Int) -> CSSTime {
	CSSTime("\(int)s")
}

#endif

#if os(WASI)

public func s(_ int: Int) -> CSSTime {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: intToString(int).utf8)
	buffer.append(115) // 's'
	return CSSTime(String(decoding: buffer, as: UTF8.self))
}

#endif

#if !os(WASI)

public func s(_ double: Double) -> CSSTime {
	CSSTime("\(double)s")
}

#endif

#if os(WASI)

public func s(_ double: Double) -> CSSTime {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: doubleToString(double).utf8)
	buffer.append(115) // 's'
	return CSSTime(String(decoding: buffer, as: UTF8.self))
}

#endif

#if !os(WASI)

public func ms(_ int: Int) -> CSSTime {
	CSSTime("\(int)ms")
}

#endif

#if os(WASI)

public func ms(_ int: Int) -> CSSTime {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: intToString(int).utf8)
	buffer.append(109) // 'm'
	buffer.append(115) // 's'
	return CSSTime(String(decoding: buffer, as: UTF8.self))
}

#endif

#if !os(WASI)

public func ms(_ double: Double) -> CSSTime {
	CSSTime("\(double)ms")
}

#endif

#if os(WASI)

public func ms(_ double: Double) -> CSSTime {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: doubleToString(double).utf8)
	buffer.append(109) // 'm'
	buffer.append(115) // 's'
	return CSSTime(String(decoding: buffer, as: UTF8.self))
}

#endif

