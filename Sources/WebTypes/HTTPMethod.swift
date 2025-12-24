#if !os(WASI)

public enum HTTPMethod: String {
	case get = "get"
	case post = "post"
	case put = "put"
	case delete = "delete"
	case patch = "patch"
}

#endif
