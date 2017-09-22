//
//  StartButton.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/23/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class HomeButton {
    private let positioning = Positioning();
    
    func setHomePosition(defaultPos: Int, scene: SKScene) {
        let home = scene.childNode(withName: "Home");
        home?.position = positioning.convertPosition(point: CGPoint(x: defaultPos, y: defaultPos), scene: scene, relativePoint: "topLeft");
    }
    
    func singleTapHome(scene: SKScene){
        let homeIns = scene.childNode(withName: "Home")?.children[0];
        let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 0.5);
        let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: 0.5);
        let cycle = SKAction.sequence([fadeIn , fadeOut]);
        let action = SKAction.repeat(cycle, count: 1);
        homeIns!.run(action, withKey: "action");
    }
    
    func doubleTapHome (scene: SKScene) {
        let mainScene = MainMenuScene(fileNamed: "MainMenuScene");
        mainScene!.scaleMode = .aspectFill
        scene.view?.presentScene(mainScene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.0));
    }
}
