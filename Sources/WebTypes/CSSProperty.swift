/// A phantom-typed CSS property name that links a property to its expected value type.
public struct CSSProperty<Value>: Sendable {
  public let name: CSSPropertyName

  public init(_ name: CSSPropertyName) {
    self.name = name
  }
}

extension CSSProperty where Value == CSSColor {
  public static var color: CSSProperty<CSSColor> { .init(.color) }
  public static var backgroundColor: CSSProperty<CSSColor> { .init(.backgroundColor) }
  public static var stroke: CSSProperty<CSSColor> { .init(.stroke) }
  public static var fill: CSSProperty<CSSColor> { .init(.fill) }
}

extension CSSProperty where Value == Length {
  public static var width: CSSProperty<Length> { .init(.width) }
  public static var height: CSSProperty<Length> { .init(.height) }
  public static var top: CSSProperty<Length> { .init(.top) }
  public static var left: CSSProperty<Length> { .init(.left) }
  public static var right: CSSProperty<Length> { .init(.right) }
  public static var bottom: CSSProperty<Length> { .init(.bottom) }
  public static var margin: CSSProperty<Length> { .init(.margin) }
  public static var padding: CSSProperty<Length> { .init(.padding) }
}

extension CSSProperty where Value == Percentage {
  public static var width: CSSProperty<Percentage> { .init(.width) }
  public static var height: CSSProperty<Percentage> { .init(.height) }
  public static var top: CSSProperty<Percentage> { .init(.top) }
  public static var left: CSSProperty<Percentage> { .init(.left) }
  public static var right: CSSProperty<Percentage> { .init(.right) }
  public static var bottom: CSSProperty<Percentage> { .init(.bottom) }
  public static var margin: CSSProperty<Percentage> { .init(.margin) }
  public static var padding: CSSProperty<Percentage> { .init(.padding) }
}

extension CSSProperty where Value == LengthPercentage {
  public static var width: CSSProperty<LengthPercentage> { .init(.width) }
  public static var height: CSSProperty<LengthPercentage> { .init(.height) }
  public static var top: CSSProperty<LengthPercentage> { .init(.top) }
  public static var left: CSSProperty<LengthPercentage> { .init(.left) }
  public static var right: CSSProperty<LengthPercentage> { .init(.right) }
  public static var bottom: CSSProperty<LengthPercentage> { .init(.bottom) }
  public static var margin: CSSProperty<LengthPercentage> { .init(.margin) }
  public static var padding: CSSProperty<LengthPercentage> { .init(.padding) }
}

extension CSSProperty where Value == Double {
  public static var opacity: CSSProperty<Double> { .init(.opacity) }
  public static var strokeOpacity: CSSProperty<Double> { .init(.strokeOpacity) }
  public static var strokeWidth: CSSProperty<Double> { .init(.strokeWidth) }
}

extension CSSProperty where Value == Int {
  public static var zIndex: CSSProperty<Int> { .init(.zIndex) }
}

extension CSSProperty where Value == CSSDisplay {
  public static var display: CSSProperty<CSSDisplay> { .init(.display) }
}

extension CSSProperty where Value == CSSVisibility {
  public static var visibility: CSSProperty<CSSVisibility> { .init(.visibility) }
}

extension CSSProperty where Value == CSSPosition {
  public static var position: CSSProperty<CSSPosition> { .init(.position) }
}

extension CSSProperty where Value == CSSCursor {
  public static var cursor: CSSProperty<CSSCursor> { .init(.cursor) }
}

extension CSSProperty where Value == CSSPointerEvents {
  public static var pointerEvents: CSSProperty<CSSPointerEvents> { .init(.pointerEvents) }
}

extension CSSProperty where Value == String {
  public static var filter: CSSProperty<String> { .init(.filter) }
  public static var transform: CSSProperty<String> { .init(.transform) }
  public static var transition: CSSProperty<String> { .init(.transition) }
  public static var animation: CSSProperty<String> { .init(.animation) }
}
