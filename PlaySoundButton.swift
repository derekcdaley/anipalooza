//
//  PlaySoundButton.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/29/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit
import AVFoundation

class PlaySoundButton {
    private let buttonGrower = ButtonGrower();
    private let animalController = AnimalController();
    private let animalSounds = AnimalSounds();
    
    private var setAnimalSound:SKNode! = nil;
    
    var soundPlayer: AVAudioPlayer! = nil;
    
    func createPlaySoundButton(scene: SKScene) {
        let randomNumber = Int(arc4random_uniform(4));
        var animalArray = [SKNode]();
        for child in scene.children {
            if child.name != nil && (child.name?.contains("_anm"))!{
                animalArray.append(child);
            }
        }

        setAnimalSound = animalArray[randomNumber];
        
        var btn:CustomNode = CustomNode(imageNamed: "playsoundbtn");
        let scale = CGFloat(0.8);
        
        btn.name = "PlaySoundBtn";
        btn.soundName = setAnimalSound.name!;
        btn.setScale(scale);
        btn.position.y = 85;
        btn.zPosition = 4;
        btn = buttonGrower.animateGrowing(sknode: (btn), scale: scale) as! CustomNode;
        scene.addChild(btn);
    }
    
    func generateRandomSound(scene: SKScene) {
        soundPlayer = animalSounds.retrieveSoundEffect(touchedNode: setAnimalSound.name!);
        soundPlayer.play();
    }

}
