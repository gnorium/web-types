#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <dashed-ident> = CSSProtocol custom property identifier starting with --
public struct CSSDashedIdent: Sendable {
	public let value: String

	public init(_ value: String) {
		// Ensure it starts with --
		if value.hasPrefix("--") {
			self.value = value
		} else {
			self.value = "--\(value)"
		}
	}
}
