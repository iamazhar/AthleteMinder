//
//  SwipeableAnswerView.swift
//  AthleteMinder
//
//  Created by Azhar Anwar on 4/7/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

import UIKit
import AthleteMinderUI

class SwipeableAnswerView: UIView {
    private var minimalHeight: CGFloat = UIScreen.main.bounds.height - 64
    private let maxWaveHeight: CGFloat = 200.0
    
    private let shapeLayer = CAShapeLayer()
    public let gradientLayer = CAGradientLayer()
    
    private var displayLink: CADisplayLink!
    
    private var animating = false {
        didSet {
            isUserInteractionEnabled = !animating
            displayLink.isPaused = !animating
        }
    }
    
    private let l3ControlPointView = UIView()
    private let l2ControlPointView = UIView()
    private let l1ControlPointView = UIView()
    private let cControlPointView = UIView()
    private let r1ControlPointView = UIView()
    private let r2ControlPointView = UIView()
    private let r3ControlPointView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupGradientLayer()
        
        setupShapeLayer()
        
        displayLink = CADisplayLink(target: self, selector: #selector(updateShapeLayer))
        displayLink.add(to: .main, forMode: .default)
        displayLink.isPaused = true
    }
    
    fileprivate func setupGradientLayer() {
        let topColor = #colorLiteral(red: 0.2431372549, green: 0.8156862745, blue: 0.3921568627, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.3607843137, green: 0.7921568627, blue: 0.5647058824, alpha: 1)
        
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0, 1]
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = bounds
    }
    
    fileprivate func setupShapeLayer() {

        shapeLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: minimalHeight)
        shapeLayer.fillColor = AMColor.background.color.cgColor
        
        // Remove implicit layer animations
        shapeLayer.actions = ["position": NSNull(), "bounds": NSNull(), "path": NSNull()]
        
        layer.addSublayer(shapeLayer)
        
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
        // Setup control points for bezier curve
        l3ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        l2ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        l1ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        cControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        r1ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        r2ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        r3ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        
        //        l3ControlPointView.backgroundColor = .red
        //        l2ControlPointView.backgroundColor = .red
        //        l1ControlPointView.backgroundColor = .red
        //        cControlPointView.backgroundColor = .red
        //        r1ControlPointView.backgroundColor = .red
        //        r2ControlPointView.backgroundColor = .red
        //        r3ControlPointView.backgroundColor = .red
        
        addSubview(l3ControlPointView)
        addSubview(l2ControlPointView)
        addSubview(l1ControlPointView)
        addSubview(cControlPointView)
        addSubview(r1ControlPointView)
        addSubview(r2ControlPointView)
        addSubview(r3ControlPointView)
        
        layoutControlPoints(minimalHeight, waveHeight: 0, locationX: bounds.width / 2)
        updateShapeLayer()
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        
        let location = gesture.location(in: self)
        let translation = gesture.translation(in: self)
        
        switch gesture.state {
        case .began, .changed:
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
                self.shapeLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: location.y)
            }) { (_) in
                let additionalHeight = translation.y
                let waveHeight = additionalHeight * 0.20
                let baseHeight = location.y - waveHeight
                let locationX = location.x
                
                self.layoutControlPoints(baseHeight, waveHeight: waveHeight, locationX: locationX)
                self.updateShapeLayer()
            }
        default:
            let centerY = location.y
            animating = true
            UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: [], animations: {
                self.l3ControlPointView.center.y = centerY
                self.l2ControlPointView.center.y = centerY
                self.l1ControlPointView.center.y = centerY
                self.cControlPointView.center.y = centerY
                self.r1ControlPointView.center.y = centerY
                self.r2ControlPointView.center.y = centerY
                self.r3ControlPointView.center.y = centerY
            }) { (_) in
                self.shapeLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: centerY)
                self.animating = false
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SwipeableAnswerView {
    private func currentPath() -> CGPath {
        let width = bounds.width
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: .zero)
        
        bezierPath.addLine(to: CGPoint(x: 0, y: l3ControlPointView.dg_center(usePresentationLayerIfPossible: animating).y))
        
        bezierPath.addCurve(to: l1ControlPointView.dg_center(usePresentationLayerIfPossible: animating), controlPoint1: l3ControlPointView.dg_center(usePresentationLayerIfPossible: animating), controlPoint2: l2ControlPointView.dg_center(usePresentationLayerIfPossible: animating))
        
        bezierPath.addCurve(to: r1ControlPointView.dg_center(usePresentationLayerIfPossible: animating), controlPoint1: cControlPointView.dg_center(usePresentationLayerIfPossible: animating), controlPoint2: r1ControlPointView.dg_center(usePresentationLayerIfPossible: animating))
        
        bezierPath.addCurve(to: r3ControlPointView.dg_center(usePresentationLayerIfPossible: animating), controlPoint1: r1ControlPointView.dg_center(usePresentationLayerIfPossible: animating), controlPoint2: r2ControlPointView.dg_center(usePresentationLayerIfPossible: animating))
        
        bezierPath.addLine(to: CGPoint(x: width, y: 0))
        
        bezierPath.close()
        
        return bezierPath.cgPath
    }
    
    @objc func updateShapeLayer() {
        shapeLayer.path = currentPath()
    }
    
    private func layoutControlPoints(_ baseHeight: CGFloat, waveHeight: CGFloat, locationX: CGFloat) {
        let width = bounds.width
        let minLeftX = min((locationX - width / 2.0) * 0.28, 0)
        let maxRightX = max(width + (locationX - width / 2.0) * 0.28, width)
        
        let leftPartWidth = locationX - minLeftX
        let rightPartWidth = maxRightX - locationX
        
        l3ControlPointView.center = CGPoint(x: minLeftX, y: baseHeight)
        l2ControlPointView.center = CGPoint(x: minLeftX + leftPartWidth * 0.44, y: baseHeight)
        l1ControlPointView.center = CGPoint(x: minLeftX + leftPartWidth * 0.71, y: baseHeight + waveHeight * 0.64)
        cControlPointView.center = CGPoint(x: locationX, y: baseHeight + waveHeight * 1.36)
        r1ControlPointView.center = CGPoint(x: maxRightX - rightPartWidth * 0.71, y: baseHeight + waveHeight * 0.64)
        r2ControlPointView.center = CGPoint(x: maxRightX - (rightPartWidth * 0.44), y: baseHeight)
        r3ControlPointView.center  = CGPoint(x: maxRightX, y: baseHeight)
    }
}
