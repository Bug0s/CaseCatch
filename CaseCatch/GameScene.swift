//
//  GameScene.swift
//  CaseCatch
//
//  Created by Bartos Bence on 2022. 08. 08..
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var whiteHitBox = WhiteHitBox()
    
    
    var holdTime = 0 { didSet {
        if holdTime > 3 * 60 {
            holdTime = 3 * 60
        }
    }}
    var isTouching = false
    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        self.physicsWorld.gravity.dy = -5
        
        
        self.addChild(whiteHitBox.leftWhiteBox)
        self.addChild(whiteHitBox.middleRect)
        self.addChild(whiteHitBox.rightWhiteBox)
        self.addChild(Nodes.ball)
        
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        Nodes.ball.fillColor = .blue
        
        
    }
}
