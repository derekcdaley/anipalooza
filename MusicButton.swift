//
//  MusicButton.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/17/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class MusicButton {
    
    private var musicOnBtn:SKNode! = nil;
    private var musicOffBtn:SKNode! = nil;
    
    func createButtons(scene: SKScene) -> [SKNode]{
        var nodes = [SKNode]();
        let bounceUp = SKAction.moveTo(y: 350, duration: 0.4);
        let bounceDown = SKAction.moveTo(y: 335, duration: 0.4);
        let cycle = SKAction.sequence([bounceUp , bounceDown]);
        let bounce = SKAction.repeatForever(cycle);
        
        musicOnBtn = SKSpriteNode(imageNamed: "MusicOn");
        musicOnBtn.name = "MusicOn";
        musicOnBtn.position = CGPoint(x: 190, y: 350);
        musicOnBtn.zPosition = 4;
        musicOnBtn.setScale(0.8);
        musicOnBtn.run(bounce, withKey: "bounce");
        
        
        musicOffBtn = SKSpriteNode(imageNamed: "MusicOff");
        musicOffBtn.name = "MusicOff";
        musicOffBtn.position = CGPoint(x: 190, y: 346);
        musicOffBtn.zPosition = 4;
        musicOffBtn.setScale(0.8);
        
        scene.addChild(musicOnBtn);
        
        nodes.append(musicOnBtn);
        nodes.append(musicOffBtn);
        
        return nodes;
        
    }
}
