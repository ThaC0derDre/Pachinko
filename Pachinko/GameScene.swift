//
//  GameScene.swift
//  Pachinko
//
//  Created by Andres Gutierrez on 2/8/22.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background          = SKSpriteNode(imageNamed: "background")
        background.position     = CGPoint(x: 512, y: 384)
        
        // Bleand = How to draw. .replace = draw without worrying about alpha values, good for objects without gaps like our background
        background.blendMode    = .replace
        
        //zPosition = where layer is placed. -1 = behind everything else
        background.zPosition    = -1
        addChild(background)
        
    // add physics to the whole scene
        physicsBody             = SKPhysicsBody(edgeLoopFrom: frame)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location    = touch.location(in: self)
        let box         = SKSpriteNode(color: .red, size: CGSize(width: 64, height: 64))
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        box.position    = location
        addChild(box)
    }
}
