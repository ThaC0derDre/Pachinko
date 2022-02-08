//
//  GameScene.swift
//  Pachinko
//
//  Created by Andres Gutierrez on 2/8/22.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background  = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        addChild(background)
    }
    
}
