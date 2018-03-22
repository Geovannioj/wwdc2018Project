//
//  SecondScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 20/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class SecondScene: SKScene {
    
    var character: SKSpriteNode!
    var textBalloon: SKSpriteNode!
    var background: SKSpriteNode!
    var textNode: SKLabelNode!
    var playBtn: SKSpriteNode!
    var sentence2Node: SKSpriteNode!
    
    override init(size: CGSize) {
        super.init(size: size)
        setBackgroundUP(size: size)
        setCharacterUp(size: size)
        setTheBalloonUp(size: size)
        setTextToTheBalloon()
        setTextActions()
        setPlayBtn()
  
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    override func didMove(to view: SKView) {

        
    }
    
    func setPlayBtn() {
        playBtn = SKSpriteNode(imageNamed: "PlayBtn")
        playBtn.position = CGPoint(x: size.width * 0.9, y: size.height * 0.1)
        playBtn.zPosition = 5
        playBtn.name = "playBtn"
        addChild(playBtn)
        playBtn.isHidden = true
    }
    func setTextActions() {
        
        //fade the first sentence
        let waitAction = SKAction.wait(forDuration: 5.0)
        let waitLess = SKAction.wait(forDuration: 3.0)
        let changeTxtAction = SKAction.fadeOut(withDuration: 2.0)
        let fadeInAction = SKAction.fadeIn(withDuration: 1.0)
        // start the next
        let sentence2Block = SKAction.run {
            self.textNode.text = "I grew up on a family that didn`t have \ngood financial condition. "
        }
        let sentence3Block = SKAction.run {
            self.textNode.text = "My mom learned how to read \nby herself, because she needed \nto take the right bus to go to work,\n her step mother never let \nher go to school"
        }
        let sentence4Block = SKAction.run {
            self.textNode.text = "So she always told me to study hard,\nbecause  she wanted me to have a\n better future than hers"
        }
        
        let sentence5Block = SKAction.run {
            self.textNode.text = "I’ve followed my mom’s instruction,\nI have always studied hard, and learned\ndifferent things"
        }
        let sentence6Block = SKAction.run {
            self.textNode.text = "And by consequence of this I got accepted\nin a federal university, something that\nI never thought it was even possible!"
        }
        let sentence7Block = SKAction.run {
            self.textNode.text = "And then I was accepted at \nApple Developer Academy"
        }
        let sentence8Block = SKAction.run {
            self.textNode.text = "And the main thing is: if you study hard\n you can get great things in your life!\n, never give up on your dreams!\n chase them"
        }
        let sentence9Block = SKAction.run {
            self.textNode.text = "if you study, and strugle hard\n againts the challenges that you might\nface in life you can change your future."
        }
        let sentence10Block = SKAction.run {
            self.textNode.text = "knowledge can give you\n many oportunities in life!"
        }
        let sentence11Block = SKAction.run {
            self.textNode.text = "Now, let’s play a game, that represents\nmy next challenge!"
        }
        let sentence12Block = SKAction.run {
            self.textNode.text = "Study, and work to be accepted for \nWWDC!"
        }
        let sentence13Block = SKAction.run {
            self.textNode.text = "Help me to get the books to study\n to make and submit my Playground"
        }
        let sentence14Block = SKAction.run {
            self.textNode.text = "Tap on the screen to guide \nme to get the books"
        }
        
        let showPlayBtn = SKAction.run {
            self.playBtn.isHidden = false
        }
        
        
        
        let sequence = SKAction.sequence([waitLess,
                                          changeTxtAction,
                                          sentence2Block,
                                          fadeInAction,
                                          waitLess,
                                          changeTxtAction,
                                          sentence3Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence4Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence5Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence6Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence7Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence8Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence9Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence10Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence11Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence12Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence13Block,
                                          fadeInAction,
                                          waitAction,
                                          changeTxtAction,
                                          sentence14Block,
                                          fadeInAction,
                                          showPlayBtn])
        self.textNode.run(sequence)

    
        
        //textNode.run(SKAction.fadeIn(withDuration: 1.0))
    }
    
    func setTextToTheBalloon() {
        textNode = SKLabelNode(fontNamed: "Chalkduster")
        textNode.text = "Hello, today I’ll tell \n you a little about my story"
        textNode.horizontalAlignmentMode = .center
        textNode.fontColor = UIColor.black
        textNode.fontSize = 12.0
        textNode.zPosition = 10
        textNode.numberOfLines = 3
        textBalloon.addChild(textNode)
        
    }
    
    func setTheBalloonUp(size: CGSize) {
        textBalloon = SKSpriteNode(imageNamed: "balloonTxt")
        textBalloon.position = CGPoint(x: size.width * 0.4, y: size.height * 0.5)
        textBalloon.zPosition = 1
        addChild(textBalloon)
    }
    
    func setBackgroundUP(size: CGSize) {
        background = SKSpriteNode(imageNamed: "BackGroundSecondScene")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -10
        addChild(background)
    }
    
    func setCharacterUp(size: CGSize) {
        
        character = SKSpriteNode(imageNamed: "TalkingCharacter")
        character.position = CGPoint(x: size.width * 0.2, y: size.height * 0.2)
        addChild(character)
    }
    
    func phrasesAction() {
        let appearAction = SKAction.fadeIn(withDuration: 1.0)
        let fadeOutAction = SKAction.fadeOut(withDuration: 1.0)
        let waitAction = SKAction.wait(forDuration: 10.0)
        let sequence = SKAction.sequence([appearAction, waitAction, fadeOutAction])
        
        textBalloon.run(sequence)
        
    }
    
    /**
     Function that makes the transition of the initial scene to the GameScene
     */
    func sceneTouched() {
        let gameScene = GameScene(size:self.size)
        gameScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(gameScene, transition: showScene)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //action to run when a touch happens
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            if node.name == "playBtn" {
                sceneTouched()
            }
        }
        
    }
}
