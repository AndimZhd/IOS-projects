//
//  ButtonsAndLabel.swift
//  2048
//
//  Created by AZHD on 29.08.21.
//

import Foundation
import UIKit

class ScoreLabel: UILabel{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor(rgb: 0xb080f9)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.textColor = UIColor.white
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
    }
    func updateScore(with score:Int){
        self.text = "      Score: " + String(score)
    }
}

class NewGameButton: UIButton{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor(rgb: 0xb080f9)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 30
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
    }
}




