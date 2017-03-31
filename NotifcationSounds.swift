//
//  NotifcationSounds.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/31/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit
import AVFoundation

class NotificationSounds: SKSpriteNode {
    private var audioPlayer: AVAudioPlayer!
    
    func retrieveSoundEffect(notification: String) -> AVAudioPlayer {
        let path = Bundle.main.path(forResource: ("\(notification).m4a"), ofType:nil)!
        let url = URL(fileURLWithPath: path);
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url);
            audioPlayer.volume = 5;
        } catch {
            // couldn't load file :(
        }
        return audioPlayer;
    }
    
    
}

