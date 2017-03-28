//
//  GameplayScene.swift
//  Jack the Giant
//
//  Created by Derek Daley on 3/13/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit
import AVFoundation

class Level1Scene: SKScene {
    
    private let animalController = AnimalController();
    private let musicButton = MusicButton();
    private let randomizeBtn = RandomizeButton();
    private let settings = SettingsScene();
    
    private var bgMusic = BackgroundMusicController();
    private var musicButtons = [SKNode]();
    
    
    var soundPlayer: AVAudioPlayer! = nil;
    
    override func didMove(to view: SKView) {
        self.intializeView();
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let animalSounds = AnimalSounds();
        
        for touch in touches {
            let location = touch.location(in: self);
            let touchedNode = self.atPoint(location);
            let randomBtn = RandomizeButton();
            
            if touchedNode.name != nil {
                //if animal tapped, play sound
                if (touchedNode.name?.contains("_anm"))! {
                    let touched = self.childNode(withName: touchedNode.name!);
                    soundPlayer = animalSounds.retrieveSoundEffect(animalTapped: touched!, location: location, touchedNode: touchedNode.name!);
                    soundPlayer.play();
                }
                
                //if music button tapped, toggle music
                if (touchedNode.name?.contains("Music"))!{
                    //if the music is on, we need to turn it off
                    let musicOnOff = (touchedNode.name!.contains("On")) ? "Off" : "On";
                    bgMusic.toggleMusic(musicOnOff: musicOnOff, scene: self.scene!, musicButtons: musicButtons);
                }
                
                //if random button tapped, show different animals
                if (touchedNode.name?.contains("RandomizeBtn"))!{
                    randomBtn.retrieveDifferentAnimals(touchedNode: touchedNode, scene: self.scene!);
                }
                
                //if home button tapped, go home
                if (touchedNode.name?.contains("Home"))!{
                    
                    let scene = MainMenuScene(fileNamed: "MainMenuScene");
                    scene!.scaleMode = .aspectFill
                        
                    self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.0));
                }
                
            }
            
            
        }

    }
    
    func intializeView(){
        let musicPref = settings.defaults.string(forKey: "MusicPref");
        
        animalController.arrangeAnimalsInScene(scene: self.scene!);
        musicButtons = musicButton.createButtons(scene: self.scene!);
        randomizeBtn.createRandomizeButton(scene: self.scene!);
        
        bgMusic.toggleMusic(musicOnOff: musicPref!, scene: self.scene!, musicButtons: musicButtons);
    }
}




































