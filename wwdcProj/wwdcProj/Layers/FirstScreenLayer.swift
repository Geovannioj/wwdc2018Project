//
//  FirstScreenLayer.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 21/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class FirstScreenLayer: SKNode {
    
    
    //MARK:- Properties
    //
    var background: SKSpriteNode!
    var tapToStart: SKSpriteNode!
    var title: SKSpriteNode!
    var character: SKSpriteNode!
    var clouds = [SKSpriteNode]()
    var books = [SKSpriteNode]()
    
    
    //MARK:- Constructor
    
    init(size: CGSize) {
        super.init()
        
        self.setUpbackgroundImg(size: size)
        self.setUpClouds(size: size)
        self.animateTapBtn()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    /**
     Function that sets up the background image of the main scene
     - parameter size: size of the screen
     */
    
    func setUpbackgroundImg(size: CGSize) {
       
        background = SKSpriteNode(imageNamed:"FirstScreen")
        background.position = CGPoint(x:size.width/2, y:size.height/2)
        background.zPosition = -10
        addChild(background)
        
        title = SKSpriteNode(imageNamed: "Title")
        title.position = CGPoint(x: size.width / 2, y: size.height * 0.7)
        addChild(title)
        
        tapToStart = SKSpriteNode(imageNamed: "TapToStart")
        tapToStart.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)
        addChild(tapToStart)
        
        character = SKSpriteNode(imageNamed: "TalkingCharacter")
        character.position = CGPoint(x: size.width * 0.2, y: size.height * 0.3)
        addChild(character)
        
        
    }
    
    /**
     Function that makes the tap button scale animation
     */
    func animateTapBtn() {
        
        let scaleAction = SKAction.scale(by: 1.1, duration: 1.0)
        let sequence = SKAction.sequence([scaleAction, scaleAction.reversed()])
        let repeatSequence = SKAction.repeatForever(sequence)
        
        tapToStart.run(repeatSequence)
        
    }
    
    /**
     Function that sets up the clounds in the firstScreen
     - parameter size: size of the screen
     */
    func setUpClouds(size: CGSize) {
        
        var action: SKAction!
        
        for index in 0..<4 {
            let cloud = SKSpriteNode(imageNamed: "Cloud")
            switch index {
            case 0 :
                cloud.position = CGPoint(x: size.width * 0.1, y: size.height * 0.9)
                action = SKAction.move(to: CGPoint(x: size.width * 0.4, y: size.height * 0.9), duration: 100.0)
                break
            case 1:
                cloud.position = CGPoint(x: size.width * 0.4, y: size.height * 0.9)
                action = SKAction.move(to: CGPoint(x: size.width * 0.1, y: size.height * 0.9), duration: 100.0)
                break
                
            case 2:
                cloud.position = CGPoint(x: size.width * 0.6, y: size.height * 0.9)
                action = SKAction.move(to: CGPoint(x: size.width * 0.8, y: size.height * 0.9), duration: 100.0)
                break
                
            case 3:
                cloud.position = CGPoint(x: size.width * 0.9, y: size.height * 0.9)
                action = SKAction.move(to: CGPoint(x: size.width * 0.7, y: size.height * 0.9), duration: 100.0)
                break
                
            default:
                
                break
                
            }
            cloud.run(action)
            clouds.append(cloud)
            addChild(clouds[index])
            
        }
    }
}
