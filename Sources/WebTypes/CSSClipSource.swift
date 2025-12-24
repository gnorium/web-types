#if os(WASI)

import Utilities

#endif

// <clip-source> = <url>

public enum CSSClipSource: Sendable {
	case url(String)

	public var value: String {
		switch self {
		case .url(let url):
			return "url(\(url))"
		}
	}
}
