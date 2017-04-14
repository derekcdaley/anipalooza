//
//  Level2Scene.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/29/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit
import AVFoundation

class Level2Scene: SKScene {
    private let homeButton = HomeButton();
    private let positioning = Positioning();
    private let musicButton = MusicButton();
    private let playSoundButton = PlaySoundButton();
    private let notificationSound = NotificationSounds();
    private let settings = SettingsScene();
    private let animalController = AnimalController();
    private let randonmizeButton = RandomizeButton();
    
    private var bgMusic = BackgroundMusicController();
    private var musicButtons = [SKNode]();
    
    override func didMove(to view: SKView) {
        self.intializeView();
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var tapCount = 0;
        
        for touch in touches {
            let location = touch.location(in: self);
            let touchedNode = self.atPoint(location);
            
            if touchedNode.name != nil {
                //if home button tapped, go home
                if touchedNode.name == "Home" ||
                    touchedNode.parent?.name == "Home"{
                    tapCount = touch.tapCount;
                    
                    if tapCount == 1 {
                        homeButton.singleTapHome(scene: self.scene!);
                    }else if tapCount == 2 {
                        homeButton.doubleTapHome(scene: self);
                    }
                }
                
                //if music button tapped, toggle music
                if (touchedNode.name?.contains("Music"))!{
                    //if the music is on, we need to turn it off
                    let musicOnOff = (touchedNode.name!.contains("On")) ? "Off" : "On";
                    bgMusic.toggleMusic(musicOnOff: musicOnOff, scene: self.scene!, musicButtons: musicButtons);
                }
                
                if (touchedNode.name?.contains("_anm"))! {
                    let touched = self.childNode(withName: touchedNode.name!);
                    if (touched!.contains(location)) {
                        isTouchedAnimalCorrect(node: touchedNode);
                    }
                }
                
                //if music button tapped, toggle music
                if touchedNode.name == "PlaySoundBtn" {
                    playSoundButton.generateRandomSound(scene: self);
                }
                
            }
            
        }
        
    }
    
    func intializeView(){
        let musicPref = settings.defaults.string(forKey: "MusicPref");
        let defaultPos = (positioning.getDeviceForPos() == "ipad") ? 70 : 40;
        
        getScoreLabels();
        ScoringController.instance.initializeVariables();
        
        animalController.arrangeAnimalsInScene(scene: self.scene!);
        playSoundButton.createPlaySoundButton(scene: self.scene!);
        musicButtons = musicButton.createButtons(scene: self.scene!);
        homeButton.setHomePosition(defaultPos: defaultPos, scene: self.scene!);
        bgMusic.toggleMusic(musicOnOff: musicPref!, scene: self.scene!, musicButtons: musicButtons);
    }
    
    func isTouchedAnimalCorrect(node: SKNode){
        let playButton:CustomNode = self.childNode(withName: "PlaySoundBtn") as! CustomNode;
        var sound:AVAudioPlayer! = nil;
        if node.name == playButton.soundName{
            sound = notificationSound.retrieveSoundEffect(notification: "correct");
            ScoringController.instance.incrementScore();
        }else{
            sound = notificationSound.retrieveSoundEffect(notification: "incorrect");
        }
        ScoringController.instance.incrementAttempt();
        playButton.removeFromParent();
        randonmizeButton.retrieveDifferentAnimals(scene: self.scene!);
        playSoundButton.createPlaySoundButton(scene: self.scene!);
        sound.play();
    }
    
    func getScoreLabels() {
        ScoringController.instance.level2ScoringText = self.childNode(withName: "ScoreNumber") as? SKLabelNode;
        ScoringController.instance.level2AttemptsText = self.childNode(withName: "ScoreAttempt") as? SKLabelNode;
    }
}
