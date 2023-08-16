import GameplayKit

class SKRenderComponent: GKComponent
{
    var node: SKNode
    
    init(_ node: SKNode)
    {
        self.node = node
        super.init()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
