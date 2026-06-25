public enum CSSPropertyName: Sendable {
  case filter
  case strokeOpacity
  case backgroundColor
  case color
  case opacity
  case width
  case height
  case display
  case visibility
  case position
  case top
  case left
  case right
  case bottom
  case margin
  case padding
  case transform
  case transition
  case animation
  case zIndex
  case cursor
  case pointerEvents
  case overflow
  case stroke
  case fill
  case strokeWidth
  case tableLayout
  case minWidth
  case maxWidth
  case textOverflow
  case whiteSpace
  case flexShrink
  case gap
  case verticalAlign
  case marginLeft
  case alignItems
  case justifyContent
  case borderCollapse
  case background
  case backgroundClip
  case backgroundImage
  case backgroundPosition
  case backgroundRepeat
  case border
  case borderBottom
  case borderBottomWidth
  case borderColor
  case borderInlineEnd
  case borderLeft
  case borderLeftWidth
  case borderRadius
  case borderRight
  case borderRightWidth
  case borderTop
  case borderTopWidth
  case borderWidth
  case boxShadow
  case boxSizing
  case flex
  case flexDirection
  case fontFamily
  case fontSize
  case fontStyle
  case fontWeight
  case lineHeight
  case marginBottom
  case marginRight
  case marginTop
  case mask
  case maskImage
  case webkitMaskImage
  case webkitTouchCallout
  case webkitUserSelect
  case maxHeight
  case minHeight
  case outline
  case outlineOffset
  case overflowWrap
  case paddingBottom
  case paddingLeft
  case paddingRight
  case paddingTop
  case textDecoration
  case userSelect
  case textAlign

  public var rawValue: StaticString {
    switch self {
    case .filter: return "filter"
    case .strokeOpacity: return "stroke-opacity"
    case .backgroundColor: return "background-color"
    case .color: return "color"
    case .opacity: return "opacity"
    case .width: return "width"
    case .height: return "height"
    case .display: return "display"
    case .visibility: return "visibility"
    case .position: return "position"
    case .top: return "top"
    case .left: return "left"
    case .right: return "right"
    case .bottom: return "bottom"
    case .margin: return "margin"
    case .padding: return "padding"
    case .transform: return "transform"
    case .transition: return "transition"
    case .animation: return "animation"
    case .zIndex: return "z-index"
    case .cursor: return "cursor"
    case .pointerEvents: return "pointer-events"
    case .overflow: return "overflow"
    case .stroke: return "stroke"
    case .fill: return "fill"
    case .strokeWidth: return "stroke-width"
    case .tableLayout: return "table-layout"
    case .minWidth: return "min-width"
    case .maxWidth: return "max-width"
    case .textOverflow: return "text-overflow"
    case .whiteSpace: return "white-space"
    case .flexShrink: return "flex-shrink"
    case .gap: return "gap"
    case .verticalAlign: return "vertical-align"
    case .marginLeft: return "margin-left"
    case .alignItems: return "align-items"
    case .justifyContent: return "justify-content"
    case .borderCollapse: return "border-collapse"
    case .background: return "background"
    case .backgroundClip: return "background-clip"
    case .backgroundImage: return "background-image"
    case .backgroundPosition: return "background-position"
    case .backgroundRepeat: return "background-repeat"
    case .border: return "border"
    case .borderBottom: return "border-bottom"
    case .borderBottomWidth: return "border-bottom-width"
    case .borderColor: return "border-color"
    case .borderInlineEnd: return "border-inline-end"
    case .borderLeft: return "border-left"
    case .borderLeftWidth: return "border-left-width"
    case .borderRadius: return "border-radius"
    case .borderRight: return "border-right"
    case .borderRightWidth: return "border-right-width"
    case .borderTop: return "border-top"
    case .borderTopWidth: return "border-top-width"
    case .borderWidth: return "border-width"
    case .boxShadow: return "box-shadow"
    case .boxSizing: return "box-sizing"
    case .flex: return "flex"
    case .flexDirection: return "flex-direction"
    case .fontFamily: return "font-family"
    case .fontSize: return "font-size"
    case .fontStyle: return "font-style"
    case .fontWeight: return "font-weight"
    case .lineHeight: return "line-height"
    case .marginBottom: return "margin-bottom"
    case .marginRight: return "margin-right"
    case .marginTop: return "margin-top"
    case .mask: return "mask"
    case .maskImage: return "mask-image"
    case .webkitMaskImage: return "-webkit-mask-image"
    case .webkitTouchCallout: return "-webkit-touch-callout"
    case .webkitUserSelect: return "-webkit-user-select"
    case .maxHeight: return "max-height"
    case .minHeight: return "min-height"
    case .outline: return "outline"
    case .outlineOffset: return "outline-offset"
    case .overflowWrap: return "overflow-wrap"
    case .paddingBottom: return "padding-bottom"
    case .paddingLeft: return "padding-left"
    case .paddingRight: return "padding-right"
    case .paddingTop: return "padding-top"
    case .textDecoration: return "text-decoration"
    case .userSelect: return "user-select"
    case .textAlign: return "text-align"
    }
  }
}
