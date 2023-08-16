import GameplayKit

struct GameWorld
{
    private var entities = ContiguousArray<GKEntity>()
    private var renderingSystem: GKComponentSystem<RenderComponent>?
    private var movementSystem = MovementSystem()
    
    init()
    {
        for _ in 0...1000
        {
            let entity = GKEntity()
            entity.addComponent(PositionComponent(CGPoint(
                x: Double.random(in: -20...20),
                y: Double.random(in: -20...20))))
            entity.addComponent(MovementComponent(
                direction: CGPoint(x: Double.random(in: -0.5...0.5), y: Double.random(in: -1...1)),
                speed: Double.random(in: 50...100)))
            entity.addComponent(RenderComponent(Circle(
                radius: Double.random(in: 10...30),
                strokeColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1))))
            
            entities.append(entity)
            movementSystem.addComponent(foundIn: entity)
        }
        
        let camera = GKEntity()
        camera.addComponent(PositionComponent(CGPoint(x: 0, y: 0)))
        camera.addComponent(RenderComponent(Camera()))
        entities.append(camera)
    }
    
    mutating
    func setRenderingSystem(_ renderingSystem: GKComponentSystem<RenderComponent>)
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
