import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    private var lastUpdateTime : TimeInterval = 0
        
    override
    func sceneDidLoad()
    {
        for _ in 0...1000
        {
            let node = SKShapeNode(circleOfRadius: Double.random(in: 10...30))
            node.position = CGPoint(x: Double.random(in: -20...20), y: Double.random(in: -20...20))
            node.strokeColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            node.userData = [0: NodeData(
                direction: CGPoint(x: Double.random(in: -0.5...0.5), y: Double.random(in: -1...1)),
                speed: Double.random(in: 50...100))]
            addChild(node)
        }
    }
    
    override
    func update(_ currentTime: TimeInterval)
    {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        let deltaTime = currentTime - self.lastUpdateTime
        
        for node in children
        {
            let nodeData = node.userData?[0] as! NodeData
            node.position = node.position + nodeData.direction * nodeData.speed * deltaTime
        }
        
        self.lastUpdateTime = currentTime
    }
}

struct NodeData
{
    let direction: CGPoint
    let speed: Double
}

func +(left: CGPoint, right: CGPoint)
-> CGPoint
{
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func *(left: CGPoint, right: Double)
-> CGPoint
{
    return CGPoint(x: left.x * right, y: left.y * right)
}
