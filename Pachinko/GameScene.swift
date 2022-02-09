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
// center of screen
        background.position     = CGPoint(x: 512, y: 384)
        
// Blend = How to draw.
//.replace = draw without worrying about alpha values, good for objects without gaps like our background
        background.blendMode    = .replace
        
//zPosition = where layer is placed. -1 = behind everything else
        background.zPosition    = -1
        addChild(background)
        
// add physics to the whole scene
        physicsBody             = SKPhysicsBody(edgeLoopFrom: frame)
        
        createBouncer(at: CGPoint(x: 0, y: 0))
        createBouncer(at: CGPoint(x: 256, y: 0))
        createBouncer(at: CGPoint(x: 512, y: 0))
        createBouncer(at: CGPoint(x: 768, y: 0))
        createBouncer(at: CGPoint(x: 1024, y: 0))
        
        createSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        createSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        createSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        createSlot(at: CGPoint(x: 896, y: 0), isGood: false)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch                 = touches.first else { return }
                        
        let location                    = touch.location(in: self)
        let ball                        = SKSpriteNode(imageNamed: "ballRed")
        ball.physicsBody                = SKPhysicsBody(circleOfRadius: ball.frame.width / 2)
        ball.physicsBody?.restitution   = 0.4
        ball.position                   = location
        ball.name                       = "Ball"
        addChild(ball)
    }
    
    
    func createBouncer(at position: CGPoint) {
        let bouncer                    = SKSpriteNode(imageNamed: "bouncer")
        bouncer.physicsBody            = SKPhysicsBody(circleOfRadius: bouncer.frame.width / 2)
        bouncer.physicsBody?.isDynamic = false
        bouncer.position               = position
        addChild(bouncer)
    }
    
    
    func createSlot(at position: CGPoint, isGood: Bool) {
        var glow            = SKSpriteNode()
        var slot            = SKSpriteNode()
       
        if isGood {
            glow            = SKSpriteNode(imageNamed: "slotGlowGood")
            slot            = SKSpriteNode(imageNamed: "slotBaseGood")
            slot.name       = "Good Slot"
        }else {
            glow            = SKSpriteNode(imageNamed: "slotGlowBad")
            slot            = SKSpriteNode(imageNamed: "slotBaseBad")
            slot.name       = "Bad Slot"
        }
        
        slot.position       = position
        slot.physicsBody    = SKPhysicsBody(rectangleOf: slot.size)
        glow.position       = position
        addChild(glow)
        addChild(slot)
        
        let spin            = SKAction.rotate(byAngle: .pi, duration: 10)
        let spinForever     = SKAction.repeatForever(spin)
        glow.run(spinForever)
    }
}
