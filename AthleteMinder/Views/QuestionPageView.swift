//
//  QuestionPageView.swift
//  AthleteMinder
//
//  Created by Azhar Anwar on 4/7/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

import UIKit
import AthleteMinderUI

class QuestionPageView: UIView {
    lazy var navBarView: UIView = {
        let v = UIView()
        v.backgroundColor = AMColor.navigationBarBackground.color
        return v
    }()
    
    let trainingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "plan of action".uppercased()
        label.textColor = AMColor.primaryText.color
        label.font = AMFont.mediumCondensed.of(size: AMFontSize.larger)
        return label
    }()
    
    let previousQuestionButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ICON-Back-Training-Tap"), for: .normal)
        return button
    }()
    
    let nextQuestionButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ICON-Next-Training-Tap"), for: .normal)
        return button
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Did you think about what you wanted to do and how to do it?".capitalized
        label.textColor = AMColor.primaryText.color
        label.alpha = 0.6
        label.font = AMFont.lightCondensed.of(size: AMFontSize.larger)
        return label
    }()
    
    let choiceOneLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "bringing it".uppercased()
        label.textColor = AMColor.primaryText.color
        label.font = AMFont.mediumCondensed.of(size: AMFontSize.largest)
        return label
    }()
    
    let choiceTwoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "winging it".uppercased()
        label.textColor = AMColor.primaryText.color
        label.font = AMFont.mediumCondensed.of(size: AMFontSize.largest)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        
        addSubview(navBarView)
        addSubview(questionLabel)
        addSubview(choiceOneLabel)
        addSubview(choiceTwoLabel)
        
        navBarView.addSubview(trainingTitleLabel)
        navBarView.addSubview(previousQuestionButton)
        navBarView.addSubview(nextQuestionButton)
        
        navBarView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: 100))
        
        trainingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        trainingTitleLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        trainingTitleLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        
        previousQuestionButton.anchor(top: nil, leading: navBarView.leadingAnchor, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 64, height: 64))
        previousQuestionButton.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        
        nextQuestionButton.anchor(top: nil, leading: nil, bottom: nil, trailing: navBarView.trailingAnchor, padding: .zero, size: .init(width: 64, height: 64))
        nextQuestionButton.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        
        questionLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 44, bottom: 0, right: 44), size:  .zero)
        questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        questionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        choiceOneLabel.anchor(top: navBarView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 24, left: 0, bottom: 0, right: 0), size: .zero)
        choiceOneLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        choiceTwoLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 24, right: 0), size: .zero)
        choiceTwoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
