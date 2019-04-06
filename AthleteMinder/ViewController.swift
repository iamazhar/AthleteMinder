//
//  ViewController.swift
//  AthleteMinder
//
//  Created by Azhar Anwar on 4/4/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

import UIKit
import AthleteMinderUI

extension UIView {
    func dg_center(usePresentationLayerIfPossible: Bool) -> CGPoint {
        if usePresentationLayerIfPossible, let presentationLayer = layer.presentation() {
            return presentationLayer.position
        }
        return center
    }
}

class ViewController: UIViewController {
    
    private let minimalHeight: CGFloat = UIScreen.main.bounds.height - 64
    private let maxWaveHeight: CGFloat = 200.0
    
    private let shapeLayer = CAShapeLayer()
    
    private var displayLink: CADisplayLink!
    
    private var animating = false {
        didSet {
            view.isUserInteractionEnabled = !animating
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        shapeLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: minimalHeight)
        shapeLayer.fillColor = AMColor.background.color.cgColor
        
        shapeLayer.actions = ["position": NSNull(), "bounds": NSNull(), "path": NSNull()]
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
        l3ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        l2ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        l1ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        cControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        r1ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        r2ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        r3ControlPointView.frame = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 3.0)
        
        l3ControlPointView.backgroundColor = .red
        l2ControlPointView.backgroundColor = .red
        l1ControlPointView.backgroundColor = .red
        cControlPointView.backgroundColor = .red
        r1ControlPointView.backgroundColor = .red
        r2ControlPointView.backgroundColor = .red
        r3ControlPointView.backgroundColor = .red
        
        view.addSubview(l3ControlPointView)
        view.addSubview(l2ControlPointView)
        view.addSubview(l1ControlPointView)
        view.addSubview(cControlPointView)
        view.addSubview(r1ControlPointView)
        view.addSubview(r2ControlPointView)
        view.addSubview(r3ControlPointView)
        
        layoutControlPoints(minimalHeight, waveHeight: 0, locationX: view.bounds.width / 2)
        updateShapeLayer()
        
        displayLink = CADisplayLink(target: self, selector: #selector(updateShapeLayer))
        displayLink.add(to: .main, forMode: .default)
        displayLink.isPaused = true
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        
        let location = gesture.location(in: view)
        let translation = gesture.translation(in: view)
        
        switch gesture.state {
        case .began, .changed:
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
                self.shapeLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: location.y)
            }) { (_) in
                let additionalHeight = translation.y
                let waveHeight = additionalHeight * 0.20
                let baseHeight = location.y - waveHeight
                let locationX = location.x
                
                self.layoutControlPoints(baseHeight, waveHeight: waveHeight, locationX: locationX)
                self.updateShapeLayer()
            }
            
//            let additionalHeight = max(gesture.translation(in: view).y, 0)
//            let waveHeight = min(additionalHeight * 0.6, maxWaveHeight)
//            let baseHeight = minimalHeight + additionalHeight - waveHeight
//            let locationX = gesture.location(in: gesture.view).x
//
//            layoutControlPoints(baseHeight, waveHeight: waveHeight, locationX: locationX)
//
//            updateShapeLayer()
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
                self.shapeLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: centerY)
                self.animating = false
            }
        }
    }
    
    private func currentPath() -> CGPath {
        let width = view.bounds.width
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
        let width = view.bounds.width
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


