#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <clip-source> = <url>

public enum CSSClipSource: Sendable {
	case url(String)

	public var value: String {
		switch self {
		case .url(let urlValue):
			return WebTypes.url("\(urlValue)")
		}
	}
}
