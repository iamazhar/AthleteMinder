//
//  SimpleBounce.swift
//  AthleteMinder
//
//  Created by Azhar Anwar on 4/6/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

import UIKit

class SimpleBounce: UIViewController {
    private let minimalHeight: CGFloat = 100.0
    private var newHeight: CGFloat?
    private let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        shapeLayer.frame = CGRect(x: 0.0, y: view.bounds.height - minimalHeight, width: view.bounds.width, height: minimalHeight)
        shapeLayer.actions = ["position": NSNull(), "bounds": NSNull(), "path": NSNull()]
        shapeLayer.backgroundColor = UIColor.red.cgColor
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGestureDidMove)))
    }
    
    @objc func panGestureDidMove(gesture: UIPanGestureRecognizer) {
        
        let location = gesture.location(in: view)
        
        if gesture.state == .failed || gesture.state == .cancelled {
            
        } else if gesture.state == .ended {
            shapeLayer.frame = CGRect(x: 0, y: location.y, width: view.bounds.width, height: max(view.bounds.height - location.y, minimalHeight))
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                self.shapeLayer.frame = CGRect(x: 0, y: location.y, width: self.view.bounds.width, height: max(self.view.bounds.height - location.y, self.minimalHeight))
            }) { (_) in
                //
            }
        }
    }
    
}
