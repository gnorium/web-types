/// A phantom-typed CSS property name that links a property to its expected value type.
public struct CSSProperty<Value>: Sendable {
  public let name: CSSPropertyName

  public init(_ name: CSSPropertyName) {
    self.name = name
  }
}

extension CSSProperty where Value == CSS.Color {
  public static var color: CSSProperty<CSS.Color> { .init(.color) }
  public static var backgroundColor: CSSProperty<CSS.Color> { .init(.backgroundColor) }
  public static var stroke: CSSProperty<CSS.Color> { .init(.stroke) }
  public static var fill: CSSProperty<CSS.Color> { .init(.fill) }
}

extension CSSProperty where Value == CSS.LengthPercentage {
  public static var width: CSSProperty<CSS.LengthPercentage> { .init(.width) }
  public static var height: CSSProperty<CSS.LengthPercentage> { .init(.height) }
  public static var top: CSSProperty<CSS.LengthPercentage> { .init(.top) }
  public static var left: CSSProperty<CSS.LengthPercentage> { .init(.left) }
  public static var right: CSSProperty<CSS.LengthPercentage> { .init(.right) }
  public static var bottom: CSSProperty<CSS.LengthPercentage> { .init(.bottom) }
  public static var margin: CSSProperty<CSS.LengthPercentage> { .init(.margin) }
  public static var padding: CSSProperty<CSS.LengthPercentage> { .init(.padding) }
  public static var minWidth: CSSProperty<CSS.LengthPercentage> { .init(.minWidth) }
  public static var gap: CSSProperty<CSS.LengthPercentage> { .init(.gap) }
  public static var marginLeft: CSSProperty<CSS.LengthPercentage> { .init(.marginLeft) }
}

extension CSSProperty where Value == Double {
  public static var opacity: CSSProperty<Double> { .init(.opacity) }
  public static var strokeOpacity: CSSProperty<Double> { .init(.strokeOpacity) }
  public static var strokeWidth: CSSProperty<Double> { .init(.strokeWidth) }
}

extension CSSProperty where Value == Int {
  public static var zIndex: CSSProperty<Int> { .init(.zIndex) }
}

extension CSSProperty where Value == CSS.Display {
  public static var display: CSSProperty<CSS.Display> { .init(.display) }
}

extension CSSProperty where Value == CSS.Visibility {
  public static var visibility: CSSProperty<CSS.Visibility> { .init(.visibility) }
}

extension CSSProperty where Value == CSS.Position {
  public static var position: CSSProperty<CSS.Position> { .init(.position) }
}

extension CSSProperty where Value == CSS.Cursor {
  public static var cursor: CSSProperty<CSS.Cursor> { .init(.cursor) }
}

extension CSSProperty where Value == CSS.PointerEvents {
  public static var pointerEvents: CSSProperty<CSS.PointerEvents> { .init(.pointerEvents) }
}

extension CSSProperty where Value == String {
  public static var filter: CSSProperty<String> { .init(.filter) }
  public static var transform: CSSProperty<String> { .init(.transform) }
  public static var transition: CSSProperty<String> { .init(.transition) }
  public static var animation: CSSProperty<String> { .init(.animation) }
  public static var maxWidth: CSSProperty<String> { .init(.maxWidth) }
}

extension CSSProperty where Value == CSS.Overflow {
  public static var overflow: CSSProperty<CSS.Overflow> { .init(.overflow) }
}

extension CSSProperty where Value == CSS.TextOverflow {
  public static var textOverflow: CSSProperty<CSS.TextOverflow> { .init(.textOverflow) }
}

extension CSSProperty where Value == CSS.WhiteSpace {
  public static var whiteSpace: CSSProperty<CSS.WhiteSpace> { .init(.whiteSpace) }
}

extension CSSProperty where Value == CSS.VerticalAlign {
  public static var verticalAlign: CSSProperty<CSS.VerticalAlign> { .init(.verticalAlign) }
}

extension CSSProperty where Value == CSS.AlignItems {
  public static var alignItems: CSSProperty<CSS.AlignItems> { .init(.alignItems) }
}

extension CSSProperty where Value == CSS.JustifyContent {
  public static var justifyContent: CSSProperty<CSS.JustifyContent> { .init(.justifyContent) }
}

extension CSSProperty where Value == CSS.BorderCollapse {
  public static var borderCollapse: CSSProperty<CSS.BorderCollapse> { .init(.borderCollapse) }
}
