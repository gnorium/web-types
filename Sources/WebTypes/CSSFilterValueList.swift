#if os(WASI)

import Utilities

#endif

// <filter-value-list> = [ <filter-function> | <url> ]+
public struct CSSFilterValueList: Sendable {
	public enum Value: Sendable {
		case filterFunction(CSSFilterFunction)
		case url(String)

		public var value: String {
			switch self {
			case .filterFunction(let function):
				return function.value
			case .url(let url):
				return "url(\(url))"
			}
		}
	}

	public let values: [Value]

	public init(_ values: Value...) {
		self.values = values
	}

	#if !os(WASI)
	public var value: String {
		values.map { $0.value }.joined(separator: " ")
	}
	#endif

	#if os(WASI)
	public var value: String {
		var buffer: [UInt8] = []
		for (index, val) in values.enumerated() {
			if index > 0 {
				buffer.append(32) // space
			}
			buffer.append(contentsOf: val.value.utf8)
		}
		return String(decoding: buffer, as: UTF8.self)
	}
	#endif
}
