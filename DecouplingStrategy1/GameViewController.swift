import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController
{
    override
    func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let scene = SKScene(fileNamed: "GameScene")
        {
            scene.scaleMode = .aspectFill
            
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                
                view.ignoresSiblingOrder = true
                view.showsFPS = true
                view.showsNodeCount = true
            }
        }
    }
}
