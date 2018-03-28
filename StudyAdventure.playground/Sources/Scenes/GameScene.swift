//
//  GameScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 19/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import SpriteKit
import GameplayKit

public class GameScene: SKScene {
    
    // MARK:- Properties
    
    var gameLayer: GameLayer!
    var hudlayer: HudLayer!
    var gameOverScene: GameOverScene!
    var lastTouchLocation: CGPoint?

    
    
    override public init(size: CGSize) {
        super.init(size: size)
        //setting up the layers
        self.setUpLayers(size: size)
        self.setUpGameScenePhysics()
        


    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods

    override public func didMove(to view: SKView) {
        
        
    }
    func setUpGameScenePhysics() {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0  )
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }
    
    func setUpLayers(size: CGSize) {
        self.gameLayer = GameLayer(size: size)
        self.hudlayer = HudLayer(size: size)
        self.gameOverScene = GameOverScene(size: size)
        
        addLayersToTheScene()
        
    }
    
    func addLayersToTheScene() {
        addChild(gameLayer)
        
        addChild(hudlayer)
        
    }
    
    func sceneTouched(touchLocation: CGPoint) {
        gameLayer.moveTowardTap(node: gameLayer.character, location: touchLocation)
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        sceneTouched(touchLocation: (touches.first?.location(in: self))!)
        
        if (touches.first?.location(in: self))! != lastTouchLocation {
            lastTouchLocation = (touches.first?.location(in: self))!
        }
        
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        sceneTouched(touchLocation: (touches.first?.location(in: self))!)
    }
    
    
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
    
    func checkGameOver(countDown: Int, score: Int) {
        if countDown == 0 {
            if score >= 30 {
                print("Parabéns você venceu")
                GameManager.shared.won = true
                gameOverScene.chooseBackGround(won: GameManager.shared.won,
                                               size: size)
                let showScene = SKTransition.doorway(withDuration: 1.5)
                self.view?.presentScene(gameOverScene, transition: showScene)
                GameManager.shared.restartResults()
                self.removeFromParent()
                
                
            } else {
                print("Não foi hoje, tente mais!")
                GameManager.shared.won = false
                gameOverScene.chooseBackGround(won: GameManager.shared.won,
                                               size: size)
                let showScene = SKTransition.doorway(withDuration: 1.5)
                self.view?.presentScene(gameOverScene, transition: showScene)
                GameManager.shared.restartResults()
                self.removeFromParent()
            }
            
        }
    }
    
    func checkBooksGotten(result: Int) {
        
    }
    override public func update(_ currentTime: TimeInterval) {
        
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

