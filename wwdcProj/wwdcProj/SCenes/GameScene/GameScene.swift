//
//  GameScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 19/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK:- Properties
    
    var gameLayer: GameLayer!
    var hudlayer: HudLayer!
    var gameOverScene: GameOverScene!
    var lastTouchLocation: CGPoint?
    var musicNode: SKNode!
    let backGroundMusicName = "backgroundSound.mp3"
    
    //MARK:- Constructor
    override init(size: CGSize) {
        super.init(size: size)
        self.setUpLayers(size: size)
        self.setUpGameScenePhysics()
        GameManager.shared.startMusic(musicName: backGroundMusicName, node: gameLayer.character)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods

    /**
     Function that sets up the scene's physic
     */
    func setUpGameScenePhysics() {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0  )
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }
    
    /**
     Function that sets up the layers tha are needed on the GameScene class
     - parameter size: screen's size
     */
    func setUpLayers(size: CGSize) {
        self.gameLayer = GameLayer(size: size)
        self.hudlayer = HudLayer(size: size)
        self.gameOverScene = GameOverScene(size: size)
        
        addLayersToTheScene()
        
    }
    
    /**
     Addition of the layers on the screen
     */
    func addLayersToTheScene() {
        addChild(gameLayer)
        addChild(hudlayer)
        
    }
    
    /**
     Function that connects the function MoveTowardTap of the gameLayer with the gameScene
     */
    func sceneTouched(touchLocation: CGPoint) {
        gameLayer.moveTowardTap(node: gameLayer.character, location: touchLocation)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        sceneTouched(touchLocation: (touches.first?.location(in: self))!)
        
        if (touches.first?.location(in: self))! != lastTouchLocation {
            lastTouchLocation = (touches.first?.location(in: self))!
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        sceneTouched(touchLocation: (touches.first?.location(in: self))!)
    }
    
    
    //MARK:- TO do
    func movimentationFunction() {
        if let lastTouchLocation = lastTouchLocation {
            let diff = CGPoint(x:lastTouchLocation.x - gameLayer.character.position.x,
                               y: lastTouchLocation.y - gameLayer.character.position.y)
            let length = CGFloat(sqrt(pow(Double(diff.x), 2.0) + pow(Double(diff.y), 2.0)))
            if length <= gameLayer.movePointsPerSecond * CGFloat(gameLayer.timeVariation) {
                gameLayer.character.position = lastTouchLocation
                gameLayer.velocity = CGPoint.zero
                gameLayer.stopTextureChangesAnimation()
            } else {
                
            }
        }
    }
    
    /**
     Function responsable to set gameover, removing the nodes
     and restarting the countdown and game resulta
     - parameter won: boolean tha indicates if the game was won or not
     */
    func setGameOverParameters(won: Bool) {
        GameManager.shared.won = won
        gameOverScene.chooseBackGround(won: GameManager.shared.won,
                                       size: size)
        
        GameManager.shared.restartResults()
        gameLayer.character.removeAllChildren()
        self.removeFromParent()
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(gameOverScene, transition: showScene)
    }
    
    /**
     Function to check if it is gameover or not
     - parameter countDown: the remain time
     - parameter score: amount of books gotten
     */
    func checkGameOver(countDown: Int, score: Int) {
            if countDown >= 0 && score >= 30   {
                let waitToShowLastFrameworkLearned = SKAction.wait(forDuration: 1.2)
                let changeSceneBlock = SKAction.run({
                    self.setGameOverParameters(won: true)
                })
                
                let sequence = SKAction.sequence([waitToShowLastFrameworkLearned, changeSceneBlock])
                self.run(sequence)
                
                
            } else if countDown == 0 && score < 30{
                
                setGameOverParameters(won: false)
                
            }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        gameLayer.updateTimeVariation(currentTime: currentTime)
        gameLayer.moveCharacter(sprite: gameLayer.character,
                   velocity: gameLayer.velocity)
        
        movimentationFunction()
        gameLayer.checkBounds(size: size)
        
        hudlayer.resultScore.text = String(GameManager.shared.score)
        hudlayer.countDownLabel.text = String(GameManager.shared.countDown)
        gameLayer.showAchievement(result: GameManager.shared.score, size: size)
        checkGameOver(countDown: GameManager.shared.countDown,
                      score: GameManager.shared.score)
        
    }
    
}
