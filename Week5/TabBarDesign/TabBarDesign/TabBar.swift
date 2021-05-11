//
//  TabBar.swift
//  TabBarDesign
//
//  Created by Oguzhan Bekir on 10.05.2021.
//

import UIKit

class TabBar: UITabBar {
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    
    func createPath() -> CGPath {
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) 
        path.addLine(to: CGPoint(x: (centerWidth - 90), y: 0)) 

        path.addCurve(to: CGPoint(x: centerWidth, y: -45),
        controlPoint1: CGPoint(x: (centerWidth - 50), y: 0), controlPoint2: CGPoint(x: (centerWidth - 50), y: -45))

        path.addCurve(to: CGPoint(x: (centerWidth + 45 * 2), y: 0),
        controlPoint1: CGPoint(x: centerWidth + 50, y: -45), controlPoint2: CGPoint(x: (centerWidth + 50), y: 0))

        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }
    
}
