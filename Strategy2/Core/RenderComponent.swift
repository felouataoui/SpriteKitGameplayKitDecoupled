import GameplayKit

class RenderComponent: GKComponent
{
    var node: Node
    var internalData: Any?
    
    init(_ node: Node)
    {
        self.node = node
        self.internalData = nil
        
        super.init()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol Node
{
    var type: NodeType { get }
}

enum NodeType
{
    case circle
    case camera
}

struct Circle: Node
{
    let type: NodeType = .circle
    
    var radius: Double
    var strokeColor: UIColor
}

struct Camera: Node
{
    let type: NodeType = .camera
}


