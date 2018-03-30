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


