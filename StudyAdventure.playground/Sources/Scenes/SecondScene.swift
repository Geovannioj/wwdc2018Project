//
//  SecondScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 20/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

public class SecondScene: SKScene {
    
    //MARK:- Properties
    private var character: SKSpriteNode!
    private var textBalloon: SKSpriteNode!
    private var background: SKSpriteNode!
    private var textNode: SKLabelNode!
    private var playBtn: SKSpriteNode!
    private var sentence2Node: SKSpriteNode!
    private var nextBtn: SKSpriteNode!
    var numberOfPhrase = 1
    
    override public init(size: CGSize) {
        super.init(size: size)
        setBackgroundUP(size: size)
        setCharacterUp(size: size)
        setTheBalloonUp(size: size)
        setTextToTheBalloon()
       // setTextActions()
        setNextBtn()
        setPlayBtn()
  
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    override  public func didMove(to view: SKView) {

        
    }
    
    /**
     Function that sets up the button to start the game
     */
    func setPlayBtn() {
        playBtn = SKSpriteNode(imageNamed: "PlayBtn")
        playBtn.position = CGPoint(x: size.width * 0.9, y: size.height * 0.1)
        playBtn.zPosition = 5
        playBtn.name = "playBtn"
        addChild(playBtn)
        playBtn.isHidden = true
    }
    func setNextBtn() {
        nextBtn = SKSpriteNode(imageNamed: "NextBtn")
        nextBtn.position = CGPoint(x: size.width * 0.9, y: size.height * 0.1)
        nextBtn.zPosition = 10
        nextBtn.name = "nextBtn"
        addChild(nextBtn)
        
    }

    /**
     Function that sets the  balloon's text
     */
    func setTextToTheBalloon() {
        textNode = SKLabelNode(fontNamed: "Chalkduster")
        textNode.text = "Hello, tap the screen\nto play another sentence"
        textNode.horizontalAlignmentMode = .center
        textNode.fontColor = UIColor.black
        textNode.fontSize = 16.0
        textNode.zPosition = 10
        textNode.numberOfLines = 3
        textBalloon.addChild(textNode)
        
    }
    
    /**
     Function that sets the  balloon
     */
    func setTheBalloonUp(size: CGSize) {
        textBalloon = SKSpriteNode(imageNamed: "balloonTxt")
        textBalloon.position = CGPoint(x: size.width * 0.6, y: size.height * 0.4)
        textBalloon.zPosition = 1
        addChild(textBalloon)
    }
    
    /**
     Function to set the background of the scene
     */
    func setBackgroundUP(size: CGSize) {
        background = SKSpriteNode(imageNamed: "StoryBackground")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -10
        addChild(background)
    }
    
    /**
     Function that sets the character on the screen
     */
    func setCharacterUp(size: CGSize) {
        
        character = SKSpriteNode(imageNamed: "SpeakingCharacter")
        character.position = CGPoint(x: size.width * 0.4, y: size.height * 0.1)
        addChild(character)
    }
    
    /**
     Function that makes the transition of the initial scene to the GameScene
     */
   public func changeScene() {
        let rocktScene = RocketScene(size:self.size)
        rocktScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(rocktScene, transition: showScene)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //action to run when a touch happens
        
        for touch in touches {
            let node = atPoint(touch.location(in: self))
            
            if node.name == "playBtn" {
                let rocktScene = RocketScene(size:self.size)
                //print("linha 1")
                rocktScene.scaleMode = scaleMode
                //print("linha 2")
                let showScene = SKTransition.doorway(withDuration: 1.5)
                //print("linha 3")
                self.view?.presentScene(rocktScene, transition: showScene)
                //print("linha 4")
            } else if node.name == "nextBtn" {
                numberOfPhrase += 1
                changeSentence()

            }
        }
        
    }
    
    func changeSentence() {
        //actions
        let changeTxtAction = SKAction.fadeOut(withDuration: 0.5)
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        
        //actions to change the texts
        let sentence2Block = SKAction.run {
            //self.textNode.text = "I grew up on a family that didn`t have \ngood financial condition. "
            self.textNode.text = "Did you know that \nstudying is something that can\n change someone's life?"
        }
        let sentence3Block = SKAction.run {
           // self.textNode.text = "My mom learned how to read \nby herself, because she needed \nto take the right bus to go to work,\n her step mother never let \nher go to school"
            self.textNode.text = "It has already changed mine,\nand the more you study,\nmore skills you'll have"
        }
        let sentence4Block = SKAction.run {
            //self.textNode.text = "So she always told me to study hard,\nbecause  she wanted me to have a\n better future than hers"
            self.textNode.text = "So even if you face\n tough challenges in life,\n never give up!!"
        }
        
        let sentence5Block = SKAction.run {
           // self.textNode.text = "I’ve followed my mom’s instruction,\nI have always studied hard, and learned\ndifferent things"
            self.textNode.text = "Keep studying and you'll\n be rewarded in the future"
        }
        let sentence6Block = SKAction.run {
            //self.textNode.text = "And by consequence of this I got accepted\nin a federal university, something that\nI never thought it was even possible!"
            self.textNode.text = "your future is in your hands,\n education is something\n that cannot be taken from you"
        }
        let sentence7Block = SKAction.run {
            //self.textNode.text = "And then I was accepted at \nApple Developer Academy"
            self.textNode.text = "The more you study, \nthe more you realize that there are\n many more things to be known"
        }
        let sentence8Block = SKAction.run {
            //self.textNode.text = "And the main thing is: if you study hard\n you can get great things in your life!\n, never give up on your dreams!\n chase them"
            self.textNode.text = "Now I need your help!"
        }
        let sentence9Block = SKAction.run {
            
            self.textNode.text = "Get the books on the screen,\nso that I can study\n Apple's framewoks and\n become a developer!"
        }
        let sentence10Block = SKAction.run {
            
            self.textNode.text = "\nEach 10 books you get\n I learn a frameWork!\n I want to get 30 books"
        }
        let sentence11Block = SKAction.run {
            
            self.textNode.text = "As I said before, \nstudying can change lives,\n help me."
        }
        let sentence12Block = SKAction.run {
            self.textNode.text = "Tap on the screen to guide \nme towards the books"
        }
        let sentence13Block = SKAction.run {
            self.textNode.text = "One thing I didn't say... \nthis adventure\n will be in space!"
        }
        let sentence14Block = SKAction.run {
            self.textNode.text = "Let's go!"
        }
        
        
        switch numberOfPhrase {
        case 2:
            
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence2Block,
                                              fadeInAction])
            self.textNode.run(sequence)

            break
            
        case 3:
            
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence3Block,
                                              fadeInAction])
            self.textNode.run(sequence)

            break
        
        case 4:
            
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence4Block,
                                              fadeInAction])
            self.textNode.run(sequence)

            break
            
        case 5:
            
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence5Block,
                                              fadeInAction])
            self.textNode.run(sequence)
            break
        case 6:
        
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence6Block,
                                              fadeInAction])
            self.textNode.run(sequence)
        break
            
        case 7:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence7Block,
                                              fadeInAction])
            self.textNode.run(sequence)
        break
        case 8:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence8Block,
                                              fadeInAction])
            self.textNode.run(sequence)
            break
        case 9:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence9Block,
                                              fadeInAction])
            self.textNode.run(sequence)
            break
            
        case 10:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence10Block,
                                              fadeInAction])
            self.textNode.run(sequence)
        case 11:
            let sequence = SKAction.sequence([changeTxtAction,
                                             sentence11Block,
                                             fadeInAction])
            self.textNode.run(sequence)
            break
        case 12:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence12Block,
                                              fadeInAction])
            self.textNode.run(sequence)
            break
        case 13:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence13Block,
                                              fadeInAction])
            self.textNode.run(sequence)
            break
        case 14:
            let sequence = SKAction.sequence([changeTxtAction,
                                              sentence14Block,
                                              fadeInAction])
            self.textNode.run(sequence)
            break
        default: break
            
        }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        if numberOfPhrase == 14 {
            playBtn.isHidden = false
            nextBtn.isHidden = true
        }
    }
    
}
