public enum HTMLAttributeName: String, Sendable {
	case ariaDisabled = "aria-disabled"
	case ariaSelected = "aria-selected"
	case ariaExpanded = "aria-expanded"
	case ariaHidden = "aria-hidden"
	case ariaLabel = "aria-label"
	case ariaLabelledBy = "aria-labelledby"
	case ariaDescribedBy = "aria-describedby"
	case ariaMultiselectable = "aria-multiselectable"
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
	case disabled = "disabled"
	case checked = "checked"
	case selected = "selected"
	case hidden = "hidden"
	case open = "open"
	case tabindex = "tabindex"

	// Nested marker enums for type-safe value resolution

	/// Marker for `type` attribute - only accepts HTMLButton.Type values
	public enum `Type`: Sendable {
		case type
	}

	/// Marker for `role` attribute - only accepts ARIARole values
	public enum Role: Sendable {
		case role
	}

	/// Marker for `aria-live` attribute - only accepts ARIALive values
	public enum AriaLive: Sendable {
		case ariaLive
	}
}
