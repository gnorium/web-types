extension CSS.Color: CSSPaintConvertible {
  public var asCSSPaint: CSS.Paint { .color(self) }
}
