//
//  GameSceneExtension.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 23/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
//    func didBegin(_ contact: SKPhysicsContact) {
//        let characterNodeABookNodeB = contact.bodyA.categoryBitMask == EnumBitmaskCategory.character.rawValue && contact.bodyB.categoryBitMask == EnumBitmaskCategory.book.rawValue
//        let characterNodeABadNodeB = contact.bodyA.categoryBitMask == EnumBitmaskCategory.character.rawValue && contact.bodyB.categoryBitMask == EnumBitmaskCategory.badItem.rawValue
//
//        if characterNodeABookNodeB {
//            gameLayer.playGrabbedBookSound()
//            GameManager.shared.score += 1
//            print(GameManager.shared.score)
//            contact.bodyB.node?.removeFromParent()
//            print(GameManager.shared.score)
//
//        } else if characterNodeABadNodeB {
//
//            //MARK:- TO DO - Something bad happens to the player
//        }
//
//    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let characterABookB = contact.bodyA.categoryBitMask == EnumBitmaskCategory.character.rawValue && contact.bodyB.categoryBitMask == EnumBitmaskCategory.book.rawValue
        
        if characterABookB {
            gameLayer.playGrabbedBookSound()
            
            if ((contact.bodyB.node?.parent) != nil) {
                GameManager.shared.score += 1
                contact.bodyB.node?.removeFromParent()
            }
           
            
        }
    }
    

}

