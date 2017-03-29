//
//  MainMenuScene.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/21/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit
import AVFoundation

class MainMenuScene: SKScene {
    
    private let gameViewController = GameViewController();
    private let settings = SettingsScene();
    private let buttonGrower = ButtonGrower();
    private let startButton = StartButton();
    private let positioning = Positioning();
    
    override func didMove(to view: SKView) {
        self.initializeView();
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self);
            let touchedNode = self.atPoint(location);
            
            if touchedNode.name != nil {
                if touchedNode.name == "Level1" {
                    
                    let scene = Level1Scene(fileNamed: "Level1Scene");
                    scene!.scaleMode = .aspectFill

                    self.view?.presentScene(scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1.0));
                }
                
                if touchedNode.name == "Settings" {
                    let scene = SettingsScene(fileNamed: "SettingsScene");
                    scene!.scaleMode = .aspectFill
                    
                    gameViewController.globalMusicStop();
                    
                    self.view?.presentScene(scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1.0));
                    
                }
                
            }
            
        }
        
    }
    
    
    func initializeView() {
        let musicPref = settings.defaults.string(forKey: "MusicPref");
        let defaultPos = (positioning.getDeviceForPos() == "ipad") ? 70 : 40;
        
        //Used until levels are done
        startButton.createStartButton(scene: scene!);
        
        if musicPref == "On"{
            gameViewController.globalMusicStart();
        }else{
            gameViewController.globalMusicStop();
        }
        
        setGearPosition(defaultPos: defaultPos);
    }
    
    func setGearPosition(defaultPos: Int) {
        let gear = scene?.childNode(withName: "Settings");
        gear?.position = positioning.convertPosition(point: CGPoint(x: defaultPos, y: defaultPos), scene: self, relativePoint: "bottomRight");
        
    }
    
}
