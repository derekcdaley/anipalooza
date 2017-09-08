//
//  PositioningClass.swift
//  AniPalooza
//
//  Created by Derek Daley on 3/27/17.
//  Copyright © 2017 DSkwared. All rights reserved.
//

import SpriteKit

class Positioning {
    let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom;
    
    func convertPosition(point: CGPoint, scene: SKScene, relativePoint: String)->CGPoint {
        switch(relativePoint){
        case "bottomRight":
            return scene.view!.convert(CGPoint(x: scene.view!.frame.width-point.x, y:scene.view!.frame.height-point.y), to:scene);
        case "topLeft":
            return scene.view!.convert(CGPoint(x: point.x, y: point.y), to:scene);
        case "topRight":
            return scene.view!.convert(CGPoint(x: scene.view!.frame.width-point.x, y: point.y), to:scene);
        default:
            return scene.view!.convert(CGPoint(x: point.x, y:scene.view!.frame.height-point.y), to:scene)
        }
    }
    
    func getDeviceForPos() -> String {
        var type = "NA";
        switch (deviceIdiom) {
        case .pad:
            type = "ipad";
        case .phone:
            type = "iphone";
        default:
            print("Unspecified UI idiom")
        }
        return type;
    }
}
