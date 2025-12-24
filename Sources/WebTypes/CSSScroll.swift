#if os(WASI)

import Utilities

#endif

// <scroll()> = scroll( [ <scroller> || <axis> ]? )
public struct CSSScroll: Sendable {
	public let scroller: CSSScroller?
	public let axis: CSSAxis?

	public init(scroller: CSSScroller? = nil, axis: CSSAxis? = nil) {
		self.scroller = scroller
		self.axis = axis
	}

	#if !os(WASI)
	public var value: String {
		var components: [String] = []
		if let scroller = scroller {
			components.append(scroller.rawValue)
		}
		if let axis = axis {
			components.append(axis.rawValue)
		}

		if components.isEmpty {
			return "scroll()"
		}
		return "scroll(\(components.joined(separator: " ")))"
	}
	#endif

	#if os(WASI)
	public var value: String {
		var buffer: [UInt8] = []
		buffer.append(contentsOf: "scroll(".utf8)

		var hasContent = false
		if let scroller = scroller {
			buffer.append(contentsOf: scroller.rawValue.utf8)
			hasContent = true
		}
		if let axis = axis {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: axis.rawValue.utf8)
		}

		buffer.append(41) // ')'
		return String(decoding: buffer, as: UTF8.self)
	}
	#endif
}

// Convenience helper function
public func scroll(_ scroller: CSSScroller? = nil, _ axis: CSSAxis? = nil) -> CSSScroll {
	CSSScroll(scroller: scroller, axis: axis)
}
