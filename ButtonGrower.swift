//
//  ButtonGrower.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/23/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class ButtonGrower {
    
    func animateGrowing(sknode: SKNode)-> SKNode {
        let larger = SKAction.scale(to: 0.8, duration: 0.35);
        let smaller = SKAction.scale(to: 0.75, duration: 0.35);
        let cycle = SKAction.sequence([larger , smaller]);
        let grower = SKAction.repeatForever(cycle);
        
        sknode.run(grower, withKey: "grower");
        
        return sknode;
    }
}
