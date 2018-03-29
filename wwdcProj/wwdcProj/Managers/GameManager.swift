//
//  GameManager.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 26/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class GameManager {
    
    var score: Int = 0
    var countDown: Int = 60
    var won: Bool = false
    
    static let shared = GameManager()

    func TimerWithActions() -> SKAction {
        let waitASecond = SKAction.wait(forDuration: 1.0)
        
        let timerBlock = SKAction.run {
            if self.countDown > 0 {
                self.countDown -= 1
            } else {
                
            }
        }
        
        let sequence = SKAction.sequence([waitASecond, timerBlock])
        let repeatTimerActionForever = SKAction.repeatForever(sequence)
        return repeatTimerActionForever
    }
    
    func restartResults() {
        self.score = 0
        self.countDown = 60
        self.won = false
    }
    
    func playTapSound(node: SKNode) {
        let playSoundAction = SKAction.playSoundFileNamed("TapSound.mp3", waitForCompletion: true)
        node.run(playSoundAction)
    }
    
    func startMusic(musicName: String, node: SKNode) {
        let musicAction =  SKAudioNode(fileNamed: musicName)
        node.addChild(musicAction)
    }
}
