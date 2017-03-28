//
//  StartButton.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/23/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class StartButton {
    private let buttonGrower = ButtonGrower();
    
    func createStartButton(scene: SKScene) {
        var btn:SKNode! = SKSpriteNode(imageNamed: "StartBtn");
        
        btn.name = "Level1";
        btn.setScale(0.7);
        btn.position.x = 0;
        btn.position.y = -193.2;
        btn.zPosition = 4;
        btn = buttonGrower.animateGrowing(sknode: (btn));
        
        scene.addChild(btn);
    }
}
