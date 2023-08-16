import GameplayKit

class SKRenderComponentSystem: GKComponentSystem<RenderComponent>
{
    private var scene: SKScene
    
    init(using scene: SKScene)
    {
        self.scene = scene
        super.init(componentClass: RenderComponent.self)
    }
    
    override
    func addComponent(_ component: RenderComponent)
    {
        // Create an appropriate SKNode and add it to the scene
        let node = createNode(from: component)
        scene.addChild(node)
        
        // The camera is special in SpriteKit
        if let camera = node as? SKCameraNode {
            scene.camera = camera
        }
        
        // Add a reference of the SKNode in the entity
        // So we can do one-way binding from entity to SKNode
        component.internalData = node
        
        // Add the component to the rendering system
        // This is just how GameplayKit works
        super.addComponent(component)
    }
    
    override
    func removeComponent(_ component: RenderComponent)
    {
        if let node = component.internalData as? SKNode
        {
            // The camera is special in SpriteKit
            if node is SKCameraNode {
                scene.camera = nil
            }
            
            // Remove the SKNode from the scene
            node.removeFromParent()
        }
        
        // Remove the component from the rendering system
        // This is just how GameplayKit works
        super.removeComponent(component)
    }
    
    override
    func update(deltaTime: TimeInterval)
    {
        for component in self.components
        {
            if
                let node = component.internalData as? SKNode,
                let position = component.entity?.component(ofType: PositionComponent.self)?.value
            {
                node.position = position
            }
        }
    }
    
    private
    func createNode(from component: RenderComponent)
    -> SKNode
    {
        switch component.node.type
        {
        case .circle:
            let circle = component.node as! Circle
            let node = SKShapeNode(circleOfRadius: circle.radius)
            node.strokeColor = circle.strokeColor
            return node
        case .camera:
            return SKCameraNode()
        }
    }
}
