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
    
    //MARK:- Properties
    var score: Int = 0
    var countDown: Int = 60
    var won: Bool = false
    
    static let shared = GameManager()

    //MARK:- Manager's methods
    
    /**
     Function that creates a timer with SKActions
     
     - Returns: timer as SKAction
     */
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
    
    /**
     Function to restart the game
     */
    func restartResults() {
        self.score = 0
        self.countDown = 60
        self.won = false
    }
    
    /**
     Function that plays the tap sound on all the scenes
     - parameter node: node to run the action
     */
    func playTapSound(node: SKNode) {
        let playSoundAction = SKAction.playSoundFileNamed("Tap2.mp3", waitForCompletion: true)
        node.run(playSoundAction)
    }
    
    /**
     Function that start the background music of a scene
     - parameter musicName: name of the music to be played
     - node: node that will play the music
     */
    func startMusic(musicName: String, node: SKNode) {
        let musicAction =  SKAudioNode(fileNamed: musicName)
        node.addChild(musicAction)
    }
}
