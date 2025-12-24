#if os(WASI)

import Utilities

#endif

public enum CSSWordBreak: String, Sendable {
    case normal
    case breakAll = "break-all"
    case keepAll = "keep-all"
    case breakWord = "break-word"
    case initial
    case inherit
    
    public var value: String {
        return rawValue
    }
}
