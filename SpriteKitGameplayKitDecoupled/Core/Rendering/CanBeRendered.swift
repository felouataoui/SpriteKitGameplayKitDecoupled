import GameplayKit

class RenderComponent: GKComponent
{
    var position: Vector2
    var node: Node
    
    init(as node: Node)
    {
        self.position = Vector2(x: 0, y: 0)
        self.node = node
        
        super.init()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
