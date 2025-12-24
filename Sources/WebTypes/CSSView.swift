#if os(WASI)

import Utilities

#endif

// <view()> = view( [ <axis> || <'view-timeline-inset'> ]? )
public struct CSSView: Sendable {
	public let axis: CSSAxis?
	public let inset: CSSViewTimelineInset?

	public init(axis: CSSAxis? = nil, inset: CSSViewTimelineInset? = nil) {
		self.axis = axis
		self.inset = inset
	}

	#if !os(WASI)
	public var value: String {
		var components: [String] = []
		if let axis = axis {
			components.append(axis.rawValue)
		}
		if let inset = inset {
			components.append(inset.value)
		}

		if components.isEmpty {
			return "view()"
		}
		return "view(\(components.joined(separator: " ")))"
	}
	#endif

	#if os(WASI)
	public var value: String {
		var buffer: [UInt8] = []
		buffer.append(contentsOf: "view(".utf8)

		var hasContent = false
		if let axis = axis {
			buffer.append(contentsOf: axis.rawValue.utf8)
			hasContent = true
		}
		if let inset = inset {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: inset.value.utf8)
		}

		buffer.append(41) // ')'
		return String(decoding: buffer, as: UTF8.self)
	}
	#endif
}

// Convenience helper function
public func view(_ axis: CSSAxis? = nil, _ inset: CSSViewTimelineInset? = nil) -> CSSView {
	CSSView(axis: axis, inset: inset)
}
