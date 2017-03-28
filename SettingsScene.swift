//
//  SettingsScene.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/22/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit
import AVFoundation

class SettingsScene: SKScene {
    let defaults = UserDefaults.standard;
    private let bgMusic = BackgroundMusicController();
    
    private var offBtn: SKNode? = nil;
    private var onBtn: SKNode? = nil;
    private var musicPlayer: AVAudioPlayer! = nil;
    
    override func didMove(to view: SKView) {
        self.initializeView();
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self);
            let touchedNode = self.atPoint(location);
            
            if touchedNode.name != nil {
                //if home button tapped, go home
                if touchedNode.name == "Home" {
                    
                    let scene = MainMenuScene(fileNamed: "MainMenuScene");
                    scene!.scaleMode = .aspectFill;
                    
                    musicPlayer.stop();
                    
                    self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.0));
                }
                
                if touchedNode.name == "MusicOnBtn" {
                    if !musicPlayer.isPlaying {
                        tappedOnBtn();
                    }
                    defaults.set("On", forKey: "MusicPref");
                }
                
                if touchedNode.name == "MusicOffBtn" {
                    if musicPlayer.isPlaying {
                        tappedOffBtn();
                    }
                    defaults.set("Off", forKey: "MusicPref");
                }
                
            }
            
            
        }
        
    }
    
    func initializeView() {
        let musicPref = defaults.string(forKey: "MusicPref");
        
        offBtn = self.scene?.childNode(withName: "MusicOffBtn");
        onBtn = self.scene?.childNode(withName: "MusicOnBtn");
        musicPlayer = bgMusic.playBackgroundMusic(scene: self.scene!);
        
        if musicPref == "On"{
            tappedOnBtn();
        }else{
            tappedOffBtn();
        }
        
    }
    
    func tappedOnBtn() {
        offBtn?.alpha = 1;
        onBtn?.alpha = 0.5;
        musicPlayer.play();
    }
    
    func tappedOffBtn(){
        offBtn?.alpha = 0.5;
        onBtn?.alpha = 1;
        musicPlayer.stop();
    }
}
