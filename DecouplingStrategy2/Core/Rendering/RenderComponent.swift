import GameplayKit

class RenderComponent: GKComponent
{
    var node: Node
    var internalData: Any?
    
    init(as node: Node)
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
