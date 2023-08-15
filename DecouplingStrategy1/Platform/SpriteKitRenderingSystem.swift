import GameplayKit

class SpriteKitRenderingSystem: GKComponentSystem<SpriteKitRenderComponent>
{
    private var scene: SKScene
    
    init(using scene: SKScene)
    {
        self.scene = scene
        super.init(componentClass: SpriteKitRenderComponent.self)
    }
    
    override
    func addComponent(_ component: SpriteKitRenderComponent)
    {
        // Add the node to the scene
        scene.addChild(component.node)
        
        // The camera is special in SpriteKit
        if let camera = component.node as? SKCameraNode {
            scene.camera = camera
        }
        
        // Add the component to the rendering system
        // This is just how GameplayKit works
        super.addComponent(component)
    }
    
    override
    func removeComponent(_ component: SpriteKitRenderComponent)
    {
        // The camera is special in SpriteKit
        if component.node is SKCameraNode {
            scene.camera = nil
        }
        
        // Remove the SKNode from the scene
        component.node.removeFromParent()
        
        // Remove the component from the rendering system
        // This is just how GameplayKit works
        super.removeComponent(component)
    }
    
    override
    func update(deltaTime: TimeInterval)
    {
        for component in self.components
        {
            if let position = component.entity?.component(ofType: PositionComponent.self)?.value
            {
                component.node.position = CGPoint.from(position)
            }
        }
    }
}
