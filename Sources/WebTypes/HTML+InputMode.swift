extension HTML {
  /// The `inputmode` global attribute: which virtual keyboard an editable
  /// element asks for. `none` asks for none, for a field the page fills
  /// through its own control.
  public enum InputMode: String, Sendable {
    case none = "none"
    case text = "text"
    case decimal = "decimal"
    case numeric = "numeric"
    case tel = "tel"
    case search = "search"
    case email = "email"
    case url = "url"
  }
}
