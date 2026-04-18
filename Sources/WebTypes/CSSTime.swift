#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// CSSTime - CSSContent time values
public struct CSSTime: Sendable, CSSVariableConvertible {
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
    
    public var staticRawValue: StaticString? {
        switch storage {
        case .static(let str): return str
        default: return nil
        }
    }


	internal init(_ value: String) {
		self.storage = .dynamic(value)
	}

	public static func variable(_ name: String) -> CSSTime {
		CSSTime(concat("var(", name, ")"))
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
