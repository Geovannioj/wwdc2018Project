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

public class FirstScene: SKScene {
    
    //MARK:- Properties
    
    var firstScreenLayer: FirstScreenLayer!
    let backGroundMusicName = "Mr_Tea.mp3"
    
    //MARK:- Constructor
    override public init(size: CGSize) {
        super.init(size: size)
        
        self.setUpLayer(size: size)
        GameManager.shared.startMusic(musicName: backGroundMusicName , node: self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Class methods
    
    /**
     Function that sets up the layer that is responsable of dealing with the first scene's nodes
     - parameter size: size of the screen
     */
    func setUpLayer(size: CGSize) {
        firstScreenLayer = FirstScreenLayer(size: size)
        addChild(firstScreenLayer)
    }
    
    /**
     Function that makes the transition of the initial scene to the GameScene
     */
    func changeScene() {
        let secondScene = SecondScene(size:self.size)
        secondScene.scaleMode = scaleMode
        let showScene = SKTransition.doorway(withDuration: 1.5)
        self.removeAllChildren()
        self.view?.presentScene(secondScene, transition: showScene)
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        GameManager.shared.playTapSound(node: self)
        changeScene()
    }
}
