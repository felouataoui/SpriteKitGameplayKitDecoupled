import Foundation
import GameplayKit

class PositionComponent: GKComponent
{
    var value: CGPoint
    
    init(_ position: CGPoint)
    {
        self.value = position
        super.init()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
