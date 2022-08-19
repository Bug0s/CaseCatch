//
//  Nodes.swift
//  CaseCatch
//
//  Created by Bartos Bence on 2022. 08. 09..
//

import Foundation
import SpriteKit



class Nodes {
    
    fileprivate static let ballRadius: CGFloat = 10
    //MARK: --Ki kell találni, hogy hogyan lehet úgy static, hogy lehessen változtatni az értékét!!!
    static var ball: SKShapeNode {
        
        var shape: SKShapeNode
        shape = SKShapeNode(circleOfRadius: Nodes.ballRadius)
        shape.fillColor = .red
        shape.physicsBody = SKPhysicsBody(circleOfRadius: self.ballRadius)
        shape.position = CGPoint(x: 0, y: -40)
        shape.physicsBody?.affectedByGravity = false
        shape.zPosition = 1
        
        //self.ball.physicsBody?.collisionBitMask = 0
        shape.physicsBody?.categoryBitMask = CollisionCategories.ballCategory
        shape.physicsBody?.contactTestBitMask = CollisionCategories.hitBoxCategory
        
        return shape
    }
    let move = SKAction.move(to: CGPoint(x: 0, y: -UIScreen.height), duration: 4)


    
    
    
    
    
}


class WhiteHitBox: Nodes {
    
    var leftWhiteBox: SKShapeNode
    
    fileprivate let middleRectWidth: CGFloat = 100
    fileprivate let middleRectHeight: CGFloat = 140
    
    var middleRect: SKShapeNode
    
    var rightWhiteBox: SKShapeNode
    
    var hitBox: [SKShapeNode]
    
    override init() {
        
        //MARK: LeftWhiteBox init
        do {
            self.leftWhiteBox = SKShapeNode(rect: CGRect(x: 0 - UIScreen.width - self.middleRectWidth / 2, y: 0, width: UIScreen.width, height: 10))
            self.leftWhiteBox.fillColor = .white
            self.leftWhiteBox.position = .zero
            self.leftWhiteBox.lineWidth -= self.middleRectWidth
        }
            
        //MARK: MiddleRect
        do {
            let middleRectBox: CGRect = CGRect(origin: .zero,
            size: CGSize(width: self.middleRectWidth, height: self.middleRectHeight))
            
            //MiddleRect init
            self.middleRect = SKShapeNode(rect: middleRectBox)
            self.middleRect.position.x -= self.middleRect.frame.width / 2
            self.middleRect.position.y -= self.middleRect.frame.height / 2
            self.middleRect.lineWidth = 7
            self.middleRect.path = UIBezierPath(roundedRect: middleRectBox, cornerRadius: 20).cgPath
            self.middleRect.zPosition = 100
        }
        
        //MARK: RightWhiteBox Init
        do {
            self.rightWhiteBox = SKShapeNode(rect: CGRect(x: 0 + self.middleRectWidth / 2, y: 0, width: UIScreen.width, height: 10))
            self.rightWhiteBox.fillColor = .white
        }
        
        // Mind a 3 elem lejjebb állítása
        self.hitBox = [self.leftWhiteBox, self.middleRect, self.rightWhiteBox]
        hitBox.forEach { node in
            node.position.y -= UIScreen.height / 3
        }
        super.init()
        
    }
    
}




extension UIScreen {
    static let width: CGFloat = UIScreen.main.bounds.width
    static let height: CGFloat = UIScreen.main.bounds.height
}
