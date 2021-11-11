//
//  Test.swift
//  InterestingTests
//
//  Created by AZHD on 4.09.21.
//

import UIKit

class SmesharikTest: Test{
    var dataBase: [(String, Int, UIImage)] = [("Ezhik", 0, UIImage(named: "Ezhik")!) , ("Krosh", 0, UIImage(named: "Krosh")!), ("Nusha", 0, UIImage(named: "Nusha")!), ("Barash",0, UIImage(named: "Barash")!), ("Losiash",0, UIImage(named: "Losiash")!), ("Sovunia",0, UIImage(named: "Sovunia")!), ("Kar-Karich",0, UIImage(named: "Karich")!), ("Pin",0, UIImage(named: "Pin")!), ("Kopatich",0, UIImage(named: "Kopatich")!)]
    
    let questions = ["What color do you like the most?", "What would you do if it was raining outside?", "Which of the following activities do you like the most?", "What kind of sports do you prefer?", "What age are you?"]
    
    let questionImages = [UIImage(named: "smeshariki")!,  UIImage(named: "dozhd")!, UIImage(named: "table")!, UIImage(named: "football")!, UIImage(named: "babyKrosh")!]
    
    let answerOptions = [["red", "light-blue", "pink", "magenta", "orange", "purple", "blue", "white", "brown"], ["Take care of cactuses", "playing computer", "reading magazines", "writing poems", "studying physics", "knitting", "reading a newspaper", "making a robot", "sleeping"], ["collectioning candy packages", "running outside", "eating candies", "looking at the mountains", "investigating anything", "cooking", "playing the piano", "constructing new mechanisms", "growing plants"], ["ping-pong", "volleyball", "badminton", "catching butterflies", "chess", "skiing", "checkers", "hockey", "football"], ["13", "12-", "14", "15", "16-30", "50-60", "60+", "30-40", "40-50"]]
    
    var currentQuestionIndex = 0
    
    func countResult() -> (String, UIImage){
        var maxScore = 0
        var currentSmesharik = [(String, UIImage)]()
        for (name, score, image) in dataBase{
            if score == maxScore{
                currentSmesharik.append((name, image))
            }
            if score>maxScore {
                currentSmesharik.removeAll()
                currentSmesharik.append((name, image))
                maxScore = score
            }
        }
        return currentSmesharik.randomElement()!
    }
    func clear(){
        currentQuestionIndex = 0
        for i in 0..<dataBase.count{
            dataBase[i].1 = 0
        }
    }
    
    func processNewInformation(index: Int) {
        dataBase[index].1 += 1
        currentQuestionIndex += 1
    }
    
    func isOver() -> Bool {
        if currentQuestionIndex == questions.count{
            return true
        }
        return false
    }
    func getCurrentQuestion() -> String {
        return questions[currentQuestionIndex]
    }
    
    func getCurrentImage() -> UIImage {
        return questionImages[currentQuestionIndex]
    }
    
    func getCurrentAnswerOptions() -> [String] {
        return answerOptions[currentQuestionIndex]
    }
}


