import Foundation
import GameplayKit

class MovementComponent: GKComponent
{
    var direction: CGPoint
    var speed: Double
    
    init(direction: CGPoint, speed: Double)
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
