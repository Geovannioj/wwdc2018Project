//
//  FirstScene.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 20/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class FirstScene: SKScene {
    
    var firstScreenLayer: FirstScreenLayer!
    
    override init(size: CGSize) {
        super.init(size: size)
       
        self.setUpLayer(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    override func didMove(to view: SKView) {
        
    }
    
    func setUpLayer(size: CGSize) {
        firstScreenLayer = FirstScreenLayer(size: size)
        addChild(firstScreenLayer)
    }
    
    /**
     Function that makes the transition of the initial scene to the GameScene
     */
    func sceneTouched() {
        let secondScene = SecondScene(size:self.size)
        secondScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(secondScene, transition: showScene)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sceneTouched()
    }
}
