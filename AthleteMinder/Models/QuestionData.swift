//
//  QuestionData.swift
//  AthleteMinder
//
//  Created by Azhar Anwar on 4/7/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

extension Question {
    public static func allQuestions() -> [Question] {
        let questions = [
            Question(question: "Did you think about what you wanted to do and how to do it?", choiceOne: "Bringing it", choiceTwo: "Winging it"),
            Question(question: "Did you concentrate or was your mind somewhere else?", choiceOne: "Dialed in", choiceTwo: "Distracted"),
            Question(question: "Did you practice the way you want to play?", choiceOne: "Totally into it", choiceTwo: "Just got through it"),
            Question(question: "Did the way you eat make you feel...?", choiceOne: "Fueled", choiceTwo: "Drained"),
            Question(question: "Did you wake up feeling...?", choiceOne: "Totally rested", choiceTwo: "Tired")
        ]
        
        return questions
    }
}
