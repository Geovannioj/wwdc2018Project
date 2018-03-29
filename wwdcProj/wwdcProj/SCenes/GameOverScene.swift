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
    
    //MARK:- Properties
    var background: SKSpriteNode!
    var playAgainBtn: SKSpriteNode!
    var restartEveryThing: SKSpriteNode!
    
    //MARK:- Constructor
    override init(size: CGSize) {
        super.init(size: size)
        setPlayAgainBtn()
        setRestartEverything()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    /**
     Function to choose if it is needed to show the win or lose gameover page
     - parameter won: bolean that shows if the game was won or not
     - parameter size: Size of the screen
     */
    func chooseBackGround(won: Bool, size: CGSize) {
        if won {
            background = SKSpriteNode(imageNamed: "CongratulationBoard")
            background.position = CGPoint(x: size.width/2, y: size.height/2)
            background.zPosition = -10
            addChild(background)
            GameManager.shared.startMusic(musicName: "Fond_Memories.mp3", node: background)
        } else {
            background = SKSpriteNode(imageNamed: "TryAgainBoard")
            background.position = CGPoint(x: size.width/2, y: size.height/2)
            background.zPosition = -10
            addChild(background)
            GameManager.shared.startMusic(musicName: "It_Happens.mp3", node: background)
        }
        
    }
    
    /**
     Function that puts the play again button on the screen
     */
    func setPlayAgainBtn() {
        playAgainBtn = SKSpriteNode(imageNamed: "PlayAgain")
        playAgainBtn.position = CGPoint(x: size.width * 0.1, y: size.height * 0.1)
        playAgainBtn.name = "playAgain"
        addChild(playAgainBtn)
    }
    
    /**
     Function that puts the restart button on the screen
     */
    func setRestartEverything() {
        restartEveryThing = SKSpriteNode(imageNamed: "GoToTalking")
        restartEveryThing.position = CGPoint(x: size.width * 0.8, y: size.height * 0.1)
        restartEveryThing.name = "restartEverything"
        addChild(restartEveryThing)
    }
    
    /**
     Function that does the transition to the second Screen( the talking screen)
     */
    func goToTalkingScene() {
        let secondScene = SecondScene(size:self.size)
        secondScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(secondScene, transition: showScene)
        self.removeFromParent()
    }
    
    /**
     Function that does the transition to the GameScene
     */
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
                GameManager.shared.playTapSound(node: self)
            } else if node.name == "restartEverything" {
                goToTalkingScene()
                GameManager.shared.playTapSound(node: self)
            }
        }
    }
}
