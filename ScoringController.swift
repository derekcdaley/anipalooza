//
//  ScoringController.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/31/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class ScoringController {
    static let instance: ScoringController = {
        let instance = ScoringController(int: 0)
        return instance;
    }();
    
    var level2Scoring: Int;
    var level2Attempts: Int;
    
    var level2ScoringText: SKLabelNode?;
    var level2AttemptsText: SKLabelNode?;
    
    
    private init(int: Int) {
        level2Scoring = int;
        level2Attempts = int;
    }
    
    func initializeVariables() {
        
        level2Scoring = 0;
        level2Attempts = 0;
        
        if ScoringManager.instance.level2Started {
            
            ScoringManager.instance.level2Started = false;
            
            level2ScoringText?.text = "\(level2Scoring)";
            level2AttemptsText?.text = "\(level2Attempts)";
        }
    }
    
    func incrementScore() {
        level2Scoring = level2Scoring + 1;
        level2ScoringText?.text = "\(level2Scoring)";
    }
    
    func incrementAttempt() {
        level2Attempts = level2Attempts + 1;
        level2AttemptsText?.text = "\(level2Attempts)";
    }
}
