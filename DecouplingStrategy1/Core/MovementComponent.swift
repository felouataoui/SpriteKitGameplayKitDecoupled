import Foundation
import GameplayKit

class MovementComponent: GKComponent
{
    var direction: Vector2
    var speed: Double
    
    init(towards direction: Vector2, atSpeed speed: Double)
    {
        self.direction = direction
        self.speed = speed
        
        super.init()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
