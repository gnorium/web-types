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
        }
    }
}
