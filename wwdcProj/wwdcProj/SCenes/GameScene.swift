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
    
    var lastTouchLocation: CGPoint?

    
    
    override init(size: CGSize) {
        super.init(size: size)
        //setting up the layers
        self.setUpLayers(size: size)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods

    override func didMove(to view: SKView) {
        
        
    }
    
    func setUpLayers(size: CGSize) {
        self.gameLayer = GameLayer(size: size)
        self.hudlayer = HudLayer(size: size)
        
        addLayersToTheScene()
        
    }
    
    func addLayersToTheScene() {
        addChild(gameLayer)
        addChild(hudlayer)
    }

    func boundsCheckZombie() {
        let bottomLeft = CGPoint.zero
        let topRight = CGPoint(x: size.width, y: size.height)
        
        if gameLayer.character.position.x <= bottomLeft.x {
            
            gameLayer.character.position.x = bottomLeft.x
           
            gameLayer.velocity.y = 0
        
        } else if gameLayer.character.position.x >= topRight.x {
            
            gameLayer.character.position.x = topRight.x
           
            gameLayer.velocity.y = 0
        
        } else if gameLayer.character.position.y <= bottomLeft.y {
        
            gameLayer.character.position.y = bottomLeft.y
           
            gameLayer.velocity.y = 0
        
        } else if gameLayer.character.position.y >= topRight.y {
          
            gameLayer.character.position.y = topRight.y
           
            gameLayer.velocity.y = 0
        }
    }
    
    func updateTimeVariation(currentTime: TimeInterval) {
        if gameLayer.lastCallToUpdate > 0 {
            gameLayer.timeVariation = currentTime - gameLayer.lastCallToUpdate
        } else {
            gameLayer.timeVariation = 0
        }
        
        gameLayer.lastCallToUpdate = currentTime
    }
    
    func sceneTouched(touchLocation: CGPoint) {
        gameLayer.moveTowardTap(node: gameLayer.character, location: touchLocation)
    }
    
    func touchDown(atPoint pos : CGPoint) {
    
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {
        
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        updateTimeVariation(currentTime: currentTime)
        gameLayer.moveSprite(sprite: gameLayer.character,
                   velocity: gameLayer.velocity)
        
        if let lastTouchLocation = lastTouchLocation {
            let diff = CGPoint(x:lastTouchLocation.x - gameLayer.character.position.x,
                               y: lastTouchLocation.y - gameLayer.character.position.y)
            let length = CGFloat(sqrt(pow(Double(diff.x), 2.0) + pow(Double(diff.y), 2.0)))
            if length <= gameLayer.movePointsPerSecond * CGFloat(gameLayer.timeVariation) {
                gameLayer.character.position = lastTouchLocation
                gameLayer.velocity = CGPoint.zero
            } else {

            }
        }
        
        boundsCheckZombie()
        
    }
}
