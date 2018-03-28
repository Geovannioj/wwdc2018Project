//
//  GameOverScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 21/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    var background: SKSpriteNode!
    var playAgainBtn: SKSpriteNode!
    var restartEveryThing: SKSpriteNode!
    
    override init(size: CGSize) {
        super.init(size: size)
        setPlayAgainBtn()
        setRestartEverything()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func chooseBackGround(won: Bool, size: CGSize) {
        if won {
            background = SKSpriteNode(imageNamed: "CongratulationBoard")
            background.position = CGPoint(x: size.width/2, y: size.height/2)
            background.zPosition = -10
            addChild(background)
        } else {
            background = SKSpriteNode(imageNamed: "TryAgainBoard")
            background.position = CGPoint(x: size.width/2, y: size.height/2)
            background.zPosition = -10
            addChild(background)
        }
        
    }
    
    func setPlayAgainBtn() {
        playAgainBtn = SKSpriteNode(imageNamed: "PlayAgain")
        playAgainBtn.position = CGPoint(x: size.width * 0.1, y: size.height * 0.1)
        playAgainBtn.name = "playAgain"
        addChild(playAgainBtn)
    }
    func setRestartEverything() {
        restartEveryThing = SKSpriteNode(imageNamed: "GoToTalking")
        restartEveryThing.position = CGPoint(x: size.width * 0.8, y: size.height * 0.1)
        restartEveryThing.name = "restartEverything"
        addChild(restartEveryThing)
    }
    
    override func didMove(to view: SKView) {
        
    }
    func goToTalkingScene() {
        let secondScene = SecondScene(size:self.size)
        secondScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(secondScene, transition: showScene)
        self.removeFromParent()
    }
    
    func playAgainScene() {
        let playScene = GameScene(size:self.size)
        playScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(playScene, transition: showScene)
        self.removeFromParent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            if node.name == "playAgain" {
                playAgainScene()
            } else if node.name == "restartEverything" {
                goToTalkingScene()
            }
        }
    }
}
