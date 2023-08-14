import Foundation
import GameplayKit

class MovementSystem: GKComponentSystem<MovementComponent>
{
    override init()
    {
        super.init(componentClass: MovementComponent.self)
    }
    
    override
    func update(deltaTime: TimeInterval)
    {
        for movement in self.components
        {
            // In order for a entity to move it needs to have a position
            // In a different ECS we could have efficiently queried for entities that have both components
            if let position = movement.entity!.component(ofType: PositionComponent.self)
            {
                position.value = position.value + movement.direction * movement.speed * deltaTime
            }
        }
    }
}
