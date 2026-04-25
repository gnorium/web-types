import EmbeddedSwiftUtilities

public enum CSSSingleTransitionProperty: Sendable, CSSVariableConvertible {
  case transform
  case opacity
  case width
  case height
  case color
  case backgroundColor
  case borderColor
  case borderTopColor
  case borderRightColor
  case borderBottomColor
  case borderLeftColor
  case borderTopWidth
  case borderRightWidth
  case borderBottomWidth
  case borderLeftWidth
  case margin
  case marginTop
  case marginRight
  case marginBottom
  case marginLeft
  case padding
  case paddingTop
  case paddingRight
  case paddingBottom
  case paddingLeft
  case top
  case right
  case bottom
  case left
  case fontSize
  case fontWeight
  case letterSpacing
  case lineWeight
  case visibility
  case zIndex
  case boxShadow
  case textShadow
  case filter
  case backdropFilter
  case objectPosition
  case objectFit
  case variable(String)

  public static var all: CSSKeyword.All { .all }
  public static var none: CSSKeyword.None { .none }

  public var value: String {
    switch self {
    case .transform: return "transform"
    case .opacity: return "opacity"
    case .width: return "width"
    case .height: return "height"
    case .color: return "color"
    case .backgroundColor: return "background-color"
    case .borderColor: return "border-color"
    case .borderTopColor: return "border-top-color"
    case .borderRightColor: return "border-right-color"
    case .borderBottomColor: return "border-bottom-color"
    case .borderLeftColor: return "border-left-color"
    case .borderTopWidth: return "border-top-width"
    case .borderRightWidth: return "border-right-width"
    case .borderBottomWidth: return "border-bottom-width"
    case .borderLeftWidth: return "border-left-width"
    case .margin: return "margin"
    case .marginTop: return "margin-top"
    case .marginRight: return "margin-right"
    case .marginBottom: return "margin-bottom"
    case .marginLeft: return "margin-left"
    case .padding: return "padding"
    case .paddingTop: return "padding-top"
    case .paddingRight: return "padding-right"
    case .paddingBottom: return "padding-bottom"
    case .paddingLeft: return "padding-left"
    case .top: return "top"
    case .right: return "right"
    case .bottom: return "bottom"
    case .left: return "left"
    case .fontSize: return "font-size"
    case .fontWeight: return "font-weight"
    case .letterSpacing: return "letter-spacing"
    case .lineWeight: return "line-weight"
    case .visibility: return "visibility"
    case .zIndex: return "z-index"
    case .boxShadow: return "box-shadow"
    case .textShadow: return "text-shadow"
    case .filter: return "filter"
    case .backdropFilter: return "backdrop-filter"
    case .objectPosition: return "object-position"
    case .objectFit: return "object-fit"
    case .variable(let name): return "var(\(name))"
    }
  }

  public var staticRawValue: StaticString? {
    switch self {
    case .transform: return "transform"
    case .opacity: return "opacity"
    case .width: return "width"
    case .height: return "height"
    case .color: return "color"
    case .backgroundColor: return "background-color"
    case .borderColor: return "border-color"
    case .borderTopColor: return "border-top-color"
    case .borderRightColor: return "border-right-color"
    case .borderBottomColor: return "border-bottom-color"
    case .borderLeftColor: return "border-left-color"
    case .borderTopWidth: return "border-top-width"
    case .borderRightWidth: return "border-right-width"
    case .borderBottomWidth: return "border-bottom-width"
    case .borderLeftWidth: return "border-left-width"
    case .margin: return "margin"
    case .marginTop: return "margin-top"
    case .marginRight: return "margin-right"
    case .marginBottom: return "margin-bottom"
    case .marginLeft: return "margin-left"
    case .padding: return "padding"
    case .paddingTop: return "padding-top"
    case .paddingRight: return "padding-right"
    case .paddingBottom: return "padding-bottom"
    case .paddingLeft: return "padding-left"
    case .top: return "top"
    case .right: return "right"
    case .bottom: return "bottom"
    case .left: return "left"
    case .fontSize: return "font-size"
    case .fontWeight: return "font-weight"
    case .letterSpacing: return "letter-spacing"
    case .lineWeight: return "line-weight"
    case .visibility: return "visibility"
    case .zIndex: return "z-index"
    case .boxShadow: return "box-shadow"
    case .textShadow: return "text-shadow"
    case .filter: return "filter"
    case .backdropFilter: return "backdrop-filter"
    case .objectPosition: return "object-position"
    case .objectFit: return "object-fit"
    case .variable: return nil
    }
  }
}
