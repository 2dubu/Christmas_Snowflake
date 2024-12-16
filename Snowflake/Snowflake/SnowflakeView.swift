//
//  SnowflakeView.swift
//  Snowflake
//
//  Created by 이건우 on 12/17/24.
//

import SwiftUI
import SpriteKit

struct SnowflakeView: View {
    private func createChristmasScene() -> SKScene {
        let screenSize = UIScreen.main.bounds.size
        let scene = ChristmasScene(size: screenSize)
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: createChristmasScene())
            .ignoresSafeArea(.all)
    }
}

final class ChristmasScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        setupCat()
        setupText()
        startSnowfall()
    }
    
    private func setupCat() {
        let cat = SKSpriteNode(imageNamed: "cat")
        cat.position = CGPoint(x: size.width / 2, y: 0)
        addChild(cat)
    }
    
    private func setupText() {
        let text = SKLabelNode(text: "Happy Christmas!")
        text.fontSize = 40
        text.fontColor = .white
        text.position = CGPoint(x: size.width / 2 , y: size.height / 2)
        
        text.position.x -= 20
        text.position.y += 60
        
        addChild(text)
    }
    
    private func startSnowfall() {
        let snowEmitter = createSnowEmitter()
        snowEmitter.position = CGPoint(x: size.width / 2, y: size.height + 10)
        snowEmitter.particlePositionRange = CGVector(dx: size.width, dy: 0)
        addChild(snowEmitter)
    }
    
    private func createSnowEmitter() -> SKEmitterNode {
        let emitter = SKEmitterNode()
        emitter.particleTexture = SKTexture(imageNamed: "snowflake")
        emitter.particleBirthRate = 20
        emitter.particleLifetime = 20
        emitter.particleSpeed = 50
        emitter.particleSpeedRange = 20
        emitter.particleSize = CGSize(width: 10, height: 10)
        emitter.particleAlpha = 0.8
        emitter.particleAlphaRange = 0.2
        emitter.particleColor = .white
        emitter.particleColorBlendFactor = 1.0
        emitter.yAcceleration = -20 // Snow falls downward
        return emitter
    }
}
