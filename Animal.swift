//
//  Animal.swift
//  Guess It
//
//  Created by Derek Daley on 3/15/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class Animal: SKSpriteNode {
    private var animals = [String]();
    private var animalNodes = [SKSpriteNode]();
    
    func createAnimals() -> [SKSpriteNode] {
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        do {
            let items = try fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                if item.contains("_anm") && !item.contains("wav"){
                    let newItem = item.replacingOccurrences(of: ".png", with: "")
                    let animal = SKSpriteNode(imageNamed: newItem);
                    animal.name = newItem;
                    let rotR = SKAction.rotate(byAngle: 0.25, duration: 0.3)
                    let rotL = SKAction.rotate(byAngle: -0.25, duration: 0.3)
                    let cycle = SKAction.sequence([rotR, rotL, rotL, rotR])
                    let wiggle = SKAction.repeatForever(cycle)
                    animal.run(wiggle, withKey: "wiggle")
                    
                    animal.xScale = 0.4;
                    animal.yScale = 0.4;
                    animal.zPosition = 4;
                    
                    animalNodes.append(animal);
                }
            }
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
        
        return animalNodes;
    }
}
