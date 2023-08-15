import Foundation
import GameplayKit

class PositionComponent: GKComponent
{
    var value: Vector2
    
    init(at position: Vector2)
    {
        self.value = position
        super.init()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
