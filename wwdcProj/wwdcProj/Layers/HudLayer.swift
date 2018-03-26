//
//  HudLayer.swift
//  wwdcProj
//
//  Created by Geovanni Oliveira de Jesus on 19/03/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit

class HudLayer: SKNode {
    
    //MARK:- Properties
    
    var scoreLabel: SKLabelNode!
    var resultScore: SKLabelNode!
    
    var timeLabel: SKLabelNode!
    var countDownLabel: SKLabelNode!
    
    init(size: CGSize) {
        super.init()
        setUpAllLabels(size: size)
        startTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startTimer() {
        let startTimerAction = GameManager.shared.TimerWithActions()
        self.run(startTimerAction)
    }
    
    //MARK: - position of labels on the screen
    func setScoreLabel(size: CGSize) {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score:"
        scoreLabel.fontColor = UIColor.white
        scoreLabel.fontSize = 25.0
        scoreLabel.zPosition = 10
        scoreLabel.position = CGPoint(x: size.width * 0.1, y: size.height * 0.9)
        addChild(scoreLabel)
    }
    
    func setResultScore(size: CGSize) {
        resultScore = SKLabelNode(fontNamed: "Chalkduster")
        resultScore.text = String(GameManager.shared.score)
        resultScore.fontColor = UIColor.white
        resultScore.fontSize = 25.0
        resultScore.zPosition = 10
        resultScore.position = CGPoint(x: size.width * 0.3, y: size.height * 0.9)
        addChild(resultScore)
    }
    
    func setTimeLabel(size: CGSize) {
        timeLabel = SKLabelNode(fontNamed: "Chalkduster")
        timeLabel.text = "Time left:"
        timeLabel.fontColor = UIColor.white
        timeLabel.fontSize = 25.0
        timeLabel.zPosition = 10
        timeLabel.position = CGPoint(x: size.width * 0.7, y: size.height * 0.9)
        addChild(timeLabel)
    }
    func setCountDownLabel(size: CGSize) {
        countDownLabel = SKLabelNode(fontNamed: "Chalkduster")
        countDownLabel.text = "Time left:"
        countDownLabel.fontColor = UIColor.white
        countDownLabel.fontSize = 25.0
        countDownLabel.zPosition = 10
        countDownLabel.position = CGPoint(x: size.width * 0.9, y: size.height * 0.9)
        addChild(countDownLabel)
    }
    
    func setUpAllLabels(size: CGSize) {
        setScoreLabel(size: size)
        setResultScore(size: size)
        
        setTimeLabel(size: size)
        setCountDownLabel(size: size)
        
    }
}
