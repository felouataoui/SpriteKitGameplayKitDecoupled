protocol Node
{
    var type: NodeType { get }
}

enum NodeType
{
    case circle
    case camera
}
