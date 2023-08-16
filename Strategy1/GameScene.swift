import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    private var gameWorld = GameWorld()
    private var lastUpdateTime : TimeInterval = 0
    
    override
    func sceneDidLoad()
    {
        self.gameWorld.setRenderingSystem(SKRenderComponentSystem(self))
        self.lastUpdateTime = 0
    }
    
    override
    func update(_ currentTime: TimeInterval)
    {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        let deltaTime = currentTime - self.lastUpdateTime
        
        gameWorld.update(deltaTime)
        
        self.lastUpdateTime = currentTime
    }
}
