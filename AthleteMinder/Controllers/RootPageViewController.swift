//
//  RootPageViewController.swift
//  AthleteMinder
//
//  Created by Azhar Anwar on 4/7/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

import UIKit
import AthleteMinderUI

class RootPageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    let questionsData: [Question] = Question.allQuestions()
    
    lazy var viewControllerList: [UIViewController] = {
        let vc1 = ViewController()
        let vc2 = ViewController()
        let vc3 = ViewController()
        let vc4 = ViewController()
        let vc5 = ViewController()
        
        return [vc1, vc2, vc3, vc4, vc5]
    }()
    
    let questionPageView: QuestionPageView = {
        let qpv = QuestionPageView(frame: .zero)
        qpv.isUserInteractionEnabled = false
        return qpv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = viewControllerList.first {
            let viewController = firstViewController as! ViewController
            viewController.delegate = self
            self.setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
            questionPageView.question = questionsData.first
        }
    }
    
    fileprivate func setupLayout() {
        view.addSubview(questionPageView)
        questionPageView.fillSuperview()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension RootPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard viewControllerList.count > previousIndex else { return nil }
        
        return viewControllerList[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex != viewControllerList.count else { return nil }
        
        guard viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex]
    }
}

extension RootPageViewController: ViewControllerDelegate {
    func viewController(didSwipe toLocation: CGFloat) {
        // code to scale choice labels based on toLocation goes here
        print(toLocation)
    }
}
