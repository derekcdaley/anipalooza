//
//  ButtonGrower.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/23/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class ButtonGrower {
    
    func animateGrowing(sknode: SKNode, scale: CGFloat)-> SKNode {
        let larger = SKAction.scale(to: scale, duration: 0.35);
        let smaller = SKAction.scale(to: scale - 0.05, duration: 0.35);
        let cycle = SKAction.sequence([larger , smaller]);
        let grower = SKAction.repeatForever(cycle);
        
        sknode.run(grower, withKey: "grower");
        
        return sknode;
    }
}
