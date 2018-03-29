//
//  RocketScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 27/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class RocketScene: SKScene {
    
    //MARK:- Properties
    
    var rocket: SKSpriteNode!
    var countDown: Int = 3
    var textLabel: SKLabelNode!
    
    //MARK:- Constructor
    override init(size: CGSize) {
        super.init(size: size)
        setBackground()
        setRocket()
        setCountDownLabel()
        setCountDownLabel()
        animateCountDown()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    /**
     Function to set up the background of the scene
     */
    func setBackground() {
        let background = SKSpriteNode(imageNamed: "rocktScene")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = 0
        addChild(background)
    }
    
    /**
     Function that sets the rocket up
     */
    func setRocket() {
        rocket = SKSpriteNode(imageNamed: "rocket")
        rocket.position = CGPoint(x: size.width/2, y: 0)
        rocket.zPosition = 10
        rocket.anchorPoint = CGPoint(x: 0.5, y: 0)
        addChild(rocket)
    }
    
    /**
     Function that launches the rocket
     */
    func launchRocket() {
        let action = SKAction.move(to: CGPoint(x:rocket.position.x, y: size.height*1.5), duration: 4.0)
        let blockChangeScene = SKAction.run {
            self.changeScene()
        }
        let sequence = SKAction.sequence([action, blockChangeScene])
        rocket.run(sequence)
        playRocketSound()
        
    }
    
    /**
     Function that changes the scene to the next one, the GameScene
     */
    func changeScene() {
        let gameScene = GameScene(size:self.size)
        gameScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(gameScene, transition: showScene)
        self.removeFromParent()
    }
    
    /**
     Function that sets the rocket's fire particle
     */
    func rocketParticle() {
        let particle = SKEmitterNode(fileNamed: "fireParticle.sks")
        particle?.zPosition = 1
        particle?.targetNode = rocket
        rocket.addChild(particle!)
        
    }
    
    /**
     Function that sets the label to the countdown
     */
    func setCountDownLabel() {
        textLabel = SKLabelNode(fontNamed: "Chalkduster")
        textLabel.horizontalAlignmentMode = .center
        textLabel.fontColor = UIColor.white
        textLabel.fontSize = 100.0
        textLabel.zPosition = 15
        textLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        self.addChild(textLabel)
    }
    
    /**
     Function that handles the countdown
     */
    func animateCountDown() {
        let waitAction = SKAction.wait(forDuration: 1.0)
        let changeTxtBlock = SKAction.run {
            self.textLabel.text = String(self.countDown)
            if self.countDown > 0 {
                self.countDown -= 1
                self.playCountDownBip()
            } else {
                self.textLabel.removeFromParent()
                self.launchRocket()
                self.rocketParticle()
            }
        }
        
        let sequence = SKAction.sequence([waitAction, changeTxtBlock])
        let repeate = SKAction.repeat(sequence, count: 4)
        self.textLabel.run(repeate)
        
    }
    /**
     Function responsable to play the rocket's launch sound
     */
    func playRocketSound() {
        let actionSound = SKAction.playSoundFileNamed("RocketLaunch.mp3", waitForCompletion: true)
        rocket.run(actionSound)
    }
    func playCountDownBip() {
        let bipAction = SKAction.playSoundFileNamed("Bip.mp3", waitForCompletion: true)
        self.run(bipAction)
    }
}
