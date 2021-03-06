//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 667, height: 375))


let scene = FirstScene(size: sceneView.bounds.size) //{
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)

//}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
