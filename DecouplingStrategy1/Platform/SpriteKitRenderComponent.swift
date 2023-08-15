import GameplayKit

class SpriteKitRenderComponent: GKComponent
{
    var node: SKNode
    
    init(as node: SKNode)
    {
        self.node = node
        super.init()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
