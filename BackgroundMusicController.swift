//
//  BackgroundMusic.swift
//  Guess It
//
//  Created by Derek Daley on 3/16/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit
import AVFoundation

class BackgroundMusicController {
    
    private var audioPlayer: AVAudioPlayer! = nil;
    
    func playBackgroundMusic(scene:SKScene) -> AVAudioPlayer {
        var audioFile = "main.wav";
        if scene.name == "SettingsScene"{
            audioFile = "settings.m4a";
        }
        
        let path = Bundle.main.path(forResource: audioFile, ofType: nil)!;
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            //guard let audioPlayer = audioPlayer else { return audioPlayer }
            audioPlayer.numberOfLoops = -1;
        
            audioPlayer.prepareToPlay();
        } catch let error {
            print(error.localizedDescription)
        }
        
        return audioPlayer;
    }
    
    func toggleMusic(musicOnOff: String, scene: SKScene, musicButtons: [SKNode]) {
        let gameViewController = GameViewController();
        if musicOnOff == "Off" {
            if scene.children.contains(musicButtons[0]){
                musicButtons[0].removeFromParent();
                scene.addChild(musicButtons[1]);
            }
            gameViewController.globalMusicStop();
        }else{
            if scene.children.contains(musicButtons[1]){
                musicButtons[1].removeFromParent();
                scene.addChild(musicButtons[0]);
            }
            gameViewController.globalMusicStart();
        }
    }
    
}
