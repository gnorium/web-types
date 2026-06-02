/// A phantom-typed SVG attribute name that links a property to its expected value type.
public struct SVGAttribute<Value>: Sendable {
  public let name: SVGAttributeName

  public init(_ name: SVGAttributeName) {
    self.name = name
  }
}

extension SVGAttribute where Value == [(Double, Double)] {
  public static var points: SVGAttribute<[(Double, Double)]> { .init(.points) }
}

extension SVGAttribute where Value == CSS.Percentage {
  public static var x: SVGAttribute<CSS.Percentage> { .init(.x) }
  public static var y: SVGAttribute<CSS.Percentage> { .init(.y) }
  public static var width: SVGAttribute<CSS.Percentage> { .init(.width) }
  public static var height: SVGAttribute<CSS.Percentage> { .init(.height) }
}

extension SVGAttribute where Value == Double {
  public static var opacity: SVGAttribute<Double> { .init(.opacity) }
}

extension SVGAttribute where Value == CSS.Length {
  public static var x: SVGAttribute<CSS.Length> { .init(.x) }
  public static var y: SVGAttribute<CSS.Length> { .init(.y) }
  public static var width: SVGAttribute<CSS.Length> { .init(.width) }
  public static var height: SVGAttribute<CSS.Length> { .init(.height) }
}

extension SVGAttribute where Value == [SVG.Path.Definition.Command] {
  public static var d: SVGAttribute<[SVG.Path.Definition.Command]> { .init(.d) }
}
