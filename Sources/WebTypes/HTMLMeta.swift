#if os(WASI)

import EmbeddedSwiftUtilities

#endif

#if !os(WASI)

public enum HTMLMeta {

	public enum CharSet: String {
		case UTF8 = "UTF-8"
		case ISO88591 = "ISO-8859-1"
		case Windows1252 = "Windows-1252"
	}

	public enum Property {

		public enum OpenGraph: String {
			case ogType = "og:type"
			case ogUrl = "og:url"
			case ogTitle = "og:title"
			case ogDescription = "og:description"
			case ogImage = "og:image"
			case ogImageWidth = "og:image:width"
			case ogImageHeight = "og:image:height"
			case ogImageType = "og:image:type"
			case ogImageAlt = "og:image:alt"
			case ogSiteName = "og:site_name"
			case ogLocale = "og:locale"

			public enum `Type` {
				public enum Content: String {
					case website = "website"
					case article = "article"
					case book = "book"
					case profile = "profile"
					case musicSong = "music.song"
					case musicAlbum = "music.album"
					case musicPlaylist = "music.playlist"
					case musicRadioStation = "music.radio_station"
					case videoMovie = "video.movie"
					case videoEpisode = "video.episode"
					case videoTVShow = "video.tv_show"
					case videoOther = "video.other"
				}
			}
		}
	}

	public enum Name: String {
		case description = "description"
		case keywords = "keywords"
		case author = "author"
		case robots = "robots"
		case viewport = "viewport"
		case themeColor = "theme-color"
		case mobileWebAppCapable = "mobile-web-app-capable"
		case twitterCard = "twitter:card"

		public enum MobileWebAppCapable {
			public enum Content: String {
				case yes = "yes"
				case no = "no"
			}
		}
		case twitterUrl = "twitter:url"
		case twitterTitle = "twitter:title"
		case twitterDescription = "twitter:description"
		case twitterImage = "twitter:image"
		case twitterSite = "twitter:site"

		public enum TwitterCard {
			public enum Content: String {
				case summary = "summary"
				case summaryLargeImage = "summary_large_image"
				case app = "app"
				case player = "player"
			}
		}

		public enum Robots: String {
			case index = "index"
			case noindex = "noindex"
			case follow = "follow"
			case nofollow = "nofollow"
			case noarchive = "noarchive"
			case nosnippet = "nosnippet"
			case noimageindex = "noimageindex"
			case nocache = "nocache"

			public static func content(_ directives: Robots...) -> String {
				directives.map { $0.rawValue }.joined(separator: ", ")
			}
		}

		public enum Viewport {
			public struct Content {
				var properties: [(String, String)] = []

				public init() {}

				public func render() -> String {
					properties.map { "\($0.0)=\($0.1)" }.joined(separator: ", ")
				}

				public enum Width {
					case deviceWidth
					case pixels(Int)

					var value: String {
						switch self {
						case .deviceWidth:
							return "device-width"
						case .pixels(let px):
							return "\(px)"
						}
					}
				}

				public enum Height {
					case deviceHeight
					case pixels(Int)

					var value: String {
						switch self {
						case .deviceHeight:
							return "device-height"
						case .pixels(let px):
							return "\(px)"
						}
					}
				}

				public enum UserScalable {
					case yes
					case no

					var value: String {
						switch self {
						case .yes:
							return "yes"
						case .no:
							return "no"
						}
					}
				}

				public enum InteractiveWidget {
					case resizesVisual
					case resizesContent
					case overlaysContent

					var value: String {
						switch self {
						case .resizesVisual:
							return "resizes-visual"
						case .resizesContent:
							return "resizes-content"
						case .overlaysContent:
							return "overlays-content"
						}
					}
				}

				public enum ViewportFit {
					case auto
					case contain
					case cover

					var value: String {
						switch self {
						case .auto:
							return "auto"
						case .contain:
							return "contain"
						case .cover:
							return "cover"
						}
					}
				}
			}
		}
	}
}

public func width(_ value: HTMLMeta.Name.Viewport.Content.Width) -> HTMLMeta.Name.Viewport.Content {
	var vc = HTMLMeta.Name.Viewport.Content()
	vc.properties.append(("width", value.value))
	return vc
}

public func height(_ value: HTMLMeta.Name.Viewport.Content.Height) -> HTMLMeta.Name.Viewport.Content {
	var vc = HTMLMeta.Name.Viewport.Content()
	vc.properties.append(("height", value.value))
	return vc
}

public func initialScale(_ value: Double) -> HTMLMeta.Name.Viewport.Content {
	var vc = HTMLMeta.Name.Viewport.Content()
	vc.properties.append(("initial-scale", "\(value)"))
	return vc
}

public func minimumScale(_ value: Double) -> HTMLMeta.Name.Viewport.Content {
	var vc = HTMLMeta.Name.Viewport.Content()
	vc.properties.append(("minimum-scale", "\(value)"))
	return vc
}

public func maximumScale(_ value: Double) -> HTMLMeta.Name.Viewport.Content {
	var vc = HTMLMeta.Name.Viewport.Content()
	vc.properties.append(("maximum-scale", "\(value)"))
	return vc
}

public func userScalable(_ value: HTMLMeta.Name.Viewport.Content.UserScalable) -> HTMLMeta.Name.Viewport.Content {
	var vc = HTMLMeta.Name.Viewport.Content()
	vc.properties.append(("user-scalable", value.value))
	return vc
}

public func interactiveWidget(_ value: HTMLMeta.Name.Viewport.Content.InteractiveWidget) -> HTMLMeta.Name.Viewport.Content {
	var vc = HTMLMeta.Name.Viewport.Content()
	vc.properties.append(("interactive-widget", value.value))
	return vc
}

public func viewportFit(_ value: HTMLMeta.Name.Viewport.Content.ViewportFit) -> HTMLMeta.Name.Viewport.Content {
	var vc = HTMLMeta.Name.Viewport.Content()
	vc.properties.append(("viewport-fit", value.value))
	return vc
}

extension HTMLMeta.Name.Viewport.Content {

	public func width(_ value: Width) -> HTMLMeta.Name.Viewport.Content {
		var vc = self
		vc.properties.append(("width", value.value))
		return vc
	}

	public func height(_ value: Height) -> HTMLMeta.Name.Viewport.Content {
		var vc = self
		vc.properties.append(("height", value.value))
		return vc
	}

	public func initialScale(_ value: Double) -> HTMLMeta.Name.Viewport.Content {
		var vc = self
		vc.properties.append(("initial-scale", "\(value)"))
		return vc
	}

	public func minimumScale(_ value: Double) -> HTMLMeta.Name.Viewport.Content {
		var vc = self
		vc.properties.append(("minimum-scale", "\(value)"))
		return vc
	}

	public func maximumScale(_ value: Double) -> HTMLMeta.Name.Viewport.Content {
		var vc = self
		vc.properties.append(("maximum-scale", "\(value)"))
		return vc
	}

	public func userScalable(_ value: UserScalable) -> HTMLMeta.Name.Viewport.Content {
		var vc = self
		vc.properties.append(("user-scalable", value.value))
		return vc
	}

	public func interactiveWidget(_ value: InteractiveWidget) -> HTMLMeta.Name.Viewport.Content {
		var vc = self
		vc.properties.append(("interactive-widget", value.value))
		return vc
	}

	public func viewportFit(_ value: ViewportFit) -> HTMLMeta.Name.Viewport.Content {
		var vc = self
		vc.properties.append(("viewport-fit", value.value))
		return vc
	}
}

#endif
