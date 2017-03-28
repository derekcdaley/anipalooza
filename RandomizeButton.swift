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
        var btn:SKNode! = SKSpriteNode(imageNamed: "RandomizeBtn");
        
        btn.name = "RandomizeBtn";
        btn.setScale(0.7);
        btn.position.y = -330;
        btn.zPosition = 4;
        btn = buttonGrower.animateGrowing(sknode: (btn));
        
        scene.addChild(btn);
    }
    
    func retrieveDifferentAnimals(touchedNode: SKNode, scene: SKScene) {
        for child in scene.children {
            //Determine Details
            if (child.name != nil && (child.name?.contains("_anm"))!) {
                child.removeFromParent();
            }
        }
        animalController.arrangeAnimalsInScene(scene: scene);
    }
}
