//
//  SnakeBorderView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/17/24.
//

import SwiftUI

import UIKit

class SnakeBorderView: UIView {
    private var currentPosition: CGFloat = 0.0
    private let speed: CGFloat = 1.0
    private var timer: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func startAnimating() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc private func update() {
        currentPosition += speed
        let perimeter = (bounds.width + bounds.height) * 2
        if currentPosition > perimeter {
            currentPosition = 0
        }
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let snakeLength: CGFloat = 100.0
        let snakeColor: UIColor = .green
        
        context.setStrokeColor(snakeColor.cgColor)
        context.setLineWidth(5)
        
        let totalPerimeter = (rect.width + rect.height) * 2
        var currentLength: CGFloat = 0
        var position = currentPosition
        
        while currentLength < snakeLength {
            var x: CGFloat = 0
            var y: CGFloat = 0
            
            if position < rect.width {
                x = position
                y = 0
            } else if position < (rect.width + rect.height) {
                x = rect.width
                y = position - rect.width
            } else if position < (rect.width * 2 + rect.height) {
                x = rect.width - (position - rect.width - rect.height)
                y = rect.height
            } else {
                x = 0
                y = rect.height - (position - rect.width * 2 - rect.height)
            }
            
            let point = CGPoint(x: x, y: y)
            if currentLength == 0 {
                context.move(to: point)
            } else {
                context.addLine(to: point)
            }
            
            position += 1
            if position > totalPerimeter {
                position = 0
            }
            currentLength += 1
        }
        
        context.strokePath()
    }
}
