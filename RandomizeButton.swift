//
//  RandomizeButton.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/18/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class RandomizeButton {
    private let animalController = AnimalController();
    private let buttonGrower = ButtonGrower();
    
    func createRandomizeButton(scene: SKScene) {
        var btn:SKNode! = SKSpriteNode(imageNamed: "randomizebtn");
        let scale = CGFloat(0.8);
        
        btn.name = "RandomizeBtn";
        btn.setScale(scale);
        btn.position.y = -400;
        btn.zPosition = 4;
        btn = buttonGrower.animateGrowing(sknode: (btn), scale: scale);
        
        scene.addChild(btn);
    }
    
    func retrieveDifferentAnimals(scene: SKScene) {
        for child in scene.children {
            //Determine Details
            if (child.name != nil && (child.name?.contains("_anm"))!) {
                child.removeFromParent();
            }
        }
        animalController.arrangeAnimalsInScene(scene: scene);
    }
}
