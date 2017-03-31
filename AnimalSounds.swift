//
//  AnimalSounds.swift
//  Guess It
//
//  Created by Derek Daley on 3/16/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit
import AVFoundation

class AnimalSounds: SKSpriteNode {
    private var audioPlayer: AVAudioPlayer!
    
    func retrieveSoundEffect(touchedNode: String) -> AVAudioPlayer {
            let soundName = touchedNode;
            let path = Bundle.main.path(forResource: ("\(soundName).wav"), ofType:nil)!
            let url = URL(fileURLWithPath: path);
            do {
                let bit = try AVAudioPlayer(contentsOf: url);
                let loudSounds = ["hippo_anm", "rabbit_anm", "penguin_anm", "dog_anm"];
                let mediumSounds = ["tiger_anm","sheep_anm"];
                let quietSounds = ["elephant_anm", "snake_anm", "monkey_anm", "horse_anm", "frog_anm", "cat_anm", "pig_anm"];
                audioPlayer = bit;
                //adjust volume as needed
                audioPlayer.volume = 4;
                if loudSounds.contains(soundName) {
                    audioPlayer.volume = 18;
                }
                if mediumSounds.contains(soundName) {
                    audioPlayer.volume = 10;
                }
                if quietSounds.contains(soundName) {
                    audioPlayer.volume = 2;
                }
            } catch {
                // couldn't load file :(
            }
        return audioPlayer;
    }
    
    
}
