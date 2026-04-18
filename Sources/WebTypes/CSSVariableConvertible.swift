#if os(WASI)
 
import EmbeddedSwiftUtilities

#endif
 
public protocol CSSVariableConvertible: Sendable {
    static func variable(_ name: String) -> Self
}
 
/// A fluent helper for referencing CSS variables.
/// Example: `public let glyphRed: CSSColor = var("--glyph-red")`
public func `var`<T: CSSVariableConvertible>(_ name: String) -> T {
    T.variable(name)
}
