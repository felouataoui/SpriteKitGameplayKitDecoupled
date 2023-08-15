import GameplayKit

struct GameWorld
{
    private var entities = ContiguousArray<GKEntity>()
    private var renderingSystem: GKComponentSystem<SpriteKitRenderComponent>?
    private var movementSystem = MovementSystem()
    
    init()
    {
        for _ in 0...1000
        {
            let entity = GKEntity()
            entity.addComponent(PositionComponent(at: Vector2(
                x: Double.random(in: -20...20),
                y: Double.random(in: -20...20))))
            entity.addComponent(MovementComponent(
                towards: Vector2(x: Double.random(in: -0.5...0.5), y: Double.random(in: -1...1)),
                atSpeed: Double.random(in: 50...100)))
            
            let node = SKShapeNode(circleOfRadius: Double.random(in: 10...30))
            node.strokeColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            entity.addComponent(SpriteKitRenderComponent(as: node))
            
            entities.append(entity)
            movementSystem.addComponent(foundIn: entity)
        }
        
        let camera = GKEntity()
        camera.addComponent(PositionComponent(at: Vector2(x: 0, y: 0)))
        camera.addComponent(SpriteKitRenderComponent(as: SKCameraNode()))
        entities.append(camera)
    }
    
    mutating
    func setRenderingSystem(_ renderingSystem: GKComponentSystem<SpriteKitRenderComponent>)
    {
        self.renderingSystem = renderingSystem
        
        for entity in entities
        {
            renderingSystem.addComponent(foundIn: entity)
        }
    }
    
    func update(_ deltaTime: TimeInterval) {
        movementSystem.update(deltaTime: deltaTime)
        renderingSystem?.update(deltaTime: deltaTime)
    }
}
