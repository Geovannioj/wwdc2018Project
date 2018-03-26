//
//  GameOverScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 21/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    var background: SKSpriteNode!
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func chooseBackGround(won: Bool, size: CGSize) {
        if won {
            background = SKSpriteNode(imageNamed: "CongratulationBoard")
            background.position = CGPoint(x: size.width/2, y: size.height/2)
            background.zPosition = -10
            addChild(background)
        } else {
            background = SKSpriteNode(imageNamed: "TryAgainBoard")
            background.position = CGPoint(x: size.width/2, y: size.height/2)
            background.zPosition = -10
            addChild(background)
        }
        
    }
    override func didMove(to view: SKView) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
