//
//  GameViewController.swift
//  Guess It
//
//  Created by Derek Daley on 3/15/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

private var musicPlayer: AVAudioPlayer! = nil;

class GameViewController: UIViewController {
    private var bgMusic = BackgroundMusicController();
    private var settings = SettingsScene();

    override func viewDidLoad() {
        super.viewDidLoad();
        self.initializeView();

        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = MainMenuScene(fileNamed: "MainMenuScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false;
            view.showsNodeCount = false;
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func initializeView() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore");
        let scene = MainMenuScene(fileNamed: "MainMenuScene");
        
        if !launchedBefore  {
            settings.defaults.set("On", forKey: "MusicPref");
            UserDefaults.standard.set(true, forKey: "launchedBefore");
        }
        
        musicPlayer = bgMusic.playBackgroundMusic(scene: scene!);
        
    }
    
    func globalMusicStop() {
        if musicPlayer.isPlaying {
            musicPlayer.stop();
        }
    }
    
    func globalMusicStart() {
        if !musicPlayer.isPlaying {
            musicPlayer.play();
        }
    }
    
    
}
