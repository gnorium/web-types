import EmbeddedSwiftUtilities

public func url(_ string: String) -> String {
  "url(\(string))"
}

public func calc(_ string: String) -> CSS.LengthPercentage {
  CSS.LengthPercentage("calc(\(string))")
}

public func calc(_ length: CSS.Length) -> CSS.LengthPercentage {
  CSS.LengthPercentage("calc(\(length.value))")
}

public func calc(_ percentage: CSS.Percentage) -> CSS.LengthPercentage {
  CSS.LengthPercentage("calc(\(percentage.value))")
}

public func calc(_ value: CSS.LengthPercentage) -> CSS.LengthPercentage {
  CSS.LengthPercentage("calc(\(value.value))")
}

public func max(_ values: CSS.Length...) -> CSS.LengthPercentage {
  var buffer: [UInt8] = []
  buffer.append(contentsOf: "max(".utf8)
  for (index, value) in values.enumerated() {
    if index > 0 {
      buffer.append(contentsOf: ", ".utf8)
    }
    buffer.append(contentsOf: value.value.utf8)
  }
  buffer.append(41)  // ')'
  return CSS.LengthPercentage(String(decoding: buffer, as: UTF8.self))
}

public func max(_ values: CSS.LengthPercentage...) -> CSS.LengthPercentage {
  var buffer: [UInt8] = []
  buffer.append(contentsOf: "max(".utf8)
  for (index, value) in values.enumerated() {
    if index > 0 {
      buffer.append(contentsOf: ", ".utf8)
    }
    buffer.append(contentsOf: value.value.utf8)
  }
  buffer.append(41)  // ')'
  return CSS.LengthPercentage(String(decoding: buffer, as: UTF8.self))
}

public func max(_ values: String...) -> CSS.LengthPercentage {
  var buffer: [UInt8] = []
  buffer.append(contentsOf: "max(".utf8)
  for (index, value) in values.enumerated() {
    if index > 0 {
      buffer.append(contentsOf: ", ".utf8)
    }
    buffer.append(contentsOf: value.utf8)
  }
  buffer.append(41)  // ')'
  return CSS.LengthPercentage(String(decoding: buffer, as: UTF8.self))
}

public func max(_ value1: String, _ value2: CSS.Length) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("max(\(value1), \(value2.value))")
}

public func max(_ value1: CSS.LengthPercentage, _ value2: CSS.Length) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("max(\(value1.value), \(value2.value))")
}

public func max(_ value1: CSS.Length, _ value2: String) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("max(\(value1.value), \(value2))")
}

public func max(_ value1: CSS.Length, _ value2: CSS.LengthPercentage) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("max(\(value1.value), \(value2.value))")
}

public func min(_ values: CSS.Length...) -> CSS.LengthPercentage {
  var buffer: [UInt8] = []
  buffer.append(contentsOf: "min(".utf8)
  for (index, value) in values.enumerated() {
    if index > 0 {
      buffer.append(contentsOf: ", ".utf8)
    }
    buffer.append(contentsOf: value.value.utf8)
  }
  buffer.append(41)  // ')'
  return CSS.LengthPercentage(String(decoding: buffer, as: UTF8.self))
}

public func min(_ values: CSS.LengthPercentage...) -> CSS.LengthPercentage {
  var buffer: [UInt8] = []
  buffer.append(contentsOf: "min(".utf8)
  for (index, value) in values.enumerated() {
    if index > 0 {
      buffer.append(contentsOf: ", ".utf8)
    }
    buffer.append(contentsOf: value.value.utf8)
  }
  buffer.append(41)  // ')'
  return CSS.LengthPercentage(String(decoding: buffer, as: UTF8.self))
}

public func min(_ values: String...) -> CSS.LengthPercentage {
  var buffer: [UInt8] = []
  buffer.append(contentsOf: "min(".utf8)
  for (index, value) in values.enumerated() {
    if index > 0 {
      buffer.append(contentsOf: ", ".utf8)
    }
    buffer.append(contentsOf: value.utf8)
  }
  buffer.append(41)  // ')'
  return CSS.LengthPercentage(String(decoding: buffer, as: UTF8.self))
}

public func min(_ value1: String, _ value2: CSS.Length) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("min(\(value1), \(value2.value))")
}

public func min(_ value1: CSS.LengthPercentage, _ value2: CSS.Length) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("min(\(value1.value), \(value2.value))")
}

public func min(_ value1: CSS.Length, _ value2: String) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("min(\(value1.value), \(value2))")
}

public func min(_ value1: CSS.Length, _ value2: CSS.LengthPercentage) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("min(\(value1.value), \(value2.value))")
}

public func clamp(_ min: CSS.Length, _ preferred: CSS.Length, _ max: CSS.Length) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("clamp(\(min.value), \(preferred.value), \(max.value))")
}

public func clamp(_ min: CSS.LengthPercentage, _ preferred: CSS.LengthPercentage, _ max: CSS.LengthPercentage)
  -> CSS.LengthPercentage
{
  return CSS.LengthPercentage("clamp(\(min.value), \(preferred.value), \(max.value))")
}

public func clamp(_ min: String, _ preferred: String, _ max: String) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("clamp(\(min), \(preferred), \(max))")
}

public func clamp(_ min: CSS.Length, _ preferred: String, _ max: CSS.Length) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("clamp(\(min.value), \(preferred), \(max.value))")
}

public func clamp(_ min: String, _ preferred: CSS.Length, _ max: String) -> CSS.LengthPercentage {
  return CSS.LengthPercentage("clamp(\(min), \(preferred.value), \(max))")
}

public func rect(_ top: Int, _ right: Int, _ bottom: Int, _ left: Int) -> String {
  "rect(\(top)px, \(right)px, \(bottom)px, \(left)px)"
}

public func rect(_ top: CSS.Length, _ right: CSS.Length, _ bottom: CSS.Length, _ left: CSS.Length) -> String {
  "rect(\(top.value), \(right.value), \(bottom.value), \(left.value))"
}

public func orientation(_ value: CSS.Orientation) -> String {
  value.rawValue.withUTF8Buffer { buffer in
    let str = String(decoding: buffer, as: UTF8.self)
    return "(orientation: \(str))"
  }
}

public func prefersColorScheme(_ scheme: CSS.PrefersColorScheme) -> StaticString {
  switch scheme {
  case .light:
    return "(prefers-color-scheme: light)"
  case .dark:
    return "(prefers-color-scheme: dark)"
  }
}

public func prefersContrast(_ scheme: CSS.PrefersContrast) -> StaticString {
  switch scheme {
  case .more:
    return "(prefers-contrast: more)"
  case .less:
    return "(prefers-contrast: less)"
  case .noPreference:
    return "(prefers-contrast: no-preference)"
  }
}

// Operators for calc() expressions are now in CSS.Length.swift

public func data(_ name: String) -> String {
  "data-\(name)"
}

public func + (lhs: CSS.Percentage, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) + \(rhs.value)")
}

public func - (lhs: CSS.Percentage, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) - \(rhs.value)")
}

public func * (lhs: CSS.Percentage, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) * \(rhs.value)")
}

public func / (lhs: CSS.Percentage, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) / \(rhs.value)")
}

public func + (lhs: CSS.Length, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) + \(rhs.value)")
}

public func - (lhs: CSS.Length, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) - \(rhs.value)")
}

public func * (lhs: CSS.Length, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) * \(rhs.value)")
}

public func / (lhs: CSS.Length, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) / \(rhs.value)")
}

public func + (lhs: CSS.Percentage, rhs: CSS.Length) -> CSS.Length {
  CSS.Length("\(lhs.value) + \(rhs.value)")
}

public func - (lhs: CSS.Percentage, rhs: CSS.Length) -> CSS.Length {
  CSS.Length("\(lhs.value) - \(rhs.value)")
}

public func * (lhs: CSS.Percentage, rhs: CSS.Length) -> CSS.Length {
  CSS.Length("\(lhs.value) * \(rhs.value)")
}

public func / (lhs: CSS.Percentage, rhs: CSS.Length) -> CSS.Length {
  CSS.Length("\(lhs.value) / \(rhs.value)")
}

public func + (lhs: CSS.Value, rhs: CSS.Percentage) -> CSS.Length {
  CSS.Length("\(lhs.value) + \(rhs.value)")
}

public func * (lhs: Double, rhs: CSS.Value) -> CSS.Length {
  CSS.Length("\(doubleToString(lhs)) * \(rhs.value)")
}

public func * (lhs: CSS.Value, rhs: CSS.Value) -> CSS.Length {
  CSS.Length("\(lhs.value) * \(rhs.value)")
}

public func + (lhs: CSS.Value, rhs: CSS.Value) -> CSS.Length {
  CSS.Length("\(lhs.value) + \(rhs.value)")
}

public func - (lhs: CSS.Value, rhs: CSS.Value) -> CSS.Length {
  CSS.Length("\(lhs.value) - \(rhs.value)")
}

public func / (lhs: CSS.Value, rhs: CSS.Value) -> CSS.Length {
  CSS.Length("\(lhs.value) / \(rhs.value)")
}

public func + (lhs: CSS.Value, rhs: Double) -> CSS.Length {
  CSS.Length("\(lhs.value) + \(doubleToString(rhs))")
}

public func - (lhs: CSS.Value, rhs: Double) -> CSS.Length {
  CSS.Length("\(lhs.value) - \(doubleToString(rhs))")
}

public func / (lhs: CSS.Value, rhs: Double) -> CSS.Length {
  CSS.Length("\(lhs.value) / \(doubleToString(rhs))")
}

public func + (lhs: Double, rhs: CSS.Value) -> CSS.Length {
  CSS.Length("\(doubleToString(lhs)) + \(rhs.value)")
}

public func - (lhs: Double, rhs: CSS.Value) -> CSS.Length {
  CSS.Length("\(doubleToString(lhs)) - \(rhs.value)")
}

public func / (lhs: Double, rhs: CSS.Value) -> CSS.Length {
  CSS.Length("\(doubleToString(lhs)) / \(rhs.value)")
}
