struct Circle: Node
{
    let type: NodeType = .circle
    
    var radius: Double
    var strokeColor: Color
}

struct Color
{
    var r: UInt8
    var g: UInt8
    var b: UInt8
}
