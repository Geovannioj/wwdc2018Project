//
//  GameLayer.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 19/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class GameLayer: SKNode {
    
    //Mark:- Properties
    var character: SKSpriteNode!

    
    var lastCallToUpdate: TimeInterval = 0
    var timeVariation: TimeInterval = 0
    
    var movePointsPerSecond: CGFloat = 450.0
    var velocity = CGPoint.zero
    
    //Mark:- Constructor
    init(size: CGSize) {
        super.init()
            self.putCharacterInScreen(size: size)
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Class methods
    
    func putCharacterInScreen(size: CGSize) {
        character = SKSpriteNode(imageNamed: "character")
        character.name = "character"
        character.position = CGPoint(x: size.width/2, y: size.height/2)
        character.scale(to: CGSize(width: character.size.width * 0.2, height: character.size.height * 0.2))
        addChild(character)
 
    }
    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint) {
        
        let amountToMove = CGPoint(x: velocity.x * CGFloat(timeVariation),
                                   y: velocity.y * CGFloat(timeVariation))
        print("Amount to move: \(amountToMove)")
        
        sprite.position = CGPoint(
            x: sprite.position.x + amountToMove.x,
            y: sprite.position.y + amountToMove.y)
    }
    
    func moveTowardTap(node: SKSpriteNode, location: CGPoint) {
        let moveVector = CGPoint(x: (location.x - node.position.x),
                                 y: (location.y - node.position.y))
        
        let length = CGFloat(sqrt(pow(moveVector.x, 2) + pow(moveVector.y, 2)))
        
        let direction = CGPoint(x: (moveVector.x / length),
                                y: (moveVector.y / length))
        
        velocity = CGPoint(x: direction.x * movePointsPerSecond,
                           y: direction.y * movePointsPerSecond)
    }
    
  
}
