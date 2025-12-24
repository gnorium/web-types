public enum HTMLAttributeName: String, Sendable {
	case ariaDisabled = "aria-disabled"
	case ariaSelected = "aria-selected"
	case ariaExpanded = "aria-expanded"
	case ariaHidden = "aria-hidden"
	case ariaLabel = "aria-label"
	case ariaLabelledBy = "aria-labelledby"
	case ariaDescribedBy = "aria-describedby"
	case ariaMultiselectable = "aria-multiselectable"
	case ariaLive = "aria-live"
	case role = "role"
	case textContent = "textContent"
	case indeterminate = "indeterminate"
	case style = "style"
	case `class` = "class"
	case id = "id"
	case href = "href"
	case src = "src"
	case alt = "alt"
	case title = "title"
	case placeholder = "placeholder"
	case value = "value"
	case type = "type"
	case disabled = "disabled"
	case checked = "checked"
	case selected = "selected"
	case hidden = "hidden"
	case open = "open"
	case tabindex = "tabindex"
	
	// Nested types for type-safe setAttribute overloads
	public enum ARIADisabled { case ariaDisabled }
	public enum ARIASelected { case ariaSelected }
	public enum ARIAExpanded { case ariaExpanded }
	public enum ARIAHidden { case ariaHidden }
	public enum ARIALabel { case ariaLabel }
	public enum ARIALabelledBy { case ariaLabelledBy }
	public enum ARIADescribedBy { case ariaDescribedBy }
	public enum ARIAMultiselectable { case ariaMultiselectable }
	public enum ARIALive { case ariaLive }
	public enum Role { case role }
	public enum TextContent { case textContent }
	public enum Indeterminate { case indeterminate }
	public enum Style { case style }
	public enum Class { case `class` }
	public enum Id { case id }
	public enum Href { case href }
	public enum Src { case src }
	public enum Alt { case alt }
	public enum Title { case title }
	public enum Placeholder { case placeholder }
	public enum Value { case value }
	public enum `Type` { case type }
	public enum Disabled { case disabled }
	public enum Checked { case checked }
	public enum Selected { case selected }
	public enum Hidden { case hidden }
	public enum Open { case `open` }
	public enum Tabindex { case tabindex }
}
