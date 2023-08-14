import GameplayKit

class RenderComponent: GKComponent
{
    var node: Node
    
    init(as node: Node)
    {
        self.node = node
        super.init()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
