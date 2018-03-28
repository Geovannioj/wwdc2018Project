//
//  GameLayer.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 19/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

public class GameLayer: SKNode {
    
    //Mark:- Properties
    var character: SKSpriteNode!
    var lastCallToUpdate: TimeInterval = 0
    var timeVariation: TimeInterval = 0
    var movePointsPerSecond: CGFloat = 200.0
    var velocity = CGPoint.zero
    var characterMove: SKAction!
    var screenSize: CGSize!
    let safeArea: CGFloat = 50.0
    
    //Mark:- Constructor
    public init(size: CGSize) {
        super.init()
        self.screenSize = size
        animateTextures()
        self.putCharacterInScreen(size: size)
        //self.setBricks(size: size)
        createBooksForever()
        setUpBackground(size: size)
    
     
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Class methods
    
    func setUpBackground(size: CGSize) {
        let background = SKSpriteNode(imageNamed: "GameSceneBackGround")
        background.zPosition = -100
        background.position = CGPoint(x:size.width/2 , y: size.height/2)
        addChild(background)
    }
    
    func putCharacterInScreen(size: CGSize) {
        character = SKSpriteNode(imageNamed: "character1")
        character.name = "character"
        setCharacterPhysics(character: character)
        character.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(character)
 
    }
    
    func setCharacterPhysics(character: SKSpriteNode) {
        character.physicsBody = SKPhysicsBody(texture: character.texture!, size: character.size)
        character.physicsBody?.isDynamic = true
        character.physicsBody?.categoryBitMask = UInt32(EnumBitmaskCategory.character.rawValue)
        character.physicsBody?.collisionBitMask = UInt32(EnumBitmaskCategory.book.rawValue)
        character.physicsBody?.contactTestBitMask = UInt32(EnumBitmaskCategory.book.rawValue)
    }
    
    func moveCharacter(sprite: SKSpriteNode, velocity: CGPoint) {
        
        let amountToMove = CGPoint(x: velocity.x * CGFloat(timeVariation),
                                   y: velocity.y * CGFloat(timeVariation))
        
        sprite.position = CGPoint(
            x: sprite.position.x + amountToMove.x,
            y: sprite.position.y + amountToMove.y)
        
        rotateCharacter(characterSprite: character, direction: velocity)
    }
    
    func moveTowardTap(node: SKSpriteNode, location: CGPoint) {
        animateTextureChange()
        let moveVector = CGPoint(x: (location.x - node.position.x),
                                 y: (location.y - node.position.y))
        
        let length = CGFloat(sqrt(pow(moveVector.x, 2) + pow(moveVector.y, 2)))
        
        let direction = CGPoint(x: (moveVector.x / length),
                                y: (moveVector.y / length))
        
        velocity = CGPoint(x: direction.x * movePointsPerSecond,
                           y: direction.y * movePointsPerSecond)
    }
    func animateTextures() {
        var textures:[SKTexture] = []
        for i in 1...3 {
            textures.append(SKTexture(imageNamed: "character\(i)"))
            
        }
        
        textures.append(textures[1])
        textures.append(textures[0])
        
        characterMove = SKAction.animate(with: textures, timePerFrame: 0.1)
    }
    
    func animateTextureChange() {
        
        if character.action(forKey: "animation") == nil {
            character.run(
                SKAction.repeatForever(characterMove),
                withKey: "animation")
        }
    }
    
    func stopTextureChangesAnimation() {
        character.removeAction(forKey: "animation")
    }
    func rotateBookAction (node: SKSpriteNode) {
        let rotate = SKAction.rotate(byAngle: 0.3, duration: 1.0)
        let sequence = SKAction.sequence([rotate, rotate.reversed()])
        node.run(SKAction.repeatForever(sequence))
    }
    
    func createBook() {
        let book = SKSpriteNode(imageNamed: "Book")
        book.position = CGPoint(x: randomNumber(inRange: 0...Int(screenSize.width - safeArea)),
                                y: randomNumber(inRange: 0...Int(screenSize.height - safeArea)))
        book.name = "book"
        book.physicsBody = SKPhysicsBody(texture: book.texture!, size: book.size)
        book.physicsBody?.isDynamic = true
        book.physicsBody?.categoryBitMask = UInt32(EnumBitmaskCategory.book.rawValue)
        book.physicsBody?.collisionBitMask = UInt32(EnumBitmaskCategory.character.rawValue)
        book.physicsBody?.contactTestBitMask = UInt32(EnumBitmaskCategory.character.rawValue)
        addChild(book)
        
        
        let fadeIn = SKAction.fadeIn(withDuration: 1.0)
        let bookDuration = SKAction.wait(forDuration: 1.0)
        let fadeout = SKAction.fadeOut(withDuration: 1.0)
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fadeIn, bookDuration, fadeout, remove])
        
        rotateBookAction(node: book)
        book.run(sequence)
    }
    
    func createBooksForever() {
        let wait = SKAction.wait(forDuration: TimeInterval(0.5))
        let createBookAction = SKAction.run {
            self.createBook()
        }
        
        let sequence = SKAction.sequence([createBookAction,wait])
        
        run(SKAction.repeatForever(sequence))
        
    }
    
    public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64(range.upperBound - range.lowerBound + 1)
        let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        return T(value)
    }
    
    func setBricks(size: CGSize) {
        let brick1 = SKSpriteNode(imageNamed: "BrickBlock")
        brick1.name = "brick1"
        brick1.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)
        brick1.zPosition = -10
        addChild( brick1)
        
        
        let brick3 = SKSpriteNode(imageNamed: "BrickBlock")
        brick3.name = "brick3"
        brick3.position = CGPoint(x: size.width * 0.5, y: size.height * 0.7)
        brick3.zPosition = -10
        addChild( brick3)
        
    }
    func checkBounds(size: CGSize) {
        let bottomLeft = CGPoint.zero
        let topRight = CGPoint(x: size.width, y: size.height)
        
        if character.position.x <= bottomLeft.x {
            
            character.position.x = bottomLeft.x
            
            velocity.y = 0
            
        } else if character.position.x >= topRight.x {
            
            character.position.x = topRight.x
            
            velocity.y = 0
            
        } else if character.position.y <= bottomLeft.y {
            
            character.position.y = bottomLeft.y
            
            velocity.y = 0
            
        } else if character.position.y >= topRight.y {
            
            character.position.y = topRight.y
            
            velocity.y = 0
        }
    }
    
    func showAchievement(result: Int, size: CGSize) {
        let uiKit = "UIKitLbl"
        let spriteKit = "SpriteKitLbl"
        let sceneKit = "SceneKitLbl"
        if result == 10 {
            // learned UIKit
            showCongratulationSprite(nodeName: uiKit, size: size)
            
        } else if result == 20{
            //learned SpriteKit
            showCongratulationSprite(nodeName: spriteKit, size: size)
        } else if result == 30 {
            //learned SceneKit
            showCongratulationSprite(nodeName: sceneKit, size: size)
        }
        
    }
    
    func showCongratulationSprite(nodeName: String, size: CGSize) {
        let textNode = SKSpriteNode(imageNamed: nodeName)
        textNode.position = CGPoint(x: size.width/2, y: size.height/2)
        
        let scaleAction = SKAction.scale(by: 1.1, duration: 1.0)
        let remove = SKAction.run {
            textNode.removeFromParent()
        }
        let sequence = SKAction.sequence([scaleAction,remove])
        addChild(textNode)
        
        textNode.run(sequence)
    }
    
    func updateTimeVariation(currentTime: TimeInterval) {
        if lastCallToUpdate > 0 {
            timeVariation = currentTime - lastCallToUpdate
        } else {
            timeVariation = 0
        }
        
        lastCallToUpdate = currentTime
    }
    func rotateCharacter(characterSprite: SKSpriteNode, direction: CGPoint) {
        characterSprite.zRotation = CGFloat(atan2(Double(direction.y), Double(direction.x)))
    }
}

