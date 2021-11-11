//
//  TestProtocol.swift
//  InterestingTests
//
//  Created by AZHD on 5.09.21.
//

import UIKit
protocol Test{
    func processNewInformation(index: Int)
    func isOver()->Bool
    func getCurrentQuestion() -> String
    func getCurrentImage() -> UIImage
    func getCurrentAnswerOptions() -> [String]
    func countResult() -> (String, UIImage)
    func clear()
}
