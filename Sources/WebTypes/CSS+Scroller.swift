// <scroller> = root | nearest | self
extension CSS {
  public enum Scroller: String, Sendable {
    case root = "root"
    case nearest = "nearest"
    case `self` = "self"
  }
}
