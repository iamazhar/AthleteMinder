//
//  Questions.swift
//  AthleteMinder
//
//  Created by Azhar Anwar on 4/7/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

import Foundation

public class Question: Codable {
    public let question: String
    public let choiceOne: String
    public let choiceTwo: String
    
    public init(question: String, choiceOne: String, choiceTwo: String) {
        self.question = question
        self.choiceOne = choiceOne
        self.choiceTwo = choiceTwo
    }
}
