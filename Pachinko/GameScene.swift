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
        
        createBouncer(at: CGPoint(x: 0, y: 0))
        createBouncer(at: CGPoint(x: 256, y: 0))
        createBouncer(at: CGPoint(x: 512, y: 0))
        createBouncer(at: CGPoint(x: 778, y: 0))
        createBouncer(at: CGPoint(x: 1034, y: 0))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch                 = touches.first else { return }
                        
        let location                    = touch.location(in: self)
        let ball                        = SKSpriteNode(imageNamed: "ballRed")
        ball.physicsBody                = SKPhysicsBody(circleOfRadius: ball.frame.width / 2)
        ball.physicsBody?.restitution   = 0.4
        ball.position                   = location
        addChild(ball)
    }
    
    
    func createBouncer(at position: CGPoint) {
        let bouncer                    = SKSpriteNode(imageNamed: "bouncer")
        bouncer.physicsBody            = SKPhysicsBody(circleOfRadius: bouncer.frame.width / 2)
        bouncer.physicsBody?.isDynamic = false
        bouncer.position               = position
        addChild(bouncer)
    }
}
