//
//  AnimalController.swift
//  Guess It
//
//  Created by Derek Daley on 3/15/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class AnimalController: SKSpriteNode {
    
    private var animateAnimalAction = SKAction();
    private var animals = [SKNode]();
    
    func shuffle( animalssArray: [SKNode]) -> [SKNode] {
        var animalssArray = animalssArray;
        for i in ((0 + 1)...animalssArray.count - 1).reversed() {
            
            let j = Int(arc4random_uniform(UInt32(i-1)));
            
            swap(&animalssArray[i], &animalssArray[j]);
            
            
        }
        return animalssArray;
    }
    
    func arrangeAnimalsInScene(scene: SKScene){
    
        let animal = Animal();
        animals = animal.createAnimals();
        animals = shuffle(animalssArray: animals);
        
        for i in 0...3 {
            var x = 0;
            var y = 0;
            switch(i){
                case 0:
                    x = -120;
                    y = -30;
                case 1:
                    x = 120;
                    y = -30;
                case 2:
                    x = 0;
                    y = -170;
                default:
                    x = 0;
                    y = 110;
            }
            animals[i].position = CGPoint(x: x, y: y);
            scene.addChild(animals[i]);
        }
    }
    
    
    
}

