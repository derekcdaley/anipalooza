//
//  MusicButton.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/17/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class MusicButton {
    private let positioning = Positioning();
    
    private var musicOnBtn:SKNode! = nil;
    private var musicOffBtn:SKNode! = nil;
    
    func createButtons(scene: SKScene) -> [SKNode]{
        var nodes = [SKNode]();
        
        let defaultPos = (positioning.getDeviceForPos() == "ipad") ? 60 : 40;
        let bouncePos = positioning.convertPosition(point: CGPoint(x: defaultPos, y: defaultPos), scene: scene, relativePoint: "topRight");
        let bounceUp = SKAction.moveTo(y: bouncePos.y, duration: 0.4);
        let bounceDown = SKAction.moveTo(y: bouncePos.y-10, duration: 0.4);
        let cycle = SKAction.sequence([bounceUp , bounceDown]);
        let bounce = SKAction.repeatForever(cycle);
        
        musicOnBtn = SKSpriteNode(imageNamed: "MusicOn");
        musicOnBtn.name = "MusicOn";
        musicOnBtn?.position = positioning.convertPosition(point: CGPoint(x: defaultPos, y: defaultPos), scene: scene, relativePoint: "topRight");
        musicOnBtn.zPosition = 4;
        musicOnBtn.setScale(1);
        musicOnBtn.run(bounce, withKey: "bounce");
        
        
        musicOffBtn = SKSpriteNode(imageNamed: "MusicOff");
        musicOffBtn.name = "MusicOff";
        musicOffBtn?.position = positioning.convertPosition(point: CGPoint(x: defaultPos, y: defaultPos), scene: scene, relativePoint: "topRight");
        musicOffBtn.zPosition = 4;
        musicOffBtn.setScale(1);
        
        scene.addChild(musicOnBtn);
        
        nodes.append(musicOnBtn);
        nodes.append(musicOffBtn);
        
        return nodes;
        
    }
}
