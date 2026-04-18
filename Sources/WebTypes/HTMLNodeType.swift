import EmbeddedSwiftUtilities

public enum HTMLNodeType: Int, Sendable {
    case elementNode = 1
    case attributeNode = 2
    case textNode = 3
    case cdataSectionNode = 4
    case processingInstructionNode = 7
    case commentNode = 8
    case documentNode = 9
    case documentTypeNode = 10
    case documentFragmentNode = 11
}
