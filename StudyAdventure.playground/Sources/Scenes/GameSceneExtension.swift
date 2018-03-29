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

    public func didBegin(_ contact: SKPhysicsContact) {
        let characterNodeABookNodeB = contact.bodyA.categoryBitMask == EnumBitmaskCategory.character.rawValue && contact.bodyB.categoryBitMask == EnumBitmaskCategory.book.rawValue
        let characterNodeABadNodeB = contact.bodyA.categoryBitMask == EnumBitmaskCategory.character.rawValue && contact.bodyB.categoryBitMask == EnumBitmaskCategory.badItem.rawValue
        
        if characterNodeABookNodeB {
            gameLayer.playGrabbedBookSound()
            GameManager.shared.score += 1
            contact.bodyB.node?.removeFromParent()
            print(GameManager.shared.score)
            
        } else if characterNodeABadNodeB {
            
            //MARK:- TO DO - Something bad happens to the player
        }
        
    }
    
    public func didEnd(_ contact: SKPhysicsContact) {
        
    }
}


