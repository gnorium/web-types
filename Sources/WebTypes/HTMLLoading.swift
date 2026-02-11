/// HTMLProtocol loading attribute values for lazy loading images and iframes
/// https://html.spec.whatwg.org/multipage/urls-and-fetching.html#lazy-loading-attributes
public enum HTMLLoading: String, Sendable {
	/// Eagerly load the resource (default browser behavior)
	case eager = "eager"
	
	/// Defer loading until the resource is near the viewport
	case lazy = "lazy"
}
