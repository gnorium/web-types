extension HTML {
  /// HTML `translate` attribute values
  /// https://html.spec.whatwg.org/multipage/dom.html#attr-translate
  public enum Translate: String, Sendable {
    /// Enable translation (default browser behavior)
    case yes = "yes"

    /// Disable translation for this element and its descendants
    case no = "no"
  }
}
