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
        self.setBricks(size: size)
     
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
    
    func setBricks(size: CGSize) {
        let brick1 = SKSpriteNode(imageNamed: "Brick")
        brick1.name = "brick1"
        brick1.position = CGPoint(x: size.width * 0.3, y: size.height * 0.3)
        brick1.scale(to: CGSize(width: brick1.size.width * 0.2, height: brick1.size.height * 0.2))
        brick1.zPosition = -10
        addChild( brick1)
        
        let brick2 = SKSpriteNode(imageNamed: "Brick")
        brick2.name = "brick2"
        brick2.position = CGPoint(x: size.width * 0.37, y: size.height * 0.3)
        brick2.scale(to: CGSize(width: brick2.size.height * 0.2, height: brick2.size.height * 0.2))
        brick2.zPosition = -10
        addChild(brick2)
        
        let brick3 = SKSpriteNode(imageNamed: "Brick")
        brick3.name = "brick3"
        brick3.position = CGPoint(x: size.width * 0.3, y: size.height * 0.7)
        brick3.scale(to: CGSize(width: brick3.size.width * 0.2, height: brick3.size.height * 0.2))
        brick3.zPosition = -10
        addChild( brick3)
        
        let brick4 = SKSpriteNode(imageNamed: "Brick")
        brick4.name = "brick2"
        brick4.position = CGPoint(x: size.width * 0.37, y: size.height * 0.7)
        brick4.scale(to: CGSize(width: brick4.size.height * 0.2, height: brick4.size.height * 0.2))
        brick4.zPosition = -10
        addChild(brick4)
    }
}
