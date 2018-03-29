//
//  RocketScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 27/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

public class RocketScene: SKScene {
    
    var rocket: SKSpriteNode!
    
    override public init(size: CGSize) {
        super.init(size: size)
        setBackground()
        setRocket()
        rocketParticle()
        launchRocket()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackground() {
        let background = SKSpriteNode(imageNamed: "rocktScene")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = 0
        addChild(background)
    }
    
    func setRocket() {
        rocket = SKSpriteNode(imageNamed: "rocket")
        rocket.position = CGPoint(x: size.width/2, y: 0)
        rocket.zPosition = 10
        rocket.anchorPoint = CGPoint(x: 0.5, y: 0)
        addChild(rocket)
    }
    
    func launchRocket() {
        let action = SKAction.move(to: CGPoint(x:rocket.position.x, y: size.height*1.5), duration: 4.0)
        let blockChangeScene = SKAction.run {
            self.changeScene()
        }
        let sequence = SKAction.sequence([action, blockChangeScene])
        rocket.run(sequence)
        playRocketSound()
    }
    func changeScene() {
        let gameScene = GameScene(size:self.size)
        gameScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(gameScene, transition: showScene)
        self.removeFromParent()
    }
    
    func rocketParticle() {
        let particle = SKEmitterNode(fileNamed: "fireParticle.sks")
        particle?.zPosition = 1
        particle?.targetNode = rocket
        rocket.addChild(particle!)
        
    }
    func playRocketSound() {
        let actionSound = SKAction.playSoundFileNamed("RocketLaunch.mp3", waitForCompletion: true)
        rocket.run(actionSound)
    }
    
}
